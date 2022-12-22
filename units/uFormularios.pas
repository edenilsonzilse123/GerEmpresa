unit uFormularios;

interface

uses
  Vcl.Forms, System.Classes, System.SysUtils, IdHashSHA, ZAbstractConnection,
  ZConnection, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Winapi.Windows, Vcl.StdCtrls;

  procedure CriarForm(InstanceClass: TComponentClass; var Reference;
                      pTitulo:String=''; pModal:Boolean=True;
                      pPosition:TPosition=poDesktopCenter;
                      pBorderIcons:TBorderIcons=[TBorderIcon.biSystemMenu]);
  procedure SetarParametros(pParametros:Integer);
  procedure CarregarCombos(pCombo:TCombobox;pTabela,pCampoDesc:String;
                           pLinhas:Integer=30);
  function  GetCriptogrado(pTexto:String):String;
  function  Logado(pLogin,pSenha:String):Boolean;
  function  GetParametros:Integer;
  function  GetMostrarSenha(pMarcado:Boolean; pValorM, pValorD:Char):Char;

var
  vParametros:Integer;

implementation

uses
  uDados;

procedure CriarForm(InstanceClass: TComponentClass; var Reference;
                    pTitulo:String=''; pModal:Boolean=True;
                    pPosition:TPosition=poDesktopCenter;
                    pBorderIcons:TBorderIcons=[TBorderIcon.biSystemMenu]);
begin
  Application.CreateForm(InstanceClass,Reference);
  TForm(Reference).Caption      :=  pTitulo;
  TForm(Reference).Position     :=  pPosition;
  TForm(Reference).BorderIcons  :=  pBorderIcons;
  if pModal then
    TForm(Reference).ShowModal
  else
    TForm(Reference).Show;
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
    pSenha  :=  GetCriptogrado(pSenha);
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
      ParamByName('PSENHA').AsString    :=  pSenha;
      Open; First; FetchAll;
      Result  :=  (RecordCount >= 1);
      SetarParametros(FieldByName('PARAMETROS').AsInteger);
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

end.
