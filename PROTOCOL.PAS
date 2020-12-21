unit protocol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, RXCtrls, ComCtrls, Tabnotbk, Mask, ToolWin,
  XcdZipD3, FileUtil, qrprntr, quickrpt,
    qrextra, qrhtml, Menus, ToolEdit;

type
  TFormProtocol = class(TForm)
    Panel2: TPanel;
    TabbedNotebook1: TTabbedNotebook;
    ScrollBox1: TScrollBox;
    RxLabel3: TRxLabel;
    a1000Label5: TLabel;
    a1001Label6: TLabel;
    a1003Label7: TLabel;
    a1005Label8: TLabel;
    a1008Label3: TLabel;
    a1009Label9: TLabel;
    a1011Label10: TLabel;
    a1013Label11: TLabel;
    a1015Label12: TLabel;
    a1019Label13: TLabel;
    a1022Label14: TLabel;
    a1024Label15: TLabel;
    a1002MaskEdit1: TMaskEdit;
    a1004MaskEdit2: TMaskEdit;
    a1006ComboBox1: TComboBox;
    a1010ComboBox2: TComboBox;
    a1012ComboBox3: TComboBox;
    a1014ComboBox4: TComboBox;
    a1016ComboBox5: TComboBox;
    a1018Edit5: TEdit;
    a1021Edit6: TEdit;
    a1020ComboBox6: TComboBox;
    a1023ComboBox7: TComboBox;
    a1007MaskEdit3: TMaskEdit;
    a1017Label16: TLabel;
    XceedZip2: TXceedZip;
    Edit7: TEdit;
    a1025Label17: TLabel;
    a1026ComboBox8: TComboBox;
    a1027Label18: TLabel;
    a1028ComboBox9: TComboBox;
    a1029Edit8: TEdit;
    a1030Label19: TLabel;
    a1031MaskEdit4: TMaskEdit;
    a1033MaskEdit5: TMaskEdit;
    a1032Label20: TLabel;
    a1035MaskEdit6: TMaskEdit;
    a1034Label21: TLabel;
    a1036Label22: TLabel;
    a1037Label23: TLabel;
    a1038MaskEdit7: TMaskEdit;
    a1040MaskEdit8: TMaskEdit;
    a1039Label24: TLabel;
    a1041Label25: TLabel;
    a1042MaskEdit9: TMaskEdit;
    a1043Label26: TLabel;
    a1047Label27: TLabel;
    a1051Label28: TLabel;
    a1055Label29: TLabel;
    a1057Label30: TLabel;
    a1059Label31: TLabel;
    a1062Label32: TLabel;
    a1044ComboBox10: TComboBox;
    a1045ComboBox11: TComboBox;
    a1046ComboBox12: TComboBox;
    a1048ComboBox13: TComboBox;
    a1050ComboBox14: TComboBox;
    a1049Label33: TLabel;
    a1053Label35: TLabel;
    a1056ComboBox17: TComboBox;
    a1052ComboBox15: TComboBox;
    a1054ComboBox16: TComboBox;
    a1058ComboBox18: TComboBox;
    a1060ComboBox19: TComboBox;
    a1061MaskEdit10: TMaskEdit;
    a1063ComboBox20: TComboBox;
    a1064Label34: TLabel;
    a1065ComboBox21: TComboBox;
    a1066Edit9: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    a1067Label36: TLabel;
    a1068Label37: TLabel;
    a1069MaskEdit11: TMaskEdit;
    a1072Label39: TLabel;
    a1071MaskEdit12: TMaskEdit;
    a1073MaskEdit13: TMaskEdit;
    a1074Label38: TLabel;
    a1076Label40: TLabel;
    a1075ComboBox22: TComboBox;
    a1077ComboBox23: TComboBox;
    a1078Label41: TLabel;
    a1079ComboBox24: TComboBox;
    a1080Edit10: TEdit;
    a1081Label42: TLabel;
    a1082ComboBox25: TComboBox;
    a1083Edit11: TEdit;
    a1084Label43: TLabel;
    a1085MaskEdit14: TMaskEdit;
    Bevel4: TBevel;
    a1086Label44: TLabel;
    a1087Label45: TLabel;
    a1088MaskEdit15: TMaskEdit;
    a1090MaskEdit16: TMaskEdit;
    a1089Label47: TLabel;
    a1091Label46: TLabel;
    a1092ComboBox26: TComboBox;
    a1093Edit12: TEdit;
    a1094Label48: TLabel;
    a1095ComboBox27: TComboBox;
    a1096Edit13: TEdit;
    a1097Label49: TLabel;
    a1098MaskEdit17: TMaskEdit;
    Bevel5: TBevel;
    a1099Label50: TLabel;
    Panel3: TPanel;
    RxLabel1: TRxLabel;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    MainMenu1: TMainMenu;
    N31: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ScrollBox2: TScrollBox;
    RxLabel2: TRxLabel;
    a4000Label51: TLabel;
    Edit14: TEdit;
    a4001Label52: TLabel;
    a4002Edit15: TEdit;
    a4003Label53: TLabel;
    a4004ComboBox28: TComboBox;
    a4005Edit16: TEdit;
    a4006Label54: TLabel;
    a4007ComboBox29: TComboBox;
    a4008MaskEdit18: TMaskEdit;
    a4009Label55: TLabel;
    a4010Label56: TLabel;
    a4011Label57: TLabel;
    a4012Edit17: TEdit;
    a4013Label58: TLabel;
    a4014ComboBox30: TComboBox;
    a4015Edit18: TEdit;
    a4016Label59: TLabel;
    a4017ComboBox31: TComboBox;
    a4018MaskEdit19: TMaskEdit;
    a4019Label60: TLabel;
    a4020Label61: TLabel;
    a4021ComboBox32: TComboBox;
    a4022Edit19: TEdit;
    N9: TMenuItem;
    a1100Label62: TLabel;
    a1101MaskEdit20: TMaskEdit;
    a1102Label63: TLabel;
    a1103MaskEdit21: TMaskEdit;
    a1103Label64: TLabel;
    a1114Label65: TLabel;
    a1104ComboBox33: TComboBox;
    a1116Edit20: TEdit;
    a1115ComboBox34: TComboBox;
    a1105ComboBox35: TComboBox;
    a1106Label66: TLabel;
    a1107ComboBox36: TComboBox;
    a1108Label67: TLabel;
    a1111ComboBox37: TComboBox;
    a1109MaskEdit22: TMaskEdit;
    a1110Label68: TLabel;
    a1112Label69: TLabel;
    a1113ComboBox38: TComboBox;
    a1118ComboBox39: TComboBox;
    a1117Label70: TLabel;
    a1119MaskEdit23: TMaskEdit;
    a1121ComboBox40: TComboBox;
    a1120Label73: TLabel;
    a1122MaskEdit24: TMaskEdit;
    a1124ComboBox41: TComboBox;
    a1123Label74: TLabel;
    a1125MaskEdit25: TMaskEdit;
    Bevel6: TBevel;
    a1126Label71: TLabel;
    a1127Label72: TLabel;
    a1128MaskEdit26: TMaskEdit;
    a1129Label75: TLabel;
    a1130MaskEdit27: TMaskEdit;
    a1131Label76: TLabel;
    a1142Label77: TLabel;
    a1132ComboBox42: TComboBox;
    a1144Edit21: TEdit;
    a1143ComboBox43: TComboBox;
    a1133ComboBox44: TComboBox;
    a1134Label78: TLabel;
    a1135ComboBox45: TComboBox;
    a1136Label79: TLabel;
    a1139ComboBox46: TComboBox;
    a1137MaskEdit28: TMaskEdit;
    a1138Label80: TLabel;
    a1140Label81: TLabel;
    a1141ComboBox47: TComboBox;
    a1146ComboBox48: TComboBox;
    a1145Label82: TLabel;
    a1147MaskEdit29: TMaskEdit;
    a1149ComboBox49: TComboBox;
    a1148Label83: TLabel;
    a1150MaskEdit30: TMaskEdit;
    a1151Label84: TLabel;
    a1153MaskEdit31: TMaskEdit;
    Bevel7: TBevel;
    a1154Label85: TLabel;
    a1155Label3: TLabel;
    a1156ComboBox1: TComboBox;
    a1157Label5: TLabel;
    a1159Label6: TLabel;
    a1162Label7: TLabel;
    a1161Edit5: TEdit;
    a1158ComboBox2: TComboBox;
    a1160ComboBox3: TComboBox;
    a1163ComboBox4: TComboBox;
    a1164MaskEdit1: TMaskEdit;
    Bevel8: TBevel;
    a1165Label8: TLabel;
    a1166Label9: TLabel;
    a1167MaskEdit2: TMaskEdit;
    a1168Label10: TLabel;
    a1169MaskEdit3: TMaskEdit;
    a1170Label11: TLabel;
    a1171ComboBox5: TComboBox;
    a1172Label12: TLabel;
    a1173ComboBox6: TComboBox;
    a1174Label13: TLabel;
    a1175ComboBox7: TComboBox;
    a1176Edit6: TEdit;
    Bevel9: TBevel;
    a1177Label14: TLabel;
    a1178Memo1: TMemo;
    Bevel10: TBevel;
    a1179Label15: TLabel;
    a1180Memo2: TMemo;
    Bevel11: TBevel;
    a1182DateEdit1: TDateEdit;
    a1184Label16: TLabel;
    Bevel12: TBevel;
    ScrollBox3: TScrollBox;
    Button1: TButton;
    RxLabel4: TRxLabel;
    Bevel13: TBevel;
    Edit9: TEdit;
    a1070Label17: TLabel;
    Label17: TLabel;
    ScrollBox4: TScrollBox;
    RxLabel5: TRxLabel;
    Bevel14: TBevel;
    Label18: TLabel;
    Button2: TButton;
    Edit10: TEdit;
    ScrollBox5: TScrollBox;
    RxLabel6: TRxLabel;
    Bevel15: TBevel;
    Label19: TLabel;
    Button3: TButton;
    Edit11: TEdit;
    Bevel16: TBevel;
    Bevel17: TBevel;
    Bevel18: TBevel;
    a1185ComboBox1: TComboBox;
    a1152ComboBox50: TComboBox;
    a1181Label3: TLabel;
    a1183Edit5: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure a1182DateEdit1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ProtocolExport;
  end;

var
  FormProtocol: TFormProtocol;
    FormSubst : TQuickRep;
  ic:integer;
  AtlasFileName: string;

implementation

{$R *.DFM}
uses data, image1, main1, export1,
     Qrorder0, qrorder1, Qrorder2, Qrorder3, Qrorder4;


procedure TFormProtocol.FormActivate(Sender: TObject);
begin
TabbedNotebook1.PageIndex:=0;

IF (StateOfAll = 'Append') then
    N3.Enabled:= False else
    N3.Enabled:= True;

Edit1.Text := FormMain.DBEdit1.Text;
Edit2.Text := FormMain.RxDBCalcEdit1.Text;
Edit4.Text := FormMain.DBEdit3.Text;
Edit3.SetFocus;
end;

procedure TFormProtocol.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
IF Key = 27 then  //ESCape
  begin
    TEdit(ActiveControl).Color:=clWindow;
    SelectNext(ActiveControl as tWinControl, False, True );
    Key := 0;
    TEdit(ActiveControl).Color:=clAqua;
  end;
end;

procedure TFormProtocol.FormKeyPress(Sender: TObject; var Key: Char);
begin
case Key of
#13: begin //Enter
     TEdit(ActiveControl).Color:=clWindow;
       SelectNext(ActiveControl as tWinControl, True, True );
       Key := #0;
     TEdit(ActiveControl).Color:=clAqua;
     TComboBox(ActiveControl).ItemIndex:=0;
     end;
#32: TComboBox(ActiveControl).DroppedDown:=True;

'і': Key :='i';
'І': Key :='I';

 end;//of
end;

procedure TFormProtocol.N1Click(Sender: TObject);
begin
  Application.HelpContext(5);
end;

procedure TFormProtocol.N6Click(Sender: TObject);
begin
Close;
end;

procedure TFormProtocol.N2Click(Sender: TObject);
begin
case TabbedNotebook1.PageIndex of
0: //черевна порожнина
   begin
 if FormQReport0 = nil then FormQReport0:=TFormQReport0.Create(Self);
   try
   FormQReport0.Prepare;
   FormQReport0.QRPrinter.Save('detapro.qrp');
    finally
   FormQReport0.QRPrinter.Free;
   FormQReport0.QRPrinter := nil;
   FormQReport0.Free;
   FormQReport0 := nil;
    end;
   end;
1: //серце
   begin
 if FormQReport1 = nil then FormQReport1:=TFormQReport1.Create(Self);
   try
   FormQReport1.Prepare;
   FormQReport1.QRPrinter.Save('detapro.qrp');
    finally
   FormQReport1.QRPrinter.Free;
   FormQReport1.QRPrinter := nil;
   FormQReport1.Free;
   FormQReport1 := nil;
    end;
   end;
2: //щитовидна
   begin
 if FormQReport2 = nil then FormQReport2:=TFormQReport2.Create(Self);
   try
   FormQReport2.Prepare;
   FormQReport2.QRPrinter.Save('detapro.qrp');
    finally
   FormQReport2.QRPrinter.Free;
   FormQReport2.QRPrinter := nil;
   FormQReport2.Free;
   FormQReport2 := nil;
    end;
   end;
3: //молочні
   begin
 if FormQReport3 = nil then FormQReport3:=TFormQReport3.Create(Self);
   try
   FormQReport3.Prepare;
   FormQReport3.QRPrinter.Save('detapro.qrp');
    finally
   FormQReport3.QRPrinter.Free;
   FormQReport3.QRPrinter := nil;
   FormQReport3.Free;
   FormQReport3 := nil;
    end;
    end;
4: //малий таз
   begin
  if FormQReport4 = nil then FormQReport4:=TFormQReport4.Create(Self);
   try
   FormQReport4.Prepare;
   FormQReport4.QRPrinter.Save('detapro.qrp');
    finally
   FormQReport4.QRPrinter.Free;
   FormQReport4.QRPrinter := nil;
   FormQReport4.Free;
   FormQReport4 := nil;
    end;
   end;
 end;//case

  XceedZip2.FilesToProcess.Add('detapro.qrp');
  ic:= XceedZip2.Add(xecAll);
IF (ic > 40) then Showmessage('Не можу створити архів Pro! Код: '
    + inttostr(ic))
             else
  DataModule1.TableDosDETAPRO.LoadFromFile('detapro.zip');
  if (Application.MessageBox(
        'ПОВНИЙ протокол дослідження пацієнта записано.'+#13#10
        +' Переходим до діагнозів ?',
        'Дослідження', MB_YESNO) = IDYES) then N6Click(Sender);
end;


procedure TFormProtocol.ProtocolExport;
var
Txt1,Txt_file : TextFile;
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
    stringArj : string;
begin
IF FormExport1.CheckBox1.Checked  then begin
 if FormImage = nil then FormImage:=TFormImage.Create(Self);
 FormImage.DBMultiMedia1.SaveToFileAsBMP('detapro.bmp');
                                       end;

ic:= TabbedNotebook1.PageIndex;
case TabbedNotebook1.PageIndex of
0: //черевна порожнина
   begin
 if FormQReport0 = nil then FormQReport0:=TFormQReport0.Create(Self);
    FormQReport0.CreateLabels;
    FormQReport0.Prepare;
    FormSubst := FormQReport0;
   end;
1: begin
 if FormQReport1 = nil then FormQReport1:=TFormQReport1.Create(Self);
    FormQReport1.Prepare;
    FormSubst := FormQReport1;
   end;
2: begin
 if FormQReport2 = nil then FormQReport2:=TFormQReport2.Create(Self);
    FormQReport2.Prepare;
    FormSubst := FormQReport2;
   end;
3: begin
 if FormQReport3 = nil then FormQReport3:=TFormQReport3.Create(Self);
  with FormQReport3 do
  begin
    FormQReport3.CreateLabels;
    FormQReport3.Prepare;
    FormSubst := FormQReport3;
//    FormQReport3.FreeLabels;
  end;
   end;
4: begin
 if FormQReport4 = nil then FormQReport4:=TFormQReport4.Create(Self);
    FormQReport4.Prepare;
    FormSubst := FormQReport4;
   end;
end;//case tabbed


 case FormExport1.RadioGroup1.ItemIndex of
 0: FormSubst.Preview;
 // To Printer
 1: case FormExport1.RadioGroup2.ItemIndex of
    0: FormSubst.Print;
    1: begin
    FormSubst.ExportToFilter(TQRASCIIExportFilter.Create('PRN'));
// это варианты через СReport
//       FormReport.CReport1.PrintToFile('detapro.txt');
//       PrintTextFile('detapro.txt');
//       FormReport.CReport1.PrintToFile('PRN');
       end;
    end;//case in

 //Atlas
 2: begin
  FormSubst.ExportToFilter(TQRHTMLExportFilter.Create('detapro.tmp'));

  DecodeDate(DataModule1.TableDos.FieldByName('DATEIN').AsDateTime, Year, Month, Day);
  DecodeTime(Now, Hour, Min, Sec, MSec);

  AtlasFileName:='N'
 +IntToStr(DataModule1.TableDos.FieldByName('NUMBER').AsInteger)
 +'d'+ IntToStr(Day) + IntToStr(Month) + IntToStr(Year)
 +'t'+ IntToStr(Sec) + IntToStr(Min);

IF FormExport1.CheckBox1.Checked  then begin
 if FormImage = nil then FormImage:=TFormImage.Create(Self);
 FormImage.DBMultiMedia1.SaveToFileAsGIF(AtlasFileName+'.gif');
                                       end;

AssignFile(Txt1, AtlasFileName+'.htm');
 Rewrite(Txt1);

WriteLn(Txt1,'<HTML>');
WriteLn(Txt1,'<HEAD>');
WriteLn(Txt1,'<TITLE>MedixWare 2000, УЗ-атлас</TITLE>');
WriteLn(Txt1,'</HEAD>');
WriteLn(Txt1,'<BODY>');
WriteLn(Txt1,'<body BACKGROUND="info.gif">');
WriteLn(Txt1,'<CENTER>');
 IF FormExport1.CheckBox1.Checked  then
 WriteLn(Txt1,'<IMG SRC="'+AtlasFileName+'.gif">');
WriteLn(Txt1,'</BODY>');
WriteLn(Txt1,'</HTML>');

AssignFile(Txt_file, 'detapro.tmp');
Reset(Txt_file);
while not EOF(Txt_file) do begin
ReadLn(Txt_File, StringArj);
WriteLn(Txt1, StringArj);
 end;
 CloseFile(Txt_file);

 CloseFile(Txt1);
  end;

 end;//case
 // а теперь протокол в базу ???
// N2Click(Sender);

TabbedNotebook1.PageIndex:=ic;
showmessage('Cтворення протоколу виконано.');
case TabbedNotebook1.PageIndex of
0: begin
  FormQReport0.Free;
  FormQReport0 := nil;
   end;
1: begin
  FormQReport1.Free;
  FormQReport1 := nil;
   end;
2: begin
  FormQReport2.Free;
  FormQReport2 := nil;
   end;
3: begin
  FormQReport3.Free;
  FormQReport3 := nil;
   end;
4: begin
  FormQReport4.Free;
  FormQReport4 := nil;
   end;
end;//case tabbed2

  FormSubst := nil;

  DeleteFile('detapro.tmp');
  DeleteFile('detapro.qrp');
  DeleteFile('detapro.zip');
  DeleteFile('detapro.bmp');
end;

procedure TFormProtocol.N9Click(Sender: TObject);
begin
 if FormExport1 = nil then FormExport1:=TFormExport1.Create(Self);
 FormExport1.ShowModal;
 if (FormExport1.ModalResult = mrOk) then begin
     ARTIFACT := False;
     ProtocolExport;
                                          end;
end;

procedure TFormProtocol.N3Click(Sender: TObject);
begin
 if FormExport1 = nil then FormExport1:=TFormExport1.Create(Self);
 FormExport1.ShowModal;
 if (FormExport1.ModalResult = mrOk) then begin
  DataModule1.TableDosDETAPRO.SaveToFile('detapro.zip');
    ic:= XceedZip2.Extract(xecAll);
IF (ic > 40) then Showmessage('Не можу відкрити протокол! Код: '
    + inttostr(ic))
             else
              begin
   QRPFileName := 'detapro.qrp';
   ARTIFACT := True;
   ProtocolExport;
              end;
end;
end;

procedure TFormProtocol.FormCreate(Sender: TObject);
begin
a1185ComboBox1.Items.Clear;
with DataModule1.TableDoc DO
  begin
  First;
while not EOF DO
    begin
a1185ComboBox1.Items.Add(FieldByName('NAME').AsString);
 Next;
     end;
  end;
//  messagebeep(0);
end;

procedure TFormProtocol.a1182DateEdit1Enter(Sender: TObject);
begin
a1182DateEdit1.Text:=DateToStr(Date);
end;

end.
