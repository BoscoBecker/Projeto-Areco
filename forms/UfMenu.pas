unit UfMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DBXMSSQL, Data.DB,
  Data.SqlExpr, Vcl.StdCtrls, uControle, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls,UfItem,ShellApi ;

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
    procedure itemCategoriaClick(Sender: TObject);
    procedure itemSairClick(Sender: TObject);
    procedure itemProdutosClick(Sender: TObject);
    procedure itemServicosClick(Sender: TObject);
    procedure itmItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure itemSobreClick(Sender: TObject);
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

procedure TFrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (Application.MessageBox('Deseja sair do aplicativo ?','Sair', MB_ICONINFORMATION+MB_YESNO)= ID_YES ) then
    Application.Terminate
  else
  Action := caNone;
end;

procedure TFrmMenu.FormShow(Sender: TObject);
begin
 Statusbar1.Panels [0].Text := FormatDateTime('dddd","dd" de "mmmm" de "yyyy',now);
 Statusbar1.Panels [2].Text := 'Hora: ' + FormatDateTime('hh:mm:ss',now);
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
  if (Application.MessageBox('Deseja sair do aplicativo ?','Sair', MB_ICONINFORMATION+MB_YESNO)= ID_YES ) then
  begin
    Application.Terminate;
  end;
end;

procedure TFrmMenu.itemServicosClick(Sender: TObject);
begin
 FrmServico := TFrmServico.create(self);
 FrmServico.Showmodal;
end;

procedure TFrmMenu.itemSobreClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.areco.com.br/', '', '', 1);
end;

end.
