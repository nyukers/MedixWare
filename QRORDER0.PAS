{ QuickReport mailing labels form }

unit Qrorder0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, qrextra, DB, DBTables, ExtCtrls,
  StdCtrls, mask, ToolEdit;

type
  TFormQReport0 = class(TQuickRep)
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    ChildBand1: TQRChildBand;
    QRImage1: TQRImage;
    DetailBand2: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel10: TQRLabel;
    procedure FormQReportBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure CreateLabels;
  private
    { Private declarations }
  public
    { Public declarations }
    RowCounter, MaxCols: integer;
    DataLabels: array[0..199] of TQRLabel;
    SafeToRun : boolean;
  end;

var
  FormQReport0: TFormQReport0;

implementation

uses export1, protocol;

{$R *.DFM}

procedure TFormQReport0.FormQReportBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
IF FormExport1.CheckBox1.Checked  then
 if FileExists('detapro.bmp') then
 QRImage1.Picture.LoadFromFile('detapro.bmp');

 ChildBand1.Enabled:=FormExport1.CheckBox1.Checked;
end;

procedure TFormQReport0.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
ChildBand1.Height := QRImage1.Height+10;
end;

procedure TFormQReport0.CreateLabels;
var
   i, nIdx, pIdx: integer;
   FromTop, FromLeft: integer;
begin
      pIdx := 0;
      FromTop := 10;
      FromLeft := 20;
// на 200 єлементов !!!
for i:=0 to 199 do
for nIdx:=0 to FormProtocol.ComponentCount - 1 do

IF (1 = StrToIntDef(Copy(FormProtocol.Components[nIdx].Name,2,1), -1) ) then
IF (i = StrToIntDef(Copy(FormProtocol.Components[nIdx].Name,3,3), -1) ) then
 begin
        DataLabels[pIdx] := TQRLabel.Create(Self);
        with DataLabels[pIdx] do
        begin
          Alignment := taLeftJustify;
          Color := clWhite;
          Parent := DetailBand2;
          AlignToBand := False;
          Height := Parent.Height;
          Autosize := True;
          WordWrap := True;
if (FormProtocol.Components[nIdx] is TLabel) then
 begin
     Caption := (FormProtocol.Components[nIdx] as TLabel).Caption;
  if  ((FormProtocol.Components[nIdx] as TLabel).Font.Style =
       [fsBold, fsUnderline]) then
    begin
    // переход на новую строку по толстой метке
    FromLeft:=10;
    FromTop := FromTop + 15;
    end;
 end;
if (FormProtocol.Components[nIdx] is TEdit) then
     Caption := (FormProtocol.Components[nIdx] as TEdit).Text;
if (FormProtocol.Components[nIdx] is TComboBox) then
     Caption := (FormProtocol.Components[nIdx] as TComboBox).Text;
if (FormProtocol.Components[nIdx] is TMaskEdit) then
     Caption := (FormProtocol.Components[nIdx] as TMaskEdit).Text;
if (FormProtocol.Components[nIdx] is TDateEdit) then
     Caption := (FormProtocol.Components[nIdx] as TDateEdit).Text;
if (FormProtocol.Components[nIdx] is TMemo) then
     Caption := (FormProtocol.Components[nIdx] as TMemo).Text;


          Top := FromTop;
          Left := FromLeft;

   FromLeft:=FromLeft + DataLabels[pIdx].Width + 20;
   IF ((FromLeft + FormExport1.SpinEdit1.Value) >= DetailBand2.Width) then
// IF ((FromLeft + 250) >= DetailBand2.Width) then
    // переход на новую строку по превішению длині строки
    begin
    FromLeft:=10;
    FromTop := FromTop + 15;
    end;

      end;
   Inc(pIdx);
       end;

SafeToRun := True;
end;

end.
