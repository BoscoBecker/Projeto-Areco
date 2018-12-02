unit TestUfProdutos;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, Vcl.Grids, ppParameter, ppCtrls, ppPrnabl, ppBands, System.SysUtils,
  UfProdutos, Vcl.Graphics, System.Classes, Ucontrole, Data.Win.ADODB, Winapi.Messages,
  ppReport, Uproduto, ppDB, Vcl.Controls, Vcl.Imaging.pngimage, Vcl.Dialogs, ppDBPipe,
  Data.DB, ppProd, ppComm, ppDesignLayer, System.Variants, ppCache, ppClass, ppRelatv,
  ppDBBDE, Vcl.ExtCtrls, Winapi.Windows, Vcl.DBGrids, Vcl.Forms, Vcl.StdCtrls, ppVar;

type
  // Test methods for class TFrmProduto

  TestTFrmProduto = class(TTestCase)
  strict private
    FFrmProduto: TFrmProduto;
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
    procedure TestFormCreate;
    procedure TestbtnImprimirClick;
  end;

implementation

procedure TestTFrmProduto.SetUp;
begin
  FFrmProduto := TFrmProduto.Create;
end;

procedure TestTFrmProduto.TearDown;
begin
  FFrmProduto.Free;
  FFrmProduto := nil;
end;

procedure TestTFrmProduto.TestbtnFecharClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FFrmProduto.btnFecharClick(Sender);
  // TODO: Validate method results
end;

procedure TestTFrmProduto.TestbtnAtualizaGridClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FFrmProduto.btnAtualizaGridClick(Sender);
  // TODO: Validate method results
end;

procedure TestTFrmProduto.TestbtnNovoClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FFrmProduto.btnNovoClick(Sender);
  // TODO: Validate method results
end;

procedure TestTFrmProduto.TestbtnAlterarClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FFrmProduto.btnAlterarClick(Sender);
  // TODO: Validate method results
end;

procedure TestTFrmProduto.TestbtnDeletarClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FFrmProduto.btnDeletarClick(Sender);
  // TODO: Validate method results
end;

procedure TestTFrmProduto.TestbtnSalvarClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FFrmProduto.btnSalvarClick(Sender);
  // TODO: Validate method results
end;

procedure TestTFrmProduto.TestFormShow;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FFrmProduto.FormShow(Sender);
  // TODO: Validate method results
end;

procedure TestTFrmProduto.TestFormCreate;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FFrmProduto.FormCreate(Sender);
  // TODO: Validate method results
end;

procedure TestTFrmProduto.TestbtnImprimirClick;
var
  Sender: TObject;
begin
  // TODO: Setup method call parameters
  FFrmProduto.btnImprimirClick(Sender);
  // TODO: Validate method results
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTFrmProduto.Suite);
end.

