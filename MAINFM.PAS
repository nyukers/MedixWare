unit MainFm;

{===========================================================
    DESCRIPTION:  Xceed Zip 32-bit Delphi 3.0 Demo v3.0
    COPYRIGHT:    © Copyright 1995-1997 Xceed Software Inc.,
                  All Rights Reserved.
 ===========================================================}

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, FileCtrl,
  Forms, Dialogs, Menus, ExtCtrls, StdCtrls, Gauges, Buttons, ComCtrls, XcdZipD3;

type
  TMainFormFm = class(TForm)
    FilesLb: TListBox;
    MainMn: TMainMenu;
    FileMn: TMenuItem;
    FileNewMn: TMenuItem;
    FileOpenMn: TMenuItem;
    FileCloseMn: TMenuItem;
    N1: TMenuItem;
    FileExitMn: TMenuItem;
    HelpMn: TMenuItem;
    HelpAboutMn: TMenuItem;
    EditMn: TMenuItem;
    EditAddMn: TMenuItem;
    EditDeleteMn: TMenuItem;
    EditExtractMn: TMenuItem;
    N2: TMenuItem;
    EditSelectAllMn: TMenuItem;
    AddFilesDg: TOpenDialog;
    NewZipDg: TSaveDialog;
    OpenZipDg: TOpenDialog;
    N3: TMenuItem;
    EditUpdateMn: TMenuItem;
    N4: TMenuItem;
    EditUpdateZIPDateMn: TMenuItem;
    FileDeleteMn: TMenuItem;
    FileTestMn: TMenuItem;
    FileFixMn: TMenuItem;
    OptionsMn: TMenuItem;
    OptionsUseTempFileMn: TMenuItem;
    Fastestcompression: TMenuItem;
    N5: TMenuItem;
    Normalcompression: TMenuItem;
    Bestcompression: TMenuItem;
    FixNormal1: TMenuItem;
    FixAgressive1: TMenuItem;
    MultidiskmodeMn: TMenuItem;
    N6: TMenuItem;
    ClearDisksMn: TMenuItem;
    NoCompression: TMenuItem;
    FilesHd: THeaderControl;
    StatusPn: TPanel;
    Bevel1: TBevel;
    StatusLb: TLabel;
    HintLb: TLabel;
    SpacePn: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    AbortSb: TSpeedButton;
    ProgressBar1: TProgressBar;
    MainXz: TXceedZip;
    N7: TMenuItem;
    SelfExtractingMnu: TMenuItem;
    SelfextractorOptionsmnu: TMenuItem;
    procedure FilesLbDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FilesLbMeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure FileNewMnClick(Sender: TObject);
    procedure FileOpenMnClick(Sender: TObject);
    procedure FileCloseMnClick(Sender: TObject);
    procedure FileExitMnClick(Sender: TObject);
    procedure EditAddMnClick(Sender: TObject);
    procedure EditDeleteMnClick(Sender: TObject);
    procedure EditExtractMnClick(Sender: TObject);
    procedure EditSelectAllMnClick(Sender: TObject);
    procedure HelpAboutMnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MainXzAdding(XceedZip: TXceedZip;
      const FileStats: TXcdFileStats);
    procedure MainXzDeleting(XceedZip: TXceedZip;
      const FileName: String);
    procedure MainXzFixing(XceedZip: TXceedZip;
      const FileName: String);
    procedure MainXzStatus(XceedZip: TXceedZip;
      const FileStats: TXcdFileStats);
    procedure MainXzUpdating(XceedZip: TXceedZip;
      const FileStats: TXcdFileStats);
    procedure AbortSbClick(Sender: TObject);
    procedure EditMnClick(Sender: TObject);
    procedure FileMnClick(Sender: TObject);
    procedure EditUpdateMnClick(Sender: TObject);
    procedure EditUpdateZIPDateMnClick(Sender: TObject);
    procedure MainXzListing(XceedZip: TXceedZip;
      const FileStats: TXcdFileStats);
    procedure FileDeleteMnClick(Sender: TObject);
    procedure FileTestMnClick(Sender: TObject);
    procedure MainXzTesting(XceedZip: TXceedZip;
      const FileStats: TXcdFileStats);
    procedure MainXzExtracting(XceedZip: TXceedZip;
      const FileStats: TXcdFileStats);
    procedure OptionsMnClick(Sender: TObject);
    procedure OptionsUseTempFileMnClick(Sender: TObject);
    procedure MainXzSkippingFile(XceedZip: TXceedZip;
      const Skipping: TXcdSkipping);
    procedure MainXzReplace(XceedZip: TXceedZip; var Replace: TXcdReplace);
    procedure FastestcompressionClick(Sender: TObject);
    procedure NormalcompressionClick(Sender: TObject);
    procedure BestcompressionClick(Sender: TObject);
    procedure FixNormal1Click(Sender: TObject);
    procedure FixAgressive1Click(Sender: TObject);
    procedure MainXzNewdisk(XceedZip: TXceedZip;
      const Disknumber: Integer);
    procedure MultidiskmodeMnClick(Sender: TObject);
    procedure NoCompressionClick(Sender: TObject);
    procedure ClearDisksMnClick(Sender: TObject);
    procedure FilesHdSectionResize(HeaderControl: THeaderControl;
      Section: THeaderSection);
    procedure MainXzGlobalStatus(XceedZip: TXceedZip;
      const GlobalStats: TXcdGlobalStats);
    procedure SelfExtractingMnuClick(Sender: TObject);
    procedure SelfextractorOptionsmnuClick(Sender: TObject);
  private
    { Private declarations }
    MinWidth: Integer;
    TotalSize,
    TotalZipSize: LongInt;
    FilesLbBytes: LongInt;
    Testing: Boolean;

    procedure WMGetMinMaxInfo(var Message: TWMGetMinMaxInfo);
      message WM_GETMINMAXINFO;

    procedure StatusBarShowHint(Sender: TObject);
    procedure EnableInterface(Enable: Boolean);
    procedure SetSfxConfiguration;
    procedure LoadFileList;
  public
    { Public declarations }
  end;

var
  MainFormFm: TMainFormFm;

implementation

uses SFXOptFm;
{$R *.DFM}

procedure FileFix(Agressive: Boolean); forward;

{ The ParseTab function extracts a field from a string containing tab-separated
  fields. For example, this function can extract the third item in a string that
  was assigned the value of an item in a multi-column listbox, since items in
  each column of a listbox are separated by tabs. Pass the column number in the
  FieldIndex parameter. The variable passed in the FieldIndex parameter will be
  incremented. The return value of ParseTab is the extracted string. }

function ParseTab(const Str: String;  var FieldIndex: Integer): String;
var
  I: Integer;
begin
  Result := '';
  if (FieldIndex > 0) and (FieldIndex <= Length(Str)) then
    begin
      for I := FieldIndex to Length(Str) + 1 do
        if (I <= Length(Str)) and (Str[I] = #9) then
          Break;

      if (I <= Length(Str)) then
        begin
          Result := Copy(Str, FieldIndex, I - FieldIndex);
          FieldIndex := I + 1;
        end
      else
        begin
          Result := Copy(Str, FieldIndex, SizeOf(String));
          FieldIndex := 0;
        end;
    end
  else
    FieldIndex := 0;
end;

{ The AssignFromLb procedure takes all the entries in the first column of a
  listbox and places them in a TStringList. In this demo, AssignFromLb is used
  to take all the path and filenames and place them in a TStringList. When the
  demo is running, it may look as if only filenames appear in the first column,
  and the pathnames are in column 7, but that is only on screen. In reality,
  the data in column 1 contains paths and filenames. }

procedure AssignFromLb(SourceLb: TListBox; DestList: TStringList);
var
  I, C: Integer;
begin
  if (SourceLb.SelCount > 0) then
    for I := 0 to SourceLb.Items.Count - 1 do
      if SourceLb.Selected[I] then
        begin
          C := 1;
          DestList.Add(ParseTab(SourceLb.Items[I], C));
        end;
end;

{ The HandleError function is a sample error handling routine for the purposes
  of this demo, but can be used in your own programs as well. When an error
  occurs, it displays a message box indicating the nature of the error. If a
  warning occurs, an information message box will be shown.  The function also
  returns a result of 0 if ErrorCode was 0, 1 if a warning occured, or 2 if an
  error occured. }

function HandleError(ErrorCode: Integer; DoingWhat: String): Integer;
var
  EDesc: String;
  InfoOnly: Boolean;
  ErrorType: Integer;
begin
  EDesc := '';
  InfoOnly := False;
  ErrorType := 2;

  if ErrorCode > XcdSuccess then
    case ErrorCode of

    XcdWarningGeneral,
    XcdWarningNoZipFile,
    XcdErrorNothingToDo:
    { Do not show a message box for these three warning codes. }
      begin
        EDesc := '';
        ErrorType := 1;
      end;
    XcdWarningFilesSkipped:
      begin
        EDesc := 'Some files were skipped while ' + DoingWhat + '.';
        InfoOnly := True;
        ErrorType := 1;
      end;
    XcdWarningEmptyZipfile:
      begin
        EDesc := 'The Zip file is empty.';
        InfoOnly := True;
        ErrorType := 1;
      end;
    XcdErrorUserAbort:
      begin
        EDesc := 'The ' + DoingWhat + ' operation was aborted.';
        InfoOnly := True;
      end;
    XcdErrorNoZipFile:
      EDesc := 'Could not find the archive file.';
    XcdErrorEOF,
    XcdErrorZipStruct:
      EDesc := 'The archive file is corrupted. Try using the Fix option on it.';
    XcdErrorMemory:
      EDesc := 'Ran out of memory while ' + DoingWhat + '.';
    XcdErrorDiskFull:
      EDesc := 'Disk full while ' + DoingWhat + '.';
    XcdErrorTestFailed:
      EDesc := 'Test failed - Errors in the archive.';
    XcdErrorZeroTested:
      EDesc := 'No files ended up being tested in the archive.';
    XcdErrorDLLNotFound:
      EDesc := 'The XCDZIP32.DLL or the XCDUNZ32.DLL file could not be found.';
    XcdErrorTempFile:
      EDesc := 'Problem with the temporary file.';
    XcdErrorLatest:
      EDesc := 'Could not update the Zip archive date. Archive only contains ' +
        'directories or is empty.';
    XcdErrorLibInUse:
      EDesc := 'Another application is currently performing a similar task. ' +
        'Wait until the other application has completed its operation.';
    XcdErrorParentDir:
      EDesc := 'Attempt to remove parent directory.';
    XcdErrorDosError:
      EDesc := 'Could not access the Zip file or one of the files to process.';
    XcdErrorNameRepeat:
      EDesc := 'Names repeated in archive after discarding pathnames.';
    XcdErrorMultidisk:
      EDesc := 'Attempt to work with a multiple-disk Zip archive, but not in multidisk mode.';
    XcdErrorWrongDisk:
      EDesc := 'Wrong disk was inserted too many times.';
    XcdErrorMultidiskBadCall:
      EDesc := 'Function not supported in multidisk mode.';
    XcdErrorCantOpenBinary:
      EDesc := 'Could not open the self-extractor binary.';
    XcdErrorCantOpenSFXConfig:
      EDesc := 'Could not open the self-extractor configuration file';
    XcdErrorInvalidEventParam:
      EDesc := 'Invalid command parameter passed to an Xceed Zip event.';
    XcdErrorCantWriteSfx:
      EDesc := 'Not enough space on first disk to write self-extractor.';
    XcdErrorRead:
      EDesc := 'Problem reading from file while ' + DoingWhat + '.';
    XcdErrorWrite:
      EDesc := 'Problem writing to file while ' + DoingWhat + '.';
    XcdErrorBinaryVersion:
      EDesc := 'Invalid self-extractor binary version.';
    XcdErrorCantCreateDir:
      EDesc := 'Problem creating destination directory while ' + DoingWhat + '.';
    XcdErrorBadCall: { Programming error in this application }
      EDesc := 'Invalid property settings. Programming error.';
    else
      EDesc := 'An error occured while '+ DoingWhat + ' the specified files.';
    end
  else
    ErrorType := 0;

  if EDesc <> '' then
    if InfoOnly then
      MessageDlg(EDesc, mtInformation, [mbOK], 0)
    else
      MessageDlg(EDesc, mtError, [mbOK], 0);

  Result := ErrorType;

end;

{ TMainFormFm }
procedure TMainFormFm.FormCreate(Sender: TObject);
begin
  Application.OnHint := StatusBarShowHint;

  MinWidth := Width;

  Caption := 'Untitled - Xceed Zip Demo';
  Application.Title := Caption;
  SetSfxConfiguration;
end;

procedure TMainFormFm.WMGetMinMaxInfo(var Message: TWMGetMinMaxInfo);
begin
  if Visible then
    Message.MinMaxInfo^.ptMinTrackSize.X := MinWidth;
end;

procedure TMainFormFm.StatusBarShowHint(Sender: TObject);
begin
  StatusLb.Visible := (Application.Hint = '');
  HintLb.Visible := (Application.Hint <> '');
  HintLb.Caption := Application.Hint;
end;

{ The EnableInterface procedure is used to 'shut down' parts of the graphical
  interface of this demo while the TXceedZip component is working. It turns off
  menus, changes the cursor to an hourglass, etc. It can also be called to turn
  everything back on. }

procedure TMainFormFm.EnableInterface(Enable: Boolean);
const
  DisableCount: Integer = 0;
begin
  if Enable then
    { Keep track of multiple disables/enables, and enable interface only when
      there are as many 'enables' as there were 'disables'. }
    DisableCount := DisableCount - 1
  else
    DisableCount := DisableCount + 1;

  if (DisableCount < 0) then
    DisableCount := 0;

  FileMn.Enabled := (DisableCount = 0);
  EditMn.Enabled := (DisableCount = 0);
  OptionsMn.Enabled := (DisableCount = 0);
  HelpMn.Enabled := (DisableCount = 0);
  FilesLb.Enabled := (DisableCount = 0);
  { Do not allow abort when not using a temp file, it can corrupt the archive. }
  AbortSb.Enabled := (DisableCount <> 0) and (MainXz.UseTempFile = True);

  if (DisableCount = 0) then
    Cursor := crDefault
  else
    Cursor := crHourglass;

  if Enable then
  begin
    ProgressBar1.Position := 0;
    StatusLb.Caption := IntToStr(FilesLb.Items.Count) + ' Entries, ' +
      FloatToStrF(TotalSize, ffNumber, 10, 0) + ' Bytes, ' +
      FloatToStrF(TotalZipSize, ffNumber, 10, 0) + ' Bytes.';
  end;

  HintLb.Caption := '';

  { The HintLb and StatusLb labels are one on top of the other. }
  HintLb.Visible := (DisableCount = 0);
  StatusLb.Visible := (DisableCount <> 0);

end;

{ The LoadFileList procedure asks the TXceedZip component for a list of files
  contained in the current archive. It calls the List method and expects to
  receive all the information via the OnListing event. See the MainXzListing
  procedure to see how the information is placed into the demo's main listbox. }

procedure  TMainFormFm.LoadFileList;
var
  Err: Integer;
  NumberOfFiles: Integer;
begin
  TotalSize := 0;
  TotalZipSize := 0;

  FilesLb.Items.Clear;
  FilesLbBytes := 0;

  ProgressBar1.Position := 0;

  NumberOfFiles := MainXz.FileCount;

  ProgressBar1.Max := NumberOfFiles;
  If NumberOfFiles > 100 then
    StatusLb.Caption := 'Reading ' + IntToStr(NumberOfFiles) + ' items...';

  FilesLb.Items.BeginUpdate;
  Err := MainXz.List;
  if (Err <> XcdErrorNoZipFile) then
    HandleError(Err, 'reading archive contents');
  FilesLb.Items.EndUpdate;

  ProgressBar1.Position := 0;
  ProgressBar1.Max := 100; { reset to usual maximum }
end;

{ The FileMnClick procedure makes sure that the proper items are enabled in the
  File menu. }

procedure TMainFormFm.FileMnClick(Sender: TObject);
begin
  FileCloseMn.Enabled := (MainXz.ZipFileName <> '');
  FileFixMn.Enabled := (MainXz.ZipFileName = '') and (not MainXz.MultidiskMode);
  FileDeleteMn.Enabled := (MainXz.ZipFileName = '');
  FileTestMn.Enabled := (MainXz.ZipFileName = '');
end;

{ The FileNewMnClick procedure creates a new archive file, but the archive file
  is not really created until files are added to it first. }

procedure TMainFormFm.FileNewMnClick(Sender: TObject);
begin
  NewZipDg.FileName := '';
  EnableInterface(False);
  if NewZipDg.Execute then
    begin
      if FileExists(NewZipDg.FileName) then
        DeleteFile(PChar(NewZipDg.FileName));
      { Inform the TXceedZip component of the zip file name to use. }
      MainXz.ZipFileName := NewZipDg.FileName;
      Caption := ExtractFileName(MainXz.ZipFileName) + ' - Xceed Zip Demo';
      Application.Title := Caption;
      FilesLb.Clear;
      FilesLbBytes := 0;
      TotalSize := 0;
      TotalZipSize := 0;
      StatusLb.Caption := '';
    end;
  EnableInterface(True);
end;

{ The FileOpenMnClick procedure opens an already existing archive, and calls
  LoadFileList to list the archive's contents into the demo's main listbox. }

procedure TMainFormFm.FileOpenMnClick(Sender: TObject);
begin
  OpenZipDg.Title := 'Open Archive';
  OpenZipDg.FileName := '';
  EnableInterface(False);
  if OpenZipDg.Execute then
    begin
      { Inform the TXceedZip component of the zip file name to use. }
      MainXz.ZipFileName := OpenZipDg.FileName;
      Caption := ExtractFileName(MainXz.ZipFileName) + ' - Xceed Zip Demo';
      Application.Title := Caption;
      { Call procedure that will list the contents of the archive into the
        demo's main listbox. }
      LoadFileList;
    end;
  EnableInterface(True);
end;

{ The FileCloseMnClick procedure closes an archive. It does not really close the
  archive because the archive is already closed when not being used. It only
  clears the main listbox, the ZipFileName property of the TXceedZip component,
  and the application title is reset. }

procedure TMainFormFm.FileCloseMnClick(Sender: TObject);
begin
  MainXz.ZipFileName := '';
  Caption := 'Untitled - Xceed Zip Demo';
  Application.Title := Caption;
  FilesLb.Clear;
  FilesLbBytes := 0;
  StatusLb.Caption := '';
end;

{ The FileDeleteMnClick procedure prompts the user for an archive file to
  delete, then deletes it. }

procedure TMainFormFm.FileDeleteMnClick(Sender: TObject);
begin
  OpenZipDg.Title := 'Delete Archive';
  OpenZipDg.FileName := '';
  EnableInterface(False);

  if OpenZipDg.Execute and (MessageDlg('Are you sure you want to delete file'#13 + '"'
     + OpenZipDg.FileName + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    DeleteFile(PChar(OpenZipDg.FileName));

  EnableInterface(True);
end;

{ The FileTestMnClick procedure tells the TXceedZip component to test the
  contents of an archive file selected by the user. A dialog box is opened for
  the user to select the archive file. Note: The Test method is used, but is not
  passed a list of files to process. Without a list of files to process, the
  TXceedZip component will test all the files in the archive. You can pass a
  list of files to test in the same way that files are passed to the Extract
  method in the EditExtractMnClick procedure in this demo. This way, you can
  test specific files. }

procedure TMainFormFm.FileTestMnClick(Sender: TObject);
var
  Err: Integer;
begin
  OpenZipDg.Title := 'Test Archive';
  OpenZipDg.FileName := '';
  EnableInterface(False);
  { Open a dialog box to ask for the archive filename. }
  if OpenZipDg.Execute then
    begin
      { Inform the TXceedZip component of the filename. }
      MainXz.ZipFileName := OpenZipDg.FileName;
      { Since it may take long before getting an OnTesting event so we can
        display 'Testing file...' we will display 'Testing archive...' until then. }
      StatusLb.Caption := 'Testing archive ' + MainXz.ZipFileName;

      Testing := True; { used so that skipping messages are different }
      { Execute the Test method. Put return value in Err. }
      Err := MainXz.Test;
      Testing := False;
      { Since we are testing an archive file, XcdSuccess means that all the
        files in the archive have passed the test. }
      if (Err = XcdSuccess) then
        MessageDlg('All files in the archive are OK.',
          mtInformation, [mbOK], 0)
      else if (Err = XcdWarningFilesSkipped) then
        { We can permit ourselves to say 'Some files were skipped', without
          specifying which ones, because the OnSkippingFile event will have
          already informed us about each file being skipped. }
        MessageDlg('All files tested in the archive are OK.'#13 +
          '(Some files were skipped)', mtInformation, [mbOK], 0)
      else
        { Regular error handler. }
        HandleError(Err, 'testing');

      MainXz.ZipFileName := '';

    end;
    EnableInterface(True);
 end;

procedure TMainFormFm.FileExitMnClick(Sender: TObject);
begin
  Close;
end;

{ The EditMnClick procedure makes sure that the proper menu items in the Edit
  menu are enabled. For example, when we are in Multidisk mode, the Update,
  Delete and UpdateZIPDate commands cannot be used. }

procedure TMainFormFm.EditMnClick(Sender: TObject);
begin
  EditAddMn.Enabled := (MainXz.ZipFileName <> '')
    and ((MainXz.MultidiskMode = False) or (FilesLb.Items.Count = 0));
  EditDeleteMn.Enabled := (FilesLb.SelCount > 0) and (not MainXz.MultidiskMode);
  EditExtractMn.Enabled := (FilesLb.SelCount > 0);
  EditUpdateMn.Enabled := (MainXz.ZipFileName <> '') and (not MainXz.MultidiskMode);
  EditUpdateZIPDateMn.Enabled := (FilesLb.Items.Count > 0) and (not MainXz.MultidiskMode);
  EditSelectAllMn.Enabled := (FilesLb.Items.Count > 0);
end;

{ The EditAddMnClick procedure adds files to the currently opened archive file.
  A dialog box is opened to allow the user to select the files to be added to
  the archive. Files selected in the demo's main listbox are not considered. }

procedure TMainFormFm.EditAddMnClick(Sender: TObject);
var
  FilesToAdd: TStrings;
begin
  AddFilesDg.FileName := '';
  EnableInterface(False);
  { Allow user to select files to add with a dialog box. }
  if AddFilesDg.Execute then
    begin
      FilesToAdd := AddFilesDg.Files;
      { Add all the files selected from the dialog box to the TXceedZip
        component's list of files to process. }
      MainXz.FilesToProcess.Assign(FilesToAdd);
      StatusLb.Caption := 'Adding selected files.';
      { Add the files, handle return code. }
      if HandleError(MainXz.Add(xecAll), 'adding') <> 2 then
      begin
        { If in Multidisk mode, tell user the add was completed (so that
          the user may understand that any further disk swapping is only
          to read the contents of the archive. }
        if (MainXz.MultidiskMode) then
          MessageDlg('Add operation completed.  To test the archive, you must' +
          ' close it first, then select the test option from the file menu.',
          mtInformation, [mbOK], 0);
        { Update the demo's main listbox to reflect the new additions. }
        LoadFileList;
      end;
    end;
    EnableInterface(True);
end;

{ The EditDeleteMnClick procedure takes the selected files in the demo's listbox
  and instructs the TXceedZip component to delete these files from the currently
  opened archive. }

procedure TMainFormFm.EditDeleteMnClick(Sender: TObject);
begin
  EnableInterface(False);
  { Add all the files that are selected in the demo's main listbox to the
    TXceedZip component's list of files to process. Since the main listbox
    contains a list of files already in the currently opened archive, only files
    in the archive can be selected to delete. }
  AssignFromLb(FilesLb, MainXz.FilesToProcess);
  StatusLb.Caption := 'Deleting selected files.';
  { Delete the files, handle return code }
  HandleError(MainXz.Delete, 'deleting');
  { Update the demo's main listbox to reflect the current contents of the
    currently opened archive file. }
  LoadFileList;
  EnableInterface(True);
end;

{ The EditExtractMnClick procedure takes the selected files in the demo's
  listbox and instructs the TXceedZip component to extract these files into the
  user selected destination. A dialog box is opened to let the user select the
  destination directory. }

procedure TMainFormFm.EditExtractMnClick(Sender: TObject);
var
  Dir: String;
begin
  GetDir(0, Dir);

  if (FilesLb.SelCount > 0) then
    { Ask the user where to extract the files. }
    if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt], 0) then
      begin
        EnableInterface(False);
        { Add all the files that are selected in the demo's main listbox to the
          TXceedZip component's list of files to process. Since the main listbox
          contains a list of files already in the currently opened archive, only
          files in the archive can be selected to extract. }
        AssignFromLb(FilesLb, MainXz.FilesToProcess);
        { Tell TXceedZip component where the user wants to extract the files. }
        MainXz.ExtractDirectory := Dir;
        StatusLb.Caption := 'Extracting selected files.';
        { Extract the files, handle return code. }
        HandleError(MainXz.Extract(xecAll),'extracting');
        { No need to update the main listbox here - contents have not changed. }
        EnableInterface(True);
      end;
end;

{ The EditUpdateMnClick procedure updates files in the currently opened archive
  file. A dialog box is opened to allow the user to select files to be updated
  in the archive. Update means that only files newer than those already in the
  archive file will be added or replaced into the archive.}

procedure TMainFormFm.EditUpdateMnClick(Sender: TObject);
begin
  AddFilesDg.FileName := '';
  EnableInterface(False);
  { Allow user to select files to update with a dialog box. }
  if AddFilesDg.Execute then
    begin
      { Add all the files selected from the dialog box to the TXceedZip
        component's list of files to process. }
      MainXz.FilesToProcess.Assign(AddFilesDg.Files);
      StatusLb.Caption := 'Updating files.';
      { Update the files, handle error }
      if HandleError(MainXz.Add(xecUpdate),'updating') <> 2 then
        { Update the demo's main listbox to reflect the new additions. }
        LoadFileList;
    end;
  EnableInterface(True);
end;

{ The EditUpdateZipDateMnClick procedure tells the TXceedZip component to update
  the date of an archive file to the date of the most recent file it contains.
  A dialog box opens up to prompt the user for the name of the archive file. }

procedure TMainFormFm.EditUpdateZIPDateMnClick(Sender: TObject);
begin
  EnableInterface(False);
  StatusLb.Caption := 'Updating ZIP date.';
  { Update the zip date, handle error }
  HandleError(MainXz.UpdateZIPDate, 'updating zip date');
  EnableInterface(True);
end;

{ The EditSelectAllMnClick procedure selects all the items in the demo's main
  listbox. }

procedure TMainFormFm.EditSelectAllMnClick(Sender: TObject);
begin
  SendMessage(FilesLb.Handle, LB_SELITEMRANGE, 1, MakeLong(0, FilesLb.Items.Count - 1));
end;

procedure TMainFormFm.OptionsMnClick(Sender: TObject);
begin
  OptionsUseTempFileMn.Checked := MainXz.UseTempFile and (not MainXz.MultidiskMode);
  OptionsUseTempFileMn.Enabled := not MainXz.MultidiskMode;
  ClearDisksMn.Checked := MainXz.ClearDisks and (MainXz.MultidiskMode);
  ClearDisksMn.Enabled := MainXz.MultidiskMode;
  MultidiskModeMn.Checked := MainXz.MultidiskMode;
  NoCompression.Checked := (MainXz.Compression = 0);
  FastestCompression.Checked := (MainXz.Compression = 1);
  NormalCompression.Checked := (MainXz.Compression = 6);
  BestCompression.Checked := (MainXz.Compression = 9);
end;

{ The OptionsUseTempFileMnClick procedure informs the TXceedZip component
  whether or not to use a temporary file when adding files. }

procedure TMainFormFm.OptionsUseTempFileMnClick(Sender: TObject);
begin
  MainXz.UseTempFile := Not MainXz.UseTempFile;
  OptionsUseTempFileMn.Checked := MainXz.UseTempFile;
end;

procedure TMainFormFm.MultidiskmodeMnClick(Sender: TObject);
begin
  MainXz.MultidiskMode := Not MainXz.MultidiskMode;
  MultidiskModeMn.Checked := MainXz.MultidiskMode;
end;

{ The HelpAboutMnClick option opens an about box for this demo. }

procedure TMainFormFm.HelpAboutMnClick(Sender: TObject);
begin
  MessageDlg('Xceed Zip Compression Library Demo - Delphi3 Version 3.0'#13 +
    'Copyright ©1995-1997 Xceed Software, all rights reserved.'#13 +
    'This demo was made with Borland Delphi 3.0', mtInformation, [mbOK], 0);
end;

{ The AbortSbClick procedure prompts the user (with a message box), if they want
  to stop the current operation. This procedure is called when the user clicks
  on the little stop sign in the bottom right corner of the demo's main form. }

procedure TMainFormFm.AbortSbClick(Sender: TObject);
begin
  if (MessageDlg('Are you sure you want to abort the current process?',
    mtWarning, mbOKCancel, 0) = mrOK) then
  MainXz.Abort := True;
end;

{ The FilesLbDrawItem procedure draws the items contained in the demo's main
  listbox using the proper format. For example, the filename and path are
  separated into the 1st and 7th column when being displayed. Column widths
  are set according to the FilesHd header control which can be resized by
  the user at runtime }

procedure TMainFormFm.FilesLbDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  I: Integer;
  R: TRect;
  FileName,
  ItemStr, Str: String;
begin
  with (Control as TListBox) do
    begin
      if (odGrayed in State) or (odDisabled in State) then
        Canvas.Font.Color := clGrayText;

      ItemStr := Items[Index];
      I := 1;

      R := Rect;
      R.Right := R.Left + FilesHd.Sections[0].Width;
      FileName := ParseTab(ItemStr, I);
      Canvas.TextRect(R, R.Left + 2, R.Top, ExtractFileName(FileName));

      R.Left := R.Right;
      R.Right := R.Left + FilesHd.Sections[1].Width;
      Str := ParseTab(ItemStr, I);
      Canvas.TextRect(R, R.Left + (R.Right - R.Left) - Canvas.TextWidth(Str)
        - 2, R.Top, Str);

      R.Left := R.Right;
      R.Right := R.Left + FilesHd.Sections[2].Width;
      Str := ParseTab(ItemStr, I);
      Canvas.TextRect(R, R.Left + (R.Right - R.Left) - Canvas.TextWidth(Str)
       - 2, R.Top, Str);

      R.Left := R.Right;
      R.Right := R.Left + FilesHd.Sections[3].Width;
      Str := ParseTab(ItemStr, I);
      Canvas.TextRect(R, R.Left + (R.Right - R.Left) - Canvas.TextWidth(Str)
        - 2, R.Top, Str);

      R.Left := R.Right;
      R.Right := R.Left + FilesHd.Sections[4].Width;
      Str := ParseTab(ItemStr, I);
      Canvas.TextRect(R, R.Left + (R.Right - R.Left) - Canvas.TextWidth(Str)
        - 2, R.Top, Str);

      R.Left := R.Right;
      R.Right := R.Left + FilesHd.Sections[5].Width;
      Str := ParseTab(ItemStr, I);
      Canvas.TextRect(R, R.Left + (((R.Right - R.Left) - Canvas.TextWidth(Str))
        div 2), R.Top, Str);

      R.Left := R.Right;
      R.Right := Rect.Right;
      Canvas.TextRect(R, R.Left + 2, R.Top,
        RemoveBackSlash(ExtractFilePath(FileName)));
    end;
end;

procedure TMainFormFm.FilesLbMeasureItem(Control: TWinControl;
  Index: Integer; var Height: Integer);
begin
  Height := (Control as TListBox).Canvas.TextHeight('W');
end;

{ MainXz events }

{ The MainXzAdding procedure is a handler for the OnAdding event generated by
  the TXceedZip component whenever a new file is going to be added to an
  archive. This particular handler simply displays which file is being added
  into the demo's status label, and resets the progress bar to 0%. }

procedure TMainFormFm.MainXzAdding(XceedZip: TXceedZip;
  const FileStats: TXcdFileStats);
begin
    StatusLb.Caption := 'Adding "' + FileStats.Name + '".'+ '('+
                   FloatToStrF(Filestats.size div 1024, ffFixed, 10, 0)+'K,   0%)';

end;

{ The MainXzDeleting procedure is a handler for the OnDeleting event generated
  by the TXceedZip component whenever a file is being deleted from an archive.
  This particular handler simply displays which file is being deleted into the
  demo's status label, and resets the progress bar to 0%. Note: The progress
  bar will not be updated beyond 0% during the delete operation because the
  delete operation does not generate OnStatus events. }

procedure TMainFormFm.MainXzDeleting(XceedZip: TXceedZip;
  const FileName: String);
begin
  StatusLb.Caption := 'Deleting "' + FileName + '".';
end;

{ See the note for the MainXzDeleting procedure/handler, because this handler is
  identical except for replacing Deleting with Fixing. }

procedure TMainFormFm.MainXzFixing(XceedZip: TXceedZip;
  const FileName: String);
begin
  StatusLb.Caption := 'Fixing "' + FileName + '".';
end;

{ The MainXzListing procedure is an event handler for the OnListing event
  generated by the TXceedZip component because the List method was called to
  list files in an archive. This particular handler here takes information of
  each file and adds it to the demo's main listbox. No more than 64000 bytes
  of files and file information will be added to the listbox. }

procedure TMainFormFm.MainXzListing(XceedZip: TXceedZip;
  const FileStats: TXcdFileStats);
var
  NewListboxData: String;
begin
  { The FileStats parameter contains all of the file's information. }
  with FileStats do
    begin
      NewListBoxData := Name + #9 + DateToStr(Time) + #9 + TimeToStr(Time) + #9
        + FloatToStrF(Size, ffNumber, 10, 0) + #9 +
        FloatToStrF(PackedSize, ffNumber, 10, 0) + #9 + IntToStr(Ratio) + '%';

      if FilesLbBytes < 64000 then
      begin
        FilesLb.Items.Add(NewListBoxData);
        FilesLbBytes := FilesLbBytes + Length(NewListBoxData);
      end;

      if ProgressBar1.Max > 100 then
        ProgressBar1.Position := ProgressBar1.Position + 1;

      TotalSize := TotalSize + Size;
      TotalZipSize := TotalZipSize + PackedSize;
    end;
end;

{ The MainXzStatus procedure is an event handler for the OnStatus event
  generated by the TXceedZip component to provide a progress report on the
  current file being processed. This particular handler here simply updates a
  gauge to reflect the current percentage of completion for a file. It does not
  use any of the other information that can be obtained from the FileStats
  parameter because the filename of the file currently being processed was
  already displayed in the demo's status label by the handler for the OnAdding,
  OnTesting, OnFixing, and OnExtracting events. In this demo we do not display
  the amount of bytes processed for the file in text. }

procedure TMainFormFm.MainXzStatus(XceedZip: TXceedZip;
  const FileStats: TXcdFileStats);
begin
   StatusLb.Caption := copy(StatusLb.Caption,0,Pos(',',StatusLb.Caption));
   StatusLb.Caption := StatusLb.Caption + ' '+IntToStr(FileStats.Completion)+'%)'
end;

{ See the note for the MainXzDeleting procedure/handler, because this handler is
  identical except for replacing 'Deleting' with 'Testing'. }

procedure TMainFormFm.MainXzTesting(XceedZip: TXceedZip;
  const FileStats: TXcdFileStats);
begin
    StatusLb.Caption := 'Testing "' + FileStats.Name + '".' + '('+
                   FloatToStrF(Filestats.size div 1024, ffFixed, 10, 0)+'K,   0%)'

end;

{ The MainXzSkipping procedure is an event handler for the TXceedZip component's
  OnSkippingFile event. A message box is displayed to inform the user that a
  file is being skipped. The reason why is also indicated. }

procedure TMainFormFm.MainXzSkippingFile(XceedZip: TXceedZip;
  const Skipping: TXcdSkipping);
var
  SkipMsg: String;
begin
  if not Testing then
    SkipMsg := 'Skipping "' + Skipping.Name + '", '
  else
    SkipMsg := 'File "' + Skipping.Name +'" failed test: ';

  case TxcdSkippingReason(Skipping.Reason) of
    xsrFileNotFound:
      SkipMsg := SkipMsg + 'file not found.';
    xsrBadCrc:
      SkipMsg := SkipMsg + 'CRC does not check out.';
    xsrBadVersion:
      SkipMsg := SkipMsg + 'unknown compression.';
    xsrUnableToOpen:
      SkipMsg := SkipMsg + 'unable to open file.';
    xsrUpToDate:
      SkipMsg := SkipMsg + 'file is already up to date.';
    xsrBadPassword:
      SkipMsg := SkipMsg + 'invalid or no password to decrypt file.';
    xsrBadData:
      SkipMsg := SkipMsg + 'file'#39's compressed data is corrupted.';
    xsrOverwrite:
      SkipMsg := SkipMsg + 'instructed not to overwrite.';

  end;

  MessageDlg(SkipMsg, mtWarning, [mbOK], 0);

end;

{ See the note for the MainXzDeleting procedure/handler, because this handler
  is identical except for replacing Deleting with Updating. }

procedure TMainFormFm.MainXzUpdating(XceedZip: TXceedZip;
  const FileStats: TXcdFileStats);
begin
  StatusLb.Caption := 'Updating "' + FileStats.Name + '".'+ '('+
                   FloatToStrF(Filestats.size div 1024, ffFixed, 10, 0)+'K,   0%)';
end;

{ See the note for the MainXzDeleting procedure/handler, because this handler is
  identical except for replacing Deleting with Extracting. }

procedure TMainFormFm.MainXzExtracting(XceedZip: TXceedZip;
  const FileStats: TXcdFileStats);
begin
    StatusLb.Caption := 'Extracting "' + FileStats.Name + '".'+ '('+
                   FloatToStrF(Filestats.size div 1024, ffFixed, 10, 0)+'K,   0%)';
end;

{ The MainXzReplace procedure is an event handler for the OnReplace event
  generated by the TXceedZip component whenever a file that is being extracted
  may overwrite an already existing file. This procedure displays a message box
  to allow the user to decide to skip the file or not. Notes: The Overwrite
  property must be set to xowAsk for the OnReplace event to occur. Also, the
  choice to rename the file could also be given, as well as the choice of always
  overwriting or never overwriting. See 'OnReplace' in the online help. }

procedure TMainFormFm.MainXzReplace(XceedZip: TXceedZip;
  var Replace: TXcdReplace);
var
  UserAnswer: Word;
begin
  UserAnswer := MessageDlg('The file "' + Replace.OrigName +
    '" already exists. Do you want to replace this file?',
    mtConfirmation, [mbYes,mbNo,mbAbort], 0);
  if UserAnswer = mrYes then
    { Tell the TXceedZip component to replace this file. }
    Replace.Command := xrcReplace
  else if UserAnswer = mrNo then
    { Tell the TXceedZip component to skip this file. }
    Replace.Command := xrcSkip
  else
    { Tell the XceedZip component to stop the entire operation. }
    MainXz.Abort := True;
end;

procedure TMainFormFm.FastestcompressionClick(Sender: TObject);
begin
  MainXz.Compression := 1;
end;

procedure TMainFormFm.NormalcompressionClick(Sender: TObject);
begin
  MainXz.Compression := 6;
end;

procedure TMainFormFm.BestcompressionClick(Sender: TObject);
begin
  MainXz.Compression := 9;
end;

procedure TMainFormFm.NoCompressionClick(Sender: TObject);
begin
  MainXz.Compression := 0;
end;

procedure TMainFormFm.ClearDisksMnClick(Sender: TObject);
begin
  MainXz.ClearDisks := not ClearDisksMn.Checked;
end;

{ The FixNormal1Click procedure tells the TXceedZip component to fix a zipfile.
  This procedure is activated when the File|Fix|Normal menu item is selected.
  The actual code is found in the FileFix procedure.}

procedure TMainFormFm.FixNormal1Click(Sender: TObject);
begin
  FileFix(False);
end;

{ This procedure is like the previous one but it calls FileFix with the
  agressive-fix feature. See online help for more details about the
  FIX modes. }

procedure TMainFormFm.FixAgressive1Click(Sender: TObject);
begin
  FileFix(True);
end;

{ The FileFix procedure tells the TXceedZip component to fix a zipfile,
  with the 'agressive' feature on/off depending on the 'agressive' parameter.
  A dialog box is used to prompt the user for the archive filename to fix. }

procedure FileFix(Agressive: Boolean);
var
  Err: Integer;
begin
  with MainFormFm do
  begin
    OpenZipDg.Title := 'Fix Archive';
    OpenZipDg.FileName := '';
    EnableInterface(False);
    if OpenZipDg.Execute then
      begin
        { Tell the TXceedZip component which archive file to work with. }
        MainXz.ZipFileName := OpenZipDg.FileName;

        { Call the Fix method (aggressive = True, set Err to the return value. }
        Err := MainXz.Fix(Agressive);
        { Since we are fixing, Err=XcdSuccess means the archive has been fixed. }
        if (Err = XcdSuccess) then
          MessageDlg('The specified Zip file has been fixed.',
            mtInformation, [mbOK], 0)
        else if (Err = XcdErrorZipStruct) then
          MessageDlg('The specified Zip file is too corrupted to be fixed.',
            mtInformation, [mbOK], 0)
        else
          { Some other error, pass it to the error handling routine. }
          HandleError(Err,'fixing');

        MainXz.ZipFileName := '';
      end;
      EnableInterface(True);
  end;
end;

{ The following procedure handles the OnNewdisk event, which occurs when
  multidisk mode is activated and the component requires another disk to
  be inserted. This procedure simply informs the user to insert the right
  disk (depending on the Disknumber parameter, and waits for the user to
  press OK... }

procedure TMainFormFm.MainXzNewdisk(XceedZip: TXceedZip;
  const Disknumber: Integer);
var
  response: Word;
begin
  if (DiskNumber = 0) then
    response := MessageDlg('Please insert the last disk of the set.',
      mtConfirmation, [mbOK,mbCancel], 0)
  else
    response := MessageDlg('Please insert disk #' + IntToSTr(Disknumber)
      + ' of the set.',mtConfirmation, [mbOK,mbCancel], 0);

  if (response = mrCancel) then MainXz.Abort := True;

end;

procedure TMainFormFm.FilesHdSectionResize(HeaderControl: THeaderControl;
  Section: THeaderSection);
begin
     FilesLb.Refresh;
end;

procedure TMainFormFM.SetSfxConfiguration;
var
  Intro: String;
begin

  With MainFormFM.MainXZ Do
  begin

    { The SfxExtractDirectory property should contain the path where files will be
      extracted to by default.

      The following variables are available when specifying
      a value for SfxExtractDirectory:

      %W = The location of the Windows Directory
      %S = The location of the Windows System directory
      %e = The directory where the self-extractor is being run from.
      %% = The '%' symbol.}

    SfxExtractDirectory := '%e';

    { The SfxReadmePath should contain the path and filename of a text file
      to display after extracting files.}

    SfxReadmePath := '';

    { The SfxRunExePath property should contain the path and filename of an
      executable to run after succesfully extracting all the files. This
      property also should contain the parameters the executable.

      The following variables are available when specifying
      a value for RunExePath:

      %d = The DefaultExtractDir, or the user-selected
           directory where files were extracted.
      %W = The location of the Windoes Directory
      %S = The location of the Windows System directory
      %e = The directory where the self-extractor is
           being run from.
      %% = The '%' symbol.}

    SfxRunExePath := '';

    { Display the Confirm Extract Directory dialog box}
    SfxPromptForDirectory := True;

    { Display the Confirm Create Directory dialog box}
    SfxPromptCreateDirectory := True;

    { Display a Progress dialog box while extracting}
    SfxShowProgress := True;

    { Display a Password Prompt dialog box when required}
    SfxPromptForPassword := True;

    { Default password to be used by self-extractor to extract files}
    SfxDefaultPassword := '';

    { Default overwrite behavior (Ask, Never, Always)}
    SfxOverwrite := xowAsk;

    { Caption for the OK button.}
    SfxButtons[xsbOk] := '&OK';

    { Caption for the Cancel button.}
    SfxButtons[xsbCancel] := '&Cancel';

    { Caption for the Abort button.}
    SfxButtons[xsbAbort] := '&Abort';

    { Caption for the skip button (Password Prompt dialog)}
    SfxButtons[xsbSkip] := '&Skip File';

    { Caption for the always skip button (password Prompt dialog)}
    SfxButtons[xsbAlwaysSkip] := '&Always Skip';

    { Caption for Yes buttons.}
    SfxButtons[xsbYes] := '&Yes';

    { Caption for No button}
    SfxButtons[xsbNo] := '&No';

    { Caption for the Overwrite All button (Overwrite dialog)}
    SfxButtons[xsbOverwriteAll] := '&All';

    { Caption for the Overwrite None button (Overwrite dialog)}
    SfxButtons[xsbOverwriteNone] := 'N&one';

    { Caption for the Continue button (Intro Message dialog)}
    SfxButtons[xsbContinue] := '&Continue';

    { Caption for the Exit button (Intro Message and Confirm Extract Directory dialog)}
    SfxButtons[xsbExit] := '&My_Exit'; {Default is 'Exit'}

    { Prompt for extract directory (Confirm Extract Directory dialog)}
    SfxPrompts[xspDirectory] := 'Select the path where you want to extract the files to.';

    { Prompt requiring user to enter a password (Password Prompt dialog)}
    SfxPrompts[xspPassword] := 'A password is required for file:';

    { Prompt to insert the last disk}
    SfxPrompts[xspInsertLastDisk] := 'Please insert the last disk of the set.';

    { Prompt to insert a specific disk}
    SfxPrompts[xspInsertDisk] := 'Please insert disk #%n.';

    { Prompt to confirm abort}
    SfxPrompts[xspAbortExtract] := 'Are you sure you want to abort the self-extracting process?';

    { Prompt to create a directory that doesn't exist}
    SfxPrompts[xspCreateDir] := 'Directory ''%d'' does not exist. Do you want to create it?';

    { Prompt when about to overwrite a file}
    SfxPrompts[xspOverwrite] := 'The file ''%f'' already exists. Do you want to overwrite it?';

    { String indicating file currently being extracted}
    SfxStrings[xssExtractingFile] := 'Extracting file:';

    { String indicating what the progress bar is}
    SfxStrings[xssProgress] := 'Overall progress:';

    { String displayed in title bar of all dialog boxes}
    SfxStrings[xssTitle] := 'My Self Extractor';
    {Default value is "The Xceed Zip Self-Extractor"}

    { String indicating which directory is selected (browser)}
    SfxStrings[xssCurrentExtractDir] := 'Current extract directory:';

    { This is the string used to display the available connected drives in the directory
      browser's drive list.

      The following variables are available when specifying
      a value for DriveShareStr:
         %s = Share name
         %c = Computer name where share is located}

    SfxStrings[xssDriveShare] := '%s on ''%c''';

    { This is the string used to represent the entry in the directory browser 's
      drive list that represents the entire network.}

    SfxStrings[xssEntireNetwork] := 'Current extract directory:';

    { Message displayed when self-extracting has been succesfully completed}
    SfxMessages[xsmSuccess] := 'All files were succesfully extracted.';

    { Message displayed if there are any errors when extracting}
    SfxMessages[xsmFail] := 'Error during extraction. One or more files were not succesfully extracted.';

    { Message displayed if failed in creating directory}
    SfxMessages[xsmErrorCreatingDir] := 'Unable to create directory ''%d''';

    { Message displayed when self-extractor is run}

    Intro := 'Welcome to the Xceed Zip Self-Extractor. This program will extract ' +
             'some files onto your system. This program was made with the ' +
             'Xceed Zip Delphi 3 sample application, and can be fully customized! '+
             'Look at the SetSfxConfiguration function in the sample app!';

    SfxMessages[xsmIntro] := Intro;

  End;

End;


procedure TMainFormFm.MainXzGlobalStatus(XceedZip: TXceedZip;
  const GlobalStats: TXcdGlobalStats);
begin
  ProgressBar1.Position := GlobalStats.CompletionBytes;
end;

procedure TMainFormFm.SelfExtractingMnuClick(Sender: TObject);
begin
     SelfExtractingMnu.Checked := Not SelfExtractingMnu.Checked;
     SelfextractorOptionsmnu.Enabled := SelfExtractingMnu.Checked;
     MainXz.SelfExtracting := SelfExtractingMnu.Checked;

end;

procedure TMainFormFm.SelfextractorOptionsmnuClick(Sender: TObject);
begin
      frmConfigSFX.ShowModal;
end;

end.

