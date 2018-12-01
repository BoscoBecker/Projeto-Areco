unit UProduto;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls, uControle,dialogs;

 type

 TProduto = class

 private
   Fpeso : double;
   Faltura : double;
   Fcontrole : TControle;
 public
    constructor Create(pConexaoControle:TControle);
    destructor Destroy; override;

    function ValidaInseriProduto(id: integer; altura: double; peso: double) : Boolean;
    function ValidaAlteraProduto(id: integer; altura: double; peso: double) : Boolean;
    function ValidaExcluirProduto(id: integer) : Boolean;

    function InseriProduto(id: integer; altura, peso : Double )   : Boolean;
    function AlteraProduto(id: integer; altura, peso : Double )  : Boolean;
    function ExcluirProduto(id: integer) : Boolean;
    function PesquisaProduto (pCodigo:string):TProduto;

    function GetPeso() : Double;
    function SetPeso( peso : Double ) : Double ;

    function GetAltura() : Double;
    function SetAltura(altura : Double ): Double;

    property peso   : double read Fpeso   Write Fpeso;
    property altura : double read Faltura write Faltura;
 end;


implementation

function TProduto.AlteraProduto(id: integer; altura, peso : Double ): Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add(' update Produto ');
  FControle.sqqGeral.SQL.Add(' set peso=:peso, ');
  FControle.sqqGeral.SQL.Add(' altura =:altura ');
  FControle.sqqGeral.SQL.Add(' where (id=:id)');
  FControle.sqqGeral.Parameters.ParamByName('id').Value      := id;
  FControle.sqqGeral.Parameters.ParamByName('peso').Value    := peso;
  FControle.sqqGeral.Parameters.ParamByName('altura').Value  := altura;
  try
    FControle.sqqGeral.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

constructor TProduto.Create(pConexaoControle:TControle);
begin
Fcontrole := pConexaoControle;
end;

destructor Tproduto.Destroy;
begin
 inherited;
end;

function TProduto.ExcluirProduto(id: integer): Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('delete from produto where id =:id');
  FControle.sqqGeral.Parameters.ParamByName('id').Value     := id;
  try
    FControle.sqqGeral.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

function TProduto.GetAltura: Double;
begin
   result := Faltura;
end;

function TProduto.GetPeso: Double;
begin
  result :=- Fpeso;
end;

function TProduto.InseriProduto(id: integer; altura, peso : Double ) : Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add(' insert into Produto ');
  FControle.sqqGeral.SQL.Add(' (id,altura,peso) ');
  FControle.sqqGeral.SQL.Add(' values (:id,:altura,:peso )');
  FControle.sqqGeral.Parameters.ParamByName('id').Value     := id;
  FControle.sqqGeral.Parameters.ParamByName('altura').Value := altura;
  FControle.sqqGeral.Parameters.ParamByName('peso').Value   := peso;
  try
    FControle.sqqGeral.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

function TProduto.PesquisaProduto(pCodigo: string): TProduto;
begin
  Fcontrole.SqqGeral.Close;
  Fcontrole.SqqGeral.SQL.Clear;
  Fcontrole.SqqGeral.SQL.add('select * from produto ');
  //FControle.sqqGeral.Parameters.ParamByName('peso').Value := Self.fpeso;
end;

function TProduto.SetAltura(altura: Double): Double;
begin
  Faltura := altura;
end;

function TProduto.SetPeso(peso: Double): Double;
begin
 Fpeso := peso;
end;

function TProduto.ValidaAlteraProduto(id: integer; altura,
  peso: double): Boolean;
begin
  if (id >=0) and (altura >= 0.0) and (peso >= 0.0) then
   result := true
  else
   begin
     ShowMessage('Os campos não podem estar vazios.');
     result:= false;
     exit;
   end;
end;

function TProduto.ValidaExcluirProduto(id: integer): Boolean;
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

function TProduto.ValidaInseriProduto(id: integer; altura,
  peso: double): Boolean;
begin
  if (id >=0) and (altura >= 0.0) and (peso >= 0.0) then
   result := true
  else
   begin
     ShowMessage('Os campos não podem estar vazios.');
     result:= false;
     exit;
   end;
end;

end.

