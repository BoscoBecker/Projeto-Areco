unit UFServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, Data.Win.ADODB,Ucontrole,Uservico,
  ppBands, ppCache, ppClass, ppDB, ppDesignLayer, ppParameter, ppProd, ppReport,
  ppComm, ppRelatv, ppDBPipe, ppVar, ppCtrls, ppPrnabl;

type
  TFrmServico = class(TForm)
    lblServico: TLabel;
    QueryGrid: TADOQuery;
    adoConexao: TADOConnection;
    dtSourceServicos: TDataSource;
    ShapeFundo: TShape;
    gpBoxServicos: TGroupBox;
    lblRegistros: TLabel;
    lblcodigo: TLabel;
    dbGridServico: TDBGrid;
    btnAtualizaGrid: TButton;
    btnAlterar: TButton;
    btnDeletar: TButton;
    btnSalvar: TButton;
    btnNovo: TButton;
    edtCodigoServ: TEdit;
    btnFechar: TButton;
    imgArecoServiços: TImage;
    lblSlogan: TLabel;
    lblTitulo: TLabel;
    btnImprimir: TButton;
    ppDBPipeline1: TppDBPipeline;
    ppReportServiços: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    procedure btnFecharClick(Sender: TObject);
    procedure btnAtualizaGridClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  FrmServico: TFrmServico;

implementation

{$R *.dfm}

procedure TFrmServico.AtualizaGrid;
begin
    QueryGrid.Active := false;
    QueryGrid.Active := True;
    VerificaQuery;
    RetornaRegistros;
    LimpaCampos();
end;

procedure TFrmServico.btnAlterarClick(Sender: TObject);
var
  controle : TControle;
  servico  : TServico;
begin
    controle := TControle.Create;
    controle.Create;

    if (edtCodigoServ.Text = EmptyStr) then
    begin
      showmessage('O campo ID não podem ficar vazios.');
      exit;
    end;

    servico := Tservico.Create(controle);
    if (servico.ValidaAlteraServico(StrToInt(edtCodigoServ.Text))) then
    begin
      servico.AlteraServico(getIdView,StrToInt(edtCodigoServ.Text));
      AtualizaGrid;
    end
    else
      showmessage('O campo ID não podem ficar vazios.');

    //liberando da memoria
    servico.Destroy;
    controle.Destroy;
end;

procedure TFrmServico.btnAtualizaGridClick(Sender: TObject);
begin
    AtualizaGrid;
end;

procedure TFrmServico.btnDeletarClick(Sender: TObject);
var
  controle : TControle;
  servico  : TServico;
begin
    controle := TControle.Create;
    controle.Create;

    servico := Tservico.Create(controle);
    if (servico.ValidaExcluirServico(getIdView) ) then
    begin
      servico.ExcluirServico(getIdView);
      AtualizaGrid;
    end
    else
      showmessage('O campo ID não podem ficar vazios.');

    //liberando da memoria
    servico.Destroy;
    controle.Destroy;
end;

procedure TFrmServico.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrClose;
end;

procedure TFrmServico.btnImprimirClick(Sender: TObject);
begin
  ppReportServiços.Print;
end;

procedure TFrmServico.btnNovoClick(Sender: TObject);
begin
    LimpaCampos();
    btnSalvar.Enabled := true;
end;

procedure TFrmServico.btnSalvarClick(Sender: TObject);
var
  controle : TControle;
  servico  : TServico;
begin
    controle := TControle.Create;
    controle.Create;

    if (edtCodigoServ.Text = EmptyStr) then
    begin
     showmessage('O campo ID não podem ficar vazios.');
     exit;
    end;

   servico := Tservico.Create(controle);
    if (servico.ValidaInseriServico(StrToInt(edtCodigoServ.Text))) then
    begin
      servico.InseriServico(StrToInt(edtCodigoServ.Text));
      AtualizaGrid;
    end
    else
      showmessage('O campo ID não podem ficar vazios.');

    //liberando da memoria
    servico.Destroy;
    controle.Destroy;
end;

procedure TFrmServico.FormShow(Sender: TObject);
begin
    AtualizaGrid;
end;

function TFrmServico.getIdView: integer;
begin
  result:= dbGridServico.Columns[0].Field.Value;
end;

procedure TFrmServico.LimpaCampos;
begin
  edtCodigoServ.Text:= EmptyStr;
end;

function TFrmServico.RetornaRegistros: string;
begin
    lblRegistros.Caption:= '('+IntToStr(QueryGrid.RecordCount) + ') Serviços Cadastrados.';
end;

procedure TFrmServico.VerificaQuery;
begin
  btnDeletar.Enabled := not(QueryGrid.IsEmpty);
  btnAlterar.Enabled := not(QueryGrid.IsEmpty);
  btnSalvar.Enabled  := not(QueryGrid.IsEmpty)
end;

end.
