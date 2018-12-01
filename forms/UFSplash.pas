unit UFSplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TFrmSplash = class(TForm)
    ShapeFundo: TShape;
    ImgAreco30Anos: TImage;
    lblSlogan: TLabel;
    pnlImagemGestor: TPanel;
    imgGestor: TImage;
    lblGestor: TLabel;
    pnlOperacional: TPanel;
    imgOperacional: TImage;
    lblArecoOperacional: TLabel;
  private

    { Private declarations }
    var VImagem: TBitmap;

  public
    { Public declarations }

  end;

var
  FrmSplash: TFrmSplash;

implementation

{$R *.dfm}

{ TFrmSplash }




end.
