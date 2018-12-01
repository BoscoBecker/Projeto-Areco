unit UfItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXMSSQL, Data.DB, Data.SqlExpr,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB;

type
  TFrmItem = class(TForm)
    Label1: TLabel;
    QueryGrid: TADOQuery;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ShapeFundo: TShape;
    GroupBox1: TGroupBox;
    lblCodigo: TLabel;
    lblNome: TLabel;
    lblRegistros: TLabel;
    lblId: TLabel;
    edtId: TEdit;
    edtCodigo: TEdit;
    edtNome: TEdit;
    DBGrid1: TDBGrid;
    btnAtualizaGrid: TButton;
    btnAlterar: TButton;
    btnDeletar: TButton;
    btnSalvar: TButton;
    btnNovo: TButton;
    btnFechar: TButton;
    Image2: TImage;
    Label6: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmItem: TFrmItem;

implementation

{$R *.dfm}

end.
