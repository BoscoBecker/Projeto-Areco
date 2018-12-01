unit UServico;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls, uControle,dialogs;

 type

 TServico = class

 private
   FcodigoServico : String;
   Fcontrole : TControle;

 public
   constructor Create(pConexaoControle:TControle);
   destructor Destroy; override;

   function ValidaInseriServico(id: integer) : Boolean;
   function ValidaAlteraServico(id: integer) : Boolean;
   function ValidaExcluirServico(id: integer) : Boolean;

   function InseriServico(codigoserv : integer)  : Boolean;
   function AlteraServico(codigoserv, codigoservNovo: integer)   : Boolean;
   function ExcluirServico(codigoserv : integer)  : Boolean;
   function PesquisaServico (pCodigo:string):TServico;

   function GetCodigoServico() : String;
   function SetServico( codigo : String ) : String ;

   property codigoservico : String read FcodigoServico write FcodigoServico;
 end;


implementation

function TServico.AlteraServico(codigoserv, codigoservNovo: integer) : Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add(' update servico ');
  FControle.sqqGeral.SQL.Add(' set codigoservico=:codigoservnovo ');
  FControle.sqqGeral.SQL.Add(' where (codigoservico=:codigoserv)');
  FControle.sqqGeral.Parameters.ParamByName('codigoservnovo').Value  := codigoservNovo;
  FControle.sqqGeral.Parameters.ParamByName('codigoserv').Value      := codigoserv;
  try
    FControle.sqqGeral.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

constructor TServico.Create(pConexaoControle:TControle);

begin

Fcontrole := pConexaoControle;

end;

destructor TServico.Destroy;
begin
 inherited;
end;

function TServico.ExcluirServico(codigoserv : integer) : Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('delete from servico where codigoservico =:codigoserv');
  FControle.sqqGeral.Parameters.ParamByName('codigoserv').Value     := codigoserv;
  try
    FControle.sqqGeral.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

function TServico.GetCodigoServico: String;
begin
  result := FcodigoServico;
end;

function TServico.InseriServico(codigoserv : integer) : Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add(' insert into servico ');
  FControle.sqqGeral.SQL.Add(' (codigoservico) ');
  FControle.sqqGeral.SQL.Add(' values (:codigoservico )');
  FControle.sqqGeral.Parameters.ParamByName('codigoservico').Value := codigoserv;
  try
    FControle.sqqGeral.ExecSQL;
    Result := True;
  except
    Result := False;
  end;

end;

function TServico.PesquisaServico(pCodigo: string): TServico;
begin

end;

function TServico.SetServico(codigo: String): String;
begin
  FcodigoServico :=codigo ;
end;

function TServico.ValidaAlteraServico(id: integer): Boolean;
begin
  if (id >=0) then
   result := true
  else
   begin
     ShowMessage('Os campos não podem estar vazios.');
     result:= false;
     exit;
   end;
end;

function TServico.ValidaExcluirServico(id: integer): Boolean;
begin
  if (id >=0) then
   result := true
  else
   begin
     ShowMessage('Os campos não podem estar vazios.');
     result:= false;
     exit;
   end;
end;

function TServico.ValidaInseriServico(id: integer): Boolean;
begin
  if (id >=0) then
   result := true
  else
   begin
     ShowMessage('Os campos não podem estar vazios.');
     result:= false;
     exit;
   end;
end;

end.
