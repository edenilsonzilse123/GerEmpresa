unit uFormularios;

interface

uses
  Vcl.Forms, System.Classes, System.SysUtils, IdHashSHA;

  procedure CriarForm(InstanceClass: TComponentClass; var Reference; pTitulo:String=''; pModal:Boolean=True; pPosition:TPosition=poDesktopCenter);
  function  GetCriptogrado(pTexto:String):String;

implementation

procedure CriarForm(InstanceClass: TComponentClass; var Reference; pTitulo:String=''; pModal:Boolean=True; pPosition:TPosition=poDesktopCenter);
begin
  Application.CreateForm(InstanceClass,Reference);
  TForm(Reference).Caption  :=  pTitulo;
  TForm(Reference).Position :=  pPosition;
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

end.
