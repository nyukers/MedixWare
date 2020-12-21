unit SFXOptFm;

interface

uses
  XcdZipD3,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmConfigSFX = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    txtSFXBinaryPath: TEdit;
    txtSFXDialogTitle: TEdit;
    txtSFXExitButton: TEdit;
    cmdSFXBinary: TButton;
    cmdCancel: TButton;
    cmdOK: TButton;
    txtSFXIntroMessage: TMemo;
    dlgOpenSFXBinary: TOpenDialog;
    procedure DisplayCurrentSfxProperties;
    procedure UpdateSfxProperties;
    procedure txtSFXBinaryPathChange(Sender: TObject);
    procedure txtSFXDialogTitleChange(Sender: TObject);
    procedure txtSFXExitButtonChange(Sender: TObject);
    procedure txtSFXIntroMessageChange(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure cmdCancelClick(Sender: TObject);
    procedure cmdSFXBinaryClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    { Private declarations }
  public
    { Public declarations }
    change: bool;
  end;

var
  frmConfigSFX: TfrmConfigSFX;

implementation

uses Mainfm;

{$R *.DFM}

procedure TfrmConfigSFX.UpdateSfxProperties;
begin

  MainFormFM.MainXZ.SfxMessages[xsmIntro] := frmConfigSFX.txtSFXIntroMessage.Text;
  MainFormFM.MainXZ.SfxButtons[xsbExit] := frmConfigSFX.txtSFXExitButton.Text;
  MainFormFM.MainXZ.SfxStrings[xssTitle] := frmConfigSFX.txtSFXDialogTitle.Text;
  MainFormFM.MainXZ.SfxBinary := frmConfigSFX.txtSFXbinaryPath.Text;

  frmConfigSFX.Change := False;

end;

procedure TfrmConfigSFX.txtSFXBinaryPathChange(Sender: TObject);
begin
     change := True;
end;

procedure TfrmConfigSFX.txtSFXDialogTitleChange(Sender: TObject);
begin
     change := True;
end;

procedure TfrmConfigSFX.txtSFXExitButtonChange(Sender: TObject);
begin
     change := True;
end;

procedure TfrmConfigSFX.txtSFXIntroMessageChange(Sender: TObject);
begin
     change := True;
end;

procedure TfrmConfigSFX.cmdOKClick(Sender: TObject);
begin
     UpdateSfxProperties;
     frmConfigSfx.Close;
end;

procedure TfrmConfigSFX.cmdCancelClick(Sender: TObject);
begin
     change := False;
     frmConfigSfx.close;

end;

procedure TfrmConfigSFX.cmdSFXBinaryClick(Sender: TObject);
begin

    frmConfigSFX.dlgOpenSFXBinary.FileName := '';
    if frmConfigSFX.dlgOpenSFXBinary.Execute then
      begin
            frmConfigSFX.txtSFXBinaryPath.Text := frmConfigSFX.dlgOpenSFXBinary.FileName;
      end;
end;

procedure TfrmConfigSFX.FormActivate(Sender: TObject);
begin
       frmConfigSFX.DisplayCurrentSfxProperties;
end;

procedure TfrmConfigSFX.DisplayCurrentSfxProperties;
begin
       frmConfigSFX.txtSFXIntroMessage.Text := MainFormFM.MainXZ.SfxMessages[xsmIntro];
       frmConfigSFX.txtSFXDialogTitle.Text := MainFormFM.MainXZ.SfxStrings[xssTitle];
       frmConfigSFX.txtSFXExitButton.Text := MainFormFM.MainXZ.SfxButtons[xsbExit];
       frmConfigSFX.txtSFXbinaryPath.Text := MainFormFM.MainXZ.SfxBinary;
       change := False;
end;
procedure TfrmConfigSFX.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
   UserAnswer: Word;
begin

  if Change Then
  begin
    UserAnswer := MessageDlg('Do you want to discard the changes?', mtConfirmation,mbYesNoCancel,0);
    Case UserAnswer of
      mrNo:
        UpdateSfxProperties;
      mrCancel:
        CanClose := False;
    end;
  end;
end;

procedure TfrmConfigSFX.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
   aMessage: String;
begin

  aMessage := 'The self-extractor dialog box only lets you configure a tiny portion '+
              'of the self-extractor''s settings. Look in the SetSfxConfiguration '+
              'procedure for a complete list of settings you can configure.' + Chr(13);

  MessageDlg (aMessage, mtInformation, [mbOK],0);

end;


end.
