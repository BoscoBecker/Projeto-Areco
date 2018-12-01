unit uControle;

interface

uses
   Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
   Variants, Contnrs,  DBXFirebird, SqlExpr,  StrUtils, inifiles,
   uConexao,Data.Win.ADODB;
 type

 TControle = class

 private
   FConexao  : TConexaoBanco;
   FSqqGeral : TADOQuery;

 public
     constructor Create;
     destructor  Destroy; override;
     property SqqGeral : TADOQuery read FSqqGeral write FSqqGeral;
 end;



implementation



{ TControle }

constructor TControle.Create;

begin

   FConexao  := TConexaoBanco.Create;

   FSqqGeral := TADOQuery.Create(Application);

   FSqqGeral.Connection := FConexao.ConexaoBanco;

end;



destructor TControle.Destroy;

begin

  inherited;

end;



end.
