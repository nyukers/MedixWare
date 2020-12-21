unit dovidnik;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, RXDBCtrl, ComCtrls, Tabnotbk,
  ExtCtrls, Buttons, RxDBComb, DB, RXCtrls, DBTables, DBNavSch, ToolWin,
  BDEUtils, dbiProcs, dbiTypes;

type
  TFormDovidka = class(TForm)
    Panel1: TPanel;
    TN1: TTabbedNotebook;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBStatusLabel7: TDBStatusLabel;
    RxDBGrid1: TRxDBGrid;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    RxDBComboBox1: TRxDBComboBox;
    Label4: TLabel;
    Label5: TLabel;
    DBStatusLabel6: TDBStatusLabel;
    RxDBGrid2: TRxDBGrid;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBStatusLabel5: TDBStatusLabel;
    RxDBGrid3: TRxDBGrid;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBStatusLabel4: TDBStatusLabel;
    RxDBGrid4: TRxDBGrid;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    DBStatusLabel3: TDBStatusLabel;
    RxDBGrid5: TRxDBGrid;
    DBEdit13: TDBEdit;
    DBEdit15: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBStatusLabel2: TDBStatusLabel;
    RxDBGrid6: TRxDBGrid;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    RxDBGrid7: TRxDBGrid;
    DBEdit19: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit12: TDBEdit;
    DBMemo1: TDBMemo;
    DBStatusLabel8: TDBStatusLabel;
    RxDBGrid8: TRxDBGrid;
    DBEdit2: TDBEdit;
    DBEdit14: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    DBNavigator1: TDBNavSearch;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    ToolBar1: TToolBar;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure TN1Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormActivate(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure Focusnik;
  end;

var
  FormDovidka: TFormDovidka;

implementation

{$R *.DFM}
uses data, main1, select2;

procedure TFormDovidka.FormKeyPress(Sender: TObject; var Key: Char);
begin
case Key of
#13: begin //Enter
     IF //если рабочий режим набора основной карты
     ((StateOfAll = 'Append') and
      (ActiveControl is TDBGrid)) then
     begin BitBtn1Click(Sender);
           FormDovidka.ModalResult := mrOK;
           Key := #0;
//    showmessage(DBNavigator1.DataSource.DataSEt.Fields[1].AsString);
           Exit;
     end;
     IF //если режим просмотра справочников
     ((StateOfAll = 'View') and
      (ActiveControl is TDBGrid)) then
     begin DBNavigator1Click(Sender, nbEdit);
           Key := #0;
           Exit;
     end;

     TDBEdit(ActiveControl).Color:=clWindow;
       SelectNext(ActiveControl as tWinControl, True, True );
       Key := #0;
     TDBEdit(ActiveControl).Color:=clAqua;
     end;

'і': Key :='i';
'І': Key :='I';

 end;//of
end;

procedure TFormDovidka.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
IF Key = 27 then  //ESCape
  begin
    TDBEdit(ActiveControl).Color:=clWindow;
    SelectNext(ActiveControl as tWinControl, False, True );
    Key := 0;
    TDBEdit(ActiveControl).Color:=clAqua;
  end;


IF (DBNavigator1.DataSource.DataSet.State in [dsBrowse]) then begin
 case Key of
 vk_INSERT: DBNavigator1Click(Sender, nbInsert);
 vk_DELETE: DBNavigator1Click(Sender, nbDelete);
// vk_UP:     DBNavigator1Click(Sender, nbPrior);
// vk_DOWN:   DBNavigator1Click(Sender, nbNext);
 vk_PRIOR:  DBNavigator1Click(Sender, nbFirst);
 vk_NEXT:   DBNavigator1Click(Sender, nbLast);
 vk_LEFT:   IF (ActiveControl is TTabbedNotebook)
            then {} else TN1.PageIndex:=TN1.PageIndex - 1;
 vk_RIGHT:  IF (ActiveControl is TTabbedNotebook)
            then {} else TN1.PageIndex:=TN1.PageIndex + 1;

 end;//of}
   end;
end;

procedure TFormDovidka.TN1Change(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
case NewTab of
0: DBNavigator1.DataSource:=DataModule1.DSViddil;
1: DBNavigator1.DataSource:=DataModule1.DSDoc;
2: DBNavigator1.DataSource:=DataModule1.DSRayon;
3: DBNavigator1.DataSource:=DataModule1.DSPilga;
4: DBNavigator1.DataSource:=DataModule1.DSState;
5: DBNavigator1.DataSource:=DataModule1.DSDiagCode;
6: DBNavigator1.DataSource:=DataModule1.DSDosCode;
7: DBNavigator1.DataSource:=DataModule1.DSDosType;
 end;//of

FormSelectDovidBase.ListBox1.ItemIndex :=NewTab;

IF (FormDovidka.Visible) then Focusnik;
end;

procedure TFormDovidka.Focusnik;
begin
 case TN1.PageIndex of
 0: RxDBGrid1.SetFocus;
 1: RxDBGrid2.SetFocus;
 2: RxDBGrid3.SetFocus;
 3: RxDBGrid4.SetFocus;
 4: RxDBGrid5.SetFocus;
 5: RxDBGrid6.SetFocus;
 6: RxDBGrid7.SetFocus;
 7: RxDBGrid8.SetFocus;
    end;//of
end;

procedure TFormDovidka.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
//
with DBNavigator1 do
 case Button of
 nbInsert: begin
                 case TN1.PageIndex of
                 0: DBEdit1.SetFocus;
                 1: DBEdit4.SetFocus;
                 2: DBEdit7.SetFocus;
                 3: DBEdit10.SetFocus;
                 4: DBEdit13.SetFocus;
                 5: DBEdit16.SetFocus;
                 6: DBEdit19.SetFocus;
                 7: DBEdit2.SetFocus;
                  end;//of
           DataSource.Dataset.Insert;
           end;
// nbDelete: DataSource.DatasEt.Delete;
// nbPrior : DataSource.DatasEt.Prior;
// nbNext  : DataSource.DatasEt.Next;
// nbFirst : DataSource.DatasEt.First;
// nbLast  : DataSource.DatasEt.Last;
 nbEdit  : begin
                 case TN1.PageIndex of
                 0: DBEdit1.SetFocus;
                 1: DBEdit4.SetFocus;
                 2: DBEdit7.SetFocus;
                 3: DBEdit10.SetFocus;
                 4: DBEdit13.SetFocus;
                 5: DBEdit16.SetFocus;
                 6: DBEdit19.SetFocus;
                 7: DBEdit2.SetFocus;
                  end;//of
           DataSource.DatasEt.Edit;
           end;
 end;//of

end;

procedure TFormDovidka.FormActivate(Sender: TObject);
begin
if (Moderator ='Admin') then
  BitBtn4.Enabled:=True else
  BitBtn4.Enabled:=False;

  BitBtn5.Enabled:=BitBtn4.Enabled;
  BitBtn6.Enabled:=BitBtn4.Enabled;
  
if (Moderator ='Admin') then
 DBNavigator1.VisibleButtons := DBNavigator1.VisibleButtons +
 [nbDelete, nbEdit, nbPost] else
 DBNavigator1.VisibleButtons := DBNavigator1.VisibleButtons -
 [nbDelete, nbEdit, nbPost];
  
Focusnik;
end;

procedure TFormDovidka.DBEdit3Exit(Sender: TObject);
begin
with DBNavigator1 do begin
IF (DataSource.DataSEt.State in [dsEdit,dsInsert]) then
 if MessageDlg('Зберегти зміни ?',
    mtInformation, [mbYes, mbNo], 0) = mrYes then begin
          DataSource.DatasEt.Post;
        //  DataSource.DatasEt.FlushBuffers;
          FormMain.ComboFill;                     end
     else DataSource.DatasEt.Cancel;

     end;

end;

procedure TFormDovidka.BitBtn1Click(Sender: TObject);
begin
Close;
end;

procedure TFormDovidka.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure TFormDovidka.BitBtn3Click(Sender: TObject);
begin
  Application.HelpContext(8);
end;

procedure TFormDovidka.BitBtn7Click(Sender: TObject);
begin
IF (DataModule1.TableViddilQ.Visible=True) then begin
  BitBtn7.Caption:='Показати';
  DataModule1.TableViddilQ.Visible:=False;
  dbiSetProp(hDBIObj(DataModule1.TableViddil.Handle), curSOFTDELETEON, 0);
  dbiSetProp(hDBIObj(DataModule1.TableDoc.Handle), curSOFTDELETEON, 0);
  dbiSetProp(hDBIObj(DataModule1.TableRayon.Handle), curSOFTDELETEON, 0);
  dbiSetProp(hDBIObj(DataModule1.TablePilga.Handle), curSOFTDELETEON, 0);
  dbiSetProp(hDBIObj(DataModule1.TableState.Handle), curSOFTDELETEON, 0);
  dbiSetProp(hDBIObj(DataModule1.TableDiagCode.Handle), curSOFTDELETEON, 0);
  dbiSetProp(hDBIObj(DataModule1.TableDosCode.Handle), curSOFTDELETEON, 0);
  dbiSetProp(hDBIObj(DataModule1.TableDosType.Handle), curSOFTDELETEON, 0);
  end else begin
    BitBtn7.Caption:='Сховати';
  DataModule1.TableViddilQ.Visible:=True;
  dbiSetProp(hDBIObj(DataModule1.TableViddil.Handle), curSOFTDELETEON, 1);
  dbiSetProp(hDBIObj(DataModule1.TableDoc.Handle), curSOFTDELETEON, 1);
  dbiSetProp(hDBIObj(DataModule1.TableRayon.Handle), curSOFTDELETEON, 1);
  dbiSetProp(hDBIObj(DataModule1.TablePilga.Handle), curSOFTDELETEON, 1);
  dbiSetProp(hDBIObj(DataModule1.TableState.Handle), curSOFTDELETEON, 1);
  dbiSetProp(hDBIObj(DataModule1.TableDiagCode.Handle), curSOFTDELETEON, 1);
  dbiSetProp(hDBIObj(DataModule1.TableDosCode.Handle), curSOFTDELETEON, 1);
  dbiSetProp(hDBIObj(DataModule1.TableDosType.Handle), curSOFTDELETEON, 1);

         end;
DataModule1.TableDocQ.Visible := DataModule1.TableViddilQ.Visible;
DataModule1.TableRayonQ.Visible := DataModule1.TableViddilQ.Visible;
DataModule1.TablePilgaQ.Visible:= DataModule1.TableViddilQ.Visible;
DataModule1.TableStateQ.Visible := DataModule1.TableViddilQ.Visible;
DataModule1.TableDiagCodeQ.Visible := DataModule1.TableViddilQ.Visible;
DataModule1.TableDosCodeQ.Visible := DataModule1.TableViddilQ.Visible;
DataModule1.TableDosTypeQ.Visible := DataModule1.TableViddilQ.Visible;

DataModule1.TableViddil.Refresh;
DataModule1.TableDoc.Refresh;
DataModule1.TableRayon.Refresh;
DataModule1.TablePilga.Refresh;
DataModule1.TableState.Refresh;
DataModule1.TableDiagCode.Refresh;
DataModule1.TableDosCode.Refresh;
DataModule1.TableDosType.Refresh;
end;

procedure TFormDovidka.BitBtn6Click(Sender: TObject);
begin
IF (DBNavigator1.DataSource.DataSet.State in [dsBrowse]) then
    DBNavigator1.DataSource.DataSet.Edit;

IF (DBNavigator1.DataSource = DataModule1.DSViddil) then
  if  DbiUndeleteRecord(DataModule1.TableViddil.Handle) = 0 then
    DataModule1.TableViddil.Refresh
  else
    MessageDlg('Будь ласка, але цей запис відновлення не потребує.',mtWarning,[mbOK],0);

IF (DBNavigator1.DataSource = DataModule1.DSDoc) then
  if  DbiUndeleteRecord(DataModule1.TableDoc.Handle) = 0 then
    DataModule1.TableDoc.Refresh
  else
    MessageDlg('Будь ласка, але цей запис відновлення не потребує.',mtWarning,[mbOK],0);

IF (DBNavigator1.DataSource = DataModule1.DSRayon) then
  if  DbiUndeleteRecord(DataModule1.TableRayon.Handle) = 0 then
    DataModule1.TableRayon.Refresh
  else
    MessageDlg('Будь ласка, але цей запис відновлення не потребує.',mtWarning,[mbOK],0);

IF (DBNavigator1.DataSource = DataModule1.DSPilga) then
  if  DbiUndeleteRecord(DataModule1.TablePilga.Handle) = 0 then
    DataModule1.TablePilga.Refresh
  else
    MessageDlg('Будь ласка, але цей запис відновлення не потребує.',mtWarning,[mbOK],0);

IF (DBNavigator1.DataSource = DataModule1.DSstate) then
  if  DbiUndeleteRecord(DataModule1.Tablestate.Handle) = 0 then
    DataModule1.Tablestate.Refresh
  else
    MessageDlg('Будь ласка, але цей запис відновлення не потребує.',mtWarning,[mbOK],0);

IF (DBNavigator1.DataSource = DataModule1.DSDiagCode) then
  if  DbiUndeleteRecord(DataModule1.TableDiagCode.Handle) = 0 then
    DataModule1.TableDiagCode.Refresh
  else
    MessageDlg('Будь ласка, але цей запис відновлення не потребує.',mtWarning,[mbOK],0);

IF (DBNavigator1.DataSource = DataModule1.DSDosCode) then
  if  DbiUndeleteRecord(DataModule1.TableDosCode.Handle) = 0 then
    DataModule1.TableDosCode.Refresh
  else
    MessageDlg('Будь ласка, але цей запис відновлення не потребує.',mtWarning,[mbOK],0);

IF (DBNavigator1.DataSource = DataModule1.DSDosType) then
  if  DbiUndeleteRecord(DataModule1.TableDosType.Handle) = 0 then
    DataModule1.TableDosType.Refresh
  else
    MessageDlg('Будь ласка, але цей запис відновлення не потребує.',mtWarning,[mbOK],0);

DBNavigator1.DataSource.DataSet.cancel;    
MessageBeep(0);
end;

procedure TFormDovidka.BitBtn5Click(Sender: TObject);
begin
 if MessageDlg('Ви дійсно бажаєте пакувати довідники?'+#13#10
 +'Відновлення ВИДАЛЕНИХ записів після пакування буде неможливе!',
    mtInformation, [mbYes, mbNo], 0) = mrYes then begin
     if FormSelectDovidBase = nil then
     FormSelectDovidBase:=TFormSelectDovidBase.Create(Self);
     FormSelectDovidBase.Showmodal;
    IF (FormSelectDovidBase.ModalResult= mrOK) then
      IF (FormSelectDovidBase.CheckBox1.Checked) then begin
    PackTable(DataModule1.TableViddil);
    PackTable(DataModule1.TableDoc);
    PackTable(DataModule1.TableRayon);
    PackTable(DataModule1.TablePilga);
    PackTable(DataModule1.TableState);
    PackTable(DataModule1.TableDiagCode);
    PackTable(DataModule1.TableDosCode);
    PackTable(DataModule1.TableDosType);
      end else
    case FormSelectDovidBase.ListBox1.ItemIndex of
    0:PackTable(DataModule1.TableViddil);
    1:PackTable(DataModule1.TableDoc);
    2:PackTable(DataModule1.TableRayon);
    3:PackTable(DataModule1.TablePilga);
    4:PackTable(DataModule1.TableState);
    5:PackTable(DataModule1.TableDiagCode);
    6:PackTable(DataModule1.TableDosCode);
    7:PackTable(DataModule1.TableDosType);
     end;//of

    end;
end;

procedure TFormDovidka.BitBtn4Click(Sender: TObject);
begin
 if MessageDlg('Ви дійсно бажаєте обнулити довідники?',
    mtInformation, [mbYes, mbNo], 0) = mrYes then begin
     if FormSelectDovidBase = nil then
     FormSelectDovidBase:=TFormSelectDovidBase.Create(Self);
     FormSelectDovidBase.Showmodal;
    IF (FormSelectDovidBase.ModalResult= mrOK) then
DataModule1.TableViddil.Close;
DataModule1.TableDoc.Close;
DataModule1.TableRayon.Close;
DataModule1.TablePilga.Close;
DataModule1.TableState.Close;
DataModule1.TableDiagCode.Close;
DataModule1.TableDosCode.Close;
DataModule1.TableDosType.Close;

      IF (FormSelectDovidBase.CheckBox1.Checked) then begin
DataModule1.TableViddil.EmptyTable;
DataModule1.TableDoc.EmptyTable;
DataModule1.TableRayon.EmptyTable;
DataModule1.TablePilga.EmptyTable;
DataModule1.TableState.EmptyTable;
DataModule1.TableDiagCode.EmptyTable;
DataModule1.TableDosCode.EmptyTable;
DataModule1.TableDosType.EmptyTable

      end else begin
    case FormSelectDovidBase.ListBox1.ItemIndex of
    0:DataModule1.TableViddil.EmptyTable;
    1:DataModule1.TableDoc.EmptyTable;
    2:DataModule1.TableRayon.EmptyTable;
    3:DataModule1.TablePilga.EmptyTable;
    4:DataModule1.TableState.EmptyTable;
    5:DataModule1.TableDiagCode.EmptyTable;
    6:DataModule1.TableDosCode.EmptyTable;
    7:DataModule1.TableDosType.EmptyTable;
     end;//of

DataModule1.TableViddil.Open;
DataModule1.TableDoc.Open;
DataModule1.TableRayon.Open;
DataModule1.TablePilga.Open;
DataModule1.TableState.Open;
DataModule1.TableDiagCode.Open;
DataModule1.TableDosCode.Open;
DataModule1.TableDosType.Open;
               end;

  end;
end;

procedure TFormDovidka.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
IF((Sender as TrxDBGrid).DataSource.DataSet.
FieldByName('Q').AsString = 'DEL') then
begin
Background:= clMenu;
AFont.Style := [fsBold];
     end;
end;

end.
