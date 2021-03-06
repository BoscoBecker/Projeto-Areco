program Projeto_Areco;

uses
  Vcl.Forms,
  SysUtils,
  Vcl.Graphics,
  UConexao in 'classes\UConexao.pas',
  Ucontrole in 'classes\Ucontrole.pas',
  UCategoria in 'classes\UCategoria.pas',
  UServico in 'classes\UServico.pas',
  UProduto in 'classes\UProduto.pas',
  UfCategoria in 'forms\UfCategoria.pas' {FrmCategoria},
  UfProdutos in 'forms\UfProdutos.pas' {FrmProduto},
  UFServico in 'forms\UFServico.pas' {FrmServico},
  UFSplash in 'forms\UFSplash.pas' {FrmSplash},
  UItem in 'classes\UItem.pas' {/UfItem in 'forms\UfItem.pas' {FrmItem},
  UfItem in 'forms\UfItem.pas' {FrmItem},
  UfMenu in 'forms\UfMenu.pas' {FrmMenu};


{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmSplash, FrmSplash);
  Application.CreateForm(TFrmItem, FrmItem);
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.CreateForm(TFrmItem, FrmItem);
  FrmSplash.Show;

  Application.BringToFront;
  FrmSplash.Repaint;
  FrmSplash.pnlOperacional.Visible := True;
  FrmSplash.Repaint;
  Application.ProcessMessages;

  Sleep(2000);
  FrmSplash.pnlImagemGestor.Visible := True;
  FrmSplash.pnlOperacional.Visible := False;
  FrmSplash.Repaint;
  FrmSplash.lblGestor.Caption:=  'O bom Gestor Sabe o que perguntar.';
  FrmSplash.lblGestor.Repaint;
  FrmSplash.Repaint;
  Sleep(900);

  Application.ProcessMessages;
  FrmSplash.lblGestor.Caption:=  'O bom Gestor Sabe o que perguntar..';
  FrmSplash.lblGestor.Repaint;
  FrmSplash.Repaint;
  Sleep(900);

  Application.ProcessMessages;
  FrmSplash.lblGestor.Caption:=  'O bom Gestor Sabe o que perguntar...';
  FrmSplash.lblGestor.Repaint;
  FrmSplash.Repaint;
  Sleep(900);

  FrmSplash.lblGestor.Caption := 'H� 30 anos n�s respondemos...';
  FrmSplash.lblGestor.Repaint;
  FrmSplash.Repaint;
  Sleep(2500);

  FrmSplash.Free;
  FrmSplash := Nil;

  Application.CreateForm(TFrmMenu, FrmMenu);
  FrmMenu.ShowModal;
  FrmMenu.Refresh;
  Application.Run;
end.
