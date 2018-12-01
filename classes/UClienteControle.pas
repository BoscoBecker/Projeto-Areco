unit uClienteControle;

interface

uses

Windows, SysUtils, Classes, Controls, Forms, ComCtrls, uControle;

type

TClienteControle = class

private

FCodigo : String;

FNome : String;

FCpfCnpj : String;

FIdentidade : String;

FEndereco : String;

FPontoRef : String;

FBairro : String;

FCidade : String;

FEstado : String;

FCep : String;

FFone1 : String;

FFone2 : String;

FCelular : String;

FDataCadastro : TDate;

FDataUltimaCompra : TDate;

FDataNascimento : TDate;

FSexo : String;

FEstadoCivil : String;

FLimiteDeCredito : Currency;

FEmail : String;

FGrupoCliente : String;

FArea : String;

FStatus : String;

FObservacoes : String;

// Classe de Persistencia ...

Fcontrole :TControle;

public



constructor Create(pConexaoControle:TControle);

destructor Destroy; override;

//

function InsereCliente : Boolean;

function AlteraCliente : Boolean;

function ExcluirCliente : Boolean;

function PesquisaCliente (pCodigo:string):TClienteControle;

//



property Codigo : String read FCodigo write FCodigo;

property Nome : String read FNome write FNome;

property CpfCnpj : String read FCpfCnpj write FCpfCnpj;

property Identidade : String read FIdentidade write FIdentidade;

property Endereco : String read FEndereco write FEndereco;

property PontoRef : String read FPontoRef write FPontoRef;

property Bairro : String read FBairro write FBairro;

property Cidade : String read FCidade write FCidade;

property Estado : String read FEstado write FEstado;

property Cep : String read FCep write FCep;

property Fone1 : String read FFone1 write FFone1;

property Fone2 : String read FFone2 write FFone2;

property Celular : String read FCelular write FCelular;

property DataCadastro : TDate read FDataCadastro write FDataCadastro;

property DataUltimaCompra : TDate read FDataUltimaCompra write FDataUltimaCompra;

property DataNascimento : TDate read FDataNascimento write FDataNascimento;

property Sexo : String read FSexo write FSexo;

property EstadoCivil : String read FEstadoCivil write FEstadoCivil;

property LimiteDeCredito : Currency read FLimiteDeCredito write FLimiteDeCredito;

property Email : String read FEmail write FEmail;

property GrupoCliente : String read FGrupoCliente write FGrupoCliente;

property Area : String read FArea write FArea;

property Status : String read FStatus write FStatus;

property Observacoes : String read FObservacoes write FObservacoes;



end;



implementation

{ TClienteControle }




constructor TClienteControle.Create(pConexaoControle:TControle);

begin

Fcontrole := pConexaoControle;

end;



destructor TClienteControle.Destroy;

begin



inherited;

end;


function TClienteControle.AlteraCliente: Boolean;

begin

FControle.sqqGeral.Close;

FControle.sqqGeral.SQL.Clear;

FControle.sqqGeral.SQL.Add(' UPDATE TBL_CLIENTES ');

FControle.sqqGeral.SQL.Add(' SET CLI_NOME = :vCLI_NOME, ');

FControle.sqqGeral.SQL.Add(' CLI_CPF_CNPJ = :vCLI_CPF_CNPJ, ');

FControle.sqqGeral.SQL.Add(' CLI_RG_INSCR = :vCLI_RG_INSCR, ');

FControle.sqqGeral.SQL.Add(' CLI_ENDERECO = :vCLI_ENDERECO, ');

FControle.sqqGeral.SQL.Add(' CLI_PONTO_REFERENCIA = :vCLI_PONTO_REFERENCIA, ');

FControle.sqqGeral.SQL.Add(' CLI_BAIRRO = :vCLI_BAIRRO, ');

FControle.sqqGeral.SQL.Add(' CLI_CIDADE = :vCLI_CIDADE, ');

FControle.sqqGeral.SQL.Add(' CLI_ESTADO = :vCLI_ESTADO, ');

FControle.sqqGeral.SQL.Add(' CLI_CEP = :vCLI_CEP, ');

FControle.sqqGeral.SQL.Add(' CLI_FONE1 = :vCLI_FONE1, ');

FControle.sqqGeral.SQL.Add(' CLI_FONE2 = :vCLI_FONE2, ');

FControle.sqqGeral.SQL.Add(' CLI_CELULAR = :vCLI_CELULAR, ');

FControle.sqqGeral.SQL.Add(' CLI_DTA_CADASTRO = :vCLI_DTA_CADASTRO, ');

FControle.sqqGeral.SQL.Add(' CLI_DTA_ULTIMA_COMPRA = :vCLI_DTA_ULTIMA_COMPRA, ');

FControle.sqqGeral.SQL.Add(' CLI_DTA_NASCIMENTO = :vCLI_DTA_NASCIMENTO, ');

FControle.sqqGeral.SQL.Add(' CLI_SEXO = :vCLI_SEXO, ');

FControle.sqqGeral.SQL.Add(' CLI_ESTADO_CIVIL = :vCLI_ESTADO_CIVIL, ');

FControle.sqqGeral.SQL.Add(' CLI_LIMITE_CREDITO = :vCLI_LIMITE_CREDITO, ');

FControle.sqqGeral.SQL.Add(' CLI_EMAIL = :vCLI_EMAIL, ');

FControle.sqqGeral.SQL.Add(' GRP_ID = :vGRP_ID, ');

FControle.sqqGeral.SQL.Add(' ARE_ID = :vARE_ID, ');

FControle.sqqGeral.SQL.Add(' CLI_STATUS = :vCLI_STATUS, ');

FControle.sqqGeral.SQL.Add(' CLI_OBSERVA = :vCLI_OBSERVA ');

FControle.sqqGeral.SQL.Add(' WHERE (CLI_ID = :vCLI_ID) ');



FControle.sqqGeral.ParamByName('vCLI_ID').AsString := Self.Codigo;

FControle.sqqGeral.ParamByName('vCLI_NOME').AsString := Self.Nome;

FControle.sqqGeral.ParamByName('vCLI_CPF_CNPJ').AsString := Self.CpfCnpj;

FControle.sqqGeral.ParamByName('vCLI_RG_INSCR').AsString := Self.Identidade;

FControle.sqqGeral.ParamByName('vCLI_ENDERECO').AsString := Self.Endereco;

FControle.sqqGeral.ParamByName('vCLI_PONTO_REFERENCIA').AsString := Self.PontoRef;

FControle.sqqGeral.ParamByName('vCLI_BAIRRO').AsString := Self.Bairro;

FControle.sqqGeral.ParamByName('vCLI_CIDADE').AsString := Self.Cidade;

FControle.sqqGeral.ParamByName('vCLI_ESTADO').AsString := Self.Estado;

FControle.sqqGeral.ParamByName('vCLI_CEP').AsString := Self.Cep;

FControle.sqqGeral.ParamByName('vCLI_FONE1').AsString := Self.Fone1;

FControle.sqqGeral.ParamByName('vCLI_FONE2').AsString := Self.Fone2;

FControle.sqqGeral.ParamByName('vCLI_CELULAR').AsString := Self.Celular;

FControle.sqqGeral.ParamByName('vCLI_DTA_CADASTRO').AsDate := Self.DataCadastro;

FControle.sqqGeral.ParamByName('vCLI_DTA_ULTIMA_COMPRA').AsDate := Self.DataUltimaCompra;

FControle.sqqGeral.ParamByName('vCLI_DTA_NASCIMENTO').AsDate := Self.DataNascimento;

FControle.sqqGeral.ParamByName('vCLI_SEXO').AsString := Self.Sexo;

FControle.sqqGeral.ParamByName('vCLI_ESTADO_CIVIL').AsString := Self.EstadoCivil;

FControle.sqqGeral.ParamByName('vCLI_LIMITE_CREDITO').AsCurrency := Self.LimiteDeCredito;

FControle.sqqGeral.ParamByName('vCLI_EMAIL').AsString := Self.Email;

FControle.sqqGeral.ParamByName('vGRP_ID').AsString := Self.GrupoCliente;

FControle.sqqGeral.ParamByName('vARE_ID').AsString := Self.Area;

FControle.sqqGeral.ParamByName('vCLI_STATUS').AsString := Self.Status;

FControle.sqqGeral.ParamByName('vCLI_OBSERVA').AsString := Self.Observacoes;

//

try

FControle.sqqGeral.ExecSQL;

Result := True;

except

Result := False;

end;

end;

function TClienteControle.ExcluirCliente: Boolean;

begin

Fcontrole.SqqGeral.Close;

FControle.sqqGeral.SQL.Clear;

FControle.sqqGeral.SQL.Add(' DELETE FROM TBL_CLIENTES C ');

FControle.sqqGeral.SQL.Add(' WHERE C.CLI_ID = :vCLI_ID ');

FControle.sqqGeral.ParamByName('vCLI_ID').AsString := Self.Codigo;



try

FControle.sqqGeral.ExecSQL;

Result := True;

except

Result := False;

end

end;

function TClienteControle.InsereCliente: Boolean;

begin

FControle.sqqGeral.Close;

FControle.sqqGeral.SQL.Clear;

FControle.sqqGeral.SQL.Add(' INSERT INTO TBL_CLIENTES ');

FControle.sqqGeral.SQL.Add(' (CLI_ID, ');

FControle.sqqGeral.SQL.Add(' CLI_NOME, ');

FControle.sqqGeral.SQL.Add(' CLI_CPF_CNPJ, ');

FControle.sqqGeral.SQL.Add(' CLI_RG_INSCR, ');

FControle.sqqGeral.SQL.Add(' CLI_ENDERECO, ');

FControle.sqqGeral.SQL.Add(' CLI_PONTO_REFERENCIA, ');

FControle.sqqGeral.SQL.Add(' CLI_BAIRRO, ');

FControle.sqqGeral.SQL.Add(' CLI_CIDADE, ');

FControle.sqqGeral.SQL.Add(' CLI_ESTADO, ');

FControle.sqqGeral.SQL.Add(' CLI_CEP, ');

FControle.sqqGeral.SQL.Add(' CLI_FONE1, ');

FControle.sqqGeral.SQL.Add(' CLI_FONE2, ');

FControle.sqqGeral.SQL.Add(' CLI_CELULAR, ');

FControle.sqqGeral.SQL.Add(' CLI_DTA_CADASTRO, ');

FControle.sqqGeral.SQL.Add(' CLI_DTA_ULTIMA_COMPRA, ');

FControle.sqqGeral.SQL.Add(' CLI_DTA_NASCIMENTO, ');

FControle.sqqGeral.SQL.Add(' CLI_SEXO, ');

FControle.sqqGeral.SQL.Add(' CLI_ESTADO_CIVIL, ');

FControle.sqqGeral.SQL.Add(' CLI_LIMITE_CREDITO, ');

FControle.sqqGeral.SQL.Add(' CLI_EMAIL, ');

FControle.sqqGeral.SQL.Add(' GRP_ID, ');

FControle.sqqGeral.SQL.Add(' ARE_ID, ');

FControle.sqqGeral.SQL.Add(' CLI_STATUS, ');

FControle.sqqGeral.SQL.Add(' CLI_OBSERVA) ');

FControle.sqqGeral.SQL.Add(' VALUES (:vCLI_ID, ');

FControle.sqqGeral.SQL.Add(' :vCLI_NOME, ');

FControle.sqqGeral.SQL.Add(' :vCLI_CPF_CNPJ, ');

FControle.sqqGeral.SQL.Add(' :vCLI_RG_INSCR, ');

FControle.sqqGeral.SQL.Add(' :vCLI_ENDERECO, ');

FControle.sqqGeral.SQL.Add(' :vCLI_PONTO_REFERENCIA, ');

FControle.sqqGeral.SQL.Add(' :vCLI_BAIRRO, ');

FControle.sqqGeral.SQL.Add(' :vCLI_CIDADE, ');

FControle.sqqGeral.SQL.Add(' :vCLI_ESTADO, ');

FControle.sqqGeral.SQL.Add(' :vCLI_CEP, ');

FControle.sqqGeral.SQL.Add(' :vCLI_FONE1, ');

FControle.sqqGeral.SQL.Add(' :vCLI_FONE2, ');

FControle.sqqGeral.SQL.Add(' :vCLI_CELULAR, ');

FControle.sqqGeral.SQL.Add(' :vCLI_DTA_CADASTRO, ');

FControle.sqqGeral.SQL.Add(' :vCLI_DTA_ULTIMA_COMPRA, ');

FControle.sqqGeral.SQL.Add(' :vCLI_DTA_NASCIMENTO, ');

FControle.sqqGeral.SQL.Add(' :vCLI_SEXO, ');

FControle.sqqGeral.SQL.Add(' :vCLI_ESTADO_CIVIL, ');

FControle.sqqGeral.SQL.Add(' :vCLI_LIMITE_CREDITO, ');

FControle.sqqGeral.SQL.Add(' :vCLI_EMAIL, ');

FControle.sqqGeral.SQL.Add(' :vGRP_ID, ');

FControle.sqqGeral.SQL.Add(' :vARE_ID, ');

FControle.sqqGeral.SQL.Add(' :vCLI_STATUS, ');

FControle.sqqGeral.SQL.Add(' :vCLI_OBSERVA) ');

//

FControle.sqqGeral.ParamByName('vCLI_ID').AsString := Self.Codigo;

FControle.sqqGeral.ParamByName('vCLI_NOME').AsString := Self.Nome;

FControle.sqqGeral.ParamByName('vCLI_CPF_CNPJ').AsString := Self.CpfCnpj;

FControle.sqqGeral.ParamByName('vCLI_RG_INSCR').AsString := Self.Identidade;

FControle.sqqGeral.ParamByName('vCLI_ENDERECO').AsString := Self.Endereco;

FControle.sqqGeral.ParamByName('vCLI_PONTO_REFERENCIA').AsString := Self.PontoRef;

FControle.sqqGeral.ParamByName('vCLI_BAIRRO').AsString := Self.Bairro;

FControle.sqqGeral.ParamByName('vCLI_CIDADE').AsString := Self.Cidade;

FControle.sqqGeral.ParamByName('vCLI_ESTADO').AsString := Self.Estado;

FControle.sqqGeral.ParamByName('vCLI_CEP').AsString := Self.Cep;

FControle.sqqGeral.ParamByName('vCLI_FONE1').AsString := Self.Fone1;

FControle.sqqGeral.ParamByName('vCLI_FONE2').AsString := Self.Fone2;

FControle.sqqGeral.ParamByName('vCLI_CELULAR').AsString := Self.Celular;

FControle.sqqGeral.ParamByName('vCLI_DTA_CADASTRO').AsDate := Self.DataCadastro;

FControle.sqqGeral.ParamByName('vCLI_DTA_ULTIMA_COMPRA').AsDate := Self.DataUltimaCompra;

FControle.sqqGeral.ParamByName('vCLI_DTA_NASCIMENTO').AsDate := Self.DataNascimento;

FControle.sqqGeral.ParamByName('vCLI_SEXO').AsString := Self.Sexo;

FControle.sqqGeral.ParamByName('vCLI_ESTADO_CIVIL').AsString := Self.EstadoCivil;

FControle.sqqGeral.ParamByName('vCLI_LIMITE_CREDITO').AsCurrency := Self.LimiteDeCredito;

FControle.sqqGeral.ParamByName('vCLI_EMAIL').AsString := Self.Email;

FControle.sqqGeral.ParamByName('vGRP_ID').AsString := Self.GrupoCliente;

FControle.sqqGeral.ParamByName('vARE_ID').AsString := Self.Area;

FControle.sqqGeral.ParamByName('vCLI_STATUS').AsString := Self.Status;

FControle.sqqGeral.ParamByName('vCLI_OBSERVA').AsString := Self.Observacoes;

//

try

FControle.sqqGeral.ExecSQL;

Result := True;

except

Result := False;

end;

end;

function TClienteControle.PesquisaCliente(pCodigo: string): TClienteControle;

begin

FControle.sqqGeral.Close;

FControle.sqqGeral.SQL.Clear;

FControle.sqqGeral.SQL.Add(' SELECT CLI_ID, ');

FControle.sqqGeral.SQL.Add(' CLI_NOME, ');

FControle.sqqGeral.SQL.Add(' CLI_CPF_CNPJ, ');

FControle.sqqGeral.SQL.Add(' CLI_RG_INSCR, ');

FControle.sqqGeral.SQL.Add(' CLI_ENDERECO, ');

FControle.sqqGeral.SQL.Add(' CLI_PONTO_REFERENCIA, ');

FControle.sqqGeral.SQL.Add(' CLI_BAIRRO, ');

FControle.sqqGeral.SQL.Add(' CLI_CIDADE, ');

FControle.sqqGeral.SQL.Add(' CLI_ESTADO, ');

FControle.sqqGeral.SQL.Add(' CLI_CEP, ');

FControle.sqqGeral.SQL.Add(' CLI_FONE1, ');

FControle.sqqGeral.SQL.Add(' CLI_FONE2, ');

FControle.sqqGeral.SQL.Add(' CLI_CELULAR, ');

FControle.sqqGeral.SQL.Add(' CLI_DTA_CADASTRO, ');

FControle.sqqGeral.SQL.Add(' CLI_DTA_ULTIMA_COMPRA, ');

FControle.sqqGeral.SQL.Add(' CLI_DTA_NASCIMENTO, ');

FControle.sqqGeral.SQL.Add(' CLI_SEXO, ');

FControle.sqqGeral.SQL.Add(' CLI_ESTADO_CIVIL, ');

FControle.sqqGeral.SQL.Add(' CLI_LIMITE_CREDITO, ');

FControle.sqqGeral.SQL.Add(' CLI_EMAIL, ');

FControle.sqqGeral.SQL.Add(' GRP_ID, ');

FControle.sqqGeral.SQL.Add(' ARE_ID, ');

FControle.sqqGeral.SQL.Add(' CLI_STATUS, ');

FControle.sqqGeral.SQL.Add(' CLI_OBSERVA ');

FControle.sqqGeral.SQL.Add(' FROM TBL_CLIENTES ');

FControle.sqqGeral.SQL.Add(' WHERE CLI_ID = '+ pCodigo );

FControle.sqqGeral.Open;



if FControle.sqqGeral.IsEmpty then

begin

Self.Codigo := '';

end

else

begin

Self.Codigo := FControle.sqqGeral.ParamByName('vCLI_ID').AsString ;

Self.Nome := FControle.sqqGeral.ParamByName('vCLI_NOME').AsString ;

Self.CpfCnpj := FControle.sqqGeral.ParamByName('vCLI_CPF_CNPJ').AsString ;

Self.Identidade := FControle.sqqGeral.ParamByName('vCLI_RG_INSCR').AsString ;

Self.Endereco := FControle.sqqGeral.ParamByName('vCLI_ENDERECO').AsString ;

Self.PontoRef := FControle.sqqGeral.ParamByName('vCLI_PONTO_REFERENCIA').AsString ;

Self.Bairro := FControle.sqqGeral.ParamByName('vCLI_BAIRRO').AsString ;

Self.Cidade := FControle.sqqGeral.ParamByName('vCLI_CIDADE').AsString ;

Self.Estado := FControle.sqqGeral.ParamByName('vCLI_ESTADO').AsString ;

Self.Cep := FControle.sqqGeral.ParamByName('vCLI_CEP').AsString ;

Self.Fone1 := FControle.sqqGeral.ParamByName('vCLI_FONE1').AsString ;

Self.Fone2 := FControle.sqqGeral.ParamByName('vCLI_FONE2').AsString ;

Self.Celular := FControle.sqqGeral.ParamByName('vCLI_CELULAR').AsString ;

Self.DataCadastro := FControle.sqqGeral.ParamByName('vCLI_DTA_CADASTRO').AsDate ;

Self.DataUltimaCompra := FControle.sqqGeral.ParamByName('vCLI_DTA_ULTIMA_COMPRA').AsDate ;

Self.DataNascimento := FControle.sqqGeral.ParamByName('vCLI_DTA_NASCIMENTO').AsDate ;

Self.Sexo := FControle.sqqGeral.ParamByName('vCLI_SEXO').AsString ;

Self.EstadoCivil := FControle.sqqGeral.ParamByName('vCLI_ESTADO_CIVIL').AsString ;

Self.LimiteDeCredito := FControle.sqqGeral.ParamByName('vCLI_LIMITE_CREDITO').AsCurrency ;

Self.Email := FControle.sqqGeral.ParamByName('vCLI_EMAIL').AsString ;

Self.GrupoCliente := FControle.sqqGeral.ParamByName('vGRP_ID').AsString ;

Self.Area := FControle.sqqGeral.ParamByName('vARE_ID').AsString ;

Self.Status := FControle.sqqGeral.ParamByName('vCLI_STATUS').AsString ;

Self.Observacoes := FControle.sqqGeral.ParamByName('vCLI_OBSERVA').AsString ;

end;

end;

end.
