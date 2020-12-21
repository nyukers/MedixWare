unit image1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ildbmitb, StdCtrls, DBCtrls, Buttons, TDMULTIP, ExtCtrls, MMOpen,
  ComCtrls, ClipBrd, Preview,  Inifiles, db, ShellApi,
  DLL96V1, DLLsp96, Menus, TDMULTIM, ildbmmtb, MPlayer, RXCtrls, RXDBCtrl,
  hcommon, Hresize, TMultiMP, ilmmtb, MMSave, ILAnnSet, SpeedBar, 
  Mask, ToolEdit, TB97, DBNavSch, jws99;


type
  TFormImage = class(TForm)
    Panel3: TPanel;
    BitBtn5: TBitBtn;
    PrintDialog1: TPrintDialog;
    OpenDialog1: TMMOpenDialog;
    StatusBar1: TStatusBar;
    ProgressBar1: TProgressBar;
    DBMultiMedia1: TPDBMultiMedia;
    PMultiMedia1: TPMultiMedia;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    R4: TMenuItem;
    R1: TMenuItem;
    R2: TMenuItem;
    R3: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem; 
    ThumbPreview1: TThumbPreview;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    Panel1: TPanel;
    DBMemo1: TDBMemo;
    DBStatusLabel1: TDBStatusLabel;
    N21: TMenuItem;
    Splitter1: TSplitter;
    MMSaveDialog1: TMMSaveDialog;
    N22: TMenuItem;
    AnnoSettings1: TAnnoSettings;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    DBDateEdit1: TDBDateEdit;
    DBMemo2: TDBMemo;
    N27: TMenuItem;
    Dock971: TDock97;
    Toolbar974: TToolbar97;
    MMToolBar2: TILMultiMediaToolBar;
    MMToolBar1: TILDBMultiMediaToolBar;
    Toolbar973: TToolbar97;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N32: TMenuItem;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    SpeedButton6: TSpeedButton;
    ToolbarSep973: TToolbarSep97;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    DBMediaPlayer1: TPDBMediaPlayer;
    N26: TMenuItem;
    DBNavigator1: TDBNavSearch;
    N31: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    Label1: TLabel;
    N36: TMenuItem;
    WEBLink1: TMenuItem;
    SpeedButton13: TSpeedButton;
    WEB1: TMenuItem;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBMultiMedia1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBMultiMedia1Progress(Sender: TObject; Progress: Smallint;
      PMessage: String; var CancelProcess: Boolean);
    procedure DBMultiMedia1Rubberband(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y, XX, YY: Integer);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N16colors1Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure PMultiMedia1Rubberband(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, XX, YY: Integer);
    procedure N18Click(Sender: TObject);
    procedure PMultiMedia1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBMultiMedia1Click(Sender: TObject);
    procedure PMultiMedia1Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure DBMultiMedia1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure N20Click(Sender: TObject);
    procedure DBMultiMedia1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N22Click(Sender: TObject);
    procedure DBMultiMedia1Paint(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure N33Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure DBDateEdit1Enter(Sender: TObject);
    procedure DBMemo1Enter(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure WEBLink1Click(Sender: TObject);
    procedure WEB1Click(Sender: TObject);
  private
    { Private declarations }
//    FilterIni       : TInifile;
//    FIniFileName    : String;
     Procedure Trigger(Sender : TObject; Var Done : Boolean);

  public
    { Public declarations }
        MyRubberBand : TILRubberBand;
    procedure MMToolBarDestination;
    procedure SnapShot(X, Y, XX, YY: integer);
    procedure OnRubber(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, XX, YY: Integer);
  end;

var
  FormImage: TFormImage;
  XXUp, YYUp, XXDown, YYDown :integer;
  urla: string;

implementation

uses main1, U_p_size, data, Ufullscr, tobase, filter, video, image2,
     anograf, chart1,
     registry, ddeman, URLMon, StrUtils;

{$R *.DFM}

function DownloadFile(SourceFile, DestFile: string): Boolean;
begin
  try
    Result :=  UrlDownloadToFile(nil, PChar(SourceFile), PChar(DestFile), 0, nil) = 0;
  except
    Result := False;
  end;
end;


function IE_Installed : Boolean;
var
Reg: TRegistry;
s: String;
begin
Reg:=TRegistry.Create;
With Reg do
Begin
RootKey:=HKEY_LOCAL_MACHINE;
OpenKey('SOFTWARE\Microsoft\Internet Explorer', False);
// IE 5.0+
if ValueExists('Version') then S := ReadString('Version')
// IE 3.0
 else if ValueExists('IVer') then S := ReadString('IVer')
      else S :='';
CloseKey;
Free;
end;
result := (length(S)>0);
      //and (StrtoInt(s[1])>3);
end;

function GetURL(Service: string): String;
var
ClDDE: TDDEClientConv;
temp:  PChar;
begin
Result := '';
//create a new DDE Client object
ClDDE:= TDDEClientConv.Create( nil );
with ClDDE do
begin
SetLink(Service,'WWW_GetWindowInfo');
temp := RequestData('0xFFFFFFFF');
Result := StrPas(temp);
StrDispose(temp);
CloseLink;
end;
ClDDE.Free;
end;

procedure TFormImage.BitBtn3Click(Sender: TObject);
begin
Close;
end;

Procedure TFormImage.Trigger(Sender : TObject; Var Done : Boolean);
begin
 {IMPORTANT}
 {This function is called when your app is idle. Subdivide the
  trigger event to your TDBMultiMedia objects who may need one.
  If no Message is active it will not take up significant time}

  DBMultiMedia1.Trigger;
end;

procedure TFormImage.FormCreate(Sender: TObject);
begin
  Application.OnIdle:=Trigger;
//  FIniFileName :='IpSet.Ini';
//  FilterIni:=TInifile.Create(FIniFileName);
end;

procedure TFormImage.BitBtn5Click(Sender: TObject);
var Br: integer;
begin
//   TableUnLock;
ProgressBar1.Position:=0;
Br := FormMain.FilterIni.ReadInteger('DOPLER_FRAME', 'Brightness', 0);

case FormFrame2Base.RadioGroup1.Itemindex of
0: DBMultiMedia1.BlobUpdate := bUpdateAsJPG;
1: DBMultiMedia1.BlobUpdate := bUpdateAsGIF;
2: DBMultiMedia1.BlobUpdate := bUpdateAsPCX;
3: DBMultiMedia1.BlobUpdate := bUpdateAsBMP;
end;

IF (FormFrame2Base.hgTrackBar1.Position > 3) then
//Clipboard
 begin
 if not Clipboard.HasFormat(CF_PICTURE) then begin
 DataModule1.TableImg.Cancel;
  MessageBeep(0);
 Showmessage('Виникла проблема з записом кадру.');
 Exit; end;

case FormFrame2Base.RadioGroup2.Itemindex of
0: //whole snapshot
   begin
   end;
1: // dopler only
   begin
   PMultiMedia1.PasteFromClipboard;
//   SnapShot(75,15,435,310);
 with FormMain.FilterIni do begin
 SnapShot(
  Round(ReadInteger('DOPLER_FRAME', 'Left', 75)),
  Round(ReadInteger('DOPLER_FRAME', 'Top',  15)),
  Round(ReadInteger('DOPLER_FRAME', 'Right', 435)),
  Round(ReadInteger('DOPLER_FRAME', 'Bottom', 315)));
                   end;
   PMultiMedia1.CopyToClipboard;
   end;
end;

   DataModule1.TableImg.Append;
   DataModule1.TableImg.FieldByName('DIAGID').AsInteger :=
   DataModule1.TableDiag.FieldByName('DIAGID').AsInteger;

 DBMultiMedia1.PasteFromClipboard;
IF (Br > 0) then DBMultiMedia1.SetBright( Br );
//  DataModule1.TableImg.Post;
  ProgressBar1.Position:=0;

 Clipboard.Clear;
  end else
 //через HardDisk
  begin
   {Load the image from file into the blob}
   IF FileExists('usviahd.bmp') then begin

case FormFrame2Base.RadioGroup2.Itemindex of
0: //whole snapshot
   begin
   end;
1: // dopler only
   begin
   PMultiMedia1.Picture.LoadFromFile('usviahd.bmp');
//   SnapShot(75,15,435,310);
 with FormMain.FilterIni do begin
 SnapShot(
  Round(ReadInteger('DOPLER_FRAME', 'Left', 75)),
  Round(ReadInteger('DOPLER_FRAME', 'Top',  15)),
  Round(ReadInteger('DOPLER_FRAME', 'Right', 435)),
  Round(ReadInteger('DOPLER_FRAME', 'Bottom', 315)));
                   end;
   PMultiMedia1.Picture.SaveToFile('usviahd.bmp');
   end;
end;
   DataModule1.TableImg.Append;
   DataModule1.TableImg.FieldByName('DIAGID').AsInteger :=
   DataModule1.TableDiag.FieldByName('DIAGID').AsInteger;

   DBMultiMedia1.LoadFromFile('usviahd.bmp');
IF (Br > 0) then DBMultiMedia1.SetBright( Br );
//   DataModule1.TableImg.Post;
//   DataModule1.TableImg.FlushBuffers;
//   Showmessage('Записано 1 кадр.');
    end else begin
    MessageBeep(0);
    DataModule1.TableImg.Cancel;
    Showmessage('Виникла проблема з записом кадру з файлу.');
    Exit; end;

   ProgressBar1.Position:=0;
  end;

  DBDateEdit1.SetFocus;
end;

procedure TFormImage.FormActivate(Sender: TObject);
begin
  ProgressBar1.Position:=0;
  DBMultiMedia1.Width:=Panel3.Width - 2;

  if (Moderator ='Admin') then begin
 DBNavigator1.VisibleButtons := DBNavigator1.VisibleButtons +
 [nbDelete, nbEdit, nbPost];
 N36.Enabled:=True;
                           end else
 DBNavigator1.VisibleButtons := DBNavigator1.VisibleButtons -
 [nbDelete, nbEdit, nbPost];

IF ((StateOfAll = 'Append') and (FormVideo = nil)) then begin
     SpeedButton2Click(Sender); end else begin
{ IF (DataModule1.TableImg.FieldByName('SCANPATH').AsString <> '')
 then begin
   DataModule1.TableImg.Edit;
   DBMultiMedia1.LoadFromFile(SurePath+'images\'+
    DataModule1.TableImg.FieldByName('SCANPATH').AsString);
      end;
 }
  DataModule1.DSImgDataChange(Sender, DataModule1.TableImg.Fields[0]);
                                         end;

Label1.Caption:=intToStr(DataModule1.TableImg.RecordCount);
end;

procedure TFormImage.DBMultiMedia1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     if Button = mbRight then
     begin
  DBMultiMedia1.ResetImage;
  DBMultiMedia1.repaint;
      end;

     if Assigned(MyRubberBand) then
  MyRubberBand.MouseDown(Button, Shift, X, Y);
end;

procedure TFormImage.DBMultiMedia1Progress(Sender: TObject;
  Progress: Smallint; PMessage: String; var CancelProcess: Boolean);
begin
    CancelProcess := Application.Terminated;
    {Process the First call}
    if Progress = 0  then begin
     ProgressBar1.Position:=0;
     Application.ProcessMessages;
    end;

    {Process the Last call}
    if Progress > 99  then begin
     ProgressBar1.Position:=Progress;
    {Set the message caption}
     StatusBar1.Panels[0].Text := '';
     Application.ProcessMessages;
     exit;
    end;

    {Some speed improvement when only processing each fifth call}
    if Progress > ProgressBar1.Position+5 then begin
     ProgressBar1.Position:=Progress;
     {Set the message caption}
     StatusBar1.Panels[0].Text:='Status '+PMessage;
     Application.ProcessMessages;
    end;
end;

procedure TFormImage.DBMultiMedia1Rubberband(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, XX, YY: Integer);
begin
  if Button = mbLeft then
  DBMultiMedia1.ZoomArea(Rect(X,Y,XX,YY));
end;

procedure TFormImage.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
ProgressBar1.Position:=0;
IF (DBMultiMedia1.EditAnnotat = True) then
    DBMultiMedia1.ClearAnnotation;
end;

procedure TFormImage.SpeedButton1Click(Sender: TObject);
var
  BitMap : TBitmap;
  ReadRes: SmallInt;
  //  Cursor : hCursor;
begin

IF  (PMultiMedia1.Visible = False) then begin
 IF (DBMultiMedia1.BFiletype = 'AVI') then
     PMultiMedia1.VideoToPicture(DBMultiMedia1.Handle)
     else begin
  DBMultiMedia1.CopyToClipboard;
  PMultiMedia1.PasteFromClipboard;
  Clipboard.Clear;
          end;
                                        end;

  Application.ProcessMessages;
  BitMap:=TBitmap.Create;
  BitMap.Assign(PMultiMedia1.Picture.Bitmap);
//  Cursor := SetCursor(LoadCursor(0,idc_Wait));
  FormEffect:=TFormEffect.Create(Self);
//  FormEffect.Cursor:=Cursor;

 if PMultiMedia1.Picture.Bitmap.Monochrome then
  ReadRes := 1
 else begin
    ReadRes := 8;
{    if FReadResolution = lColorVga then ReadRes := 0;
    if FReadResolution = lMonoChrome then ReadRes := 1;
    if FReadResolution = lColor16 then ReadRes := 4;
    if FReadResolution = lColor256 then ReadRes := 8;
    if FReadResolution = lColorTrue then ReadRes := 24;
    if FReadResolution = lAutoMatic then ReadRes := GetDeviceRes(Canvas.Handl
 }end;

 if BitMap.Handle <>0 then
  FormEffect.MainDib:=IBitmapToDib(BitMap,ReadRes);

 BitMap.Free;

 FormEffect.ShowModal;

 if FormEffect.ModalResult = MrOk then begin

//  Cursor := SetCursor(LoadCursor(0,idc_Wait));
  BitMap:=TBitmap.Create;
  DibToBitmap(FormEffect.MainDib, BitMap);
  PMultiMedia1.Picture.Bitmap.Assign(BitMap);
  BitMap.Free;
//  SetCursor(Cursor);
  end;

 FormEffect.Free;
end;

procedure TFormImage.SpeedButton2Click(Sender: TObject);
begin
 if (FormVideo = nil) then
   FormVideo:=TFormVideo.Create(Self);
//FormVideo.WindowState:=wsNormal;
FormVideo.Showmodal;
IF (StateOfAll = 'Append') then BitBtn5Click(Sender);
end;

procedure TFormImage.N9Click(Sender: TObject);
begin
 if FullSlide = nil then
   FullSlide:=TFullSlide.Create(Self);
  {copy DB Blob image to fullscreen image}
  FullSlide.MultiImage1.Picture.Graphic:=DBMultiMedia1.Picture.Graphic;
  {show the image fulscreen}
  FullSlide.showmodal;
end;

procedure TFormImage.N7Click(Sender: TObject);
begin
case FormFrame2Base.RadioGroup1.Itemindex of
0: DBMultiMedia1.BlobUpdate := bUpdateAsJPG;
1: DBMultiMedia1.BlobUpdate := bUpdateAsGIF;
2: DBMultiMedia1.BlobUpdate := bUpdateAsPCX;
3: DBMultiMedia1.BlobUpdate := bUpdateAsBMP;
end;
 {Append a record and store an image file into the blob}
 If OpenDialog1.Execute Then begin
   {Place table in edit mode}
   DataModule1.TableImg.Edit;
   {Load the image from file into the blob}
   DBMultiMedia1.LoadFromFile(OpenDialog1.FileName);

   DataModule1.TableImg.Post;
   ProgressBar1.Position:=0;
 end;

  DataModule1.TableImg.FlushBuffers;
  Showmessage('Записано 1 кадр з файлу.');
end;

procedure TFormImage.N8Click(Sender: TObject);
begin
  if PrintDialog1.execute then begin
 if  Printersize = nil then
 Printersize:=TPrintersize.Create(Application);
  {Initialize the height spinedit of the printsize dialog box}
   Printersize.HeigthSpinEdit.Value:=DBMultiMedia1.Picture.Height;
   {Initialize the width spinedit of the printsize dialog box}
   Printersize.WidthSpinEdit.Value:=DBMultiMedia1.Picture.Width;
   {Show it}
   Printersize.ShowModal;
   if Printersize.Modalresult = mrok then begin
    if (Printersize.CB1.Checked) then DBMultiMedia1.Invert;
    {print TMultiMedia}
     DBMultiMedia1.PrintMultiImage(0,0,Printersize.WidthSpinEdit.Value,Printersize.HeigthSpinEdit.Value);
       end;

   {Hide it if done}
   Printersize.hide;
   end;
end;

procedure TFormImage.N4Click(Sender: TObject);
begin
Close;
end;

procedure TFormImage.N16colors1Click(Sender: TObject);
begin
 {Set resolution to dither the image}
 r1.checked:=False;
 r2.checked:=False;
 r3.checked:=False;
 r4.checked:=False;

 If TMenuItem(Sender) = R1 then begin
   {set save resolution to 4 bit 16 color using the system's colors}
    r1.checked:=true;
    DBMultiMedia1.ImageReadRes:=lColor16;
    DBMultiMedia1.ImageDither:=False;
 end;

 If TMenuItem(Sender) = R2 then begin
    {Set resolution to 256 colors}
    r2.checked:=true;
    DBMultiMedia1.ImageReadRes:=lColor256;
    DBMultiMedia1.ImageDither:=False;
 end;


 If TMenuItem(Sender) = R3 then begin
   {Set resolution to true color}
    r3.checked:=true;
    DBMultiMedia1.ImageReadRes:=lColorTrue;
    DBMultiMedia1.ImageDither:=False;
 end;

 If TMenuItem(Sender) = R4 then begin
   {Set resolution to systems resolution}
    r4.checked:=true;
    DBMultiMedia1.ImageReadRes:=lAutomatic;
    DBMultiMedia1.ImageDither:=False;
 end;

 {Reload the image }
 DataModule1.TableImg.Refresh;

 {reset the gauge to 0}
 ProgressBar1.Position:=0;
end;

procedure TFormImage.N13Click(Sender: TObject);
begin
IF (HasTwain(Handle)) then begin
  DataModule1.TableImg.Edit;
   DBMultiMedia1.ScanImage(Handle);
  DataModule1.TableImg.Post;
    DataModule1.TableImg.FlushBuffers;
                           end
  else
  Application.MessageBox(
        'Немає підтримки TWAIN. Сканування НЕ можливе!',
        'TWAIN Error', MB_OK);
end;

procedure TFormImage.N14Click(Sender: TObject);
begin
 ThumbPreview1.PreviewsDir:=ExtractFilePath(Application.Exename);
 ThumbPreview1.DataFileDir:=ExtractFilePath(Application.Exename);
 If ThumbPreview1.Execute Then begin
//     TableUnLock;
   {Place table in edit mode}
   DataModule1.TableImg.Edit;
   {Load the image from file into the blob}
      DBMultiMedia1.LoadFromFile(ThumbPreview1.FileName);
   {Post the blob}
   DataModule1.TableImg.Post;
   {reset the gauge to 0}
   ProgressBar1.Position:=0;
//     TableLock;
  DataModule1.TableImg.FlushBuffers;
  Showmessage('Записано 1 кадр за попереднім переглядом.');
end;
end;

procedure TFormImage.PMultiMedia1Rubberband(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, XX, YY: Integer);
begin
  if Button = mbLeft then
  PMultiMedia1.ZoomArea(Rect(X,Y,XX,YY));
end;

procedure TFormImage.N18Click(Sender: TObject);
begin
IF (PMultiMedia1.Visible = False) then begin
DBMultiMedia1.Width:=(Panel3.Width div 2)-4;
 IF (DBMultiMedia1.BFiletype = 'AVI') then
     PMultiMedia1.VideoToPicture(DBMultiMedia1.Handle)
     else begin
  DBMultiMedia1.CopyToClipBoard;
  PMultiMedia1.PasteFromClipboard;
  ClipBoard.Clear;
          end;
PMultiMedia1.Visible:=True;
PMultiMedia1.Stretch:=False;
N18.Caption:='1 кадр';            end else begin
DBMultiMedia1.Width:=Panel3.Width-2;
PMultiMedia1.Visible:=False;
N18.Caption:='2 кадри';
                                      end;
end;

procedure TFormImage.PMultiMedia1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     if Button = mbRight then
     begin
  PMultiMedia1.ResetImage;
  PMultiMedia1.repaint;
      end;

//      showmessage(inttostr(x)+'-'+inttostr(y));
end;

procedure TFormImage.DBMultiMedia1Click(Sender: TObject);
begin
MMToolBarDestination;
end;

procedure TFormImage.PMultiMedia1Click(Sender: TObject);
begin
MMToolBarDestination;
end;


procedure TFormImage.N19Click(Sender: TObject);
begin
N19.Checked := not N19.Checked;
DBMultiMedia1.EditAnnotat:=N19.Checked;

IF N19.Checked then begin
 DBMemo2.Lines.SaveToFile('annot.txt');
 DBMultiMedia1.LoadAnnotation(2,'annot.txt');
 end else begin

 if FormAnograf = nil then FormAnograf:=TFormAnograf.Create(Self);
 FormAnograf.Showmodal;
 if (FormAnograf.ModalResult = mrYes) then
 case FormAnograf.RadioGroup1.ItemIndex of
 0: begin
   DBMultiMedia1.HardDrawAnnotation;
    DBMultiMedia1.CopyToClipboard;
     DataModule1.TableImg.Edit;
    DBMultiMedia1.PasteFromClipboard;
     DataModule1.TableImg.Post;
    Clipboard.Clear;
     DataModule1.TableImg.FlushBuffers;
      ProgressBar1.Position:=0;
    end;
 1: begin
    DBMultiMedia1.SaveAnnotation(2,'annot.txt');
     DataModule1.TableImg.Edit;
    DBMemo2.Lines.LoadFromFile('annot.txt');
     DataModule1.TableImg.Post;
     DataModule1.TableImg.FlushBuffers;
      ProgressBar1.Position:=0;
    end;
  end;//case

 end;


{IF N19.Checked then begin
MMToolBar1.VisibleButtons:= MMToolBar1.VisibleButtons +
                            [ibdbmAnnotEdit];
MMToolBar2.VisibleButtons:= MMToolBar2.VisibleButtons +
                            [ibmAnnotEdit];
              end else begin
MMToolBar1.VisibleButtons:= MMToolBar1.VisibleButtons -
                            [ibdbmAnnotEdit];
MMToolBar2.VisibleButtons:= MMToolBar2.VisibleButtons -
                            [ibmAnnotEdit];
                            end;
}
end;

procedure TFormImage.DBMultiMedia1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
StatusBar1.Panels[1].Text := inttostr(x)+' x '+inttostr(y);
     if Assigned(MyRubberBand) then
      MyRubberBand.MouseMove(Shift, X, Y);
end;

procedure TFormImage.SnapShot(X, Y, XX, YY: integer);
var
  Bitmap: TBitmap;
begin
 {Create a new bitmap and set its size}
 Bitmap := TBitmap.Create;
 Bitmap.Width:= XX-X;
 Bitmap.Height:= YY-Y;
 {Copy the palette}
 Bitmap.Palette:=PMultiMedia1.Picture.Bitmap.Palette;
 {Delete the lines needed to shrink}
 SetStretchBltMode(Bitmap.Canvas.Handle,STRETCH_DELETESCANS);
 {Crop it}
 Bitmap.Canvas.Copyrect(Rect(0,
                             0,
                             XX-X,  {new size}
                             YY-Y), {new size}
                        PMultiMedia1.Picture.Bitmap.Canvas,
                        Rect(X,
                             Y,
                             XX, {crop area}
                             YY));{crop area}
 {Copy the palette}
 Bitmap.Palette:=PMultiMedia1.Picture.Bitmap.Palette;
 {Assign the new cropped bitmap}
 PMultiMedia1.Picture.Bitmap.Assign(Bitmap);
 {Free the bitmap}
 Bitmap.Free;
end;

procedure TFormImage.N20Click(Sender: TObject);
begin
IF (N20.Checked = False) then begin
 IF (MyRubberBand = nil) then MyRubberBand:=TILRubberBand.Create(Self);
 MyRubberBand.DropRect(10,10,200,200);
 MyRubberBand.iParent:=DBMultiMedia1;
 MyRubberBand.OnRubberBand:=OnRubber;
 DBMultiMedia1.AllowRubberBand:=False;

  end else begin
 if MessageDlg('Бажаєте запамятати рамку виділення?',
    mtInformation, [mbYes, mbNo], 0) = mrYes then begin

  DBMultiMedia1.CopyToClipboard;
  PMultiMedia1.PasteFromClipboard;
  SnapShot(XXDown, YYDown, XXUp, YYUp);

{IF ((XXDown < XXUp) and (YYDown < YYUp)) then
     SnapShot(XXDown-10, YYDown-5, XXUp+10, YYUp+5);
IF ((XXDown > XXUp) and (YYDown > YYUp)) then
     SnapShot(XXUp-10, YYUp-5, XXDown+10, YYDown+5);
IF ((XXDown < XXUp) and (YYDown > YYUp)) then
     SnapShot(XXDown-10, YYUp-5, XXUp+10, YYDown+5);
IF ((XXDown > XXUp) and (YYDown < YYUp)) then
     SnapShot(XXUp-10, YYDown-5, XXDown+10, YYUp+5);
 }

  PMultiMedia1.CopyToClipboard;
   DataModule1.TableImg.Edit;
  DBMultiMedia1.PasteFromClipboard;
   DataModule1.TableImg.Post;
   ProgressBar1.Position:=0;
  Clipboard.Clear;
   DataModule1.TableImg.FlushBuffers;
   end;
    DBMultiMedia1.AllowRubberBand:=True;
     MyRubberBand.iParent:=nil;
      DataModule1.TableImg.Refresh;
//    MyRubberBand.Free;
    end;
N20.Checked:= not N20.Checked;
end;

procedure TFormImage.DBMultiMedia1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     if Assigned(MyRubberBand) then
      MyRubberBand.MouseUp(Button, Shift, X, Y);
end;

procedure TFormImage.MMToolBarDestination;
begin
If (ActiveControl is TPMultiMedia) Then begin
 MMToolBar2.Align := alTop;
 MMToolBar2.Visible := True;
 MMToolBar1.Visible := False;
  DBNavigator1.Enabled:=False;
 end;

If (ActiveControl is TPDBMultiMedia) Then begin
IF (DBMultiMedia1.BFiletype = 'AVI') then begin
  MMToolBar1.Visible := False;
   MMToolBar2.Visible := False;
 end else begin
  MMToolBar1.Visible := True;
   MMToolBar2.Visible := False;
           end;
 DBNavigator1.Enabled:=True;
 end;

 end;

procedure TFormImage.N22Click(Sender: TObject);
begin
 If MMSaveDialog1.Execute Then begin

 case MMSaveDialog1.filterindex of
1: DBMultiMedia1.SaveToFileAsBMP(MMSaveDialog1.FileName);
2: DBMultiMedia1.SaveToFileAsGIF(MMSaveDialog1.FileName);
3: DBMultiMedia1.SaveToFileAsJPG(MMSaveDialog1.FileName);
4: DBMultiMedia1.SaveToFileAsPCX(MMSaveDialog1.FileName);
else Application.MessageBox('Вибраний формат в версії 1.00 не підтримується.',
                            'PixelDrive', MB_OK);
end;//of

  {reset the gauge to 0}
  ProgressBar1.Position:=0;
  end;
end;

procedure TFormImage.DBMultiMedia1Paint(Sender: TObject);
begin
  if Assigned(MyRubberBand) then
    MyRubberBand.PaintRect;
end;

procedure TFormImage.OnRubber(Sender: TObject; Button: TMouseButton;
          Shift: TShiftState; X, Y, XX, YY: Integer);
begin
StatusBar1.Panels[0].Text :=
                  ' X: ' + IntToStr(x)+
                  ' Y: ' + IntToStr(y)+
                  ' x: '+ IntToStr(xx)+
                  ' y: '+ IntToStr(yy);
XXUp:=XX;
YYUp:=YY;
XXDown:=X;
YYDown:=Y;
end;


procedure TFormImage.N27Click(Sender: TObject);
begin
 if FormChart = nil then FormChart:=TFormChart.Create(Self);
  IF (DBMultiMedia1.BFiletype = 'AVI') then
     FormChart.PMultiMedia1.VideoToPicture(DBMultiMedia1.Handle)
     else begin
  DBMultiMedia1.CopyToClipBoard;
  FormChart.PMultiMedia1.PasteFromClipboard;
  ClipBoard.Clear;
          end;
FormChart.ShowModal;
end;

procedure TFormImage.N30Click(Sender: TObject);
begin
IF (ToolBar973.Visible = False) then
    ToolBar973.Visible := True else
    ToolBar973.Visible := False;
N30.Checked := ToolBar973.Visible;
end;

procedure TFormImage.N32Click(Sender: TObject);
begin
IF (ToolBar974.Visible = False) then
    ToolBar974.Visible := True else
    ToolBar974.Visible := False;
N32.Checked := ToolBar974.Visible;
end;

procedure TFormImage.DBMemo1Exit(Sender: TObject);
var FileImageName: string;
    Year, Month, Day: Word;
begin
{
IF (StateOfAll = 'Append') then begin
 if Application.MessageBox(
        'Увага: кадр змінено.'+#13#10+' Запам`ятати ?',
        'УЗ-кадр', MB_OKCANCEL) = IDOK then begin
   //якщо кадри зберігаються окремо!
   IF  (FormFrame2Base.RadioGroup3.ItemIndex = 1) then begin
   Randomize;
   DecodeDate(StrToDate(DBDateEdit1.Text), Year, Month, Day);
   FileImageName:=Surepath+'image\'+
   IntToStr(Month)+IntToStr(Year)+'\'+IntToStr(Day)+'\'+
   inttostr(DataModule1.TablePib.FieldByName('PIBID').AsInteger) +
   inttostr(DataModule1.TableDiag.FieldByName('DIAGID').AsInteger)+
   inttostr(random(150));
   //чи потрібно тут хвостовик імені файлу ?
 case FormFrame2Base.RadioGroup1.ItemIndex  of
0: DBMultiMedia1.SaveToFileAsJPG(FileImageName);
1: DBMultiMedia1.SaveToFileAsGIF(FileImageName);
2: DBMultiMedia1.SaveToFileAsPCX(FileImageName);
3: DBMultiMedia1.SaveToFileAsBMP(FileImageName);
4: DBMultiMedia1.SaveToFileAsTIF(FileImageName);
//5: DBMultiMedia1.SaveToFileAsDICOM(FileImageName);
 end;//of
 //попередньо очищаемо буфер
 Clipboard.Clear;
 //а тепер саму базу від кадру
 DBMultiMedia1.PasteFromClipboard;
                                        end;

   DataModule1.TableImg.Post;
   DataModule1.TableImg.FlushBuffers;
   Showmessage('Записано 1 кадр.');

  if Application.MessageBox(
        'Додати ще один УЗ-кадр ?',
        'УЗ-кадр', MB_OKCANCEL) = IDOK then begin
       SpeedButton2Click(Sender);
         end else StateOfAll := 'View';
         end else begin StateOfAll := 'View';
                 DataModule1.TableImg.Cancel;
                  end;
       end;
ProgressBar1.Position:=0;}

IF (StateOfAll = 'Append') then begin
 if Application.MessageBox(
        'Увага: кадр зм нено.'+#13#10+' Запам`ятати ?',
        'УЗ-кадр', MB_OKCANCEL) = IDOK then begin

IF (FormatInBase = 'JPEG') then DBMultiMedia1.BlobUpDate:=bUpdateAsJPG;
IF (FormatInBase = 'PCX')  then DBMultiMedia1.BlobUpDate:=bUpdateAsPCX;
IF (FormatInBase = 'BMP')  then DBMultiMedia1.BlobUpDate:=bUpdateAsBMP;
IF (FormatInBase = 'GIF')  then DBMultiMedia1.BlobUpDate:=bUpdateAsGIF;
IF (FormatInBase = 'TIFF') then DBMultiMedia1.BlobUpDate:=bUpdateAsTIF;
//IF (FormatInBase = 'DICOM')  then DBMultiMedia1.BlobUpDate:=bUpdateAsDICOM;

   DataModule1.TableImg.Post;
   DataModule1.TableImg.FlushBuffers;
   Showmessage('Записано 1 кадр.');

  if Application.MessageBox(
        'Додати ще один УЗ-кадр ?',
        'УЗ-кадр', MB_OKCANCEL) = IDOK then begin
       SpeedButton2Click(Sender);
         end else StateOfAll := 'View';
         end else begin StateOfAll := 'View';
                 DataModule1.TableImg.Cancel;
                  end;
       end;
ProgressBar1.Position:=0;

end;

procedure TFormImage.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
IF Key = 27 then  //ESCape
  begin
    TDBEdit(ActiveControl).Color:=clWindow;
    SelectNext(ActiveControl as tWinControl, False, True );
    Key := 0;
    TDBEdit(ActiveControl).Color:=clAqua;
  end;

// FormKeyDown виконується раніше за FormCreate !!!
IF (FormImage <> nil) then
IF (DBNavigator1.DataSource.DataSet.State in [dsBrowse]) then begin
 case Key of
 vk_INSERT:  begin StateOfAll:='Append';
                   // либо по WebLink либо МСІ 
                   IF (WEBLink1.Enabled) then
                       WebLink1Click(Sender) else
                        SpeedButton2Click(Sender);
             end;
 vk_DELETE: DBNavigator1Click(Sender, nbDelete);
 end;//of}
   end;
end;

procedure TFormImage.FormKeyPress(Sender: TObject; var Key: Char);
begin
case Key of
#13: begin
     TDBEdit(ActiveControl).Color:=clWindow;
       SelectNext(ActiveControl as tWinControl, True, True );
       Key := #0;
     TDBEdit(ActiveControl).Color:=clAqua;
     end;

'і': Key :='i';
'І': Key:='I';
 end;//of
end;

procedure TFormImage.N33Click(Sender: TObject);
begin
FormImageInfo.Showmodal;
end;

procedure TFormImage.N31Click(Sender: TObject);
begin
  Application.HelpContext(11);
end;

procedure TFormImage.DBDateEdit1Enter(Sender: TObject);
begin
IF (StateOfAll = 'Append') then
    DBDateEdit1.Text:=DateToStr(Date);
end;

procedure TFormImage.DBMemo1Enter(Sender: TObject);
begin
IF (StateOfAll = 'Append') then
 LoadKeyboardLayout('00000422', KLF_ACTIVATE); // ukr
end;

procedure TFormImage.N36Click(Sender: TObject);
begin
 if FormFrame2Base = nil then
   FormFrame2Base:=TFormFrame2Base.Create(Self);
   FormFrame2Base.Showmodal;
end;

procedure TFormImage.WEBLink1Click(Sender: TObject);
var SourceFile, DestFile: string;
    i, FF: integer;
    Stream : TMemoryStream;
begin
// отримання URL зображення GIF або JPG
urla := GetURL('IExplore');
urla := Copy(urla, 2, Pos(',', urla)-3);
ShowMessage(urla);

// отримання файлу зображення GIF або JPG
  IF ((Copy(urla, length(urla)-2,3) <> 'gif') and
      (Copy(urla, length(urla)-2,3) <> 'jpg') and
      (Copy(urla, length(urla)-2,3) <> 'jpe') and
      (Copy(urla, length(urla)-3,4) <> 'jpeg')) then
       begin
       showmessage('No image for download!');
       Exit;
       end;
  // Where to save the file
  FF:= 0; i:=3;
  while FF = 0 do
   begin
   FF := Pos('/' ,Copy(urla, length(urla)-i,i+1));
   Inc(i);
   end;
   i:=i-2;
  DestFile := AppPath(0)+'images\hdi500\' + Copy(urla, length(urla)-i,i+1);
//  showmessage(DestFile);
   SourceFile := urla;
  if DownloadFile(SourceFile, DestFile) then
  begin
  PMultiMedia1.MediaName := DestFile;
  if Application.MessageBox(
     'Кадр прийнято успішно (праворуч).'+#13#10+' Запам`ятати його в картотеку ?',
     'УЗ-кадр', MB_OKCANCEL) = IDOK then begin
//  ShowMessage('Download succesfully!');
   DataModule1.TableImg.Append;
     Stream:=TMemoryStream.Create;
     Stream.LoadFromFile(DestFile);
     DBMultiMedia1.LoadFromStream('jpg', Stream);
     Stream.free;
//   FormImageInfo.Showmodal;
   DataModule1.TableImg.Post;            end;
  end
  else  ShowMessage('Помилка завантаження кадру з ' + SourceFile);
end;

procedure TFormImage.WEB1Click(Sender: TObject);
var PcharArj: Array[0..50] of char;
    stringArj : string;
begin
showmessage('Буде виконано запуск Internet Explorer'+
            ' та спроба пієднатися до Web-серверу HDI5000.');
// проверка что есть Internet Explorer
if IE_Installed then {} else
 begin
ShowMessage('Для роботи по WEBLink потрібен Internet Explorer !');
 Exit;
 end;

// запуск Експлорера с адресом сервера!
StringArj:='http://' + DelSpace(FormFrame2Base.MaskEdit1.Text);
//showmessage(stringarj);
StrPCopy(PcharArj, StringArj);
IF (ShellExecute(Application.Handle,'open',PcharArj, nil, nil, 0) > 32)
 then begin
      WebLink1.Enabled:=True;
      SpeedButton13.Enabled:=True;
      // на 2 кадри!
      N18Click(Sender);
      end;
end;

end.
