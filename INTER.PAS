unit inter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, hcommon, Hresize, Buttons, ExtCtrls, RXClock, RXCtrls,
  ShellAPI, jws99;

type
  TFormInter = class(TForm)
    TextListBox1: TTextListBox;
    RxClock1: TRxClock;
    BitBtn1: TBitBtn;
    hgResizer1: ThgResizer;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TextListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormInter: TFormInter;
  SearchRec: TSearchRec;

implementation

{$R *.DFM}

procedure TFormInter.BitBtn1Click(Sender: TObject);
begin
Close;
end;

procedure TFormInter.FormCreate(Sender: TObject);
begin
TextListBox1.Items.Clear;
  FindFirst(AppPath(0)+'inter\*.htm', faAnyFile, SearchRec);
//  FindFirst('\uzi\inter\*.htm', faAnyFile, SearchRec);
  TextListBox1.Items.Add(SearchRec.Name);

  while (FindNext(SearchRec) = 0) do
      begin
      TextListBox1.Items.Add(SearchRec.Name);
      end;

    FindClose(SearchRec);
end;

procedure TFormInter.TextListBox1DblClick(Sender: TObject);
var PcharArj: Array[0..250] of char;
    stringArj : string;
begin
StringArj:=
'C:\Program Files\Internet Explorer\iexplore -k '+
AppPath(0)+'INTER\'+TextListBox1.Items[TextListBox1.ItemIndex];
//showmessage(StringArj);
StrPCopy(PcharArj, StringArj);
    WinExec(PcharArj, SW_NORMAL);
//ShellExecute(Application.Handle,'open',PcharArj, nil, nil, 0);
end;

end.
