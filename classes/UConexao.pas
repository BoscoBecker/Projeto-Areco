unit UConexao;

interface

uses

  SqlExpr, inifiles, SysUtils, Forms,Dialogs, Data.Win.ADODB;

type
    TConexaoBanco = class
    private
    FConexaoBanco : TADOConnection;
    public

    constructor Create;
    destructor  Destroy; override;
    function GetConexao   : TADOConnection;
    property ConexaoBanco : TADOConnection   read GetConexao;
   end;




implementation

 constructor TConexaoBanco.Create;
begin
     Try
     FConexaoBanco := TADOConnection.Create(Application);

     FConexaoBanco.ConnectionString := 'Provider=SQLNCLI11.1;Persist Security Info=False;User '+
     'ID=sa;Pwd=cidadao2018;Initial Catalog=dbARECO;Data Source=localhost;Use Procedure for Prepare=1;'+
     'Auto Translate=True;Packet Size=4096;Workstation ID=localhost;Initial File Name="";'+
     'Use Encryption for Data=False;Tag with column collation when possible=False;MARS Connection=False;'+
     'DataTypeCompatibility=0;Trust Server Certificate=False;Application Intent=READWRITE;';

     FConexaoBanco.LoginPrompt := False;
     FConexaoBanco.Connected   := true;
   except
     showmessage('Erro ao Conectar o Banco de dados. Verifique as preferencias do sistema!');
   end;
end;



destructor TConexaoBanco.Destroy;
begin
  FConexaoBanco.Free;
  inherited;
end;



function TConexaoBanco.GetConexao: TADOConnection;
begin
   Result := FConexaoBanco;
end;







end.
