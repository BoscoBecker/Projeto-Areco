unit UfItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXMSSQL, Data.DB, Data.SqlExpr,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB,uControle,UItem, ppDB, ppCtrls, ppPrnabl, ppClass, ppBands,
  ppCache, ppDesignLayer, ppParameter, ppProd, ppReport, ppComm, ppRelatv,
  ppDBPipe, ppVar;

type
  TFrmItem = class(TForm)
    QueryGrid: TADOQuery;
    adoConexao: TADOConnection;
    dtsourceItem: TDataSource;
    ShapeFundo: TShape;
    gpBoxItems: TGroupBox;
    lblCodigo: TLabel;
    lblDescriao: TLabel;
    lblRegistros: TLabel;
    lblId: TLabel;
    edtId: TEdit;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    dbgridItems: TDBGrid;
    btnAtualizaGrid: TButton;
    btnAlterar: TButton;
    btnDeletar: TButton;
    btnSalvar: TButton;
    btnNovo: TButton;
    btnFechar: TButton;
    imgArecoItems: TImage;
    lblSlogan: TLabel;
    lblItem: TLabel;
    lblNome: TLabel;
    edtNome: TEdit;
    lbtitulo: TLabel;
    edtValorunit: TEdit;
    lçblVltUnit: TLabel;
    btnImprimir: TButton;
    ppDBPipelineItems: TppDBPipeline;
    reportItems: TppReport;
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
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    procedure btnFecharClick(Sender: TObject);
    procedure btnAtualizaGridClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  FrmItem: TFrmItem;

implementation

{$R *.dfm}

procedure TFrmItem.AtualizaGrid;
begin
    QueryGrid.Active := false;
    QueryGrid.Active := True;
    VerificaQuery;
    RetornaRegistros;
    LimpaCampos;
end;

procedure TFrmItem.btnAlterarClick(Sender: TObject);
var
  controle : TControle;
  item : TItem;
begin
    controle := TCOntrole.Create;
    controle.Create;

    item := TItem.Create(controle);

    if item.ValidaAlteraItem(StrToInt(edtId.Text),edtCodigo.Text,edtNome.Text,
                      edtDescricao.text ,StrToFloat(edtValorunit.text)) then
    begin
      item.AlteraItem(StrToInt(edtId.Text),getIdView, edtCodigo.Text,edtNome.Text,
                      edtDescricao.text ,StrToFloat(edtValorunit.text));
      AtualizaGrid;
    end
    else
      Application.MessageBox('O campo ID não podem ficar vazios.', 'Informção',MB_ICONINFORMATION+mb_ok);

    //liberando da memoria
    item.Destroy;
    controle.Destroy;
end;

procedure TFrmItem.btnAtualizaGridClick(Sender: TObject);
begin
  AtualizaGrid;
end;

procedure TFrmItem.btnDeletarClick(Sender: TObject);
var
  controle  : TControle;
  item      : TItem;
begin
    controle := TControle.Create;
    controle.Create;

    item := TItem.Create(controle);

    if item.ValidaExcluirItem(getIdView) then
    begin
      item.ExcluirItem(getIdView);
      AtualizaGrid;
    end
    else
    Application.MessageBox('O campo ID não podem ficar vazios.', 'Informção',MB_ICONINFORMATION+mb_ok);


    //liberando da memoria
    item.Destroy;
    controle.Destroy;
end;

procedure TFrmItem.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TFrmItem.btnImprimirClick(Sender: TObject);
begin
  reportItems.Print;
end;

procedure TFrmItem.btnNovoClick(Sender: TObject);
begin
  LimpaCampos();
  btnSalvar.Enabled := true;
end;

procedure TFrmItem.btnSalvarClick(Sender: TObject);
var
  controle  : TControle;
  item      : TItem;
begin
    controle := TControle.Create;
    controle.Create;
    item := TItem.Create(controle);

    btnSalvar.Cursor := crSQLWait;

    if not(edtId.Text = EmptyStr) then
    begin
      if item.ValidaInseriItem(StrToInt(edtId.Text),edtCodigo.Text,edtNome.Text,
                      edtDescricao.text ,StrToFloat(edtValorunit.text)) then
        item.InseriItem(StrToInt(edtId.Text),edtCodigo.Text,edtNome.Text,
                      edtDescricao.text ,StrToFloat(edtValorunit.text));
      AtualizaGrid;
    end
    else
    Application.MessageBox('Os campos não podem ficar vazios.', 'Informção',MB_ICONINFORMATION+mb_ok);
    //liberando da memoria
    item.Destroy;
    controle.Destroy;
    btnSalvar.Cursor := crDefault;

end;

procedure TFrmItem.FormShow(Sender: TObject);
begin

  AtualizaGrid;
end;

function TFrmItem.getIdView: integer;
begin
  result:= dbgridItems.Columns[0].Field.Value;
end;

procedure TFrmItem.LimpaCampos;
begin
    edtId.Text     := EmptyStr;
    edtNome.Text   :=EmptyStr;
    edtCodigo.Text := EmptyStr;
    edtNome.Text   := EmptyStr;
    edtDescricao.Text := EmptyStr;
    edtValorunit.Text := EmptyStr;
end;

function TFrmItem.RetornaRegistros: string;
begin
  lblRegistros.Caption:= '('+IntToStr(QueryGrid.RecordCount) + ') Items Cadastrados.';
end;

procedure TFrmItem.VerificaQuery;
begin
  btnDeletar.Enabled := not(QueryGrid.IsEmpty);
  btnAlterar.Enabled := not(QueryGrid.IsEmpty);
  btnSalvar.Enabled  := not(QueryGrid.IsEmpty);
  btnImprimir.Enabled  := not(QueryGrid.IsEmpty);
end;

end.
