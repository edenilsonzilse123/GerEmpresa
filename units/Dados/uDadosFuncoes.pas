unit uDadosFuncoes;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, ZDataset;

  procedure InsereDados(pTabela,pCampos,pValores:String);
  procedure AtualizaDados(pTabela,pValores,pCondicao:String);
  procedure ExcluirDados(pTabela,pCondicao:String);

implementation

uses
  uDados, uFormularios;

procedure InsereDados(pTabela,pCampos,pValores:String);
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
  except
    MensagensSistema(1,'Não foi possível inserir o registro. Você deve entrar em contato com o administrado do sistema.');
    FreeAndNil(zqInsere);
  end;
  FreeAndNil(zqInsere);
end;

procedure AtualizaDados(pTabela,pValores,pCondicao:String);
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
  except
    MensagensSistema(1,'Não foi possível atualizar o registro. Você deve entrar em contato com o administrado do sistema.');
    FreeAndNil(zqAtualiza);
  end;
  FreeAndNil(zqAtualiza);
end;

procedure ExcluirDados(pTabela,pCondicao:String);
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
  except
    MensagensSistema(1,'Não foi possível apagar o registro. Você deve entrar em contato com o administrado do sistema.');
    FreeAndNil(zqApaga);
  end;
  FreeAndNil(zqApaga);
end;

end.
