unit UfCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uControle, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids,Ucategoria, Data.DB, Data.Win.ADODB, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, ppVar, ppCtrls, ppPrnabl, ppClass,
  ppBands, ppCache, ppDesignLayer, ppParameter, ppDB, ppProd, ppReport, ppComm,
  ppRelatv, ppDBPipe ;

type
  TFrmCategoria = class(TForm)
    lblCategoria: TLabel;
    QueryGrid: TADOQuery;
    adoConexao: TADOConnection;
    dtSourceCategoria: TDataSource;
    ShapeFundo: TShape;
    gpboxCat: TGroupBox;
    lblId: TLabel;
    edtId: TEdit;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    lblNome: TLabel;
    edtNome: TEdit;
    dbgridCategoria: TDBGrid;
    btnAtualizaGrid: TButton;
    btnAlterar: TButton;
    btnDeletar: TButton;
    btnSalvar: TButton;
    lblRegistros: TLabel;
    btnNovo: TButton;
    btnFechar: TButton;
    imgArecoCategorias: TImage;
    lblSlogan: TLabel;
    lblTitulo: TLabel;
    ppDBPipelineCategorias: TppDBPipeline;
    btnImprimir: TButton;
    reportCategorias: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAtualizaGridClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
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

    if categoria.ValidaAlteraCategoria(StrToInt(edtId.Text),edtCodigo.Text,edtNome.Text) then
    begin
      categoria.AlteraCategoria(StrToInt(edtId.Text),edtCodigo.Text,edtNome.Text);
      AtualizaGrid;
    end
    else
    Application.MessageBox('O campo ID não podem ficar vazios.', 'Informção',MB_ICONINFORMATION+mb_ok);


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
    Application.MessageBox('O campo ID não podem ficar vazios.', 'Informção',MB_ICONINFORMATION+mb_ok);


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
    Application.MessageBox('Os campos não podem ficar vazios.', 'Informção',MB_ICONINFORMATION+mb_ok);


    //liberando da memoria
    categoria.Destroy;
    controle.Destroy;
    btnSalvar.Cursor := crDefault;
end;

procedure TFrmCategoria.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TFrmCategoria.btnImprimirClick(Sender: TObject);
begin
  reportCategorias.Print;
end;

procedure TFrmCategoria.FormShow(Sender: TObject);
begin
    AtualizaGrid;
end;

function TFrmCategoria.getIdView: integer;
begin
    result:= dbgridCategoria.Columns[0].Field.Value;
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
