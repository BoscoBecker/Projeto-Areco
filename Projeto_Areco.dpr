program Projeto_Areco;

uses
  Vcl.Forms,
  SysUtils,
  Vcl.Graphics,
  UConexao in 'classes\UConexao.pas',
  UfMenu in 'forms\UfMenu.pas' {FrmMenu},
  Ucontrole in 'classes\Ucontrole.pas',
  UCategoria in 'classes\UCategoria.pas',
  UServico in 'classes\UServico.pas',
  UProduto in 'classes\UProduto.pas',
  UfCategoria in 'forms\UfCategoria.pas' {FrmCategoria},
  UfProdutos in 'forms\UfProdutos.pas' {FrmProduto},
  UFServico in 'forms\UFServico.pas' {FrmServico},
  UFSplash in 'forms\UFSplash.pas' {FrmSplash},
  UItem in 'classes\UItem.pas';

var VImagem: TBitmap;


{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmSplash, FrmSplash);
  FrmSplash.Show; //chama o formul�rio
  FrmSplash.Refresh; //atualiza
  Application.ProcessMessages;
  Application.BringToFront;

  //Sleep(4000); //tempo de exibi��o da tela
  //FrmSplash.pnlOperacional.Visible := true;
  FrmSplash.Repaint;
  Sleep(4000); //tempo de exibi��o da tela
  FrmSplash.pnlOperacional.Visible := False;
  FrmSplash.pnlImagemGestor.Visible := true;
  FrmSplash.Repaint;
  Sleep(3000); //tempo de exibi��o da tela
  FrmSplash.lblGestor.Caption := 'H� 30 anos n�s respondemos...';
  FrmSplash.lblGestor.Repaint;
  FrmSplash.Repaint;
  Sleep(4000); //tempo de exibi��o da tela

  FrmSplash.Free; //ou Nomedoform.Release // libera da mem�ria
  FrmSplash := Nil; //inutiliza a a��o do ponteiro do mouse

  Application.CreateForm(TFrmMenu, FrmMenu);
  FrmMenu.ShowMODAL; //chama o formul�rio
  FrmMenu.Refresh;
  Application.Run;
end.
