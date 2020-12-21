unit tobase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, hcommon, Htrakbar, Buttons,  Inifiles,
  DLL96V1, DLLsp96, TMultiP, ComCtrls, RXSlider, Mask, strutils, RXSpin;
  
type
  TFormFrame2Base = class(TForm)
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    GroupBox1: TGroupBox;
    hgTrackBar1: ThgTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    RadioGroup2: TRadioGroup;
    Label3: TLabel;
    PMultiImage1: TPMultiImage;
    Label4: TLabel;
    Image1: TImage;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    RxSlider1: TRxSlider;
    GroupBox3: TGroupBox;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    RadioGroup5: TRadioGroup;
    RadioGroup6: TRadioGroup;
    RadioGroup7: TRadioGroup;
    RadioGroup8: TRadioGroup;
    GroupBox4: TGroupBox;
    MaskEdit1: TMaskEdit;
    Label7: TLabel;
    RxSpinEdit1: TRxSpinEdit;
    RxSpinEdit2: TRxSpinEdit;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    procedure RadioGroup2Click(Sender: TObject);
    procedure PMultiImage1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PMultiImage1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PMultiImage1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PMultiImage1Paint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RxSlider1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
       MyRubberBand : TILRubberBand;
    procedure OnRubberband(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, XX, YY: Integer);
    procedure UpDateParameters;
  end;

var
  FormFrame2Base: TFormFrame2Base;
  xLeft, yTop, xxRight, yyBottom: integer;

implementation

{$R *.DFM}
uses image1, main1;

procedure TFormFrame2Base.RadioGroup2Click(Sender: TObject);
begin
case RadioGroup2.ItemIndex of
0: begin
  PMultiImage1.OnMouseDown:=nil;
  PMultiImage1.OnMouseMove:=nil;
  PMultiImage1.OnMouseUp:=nil;
  PMultiImage1.OnPaint:=nil;
   end;
1: begin
  PMultiImage1.OnMouseDown:=PMultiImage1MouseDown;
  PMultiImage1.OnMouseMove:=PMultiImage1MouseMove;
  PMultiImage1.OnMouseUp:=PMultiImage1MouseUp;
  PMultiImage1.OnPaint:=PMultiImage1Paint;
   end;
end;
end;

procedure TFormFrame2Base.OnRubberband(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, XX, YY: Integer);
begin
  Label4.Caption:='  x: ' + IntToStr(x)+
                  '  y: ' + IntToStr(y)+
                  '  xx: '+ IntToStr(xx)+
                  '  yy: '+ IntToStr(yy);
  Label5.Caption:='  x: ' + IntToStr(Round(x*3.4))+
                  '  y: ' + IntToStr(Round(y*3.4))+
                  '  xx: '+ IntToStr(Round(xx*3.4))+
                  '  yy: '+ IntToStr(Round(yy*3.4));
  xLeft:=Round(x*3.4);
  yTop:=Round(y*3.4);
  xxRight:=Round(xx*3.4);
  yyBottom:=Round(yy*3.4);
end;


procedure TFormFrame2Base.PMultiImage1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     if Assigned(MyRubberBand) then
      MyRubberBand.MouseDown(Button, Shift, X, Y);
end;

procedure TFormFrame2Base.PMultiImage1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
     if Assigned(MyRubberBand) then
      MyRubberBand.MouseMove(Shift, X, Y);
  Label6.Caption:='  x: ' + IntToStr(x)+
                  '  y: ' + IntToStr(y);

end;

procedure TFormFrame2Base.PMultiImage1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     if Assigned(MyRubberBand) then
      MyRubberBand.MouseUp(Button, Shift, X, Y);
end;

procedure TFormFrame2Base.PMultiImage1Paint(Sender: TObject);
begin
  if Assigned(MyRubberBand) then
    MyRubberBand.PaintRect;
end;

procedure TFormFrame2Base.FormCreate(Sender: TObject);
begin
 MyRubberBand:=TILRubberBand.Create(Self);
 with FormMain.FilterIni do begin
 MyRubberBand.DropRect(
 Round(ReadInteger('DOPLER_FRAME', 'Left', 75)/3.4),
 Round(ReadInteger('DOPLER_FRAME', 'Top',  15)/3.4),
 Round(ReadInteger('DOPLER_FRAME', 'Right', 435)/3.4),
 Round(ReadInteger('DOPLER_FRAME', 'Bottom', 315)/3.4)
                       );
 RxSlider1.Value := ReadInteger('DOPLER_FRAME', 'Brightness', 20);

 MyRubberBand.iParent:=PMultiImage1;
 MyRubberBand.OnRubberBand:=OnRubberband;

 IF (ReadString('DOPLER_FRAME', 'FormatInBase', 'JPEG') = 'JPEG')
 then  RadioGroup1.ItemIndex :=0;
 IF (ReadString('DOPLER_FRAME', 'FormatInBase', 'JPEG') = 'GIF')
 then  RadioGroup1.ItemIndex :=1;
 IF (ReadString('DOPLER_FRAME', 'FormatInBase', 'JPEG') = 'PCX')
 then  RadioGroup1.ItemIndex :=2;
 IF (ReadString('DOPLER_FRAME', 'FormatInBase', 'JPEG') = 'BMP')
 then  RadioGroup1.ItemIndex :=3;
 IF (ReadString('DOPLER_FRAME', 'FormatInBase', 'JPEG') = 'TIFF')
 then  RadioGroup1.ItemIndex :=4;
 IF (ReadString('DOPLER_FRAME', 'FormatInBase', 'JPEG') = 'DICOM')
 then  RadioGroup1.ItemIndex :=5;

IF (ReadString('DOPLER_FRAME', 'EmbeddedInBase', 'No')= 'No') then
 RadioGroup3.ItemIndex := 1 else  RadioGroup3.ItemIndex := 0;
IF (ReadString('DOPLER_FRAME', 'AnnotationInBase', 'No')= 'No') then
 RadioGroup4.ItemIndex := 1 else  RadioGroup4.ItemIndex := 0;
IF (ReadString('DOPLER_FRAME', 'AnnographicInBase', 'No')= 'No') then
 RadioGroup5.ItemIndex := 1 else  RadioGroup5.ItemIndex := 0;
IF (ReadString('PROTOCOL', 'ProtocolFluentInBase', 'No')= 'No') then
 RadioGroup6.ItemIndex := 1 else  RadioGroup6.ItemIndex := 0;
IF (ReadString('PROTOCOL', 'ProtocolDetailInBase', 'No')= 'No') then
 RadioGroup7.ItemIndex := 1 else  RadioGroup7.ItemIndex := 0;

 MaskEdit1.Text := ReadString('WEBLINK', 'TCPIP', '127.0.0.1'); 
   end;



 UpdateParameters;// обновить параметри
end;

procedure TFormFrame2Base.Button1Click(Sender: TObject);
begin
IF (RadioGroup2.ItemIndex = 1) then
  with FormMain.FilterIni do begin
IF ((xLeft = xxRight) or (yTop = yyBottom)) then
  begin
  xxRight := xLeft + 100;
  yyBottom := yTop + 100;
  Showmessage('Координати не визначено, беру початкові дані.');
  end;
WriteInteger('DOPLER_FRAME', 'Left', xLeft);
WriteInteger('DOPLER_FRAME', 'Top',  yTop);
WriteInteger('DOPLER_FRAME', 'Right', xxRight);
WriteInteger('DOPLER_FRAME', 'Bottom', yyBottom);
WriteString('DOPLER_FRAME', 'Frame', 'Yes');
   end else FormMain.FilterIni.WriteString('DOPLER_FRAME', 'Frame', 'No');
FormMain.FilterIni.WriteInteger('DOPLER_FRAME', 'Brightness', RxSlider1.Value);

IF (RadioGroup3.ItemIndex = 1) then
FormMain.FilterIni.WriteString('DOPLER_FRAME', 'EmbeddedInBase', 'No') else
FormMain.FilterIni.WriteString('DOPLER_FRAME', 'EmbeddedInBase', 'Yes');

IF (RadioGroup4.ItemIndex = 1) then
FormMain.FilterIni.WriteString('DOPLER_FRAME', 'AnnotationInBase', 'No') else
FormMain.FilterIni.WriteString('DOPLER_FRAME', 'AnnotationInBase', 'Yes');

IF (RadioGroup5.ItemIndex = 1) then
FormMain.FilterIni.WriteString('DOPLER_FRAME', 'AnnographicInBase', 'No') else
FormMain.FilterIni.WriteString('DOPLER_FRAME', 'AnnographicInBase', 'Yes');

IF (RadioGroup6.ItemIndex = 1) then
FormMain.FilterIni.WriteString('PROTOCOL', 'ProtocolFluentInBase', 'No') else
FormMain.FilterIni.WriteString('PROTOCOL', 'ProtocolFluentInBase', 'Yes');

IF (RadioGroup7.ItemIndex = 1) then
FormMain.FilterIni.WriteString('PROTOCOL', 'ProtocolDetailInBase', 'No') else
FormMain.FilterIni.WriteString('PROTOCOL', 'ProtocolDetailInBase', 'Yes');

 case RadioGroup1.ItemIndex of
 0:  FormMain.FilterIni.WriteString('DOPLER_FRAME', 'FormatInBase', 'JPEG');
 1:  FormMain.FilterIni.WriteString('DOPLER_FRAME', 'FormatInBase', 'GIF');
 2:  FormMain.FilterIni.WriteString('DOPLER_FRAME', 'FormatInBase', 'PCX');
 3:  FormMain.FilterIni.WriteString('DOPLER_FRAME', 'FormatInBase', 'BMP');
 4:  FormMain.FilterIni.WriteString('DOPLER_FRAME', 'FormatInBase', 'TIFF');
 5:  FormMain.FilterIni.WriteString('DOPLER_FRAME', 'FormatInBase', 'DICOM');
 end;//of

FormMain.FilterIni.WriteString('WEBLINK', 'TCPIP', DelSpace(MaskEdit1.Text));

 UpdateParameters;// обновить параметри
end;

procedure TFormFrame2Base.RxSlider1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
PMultiImage1.UndoImage;
PMultiImage1.SetBright( RxSlider1.Value);
end;

procedure TFormFrame2Base.FormActivate(Sender: TObject);
begin
 PMultiImage1.SetBright(RxSlider1.Value);
end;

procedure TFormFrame2Base.UpDateParameters;
begin
 case RadioGroup1.ItemIndex of
 0: FormatInBase := 'JPEG';
 1: FormatInBase := 'GIF';
 2: FormatInBase := 'PCX';
 3: FormatInBase := 'BMP';
 4: FormatInBase := 'TIFF';
 5: FormatInBase := 'DICOM';
 end;//of

 case RadioGroup3.ItemIndex of
 0: EmbeddedInBase := 'No';
 1: EmbeddedInBase := 'Yes';
 end;//of

 case RadioGroup4.ItemIndex of
 0: AnnotationInBase := 'No';
 1: AnnotationInBase := 'Yes';
 end;//of

 case RadioGroup5.ItemIndex of
 0: AnnographicInBase := 'No';
 1: AnnographicInBase := 'Yes';
 end;//of

 case RadioGroup6.ItemIndex of
 0: ProtocolFluentInBase := 'No';
 1: ProtocolFluentInBase := 'Yes';
 end;//of

case RadioGroup7.ItemIndex of
 0: ProtocolDetailInBase := 'No';
 1: ProtocolDetailInBase := 'Yes';
 end;//of


end;

end.
