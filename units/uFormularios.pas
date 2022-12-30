unit uFormularios;

interface

uses
  Vcl.Forms, System.Classes, System.SysUtils, IdHashSHA, ZAbstractConnection,
  ZConnection, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Winapi.Windows, Vcl.StdCtrls, Vcl.Graphics, Vcl.DBGrids, Vcl.Grids;

  procedure CriarForm(InstanceClass: TComponentClass; var Reference;
                      pTitulo:String='';
                      pMostrarForm:Boolean=True;
                      pBorderStyle:TFormBorderStyle=TFormBorderStyle.bsSizeable;
                      pModal:Boolean=True;
                      pPosition:TPosition=poDesktopCenter;
                      pBorderIcons:TBorderIcons=[TBorderIcon.biSystemMenu]);
  procedure SetarParametros(pParametros:Integer);
  procedure CarregarCombos(pCombo:TCombobox;pTabela,pCampoDesc:String;
                           pLinhas:Integer=30);
  procedure MensagensSistema(pTipoMensagem:Integer;pMensagem:PChar);
  procedure SetarIdUsuario(pIdUsuario:Integer);
  procedure PintarLinhas(pCor:TColor;Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  procedure SetValorCombo(pCombo:TComboBox;pValor:Integer);
  procedure SetarCodigoOs(pCodigo:Integer);
  procedure SetCarregarOrdem(pCarregar:Boolean);

  function  GetCriptogrado(pTexto:String):String;
  function  Logado(pLogin,pSenha:String):Boolean;
  function  GetParametros:Integer;
  function  GetMostrarSenha(pMarcado:Boolean; pValorM, pValorD:Char):Char;
  function  IfThenCores(pValor:Boolean;pCorTrue,pCorFalse:TColor):TColor;
  function  StringSql(pValor:String):String;
  function  GetValorCombo(pCombo:TComboBox):String;
  function  GetValorComboInt(pCombo:TComboBox):Integer;
  function  GetIdUsuario:Integer;
  function  GetIdUsuarioStr:String;
  function  GetCodigoOs:Integer;
  function  GetCarregarOrdem:Boolean;

var
  vParametros, vIdUsuario, vCodigoOS:Integer;
  vCarregarOrdemServ:Boolean=False;

implementation

uses
  uDados;

procedure CriarForm(InstanceClass: TComponentClass; var Reference;
                    pTitulo:String='';
                    pMostrarForm:Boolean=True;
                    pBorderStyle:TFormBorderStyle=TFormBorderStyle.bsSizeable;
                    pModal:Boolean=True;
                    pPosition:TPosition=poDesktopCenter;
                    pBorderIcons:TBorderIcons=[TBorderIcon.biSystemMenu]);
begin
  Application.CreateForm(InstanceClass,Reference);
  TForm(Reference).Caption      :=  pTitulo;
  TForm(Reference).Position     :=  pPosition;
  TForm(Reference).BorderIcons  :=  pBorderIcons;
  if pMostrarForm then
  begin
    if pModal then
      TForm(Reference).ShowModal
    else
      TForm(Reference).Show;
  end;
end;

function  GetCriptogrado(pTexto:String):String;
var
  SHA1:TIdHashSHA1;
begin
  SHA1  :=  TIdHashSHA1.Create;
  try
    Result  :=  SHA1.HashStringAsHex(AnsiUpperCase(pTexto));
  finally
    SHA1.Free;
  end;
end;

function  Logado(pLogin,pSenha:String):Boolean;
var
  zqLogin:TZQuery;
begin
  try
    zqLogin :=  TZQuery.Create(nil);
    with zqLogin do
    begin
      Connection  :=  DM.conDados;
      if Active then
        Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM TB_USUARIOS WHERE USUARIO = ');
      SQL.Add(':PUSUARIO AND SENHA = :PSENHA');
      ParamByName('PUSUARIO').AsString  :=  pLogin;
      ParamByName('PSENHA').AsString    :=  GetCriptogrado(pSenha);
      Open; First; FetchAll;
      Result  :=  (RecordCount >= 1);
      SetarParametros(FieldByName('PARAMETROS').AsInteger);
      SetarIdUsuario(FieldByName('ID').AsInteger);
      if (not Result) then
      begin
        Application.MessageBox('Login ou senha incorretos!',
          PChar(Application.Title), MB_OK + MB_ICONSTOP);
        Abort;
      end;
    end;
  except
    FreeAndNil(zqLogin);
  end;
  FreeAndNil(zqLogin);
end;

procedure SetarParametros(pParametros:Integer);
begin
  vParametros :=  pParametros;
end;

function  GetParametros:Integer;
begin
  Result  :=  vParametros;
end;

function  GetMostrarSenha(pMarcado:Boolean; pValorM, pValorD:Char):Char;
begin
  if pMarcado then
    Result  :=  pValorM
  else
    Result  :=  pValorD;
end;

procedure CarregarCombos(pCombo:TCombobox;pTabela,pCampoDesc:String;
                         pLinhas:Integer=30);
var
  zqCarregar:TZQuery;
begin
  try
    zqCarregar :=  TZQuery.Create(nil);
    with zqCarregar do
    begin
      Connection  :=  DM.conDados;
      if Active then
        Close;
      SQL.Clear;
      SQL.Add('SELECT ID,'  + pCampoDesc + ' FROM ' + pTabela);
      Open; First; FetchAll;
      pCombo.Items.Clear;
      while not Eof do
      begin
        pCombo.Items.Add(FieldByName('ID').AsString + ' - ' +
                         FieldByName(pCampoDesc).AsString);
        Next;
      end;
      pCombo.DropDownCount  :=  pLinhas;
    end;
  except
    FreeAndNil(zqCarregar);
  end;
  FreeAndNil(zqCarregar);
end;

function  IfThenCores(pValor:Boolean;pCorTrue,pCorFalse:TColor):TColor;
begin
  if pValor then
    Result  :=  pCorTrue
  else
    Result  :=  pCorFalse;
end;

function  StringSql(pValor:String):String;
begin
  if pValor = '' then
    Result  :=  'NULL'
  else
    Result  :=  Chr(39) + pValor  + Chr(39);
end;

function  GetValorCombo(pCombo:TComboBox):String;
begin
  Result  :=  Copy(pCombo.Text,1,Pos('-',pCombo.Text)-2);
  if Result = '' then
    Result  :=  'NULL';
end;

function  GetValorComboInt(pCombo:TComboBox):Integer;
begin
  Result  :=  StrToIntDef(GetValorCombo(pCombo),0);
end;

procedure MensagensSistema(pTipoMensagem:Integer;pMensagem:PChar);
var
  vFlagsMsg:LongInt;
begin
  case pTipoMensagem of
    1:vFlagsMsg :=  MB_OK + MB_ICONSTOP;
    2:vFlagsMsg :=  MB_OK + MB_ICONINFORMATION;
  end;
  Application.MessageBox(pMensagem, PChar(Application.Title),vFlagsMsg);
end;

procedure SetarIdUsuario(pIdUsuario:Integer);
begin
  vIdUsuario  :=  pIdUsuario;
end;

function  GetIdUsuario:Integer;
begin
  Result  :=  vIdUsuario;
end;

function  GetIdUsuarioStr:String;
begin
  Result  :=  IntToStr(GetIdUsuario);
end;

procedure PintarLinhas(pCor:TColor;Sender: TObject;
const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (gdSelected in State) or (gdFocused in State) then
    TDBGrid(Sender).Canvas.Brush.Color  :=  clGradientActiveCaption
  else
    TDBGrid(Sender).Canvas.Brush.Color  :=  pCor;
  TDBGrid(Sender).Canvas.FillRect(Rect);
  TDBGrid(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure SetValorCombo(pCombo:TComboBox;pValor:Integer);
var
  x:Integer;
begin
  pCombo.ItemIndex  :=  -1;
  for x := 0 to pCombo.Items.Count - 1 do
  begin
    if (GetValorComboInt(pCombo) = pValor) then
      Exit
    else
      pCombo.ItemIndex  :=  pCombo.ItemIndex  + 1;
  end;
end;

procedure SetarCodigoOs(pCodigo:Integer);
begin
  vCodigoOS :=  pCodigo;
end;

function  GetCodigoOs:Integer;
begin
  Result  :=  vCodigoOS;
end;

procedure SetCarregarOrdem(pCarregar:Boolean);
begin
  vCarregarOrdemServ  :=  pCarregar;
end;

function  GetCarregarOrdem:Boolean;
begin
  Result  :=  vCarregarOrdemServ;
end;

end.
