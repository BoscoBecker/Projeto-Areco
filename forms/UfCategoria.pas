unit UfCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uControle, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids,Ucategoria, Data.DB, Data.Win.ADODB, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage ;

type
  TFrmCategoria = class(TForm)
    Label1: TLabel;
    QueryGrid: TADOQuery;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ShapeFundo: TShape;
    GroupBox1: TGroupBox;
    lblId: TLabel;
    edtId: TEdit;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    lblNome: TLabel;
    edtNome: TEdit;
    DBGrid1: TDBGrid;
    btnAtualizaGrid: TButton;
    btnAlterar: TButton;
    btnDeletar: TButton;
    btnSalvar: TButton;
    lblRegistros: TLabel;
    btnNovo: TButton;
    btnFechar: TButton;
    Image2: TImage;
    Label6: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAtualizaGridClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
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
  FrmCategoria: TFrmCategoria;

implementation

{$R *.dfm}

procedure TFrmCategoria.AtualizaGrid;
begin
    QueryGrid.Active := false;
    QueryGrid.Active := True;
    VerificaQuery;
    RetornaRegistros;
    LimpaCampos;
end;

procedure TFrmCategoria.btnAlterarClick(Sender: TObject);
var
  controle : TControle;
  categoria : TCategoria;
begin
    controle := TCOntrole.Create;
    controle.Create;

    categoria := TCategoria.Create(controle);
    AtualizaGrid;

    if categoria.ValidaAlteraCategoria(StrToInt(edtId.Text),edtCodigo.Text,edtNome.Text) then
    begin
      categoria.AlteraCategoria(StrToInt(edtId.Text),edtCodigo.Text,edtNome.Text);
      AtualizaGrid;
    end
    else
      showmessage('O campos ID não pode ficar vazios.');

    //liberando da memoria
    categoria.Destroy;
    controle.Destroy;
end;

procedure TFrmCategoria.btnDeletarClick(Sender: TObject);
var
  controle  : TControle;
  categoria : TCategoria;
  id        : integer;
begin
    id := 0;
    controle := TControle.Create;
    controle.Create;

    categoria := TCategoria.Create(controle);
    id:= getIdView;

    if categoria.ValidaExcluirCategoria(id) then
    begin
      categoria.ExcluirCategoria(id);
      AtualizaGrid;
    end
    else
      showmessage('O campos ID não pode ficar vazios.');

    //liberando da memoria
    categoria.Destroy;
    controle.Destroy;
end;

procedure TFrmCategoria.btnNovoClick(Sender: TObject);
begin
    LimpaCampos();
    btnSalvar.Enabled := true;
end;

procedure TFrmCategoria.btnAtualizaGridClick(Sender: TObject);
begin
  AtualizaGrid;
end;

procedure TFrmCategoria.btnSalvarClick(Sender: TObject);
var
  controle  : TControle;
  categoria : TCategoria;
begin
    controle := TCOntrole.Create;
    controle.Create;
    categoria := TCategoria.Create(controle);

    btnSalvar.Cursor := crSQLWait;

    if not(edtId.Text = EmptyStr) then
    begin
      if categoria.ValidaInsereCategoria(StrToInt(edtId.Text),edtCodigo.Text,edtNome.Text) then
        categoria.InsereCategoria(StrToInt(edtId.Text),edtCodigo.Text,edtNome.Text);
      AtualizaGrid;
    end
    else
    showmessage('Os campos não podem ficar vazios.');

    //liberando da memoria
    categoria.Destroy;
    controle.Destroy;
    btnSalvar.Cursor := crDefault;
end;

procedure TFrmCategoria.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TFrmCategoria.FormShow(Sender: TObject);
begin
    AtualizaGrid;
end;

function TFrmCategoria.getIdView: integer;
begin
    result:= DBGrid1.Columns[0].Field.Value;
end;

procedure TFrmCategoria.LimpaCampos;
begin
    edtId.Text:= EmptyStr;
    edtNome.Text :=EmptyStr;
    edtCodigo.Text:= EmptyStr;
end;

function TFrmCategoria.RetornaRegistros: string;
begin
  lblRegistros.Caption:= '('+IntToStr(QueryGrid.RecordCount) + ') Categorias Cadastradas.';
end;

procedure TFrmCategoria.VerificaQuery;
begin
  btnDeletar.Enabled := not(QueryGrid.IsEmpty);
  btnAlterar.Enabled := not(QueryGrid.IsEmpty);
  btnSalvar.Enabled  := not(QueryGrid.IsEmpty);
end;

end.
