unit UfMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DBXMSSQL, Data.DB,
  Data.SqlExpr, Vcl.StdCtrls, uControle, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls,UfItem;

type
  TFrmMenu = class(TForm)
    MainMenu1: TMainMenu;
    itemSobre: TMenuItem;
    itemProdutos: TMenuItem;
    itemServicos: TMenuItem;
    itemCategoria: TMenuItem;
    itmItem: TMenuItem;
    Shape1: TShape;
    itemSair: TMenuItem;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    imgFundoTodo: TImage;
    imgArecoCentro: TImage;
    procedure Button1Click(Sender: TObject);
    procedure itemCategoriaClick(Sender: TObject);
    procedure itemSairClick(Sender: TObject);
    procedure itemProdutosClick(Sender: TObject);
    procedure itemServicosClick(Sender: TObject);
    procedure itmItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.dfm}

uses UfCategoria, UfProdutos, UFServico;

procedure TFrmMenu.Button1Click(Sender: TObject);
var
  controle : TControle;
begin
    controle := TControle.Create;
    controle.Create;
    controle.SqqGeral.Close;
    controle.SqqGeral.SQL.Clear;
    controle.SqqGeral.SQL.Add('select * from categoria');
    controle.SqqGeral.Open;
    controle.SqqGeral.Active := true;
end;

procedure TFrmMenu.itemCategoriaClick(Sender: TObject);
var FrmCategoria : TFrmCategoria;
begin
 FrmCategoria := TFrmCategoria.create(self);
 FrmCategoria.Showmodal;
end;

procedure TFrmMenu.itmItemClick(Sender: TObject);
begin
 FrmItem := TFrmItem.create(self);
 FrmItem.Showmodal;
end;

procedure TFrmMenu.itemProdutosClick(Sender: TObject);
begin
 FrmProduto := TFrmProduto.create(self);
 FrmProduto.Showmodal;
end;

procedure TFrmMenu.itemSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmMenu.itemServicosClick(Sender: TObject);
begin
 FrmServico := TFrmServico.create(self);
 FrmServico.Showmodal;
end;

end.
