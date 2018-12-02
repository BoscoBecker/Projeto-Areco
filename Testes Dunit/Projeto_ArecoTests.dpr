program Projeto_ArecoTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  TestFramework,
  GUITestRunner,
  TextTestRunner,
  TestUfCategoria in 'TestUfCategoria.pas',
  UfCategoria in '..\forms\UfCategoria.pas',
  TestUfItem in 'TestUfItem.pas',
  UfItem in '..\forms\UfItem.pas',
  TestUfProdutos in 'TestUfProdutos.pas',
  UfProdutos in '..\forms\UfProdutos.pas',
  TestUFServico in 'TestUFServico.pas',
  UFServico in '..\forms\UFServico.pas';

{$R *.RES}

begin
  Application.Initialize;
  if IsConsole then
    with TextTestRunner.RunRegisteredTests do
      Free
  else
    GUITestRunner.RunRegisteredTests;
end.

