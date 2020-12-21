unit Psw2;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, Dialogs, SysUtils;

type
  TPDlg2 = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PDlg2: TPDlg2;

implementation

{$R *.DFM}
uses main1;

procedure TPDlg2.OKBtnClick(Sender: TObject);
begin
 IF (Password.Text = 'v33334') then  Moderator:='Admin' else
                                        Moderator:='User';
end;

procedure TPDlg2.CancelBtnClick(Sender: TObject);
begin
Close;
end;

procedure TPDlg2.FormActivate(Sender: TObject);
begin
Password.Text:='';
end;

end.

