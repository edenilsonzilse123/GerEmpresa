unit uFormularios;

interface

uses
  Vcl.Forms, System.Classes, System.SysUtils, IdHashSHA, ZAbstractConnection,
  ZConnection, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Winapi.Windows, Vcl.StdCtrls, Vcl.Graphics, Vcl.DBGrids, Vcl.Grids,
  Vcl.ExtCtrls, System.Math;

  procedure CriarForm(InstanceClass: TComponentClass; var Reference;
                      pTitulo:String='';
                      pMostrarForm:Boolean=True;
                      pBorderStyle:TFormBorderStyle=TFormBorderStyle.bsSizeable;
                      pModal:Boolean=True;
                      pPosition:TPosition=poDesktopCenter;
                      pBorderIcons:TBorderIcons=[TBorderIcon.biSystemMenu]);
  procedure SetarParametros(pParametros:Integer);
  procedure CarregarCombos(pCombo:TCombobox;pTabela,pCampoDesc:String;pCondicao:String='';
                           pLinhas:Integer=30);
  procedure MensagensSistema(pTipoMensagem:Integer;pMensagem:String);
  procedure SetarIdUsuario(pIdUsuario:Integer);
  procedure PintarLinhas(pCor:TColor;Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  procedure SetValorCombo(pCombo:TComboBox;pValor:Integer);
  procedure SetarCodigoOs(pCodigo:Integer);
  procedure SetCarregarOrdem(pCarregar:Boolean);
  procedure ContarCaracteresMemo(pMemo:TMemo;pLabel:TLabel);
  procedure SetarNomeUsuario(pNome:String);
  procedure CentralizarPanel(AForm: TForm; APanel: TPanel);

  function  GetCriptogrado(pTexto:String):String;
  function  Logado(pLogin,pSenha:String):Boolean;
  function  GetParametros:Integer;
  function  GetMostrarSenha(pMarcado:Boolean; pValorM, pValorD:Char):Char;
  function  IfThenCores(pValor:Boolean;pCorTrue,pCorFalse:TColor):TColor;
  function  StringSql(pValor:String):String;
  function  GetValorCombo(pCombo:TComboBox):String;
  function  GetValorComboInt(pCombo:TComboBox):Integer;
  function  GetTextoCombo(pCombo:TComboBox):String;
  function  GetIdUsuario:Integer;
  function  GetIdUsuarioStr:String;
  function  GetCodigoOs:Integer;
  function  GetCarregarOrdem:Boolean;
  function  GetNomeUsuario:String;
  function  MensagemPergunta(pTipoMensagem:Integer;pMensagem:String):Boolean;
  function  GetCheckBoxNumero(pCheck:TCheckBox):Integer;

var
  vParametros, vIdUsuario, vCodigoOS:Integer;
  vCarregarOrdemServ:Boolean=False;
  vNomeUsuario:String;

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
  TForm(Reference).Caption      :=  Application.Title + ' | '  + pTitulo;
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
      SQL.Add(' AND PODE_USAR = 1');
      ParamByName('PUSUARIO').AsString  :=  pLogin;
      ParamByName('PSENHA').AsString    :=  GetCriptogrado(pSenha);
      Open; First; FetchAll;
      Result  :=  (RecordCount >= 1);
      SetarParametros(FieldByName('PARAMETROS').AsInteger);
      SetarIdUsuario(FieldByName('ID').AsInteger);
      SetarNomeUsuario(FieldByName('USUARIO').AsString);
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

procedure CarregarCombos(pCombo:TCombobox;pTabela,pCampoDesc:String;pCondicao:String='';
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
      SQL.Add(' WHERE 1=1 ' + pCondicao);
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
  begin
    if Copy(pValor,Length(pValor)-1,Length(pValor)) = #$D#$A then
      pValor  :=  Copy(pValor,1,Length(pValor)-2);
    Result  :=  Chr(39) + StringReplace(pValor,Chr(39),Chr(39)+Chr(39),[rfIgnoreCase,rfReplaceAll])  + Chr(39);
  end;
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

procedure MensagensSistema(pTipoMensagem:Integer;pMensagem:String);
var
  vFlagsMsg:LongInt;
begin
  case pTipoMensagem of
    1:vFlagsMsg :=  MB_OK + MB_ICONSTOP;
    2:vFlagsMsg :=  MB_OK + MB_ICONINFORMATION;
  end;
  Application.MessageBox(PWideChar(pMensagem),
                         PWideChar(Application.Title),
                         vFlagsMsg);
end;

procedure SetarIdUsuario(pIdUsuario:Integer);
begin
  vIdUsuario  :=  pIdUsuario;
end;

function  GetIdUsuario:Integer;
begin
  Result  :=  IfThen(vIdUsuario = 0,2,vIdUsuario);
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

procedure ContarCaracteresMemo(pMemo:TMemo;pLabel:TLabel);
var
  vComprimento:Integer;
begin
  vComprimento      :=  Length(pMemo.Text);
  pLabel.Caption    :=  'Caracteres: '  + IntToStr(vComprimento);
  pLabel.Font.Color :=  IfThenCores(vComprimento >= (pMemo.MaxLength - (pMemo.MaxLength/10)),
                                    clRed,
                                    clWindowText);
end;

function  GetTextoCombo(pCombo:TComboBox):String;
begin
  Result  :=  Copy(pCombo.Text,Pos('-',pCombo.Text)+2,Length(pCombo.Text));
end;

function  GetNomeUsuario:String;
begin
  Result  :=  vNomeUsuario;
end;

procedure SetarNomeUsuario(pNome:String);
begin
  vNomeUsuario  :=  pNome;
end;

function  MensagemPergunta(pTipoMensagem:Integer;pMensagem:String):Boolean;
var
  vFlagsMsg:LongInt;
begin
  case pTipoMensagem of
    1:vFlagsMsg :=  MB_YESNO + MB_ICONSTOP;
    2:vFlagsMsg :=  MB_YESNO + MB_ICONINFORMATION;
    3:vFlagsMsg :=  MB_YESNO + MB_ICONQUESTION;
  end;
  Result  :=  Application.MessageBox(PWideChar(pMensagem),
                                     PWideChar(Application.Title),
                                     vFlagsMsg) = IDYES;
end;

procedure CentralizarPanel(AForm: TForm; APanel: TPanel);
begin
  APanel.Left := (AForm.ClientWidth div 2) - (APanel.Width div 2);
  APanel.Top := (AForm.ClientHeight div 2) - (APanel.Height div 2);
  APanel.Update;
  AForm.Update;
end;

function  GetCheckBoxNumero(pCheck:TCheckBox):Integer;
begin
  Result  :=  IfThen(pCheck.Checked,1,0);
end;

end.
