{ QuickReport mailing labels form }

unit Qrorder2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, qrextra, DB, DBTables, ExtCtrls;

type
  TFormQReport2 = class(TQuickRep)
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    ChildBand1: TQRChildBand;
    QRImage1: TQRImage;
    DetailBand2: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    procedure FormQReportBeforePrint(Sender: TQuickRep;
      var PrintReport: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormQReport2: TFormQReport2;

implementation

uses export1;

{$R *.DFM}

procedure TFormQReport2.FormQReportBeforePrint(Sender: TQuickRep;
  var PrintReport: Boolean);
begin
IF FormExport1.CheckBox1.Checked  then
 if FileExists('detapro.bmp') then
 QRImage1.Picture.LoadFromFile('detapro.bmp');

 ChildBand1.Enabled:=FormExport1.CheckBox1.Checked;
end;

procedure TFormQReport2.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
ChildBand1.Height := QRImage1.Height+10;
end;

end.
