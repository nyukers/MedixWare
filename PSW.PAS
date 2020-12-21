unit Psw;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, Dialogs, SysUtils, jws99;

type
  TPDlg = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PDlg: TPDlg;

implementation

{$R *.DFM}
uses about, main1;

procedure TPDlg.OKBtnClick(Sender: TObject);
var dcc: hdc;
 Biti, Horres, Verres: integer;
begin
IF ((Password.Text = 'vferebnf') or (Password.Text = ''))
    THEN
 BEGIN
 dcc:=GetDC(0);
 Biti:= GetDeviceCaps(dcc, BITSPIXEL);
 Horres:= GetDeviceCaps(dcc, HORZRES);
 Verres:= GetDeviceCaps(dcc, VERTRES);

// проверка разрешения екрана, в некоторіх случаях видео не хочет работать (
 IF
  ((Biti < 8) or (Biti > 16) or
   (Horres < 640) or (Verres < 480)) then begin
 MessageDlg('У встановленому режимі екрану при роботі з АРМом можливі помилки.'+
 ' Оптимальний режим 800х600хHighColor (16 digits). Потрібне втручання спеціаліста.',
  mtWarning, [mbCancel], 0);
                     Exit;                end
  else
  IF (Password.Text = 'vfhwew') then  Moderator:='Admin' else
                                         Moderator:='User';

 Hide;

   AboutBox := TAboutBox.Create(Application);
   AboutBox.Show;
   AboutBox.Update;

  Application.CreateForm(TFormMain, FormMain);
  AboutBox.Hide;

 FormMain.ShowModal;
 FormMain.Free;
    AboutBox.Free;
 Close;
 END
   ELSE
    BEGIN
    Password.Text := '';
  MessageDlg(' Ми не знайомі ?', mtWarning, [mbCancel], 0);
  Password.SetFocus;
    END;

end;

procedure TPDlg.CancelBtnClick(Sender: TObject);
begin
Close;
end;

procedure TPDlg.FormCreate(Sender: TObject);
begin
// if HPrevInst > 0 then Application.Terminate;
 AppSingle;
end;

end.

