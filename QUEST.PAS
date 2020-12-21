unit quest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, Db, DBTables, RxQuery, Grids, DBGrids, RXDBCtrl,
  Buttons;

type
  TFormQuest = class(TForm)
    ComboEdit1: TComboEdit;
    RxDBGrid1: TRxDBGrid;
    RxQuery1: TRxQuery;
    DataSource1: TDataSource;
    RxQuery1PIB: TStringField;
    RxQuery1SEX: TStringField;
    RxQuery1BIRTH: TSmallintField;
    RxQuery1DATEIN: TDateField;
    RxQuery1PIBID: TFloatField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure ComboEdit1ButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ComboEdit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormQuest: TFormQuest;

implementation

{$R *.DFM}
uses data, jws99;

procedure TFormQuest.ComboEdit1ButtonClick(Sender: TObject);
begin
RxQuery1.Close;
RxQuery1.MacroByName('Tab').AsString :=
  ''''+UpCaseWinStr(ComboEdit1.Text)+'%'+'''';
RxQuery1.Prepare;
RxQuery1.Open;
IF (RxDBGrid1.Visible = False) then
 begin FormQuest.Height := 235;
       RxDBGrid1.Visible := True;
 end;
end;

procedure TFormQuest.Button1Click(Sender: TObject);
begin
//showmessage(inttostr(RxQuery1.Fields[0].AsInteger));
end;

procedure TFormQuest.FormKeyPress(Sender: TObject; var Key: Char);
begin
case Key of
#13: begin
//     TDBEdit(ActiveControl).Color:=clWindow;
       SelectNext(ActiveControl as tWinControl, True, True );
       Key := #0;
//     TDBEdit(ActiveControl).Color:=clAqua;
     end;
'³': Key :='i';
'²': Key:='I';
 end;//of

end;

procedure TFormQuest.FormShow(Sender: TObject);
begin
ComboEdit1.SetFocus;
ComboEdit1.Text:='';
end;

procedure TFormQuest.ComboEdit1Exit(Sender: TObject);
begin
IF  RxQuery1.Active then
IF (RxQuery1.RecordCount = 0) then BitBtn1.TabStop:=False
                        else BitBtn1.TabStop:=True;
end;

end.
