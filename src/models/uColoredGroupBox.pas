unit uColoredGroupBox;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Graphics, Types;

type
  TColoredGroupBox = class(TGroupBox)
  private
    FBorderColor: TColor;
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property BorderColor: TColor read FBorderColor write FBorderColor;
  end;

implementation

{ TColoredGroupBox }

constructor TColoredGroupBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBorderColor := clRed; // Cor padrão
end;

procedure TColoredGroupBox.Paint;
var
  R: TRect;
begin
  inherited Paint;

  R := ClientRect;
  R.Top := Canvas.TextHeight(Caption) div 2;

  Canvas.Brush.Style := bsClear;
  Canvas.Pen.Color := FBorderColor;
  Canvas.Pen.Width := 1;

  // Desenha borda retangular simples (sem canto arredondado)
  Canvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);

  // Redesenha o título por cima da borda
  Canvas.TextOut(8, 0, Caption);
end;

end.

