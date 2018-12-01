unit UItem;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls, uControle,dialogs;

 type

 TItem = class

 private
      Fid : integer;
      Fcodigo : String;
      Fnome : String;
      Fdescricao : String;
      FvalorUnitario: Double;
      Fcontrole : TControle;
 public
   constructor Create(pConexaoControle:TControle);
   destructor Destroy; override;

   function ValidaInseriItem(id: integer; codigo, nome,descricao: String;  valorunit: double) : Boolean;
   function ValidaAlteraItem(id: integer; codigo, nome,descricao: String;  valorunit: double) : Boolean;
   function ValidaExcluirItem(id: integer) : Boolean;

   function InseriItem(id: integer; codigo, nome,descricao: String;  valorunit: double)   : Boolean;
   function AlteraItem(id,idnovo: integer; codigo, nome,descricao: String;  valorunit: double )  : Boolean;
   function ExcluirItem(id: integer) : Boolean;
   function PesquisaItemProduto (pCodigo:string):TItem;

   function GetId() : Integer;
   procedure SetId( id : integer);

   function Getcodigo() : string;
   procedure SetCodigo(codigo: string);

   function GetNome() : String;
   procedure SetNome( nome : String);

   function GetDescricao() : String;
   procedure SetDescricao(desc : String);

   function GetValorunitario :double;
   procedure SetValorUnitario(valorunt : double);

   property id        : integer read Fid            write Fid;
   property codigo    : string  read Fcodigo        Write Fcodigo;
   property nome      : string  read Fnome          write Fnome;
   property descricao : string  read Fdescricao     write Fdescricao ;
   property valorunt  : double  read FValorUnitario write FvalorUnitario;
 end;

implementation

{ TItem }

function TItem.AlteraItem(id, idnovo: integer; codigo, nome, descricao: String;
  valorunit: double): Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add(' update item ');
  FControle.sqqGeral.SQL.Add(' set codigo=:codigo, ');
  FControle.sqqGeral.SQL.Add(' id =:idnovo, ');
  FControle.sqqGeral.SQL.Add(' nome =:nome, ');
  FControle.sqqGeral.SQL.Add(' descricao =:descricao, ');
  FControle.sqqGeral.SQL.Add(' valorunitario =:valorunitario ');
  FControle.sqqGeral.SQL.Add(' where (id=:id)');
  FControle.sqqGeral.Parameters.ParamByName('id').Value        := idnovo;
  FControle.sqqGeral.Parameters.ParamByName('idnovo').Value    := id;
  FControle.sqqGeral.Parameters.ParamByName('codigo').Value    := codigo;
  FControle.sqqGeral.Parameters.ParamByName('nome').Value      := nome;
  FControle.sqqGeral.Parameters.ParamByName('descricao').Value := descricao;
  FControle.sqqGeral.Parameters.ParamByName('valorunitario').Value    := valorunit;

  try
    FControle.sqqGeral.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

constructor TItem.Create(pConexaoControle: TControle);
begin
  Fcontrole := pConexaoControle;
end;

destructor TItem.Destroy;
begin
  inherited;
end;

function TItem.ExcluirItem(id: integer): Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('delete from item where id =:id');
  FControle.sqqGeral.Parameters.ParamByName('id').Value := id;
  try
    FControle.sqqGeral.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

function TItem.Getcodigo: string;
begin
 result := Fcodigo;
end;

function TItem.GetDescricao: String;
begin
  result := Fdescricao
end;

function TItem.GetId: Integer;
begin
   result := Fid
end;

function TItem.GetNome: String;
begin
  Result := Fnome
end;

function TItem.GetValorunitario: double;
begin
   result := FvalorUnitario
end;

function TItem.InseriItem(id: integer; codigo, nome, descricao: String;
  valorunit: double): Boolean;
begin
   FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add(' insert into item ');
  FControle.sqqGeral.SQL.Add(' (id, codigo,nome,descricao, valorunitario) ');
  FControle.sqqGeral.SQL.Add(' values (:id,:codigo,:nome,:descricao, :valorunitario )');

  FControle.sqqGeral.Parameters.ParamByName('id').Value            := id;
  FControle.sqqGeral.Parameters.ParamByName('codigo').Value        := codigo;
  FControle.sqqGeral.Parameters.ParamByName('nome').Value          := nome;
  FControle.sqqGeral.Parameters.ParamByName('descricao').Value     := descricao;
  FControle.sqqGeral.Parameters.ParamByName('valorunitario').Value := valorunit;
  try
    FControle.sqqGeral.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

function TItem.PesquisaItemProduto(pCodigo: string): TItem;
begin

end;

procedure TItem.SetCodigo(codigo: string);
begin
  Fcodigo := codigo
end;

procedure TItem.SetDescricao(desc: String);
begin
  Fdescricao := descricao;
end;

procedure TItem.SetId(id: integer);
begin
 Fid := id
end;

procedure TItem.SetNome(nome: String);
begin
  Fnome := nome
end;

procedure TItem.SetValorUnitario(valorunt: double);
begin
  FvalorUnitario := valorunt;
end;

function TItem.ValidaAlteraItem(id: integer; codigo, nome, descricao: String;
  valorunit: double): Boolean;
begin
  if (id >=0) and (codigo <> EmptyStr) and (nome <> EmptyStr) and (valorunit >=0.0) then
   result := true
  else
   begin
     ShowMessage('Os campos não podem estar vazios.');
     result:= false;
     exit;
   end;
end;

function TItem.ValidaExcluirItem(id: integer): Boolean;
begin
 if (id >=0) then
   result := True
 else
   begin
     ShowMessage('O campo ID não pode ficar vazios.');
     result:= false;
     exit;
   end;

end;

function TItem.ValidaInseriItem(id: integer; codigo, nome, descricao: String;
  valorunit: double): Boolean;
begin
  if (id >=0) and (codigo <> EmptyStr) and (nome <> EmptyStr) and (valorunit >=0.0) then
   result := true
  else
   begin
     ShowMessage('Os campos não podem estar vazios.');
     result:= false;
     exit;
   end;
end;

end.
