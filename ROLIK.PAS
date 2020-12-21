unit rolik;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, RXSpin, Buttons, RxDBComb;

type
  TFormRolikParam = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    RxSpinEdit1: TRxSpinEdit;
    RxSpinEdit2: TRxSpinEdit;
    RxSpinEdit3: TRxSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    ComboBox2: TComboBox;
    Label7: TLabel;
    RxSpinEdit4: TRxSpinEdit;
    RxSpinEdit5: TRxSpinEdit;
    CheckBox2: TCheckBox;
    RxSpinEdit6: TRxSpinEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Bevel2: TBevel;
    ComboBox3: TRxDBComboBox;
    RG1: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure RxSpinEdit6Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRolikParam: TFormRolikParam;

implementation

{$R *.DFM}

procedure TFormRolikParam.FormCreate(Sender: TObject);
begin
ComboBox2.ItemIndex:=0;
ComboBox3.ItemIndex:=0;
end;

procedure TFormRolikParam.CheckBox1Click(Sender: TObject);
begin
IF CheckBox1.Checked then begin
RxSpinEdit1.Enabled:=True;
RxSpinEdit1.Color:=clWindow; end else begin
RxSpinEdit1.Enabled:=False;
RxSpinEdit1.Color:=clBtnFace;     end;
end;

procedure TFormRolikParam.ComboBox2Change(Sender: TObject);
begin
IF (ComboBox2.ItemIndex = 4) then begin
RxSpinEdit4.Enabled:=True;
RxSpinEdit4.Color:=clWindow; end else begin
RxSpinEdit4.Enabled:=False;
RxSpinEdit4.Color:=clBtnFace;
RxSpinEdit4.Value:= StrToInt(Copy(ComboBox2.Text,1,3));
RxSpinEdit5.Value:= StrToInt(Copy(ComboBox2.Text,7,3));
    end;

RxSpinEdit5.Enabled:=RxSpinEdit4.Enabled;
RxSpinEdit5.Color:=RxSpinEdit4.Color;
CheckBox2.Enabled:=RxSpinEdit4.Enabled;
//CheckBox2.Color:=RxSpinEdit4.Color;
end;

procedure TFormRolikParam.CheckBox2Click(Sender: TObject);
begin
IF CheckBox2.Checked then begin
RxSpinEdit6.Enabled:=True;
RxSpinEdit6.Color:=clWindow;
RxSpinEdit6Change(Sender);
                         end else begin
RxSpinEdit6.Enabled:=False;
RxSpinEdit6.Color:=clBtnFace;     end;
end;

procedure TFormRolikParam.RxSpinEdit6Change(Sender: TObject);
begin
RxSpinEdit5.Value:= Round(RxSpinEdit4.Value / RxSpinEdit6.Value);
end;

end.
