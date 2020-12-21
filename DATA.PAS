unit data;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, BDEUtils, dbiProcs, dbiTypes, XcdZipD3, DBFilter, mplayer,
  jws99;

type
  TDataModule1 = class(TDataModule)
    TablePib: TTable;
    DSPib: TDataSource;
    TablePat: TTable;
    TableDos: TTable;
    TableDiag: TTable;
    TableImg: TTable;
    DSPat: TDataSource;
    DSDos: TDataSource;
    DSDiag: TDataSource;
    DSImg: TDataSource;
    TableViddil: TTable;
    TableDoc: TTable;
    TableRayon: TTable;
    TablePilga: TTable;
    TableState: TTable;
    TableDiagcode: TTable;
    TableDosCode: TTable;
    TableDiagDOSID: TFloatField;
    TableDiagDIAGID: TFloatField;
    TableDiagDIAGCODE: TStringField;
    TableDiagDIAG: TStringField;
    TablePibPIBID: TFloatField;
    TablePibPIB: TStringField;
    TablePibSEX: TStringField;
    TablePibDATEIN: TDateField;
    TablePatPIBID: TFloatField;
    TablePatPATID: TFloatField;
    TablePatDATECARD: TDateField;
    TablePatFIRST: TStringField;
    TablePatRAYON: TStringField;
    TablePatFROM: TStringField;
    TablePatVIDDIL: TStringField;
    TablePatDIAGCODE: TStringField;
    TablePatDIAG: TStringField;
    TableDosPATID: TFloatField;
    TableDosDOSID: TFloatField;
    TableDosPROTOCOL: TMemoField;
    TableDosDOSLID: TStringField;
    TableImgDIAGID: TFloatField;
    TableImgSCAN: TBlobField;
    TableID: TTable;
    TablePatDOCTOR: TStringField;
    TablePatOPERDONE: TStringField;
    TablePatPILGA: TStringField;
    TablePatD_ST: TStringField;
    TablePatOPER_ST: TStringField;
    DSViddil: TDataSource;
    DSDoc: TDataSource;
    DSRayon: TDataSource;
    DSPilga: TDataSource;
    DSState: TDataSource;
    DSDiagCode: TDataSource;
    DSDosCode: TDataSource;
    TableViddilCODE: TSmallintField;
    TableViddilCODEL: TStringField;
    TableViddilNAME: TStringField;
    TableDocCODE: TSmallintField;
    TableDocNAME: TStringField;
    TableRayonCODE: TSmallintField;
    TableRayonNAME: TStringField;
    TablePilgaCODE: TSmallintField;
    TablePilgaNAME: TStringField;
    TableStateCODE: TSmallintField;
    TableStateNAME: TStringField;
    TableDiagcodeGROUP: TFloatField;
    TableDiagcodeCODE: TStringField;
    TableDiagcodeNAME: TStringField;
    TableDosCodeNAME: TStringField;
    TableDosCodeOD: TFloatField;
    TableDosCodeGROUP: TFloatField;
    TableDosCodeDK1: TSmallintField;
    TableDosCodeDK2: TSmallintField;
    TablePibQ: TStringField;
    TablePatQ: TStringField;
    TableDosQ: TStringField;
    TableDiagQ: TStringField;
    TableImgQ: TStringField;
    XceedZip1: TXceedZip;
    TableIDPIBID: TFloatField;
    TableIDPATID: TFloatField;
    TableIDDOSID: TFloatField;
    TableIDDIAGID: TFloatField;
    TableDosDOSLIDCODE: TStringField;
    TableDosCodeCODE: TStringField;
    TablePibBIRTH: TSmallintField;
    TableImgSCANDATE: TDateField;
    TableDosDATEIN: TDateField;
    TableDosTYPEPRO: TStringField;
    TableDiagDATEIN: TDateField;
    TableDosType: TTable;
    DSDosType: TDataSource;
    TableDosTypeCODE: TSmallintField;
    TableDosTypeNAME: TStringField;
    TableDosJOURNAL: TSmallintField;
    TableDosNUMBER: TStringField;
    TableImgANOTTIF: TMemoField;
    TableViddilQ: TStringField;
    TableDocQ: TStringField;
    TableRayonQ: TStringField;
    TablePilgaQ: TStringField;
    TableStateQ: TStringField;
    TableDiagcodeQ: TStringField;
    TableDosCodeQ: TStringField;
    TableDosTypeQ: TStringField;
    TableDosDETAPRO: TBlobField;
    TableDiagGROUP: TFloatField;
    TablePatRAYONCODE: TSmallintField;
    TablePatPILGACODE: TSmallintField;
    TablePatD_ST_CODE: TSmallintField;
    TablePatVIDDILCODE: TSmallintField;
    TablePatDOCTORCODE: TSmallintField;
    TableImgSCANPATH: TStringField;
    TableImgANOT: TMemoField;
    procedure DSImgDataChange(Sender: TObject; Field: TField);
    procedure TablePibCalcFields(DataSet: TDataSet);
    procedure TablePatCalcFields(DataSet: TDataSet);
    procedure TableDosCalcFields(DataSet: TDataSet);
    procedure TableDiagCalcFields(DataSet: TDataSet);
    procedure TableImgCalcFields(DataSet: TDataSet);
    procedure TableViddilCalcFields(DataSet: TDataSet);
    procedure TableDocCalcFields(DataSet: TDataSet);
    procedure TableRayonCalcFields(DataSet: TDataSet);
    procedure TableDosTypeCalcFields(DataSet: TDataSet);
    procedure TableDosCodeCalcFields(DataSet: TDataSet);
    procedure TableDiagcodeCalcFields(DataSet: TDataSet);
    procedure TableStateCalcFields(DataSet: TDataSet);
    procedure TablePilgaCalcFields(DataSet: TDataSet);
    procedure DataModule1Create(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;
  Pr : RECProps;
  SurePath: string;

implementation

{$R *.DFM}
uses main1, image1, image2;

procedure TDataModule1.DSImgDataChange(Sender: TObject; Field: TField);
begin
 if FormImage <> nil then begin
  FormImage.Caption:='ÓÇ-ךאהנ ןונודכÿה: '+
  IntToStr(FormImage.DBMultiMedia1.Bwidth)+' x '+
  IntToStr(FormImage.DBMultiMedia1.BHeight)+' '+
  FormImage.DBMultiMedia1.BFiletype
  +' in '+IntToStr(Round(FormImage.DBMultiMedia1.BSize/1024))+ ' Kbytes';

   if FormImageInfo <> nil then begin
FormImageInfo.Edit1.text:=FormImage.DBMultiMedia1.BFiletype;
FormImageInfo.Edit2.text:=IntToStr(FormImage.DBMultiMedia1.Bwidth);
FormImageInfo.Edit3.text:=IntToStr(FormImage.DBMultiMedia1.BHeight);
FormImageInfo.Edit4.text:=IntToStr(FormImage.DBMultiMedia1.Bbitspixel);
FormImageInfo.Edit5.text:=IntToStr(FormImage.DBMultiMedia1.Bplanes);
FormImageInfo.Edit6.text:=IntToStr(FormImage.DBMultiMedia1.Bnumcolors);
FormImageInfo.Edit7.text:=FormImage.DBMultiMedia1.Bcompression;
FormImageInfo.Edit8.text:=IntToStr(Round(FormImage.DBMultiMedia1.BSize/1024))+ ' Kbytes';
IF (FormImage.DBMultiMedia1.BFiletype = 'AVI') then begin
FormImage.DBMediaPlayer1.TimeFormat := tfMilliseconds;
FormImageInfo.Edit10.text:= IntToStr(FormImage.DBMediaPlayer1.Length);
FormImage.DBMediaPlayer1.TimeFormat := tfFrames;
FormImageInfo.Edit9.text:= IntToStr(FormImage.DBMediaPlayer1.Length);
                                                    end;
                             end;

 IF ((FormImage.DBMultiMedia1.BFiletype = 'AVI') or
     (FormImage.DBMultiMedia1.BFiletype = ''))
  then begin
FormImage.MMToolBar1.Visible:=False;
//FormImage.DBMultiMedia1.Align:=alNone;
  end
 else FormImage.MMToolBar1.Visible:=True;

FormImage.N9.Enabled:= FormImage.MMToolBar1.Visible;
  end;
end;

procedure TDataModule1.TablePibCalcFields(DataSet: TDataSet);
var
  Pr : RECProps;
begin
  dbiGetRecord(TablePib.Handle, dbiNoLock, NIL, @Pr);
  if Pr.bDeleteFlag then
    TablePibQ.AsString:='DEL'
  else
    TablePibQ.AsString:=' ';
end;

procedure TDataModule1.TablePatCalcFields(DataSet: TDataSet);
var
  Pr : RECProps;
begin
  dbiGetRecord(TablePat.Handle, dbiNoLock, NIL, @Pr);
  if Pr.bDeleteFlag then
    TablePatQ.AsString:='DEL'
  else
    TablePatQ.AsString:=' ';
end;

procedure TDataModule1.TableDosCalcFields(DataSet: TDataSet);
var
  Pr : RECProps;
begin
  dbiGetRecord(TableDos.Handle, dbiNoLock, NIL, @Pr);
  if Pr.bDeleteFlag then
    TableDosQ.AsString:='DEL'
  else
    TableDosQ.AsString:=' ';
end;

procedure TDataModule1.TableDiagCalcFields(DataSet: TDataSet);
var
  Pr : RECProps;
begin
  dbiGetRecord(TableDiag.Handle, dbiNoLock, NIL, @Pr);
  if Pr.bDeleteFlag then
    TableDiagQ.AsString:='DEL'
  else
    TableDiagQ.AsString:=' ';
end;

procedure TDataModule1.TableImgCalcFields(DataSet: TDataSet);
var
  Pr : RECProps;
begin
  dbiGetRecord(TableImg.Handle, dbiNoLock, NIL, @Pr);
  if Pr.bDeleteFlag then
    TableImgQ.AsString:='DEL'
  else
    TableImgQ.AsString:=' ';

end;

procedure TDataModule1.TableViddilCalcFields(DataSet: TDataSet);
begin
  dbiGetRecord(TableViddil.Handle, dbiNoLock, NIL, @Pr);
  if Pr.bDeleteFlag then
    TableViddilQ.AsString:='DEL'
  else
    TableViddilQ.AsString:=' ';
end;

procedure TDataModule1.TableDocCalcFields(DataSet: TDataSet);
begin
  dbiGetRecord(TableDoc.Handle, dbiNoLock, NIL, @Pr);
  if Pr.bDeleteFlag then
    TableDocQ.AsString:='DEL'
  else
    TableDocQ.AsString:=' ';
end;

procedure TDataModule1.TableRayonCalcFields(DataSet: TDataSet);
begin
  dbiGetRecord(TableRayon.Handle, dbiNoLock, NIL, @Pr);
  if Pr.bDeleteFlag then
    TableRayonQ.AsString:='DEL'
  else
    TableRayonQ.AsString:=' ';
end;

procedure TDataModule1.TableDosTypeCalcFields(DataSet: TDataSet);
begin
  dbiGetRecord(TableDosType.Handle, dbiNoLock, NIL, @Pr);
  if Pr.bDeleteFlag then
    TableDosTypeQ.AsString:='DEL'
  else
    TableDosTypeQ.AsString:=' ';
end;

procedure TDataModule1.TableDosCodeCalcFields(DataSet: TDataSet);
begin
  dbiGetRecord(TableDosCode.Handle, dbiNoLock, NIL, @Pr);
  if Pr.bDeleteFlag then
    TableDosCodeQ.AsString:='DEL'
  else
    TableDosCodeQ.AsString:=' ';
end;

procedure TDataModule1.TableDiagcodeCalcFields(DataSet: TDataSet);
begin
  dbiGetRecord(TableDiagCode.Handle, dbiNoLock, NIL, @Pr);
  if Pr.bDeleteFlag then
    TableDiagCodeQ.AsString:='DEL'
  else
    TableDiagCodeQ.AsString:=' ';
end;

procedure TDataModule1.TableStateCalcFields(DataSet: TDataSet);
begin
  dbiGetRecord(TableState.Handle, dbiNoLock, NIL, @Pr);
  if Pr.bDeleteFlag then
    TableStateQ.AsString:='DEL'
  else
    TableStateQ.AsString:=' ';
end;

procedure TDataModule1.TablePilgaCalcFields(DataSet: TDataSet);
begin
  dbiGetRecord(TablePilga.Handle, dbiNoLock, NIL, @Pr);
  if Pr.bDeleteFlag then
    TablePilgaQ.AsString:='DEL'
  else
    TablePilgaQ.AsString:=' ';
end;

procedure TDataModule1.DataModule1Create(Sender: TObject);
var j:integer;
begin
SurePath:=AppPath(0);

  DataModule1.TablePib.DatabaseName:=SurePath + 'base';
  DataModule1.TablePat.DatabaseName:=SurePath + 'base';
  DataModule1.TableDos.DatabaseName:=SurePath + 'base';
  DataModule1.TableDiag.DatabaseName:=SurePath + 'base';
  DataModule1.TableImg.DatabaseName:=SurePath + 'base';
  DataModule1.TableViddil.DatabaseName:=SurePath + 'base\books';
  DataModule1.TableDoc.DatabaseName:=SurePath + 'base\books';
  DataModule1.TableRayon.DatabaseName:=SurePath + 'base\books';
  DataModule1.TablePilga.DatabaseName:=SurePath + 'base\books';
  DataModule1.TableState.DatabaseName:=SurePath + 'base\books';
  DataModule1.TableDiagcode.DatabaseName:=SurePath + 'base\books';
  DataModule1.TableDosCode.DatabaseName:=SurePath + 'base\books';
  DataModule1.TableDosType.DatabaseName:=SurePath + 'base\books';
  DataModule1.TableID.DatabaseName:=SurePath + 'base\books';

for j:=0 to DataModule1.ComponentCount - 1 do
if  (DataModule1.Components[j] is TTable) then
     TTable(DataModule1.Components[j]).Open;

end;

end.
