unit select2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TFormSelectDovidBase = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    ListBox1: TListBox;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSelectDovidBase: TFormSelectDovidBase;

implementation

{$R *.DFM}

procedure TFormSelectDovidBase.FormActivate(Sender: TObject);
begin
ListBox1.SetFocus;
//keybd_Event(VK_DOWN, 0, 0, 0);
end;

end.
