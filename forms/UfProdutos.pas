unit UfProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, Data.Win.ADODB,Ucontrole,Uproduto;

type
  TFrmProduto = class(TForm)
    lblProduto: TLabel;
    QueryGrid: TADOQuery;
    adoconexao: TADOConnection;
    dtsourceProdutos: TDataSource;
    ShapeFundo: TShape;
    gpBoxProdutos: TGroupBox;
    lblaltura: TLabel;
    lblRegistros: TLabel;
    lblPeso: TLabel;
    edtPeso: TEdit;
    edtAltura: TEdit;
    dbGridProdutos: TDBGrid;
    btnAtualizaGrid: TButton;
    btnAlterar: TButton;
    btnDeletar: TButton;
    btnSalvar: TButton;
    btnNovo: TButton;
    btnFechar: TButton;
    imgArecoProduto: TImage;
    lblSlogan: TLabel;
    edtId: TEdit;
    lblId: TLabel;
    lblTitulo: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure btnAtualizaGridClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure LimpaCampos();
    procedure AtualizaGrid();
    procedure VerificaQuery;
    function  getIdView(): integer;
    function  RetornaRegistros(): string;
  public
    { Public declarations }
  end;

var
  FrmProduto: TFrmProduto;

implementation

{$R *.dfm}

procedure TFrmProduto.AtualizaGrid;
begin
    QueryGrid.Active := false;
    QueryGrid.Active := True;
    VerificaQuery;
    RetornaRegistros;
    LimpaCampos;
end;

procedure TFrmProduto.btnAlterarClick(Sender: TObject);
var
  controle : TControle;
  Produto : TProduto;
begin
    controle := TControle.Create;
    controle.Create;

    produto := TProduto.Create(controle);
    if (Produto.ValidaAlteraProduto(StrToInt(edtId.Text),StrToFloat(edtpeso.Text),StrToFloat(edtaltura.Text))) then
    begin
      produto.AlteraProduto(StrToInt(edtId.Text),StrToFloat(edtpeso.Text),StrToFloat(edtaltura.Text));
      AtualizaGrid;
    end
      else
        Application.MessageBox('Os campos não podem ficar vazios.', 'Informção',MB_ICONINFORMATION+mb_ok);

    //liberando da memoria
    produto.Destroy;
    controle.Destroy;
end;

procedure TFrmProduto.btnAtualizaGridClick(Sender: TObject);
begin
  AtualizaGrid;
end;

procedure TFrmProduto.btnDeletarClick(Sender: TObject);
var
  controle : TControle;
  Produto  : TProduto;
  id       :  Integer;
begin
    id :=0 ;
    controle := TControle.Create;
    controle.Create;

    produto := TProduto.Create(controle);
    id:= getIdView;

    if Produto.ValidaExcluirProduto(id)then
    begin
      produto.ExcluirProduto(id);
      AtualizaGrid;
    end
    else
      Application.MessageBox('O campo ID não podem ficar vazios.', 'Informção',MB_ICONINFORMATION+mb_ok);

    //liberando da memoria
    produto.Destroy;
    controle.Destroy;
end;

procedure TFrmProduto.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TFrmProduto.btnNovoClick(Sender: TObject);
begin
    LimpaCampos();
    btnSalvar.Enabled := true;
end;

procedure TFrmProduto.btnSalvarClick(Sender: TObject);
var
  controle  : TControle;
  produto : TProduto;
begin
    controle := TCOntrole.Create;
    controle.Create;
    produto := TProduto.Create(controle);

    btnSalvar.Cursor := crSQLWait;

    if not(edtId.Text = EmptyStr) then
    begin
      if produto.ValidaInseriProduto(StrToInt(edtId.Text),strtofloat(edtpeso.Text),strtofloat(edtaltura.Text)) then
        produto.InseriProduto(StrToInt(edtId.Text),strtofloat(edtpeso.Text),strtofloat(edtaltura.Text));
      AtualizaGrid;
    end
    else
      Application.MessageBox('O campo ID não podem ficar vazios.', 'Informção',MB_ICONINFORMATION+mb_ok);

    //liberando da memoria
    produto.Destroy;
    controle.Destroy;
    btnSalvar.Cursor := crDefault;

end;

procedure TFrmProduto.FormCreate(Sender: TObject);
var
  controle : TControle;
begin
    controle := TCOntrole.Create;
    controle.Create;
    QueryGrid.ConnectionString := controle.SqqGeral.ConnectionString;
end;
procedure TFrmProduto.FormShow(Sender: TObject);
begin
    AtualizaGrid;
end;

function TFrmProduto.getIdView: integer;
begin
   result:= dbGridProdutos.Columns[0].Field.Value;
end;

procedure TFrmProduto.LimpaCampos;
begin
    edtId.Text:= EmptyStr;
    edtpeso.Text :=EmptyStr;
    edtAltura.Text:= EmptyStr;
end;

function TFrmProduto.RetornaRegistros: string;
begin
    lblRegistros.Caption:= '('+IntToStr(QueryGrid.RecordCount) + ') Produtos Cadastrados.';
end;

procedure TFrmProduto.VerificaQuery;
begin
  btnDeletar.Enabled := not(QueryGrid.IsEmpty);
  btnAlterar.Enabled := not(QueryGrid.IsEmpty);
  btnSalvar.Enabled  := not(QueryGrid.IsEmpty);
end;

end.
