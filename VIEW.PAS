unit view;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, Grids, DBGrids, RXDBCtrl, ExtCtrls,
  BDEUtils, dbiProcs, dbiTypes, db, DBVrtNav, hcommon, Hresize, DBIndex,
  DBTables, RxQuery;

type
  TFormView = class(TForm)
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    CheckBox1: TCheckBox;
    BitBtn1: TBitBtn;
    ScrollBox1: TScrollBox;
    Label5: TLabel;
    Label6: TLabel;
    RxDBGrid4: TRxDBGrid;
    RxDBGrid5: TRxDBGrid;
    Label1: TLabel;
    Label4: TLabel;
    RxDBGrid3: TRxDBGrid;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    Label2: TLabel;
    DBNavigator1: TDBVertNavigator;
    hgResizer1: ThgResizer;
    DBIndexCombo1: TDBIndexCombo;
    Label7: TLabel;
    RxQuery1: TRxQuery;
    BitBtn6: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure RxDBGrid2Enter(Sender: TObject);
    procedure RxDBGrid1Enter(Sender: TObject);
    procedure RxDBGrid3Enter(Sender: TObject);
    procedure RxDBGrid4Enter(Sender: TObject);
    procedure RxDBGrid5Enter(Sender: TObject);
    procedure DBMemo1Enter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormView: TFormView;

implementation

{$R *.DFM}
uses data, select, main1;

procedure TFormView.BitBtn1Click(Sender: TObject);
begin
Close;
end;

procedure TFormView.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
IF((Sender as TrxDBGrid).DataSource.DataSet.
FieldByName('Q').AsString = 'DEL') then
begin
Background:= clMenu;
AFont.Style := [fsBold];
     end;
IF(Copy(Field.FieldName,Length(Field.FieldName)-1,2) ='ID') then
Background:= clSilver;
//clAqua;

end;

procedure TFormView.BitBtn2Click(Sender: TObject);
begin
IF (DataModule1.TablePibQ.Visible=True) then begin
  BitBtn2.Caption:='Показати';
  DataModule1.TablePibQ.Visible:=False;
  dbiSetProp(hDBIObj(DataModule1.TablePib.Handle), curSOFTDELETEON, 0);
  dbiSetProp(hDBIObj(DataModule1.TablePat.Handle), curSOFTDELETEON, 0);
  dbiSetProp(hDBIObj(DataModule1.TableDos.Handle), curSOFTDELETEON, 0);
  dbiSetProp(hDBIObj(DataModule1.TableDiag.Handle), curSOFTDELETEON, 0);
  dbiSetProp(hDBIObj(DataModule1.TableImg.Handle), curSOFTDELETEON, 0);
  end else begin
    BitBtn2.Caption:='Сховати';
  DataModule1.TablePibQ.Visible:=True;
  dbiSetProp(hDBIObj(DataModule1.TablePib.Handle), curSOFTDELETEON, 1);
  dbiSetProp(hDBIObj(DataModule1.TablePat.Handle), curSOFTDELETEON, 1);
  dbiSetProp(hDBIObj(DataModule1.TableDos.Handle), curSOFTDELETEON, 1);
  dbiSetProp(hDBIObj(DataModule1.TableDiag.Handle), curSOFTDELETEON, 1);
  dbiSetProp(hDBIObj(DataModule1.TableImg.Handle), curSOFTDELETEON, 1);
         end;
DataModule1.TablePatQ.Visible := DataModule1.TablePibQ.Visible;
DataModule1.TableDosQ.Visible := DataModule1.TablePibQ.Visible;
DataModule1.TableDiagQ.Visible:= DataModule1.TablePibQ.Visible;
DataModule1.TableImgQ.Visible := DataModule1.TablePibQ.Visible;
   DataModule1.TablePib.Refresh;
      DataModule1.TablePat.Refresh;
         DataModule1.TableDos.Refresh;
            DataModule1.TableDiag.Refresh;
               DataModule1.TableImg.Refresh;
end;

procedure TFormView.BitBtn3Click(Sender: TObject);
begin
{if DataModule1.TablePib.State=dsBrowse then DataModule1.TablePib.Edit;
  if  DbiUndeleteRecord(DataModule1.TablePib.Handle) = 0 then
    DataModule1.TablePib.Refresh
  else
    MessageDlg('Будь ласка, але цей запис відновлення не потребує.',mtWarning,[mbOK],0);
MessageBeep(0);}

IF (DBNavigator1.DataSource.DataSet.State in [dsBrowse]) then
    DBNavigator1.DataSource.DataSet.Edit;

IF (DBNavigator1.DataSource = DataModule1.DSPib) then
  if  DbiUndeleteRecord(DataModule1.TablePib.Handle) = 0 then
    DataModule1.TablePib.Refresh
  else
    MessageDlg('Будь ласка, але цей запис відновлення не потребує.',mtWarning,[mbOK],0);

IF (DBNavigator1.DataSource = DataModule1.DSPat) then
  if  DbiUndeleteRecord(DataModule1.TablePat.Handle) = 0 then
    DataModule1.TablePat.Refresh
  else
    MessageDlg('Будь ласка, але цей запис відновлення не потребує.',mtWarning,[mbOK],0);

IF (DBNavigator1.DataSource = DataModule1.DSDos) then
  if  DbiUndeleteRecord(DataModule1.TableDos.Handle) = 0 then
    DataModule1.TableDos.Refresh
  else
    MessageDlg('Будь ласка, але цей запис відновлення не потребує.',mtWarning,[mbOK],0);

IF (DBNavigator1.DataSource = DataModule1.DSDiag) then
  if  DbiUndeleteRecord(DataModule1.TableDiag.Handle) = 0 then
    DataModule1.TableDiag.Refresh
  else
    MessageDlg('Будь ласка, але цей запис відновлення не потребує.',mtWarning,[mbOK],0);

IF (DBNavigator1.DataSource = DataModule1.DSImg) then
  if  DbiUndeleteRecord(DataModule1.TableImg.Handle) = 0 then
    DataModule1.TableImg.Refresh
  else
    MessageDlg('Будь ласка, але цей запис відновлення не потребує.',mtWarning,[mbOK],0);

DBNavigator1.DataSource.DataSet.cancel;    
MessageBeep(0);
end;

procedure TFormView.BitBtn4Click(Sender: TObject);
begin
 if MessageDlg('Ви дійсно бажаєте пакувати картотеку?'+#13#10
 +'Відновлення ВИДАЛЕНИХ карт після пакування буде неможливе!',
    mtInformation, [mbYes, mbNo], 0) = mrYes then begin
     FormSelectBase.CheckBox1.Visible:=True;
    FormSelectBase.Showmodal;
     FormSelectBase.CheckBox1.Visible:=False;
    IF (FormSelectBase.ModalResult= mrOK) then
      IF (FormSelectBase.CheckBox1.Checked) then begin
    PackTable(DataModule1.TablePib);
    PackTable(DataModule1.TablePat);
    PackTable(DataModule1.TableDos);
    PackTable(DataModule1.TableDiag);
    PackTable(DataModule1.TableImg);
      end else
    case FormSelectBase.ListBox1.ItemIndex of
    0:    PackTable(DataModule1.TablePib);
    1:    PackTable(DataModule1.TablePat);
    2:    PackTable(DataModule1.TableDos);
    3:    PackTable(DataModule1.TableDiag);
    4:    PackTable(DataModule1.TableImg);
     end;//of

    end;
end;

procedure TFormView.BitBtn5Click(Sender: TObject);
begin
 if MessageDlg('Ви дійсно бажаєте обнулити картотеку?',
    mtInformation, [mbYes, mbNo], 0) = mrYes then begin
      FormSelectBase.CheckBox1.Visible:=True;
    FormSelectBase.Showmodal;
     FormSelectBase.CheckBox1.Visible:=False;
    IF (FormSelectBase.ModalResult= mrOK) then
      IF (FormSelectBase.CheckBox1.Checked) then begin
    DataModule1.TablePib.Close;
    DataModule1.TablePat.Close;
    DataModule1.TableDos.Close;
    DataModule1.TableDiag.Close;
    DataModule1.TableImg.Close;

    DataModule1.TablePib.EmptyTable;
    DataModule1.TablePat.EmptyTable;
    DataModule1.TableDos.EmptyTable;
    DataModule1.TableDiag.EmptyTable;
    DataModule1.TableImg.EmptyTable;

    DataModule1.TablePib.Open;
    DataModule1.TablePat.Open;
    DataModule1.TableDos.Open;
    DataModule1.TableDiag.Open;
    DataModule1.TableImg.Open;

{    DataModule1.TableID.Edit;
     DataModule1.TableID.FieldByName('PIBID').AsInteger:=0;
     DataModule1.TableID.FieldByName('DOSID').AsInteger:=0;
     DataModule1.TableID.FieldByName('DIAGID').AsInteger:=0;
     DataModule1.TableID.FieldByName('PATID').AsInteger:=0;
    DataModule1.TableID.Post;
}    FormMain.FilterIni.WriteInteger('IDEAS','PIBID',  0);
     FormMain.FilterIni.WriteInteger('IDEAS','DOSID',  0);
     FormMain.FilterIni.WriteInteger('IDEAS','DIAGID', 0);
     FormMain.FilterIni.WriteInteger('IDEAS','PATID',  0);
      end else begin
//       DataModule1.TableID.Edit;
    case FormSelectBase.ListBox1.ItemIndex of
    0: begin
        DataModule1.TablePib.Close;
        DataModule1.TablePib.EmptyTable;
        DataModule1.TablePib.Open;
        FormMain.FilterIni.WriteInteger('IDEAS','PIBID',  0);
//        DataModule1.TableID.FieldByName('PIBID').AsInteger:=0;
       end;
    1: begin
        DataModule1.TablePat.Close;
        DataModule1.TablePat.EmptyTable;
        DataModule1.TablePat.Open;
        FormMain.FilterIni.WriteInteger('IDEAS','PATID',  0);
//        DataModule1.TableID.FieldByName('PATID').AsInteger:=0;
       end;
    2: begin
        DataModule1.TableDos.Close;
        DataModule1.TableDos.EmptyTable;
        DataModule1.TableDos.Open;
        FormMain.FilterIni.WriteInteger('IDEAS','DOSID',  0);
//        DataModule1.TableID.FieldByName('DOSID').AsInteger:=0;
       end;
    3: begin
        DataModule1.TableDiag.Close;
        DataModule1.TableDiag.EmptyTable;
        DataModule1.TableDiag.Open;
        FormMain.FilterIni.WriteInteger('IDEAS','DIAGID',  0);
//        DataModule1.TableID.FieldByName('DIAGID').AsInteger:=0;
       end;
    4: begin
       DataModule1.TableImg.Close;
        DataModule1.TableImg.EmptyTable;
        DataModule1.TableImg.Open;
       end;
     end;//of
//      DataModule1.TableID.Post;
               end;

  end;
end;

procedure TFormView.CheckBox1Click(Sender: TObject);
begin
case RxDBGrid1.FixedCols of
0: IF (DataModule1.TablePibQ.Visible = True)  then RxDBGrid1.FixedCols:=3 else
   RxDBGrid1.FixedCols:=2;
2,3: RxDBGrid1.FixedCols:=0;
end;
 end;

procedure TFormView.RxDBGrid2Enter(Sender: TObject);
begin
DBNavigator1.DataSource:=DataModule1.DSPat;
end;

procedure TFormView.RxDBGrid1Enter(Sender: TObject);
begin
DBNavigator1.DataSource:=DataModule1.DSPib;
end;

procedure TFormView.RxDBGrid3Enter(Sender: TObject);
begin
DBNavigator1.DataSource:=DataModule1.DSDos;
end;

procedure TFormView.RxDBGrid4Enter(Sender: TObject);
begin
DBNavigator1.DataSource:=DataModule1.DSDiag;
end;

procedure TFormView.RxDBGrid5Enter(Sender: TObject);
begin
DBNavigator1.DataSource:=DataModule1.DSImg;
end;

procedure TFormView.DBMemo1Enter(Sender: TObject);
begin
DBNavigator1.DataSource:=DataModule1.DSDos;
end;

procedure TFormView.FormActivate(Sender: TObject);
begin
  if (Moderator ='Admin') then
  BitBtn3.Enabled:=True else
  BitBtn3.Enabled:=False;

  BitBtn4.Enabled:=BitBtn3.Enabled;
  BitBtn5.Enabled:=BitBtn3.Enabled;
  BitBtn6.Enabled:=BitBtn3.Enabled;

if (Moderator ='Admin') then
 DBNavigator1.VisibleButtons := DBNavigator1.VisibleButtons +
 [nbDelete, nbEdit, nbPost] else
 DBNavigator1.VisibleButtons := DBNavigator1.VisibleButtons -
 [nbDelete, nbEdit, nbPost];
end;

procedure TFormView.BitBtn6Click(Sender: TObject);
begin
 if MessageDlg('Ви дійсно бажаєте виконати ОПТИМІЗАЦІЮ картотеки?'+#13#10
 +'Буде видалено всі записи, які не мають відповідностей за структурою!',
    mtInformation, [mbYes, mbNo], 0) = mrYes then begin
 Cursor:=crHourGlass;
 Update;
RxQuery1.Close;
RxQuery1.SQL.Clear;
RxQuery1.SQL.LoadFromFile('sql\fpat.sql');
RxQuery1.Prepare;
RxQuery1.ExecSQL;

RxQuery1.Close;
RxQuery1.SQL.Clear;
RxQuery1.SQL.LoadFromFile('sql\fdos.sql');
RxQuery1.Prepare;
RxQuery1.ExecSQL;

RxQuery1.Close;
RxQuery1.SQL.Clear;
RxQuery1.SQL.LoadFromFile('sql\fdiag.sql');
RxQuery1.Prepare;
RxQuery1.ExecSQL;

RxQuery1.Close;
RxQuery1.SQL.Clear;
RxQuery1.SQL.LoadFromFile('sql\fimg.sql');
RxQuery1.Prepare;
RxQuery1.ExecSQL;

    PackTable(DataModule1.TablePat);
    PackTable(DataModule1.TableDos);
    PackTable(DataModule1.TableDiag);
    PackTable(DataModule1.TableImg);

 Cursor:=crDefault;
  end;
end;

end.
