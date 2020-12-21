unit main1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Db, DBTables, StdCtrls, Buttons, DMIToolB,
  MMOpen, ildbmitb, ComCtrls, Spin, ClipBrd, Menus, Printers,
  DLL96V1, ToolEdit, RXDBCtrl, RXCtrls, Mask, RxDBComb, TDMULTIP, DBCGrids,
  Preview, DLLsp96, Grids, DBGrids, hcommon, Hresize,  Inifiles,
  XcdZipD3, jws99, ShellAPI, CurrEdit, DBNavSch, Placemnt, DBIndex;

type
  TFormMain = class(TForm)
    MainMenu1: TMainMenu;
    N201: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ZIP1: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N2041151: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel7: TRxLabel;
    DBDateEdit1: TDBDateEdit;
    RxDBComboBox1: TRxDBComboBox;
    Panel4: TPanel;
    ScrollBox1: TScrollBox;
    Panel5: TPanel;
    DBStatusLabel2: TDBStatusLabel;
    DBDateEdit2: TDBDateEdit;
    RxDBComboBox2: TRxDBComboBox;
    RxDBComboBox3: TRxDBComboBox;
    RxDBComboBox4: TRxDBComboBox;
    RxDBComboBox5: TRxDBComboBox;
    RxDBComboBox6: TRxDBComboBox;
    RxDBComboBox7: TRxDBComboBox;
    RxDBComboBox8: TRxDBComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    RxLabel6: TRxLabel;
    RxDBComboBox9: TRxDBComboBox;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    RxDBComboBox10: TRxDBComboBox;
    Label13: TLabel;
    Panel6: TPanel;
    Panel7: TPanel;
    DBStatusLabel3: TDBStatusLabel;
    Panel8: TPanel;
    DBStatusLabel4: TDBStatusLabel;
    DBStatusLabel1: TDBStatusLabel;
    N29: TMenuItem;
    N30: TMenuItem;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    DBEdit6: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Panel9: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBMemo2: TDBMemo;
    hgResizer1: ThgResizer;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    MaskEdit1: TMaskEdit;
    Edit1: TEdit;
    N32: TMenuItem;
    FontDialog1: TFontDialog;
    N33: TMenuItem;
    Label1: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Usreview1: TMenuItem;
    N5: TMenuItem;
    About1: TMenuItem;
    N6: TMenuItem;
    N23: TMenuItem;
    JWSServices1: TMenuItem;
    Gettingstarted1: TMenuItem;
    Label24: TLabel;
    RxDBCalcEdit1: TRxDBCalcEdit;
    DBDateEdit3: TDBDateEdit;
    DBDateEdit4: TDBDateEdit;
    RxDBComboBox11: TRxDBComboBox;
    Label25: TLabel;
    N27: TMenuItem;
    Label26: TLabel;
    DBEdit7: TDBEdit;
    RxDBComboBox12: TRxDBComboBox;
    DBEdit8: TDBEdit;
    Label27: TLabel;
    Label28: TLabel;
    DBNavigator1: TDBNavSearch;
    DBEdit9: TDBEdit;
    Label29: TLabel;
    Label30: TLabel;
    FormStorage1: TFormStorage;
    DBEdit1: TRxDBComboEdit;
    DBIndexCombo1: TDBIndexCombo;
    Label31: TLabel;
    N15: TMenuItem;
    N28: TMenuItem;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    N31: TMenuItem;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N4Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ScrollBox1Enter(Sender: TObject);
    procedure Panel8Enter(Sender: TObject);
    procedure Panel1Enter(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure Panel3Enter(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure RxDBComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBComboBox4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBComboBox5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBComboBox7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBComboBox10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBComboBox1Exit(Sender: TObject);
    procedure RxDBComboBox10Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ZIP1Click(Sender: TObject);
    procedure DBMemo2Exit(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure RxDBComboBox1Enter(Sender: TObject);
    procedure RxDBComboBox10Enter(Sender: TObject);
    procedure DBMemo2Enter(Sender: TObject);
    procedure RxDBComboBox2Enter(Sender: TObject);
    procedure RxDBComboBox6Enter(Sender: TObject);
    procedure RxDBComboBox9Enter(Sender: TObject);
    procedure RxDBComboBox8Enter(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2Change(Sender: TObject);
    procedure RxDBComboBox3Enter(Sender: TObject);
    procedure RxDBComboBox4Enter(Sender: TObject);
    procedure RxDBComboBox5Enter(Sender: TObject);
    procedure RxDBComboBox7Enter(Sender: TObject);
    procedure RxDBComboBox3Change(Sender: TObject);
    procedure RxDBComboBox4Change(Sender: TObject);
    procedure RxDBComboBox5Change(Sender: TObject);
    procedure RxDBComboBox7Change(Sender: TObject);
    procedure RxDBComboBox10Change(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit4Change(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Usreview1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure JWSServices1Click(Sender: TObject);
    procedure Panel9Enter(Sender: TObject);
    procedure RxDBComboBox4Exit(Sender: TObject);
    procedure RxDBComboBox9Exit(Sender: TObject);
    procedure Gettingstarted1Click(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit4Enter(Sender: TObject);
    procedure DBEdit6Enter(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure RxDBComboBox11Enter(Sender: TObject);
    procedure RxDBComboBox11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBComboBox6Change(Sender: TObject);
    procedure DBEdit8Enter(Sender: TObject);
    procedure RxDBComboBox12Enter(Sender: TObject);
    procedure DBEdit9Change(Sender: TObject);
    procedure DBEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit9Enter(Sender: TObject);
    procedure DBDateEdit3Enter(Sender: TObject);
    procedure RxDBCalcEdit1Exit(Sender: TObject);
    procedure DBEdit1ButtonClick(Sender: TObject);
    procedure DBDateEdit4Enter(Sender: TObject);
    procedure DBDateEdit2Enter(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N31Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations}
    FilterIni       : TInifile;
    FIniFileName    : String;
        procedure TableUnLock;
        procedure TableLock;
        procedure ComboFill;
  end;


var
  FormMain: TFormMain;
    StateOfAll: string[10];
    Moderator : string[10];
    FormatInBase, EmbeddedInBase, AnnotationInBase,
    AnnographicInBase, ProtocolFluentInBase,
    ProtocolDetailInBase  : string[5];
    PIBID, PATID, DOSID, DIAGID: integer;

implementation

uses Ufullscr, U_p_size, about, video, tobase, data, view, dovidnik,
  protocol, select, image1, inter, arc, quest, Psw2, rolik;


{$R *.DFM}

procedure TFormMain.BitBtn3Click(Sender: TObject);
begin
 if FormProtocol = nil then
   FormProtocol:=TFormProtocol.Create(Self);
FormProtocol.Showmodal;

IF (StateOfAll = 'Append') then begin
 if Application.MessageBox(
        'Увага: інформацію в дослідженні пацієнта змінено.'+#13#10+' Запам`ятати ?',
        'Дослідження', MB_OKCANCEL) = IDOK then
        begin
         DataModule1.TableDos.Post;
         DataModule1.TableDOs.FlushBuffers;
//           DataModule1.TableID.Edit;
//           DataModule1.TableID.FieldByName('DOSID').AsInteger:=
//           DataModule1.TableID.FieldByName('DOSID').AsInteger + 1;
//           DataModule1.TableID.Post;
//           DataModule1.TableID.FlushBuffers;
    FilterIni.WriteInteger('IDEAS','DOSID', DOSID+1);

//  FilterIni.WriteInteger('JOURNAL_DOS',
  //        RxDBComboBox12.Items[RxDBComboBox12.ItemIndex], StrToInt(DBEdit8.Text));

  if Application.MessageBox(
        'Відкривати новий запис діагноза для дослідження пацієнта ?',
        'Дослідження', MB_OKCANCEL) = IDOK then
         begin
              DataModule1.TableDiag.Append;
               DataModule1.TableDiag.FieldByName('DOSID').AsInteger :=
                DataModule1.TableDos.FieldByName('DOSID').AsInteger;
               DataModule1.TableDiag.FieldByName('DIAGID').AsInteger :=
                DIAGID + 1;
//                DataModule1.TableID.FieldByName('DIAGID').AsInteger + 1;

         end else StateOfAll := 'View';
        end else begin StateOfAll := 'View';
                 DataModule1.TableDos.Cancel;
                 end;
       end;

DBDateEdit4.SetFocus;
end;

procedure TFormMain.FormCreate(Sender: TObject);
//var j:integer;
begin
StateOfAll:='View';

 FIniFileName :='IpSet.Ini';
 FilterIni:=TInifile.Create(FIniFileName);

PIBID:=  FilterIni.ReadInteger('IDEAS', 'PIBID', 1);
PATID:=  FilterIni.ReadInteger('IDEAS', 'PATID', 1);
DOSID:=  FilterIni.ReadInteger('IDEAS', 'DOSID', 1);
DIAGID:= FilterIni.ReadInteger('IDEAS', 'DIAGID', 1);

IF (PIBID = 1) then
 if Application.MessageBox(
 'Увага: код пацієнта дорівнює першому коду.'+
 ' При продовженні роботи можливе порушення структури банку картотеки!'
 +#13#10+' Наполягаю на зверненні до Адміністратора АРМу. Продовжити ?',
        'НЕБЕЗПЕКА !', MB_OKCANCEL) = IDCANCEL
        then Application.Terminate;


 if (Moderator ='Admin') then
 DBNavigator1.VisibleButtons := DBNavigator1.VisibleButtons +
 [nbDelete, nbEdit, nbPost];

// наполним все Комбо значениями
  ComboFill;
end;


procedure TFormMain.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
{
with DBNavigator1 do
 case Button of
 nbInsert: begin
          DataSource.DataSet.Insert;
           end;
 nbEdit:   begin
          DataSource.DataSet.Edit;
           end;
 nbPost: begin
          DataSource.DataSet.Post;
           end;
 nbDelete: begin
         DataSource.DataSet.Delete;
           end;
 nbCancel: begin
         DataSource.DataSet.Cancel;
           end;
end;//of
}
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 {Turn off the OnIdle}
 Application.OnIdle:=Nil;
 {Free the printer size form}
 Printersize.free;
end;

procedure TFormMain.N4Click(Sender: TObject);
begin
Close;
end;

procedure TFormMain.ScrollBox1Enter(Sender: TObject);
begin
DBNavigator1.DataSource:=DataModule1.DSPat;
DBStatusLabel2.Font.Style:=DBStatusLabel2.Font.Style + [fsBold];
DBStatusLabel1.Font.Style:=DBStatusLabel1.Font.Style - [fsBold];
DBStatusLabel3.Font.Style:=DBStatusLabel1.Font.Style;
DBStatusLabel4.Font.Style:=DBStatusLabel1.Font.Style;
end;

procedure TFormMain.Panel8Enter(Sender: TObject);
begin
DBNavigator1.DataSource:=DataModule1.DSDiag;
DBStatusLabel4.Font.Style:=DBStatusLabel2.Font.Style + [fsBold];
DBStatusLabel1.Font.Style:=DBStatusLabel1.Font.Style - [fsBold];
DBStatusLabel3.Font.Style:=DBStatusLabel1.Font.Style;
DBStatusLabel2.Font.Style:=DBStatusLabel1.Font.Style;
end;

procedure TFormMain.Panel1Enter(Sender: TObject);
begin
DBNavigator1.DataSource:=DataModule1.DSPib;
DBStatusLabel1.Font.Style:=DBStatusLabel1.Font.Style + [fsBold];
DBStatusLabel2.Font.Style:=DBStatusLabel2.Font.Style - [fsBold];
DBStatusLabel3.Font.Style:=DBStatusLabel2.Font.Style;
DBStatusLabel4.Font.Style:=DBStatusLabel2.Font.Style;
end;

procedure TFormMain.N29Click(Sender: TObject);
begin
 if FormView = nil then
  FormView:=TFormView.Create(Self);
  FormView.Showmodal;
end;

procedure TFormMain.TableUnLock;
begin
  DataModule1.TablePib.Close;
  DataModule1.TablePat.Close;
  DataModule1.TableDos.Close;
  DataModule1.TableDiag.Close;
  DataModule1.TableImg.Close;
  DataModule1.TablePib.ReadOnly:=False;
  DataModule1.TablePat.ReadOnly:=False;
  DataModule1.TableDos.ReadOnly:=False;
  DataModule1.TableDiag.ReadOnly:=False;
  DataModule1.TableImg.ReadOnly:=False;
  DataModule1.TablePib.Open;
  DataModule1.TablePat.Open;
  DataModule1.TableDos.Open;
  DataModule1.TableDiag.Open;
  DataModule1.TableImg.Open;

end;

procedure TFormMain.TableLock;
begin
  DataModule1.TablePib.Close;
  DataModule1.TablePat.Close;
  DataModule1.TableDos.Close;
  DataModule1.TableDiag.Close;
  DataModule1.TableImg.Close;
  DataModule1.TablePib.ReadOnly:=True;
  DataModule1.TablePat.ReadOnly:=True;
  DataModule1.TableDos.ReadOnly:=True;
  DataModule1.TableDiag.ReadOnly:=True;
  DataModule1.TableImg.ReadOnly:=True;

  DataModule1.TablePib.Open;
  DataModule1.TablePat.Open;
  DataModule1.TableDos.Open;
  DataModule1.TableDiag.Open;
  DataModule1.TableImg.Open;
end;


procedure TFormMain.Panel3Enter(Sender: TObject);
begin
DBNavigator1.DataSource:=DataModule1.DSImg;
DBStatusLabel2.Font.Style:=DBStatusLabel2.Font.Style + [fsBold];
DBStatusLabel1.Font.Style:=DBStatusLabel1.Font.Style - [fsBold];
DBStatusLabel3.Font.Style:=DBStatusLabel1.Font.Style;
DBStatusLabel4.Font.Style:=DBStatusLabel1.Font.Style;
end;

procedure TFormMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
case Key of
#13: begin
     TDBEdit(ActiveControl).Color:=clWindow;
       SelectNext(ActiveControl as tWinControl, True, True );
       Key := #0;
     TDBEdit(ActiveControl).Color:=clAqua;
{ не для всех !
     IF (StateOfAll ='Append') then begin
          TRxDBComboBox(ActiveControl).DroppedDown:=True;
          TRxDBComboBox(ActiveControl).ItemIndex:=0;
                                    end;
 }    end;
#32: TRxDBComboBox(ActiveControl).DroppedDown:=True;
'і': Key :='i';
'І': Key:='I';
 end;//of

end;

procedure TFormMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 If Key = 27 Then  {ESCape !}
  begin
   //пусть контролы чуть поостынут
   // восстановление OnExit пока на каждом отдельно
   If (ActiveControl is TRxDBComboBox) then
   TRxDBComboBox(ActiveControl).OnExit:=nil;
   If (ActiveControl is TDBMemo) then
   TDBMemo(ActiveControl).OnExit:=nil;
   If (ActiveControl is TDBEdit) then
   TDBEdit(ActiveControl).OnExit:=nil;

    TDBEdit(ActiveControl).Color:=clWindow;
    SelectNext(ActiveControl as tWinControl, False, True );
    Key := 0;
    TDBEdit(ActiveControl).Color:=clAqua;
 end;

IF DBNavigator1.DataSource=DataModule1.DSPib then
   FormSelectBase.ListBox1.ItemIndex :=0;
IF DBNavigator1.DataSource=DataModule1.DSPat then
   FormSelectBase.ListBox1.ItemIndex :=1;
IF DBNavigator1.DataSource=DataModule1.DSDos then
   FormSelectBase.ListBox1.ItemIndex :=2;
IF DBNavigator1.DataSource=DataModule1.DSDiag then
   FormSelectBase.ListBox1.ItemIndex :=3;
IF DBNavigator1.DataSource=DataModule1.DSImg then
   FormSelectBase.ListBox1.ItemIndex :=4;

// основная раскрутка
 case Key of
 vk_INSERT: begin
            FormSelectBase.Showmodal;
            IF (FormSelectBase.ModalResult= mrOK) then begin
           LoadKeyboardLayout('00000422', KLF_ACTIVATE); // ukranian

          IF (FormSelectBase.ListBox1.ItemIndex = 0) then begin
           IF (FormQuest = nil) then FormQuest:=TFormQuest.Create(Self);
           FormQuest.Showmodal;
           IF (FormQuest.ModalResult= mrOK) then begin
     DataModule1.TablePib.IndexName:='PIBINDEX';
 IF (DataModule1.TablePib.FindKey([FormQuest.RxQuery1.Fields[1].AsString]) =
     False) then begin showmessage('Не можу знайти вибраний ПІБ !');
                       Exit;
                 end;

// а щож вибрати далі ???
           FormSelectBase.Showmodal;
           IF (FormSelectBase.ModalResult= mrOK) then begin
            IF (FormSelectBase.ListBox1.ItemIndex = 0) then
                 FormSelectBase.ListBox1.ItemIndex :=1; end
                 else Exit;


                                                 end
           else IF (FormQuest.ModalResult= mrCancel)
                then Exit;
                                                          end;

            StateOfAll:='Append';
            case FormSelectBase.ListBox1.ItemIndex of
            0: begin
               DataModule1.TablePib.Append;
               DataModule1.TablePib.FieldByName('PIBID').AsInteger :=
               PIBID + 1;
//                DataModule1.TableID.FieldByName('PIBID').AsInteger + 1;
               DBDateEdit1.Text:=DateToStr(Date);
               DBDateEdit1.SetFocus;
            //   DBNavigator1.Enabled:=False;
               end;
            1: begin
               DataModule1.TablePat.Append;
               DataModule1.TablePat.FieldByName('PIBID').AsInteger :=
                DataModule1.TablePib.FieldByName('PIBID').AsInteger;
               DataModule1.TablePat.FieldByName('PATID').AsInteger :=
               PATID + 1;
//              DataModule1.TableID.FieldByName('PATID').AsInteger + 1;
               DBDateEdit2.Text:=DateToStr(Date);
               DBDateEdit2.SetFocus;
               end;
            2: begin
               DataModule1.TableDos.Append;
               DataModule1.TableDos.FieldByName('PatID').AsInteger :=
                DataModule1.TablePat.FieldByName('PATID').AsInteger;
               DataModule1.TableDos.FieldByName('DOSID').AsInteger :=
               DOSID + 1;
//              DataModule1.TableID.FieldByName('DOSID').AsInteger + 1;
             //  RxDBComboBox12.SetFocus;
               DBDateEdit3.SetFocus;
               end;
            3: begin
               DataModule1.TableDiag.Append;
               DataModule1.TableDiag.FieldByName('DOSID').AsInteger :=
                DataModule1.TableDos.FieldByName('DOSID').AsInteger;
               DataModule1.TableDiag.FieldByName('DIAGID').AsInteger :=
               DIAGID + 1;
//              DataModule1.TableID.FieldByName('DIAGID').AsInteger + 1;
               DBDateEdit4.Text:=DateToStr(Date);
               DBDateEdit4.SetFocus;
               end;
            4: begin
//       Это есть в FormImage
//               DataModule1.TableImg.Append;
  //             DataModule1.TableImg.FieldByName('DIAGID').AsInteger :=
    //           DataModule1.TableDiag.FieldByName('DIAGID').AsInteger;
               BitBtn1Click(Sender);
               end;

            end;//of
             end;//ModalResult
            end;

 vk_DELETE: begin
    If ((ActiveControl is TDBDateEdit) or (ActiveControl is TDBMemo)
     or (ActiveControl is TDBEdit))
    Then begin {} end else begin
     FormSelectBase.Showmodal;
     IF (FormSelectBase.ModalResult= mrOK) then
         DBNavigator1Click(Sender, nbDelete);
         end;
            end;
 end;//of

Label32.Caption:=IntToStr(DIAGID);
Label33.Caption:=IntToStr(DOSID);
Label34.Caption:=IntToStr(PATID);
Label35.Caption:=IntToStr(PIBID);
//FormMain.Caption:= StateOfAll;
end;

procedure TFormMain.N10Click(Sender: TObject);
begin
 if FormDovidka = nil then
 FormDovidka:=TFormDovidka.Create(Self);
 FormDovidka.TN1.PageIndex:=0;
 FormDovidka.Showmodal;
end;

procedure TFormMain.N11Click(Sender: TObject);
begin
 if FormDovidka = nil then
 FormDovidka:=TFormDovidka.Create(Self);
 FormDovidka.TN1.PageIndex:=1;
 FormDovidka.Showmodal;
end;

procedure TFormMain.N12Click(Sender: TObject);
begin
 if FormDovidka = nil then
 FormDovidka:=TFormDovidka.Create(Self);
 FormDovidka.TN1.PageIndex:=2;
 FormDovidka.Showmodal;
end;

procedure TFormMain.N13Click(Sender: TObject);
begin
 if FormDovidka = nil then
 FormDovidka:=TFormDovidka.Create(Self);
 FormDovidka.TN1.PageIndex:=3;
 FormDovidka.Showmodal;
end;

procedure TFormMain.N14Click(Sender: TObject);
begin
 if FormDovidka = nil then
 FormDovidka:=TFormDovidka.Create(Self);
 FormDovidka.TN1.PageIndex:=4;
 FormDovidka.Showmodal;
end;

procedure TFormMain.N16Click(Sender: TObject);
begin
 if FormDovidka = nil then
 FormDovidka:=TFormDovidka.Create(Self);
 FormDovidka.TN1.PageIndex:=5;
 FormDovidka.Showmodal;
end;

procedure TFormMain.N17Click(Sender: TObject);
begin
 if FormDovidka = nil then
 FormDovidka:=TFormDovidka.Create(Self);
 FormDovidka.TN1.PageIndex:=6;
 FormDovidka.Showmodal;
end;

procedure TFormMain.RxDBComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
 vk_F2: begin N12Click(Sender);
       IF (StateOfAll = 'Append') then
       IF (FormDovidka.ModalResult = mrOK) then begin
      DataModule1.TablePat.FieldByName('RAYON').AsString :=
          DataModule1.TableRayon.FieldByName('NAME').AsString;
      DataModule1.TablePat.FieldByName('RAYONCODE').AsInteger :=
          DataModule1.TableRayon.FieldByName('CODE').AsInteger;
                                                 end;
        end;
 end;//of
end;

procedure TFormMain.RxDBComboBox4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
 vk_F2: begin N13Click(Sender);
       IF (StateOfAll = 'Append') then
       IF (FormDovidka.ModalResult = mrOK) then begin
      DataModule1.TablePat.FieldByName('PILGA').AsString :=
          DataModule1.TablePilga.FieldByName('NAME').AsString;
      DataModule1.TablePat.FieldByName('PILGACODE').AsInteger :=
          DataModule1.TablePilga.FieldByName('CODE').AsInteger;
                                                 end;
        end;
 end;//of
end;

procedure TFormMain.RxDBComboBox5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
 vk_F2: begin N14Click(Sender);
       IF (StateOfAll = 'Append') then
       IF (FormDovidka.ModalResult = mrOK) then begin
      DataModule1.TablePat.FieldByName('D_ST').AsString :=
          DataModule1.TableState.FieldByName('NAME').AsString;
      DataModule1.TablePat.FieldByName('D_ST_CODE').AsInteger :=
          DataModule1.TableState.FieldByName('CODE').AsInteger;
                                                 end;
        end;
 end;//of
end;

procedure TFormMain.RxDBComboBox7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
 vk_F2: begin N10Click(Sender);
       IF (StateOfAll = 'Append') then
       IF (FormDovidka.ModalResult = mrOK) then begin
      DataModule1.TablePat.FieldByName('VIDDIL').AsString :=
          DataModule1.TableViddil.FieldByName('NAME').AsString;
      DataModule1.TablePat.FieldByName('VIDDILCODE').AsInteger :=
          DataModule1.TableViddil.FieldByName('CODE').AsInteger;
                                                 end;
        end;
 end;//of
end;

procedure TFormMain.RxDBComboBox10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  vk_F2: begin N11Click(Sender);
       IF (StateOfAll = 'Append') then
       IF (FormDovidka.ModalResult = mrOK) then begin
      DataModule1.TablePat.FieldByName('DOCTOR').AsString :=
          DataModule1.TableDoc.FieldByName('NAME').AsString;
      DataModule1.TablePat.FieldByName('DOCTORCODE').AsInteger :=
          DataModule1.TableDoc.FieldByName('CODE').AsInteger;
                                                 end;
        end;


 end;//of
end;

procedure TFormMain.RxDBComboBox1Exit(Sender: TObject);
begin
IF (StateOfAll = 'Append') then begin
 if Application.MessageBox(
        'Увага: інформацію про пацієнта змінено.'+#13#10+' Запам`ятати ?',
        'Пацієнт', MB_OKCANCEL) = IDOK then
        begin
         DataModule1.TablePib.Post;
         DataModule1.TablePib.FlushBuffers;
//           DataModule1.TableID.Edit;
//           DataModule1.TableID.FieldByName('PIBID').AsInteger:=
//            DataModule1.TableID.FieldByName('PIBID').AsInteger + 1;
//           DataModule1.TableID.Post;
//           DataModule1.TableID.FlushBuffers;
    FilterIni.WriteInteger('IDEAS','PIBID', PIBID+1);
           ///
  if Application.MessageBox(
        'Відкривати нову карту для пацієнта ?',
        'Пацієнт', MB_OKCANCEL) = IDOK then
         begin
              DataModule1.TablePat.Append;
               DataModule1.TablePat.FieldByName('PIBID').AsInteger :=
                DataModule1.TablePib.FieldByName('PIBID').AsInteger;
               DataModule1.TablePat.FieldByName('PATID').AsInteger :=
               PATID+1;
//              DataModule1.TableID.FieldByName('PATID').AsInteger + 1;
               DBDateEdit2.SetFocus;
         end else StateOfAll := 'View';
        end else begin StateOfAll := 'View';
                 DataModule1.TablePib.Cancel;
                 end;
       end;

DBDateEdit2.SetFocus;
end;

procedure TFormMain.RxDBComboBox10Exit(Sender: TObject);
begin
IF (StateOfAll = 'Append') then begin
 if Application.MessageBox(
        'Увага: інформацію в карті про пацієнта змінено.'+#13#10+' Запам`ятати ?',
        'Пацієнт', MB_OKCANCEL) = IDOK then
        begin
         DataModule1.TablePat.Post;
         DataModule1.TablePat.FlushBuffers;
//           DataModule1.TableID.Edit;
//           DataModule1.TableID.FieldByName('PATID').AsInteger:=
//            DataModule1.TableID.FieldByName('PATID').AsInteger + 1;
//           DataModule1.TableID.Post;
//           DataModule1.TableID.FlushBuffers;
         FilterIni.WriteInteger('IDEAS','PATID', PATID+1);
  if Application.MessageBox(
        'Відкривати новий запис дослідження для карти пацієнта ?',
        'Пацієнт', MB_OKCANCEL) = IDOK then
         begin
              DataModule1.TableDos.Append;
               DataModule1.TableDos.FieldByName('PATID').AsInteger :=
                DataModule1.TablePat.FieldByName('PATID').AsInteger;
               DataModule1.TableDos.FieldByName('DOSID').AsInteger :=
               DOSID+1;
//              DataModule1.TableID.FieldByName('DOSID').AsInteger + 1;
         end else StateOfAll := 'View';
        end else begin StateOfAll := 'View';
                       DataModule1.TablePat.Cancel;
                 end;
       end;

DataModule1.TableViddil.Filtered:=False;       
//RxDBCombobox12.SetFocus;
DBDateEdit3.SetFocus;
end;

procedure TFormMain.BitBtn1Click(Sender: TObject);
begin
 if FormImage = nil then
  FormImage:=TFormImage.Create(Self);
//IF (StateOfAll = 'Append') then StateOfAll := 'AppendImage';
FormImage.Showmodal;
end;

procedure TFormMain.ZIP1Click(Sender: TObject);
var icode:integer;
begin
 if FormArc = nil then FormArc:=TFormArc.Create(Self);
    FormArc.ShowModal;
 if MessageDlg('Бажаєте виконати архів картотеки?',
    mtInformation, [mbYes, mbNo], 0) = mrYes then begin
  DataModule1.XceedZip1.ZipFileName:=
  DataModule1.TablePib.DatabaseName+'\archive\us'+Copy(DateToStr(Date),1,2)+
  Copy(DateToStr(Date),4,2) + Copy(DateToStr(Date),9,2)+'.zip';

showmessage('І"мя архівного файлу '+DataModule1.XceedZip1.ZipFileName);
try
  DataModule1.TablePib.Close;
  DataModule1.TablePat.Close;
  DataModule1.TableDos.Close;
  DataModule1.TableDiag.Close;
  DataModule1.TableImg.Close;
  DataModule1.TableViddil.Close;
  DataModule1.TableDoc.Close;
  DataModule1.TableRayon.Close;
  DataModule1.TablePilga.Close;
  DataModule1.TableState.Close;
  DataModule1.TableDiagcode.Close;
  DataModule1.TableDosCode.Close;
    DataModule1.TableDosType.Close;

DataModule1.XceedZip1.FilesToProcess.Add(
   DataModule1.TablePib.DatabaseName +'\*.*');
   icode:=DataModule1.XceedZip1.Add(xecAll);
IF (icode > 40) then
Showmessage('Не можу створити ПОВНИЙ архів баз! Код: '+inttostr(icode))
   else begin
DataModule1.XceedZip1.FilesToProcess.Add(
   DataModule1.TableDoc.DatabaseName+'\*.*');
DataModule1.XceedZip1.Add(xecUpdate);
DataModule1.XceedZip1.FilesToProcess.Add(
   DataModule1.TablePib.DatabaseName+'\sql\*.*');
DataModule1.XceedZip1.Add(xecUpdate);
DataModule1.XceedZip1.FilesToProcess.Add(
   DataModule1.TablePib.DatabaseName+'\etalon\*.*');
DataModule1.XceedZip1.Add(xecUpdate);

end;

 finally
  DataModule1.TablePib.Open;
  DataModule1.TablePat.Open;
  DataModule1.TableDos.Open;
  DataModule1.TableDiag.Open;
  DataModule1.TableImg.Open;
  DataModule1.TableViddil.Open;
  DataModule1.TableDoc.Open;
  DataModule1.TableRayon.Open;
  DataModule1.TablePilga.Open;
  DataModule1.TableState.Open;
  DataModule1.TableDiagcode.Open;
  DataModule1.TableDosCode.Open;
  DataModule1.TableDosType.Open;

        end;{final}
 MessageBeep(0);
ShowMessage('Виконання архіву закінчено.');
   end;
end;

procedure TFormMain.DBMemo2Exit(Sender: TObject);
begin
IF (StateOfAll = 'Append') then begin
 if Application.MessageBox(
        'Увага: інформацію в дослідженні пацієнта змінено.'+#13#10+' Запам`ятати ?',
        'Дослідження', MB_OKCANCEL) = IDOK then
        begin
         DataModule1.TableDos.Post;
         DataModule1.TableDOs.FlushBuffers;
//           DataModule1.TableID.Edit;
//           DataModule1.TableID.FieldByName('DOSID').AsInteger:=
//            DataModule1.TableID.FieldByName('DOSID').AsInteger + 1;
//           DataModule1.TableID.Post;
//           DataModule1.TableID.FlushBuffers;
       FilterIni.WriteInteger('IDEAS','DOSID', DOSID+1);
//  FilterIni.WriteInteger('JOURNAL_DOS',
  //        RxDBComboBox12.Items[RxDBComboBox12.ItemIndex], StrToInt(DBEdit8.Text));

  if Application.MessageBox(
        'Відкривати новий запис діагноза для дослідження пацієнта ?',
        'Дослідження', MB_OKCANCEL) = IDOK then
         begin
              DataModule1.TableDiag.Append;
               DataModule1.TableDiag.FieldByName('DOSID').AsInteger :=
                DataModule1.TableDos.FieldByName('DOSID').AsInteger;
               DataModule1.TableDiag.FieldByName('DIAGID').AsInteger :=
               DIAGID+1;
//              DataModule1.TableID.FieldByName('DIAGID').AsInteger + 1;
         end else StateOfAll := 'View';
        end else begin StateOfAll := 'View';
                 DataModule1.TableDos.Cancel;
                 end;
       end;

DBDateEdit4.SetFocus;
end;

procedure TFormMain.MaskEdit1Exit(Sender: TObject);
var
Present: TDateTime;
Year, Month, Day: Word;
begin
IF (StateOfAll = 'Append') then begin
IF (Length(Trim(MaskEdit1.Text)) >0) then begin
Present := Date - StrToInt(Trim(MaskEdit1.Text))*365;
DecodeDate(Present, Year, Month, Day);
RxDBCalcEdit1.Text:=IntToStr(Year);
RxDBCalcEdit1.Update;
//MaskEdit1.Text:='';
   end;
                               end;
end;

procedure TFormMain.N32Click(Sender: TObject);
begin
FontDialog1.Options := [fdEffects];
IF (FontDialog1.Execute) then begin
FormMain.Font:= FontDialog1.Font;
   end;

end;

procedure TFormMain.DBEdit1Exit(Sender: TObject);
begin
IF (StateOfAll = 'Append') then begin
DBEdit1.Text:=Trim(UpCaseWinStr(DBEdit1.Text));
DBEdit1.Text:=Copy(DBEdit1.Text, 1,length(DBEdit1.Text)-2)+'.'+
Copy(DBEdit1.Text, length(DBEdit1.Text),1)+'.';
 end;
end;

procedure TFormMain.RxDBComboBox1Enter(Sender: TObject);
begin
//восстановление справедливости
    RxDBComboBox1.OnExit:= RxDBComboBox1Exit;
IF (StateOfAll = 'Append') then  begin
    RxDBComboBox1.DroppedDown:=True;
    RxDBComboBox1.ItemIndex :=0;
                                 end;
                   
end;

procedure TFormMain.RxDBComboBox10Enter(Sender: TObject);
begin
RxDBComboBox10.OnExit:= RxDBComboBox10Exit;
IF (StateOfAll = 'Append') then
begin RxDBComboBox10.ItemIndex :=0;
      RxDBComboBox10Change(Sender);
      LoadKeyboardLayout('00000422', KLF_ACTIVATE); //ukr
  end;
end;

procedure TFormMain.DBMemo2Enter(Sender: TObject);
begin
 DBMemo2.OnExit:= DBMemo2Exit;
 LoadKeyboardLayout('00000422', KLF_ACTIVATE); // ukr
end;

procedure TFormMain.RxDBComboBox2Enter(Sender: TObject);
begin
IF (StateOfAll = 'Append') then begin
RxDBComboBox2.DroppedDown:=True;
RxDBComboBox2.ItemIndex :=0;     end;
//SendMessage(RxDBComboBox2.Handle, CBN_EDITCHANGE, 0,0);
end;

procedure TFormMain.RxDBComboBox6Enter(Sender: TObject);
begin
IF (StateOfAll = 'Append') then
begin RxDBComboBox6.DroppedDown:=True;
      RxDBComboBox6.ItemIndex :=0;
end;
end;

procedure TFormMain.RxDBComboBox9Enter(Sender: TObject);
begin
RxDBComboBox9.OnExit:= RxDBComboBox9Exit;
IF (StateOfAll = 'Append') then begin
RxDBComboBox9.DroppedDown:=True;
RxDBComboBox9.ItemIndex :=0;
 end;
end;

procedure TFormMain.RxDBComboBox8Enter(Sender: TObject);
begin
IF (StateOfAll = 'Append') then
 begin RxDBComboBox8.DroppedDown:=True;
       RxDBComboBox8.ItemIndex :=1;
 end;
end;

procedure TFormMain.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
 vk_F2: begin N16Click(Sender);
       IF (StateOfAll = 'Append') then
       IF (FormDovidka.ModalResult = mrOK) then begin
      DataModule1.TablePat.FieldByName('DIAGCODE').AsString :=
          DataModule1.TableDiagCode.FieldByName('CODE').AsString;
      DataModule1.TablePat.FieldByName('DIAG').AsString :=
          DataModule1.TableDiagCode.FieldByName('NAME').AsString;
                                                 end;
        end;
 end;//of
end;

procedure TFormMain.DBEdit2Change(Sender: TObject);
begin
IF ((StateOfAll = 'Append') and
    (DataModule1.DSPat.DataSet.State in [dsEdit,dsInsert])) then
    begin
 DataModule1.TableDiagCode.FindNearest([UpperCase(DBEdit2.Text)]);
       DataModule1.TablePat.FieldByName('DIAG').AsString :=
          DataModule1.TableDiagCode.FieldByName('NAME').AsString;
    end;      
end;

procedure TFormMain.RxDBComboBox3Enter(Sender: TObject);
begin
IF (StateOfAll = 'Append') then
  begin RxDBComboBox3.ItemIndex :=0;
        RxDBComboBox3Change(Sender);
  end;      
end;

procedure TFormMain.RxDBComboBox4Enter(Sender: TObject);
begin
 RxDBComboBox4.OnExit:= RxDBComboBox4Exit;
IF (StateOfAll = 'Append') then
begin RxDBComboBox4.ItemIndex :=0;
      RxDBComboBox4Change(Sender);
  end;
end;

procedure TFormMain.RxDBComboBox5Enter(Sender: TObject);
begin
IF (StateOfAll = 'Append') then
begin RxDBComboBox5.ItemIndex :=0;
      RxDBComboBox5Change(Sender);
  end;
end;

procedure TFormMain.RxDBComboBox7Enter(Sender: TObject);
begin
IF (StateOfAll = 'Append') then
begin RxDBComboBox7.ItemIndex :=0;
      RxDBComboBox7Change(Sender);
  end;
end;

procedure TFormMain.RxDBComboBox3Change(Sender: TObject);
begin
 DataModule1.TablePat.FieldByName('RAYON').AsString :=
RxDBComboBox3.Items[RxDBComboBox3.ItemIndex];
 DataModule1.TablePat.FieldByName('RAYONCODE').AsInteger :=
StrToInt(RxDBComboBox3.Values[RxDBComboBox3.ItemIndex]);
end;

procedure TFormMain.RxDBComboBox4Change(Sender: TObject);
begin
      DataModule1.TablePat.FieldByName('PILGA').AsString :=
RxDBComboBox4.Items[RxDBComboBox4.ItemIndex];
      DataModule1.TablePat.FieldByName('PILGACODE').AsInteger :=
StrToInt(RxDBComboBox4.Values[RxDBComboBox4.ItemIndex]);
end;

procedure TFormMain.RxDBComboBox5Change(Sender: TObject);
begin
      DataModule1.TablePat.FieldByName('D_ST').AsString :=
RxDBComboBox5.Items[RxDBComboBox5.ItemIndex];
      DataModule1.TablePat.FieldByName('D_ST_CODE').AsInteger :=
StrToInt(RxDBComboBox5.Values[RxDBComboBox5.ItemIndex]);
end;

procedure TFormMain.RxDBComboBox7Change(Sender: TObject);
begin
      DataModule1.TablePat.FieldByName('VIDDIL').AsString :=
RxDBComboBox7.Items[RxDBComboBox7.ItemIndex];
      DataModule1.TablePat.FieldByName('VIDDILCODE').AsInteger :=
StrToInt(RxDBComboBox7.Values[RxDBComboBox7.ItemIndex]);
end;

procedure TFormMain.RxDBComboBox10Change(Sender: TObject);
begin
      DataModule1.TablePat.FieldByName('DOCTOR').AsString :=
RxDBComboBox10.Items[RxDBComboBox10.ItemIndex];      
      DataModule1.TablePat.FieldByName('DOCTORCODE').AsInteger :=
StrToInt(RxDBComboBox10.Values[RxDBComboBox10.ItemIndex]);
end;

procedure TFormMain.DBEdit2Exit(Sender: TObject);
begin
IF (StateOfAll = 'Append') then
 DataModule1.TablePat.FieldByName('DIAGCODE').AsString :=
 DataModule1.TableDiagCode.FieldByName('CODE').AsString;
end;

procedure TFormMain.DBEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
 vk_F2: begin N17Click(Sender);
       IF (StateOfAll = 'Append') then
       IF (FormDovidka.ModalResult = mrOK) then begin
      DataModule1.TableDos.FieldByName('DOSLIDA').AsString :=
          DataModule1.TableDosCode.FieldByName('NAME').AsString;
      DataModule1.TableDos.FieldByName('DOSLIDCODE').AsString :=
          DataModule1.TableDosCode.FieldByName('CODE').AsString;
                                                 end;
        end;
 end;//of
end;

procedure TFormMain.DBEdit4Change(Sender: TObject);
begin
IF ((StateOfAll = 'Append') and
 (DataModule1.DSDos.DataSet.State in [dsEdit,dsInsert])) 
 then
    begin
 DataModule1.TableDosCode.FindNearest([Trim(DBEdit4.Text)]);
   DataModule1.TableDos.FieldByName('DOSLIDA').AsString :=
     DataModule1.TableDosCode.FieldByName('NAME').AsString;
    end;
end;

procedure TFormMain.DBEdit4Exit(Sender: TObject);
begin
IF (StateOfAll = 'Append') then
 DataModule1.TableDOs.FieldByName('DOSLIDCODE').AsString :=
 DataModule1.TableDosCode.FieldByName('CODE').AsString;
end;

procedure TFormMain.DBEdit6Change(Sender: TObject);
begin
IF ((StateOfAll = 'Append') and
    (DataModule1.DSDiag.DataSet.State in [dsEdit,dsInsert])) then
    begin
 DataModule1.TableDiagCode.FindNearest([UpperCase(DBEdit6.Text)]);
       DataModule1.TableDiag.FieldByName('DIAG').AsString :=
          DataModule1.TableDiagCode.FieldByName('NAME').AsString;
    end;
end;

procedure TFormMain.DBEdit6Exit(Sender: TObject);
begin
IF (StateOfAll = 'Append') then begin
 if Application.MessageBox(
        'Увага: інформацію діагноза дослідження змінено.'+#13#10+' Запам`ятати ?',
        'Діагноз', MB_OKCANCEL) = IDOK then
        begin
         DataModule1.TableDiag.FieldByName('DIAGCODE').AsString :=
          DataModule1.TableDiagCode.FieldByName('CODE').AsString;
         DataModule1.TableDiag.FieldByName('GROUP').AsInteger :=
          DataModule1.TableDiagCode.FieldByName('GROUP').AsInteger;
         DataModule1.TableDiag.Post;
         DataModule1.TableDiag.FlushBuffers;
//           DataModule1.TableID.Edit;
//           DataModule1.TableID.FieldByName('DIAGID').AsInteger:=
//            DataModule1.TableID.FieldByName('DIAGID').AsInteger + 1;
//           DataModule1.TableID.Post;
//             DataModule1.TableID.FlushBuffers;
       FilterIni.WriteInteger('IDEAS','DIAGID', DIAGID+1);
  if Application.MessageBox(
        'Відкривати новий запис УЗ-зображення для діагноза ?',
        'Діагноз', MB_OKCANCEL) = IDOK then
         begin
 //             DataModule1.TableImg.Append;
   //            DataModule1.TableImg.FieldByName('DIAGID').AsInteger :=
     //           DataModule1.TableDiag.FieldByName('DIAGID').AsInteger;
                BitBtn1Click(Sender);
         end else StateOfAll := 'View';
        end else begin StateOfAll := 'View';
                 DataModule1.TableDiag.cancel;
                 end;
       end;
BitBtn1.SetFocus;
end;

procedure TFormMain.DBEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
 vk_F2: begin N16Click(Sender);
       IF (StateOfAll = 'Append') then
       IF (FormDovidka.ModalResult = mrOK) then begin
      DataModule1.TableDiag.FieldByName('DIAGCODE').AsString :=
          DataModule1.TableDiagCode.FieldByName('CODE').AsString;
      DataModule1.TableDiag.FieldByName('DIAG').AsString :=
          DataModule1.TableDiagCode.FieldByName('NAME').AsString;
                                                 end;
        end;
 end;//of
end;

procedure TFormMain.Usreview1Click(Sender: TObject);
begin
  if FormInter = nil then
   FormInter:=TFormInter.Create(Self);
   FormInter.Showmodal;
end;

procedure TFormMain.About1Click(Sender: TObject);
begin
 if AboutBox = nil then
   AboutBox:=TAboutBox.Create(Self);
AboutBox.PMultiimage1.Visible:=False;
AboutBox.RxGIFAnimator1.Animate:=True;
 AboutBox.Showmodal;
end;

procedure TFormMain.JWSServices1Click(Sender: TObject);
begin
//AboutBox.PMultiimage1.Visible:=True;
// AboutBox.Showmodal;
end;

procedure TFormMain.Panel9Enter(Sender: TObject);
begin
DBNavigator1.DataSource:=DataModule1.DSDos;
DBStatusLabel3.Font.Style:=DBStatusLabel3.Font.Style + [fsBold];
DBStatusLabel1.Font.Style:=DBStatusLabel1.Font.Style - [fsBold];
DBStatusLabel4.Font.Style:=DBStatusLabel1.Font.Style;
DBStatusLabel2.Font.Style:=DBStatusLabel1.Font.Style;
end;

procedure TFormMain.ComboFill;
begin
RxDBComboBox3.Items.Clear;
RxDBComboBox3.Values.Clear;
with DataModule1.TableRayon DO
  begin
  First;
while not EOF DO
    begin
RxDBComboBox3.Items.Add(FieldByName('NAME').AsString);
RxDBComboBox3.Values.Add(IntToStr(FieldByName('CODE').AsInteger));
 Next;
     end;
  end;

RxDBComboBox4.Items.Clear;
RxDBComboBox4.Values.Clear;
with DataModule1.TablePilga DO
  begin
  First;
while not EOF DO
    begin
RxDBComboBox4.Items.Add(FieldByName('NAME').AsString);
RxDBComboBox4.Values.Add(IntToStr(FieldByName('CODE').AsInteger));
 Next;
     end;
  end;

RxDBComboBox5.Items.Clear;
RxDBComboBox5.Values.Clear;
with DataModule1.TableState DO
  begin
  First;
while not EOF DO
    begin
RxDBComboBox5.Items.Add(FieldByName('NAME').AsString);
RxDBComboBox5.Values.Add(IntToStr(FieldByName('CODE').AsInteger));
 Next;
     end;
  end;

RxDBComboBox7.Items.Clear;
RxDBComboBox7.Values.Clear;
with DataModule1.TableViddil DO
  begin
  First;
while not EOF DO
    begin
RxDBComboBox7.Items.Add(FieldByName('NAME').AsString);
RxDBComboBox7.Values.Add(IntToStr(FieldByName('CODE').AsInteger));
 Next;
     end;
  end;

RxDBComboBox10.Items.Clear;
RxDBComboBox10.Values.Clear;
with DataModule1.TableDoc DO
  begin
  First;
while not EOF DO
    begin
RxDBComboBox10.Items.Add(FieldByName('NAME').AsString);
RxDBComboBox10.Values.Add(IntToStr(FieldByName('CODE').AsInteger));
 Next;
     end;
  end;

RxDBComboBox11.Items.Clear;
RxDBComboBox11.Values.Clear;
with DataModule1.TableDosType DO
  begin
  First;
while not EOF DO
    begin
RxDBComboBox11.Items.Add(FieldByName('NAME').AsString);
RxDBComboBox11.Values.Add(IntToStr(FieldByName('CODE').AsInteger));
 Next;
     end;
  end;

end;


procedure TFormMain.RxDBComboBox4Exit(Sender: TObject);
begin
IF (StateOfAll = 'Append') then
IF (RxDBComboBox4.ItemIndex = 0) then
   begin RxDBComboBox5.ItemIndex :=0;
         RxDBComboBox5Change(Sender);
         RxDBComboBox6.SetFocus;
   end;
end;

procedure TFormMain.RxDBComboBox9Exit(Sender: TObject);
begin
IF (StateOfAll = 'Append') then
IF (RxDBComboBox9.ItemIndex = 1) then
   begin RxDBComboBox8.ItemIndex :=0;
         RxDBComboBox10.SetFocus;
//         DBEdit2.SetFocus;
   end;
end;

procedure TFormMain.Gettingstarted1Click(Sender: TObject);
begin
// Application.HelpCommand(HELP_CONTENTS, 0);
  Application.HelpContext(0);
end;

procedure TFormMain.DBEdit2Enter(Sender: TObject);
begin
DBEdit2.OnExit:= DBEdit2Exit;
IF ((StateOfAll = 'Append') and
    (DataModule1.DSPat.DataSet.State in [dsEdit,dsInsert])) then
     LoadKeyboardLayout('00000409', KLF_ACTIVATE); // English
FormMain.DBEdit2Change(Sender);
end;

procedure TFormMain.DBEdit4Enter(Sender: TObject);
begin
DBEdit4.OnExit:= DBEdit4Exit;
IF ((StateOfAll = 'Append') and
    (DataModule1.DSDos.DataSet.State in [dsEdit,dsInsert])) then
     LoadKeyboardLayout('00000409', KLF_ACTIVATE); // English
FormMain.DBEdit4Change(Sender);
end;

procedure TFormMain.DBEdit6Enter(Sender: TObject);
begin
DBEdit6.OnExit:= DBEdit6Exit;
IF ((StateOfAll = 'Append') and
    (DataModule1.DSDiag.DataSet.State in [dsEdit,dsInsert])) then
     LoadKeyboardLayout('00000409', KLF_ACTIVATE); // English
DBEdit6.Text:= DataModule1.TableDiagCode.FieldByName('CODE').AsString;
FormMain.DBEdit6Change(Sender);
end;

procedure TFormMain.N27Click(Sender: TObject);
begin
 if FormDovidka = nil then
 FormDovidka:=TFormDovidka.Create(Self);
 FormDovidka.TN1.PageIndex:=7;
 FormDovidka.Showmodal;
end;

procedure TFormMain.RxDBComboBox11Enter(Sender: TObject);
begin
IF (StateOfAll = 'Append') then
begin RxDBComboBox11.DroppedDown:=True;
RxDBComboBox11.ItemIndex :=0;
end;
end;

procedure TFormMain.RxDBComboBox11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
 vk_F2: begin N27Click(Sender);
        end;
 end;//of
end;

procedure TFormMain.RxDBComboBox6Change(Sender: TObject);
begin
IF (StateOfAll = 'Append') then begin
 with DataModule1.TableViddil DO
  begin
  Filtered:=False;
  Filter:= 'CODEL = '''+RxDBComboBox6.Values[RxDBComboBox6.ItemIndex]+'''';
  Filtered:=True;
  end;

 RxDBComboBox7.Items.Clear;
 RxDBComboBox7.Values.Clear;
 with DataModule1.TableViddil DO
  begin
  First;
 while not EOF DO
    begin
 RxDBComboBox7.Items.Add(FieldByName('NAME').AsString);
 RxDBComboBox7.Values.Add(IntToStr(FieldByName('CODE').AsInteger));
 Next;
     end;
  end;
                                end;
end;

procedure TFormMain.DBEdit8Enter(Sender: TObject);
begin
IF (StateOfAll = 'Append') then begin
  with FilterIni do begin
  case StrToInt(RxDBComboBox12.Items[RxDBComboBox12.ItemIndex]) of
1: DBEdit8.Text:= IntToStr(ReadInteger('JOURNAL_DOS', '1', 0)+ 1);
2: DBEdit8.Text:= IntToStr(ReadInteger('JOURNAL_DOS', '2', 0)+ 1);
3: DBEdit8.Text:= IntToStr(ReadInteger('JOURNAL_DOS', '3', 0)+ 1);
4: DBEdit8.Text:= IntToStr(ReadInteger('JOURNAL_DOS', '4', 0)+ 1);
5: DBEdit8.Text:= IntToStr(ReadInteger('JOURNAL_DOS', '5', 0)+ 1);
 end;//of

                    end;
 end;
end;

procedure TFormMain.RxDBComboBox12Enter(Sender: TObject);
begin
IF (StateOfAll = 'Append') then begin
RxDBComboBox12.DroppedDown:=True;
RxDBComboBox12.ItemIndex :=0;     end;
end;

procedure TFormMain.DBEdit9Change(Sender: TObject);
begin
IF ((StateOfAll = 'Append') and
    (DataModule1.DSDiag.DataSet.State in [dsEdit,dsInsert])) then
    begin
 DataModule1.TableDiagCode.FindNearest([DBEdit9.Text]);
    end;

end;

procedure TFormMain.DBEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
 vk_F2: begin
        DataModule1.TableDiagcode.Filtered:=False;
        N16Click(Sender);
       IF (StateOfAll = 'Append') then
       IF (FormDovidka.ModalResult = mrOK) then begin
      DataModule1.TableDiag.FieldByName('GROUP').AsInteger :=
          DataModule1.TableDiagCode.FieldByName('GROUP').AsInteger;
                                                 end;
        end;
 end;//of
end;

procedure TFormMain.DBEdit9Exit(Sender: TObject);
begin
 with DataModule1.TableDiagcode DO
  begin
  Filter:= 'GROUP = '''+DBEdit9.Text+'''';
  Filtered:=True;
//    showmessage(DataModule1.TableDiagcode.Filter);
  end;
end;

procedure TFormMain.DBEdit1Enter(Sender: TObject);
begin
DBEdit1.OnExit:= DBEdit1Exit;
end;

procedure TFormMain.DBEdit9Enter(Sender: TObject);
begin
IF (StateOfAll = 'Append') then DBEdit9.Text:='0';
//DBEdit9.OnExit:= DBEdit9Exit;
end;

procedure TFormMain.DBDateEdit3Enter(Sender: TObject);
begin
IF (StateOfAll = 'Append') then
    DBDateEdit3.Text:=DateToStr(Date);
end;

procedure TFormMain.RxDBCalcEdit1Exit(Sender: TObject);
var
Year, Month, Day: Word;
begin
IF (StateOfAll = 'Append') then begin
IF ((StrToInt(RxDBCalcEdit1.Text) < 1900)
     and (StrToInt(RxDBCalcEdit1.Text) > 1)
     and (length(RxDBCalcEdit1.Text) > 0))
    then showmessage('Рік народження введено не повністю !');
DecodeDate(Date, Year, Month, Day);
MaskEdit1.Text:=IntToStr((Year-1) - StrToInt(RxDBCalcEdit1.Text));
                                end;
end;

procedure TFormMain.DBEdit1ButtonClick(Sender: TObject);
begin
 DataModule1.TablePib.FindNearest([UpCaseWinStr(DBEdit1.Text)]);
end;

procedure TFormMain.DBDateEdit4Enter(Sender: TObject);
begin
IF (StateOfAll = 'Append') then
    DBDateEdit4.Text:=DateToStr(Date);
end;

procedure TFormMain.DBDateEdit2Enter(Sender: TObject);
begin
IF (StateOfAll = 'Append') then
    DBDateEdit2.Text:=DateToStr(Date);
end;

procedure TFormMain.N15Click(Sender: TObject);
begin
PDlg2.Showmodal;
if (Moderator ='Admin') then begin
 DBNavigator1.VisibleButtons := DBNavigator1.VisibleButtons +
 [nbDelete, nbEdit, nbPost];
 N31.Enabled:=True;         end
  else
 DBNavigator1.VisibleButtons := DBNavigator1.VisibleButtons -
 [nbDelete, nbEdit, nbPost];
end;

procedure TFormMain.FormActivate(Sender: TObject);
begin
 if FormFrame2Base = nil then
    FormFrame2Base:=TFormFrame2Base.Create(Self);
 if FormRolikParam = nil then
    FormRolikParam:=TFormRolikParam.Create(Self);

if (Moderator ='Admin') then N31.Enabled:=True;

Label32.Caption:=IntToStr(DIAGID);
Label33.Caption:=IntToStr(DOSID);
Label34.Caption:=IntToStr(PATID);
Label35.Caption:=IntToStr(PIBID);
end;

procedure TFormMain.N31Click(Sender: TObject);
begin
 if FormFrame2Base = nil then
   FormFrame2Base:=TFormFrame2Base.Create(Self);
   FormFrame2Base.Showmodal;
end;

end.
