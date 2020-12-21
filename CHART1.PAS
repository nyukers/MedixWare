unit chart1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TMultiMP, ExtCtrls, TeEngine, Series, TeeProcs, Chart, DBCtrls,
  TDMULTIM, Db, DBTables, hcommon, Hresize, Buttons, jws99;

type
  TFormChart = class(TForm)
    hgResizer1: ThgResizer;
    Panel1: TPanel;
    Panel2: TPanel;
    PMultiMedia1: TPMultiMedia;
    Chart2: TChart;
    Series2: TLineSeries;
    Series4: TLineSeries;
    Panel3: TPanel;
    Chart1: TChart;
    Series1: TLineSeries;
    Series3: TLineSeries;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure PMultiMedia1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PMultiMedia1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Series1AfterDrawValues(Sender: TObject);
    procedure Chart2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    OldX,OldY:Longint;
    CrossHairColor:TColor;
    CrossHairStyle:TPenStyle;
  end;

var
  FormChart: TFormChart;

implementation

{$R *.DFM}

procedure TFormChart.FormCreate(Sender: TObject);
begin
    Series2.YValues.Order:=loAscending;
    Series2.XValues.Order:=loNone;
  Chart2.LeftAxis.Automatic:=True;
  Chart2.BottomAxis.Automatic:=True;
  OldX:=-1;                          { initialize variables }
  CrossHairColor:=clBlack;
  CrossHairStyle:=psSolid;
  Chart1.Cursor:=crCross;
end;

procedure TFormChart.PMultiMedia1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    Label3.Caption := 'Поточна: '+InttoStr(x)+' : '+InttoStr(y);
end;

procedure TFormChart.PMultiMedia1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var//    x1,y1,x2 :integer;
  y3,x3,x22: integer;
begin
{for x1:=0 to Image1.width-1 do
 for y1:=0 to Image1.height-1 do
 begin
 Image1.Canvas.pixels[x1,y1] := RGB(125, 250, 250);
 end;

 x1:=X;
 for y1:=0 to PMultiMedia1.height-1 do
 begin
 x2:=Round(PMultiMedia1.Canvas.Pixels[x1,y1]*Image1.Width/$00FFFFFF);
 Image1.Canvas.pixels[x2,y1] := RGB(125, 0, 250);
 end;
  for x1:=0 to Image1.Width-1 do
 begin
 Image1.Canvas.pixels[x1,Y] := RGB(125, 0, 250);
 end;
 }

 if Button = mbLeft then begin
  Series1.Clear;
  Series2.Clear;
  Series3.Clear;
  Series4.Clear;

 for y3:=0 to PMultiMedia1.height-1 do
 begin
 x22:=Round(PMultiMedia1.Canvas.Pixels[X,y3]*Chart2.Width/$00FFFFFF);
 Series2.AddXY(x22,y3,'',clTeeColor);
 end;

 for x3:=0 to PMultiMedia1.width-1 do
 begin
 x22:=Round(PMultiMedia1.Canvas.Pixels[X3,Y]*Chart1.Height/$00FFFFFF);
 Series1.AddXY(x3,x22,'',clTeeColor);
 end;

 //          100 - ???
 for x3:=0 to 100 do
 begin
  Series4.AddXY(x3,Y,'',clTeeColor);
  Series3.AddXY(X,x3,'',clTeeColor);
 end;

 end;

end;

procedure TFormChart.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  { This procedure draws the crosshair lines }
  Procedure DrawCross(AX,AY:Integer);
  begin
    With Chart1,Canvas do
    begin
      Pen.Color:=CrossHairColor;
      Pen.Style:=CrossHairStyle;
      Pen.Mode:=pmXor;
      Pen.Width:=1;
      MoveTo(ax,ChartRect.Top-Height3D);
      LineTo(ax,ChartRect.Bottom-Height3D);
      MoveTo(ChartRect.Left+Width3D,ay);
      LineTo(ChartRect.Right+Width3D,ay);
    end;
  end;

Var tmpX,tmpY:Double;
begin
  if (OldX<>-1) then
  begin
    DrawCross(OldX,OldY);  { draw old crosshair }
    OldX:=-1;
  end;

  { check if mouse is inside Chart rectangle }
  if PtInRect( Chart1.ChartRect, Point(X-Chart1.Width3D,Y+Chart1.Height3D)  ) then
  begin
    DrawCross(x,y);  { draw crosshair at current position }
    { store old position }
    OldX:=x;
    OldY:=y;
    { set label text }
    With Series1 do
    begin
      GetCursorValues(tmpX,tmpY);  { <-- get values under mouse cursor }
      Label1.Caption:='<H: '+GetVertAxis.LabelValue(Int(tmpX))+
                      ' : '+
                      GetHorizAxis.LabelValue(Int(tmpY));
    end;
  end;
end;

procedure TFormChart.Series1AfterDrawValues(Sender: TObject);
begin
  OldX:=-1;  { Reset old mouse position }
end;

procedure TFormChart.Chart2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  Procedure DrawCross(AX,AY:Integer);
  begin
    With Chart2,Canvas do
    begin
      Pen.Color:=CrossHairColor;
      Pen.Style:=CrossHairStyle;
      Pen.Mode:=pmXor;
      Pen.Width:=1;
      MoveTo(ax,ChartRect.Top-Height3D);
      LineTo(ax,ChartRect.Bottom-Height3D);
      MoveTo(ChartRect.Left+Width3D,ay);
      LineTo(ChartRect.Right+Width3D,ay);
    end;
  end;

Var tmpX,tmpY:Double;
begin
  if (OldX<>-1) then
  begin
    DrawCross(OldX,OldY);  { draw old crosshair }
    OldX:=-1;
  end;

  { check if mouse is inside Chart rectangle }
  if PtInRect( Chart2.ChartRect, Point(X-Chart2.Width3D,Y+Chart2.Height3D)  ) then
  begin
    DrawCross(x,y);  { draw crosshair at current position }
    { store old position }
    OldX:=x;
    OldY:=y;
    { set label text }
    With Series2 do
    begin
      GetCursorValues(tmpX,tmpY);  { <-- get values under mouse cursor }
      Label2.Caption:='V: '+GetVertAxis.LabelValue(Int(tmpX))+
                      ' : '+
                      GetHorizAxis.LabelValue(Int(tmpY));
    end;
  end;
end;

end.
