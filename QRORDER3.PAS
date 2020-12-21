{ QuickReport mailing labels form }

unit Qrorder3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, qrextra, DB, DBTables, ExtCtrls,
  StdCtrls, mask;

type
  TFormQReport3 = class(TQuickRep)
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
    procedure FreeLabels;
  private
    { Private declarations }
  public
    { Public declarations }
    RowCounter, MaxCols: integer;
//    ColumnLabels: array[0..199] of TQRLabel;
    DataLabels: array[0..199] of TQRLabel;
    SafeToRun : boolean;
  end;

var
  FormQReport3: TFormQReport3;

implementation

uses export1, protocol;

{$R *.DFM}

procedure TFormQReport3.FormQReportBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
IF FormExport1.CheckBox1.Checked  then
 if FileExists('detapro.bmp') then
 QRImage1.Picture.LoadFromFile('detapro.bmp');

 ChildBand1.Enabled:=FormExport1.CheckBox1.Checked;
 RowCounter := 0;
end;

procedure TFormQReport3.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
ChildBand1.Height := QRImage1.Height+10;
end;

procedure TFormQReport3.CreateLabels;
var
   i, nIdx, pIdx: integer;
   FromTop, FromLeft: integer;
begin
      pIdx := 0;
      FromTop := 10;
      FromLeft := 20;

for i:=0 to 25 do
// на 25 єлементов !!!
for nIdx:=0 to FormProtocol.ComponentCount - 1 do
{case FormProtocol.Components[nIdx].Tag of
4: begin
{ if ((FormProtocol.Components[nIdx] is TLabel) or
     (FormProtocol.Components[nIdx] is TEdit) or
     (FormProtocol.Components[nIdx] is TComboBox) or
     (FormProtocol.Components[nIdx] is TMaskEdit))
 then}

IF (4 = StrToIntDef(Copy(FormProtocol.Components[nIdx].Name,2,1), -1) ) then
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

          Top := FromTop;
          Left := FromLeft;

   FromLeft:=FromLeft + DataLabels[pIdx].Width + 20;
 IF ((FromLeft + FormExport1.SpinEdit1.Value) >= DetailBand2.Width) then
    // переход на новую строку по превішению длині строки
    begin
    FromLeft:=10;
    FromTop := FromTop + 15;
    end;

      end;
   Inc(pIdx);
       end;
//        end;
//end;//of

SafeToRun := True;
end;

procedure TFormQReport3.FreeLabels;
var
  nIdx: integer;
begin
  // Set the flag to false as this report will no longer be able to run.
  SafeToRun := false;
  for nIdx := 0 to 199 do
  begin
    if DataLabels[nIdx] <> nil then
    begin
      DataLabels[nIdx].Free;
      DataLabels[nIdx] := nil;
    end;
  end;
end;



end.
