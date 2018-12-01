unit UfMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DBXMSSQL, Data.DB,
  Data.SqlExpr, Vcl.StdCtrls, uControle, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TFrmMenu = class(TForm)
    MainMenu1: TMainMenu;
    Sobre1: TMenuItem;
    Produtos: TMenuItem;
    Servio1: TMenuItem;
    Categoria1: TMenuItem;
    Item1: TMenuItem;
    Image1: TImage;
    Shape1: TShape;
    Sair1: TMenuItem;
    StatusBar1: TStatusBar;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Categoria1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure ProdutosClick(Sender: TObject);
    procedure Servio1Click(Sender: TObject);
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

procedure TFrmMenu.Categoria1Click(Sender: TObject);
var FrmCategoria : TFrmCategoria;
begin
 FrmCategoria := TFrmCategoria.create(self);
 FrmCategoria.Showmodal;
end;

procedure TFrmMenu.ProdutosClick(Sender: TObject);
begin
 FrmProduto := TFrmProduto.create(self);
 FrmProduto.Showmodal;
end;

procedure TFrmMenu.Sair1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMenu.Servio1Click(Sender: TObject);
begin
 FrmServico := TFrmServico.create(self);
 FrmServico.Showmodal;
end;

end.
