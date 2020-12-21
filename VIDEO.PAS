unit video;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Menus, MPlayer, VLP30, TMultiP, hcommon,
  Hresize;

type
  TFormVideo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DriverName: TLabel;
    VideoCaptureParms: TVideoCaptureParms;
    labelStatus: TLabel;
    VideoLab: TVideoLab;
    MainMenu: TMainMenu;
    MenuExit: TMenuItem;
    MenuSaveDIB: TMenuItem;
    MenuSaveBitmap: TMenuItem;
    MenuEdit: TMenuItem;
    MenuEditCopy: TMenuItem;
    Setup1: TMenuItem;
    MenuFormat: TMenuItem;
    MenuSource: TMenuItem;
    MenuDisplay: TMenuItem;
    MenuCompress: TMenuItem;
    MenuVideo: TMenuItem;
    MenuPreview: TMenuItem;
    MenuOverlay: TMenuItem;
    MenuPause: TMenuItem;
    MenuPlayback: TMenuItem;
    MenuPlay: TMenuItem;
    MenuPlayOpen: TMenuItem;
    MenuActive: TMenuItem;
    MenuCapture: TMenuItem;
    MenuClose: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    N1: TMenuItem;
    N5: TMenuItem;
    About1: TMenuItem;
    Panel3: TPanel;
    Image1: TImage;
    N7: TMenuItem;
    OpenDialog1: TOpenDialog;
    N8: TMenuItem;
    N9: TMenuItem;
    N4: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    SaveDialog1: TSaveDialog;
    N13: TMenuItem;
    asJPEG1: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N6: TMenuItem;
    Reset1: TMenuItem;
    Fullreset1: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MenuSaveBitmapClick(Sender: TObject);
    procedure MenuSaveDIBClick(Sender: TObject);
    procedure MenuExitClick(Sender: TObject);
    procedure MenuEditCopyClick(Sender: TObject);
    procedure MenuFormatClick(Sender: TObject);
    procedure MenuSourceClick(Sender: TObject);
    procedure MenuDisplayClick(Sender: TObject);
    procedure MenuCompressClick(Sender: TObject);
    procedure MenuOverlayClick(Sender: TObject);
    procedure MenuPreviewClick(Sender: TObject);
    procedure MenuPauseClick(Sender: TObject);
    procedure MenuPlayClick(Sender: TObject);
    procedure MenuPlayOpenClick(Sender: TObject);
    procedure MenuActiveClick(Sender: TObject);
    procedure MenuCaptureClick(Sender: TObject);
    procedure MenuCloseClick(Sender: TObject);
    function VideoLabError(Sender: TObject; nId: Integer;
      pMsg: PChar): Integer;
    function VideoLabFrame(Sender: TObject; pVideo: PVideoHdr): Integer;
    function VideoLabStatus(Sender: TObject; nId: Integer;
      pMsg: PChar): Integer;
    function VideoLabPlayback(Sender: TObject; nMode: Integer): Integer;
    procedure FormResize(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure asJPEG1Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Reset1Click(Sender: TObject);
    procedure Fullreset1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    nFrameCount: Integer;
  private
     procedure SetupMenu;
  end;

var
  FormVideo:   TFormVideo;
  DriverCaps:  TVideoDriverCaps;
  VideoStatus: TVideoStatus;
  lSize:   Longint;
  pBmp:    PBITMAPINFOHEADER;
  HWinSize, VWinSize: integer;

implementation

uses main1, files, tobase, image1, rolik;
  function MCIWndRegisterClass(hInstance: Integer): Integer stdcall; external 'MSVFW32.DLL';
  function mciSendStringA(pCmd: PAnsiChar; pRetStr: PAnsiChar; nRetStr: Integer; hCallBack: LongInt): Integer stdcall; external 'winmm.Dll';

{$R *.DFM}

procedure TFormVideo.SetupMenu;
begin
  { Get current status }
  VideoLab.GetStatus(@VideoStatus);

  { Set menu items }
  MenuActive .Checked := VideoLab.Active;
  MenuPreview.Checked := VideoStatus.fLiveWindow;
  MenuOverlay.Checked := VideoStatus.fOverlayWindow;
  IF VideoLab.Active then
  begin
    MenuPause.Visible:=True;
     MenuPlay.Visible:=False;
  end else
  begin
    MenuPause.Visible:=False;
     MenuPlay.Visible:=True;
  end;
  MenuCapture.Visible:=MenuPause.Visible;
  N14.Visible:=MenuPause.Visible;
  MenuSaveDIB.Visible:=MenuPause.Visible;
  MenuSaveBitmap.Visible:=MenuPause.Visible;
  N10.Visible:=MenuPause.Visible;
  MenuClose.Visible:=MenuPlay.Visible;
end;

procedure TFormVideo.FormCreate(Sender: TObject);
begin
   { Variables }
  nFrameCount := 0;
  HWinSize := Round(FormRolikParam.RxSpinEdit4.Value);
  VWinSize := Round(FormRolikParam.RxSpinEdit5.Value);

  { Reset all video windows }
  VideoLab.Reset();

  SetupMenu();

  { Turn on video }
    IF ((VideoLab.Active = False) and (StateOfAll = 'Append'))
    then MenuActiveClick(Sender);
end;

procedure TFormVideo.MenuSaveDIBClick(Sender: TObject);
begin
  { Use video driver to save current frame }
  IF SaveDialog1.Execute then
  VideoLab.FileSaveDIB(PAnsiChar(SaveDialog1.FileName));
end;

procedure TFormVideo.MenuSaveBitmapClick(Sender: TObject);
begin
  { Get current status }
  VideoLab.GetStatus(@VideoStatus);

  { Live? }
  if (VideoStatus.fOverlayWindow)
     then MessageDlg('Video can not be in Overlay mode.', mtError, [mbOK], 0)
     { Save the current frame window to file }
     else
     IF SaveDialog1.Execute then
     VideoLab.SaveToBitmap(StrToInt(FormFileBMP.ComboBox1.Text),
     FormFileBMP.ComboBox2.ItemIndex, PAnsiChar(SaveDialog1.FileName));
end;

procedure TFormVideo.MenuExitClick(Sender: TObject);
begin
StateOfAll := 'View';
  Close;
end;

procedure TFormVideo.MenuEditCopyClick(Sender: TObject);
begin
 if FormFileBMP = nil then
   FormFileBMP:=TFormFileBMP.Create(Self);
FormFileBMP.Showmodal;
end;

procedure TFormVideo.MenuFormatClick(Sender: TObject);
begin
  { Display dialog }
  if (DriverCaps.fHasDlgVideoFormat)
     then VideoLab.FormatDialog()
     else MessageDlg('Function NOT supported by video driver', mtInformation, [mbOK], 0);
end;

procedure TFormVideo.MenuSourceClick(Sender: TObject);
begin
  { Display dialog }
  if (DriverCaps.fHasDlgVideoSource)
     then VideoLab.SourceDialog()
     else MessageDlg('Function NOT supported by video driver', mtInformation, [mbOK], 0);
end;

procedure TFormVideo.MenuDisplayClick(Sender: TObject);
begin
  { Display dialog }
  if (DriverCaps.fHasDlgVideoDisplay)
     then VideoLab.DisplayDialog()
     else MessageDlg('Function NOT supported by video driver', mtInformation, [mbOK], 0);
end;

procedure TFormVideo.MenuCompressClick(Sender: TObject);
begin
  { Display dialog }
  VideoLab.CompressionDialog();
end;

procedure TFormVideo.MenuOverlayClick(Sender: TObject);
begin
  { Turn on Overlay Mode }
  VideoLab.Overlay := True;
end;

procedure TFormVideo.MenuPreviewClick(Sender: TObject);
begin
  { Turn on Preview Mode }
  VideoLab.Preview     := True;
  VideoLab.PreviewRate := 1;

  { Clear frame counter }
  nFrameCount := 0;
end;

procedure TFormVideo.MenuPauseClick(Sender: TObject);
begin
  { Stop on the current frame }
  IF (MenuPause.Checked = False) then
   VideoLab.GrabFrame(True)
           else begin
    VideoLab.Overlay := True;
    Reset1Click(Sender);
                end;
  MenuPause.Checked := not MenuPause.Checked;
end;

procedure TFormVideo.MenuPlayOpenClick(Sender: TObject);
begin
 IF OpenDialog1.Execute then  begin
  VideoLab.AVIFileName:= OpenDialog1.FileName;
  { Load play back file }
  case FormRolikParam.Rg1.Itemindex of
  0:  VideoLab.PlaybackLoad(True, MCIWNDF_SHOWNAME, PAnsiChar(VideoLab.AVIFileName));
  1:  VideoLab.PlaybackLoad(False, MCIWNDF_SHOWNAME, PAnsiChar(VideoLab.AVIFileName));
  end;//of

   end;

  { Menu }
  SetupMenu();
end;

procedure TFormVideo.MenuPlayClick(Sender: TObject);
begin
  { Start play back }
  VideoLab.PlaybackStart();
end;

procedure TFormVideo.MenuCloseClick(Sender: TObject);
begin
  { Remove playback window }
  VideoLab.PlaybackStop();
end;

procedure TFormVideo.MenuActiveClick(Sender: TObject);
var
  pTmp:    array[0..80] of Char;
begin
  { Toggle video. }
  if (VideoLab.Active)
     then VideoLab.Active := False
     else VideoLab.Active := True;


  { Display }
  if (Not VideoLab.Active) then
     DriverName.Caption := 'No active'
  else
  begin
     { Get driver name }
     VideoLab.GetDriverName(pTmp, 80);
     DriverName.Caption := pTmp;
     VideoLab.GetDriverVersion(pTmp, 80);
     DriverName.Caption := DriverName.Caption + ' ' + pTmp;
     VideoLab.Overlay := True;
  end;

  { Get driver caps }
  VideoLab.GetDriverCaps(@DriverCaps);

  { Get current status }
  VideoLab.GetStatus(@VideoStatus);
    { Menu }
  SetupMenu();
end;

procedure TFormVideo.MenuCaptureClick(Sender: TObject);
begin
  SaveDialog1.FilterIndex:=2;
  IF SaveDialog1.Execute then begin
   VideoLab.AVIFileName:=SaveDialog1.FileName;
  { Change the Video Format }
  lSize := VideoLab.GetVideoFormatSize();
 { pBmp  := MemAlloc(lSize+20); }
  GetMem(pBmp, lSize+20);
  VideoLab.GetVideoFormat(pBmp, lSize);

  IF (FormRolikParam.ComboBox2.ItemIndex = 4) then
   begin
  pBmp.biWidth      := Round(FormRolikParam.RxSpinEdit4.Value);
  pBmp.biHeight     := Round(FormRolikParam.RxSpinEdit5.Value);
    end else begin
  { Set Window size }
  pBmp.biWidth      := 280;
  pBmp.biHeight     := 210;
              end;
   FormVideo.Caption:=
   'Us Image Size '+IntTosTr(pBmp.biWidth)+IntTosTr(pBmp.biHeight);
//   showmessage(inttostr(pBmp.biWidth)+' : '+inttostr(pBmp.biHeight));

  pBmp.biSizeImage  := pBmp.biWidth * pBmp.biHeight * pBmp.biPlanes * (pBmp.biBitCount div 8);

  { Save }
  VideoLab.SetVideoFormat(pBmp, lSize);
  FreeMem(pBmp);

  VideoCaptureParms.KeyAbort:=
   StrToInt(FormRolikParam.ComboBox3.Values[FormRolikParam.ComboBox3.ItemIndex]);
//VideoCaptureParms.TimeLimitEnabled:=FormRolikParam.CheckBox1.Checked;
//VideoCaptureParms.TimeLimit:=Round(FormRolikParam.RxSpinEdit1.Value);
//VideoCaptureParms.IndexSize:=Round(FormRolikParam.RxSpinEdit2.Value)*1024;
  VideoCaptureParms.StepCaptureAverageFrames:=
           Round(FormRolikParam.RxSpinEdit3.Value);

//  VideoCaptureParms.MakeUserHitOKToCapture:=FormRolikParam.CheckBox3.Checked;

  { Start capturing the video }
  VideoLab.Sequence();
    end;
end;

function TFormVideo.VideoLabError(Sender: TObject; nId: Integer;
  pMsg: PChar): Integer;
begin
  { Display error message }
  MessageDlg(pMsg, mtError, [mbOK], 0);
  VideoLabError := 1;
end;

function TFormVideo.VideoLabFrame(Sender: TObject; pVideo: PVideoHdr): Integer;
type
 TILMaxLogPalette = packed record
    palVersion: Word;
    palNumEntries: Word;
    palPalEntry: array [Byte] of TPaletteEntry;
 end;

var
 FS : TFileStream;
 BM : TBitmapInfoHeader;
 N, lSize : Longint;
 pBmp :  PBITMAPINFOHEADER;
 pBmpfh  : TBITMAPFILEHEADER;
 SBM : TBITMAP;
 Image : PByte;
 PInfo  : PBitmapInfo;
 rgbq : TRGBQUAD;
 PaletteSize: Word;
 LogPal: TILMaxLogPalette;

begin
  { Show that we are really doing something }
  nFrameCount    := nFrameCount + 1;
  labelStatus.Caption := Format('Frame: %d', [nFrameCount]);
  VideoLabFrame  := 1;
  Caption:=IntToStr(pVideo^.dwTimeCaptured);
  VideoLab.GetStatus(@VideoStatus);
  lSize := VideoLab.GetVideoFormatSize();

  (*
  //THIS WILL SAVE A CAPTURED FRAME AT LIHT SPEED TO DISK
  if (lSize > 0) then begin
   GetMem(pBmp, lSize+20);
   VideoLab.GetVideoFormat(pBmp, lSize);
   pBmp^.biCompression := BI_RGB;
   pBmp^.biSizeImage   := 0;
   //only do this when the video format is set to RGB 24
   if pBmp^.biBitcount = 24 then begin
      FS := TFileStream.Create('c:\1test.bmp', fmCreate or fmShareExclusive);
      try
         pBmpfh.bfType:= (Ord('M') shl 8) or (Ord('B'));
         pBmpfh.bfOffBits:=SizeOf(BITMAPFILEHEADER)+SizeOf(BITMAPINFOHEADER) ;
         pBmpfh.bfSize:=((((pBmp^.biWidth + 3) and not 3) * pBmp^.biBitcount shr 3) * pBmp^.biHeight) + pBmpfh.bfOffBits;
         pBmpfh.bfReserved1:=0;
         pBmpfh.bfReserved2:=0;
         FS.Write(pBmpfh, SizeOf(BITMAPFILEHEADER));
         FS.Write(pBmp^, SizeOf(BITMAPINFOHEADER));
         FS.Write(pVideo^.lpData^, pVideo^.dwBytesUsed);
      finally
         FS.Free;
      end;
   end;
   FreeMem(pBmp, lSize+20);
  end;
  //END THIS WILL SAVE A CAPTURED FRAME AT LIHT SPEED TO DISK
  *)


  //THIS WILL PLACE A CAPTURED FRAME AT LIHT TO A TIMAGE
  if (lSize > 0) then begin
   GetMem(pBmp, lSize+20);
   VideoLab.GetVideoFormat(pBmp, lSize);
   pBmp^.biCompression := BI_RGB;

   case pBmp^.biBitcount of

   32,
   24,
   16: begin
            pBmp^.biSizeImage := 0;
            SBM :=TBITMAP.Create;
            SBM.Width:=pBmp^.biWidth;
            SBM.Height:=pBmp^.biHeight;
            PInfo := GlobalAllocPtr(GHND, sizeof(TBITMAPINFOHEADER));
            PInfo^.bmiHeader:=pBmp^;
            SetDIBits(Image1.Canvas.Handle,
                      SBM.Handle,
                      0,
                      pBmp^.biHeight,
                      pVideo^.lpData,
                      PInfo^,
                      DIB_RGB_COLORS);
            Image1.Picture.BitMap.Assign(SBM);
            SBM.Free;
            GlobalFreePtr(PInfo);
        end;

   8: begin
           SBM :=TBITMAP.Create;
           SBM.Width:=pBmp^.biWidth;
           SBM.Height:=pBmp^.biHeight;
           PInfo := GlobalAllocPtr(GHND, sizeof(TBITMAPINFOHEADER) + (1 shl 8) * sizeof(TRGBQUAD));
           PInfo^.bmiHeader:=pBmp^;
           PInfo^.bmiHeader.biClrUsed:=256;
           PInfo^.bmiHeader.biClrImportant:=256;
           if VideoStatus.hPalCurrent <> 0 then begin
              PaletteSize := 0;
              if GetObject(HPalette(VideoStatus.hPalCurrent), SizeOf(PaletteSize), @PaletteSize) <> 0 then
                 with LogPal do begin
                      palVersion := $0300;
                      palNumEntries := PaletteSize;
                      GetPaletteEntries(HPalette(VideoStatus.hPalCurrent), 0, PaletteSize, palPalEntry);
                      for N := 0  to PaletteSize -1 do begin
                          PInfo^.bmiColors[N].rgbRed   :=palPalEntry[N].peRed;
                          PInfo^.bmiColors[N].rgbGreen :=palPalEntry[N].peGreen;
                          PInfo^.bmiColors[N].rgbBlue  :=palPalEntry[N].peBlue;
                      end;
                 end;
           end;
           SetDIBits(Image1.Canvas.Handle,
                     SBM.Handle,
                     0,
                     pBmp^.biHeight,
                     pVideo^.lpData,
                     PInfo^,
                     DIB_RGB_COLORS);

           Image1.Picture.BitMap.Assign(SBM);
           SBM.Free;
           GlobalFreePtr(PInfo);
      end;

   end;//end case
   FreeMem(pBmp, lSize+20);
  end;
  //END THIS WILL PLACE A CAPTURED FRAME AT LIHT TO A TIMAGE

end;



function TFormVideo.VideoLabStatus(Sender: TObject; nId: Integer;
  pMsg: PChar): Integer;
begin
  { Show the current status }
  labelStatus.Caption := pMsg;
  VideoLabStatus      := 1;

  { Menu }
  SetupMenu();
end;

function TFormVideo.VideoLabPlayback(Sender: TObject;
  nMode: Integer): Integer;
begin
  { Display playback messages. }
  case (nMode) of
     MCI_MODE_STOP     : labelStatus.Caption := 'Зупинено.';
     MCI_MODE_NOT_READY: labelStatus.Caption := 'Не встановлено.';
     MCI_MODE_PLAY     : labelStatus.Caption := 'Перегляд...';
     MCI_MODE_RECORD   : labelStatus.Caption := 'Запис...';
     MCI_MODE_SEEK     : labelStatus.Caption := 'Пошук...';
     MCI_MODE_PAUSE    : labelStatus.Caption := 'Пауза.';
     MCI_MODE_OPEN     : labelStatus.Caption := 'Відкритo.';
  end;

  VideoLabPlayback := 0;
end;

procedure TFormVideo.FormResize(Sender: TObject);
begin
//     Panel3.Width:=FormVideo.Width - (VideoLab.Left + VideoLab.Width+ 30);
  //   Panel3.Align:=alRight;
end;

procedure TFormVideo.N10Click(Sender: TObject);
begin
// на тот случай если не сделали стоп-кадр
IF (MenuPause.Checked = False) then MenuPauseClick(Sender);

IF (FormFrame2Base.hgTrackBar1.Position > 3) then
  //Clipboard
  VideoLab.EditCopy()
  else
  begin   //Harddisk
  { Get current status }
  VideoLab.GetStatus(@VideoStatus);

  { Live? }
  if (VideoStatus.fOverlayWindow)
     then begin MessageDlg('Video can not be in Overlay mode.', mtError, [mbOK], 0);
                Exit;
          end
     { Save the current frame window to file }
     else
      VideoLab.SaveToBitmap(StrToInt(FormFileBMP.ComboBox1.Text),
       FormFileBMP.ComboBox2.ItemIndex, 'usviahd.bmp');

//     VideoLab.SaveToBitmap(16, 0, 'usviahd.bmp');
  end;

   Close;
end;

procedure TFormVideo.asJPEG1Click(Sender: TObject);
begin
 if FormFrame2Base = nil then
   FormFrame2Base:=TFormFrame2Base.Create(Self);
FormFrame2Base.Showmodal;
end;

procedure TFormVideo.N14Click(Sender: TObject);
begin
VideoLab.CaptureStop();
end;

procedure TFormVideo.N15Click(Sender: TObject);
begin
 if FormRolikParam = nil then
   FormRolikParam:=TFormRolikParam.Create(Self);
FormRolikParam.Showmodal;
 if FormRolikParam.ModalResult = mrOk then begin
HWinSize := Round(FormRolikParam.RxSpinEdit4.Value);
VWinSize := Round(FormRolikParam.RxSpinEdit5.Value);
Reset1Click(Sender); //переустановка размера кадра
                                           end;
end;

procedure TFormVideo.N6Click(Sender: TObject);
begin
 VideoLab.PlaybackUnload();
end;

procedure TFormVideo.Reset1Click(Sender: TObject);
begin
  { Change the Video Format }
  lSize := VideoLab.GetVideoFormatSize();
  GetMem(pBmp, lSize+20);
  VideoLab.GetVideoFormat(pBmp, lSize);

  { Set Window size }
  pBmp.biWidth      := HWinSize;
  pBmp.biHeight     := VWinSize;

  FormVideo.Caption:=
   'USframe size set as '+IntTosTr(pBmp.biWidth)+' '+IntTosTr(pBmp.biHeight);

  pBmp.biSizeImage  :=
  pBmp.biWidth * pBmp.biHeight * pBmp.biPlanes * (pBmp.biBitCount div 8);

  { Save }
  VideoLab.SetVideoFormat(pBmp, lSize);
  FreeMem(pBmp);
end;

procedure TFormVideo.Fullreset1Click(Sender: TObject);
begin
  VideoLab.Reset();
  VideoLab.Active := False;
  FormVideo.MenuActiveClick(Sender);
end;

procedure TFormVideo.FormShow(Sender: TObject);
begin
IF (StateOfAll = 'Append') then MenuPauseClick(Sender);
{IF (StateOfAll = 'Append') then begin
 Application.MessageBox(
        'Увага: Стоп-кадр по натисканню "F12".'+#13#10+
        ' Запам`ятати кадр в картотеку по натисканню "Alt+Z".',
        'УЗ-кадр', MB_OK);
IF (VideoLab.Active = False) then MenuActiveClick(Sender);
   end;}
end;

procedure TFormVideo.N20Click(Sender: TObject);
begin
  VideoLab.About();
end;

procedure TFormVideo.N18Click(Sender: TObject);
begin
  Application.HelpContext(12);
end;

procedure TFormVideo.FormActivate(Sender: TObject);
begin
 if (Moderator ='Admin') then
 Setup1.Enabled:=True
                          else
 Setup1.Enabled:=False;

 N15.Enabled:=Setup1.Enabled;
 MenuEditCopy.Enabled:=Setup1.Enabled;
end;

end.

