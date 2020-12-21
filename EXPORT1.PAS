unit export1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  anograf, StdCtrls, Buttons, ExtCtrls, RXSpin;

type
  TFormExport1 = class(TFormAnograf)
    RadioGroup2: TRadioGroup;
    CheckBox1: TCheckBox;
    SpinEdit1: TRxSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormExport1: TFormExport1;

implementation

{$R *.DFM}

procedure TFormExport1.RadioGroup1Click(Sender: TObject);
begin
  inherited;
IF (RadioGroup1.ItemIndex = 1) then
RadioGroup2.Enabled := True else RadioGroup2.Enabled := False;
end;

procedure TFormExport1.RadioGroup2Click(Sender: TObject);
begin
  inherited;
IF (RadioGroup2.ItemIndex = 0) then
 CheckBox1.checked := True else CheckBox1.checked := False;
 CheckBox1.enabled :=  CheckBox1.checked;
end;

end.
