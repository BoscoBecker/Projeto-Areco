unit TestUFServico;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, Vcl.Grids, ppParameter, ppVar, ppPrnabl, ppBands, System.SysUtils,
  Vcl.Graphics, System.Classes, Ucontrole, Data.Win.ADODB, Winapi.Messages, Uservico,
  ppReport, Vcl.ExtCtrls, ppDB, Vcl.Controls, Vcl.Imaging.pngimage, Vcl.Dialogs, ppDBPipe,
  Data.DB, ppProd, ppComm, ppDesignLayer, System.Variants, ppCache, UFServico, ppClass,
  ppRelatv, Winapi.Windows, Vcl.DBGrids, Vcl.Forms, Vcl.StdCtrls, ppCtrls;

type
  // Test methods for class TFrmServico

  TestTFrmServico = class(TTestCase)
  strict private
    FFrmServico: TFrmServico;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestbtnFecharClick;
    procedure TestbtnAtualizaGridClick;
    procedure TestbtnNovoClick;
    procedure TestbtnAlterarClick;
    procedure TestbtnDeletarClick;
    procedure TestbtnSalvarClick;
    procedure TestFormShow;
    procedure TestbtnImprimirClick;
  end;

implementation

procedure TestTFrmServico.SetUp;
begin
  FFrmServico := TFrmServico.Create;
end;

procedure TestTFrmServico.TearDown;
begin
  FFrmServico.Free;
  FFrmServico := nil;
end;

procedure TestTFrmServico.TestbtnFecharClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FFrmServico.btnFecharClick(Sender);
  // TODO: Validate method results
end;

procedure TestTFrmServico.TestbtnAtualizaGridClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FFrmServico.btnAtualizaGridClick(Sender);
  // TODO: Validate method results
end;

procedure TestTFrmServico.TestbtnNovoClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FFrmServico.btnNovoClick(Sender);
  // TODO: Validate method results
end;

procedure TestTFrmServico.TestbtnAlterarClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FFrmServico.btnAlterarClick(Sender);
  // TODO: Validate method results
end;

procedure TestTFrmServico.TestbtnDeletarClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FFrmServico.btnDeletarClick(Sender);
  // TODO: Validate method results
end;

procedure TestTFrmServico.TestbtnSalvarClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FFrmServico.btnSalvarClick(Sender);
  // TODO: Validate method results
end;

procedure TestTFrmServico.TestFormShow;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FFrmServico.FormShow(Sender);
  // TODO: Validate method results
end;

procedure TestTFrmServico.TestbtnImprimirClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FFrmServico.btnImprimirClick(Sender);
  // TODO: Validate method results
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTFrmServico.Suite);
end.
