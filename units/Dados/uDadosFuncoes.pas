unit uDadosFuncoes;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, ZDataset;

  procedure InsereDados(pTabela,pCampos,pValores:String;pMostrarMensagem:Boolean=True);
  procedure AtualizaDados(pTabela,pValores,pCondicao:String;pMostrarMensagem:Boolean=True);
  procedure ExcluirDados(pTabela,pCondicao:String;pMostrarMensagem:Boolean=True);

implementation

uses
  uDados, uFormularios;

procedure InsereDados(pTabela,pCampos,pValores:String;pMostrarMensagem:Boolean=True);
var
  zqInsere:TZQuery;
begin
  try
    zqInsere  :=  TZQuery.Create(nil);
    with zqInsere do
    begin
      Connection  :=  DM.conDados;
      if Active then
        Close;
      SQL.Clear;
      SQL.Add(' INSERT INTO ');
      SQL.Add(pTabela);
      SQL.Add(' ( ');
      SQL.Add(pCampos);
      SQL.Add(' ) VALUES ( ');
      SQL.Add(pValores);
      SQL.Add(' ) ');
      ExecSQL;
    end;
    if pMostrarMensagem then
      MensagensSistema(2,'Registro inserido com sucesso!');
  except
    if pMostrarMensagem then
      MensagensSistema(2,'N�o foi poss�vel inserir o registro. Voc� deve entrar em contato com o administrado do sistema.');
    FreeAndNil(zqInsere);
  end;
  FreeAndNil(zqInsere);
end;

procedure AtualizaDados(pTabela,pValores,pCondicao:String;pMostrarMensagem:Boolean=True);
var
  zqAtualiza:TZQuery;
begin
  try
    zqAtualiza  :=  TZQuery.Create(nil);
    with zqAtualiza do
    begin
      Connection  :=  DM.conDados;
      if Active then
        Close;
      SQL.Clear;
      SQL.Add(' UPDATE ');
      SQL.Add(pTabela);
      SQL.Add(' SET ');
      SQL.Add(pValores);
      SQL.Add(' WHERE 1=1 ');
      SQL.Add(pCondicao);
      ExecSQL;
    end;
    if pMostrarMensagem then
      MensagensSistema(2,'Registro atualizado com sucesso!');
  except
    if pMostrarMensagem then
      MensagensSistema(2,'N�o foi poss�vel atualizar o registro. Voc� deve entrar em contato com o administrado do sistema.');
    FreeAndNil(zqAtualiza);
  end;
  FreeAndNil(zqAtualiza);
end;

procedure ExcluirDados(pTabela,pCondicao:String;pMostrarMensagem:Boolean=True);
var
  zqApaga:TZQuery;
begin
  try
    zqApaga  :=  TZQuery.Create(nil);
    with zqApaga do
    begin
      Connection  :=  DM.conDados;
      if Active then
        Close;
      SQL.Clear;
      SQL.Add(' DELETE FROM ');
      SQL.Add(pTabela);
      SQL.Add(' WHERE 1=1 ');
      SQL.Add(pCondicao);
      ExecSQL;
    end;
    if pMostrarMensagem then
      MensagensSistema(2,'Registro exclu�do com sucesso!');
  except
    if pMostrarMensagem then
      MensagensSistema(2,'N�o foi poss�vel apagar o registro. Voc� deve entrar em contato com o administrado do sistema.');
    FreeAndNil(zqApaga);
  end;
  FreeAndNil(zqApaga);
end;

end.
