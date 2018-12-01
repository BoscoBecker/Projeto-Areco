unit UCategoria;

interface

uses Windows, SysUtils, Classes, Controls, Forms, ComCtrls, uControle,dialogs;

 type

 TCategoria = class

 private
   Fid       : integer;
   Fcodigo   : String;
   Fnome     : String;
   Fcontrole : TControle;

 public
   constructor Create(pConexaoControle:TControle);
   destructor Destroy; override;

   function ValidaInsereCategoria(id: integer; codigo: string; nome: string) : Boolean;
   function ValidaAlteraCategoria(id: integer; codigo: string; nome: string) : Boolean;
   function ValidaExcluirCategoria(id: integer) : Boolean;


   function InsereCategoria(id: integer; codigo: string; nome: string) : Boolean;
   function AlteraCategoria(id: integer; codigo: string; nome: string) : Boolean;
   function ExcluirCategoria(id: integer) : Boolean;
   function PesquisaCategoria (pCodigo:string):TCategoria;

   function Getid() : integer;
   function SetId( id :integer): integer;

   function GetCodigo() : String;
   function SetCodigo( codigo : String ) : String ;

   function GetNome(): String;
   function SetNome(nome : String) : String;

   property id     : integer read Fid     write Fid;
   property codigo : String  read Fcodigo write Fcodigo;
   property nome   : String  read Fnome   write Fnome;
 end;

implementation



constructor TCategoria.Create(pConexaoControle:TControle);

begin

FControle := pConexaoControle;

end;

destructor TCategoria.Destroy;
begin
 inherited;
end;

function TCategoria.AlteraCategoria(id: integer; codigo: string; nome: string) : Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add(' update Categoria ');
  FControle.sqqGeral.SQL.Add(' set codigo=:codigo, ');
  FControle.sqqGeral.SQL.Add(' nome =:nome ');
  FControle.sqqGeral.SQL.Add(' where (id=:id)');
  FControle.sqqGeral.Parameters.ParamByName('id').Value     := id;
  FControle.sqqGeral.Parameters.ParamByName('codigo').Value := codigo;
  FControle.sqqGeral.Parameters.ParamByName('nome').Value   := nome;
  try
    FControle.sqqGeral.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

function TCategoria.ExcluirCategoria(id: integer) : Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('delete from categoria where id =:id');
  FControle.sqqGeral.Parameters.ParamByName('id').Value     := id;
  try
    FControle.sqqGeral.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

function TCategoria.InsereCategoria(id: integer; codigo: string; nome: string): Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add(' insert into Categoria ');
  FControle.sqqGeral.SQL.Add(' (id,codigo,nome) ');
  FControle.sqqGeral.SQL.Add(' values (:id,:codigo,:nome )');
  FControle.sqqGeral.Parameters.ParamByName('id').Value     := id;
  FControle.sqqGeral.Parameters.ParamByName('codigo').Value := codigo;
  FControle.sqqGeral.Parameters.ParamByName('nome').Value   := nome;
  try
    FControle.sqqGeral.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

function TCategoria.PesquisaCategoria(pCodigo: string): TCategoria;
begin

end;

function TCategoria.GetCodigo: String;
begin
  result := fcodigo;
end;

function TCategoria.Getid: integer;
begin
  result := fid;
end;

function TCategoria.GetNome: String;
begin
 result := fnome;
end;

function TCategoria.SetCodigo(codigo: String): String;
begin
    Fcodigo := codigo;
end;

function TCategoria.SetId(id: integer): integer;
begin
     Fid := id;
end;

function TCategoria.SetNome(nome: String): String;
begin
  fnome := nome
end;

function TCategoria.ValidaAlteraCategoria(id: integer; codigo,
  nome: string): Boolean;
begin
  if (id >=0) and (codigo <> EmptyStr) and (nome <> EmptyStr) then
   result := true
  else
   begin
     ShowMessage('Os campos não podem estar vazios.');
     result:= false;
     exit;
   end;
end;

function TCategoria.ValidaExcluirCategoria(id: integer): Boolean;
begin
  if (id >=0) then
   result := true
  else
   begin
     ShowMessage('O campo não podem estar vazios.');
     result:= false;
     exit;
   end;
end;

function TCategoria.ValidaInsereCategoria(id: integer; codigo,
  nome: string): Boolean;
begin
  if (id >=0) and (codigo <> EmptyStr) and (nome <> EmptyStr) then
   result := true
  else
   begin
     ShowMessage('Os campos não podem estar vazios.');
     result:= false;
     exit;
   end;
end;

end.
