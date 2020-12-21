(*/////////////////////////////////////////////////////////////////////////////
//                                                                           //
//   Part of Imagelib VCL/DLL Library Corporate Suite 4.0                    //
//                                                                           //
//   All rights reserved. (c) Copyright 1995, 1996, 1997, 1998.              //
//   SkyLine Tools a division by Creative Development LTD.                   //
//                                                                           //
//   Created by: Jan Dekkers,                                                //
//               Jillian Pinsker,                                            //
//               Reginald Armond,                                            //
//               Che-Chern Lin,                                              //
//               Alex Zitser,                                                //
//               Charles Ye,                                                 //
//               Song Han,                                                   //
//               Vitaly Bondarenko,                                          //
//               Jane Scarano,                                               //
//               Misha Popov;                                                //
//                                                                           //
//   and many others who provided feedback, gave tips and comments.          //
//                                                                           //
//   Call 1-800 404-3832  or 1-818 346-4200 to order ImageLib Corp. Suite.   //
//                                                                           //
/////////////////////////////////////////////////////////////////////////////*)

unit filter;

{$X+,I-,R-,F+,T-}   {<<<<  This is a switch. Don't delete it}

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Menus,
  Buttons,
  ILDibCls,
  ExtCtrls,
  ComCtrls,
  DLLsp96,
  Inifiles,
  StdCtrls,
  FileCtrl,
  Dialogs;


{*********************************************************************

*********************************************************************}

type
  TMyShapeType = (shNone,
                  shRectangle,
                  shSquare,
                  shRoundRect,
                  shRoundSquare,
                  shEllipse,
                  shCircle,
                  shTriangleLeft,
                  shTriangleRight,
                  shTriangleUp,
                  shTriangleDown,
                  shDiamond,
                  shStar,
                  shPolyGon);
{*********************************************************************

*********************************************************************}

type
  ShapeImage = class(TImage)
  private
    FShape: TMyShapeType;
    FEdge: SmallInt;
    FVectorP:integer;
    FVectors : integer;
    FAngle : integer;
    { Private declarations }
  protected
    { Protected declarations }
    procedure SetShape(Value: TMyShapeType);
    procedure SetEdges(Value: SmallInt);
    procedure PaintTriangle;
    procedure PaintDiamond;
    procedure PaintThis;
    Procedure PaintPolyGon;
    procedure SetVectors(Value : integer);
    procedure SetVectorP(Value : integer);
    procedure SetAngle(Value : integer);
    procedure PointsArray(var VectorArray : array of TPoint;
                              Pleft,
                              Ptop,
                              Pwidth,
                              Pheight,
                              leftO,
                              TopO  : integer);

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Pu blished declarations }
    property Enabled;
    property Shape: TMyShapeType read FShape write SetShape default shNone;
    property EdgeSize : SmallInt read FEdge write SetEdges default 1;
    property VectorP : integer read FVectorP write SetVectorP;
    property Vectors : integer read FVectors write SetVectors;
    property Angle : integer read FAngle write SetAngle;
    property Visible;
  end;
{*********************************************************************

*********************************************************************}

 type
   TILPImage = class(TCustomControl)
  private
   FStretched  : Boolean;
   FOnPaint    : TNotifyEvent;
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
  public
   ILD  : ILTDib;
   PasteILD  : ILTDib;
   MainDib   : ILTDib;
   PaintPaste : Boolean;
   PaintL,
   PaintT,
   PaintW,
   PaintH : Integer;
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
   procedure Paint; override;
   procedure PaintPasteImage;
  published
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
  end;
{*********************************************************************

*********************************************************************}

type
  TFormEffect = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Apply1: TMenuItem;
    Exit1: TMenuItem;
    DistortionFilters1: TMenuItem;
    Mirror1: TMenuItem;
    Rotate1: TMenuItem;
    Borders1: TMenuItem;
    Fade1: TMenuItem;
    Deformation1: TMenuItem;
    MotionBlur1: TMenuItem;
    Blur1: TMenuItem;
    PinchHole1: TMenuItem;
    Polar1: TMenuItem;
    PageCurl1: TMenuItem;
    Mosaic1: TMenuItem;
    OilPaint1: TMenuItem;
    Extrude1: TMenuItem;
    Spray1: TMenuItem;
    WhirlPool1: TMenuItem;
    Wave1: TMenuItem;
    Jiggle1: TMenuItem;
    Bleed1: TMenuItem;
    Correction1: TMenuItem;
    AutoContrast1: TMenuItem;
    Bright1: TMenuItem;
    Color1: TMenuItem;
    EdgeDetection1: TMenuItem;
    Engrave1: TMenuItem;
    Enhance1: TMenuItem;
    GrayArea1: TMenuItem;
    Gamma1: TMenuItem;
    HalfTone1: TMenuItem;
    HueSaturation1: TMenuItem;
    Invert1: TMenuItem;
    Noisy1: TMenuItem;
    Sharp1: TMenuItem;
    Soft1: TMenuItem;
    Despeckle1: TMenuItem;
    MakeTile1: TMenuItem;
    Threshold1: TMenuItem;
    Transitions1: TMenuItem;
    ilStatus: TStatusBar;
    IlPages: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    TabSheet13: TTabSheet;
    TabSheet14: TTabSheet;
    TabSheet15: TTabSheet;
    TabSheet17: TTabSheet;
    TabSheet19: TTabSheet;
    TabSheet20: TTabSheet;
    TabSheet21: TTabSheet;
    TabSheet22: TTabSheet;
    TabSheet23: TTabSheet;
    TabSheet25: TTabSheet;
    TabSheet27: TTabSheet;
    TabSheet28: TTabSheet;
    TabSheet30: TTabSheet;
    TabSheet32: TTabSheet;
    TabSheet34: TTabSheet;
    TabSheet36: TTabSheet;
    TabSheet37: TTabSheet;
    TabSheet39: TTabSheet;
    TabSheet40: TTabSheet;
    TabSheet41: TTabSheet;
    TabSheet42: TTabSheet;
    BleedBar: TTrackBar;
    BleedEdit: TEdit;
    BlurBar: TTrackBar;
    BlurEdit: TEdit;
    BrightBar: TTrackBar;
    BrightEdit: TEdit;
    EdgeBar: TTrackBar;
    EdgeEdit: TEdit;
    EnGraveBar: TTrackBar;
    EnhanceEdit: TEdit;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    enGammaRedBar: TTrackBar;
    enGammaRedEdit: TEdit;
    enGammaGreenBar: TTrackBar;
    enGammaGreenEdit: TEdit;
    enGammaBlueBar: TTrackBar;
    enGammaBlueEdit: TEdit;
    enContrastBar: TTrackBar;
    enContrastEdit: TEdit;
    enBrightEdit: TEdit;
    enBrightBar: TTrackBar;
    GammaBar: TTrackBar;
    GammaEdit: TEdit;
    Label41: TLabel;
    Label40: TLabel;
    htAngleBar: TTrackBar;
    htCellSizeBar: TTrackBar;
    htAngleEdit: TEdit;
    htCellSizeEdit: TEdit;
    Label70: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    hsHueBar: TTrackBar;
    hsSatBar: TTrackBar;
    hsHueEdit: TEdit;
    hsSatEdit: TEdit;
    hsBrightBar: TTrackBar;
    hsBrightEdit: TEdit;
    a3col: TRadioButton;
    rRed: TRadioButton;
    rGreen: TRadioButton;
    rBlue: TRadioButton;
    rYEL: TRadioButton;
    rMag: TRadioButton;
    rCyn: TRadioButton;
    Label35: TLabel;
    Label36: TLabel;
    Label39: TLabel;
    jgPeriodBar: TTrackBar;
    jgAmpBar: TTrackBar;
    jgPeriodEdit: TEdit;
    jgAmpEdit: TEdit;
    jgSine: TRadioButton;
    jgTriangle: TRadioButton;
    VBox: TCheckBox;
    HBox: TCheckBox;
    Label31: TLabel;
    labell: TLabel;
    labels: TLabel;
    Labels45: TLabel;
    msSizeBar: TTrackBar;
    msSpaceBar: TTrackBar;
    msLightBar: TTrackBar;
    msSizeEdit: TEdit;
    msSpaceEdit: TEdit;
    msLightEdit: TEdit;
    msHeightBar: TTrackBar;
    msHeightEdit: TEdit;
    PolyBox: TGroupBox;
    btnType2: TRadioButton;
    btnType: TRadioButton;
    SmoothBox: TGroupBox;
    MosSur2: TRadioButton;
    MosSur1: TRadioButton;
    Label1: TLabel;
    msRandomBar: TTrackBar;
    msRandomEdit: TEdit;
    MosBColor: TBitBtn;
    MosFColor: TBitBtn;
    MosAntiA: TCheckBox;
    Label24: TLabel;
    Label25: TLabel;
    MotionZoom: TRadioButton;
    MotionRotate: TRadioButton;
    MotionLine: TRadioButton;
    mtAnglebar: TTrackBar;
    mtValueBar: TTrackBar;
    mtAngleEdit: TEdit;
    mtValueEdit: TEdit;
    Label2: TLabel;
    brWindowColor: TCheckBox;
    Label44: TLabel;
    Label43: TLabel;
    brShapeCombo: TComboBox;
    labAngle: TLabel;
    labVectors: TLabel;
    lavVecSize: TLabel;
    brEdgeBar: TTrackBar;
    brAngleBar: TTrackBar;
    brVectorsBar: TTrackBar;
    brVectorSizeBar: TTrackBar;
    brVectorSizeEdit: TEdit;
    brVectorsEdit: TEdit;
    brAngleEdit: TEdit;
    brEdgeEdit: TEdit;
    Label3: TLabel;
    bfEdgeBar: TTrackBar;
    bfEdgeEdit: TEdit;
    bfWindoColor: TCheckBox;
    bfEdgeWColBtn: TBitBtn;
    C_Trans: TCheckBox;
    GroupBox24: TGroupBox;
    B_CUBC: TRadioButton;
    B_CUFC: TRadioButton;
    FCC: TGroupBox;
    B_CFC: TRadioButton;
    B_CBC: TRadioButton;
    GroupBox23: TGroupBox;
    C_OH: TRadioButton;
    C_OV: TRadioButton;
    GroupBox22: TGroupBox;
    C_RT: TRadioButton;
    C_LT: TRadioButton;
    C_LB: TRadioButton;
    C_RB: TRadioButton;
    BitBtn1: TBitBtn;
    ForeColorBtn: TBitBtn;
    Label6: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label33: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    nsRedBar: TTrackBar;
    nsGreenBar: TTrackBar;
    nsBlueBar: TTrackBar;
    nsRedEdit: TEdit;
    nsGreenEdit: TEdit;
    nsBlueEdit: TEdit;
    Panel3: TPanel;
    nsGaus: TRadioButton;
    RadioButton2: TRadioButton;
    Panel4: TPanel;
    opValueBar: TTrackBar;
    opValueEdit: TEdit;
    phValueBar: TTrackBar;
    phValueEdit: TEdit;
    Extrude: TTabSheet;
    dsValueBar: TTrackBar;
    dsValueEdit: TEdit;
    Levels: TCheckBox;
    exValueBar: TTrackBar;
    exValueEdit: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    PolInv: TCheckBox;
    PolBack: TCheckBox;
    plValueBar: TTrackBar;
    plValueEdit: TEdit;
    plAngleBar: TTrackBar;
    plAngleEdit: TEdit;
    rtValueBar: TTrackBar;
    rtValueEdit: TEdit;
    BackColor: TBitBtn;
    shValueBar: TTrackBar;
    shValueEdit: TEdit;
    TabSheet16: TTabSheet;
    soValueBar: TTrackBar;
    soValueEdit: TEdit;
    Label38: TLabel;
    Label37: TLabel;
    sprValueBar: TTrackBar;
    sprValueEdit: TEdit;
    sprRandomBar: TTrackBar;
    sprRandomEdit: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    Label42: TLabel;
    ThresAnti: TCheckBox;
    Label45: TLabel;
    thValueBar: TTrackBar;
    thValueEdit: TEdit;
    FXN: TRadioButton;
    FXH: TRadioButton;
    FXV: TRadioButton;
    FXD: TRadioButton;
    FXS: TRadioButton;
    FXR: TRadioButton;
    Label46: TLabel;
    Label47: TLabel;
    trDelayBar: TTrackBar;
    trThickbar: TTrackBar;
    trDelayEdit: TEdit;
    trThickEdit: TEdit;
    Label48: TLabel;
    wpValueBar: TTrackBar;
    wpValueEdit: TEdit;
    Label111: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Refl: TCheckBox;
    Smear: TCheckBox;
    wvLengthBar: TTrackBar;
    wvLengthEdit: TEdit;
    wvPhaseEdit: TEdit;
    wvAmplBar: TTrackBar;
    wvAmplEdit: TEdit;
    ilProgress: TProgressBar;
    Preview1: TMenuItem;
    Panel5: TPanel;
    PreviewBtn: TSpeedButton;
    ApplyBtn: TSpeedButton;
    GroupBox33: TGroupBox;
    Rcircle: TRadioButton;
    Rellipse: TRadioButton;
    Rsqaure: TRadioButton;
    Rdiamond: TRadioButton;
    Rline: TRadioButton;
    Rcross: TRadioButton;
    ColorDialog: TColorDialog;
    ResetRubberbandBtn: TSpeedButton;
    HSRubberband: TSpeedButton;
    ReloadimageBtn: TSpeedButton;
    Panel6: TPanel;
    exBtn: TSpeedButton;
    StopProcessBtn: TSpeedButton;
    wvPhaseBar: TTrackBar;
    UseGrayValueofPixels: TCheckBox;
    Dark1: TMenuItem;
    TabSheet18: TTabSheet;
    Label51: TLabel;
    DarkBar: TTrackBar;
    DarkEdit: TEdit;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Label52: TLabel;
    Resetalltodefault1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    brMaskColorBtn: TBitBtn;
    Panel14: TPanel;
    Label5: TLabel;
    crColorsBar: TTrackBar;
    crColorsEdit: TEdit;
    R1: TRadioButton;
    R2: TRadioButton;
    R3: TRadioButton;
    R4: TRadioButton;
    Panel15: TPanel;
    MillionColors: TCheckBox;
    Label53: TLabel;
    Label54: TLabel;
    TabSheet24: TTabSheet;
    Warp1: TMenuItem;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    RgbToHueBox: TCheckBox;
    RGBToSaturationBox: TCheckBox;
    ConvoleTgle: TCheckBox;
    wrpScaleBar: TTrackBar;
    wrpScaleEdit: TEdit;
    wrpVecRotateBar: TTrackBar;
    wrpVecRotateEdit: TEdit;
    wrpStepsBar: TTrackBar;
    wrpStepsEdit: TEdit;
    wrpDisplacementBar: TTrackBar;
    wrpDisplacementEdit: TEdit;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    TabSheet26: TTabSheet;
    PasteImage1: TMenuItem;
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    Panel16: TPanel;
    PasteFromClipBtn: TSpeedButton;
    RLeftEdit: TEdit;
    RTopEdit: TEdit;
    RRightEdit: TEdit;
    RBottomEdit: TEdit;
    PasteTimer: TTimer;
    Label63: TLabel;
    Savesettingsonexit1: TMenuItem;
    ScanImage: TSpeedButton;
    ScanSelect: TSpeedButton;
    Label4: TLabel;
    pcShadingBar: TTrackBar;
    pcShadingEdit: TEdit;
    CShade: TCheckBox;
    CloseNadNotSaveBtn: TSpeedButton;
    TabSheet29: TTabSheet;
    GroupBox3: TGroupBox;
    lblRed: TLabel;
    lblGreen: TLabel;
    lblBlue: TLabel;
    lblPalText: TLabel;
    pnlColor: TPanel;
    trbRed: TTrackBar;
    trbGreen: TTrackBar;
    trbBlue: TTrackBar;
    Panel17: TPanel;
    ColorPalette1: TMenuItem;
    pbPalette: TPaintBox;
    Label64: TLabel;
    PalOpen: TOpenDialog;
    PalSave: TSaveDialog;
    PalCombo: TComboBox;
    PalOpt: TSpeedButton;
    TrackBar1: TTrackBar;
    Splitter1: TSplitter;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    procedure MenuItemToTab(Sender: TObject);
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure BleedEditChange(Sender: TObject);
    procedure BleedBarChange(Sender: TObject);
    procedure BlurEditChange(Sender: TObject);
    procedure BlurBarChange(Sender: TObject);
    procedure BrightEditChange(Sender: TObject);
    procedure BrightBarChange(Sender: TObject);
    procedure EdgeBarChange(Sender: TObject);
    procedure EdgeEditChange(Sender: TObject);
    procedure EnhanceEditChange(Sender: TObject);
    procedure EnGraveBarChange(Sender: TObject);
    procedure enGammaRedBarChange(Sender: TObject);
    procedure enGammaRedEditChange(Sender: TObject);
    procedure enGammaGreenBarChange(Sender: TObject);
    procedure enGammaGreenEditChange(Sender: TObject);
    procedure enGammaBlueBarChange(Sender: TObject);
    procedure enGammaBlueEditChange(Sender: TObject);
    procedure enContrastBarChange(Sender: TObject);
    procedure enContrastEditChange(Sender: TObject);
    procedure enBrightBarChange(Sender: TObject);
    procedure enBrightEditChange(Sender: TObject);
    procedure GammaEditChange(Sender: TObject);
    procedure GammaBarChange(Sender: TObject);
    procedure htAngleBarChange(Sender: TObject);
    procedure htAngleEditChange(Sender: TObject);
    procedure htCellSizeBarChange(Sender: TObject);
    procedure htCellSizeEditChange(Sender: TObject);
    procedure hsChannels(Sender: TObject);
    procedure hsHueBarChange(Sender: TObject);
    procedure hsHueEditChange(Sender: TObject);
    procedure hsSatBarChange(Sender: TObject);
    procedure hsSatEditChange(Sender: TObject);
    procedure hsBrightBarChange(Sender: TObject);
    procedure hsBrightEditChange(Sender: TObject);
    procedure jgPeriodBarChange(Sender: TObject);
    procedure jgPeriodEditChange(Sender: TObject);
    procedure jgAmpBarChange(Sender: TObject);
    procedure jgAmpEditChange(Sender: TObject);
    procedure msPolygons(Sender: TObject);
    procedure msSmooth(Sender: TObject);
    procedure msSizeBarChange(Sender: TObject);
    procedure msSizeEditChange(Sender: TObject);
    procedure msSpaceBarChange(Sender: TObject);
    procedure msSpaceEditChange(Sender: TObject);
    procedure msLightBarChange(Sender: TObject);
    procedure msLightEditChange(Sender: TObject);
    procedure msHeightBarChange(Sender: TObject);
    procedure msHeightEditChange(Sender: TObject);
    procedure msRandomBarChange(Sender: TObject);
    procedure msRandomEditChange(Sender: TObject);
    procedure mtAnglebarChange(Sender: TObject);
    procedure mtAngleEditChange(Sender: TObject);
    procedure mtValueBarChange(Sender: TObject);
    procedure mtValueEditChange(Sender: TObject);
    procedure brEdgeBarChange(Sender: TObject);
    procedure brEdgeEditChange(Sender: TObject);
    procedure brAngleBarChange(Sender: TObject);
    procedure brAngleEditChange(Sender: TObject);
    procedure brVectorsBarChange(Sender: TObject);
    procedure brVectorsEditChange(Sender: TObject);
    procedure brVectorSizeBarChange(Sender: TObject);
    procedure brVectorSizeEditChange(Sender: TObject);
    procedure brShapeComboChange(Sender: TObject);
    procedure brWindowColorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bfEdgeBarChange(Sender: TObject);
    procedure bfEdgeEditChange(Sender: TObject);
    procedure bfWindoColorClick(Sender: TObject);
    procedure crColorsBarChange(Sender: TObject);
    procedure crColorsEditChange(Sender: TObject);
    procedure pcShadingBarChange(Sender: TObject);
    procedure pcShadingEditChange(Sender: TObject);
    procedure nsRedBarChange(Sender: TObject);
    procedure nsRedEditChange(Sender: TObject);
    procedure nsGreenBarChange(Sender: TObject);
    procedure nsGreenEditChange(Sender: TObject);
    procedure nsBlueBarChange(Sender: TObject);
    procedure nsBlueEditChange(Sender: TObject);
    procedure opValueBarChange(Sender: TObject);
    procedure opValueEditChange(Sender: TObject);
    procedure phValueEditChange(Sender: TObject);
    procedure phValueBarChange(Sender: TObject);
    procedure dsValueBarChange(Sender: TObject);
    procedure dsValueEditChange(Sender: TObject);
    procedure exValueBarChange(Sender: TObject);
    procedure exValueEditChange(Sender: TObject);
    procedure plValueBarChange(Sender: TObject);
    procedure plValueEditChange(Sender: TObject);
    procedure plAngleBarChange(Sender: TObject);
    procedure plAngleEditChange(Sender: TObject);
    procedure RealEditKeyPress(Sender: TObject; var Key: Char);
    procedure rtValueBarChange(Sender: TObject);
    procedure rtValueEditChange(Sender: TObject);
    procedure shValueEditChange(Sender: TObject);
    procedure shValueBarChange(Sender: TObject);
    procedure soValueBarChange(Sender: TObject);
    procedure soValueEditChange(Sender: TObject);
    procedure sprValueBarChange(Sender: TObject);
    procedure sprValueEditChange(Sender: TObject);
    procedure sprRandomBarChange(Sender: TObject);
    procedure sprRandomEditChange(Sender: TObject);
    procedure thValueBarChange(Sender: TObject);
    procedure thValueEditChange(Sender: TObject);
    procedure trDelayBarChange(Sender: TObject);
    procedure trDelayEditChange(Sender: TObject);
    procedure trThickbarChange(Sender: TObject);
    procedure trThickEditChange(Sender: TObject);
    procedure wpValueEditChange(Sender: TObject);
    procedure wpValueBarChange(Sender: TObject);
    procedure wvLengthBarChange(Sender: TObject);
    procedure wvLengthEditChange(Sender: TObject);
    procedure wvPhaseBarChange(Sender: TObject);
    procedure wvPhaseEditChange(Sender: TObject);
    procedure wvAmplBarChange(Sender: TObject);
    procedure wvAmplEditChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure IlPagesChange(Sender: TObject);
    procedure Transitions1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DoEffect(Sender: TObject);
    procedure BackColorClick(Sender: TObject);
    procedure ForeColorBtnClick(Sender: TObject);
    procedure ResetRubberbandBtnClick(Sender: TObject);
    procedure HSRubberbandClick(Sender: TObject);
    procedure brMaskColorBtnClick(Sender: TObject);
    procedure ReloadimageBtnClick(Sender: TObject);
    procedure exBtnClick(Sender: TObject);
    procedure StopProcessBtnClick(Sender: TObject);
    procedure DarkBarChange(Sender: TObject);
    procedure DarkEditChange(Sender: TObject);
    procedure MotionBlurSet(Sender: TObject);
    procedure Resetalltodefault1Click(Sender: TObject);
    procedure MillionColorsClick(Sender: TObject);
    procedure wrpScaleBarChange(Sender: TObject);
    procedure wrpScaleEditChange(Sender: TObject);
    procedure wrpVecRotateEditChange(Sender: TObject);
    procedure wrpVecRotateBarChange(Sender: TObject);
    procedure wrpStepsBarChange(Sender: TObject);
    procedure wrpStepsEditChange(Sender: TObject);
    procedure wrpDisplacementBarChange(Sender: TObject);
    procedure wrpDisplacementEditChange(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure DriveComboBox1Change(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure PasteFromClipBtnClick(Sender: TObject);
    procedure PasteTimerTimer(Sender: TObject);
    procedure Savesettingsonexit1Click(Sender: TObject);
    procedure ScanSelectClick(Sender: TObject);
    procedure ScanImageClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CloseNadNotSaveBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pbPaletteMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pbPalettePaint(Sender: TObject);
    procedure TrackBarChange(Sender: TObject);
    procedure pnlColorClick(Sender: TObject);
    procedure Panel17MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PalOptClick(Sender: TObject);
    procedure FXMethod(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private
    { Private declarations }
    FImage       : TILPImage;
    PasteFImage  : TILPImage;
    HIPAL        : HPalette;
    BDib         : THandle;
    TempHandle   : THandle;
    PasteHDib    : THandle;
    ILR          : TILRubberBand;
    Bits         : Integer;
    IX           : Integer;
    IY           : Integer;
    IXX          : Integer;
    IYY          : Integer;
    InProc       : Boolean;
    RShape       : Integer;
    ShapeImage1  : ShapeImage;
    WantCancelNow: Boolean;
    BackGroundColor : TColor;
    ForeGroundColor : TColor;
    MaskColor       : TColor;
    FilterIni       : TInifile;
    FIniFileName    : String;
    WhatMotion      : Smallint;
    OldHint         : TNotifyEvent;
    PasteImage      : Boolean;
    Closing         : Boolean;
    InRubberband    : Boolean;
    BoxDim          : TPoint;
    SelColor        : Byte;
    Applied         : Boolean;
    Selecting       : Boolean;
    ExitBTNDwn,
    IsInPalette     : Boolean;
    Procedure MakeBDib;
    function DisplayDC: hDC;
    procedure iKeyPress(var Key: Char);
    function IsValidChar(Key: Char): Boolean;
    function EditInt(Sender: TObject) : Integer;
    procedure ResetEdit(Sender: TObject; iMin, iMax : Integer);
    Procedure RdWrSetttings(Rd : Byte);
    procedure riKeyPress(var Key: Char);
    function rIsValidChar(Key: Char): Boolean;
    function rEditInt(Sender: TObject) : Double;
    procedure rResetEdit(Sender: TObject; iMin, iMax : Integer);
    Function ProgressStatus(Progress : SmallInt) : SmallInt;
    function DibUpdate(upDib : THandle): SmallInt;
    Function BoolToShort(Bl : Boolean) : SmallInt;
    Function LongToBool(Bl : Integer) : Boolean;
    Procedure RestoreImage(W : Byte);
    procedure EnableRubberBand;
    procedure DisableRubberBand;
    procedure Image1Rubberband(Sender: TObject;
                               Button: TMouseButton;
                               Shift: TShiftState;
                               X,
                               Y,
                               XX,
                               YY: Integer);
    procedure Image1MouseDown(Sender: TObject;
                              Button: TMouseButton;
                              Shift: TShiftState;
                              X,
                              Y: Integer);
    procedure Image1MouseMove(Sender: TObject;
                              Shift: TShiftState;
                              X,
                              Y: Integer);
    procedure Image1MouseUp(Sender: TObject;
                            Button: TMouseButton;
                            Shift: TShiftState;
                            X,
                            Y: Integer);
    procedure Image1Paint(Sender: TObject);
    function CanRubberBand(Pge : String) : Boolean;
    Procedure EnableControls;
    Procedure DisableControls;
    procedure DisplayHint(Sender: TObject);
    procedure ImageInfo;
  public
    bFXN,
    bFXH,
    bFXV,
    bFXD,
    bFXS,
    bFXR      : Boolean;
    FFXDelay       : Integer;
    FFXColRowThick : Integer;
    PyDib     : Pointer;
    MainDib   : THandle; 
    Cursor    : HCursor;
    MIW       : Integer;
    MIH       : Integer;
    Function GetTabNumber (TName : String) : TTabSheet;
  end;
{*********************************************************************

*********************************************************************}

type
   TMyCanvas = class(TCanvas)
  end;

{*********************************************************************

*********************************************************************}

var
  FormEffect: TFormEffect;
  RedPrevious,GreenPrevious,BluePrevious : integer;

implementation

  uses Consts,
       Clipbrd,
       DLL96v1;

{$R *.DFM}


{*********************************************************************
This is a dib update callback routine.  It will return an intermediate handle.
Do not free or destroy dis handle. Just make a copy of it. To cancel loading
return 0 else return a 1;
*********************************************************************}

function DibUpdateCall(upDib : THandle; VObject : Longint): SmallInt; CDECL; export;
begin
     if VObject <> 0 then result:=TFormEffect(VObject).DibUpdate(upDib)
      else
     result:=1;
end;

{*********************************************************************
This is an update callback routine.  To cancel loading return 0 else
return a 1;
*********************************************************************}

function ProgressCall(Progress : SmallInt; VObject : Longint): SmallInt; CDECL; export;
begin
     if VObject <> 0 then result:=TFormEffect(VObject).ProgressStatus(Progress)
      else
     result:=1;
end;

{*********************************************************************

*********************************************************************}

constructor ShapeImage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FShape:=  shNone;
  FVectors := 10;
  FVectorP := 50;
  FAngle   := 90;
  PaintThis;
end;

{*********************************************************************

*********************************************************************}

destructor ShapeImage.Destroy;
begin
  inherited Destroy;
end;

{*********************************************************************

*********************************************************************}

procedure ShapeImage.SetShape(Value: TMyShapeType);
begin
//  if FShape <> Value then
  begin
    FShape := Value;
    PaintThis;
  end;
end;

{*********************************************************************

*********************************************************************}

procedure ShapeImage.SetEdges(Value: SmallInt);
begin
  if FEdge <> Value then
  begin
    FEdge := Value;
    PaintThis;
  end;
end;

{*********************************************************************

*********************************************************************}

procedure ShapeImage.PaintThis;
var
  X, Y, W, H, S: Integer;
begin
  Picture.Bitmap:=TBitmap.Create;
  Picture.Bitmap.Width:=Width;
  Picture.Bitmap.Height:=Height;
  with inherited Canvas do
  begin
    Brush.Color:=clBlack;
    FloodFill(ClientWidth div 2, ClientHeight div 2, clBlack, fsBorder);
    Brush.Color:=clWhite;
    X := Pen.Width div 2;
    Y := X;
    W := Width - Pen.Width + 1;
    H := Height - Pen.Width + 1;
    if Pen.Width = 0 then
    begin
      Dec(W);
      Dec(H);
    end;
    if W < H then S := W else S := H;
    if FShape in [shSquare, shRoundSquare, shCircle] then
    begin
      Inc(X, (W - S) div 2);
      Inc(Y, (H - S) div 2);
      W := S;
      H := S;
    end;
    case FShape of
       shRectangle, shSquare      : begin
                                      Rectangle(X+FEdge,
                                                Y+FEdge,
                                                X + W-FEdge,
                                                Y + H-FEdge);
                                    end;

       shRoundRect, shRoundSquare : begin
                                      RoundRect(X+FEdge,
                                                Y+FEdge,
                                                X + W -FEdge,
                                                Y + H -FEdge,
                                                S div 4,
                                                S div 4);
                                    end;

       shCircle, shEllipse        : begin
                                      Ellipse(X+FEdge,
                                              Y+FEdge,
                                              X + W-FEdge,
                                              Y + H-FEdge);
                                    end;
       shTriangleLeft,
       shTriangleRight,
       shTriangleUp,
       shTriangleDown             : PaintTriangle;

       shDiamond                  : PaintDiamond;

       shPolyGon                  : PaintPolyGon;

       shStar                     : begin
                                      if VectorP=0 then
                                        VectorP := 50;
                                      if Vectors < 10 then
                                        vectors := 10;
                                      if Angle <> 90 then
                                        Angle := 90;
                                      PaintPolyGon;
                                    end;

    end;
  end;
end;

{*********************************************************************

*********************************************************************}

procedure ShapeImage.PaintTriangle;
var
    Triangle_Rect : TRect;
    TrianglePoint : array[0..2] of TPoint;
    lwidth, lheight : integer;
begin

    Triangle_Rect:=Rect(0+FEdge,0+FEdge,width-FEdge,height-FEdge);

    lwidth := Triangle_Rect.right-Triangle_Rect.left;
    lheight := Triangle_Rect.bottom-Triangle_Rect.top;

    case fShape of
    shTriangleLeft:
     begin
       TrianglePoint[0].x := Triangle_Rect.left+lwidth;
       TrianglePoint[0].y := Triangle_Rect.top;
       TrianglePoint[1].x := Triangle_Rect.left+lwidth;
       TrianglePoint[1].y := Triangle_Rect.top+lheight;
       TrianglePoint[2].x := Triangle_Rect.left;
       TrianglePoint[2].y := Triangle_Rect.top+(lheight div 2);
     end;
    shTriangleRight:
     begin
       TrianglePoint[0].x := Triangle_Rect.left;
       TrianglePoint[0].y := Triangle_Rect.top;
       TrianglePoint[1].x := Triangle_Rect.left+lwidth;
       TrianglePoint[1].y := Triangle_Rect.top+(lheight div 2);
       TrianglePoint[2].x := Triangle_Rect.left;
       TrianglePoint[2].y := Triangle_Rect.top+lheight;
     end;
    shTriangleUp:
     begin
       TrianglePoint[0].x := Triangle_Rect.left+(lwidth div 2);
       TrianglePoint[0].y := Triangle_Rect.top;
       TrianglePoint[1].x := Triangle_Rect.left;
       TrianglePoint[1].y := Triangle_Rect.top+lheight;
       TrianglePoint[2].x := Triangle_Rect.left+lwidth;
       TrianglePoint[2].y := Triangle_Rect.top+lheight;
     end;
    shTriangleDown:
     begin
       TrianglePoint[0].x := Triangle_Rect.left;
       TrianglePoint[0].y := Triangle_Rect.top;
       TrianglePoint[1].x := Triangle_Rect.left+(lwidth div 2);
       TrianglePoint[1].y := Triangle_Rect.top+lheight;
       TrianglePoint[2].x := Triangle_Rect.left+lwidth;
       TrianglePoint[2].y := Triangle_Rect.top;
     end;
   end;
   inherited canvas.polygon(TrianglePoint);
end;

{*********************************************************************

*********************************************************************}

procedure ShapeImage.PaintDiamond;
var
    Diamond_Rect : TRect;
    DiamondPoint : array[0..3] of TPoint;
    lwidth, lheight : integer;
begin
    Diamond_Rect:=Rect(0+FEdge,0+FEdge,width-FEdge,height-FEdge);
    lwidth := Diamond_Rect.right - Diamond_Rect.left;
    lheight := Diamond_Rect.bottom - Diamond_Rect.top;
    DiamondPoint[0].x := Diamond_Rect.left+(lwidth div 2);
    DiamondPoint[0].y := Diamond_Rect.top;
    DiamondPoint[1].x := Diamond_Rect.left+lwidth;
    DiamondPoint[1].y := Diamond_Rect.top+(lheight div 2);
    DiamondPoint[2].x := Diamond_Rect.left+(lwidth div 2);
    DiamondPoint[2].y := Diamond_Rect.top+lheight;
    DiamondPoint[3].x := Diamond_Rect.left;
    DiamondPoint[3].y := Diamond_Rect.top+(lheight div 2);
    inherited canvas.polygon(DiamondPoint);
end;

{*********************************************************************

*********************************************************************}

procedure ShapeImage.SetAngle(Value : integer);
begin
  if (Value < 0) or (value > 359) then exit;
  if FAngle <> Value then
  begin
    FAngle := Value;
    PaintThis;
  end;
end;

{*********************************************************************

*********************************************************************}

procedure ShapeImage.SetVectorP(Value : integer);
begin
  if (Value < 0) or (value > 100) then exit;
  if FVectorP <> Value then
  begin
    FVectorP := Value;
    PaintThis;
  end;
end;

{*********************************************************************

*********************************************************************}

procedure ShapeImage.SetVectors(Value : integer);
begin
  if (Value < 3) or (value > 100) then exit;
  if FVectors <> Value then
  begin
    FVectors := Value;
    PaintThis;
  end;
end;

{*********************************************************************

*********************************************************************}

procedure ShapeImage.PointsArray(var VectorArray : array of TPoint;
                                     Pleft,
                                     Ptop,
                                     Pwidth,
                                     Pheight,
                                     leftO,
                                     TopO  : integer);
var
  NumberOfvector,
  iVectors,
  XControl,
  YControl,
  RoudRad  : integer;
  StepRadius,
  PercentRadius : double;
  Switch : boolean;
begin
 iVectors := Vectors;
 PercentRadius := (100-VectorP)/100;
 XControl := Pwidth div 2;
 YControl := Pheight div 2;

 if XControl < YControl then
   RoudRad := XControl
 else
   RoudRad := YControl;

 Switch := false;
 for NumberOfvector := 0 to iVectors do begin
   StepRadius := ((NumberOfvector* (360 /iVectors))-Angle) * pi /180;
   if Switch then begin
     VectorArray[NumberOfvector].x := Pleft + XControl + Round(cos(StepRadius) *
                                      (RoudRad * PercentRadius)) + LeftO;
     VectorArray[NumberOfvector].y := Ptop + YControl + round(sin(StepRadius) *
                                      (RoudRad * PercentRadius)) + TopO;
   end else begin
     VectorArray[NumberOfvector].x := Pleft + XControl +
                                      Round(cos(StepRadius) * RoudRad) + LeftO;
     VectorArray[NumberOfvector].y := Ptop + YControl + Round(sin(StepRadius) *
                                      RoudRad) + TopO;
   end;
   Switch := not Switch;
 end;
end;


{*********************************************************************

*********************************************************************}

Procedure ShapeImage.PaintPolyGon;
var
 VectorArray : array [0..100] of TPoint;
 Poly_Rect : TRect;

begin
    Poly_Rect:=Rect(0+FEdge,0+FEdge,width-FEdge,height-FEdge);
    PointsArray(VectorArray,
                Poly_Rect.left,
                Poly_Rect.top,
                Poly_Rect.right - Poly_Rect.left,
                Poly_Rect.bottom - Poly_Rect.top,
                0,
                0);

   TMyCanvas(inherited canvas).changing;
  {$IFDEF WIN32}
   Windows.polygon(inherited canvas.handle, VectorArray , Vectors);
  {$ELSE}
   WinProcs.polygon(inherited canvas.handle, VectorArray , Vectors);
  {$ENDIF}
  TMyCanvas(inherited canvas).Changed;
end;

{*********************************************************************

*********************************************************************}

constructor TILPImage.Create(AOwner: TComponent);
begin
  Inherited Create(AOwner);
  ILD := ILTDib.Create;
  MainDib := ILTDib.Create;
  FStretched :=False;
  Width:=20;
  Height:=20;
  PasteILD:=Nil;
  PaintPaste :=False;
end;

{*********************************************************************

*********************************************************************}

destructor TILPImage.Destroy;
begin
  ILD.Free;
  MainDib.Free;
  Inherited Destroy;
end;

{*********************************************************************

*********************************************************************}
procedure TILPImage.PaintPasteImage;
var
  hOldPal   : HPalette;
begin
  if (PaintPaste) and (PasteILD <> nil) and (PasteILD.DibBitmap <> nil) then begin

 if ILD.Palette >0 then begin
  hOldPal := SelectPalette(Canvas.handle, PasteILD.Palette, False);
  RealizePalette(Canvas.handle);
 end else
  hOldPal := 0;

  if ILD.Bits > 2 then
    SetStretchBltMode(Canvas.handle,STRETCH_DELETESCANS);

     StretchDIBits(Canvas.Handle,
                   PaintL,
                   PaintT,
                   PaintW,
                   PaintH,
                   0,
                   0,
                   PasteILD.Width,
                   PasteILD.Height,
                   PasteILD.ptrBits,
                   PasteILD.DibBitmap^,
                   DIB_RGB_COLORS,
                   SRCCOPY);

  if hOldPal >0 then
   SelectPalette(Canvas.handle, hOldPal, False);

 end;
end;

{*********************************************************************

*********************************************************************}

procedure TILPImage.Paint;
var
  hOldPal   : HPalette;
begin
 if ILD.DibBitmap <> nil then begin

 if ILD.Palette >0 then begin
  hOldPal := SelectPalette(Canvas.handle, ILD.Palette, False);
  RealizePalette(Canvas.handle);
 end else
  hOldPal := 0;

  if ILD.Bits > 2 then
    SetStretchBltMode(Canvas.handle,STRETCH_DELETESCANS);

  if FStretched then begin
    StretchDIBits(Canvas.Handle,
                  0,
                  0,
                  Width,
                  Height,
                  0,
                  0,
                  ILD.Width,
                  ILD.Height,
                  ILD.ptrBits,
                  ILD.DibBitmap^,
                  DIB_RGB_COLORS,
                  SRCCOPY);
  end else begin
    StretchDIBits(Canvas.Handle,
                  0,
                  0,
                  ILD.Width,
                  ILD.Height,
                  0,
                  0,
                  ILD.Width,
                  ILD.Height,
                  ILD.ptrBits,
                  ILD.DibBitmap^,
                  DIB_RGB_COLORS,
                  SRCCOPY);
  end;
  if hOldPal >0 then 
   SelectPalette(Canvas.handle, hOldPal, False);
 end;

 if Assigned(FOnPaint) then FOnPaint(Self);

 PaintPasteImage;
end;

{*********************************************************************

*********************************************************************}
procedure TILPImage.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);

end;

{*********************************************************************

*********************************************************************}
procedure TILPImage.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);

end;

{*********************************************************************

*********************************************************************}
procedure TILPImage.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift,X,Y);

end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.FormCreate(Sender: TObject);
begin
     Applied:=True;
     bDib:=0;
     IsInPalette:=False;
     PalCombo.ItemIndex:=0;
     Closing:=False;
     Ilr:=TILRubberBand.Create(Self);
     InProc:=False;
     WhatMotion:=1;
     brShapeCombo.itemindex:=0;
     RShape:=3;
     FImage :=TILPImage.Create(Self);
     with FImage do begin
        Parent:=Panel5;
        Align:=alClient;
        ILD.DibBitmap:=nil;
        OnMouseDown:=Image1MouseDown;
        OnMouseMove:=Image1MouseMove;
        OnMouseUp:=Image1MouseUp;
        OnPaint:=Image1Paint;
     end;
     PasteFImage :=TILPImage.Create(Self);
     with PasteFImage do begin
        Parent:=Panel16;
        Align:=alClient;
        ILD.DibBitmap:=nil;
        Visible:=True;
        Enabled:=True;
     end;
     ShapeImage1:=ShapeImage.Create(self);
     with ShapeImage1 do begin
       Parent:=Panel5;
       Left := 0;
       Top := 0;
       Width := FImage.Width;
       Height := FImage.Height;
       Color := clBtnFace;
       Visible:=False;
     end;
     bDib:=0;
     MaskColor:=clBtnface;
     BackGroundColor:=clBtnface;
     ForeGroundColor:=clBtnface;
     iX:=0;
     iY:=0;
     iXX:=FImage.Width;
     iYY:=FImage.Height;
     InProc:=False;
     OldHint:=Application.OnHint;
     Application.OnHint := DisplayHint;
     IlPagesChange(nil);
     FIniFileName :='IFiltSet.Ini';
     bFXN:=True;
end;

{*********************************************************************

*********************************************************************}
Procedure TFormEffect.MakeBDib;
var
  BPH       : PBitmapInfoHeader;
begin
     if MainDib <1 then Exit;
     if bDib <> 0 then begin
        while GMEM_LOCKCOUNT AND GlobalFlags(bDib) > 0 do GlobalUnlock(bDib);
        Globalfree(bDib);
      end;

     try
      PyDib:=GlobalLock(MainDib);
      BPH:=PBitmapInfoHeader(PyDib);
      Bits:=BPH^.biBitCount;
      GlobalUnlock(MainDib);
      FImage.ILD.DibBitmap:=PBitmapInfo(GlobalLock(ScaleDibImage(MainDib,
                                                                 FImage.Width,
                                                                 FImage.Height,
                                                                 Bits)));
     except
       close;
     end;
     bDib:=FImage.ILD.CopyDib;
end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.FormShow(Sender: TObject);
var
 BPH        : PBitmapInfoHeader;
begin
  HIPAL:=0;
  ExitBTNDwn:=False;
  FImage.ILD.DibBitmap:=nil;
  if MainDib <> 0 then begin
     PyDib:=GlobalLock(MainDib);
     if PyDib <> nil then begin
        BPH:=PBitmapInfoHeader(PyDib);
        MIW:=BPH^.biWidth;
        MIH:=BPH^.biHeight;
        GlobalUnlock(MainDib);
     end else begin
        MIW:=1;
        MIH:=1;
     end;

     MakeBDib;

     if FImage.ILD.Width > 0 then begin
      IX := Round((FImage.Width / MIW) * IX);
      IXX := Round((FImage.Width / MIW) * IXX-IX);
     end;
     if FImage.ILD.Height >0 then begin
      IY := Round((FImage.Height / MIH) * IY);
      IYY := Round((FImage.Height / MIH) * IYY-IY);
     end;

     Ilr.DropRect(IX, IY, IXX, IYY);

     FImage.Refresh;

     RdWrSetttings(1);

     BoxDim.x := pbPalette.Width div 16;
     BoxDim.y := pbPalette.Height div 16;
     SelColor := 0;


     TRadioButton(FXH).Checked:=bFXH;

     TRadioButton(FXV).Checked:=bFXV;

     TRadioButton(FXD).Checked:=bFXD;

     TRadioButton(FXS).Checked:=bFXS;

     TRadioButton(FXR).Checked:=bFXR;

     TRadioButton(FXN).Checked:=bFXN;
          
  end;
  SetCursor(Cursor);
end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.FormDestroy(Sender: TObject);
var
 WD   : Array[0..255] of Char;
 R    : String;

begin
     Application.OnHint:=OldHint;
     if Savesettingsonexit1.Checked then
       RdWrSetttings(0)
     else begin
       GetWindowsDirectory(WD, 255);
       R:= FileSearch(FIniFileName, StrPas(WD));
       if R <> '' then begin
          DeleteFile(R);
       end;
     end;
     FImage.Free;
     PasteFImage.Free;
     ShapeImage1.Free;
     ILR.Free;

     if MainDib <> 0 then begin
        while GMEM_LOCKCOUNT AND GlobalFlags(MainDib) > 0 do GlobalUnlock(MainDib);
        GlobalFree(MainDib);
        MainDib := 0;
     end;
   
 end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.exBtnClick(Sender: TObject);
begin
  if not Applied then begin
   if MessageDlg(NotAppliedYet, mtInformation, [mbYes, mbNo], 0) = mrYes then begin
      ExitBTNDwn:=True;
      Close;
   end;
  end else begin
   Close;
   ExitBTNDwn:=True;
  end;
end;

{*********************************************************************

*********************************************************************}


procedure TFormEffect.CloseNadNotSaveBtnClick(Sender: TObject);
begin
  Close;
end;

{*********************************************************************
Reset to default;
*********************************************************************}

procedure TFormEffect.Resetalltodefault1Click(Sender: TObject);
begin
   RdWrSetttings(2);
end;

{*********************************************************************
 When checked all settings are saved to an inifile. When not checked
 ini file is deleted
*********************************************************************}

procedure TFormEffect.Savesettingsonexit1Click(Sender: TObject);
begin
     Savesettingsonexit1.Checked := not Savesettingsonexit1.Checked;
end;

{*********************************************************************
Read write settings. RD 0 is read 1 is write 2 is restore.
*********************************************************************}
Procedure TFormEffect.RdWrSetttings(Rd : Byte);
Var
 A,
 I    : Integer;
 SVal : String;
 IVal : Integer;
 WD   : Array[0..255] of Char;
const
 FaultyInt = -99999;
begin

 GetWindowsDirectory(WD, 255);

 {Incase the ini file doesn't exist yet we write the default to the ini}
 if FileSearch(FIniFileName, StrPas(WD)) = '' then begin
  FilterIni:=TInifile.Create(FIniFileName);
  with FilterIni do begin
       for I := 0 to ComponentCount -1 do begin

           {Write all tedit values to the ini file}
           if Components[I] is TEdit then begin
              WriteString('DEF_FL_EDIT', TEdit(Components[I]).Name, TEdit(Components[I]).Text);
           end;

           {Write all TCheckBox values to the ini file}
           if Components[I] is TCheckBox then begin
              WriteBool('DEF_FL_CHECK', TCheckBox(Components[I]).Name, TCheckBox(Components[I]).Checked);
           end;

           {Write all TRadioButton values to the ini file}
           if Components[I] is TRadioButton then begin
              WriteBool('DEF_FL_RADIO', TRadioButton(Components[I]).Name, TRadioButton(Components[I]).Checked);
           end;
       end;
       {Write colors used to the ini file}
       WriteInteger('DEF_FL_COLOR', 'BackGroundColor', ColorToRGB(BackGroundColor));
       WriteInteger('DEF_FL_COLOR', 'ForeGroundColor', ColorToRGB(ForeGroundColor));
       WriteInteger('DEF_FL_COLOR', 'MaskColor', ColorToRGB(MaskColor));
    end;
    FilterIni.Free;
 end;

 {Read in the defaults}
 if RD = 2 then begin
    FilterIni:=TInifile.Create(FIniFileName);
    with FilterIni do begin
       for I := 0 to ComponentCount -1 do begin

           {Read all tedit values from the ini file into the control}
           if Components[I] is TEdit then begin
              SVal:=ReadString('DEF_FL_EDIT', TEdit(Components[I]).Name,'x');
              if SVal <> 'x' then TEdit(Components[I]).Text:=SVal;
           end;

           {Read all TCheckBox values from the ini file into the control}
           if Components[I] is TCheckBox then begin
              IVal:=ReadInteger('DEF_FL_CHECK', TCheckBox(Components[I]).Name, FaultyInt);
              if IVal <> FaultyInt then TCheckBox(Components[I]).Checked:=LongToBool(IVal);
           end;

           {Read all TRadioButton values from the ini file into the control}
           if Components[I] is TRadioButton then begin
              IVal:=ReadInteger('DEF_FL_RADIO', TRadioButton(Components[I]).Name, FaultyInt);
              if IVal <> FaultyInt then TRadioButton(Components[I]).Checked:=LongToBool(IVal);
           end;
       end;
       {Read colors used from the ini file}
       IVal:=ReadInteger('DEF_FL_COLOR', 'BackGroundColor', FaultyInt);
       if IVal <> FaultyInt then BackGroundColor:=IVal;
       IVal:=ReadInteger('DEF_FL_COLOR', 'BackGroundColor', FaultyInt);
       if IVal <> FaultyInt then BackGroundColor:=IVal;
       IVal:=ReadInteger('DEF_FL_COLOR', 'ForeGroundColor', FaultyInt);
       if IVal <> FaultyInt then ForeGroundColor:=IVal;
       IVal:=ReadInteger('DEF_FL_COLOR', 'MaskColor', FaultyInt);
       if IVal <> FaultyInt then MaskColor:=IVal;
       {Set panel colors}
       Panel10.Color:=MaskColor;
       Panel7.Color:=BackGroundColor;
       Panel9.Color:=BackGroundColor;
       Panel11.Color:=BackGroundColor;
       Panel13.Color:=BackGroundColor;
       Panel8.Color:=ForeGroundColor;
       Panel12.Color:=ForeGroundColor;
    end;
  FilterIni.Free;
  exit;
 end;


  FilterIni:=TInifile.Create(FIniFileName);
  with FilterIni do begin
    if RD = 0 then begin
       for I := 0 to ComponentCount -1 do begin

           {Write all tedit values to the ini file}
           if Components[I] is TEdit then begin
              WriteString('FL_EDIT', TEdit(Components[I]).Name, TEdit(Components[I]).Text);
           end;

           {Write all TCheckBox values to the ini file}
           if Components[I] is TCheckBox then begin
              WriteBool('FL_CHECK', TCheckBox(Components[I]).Name, TCheckBox(Components[I]).Checked);
           end;

           {Write all TRadioButton values to the ini file}
           if Components[I] is TRadioButton then begin
              WriteBool('FL_RADIO', TRadioButton(Components[I]).Name, TRadioButton(Components[I]).Checked);
           end;
       end;

       {Write current window positions and sizes to the ini file}
       WriteInteger('FL_POS', 'LEFT', left);
       WriteInteger('FL_POS', 'TOP', top);
       WriteInteger('FL_POS', 'WIDTH', width);
       WriteInteger('FL_POS', 'HEIGHT', height);
       {Write colors used to the ini file}
       WriteInteger('FL_COLOR', 'BackGroundColor', ColorToRGB(BackGroundColor));
       WriteInteger('FL_COLOR', 'ForeGroundColor', ColorToRGB(ForeGroundColor));
       WriteInteger('FL_COLOR', 'MaskColor', ColorToRGB(MaskColor));

       {Write ColorDialog.CustomColors used to the ini file}
       With ColorDialog do
        for A:=0 to CustomColors.Count-1 do
          WriteString('CustomColors', IntToStr(A), CustomColors[A]);

      {Write the active page name to the ini file}
       WriteString('ActivePage', 'Page', IlPages.ActivePage.Caption);

      {Write the rubberband positions to the ini file}
       WriteInteger('FL_RUBBERBAND', 'CropX', IX);
       WriteInteger('FL_RUBBERBAND', 'CropY', IY);
       WriteInteger('FL_RUBBERBAND', 'CropWidth', IXX);
       WriteInteger('FL_RUBBERBAND', 'CropHeight', IYY);

    end else begin
       for I := 0 to ComponentCount -1 do begin

           {Read all tedit values from the ini file into the control}
           if Components[I] is TEdit then begin
              SVal:=ReadString('FL_EDIT', TEdit(Components[I]).Name,'x');
              if SVal <> 'x' then TEdit(Components[I]).Text:=SVal;
           end;

           {Read all TCheckBox values from the ini file into the control}
           if Components[I] is TCheckBox then begin
              IVal:=ReadInteger('FL_CHECK', TCheckBox(Components[I]).Name, FaultyInt);
              if IVal <> FaultyInt then TCheckBox(Components[I]).Checked:=LongToBool(IVal);
           end;

           {Read all TRadioButton values from the ini file into the control}
           if Components[I] is TRadioButton then begin
              IVal:=ReadInteger('FL_RADIO', TRadioButton(Components[I]).Name, FaultyInt);
              if IVal <> FaultyInt then TRadioButton(Components[I]).Checked:=LongToBool(IVal);
           end;
       end;
       {read current window positions and sizes from the ini file}
       IVal:=ReadInteger('FL_POS', 'LEFT',FaultyInt);
       if IVal <> FaultyInt then left:=IVal;
       IVal:=ReadInteger('FL_POS', 'TOP',FaultyInt);
       if IVal <> FaultyInt then top:=IVal;
       IVal:=ReadInteger('FL_POS', 'WIDTH',FaultyInt);
       if IVal <> FaultyInt then width:=IVal;
       IVal:=ReadInteger('FL_POS', 'HEIGHT', FaultyInt);
       if IVal <> FaultyInt then height:=IVal;
       {Read colors used from the ini file}
       IVal:=ReadInteger('FL_COLOR', 'BackGroundColor', FaultyInt);
       if IVal <> FaultyInt then BackGroundColor:=IVal;
       IVal:=ReadInteger('FL_COLOR', 'BackGroundColor', FaultyInt);
       if IVal <> FaultyInt then BackGroundColor:=IVal;
       IVal:=ReadInteger('FL_COLOR', 'ForeGroundColor', FaultyInt);
       if IVal <> FaultyInt then ForeGroundColor:=IVal;
       IVal:=ReadInteger('FL_COLOR', 'MaskColor', FaultyInt);
       if IVal <> FaultyInt then MaskColor:=IVal;
       {Set panel colors}
       Panel10.Color:=MaskColor;
       Panel7.Color:=BackGroundColor;
       Panel9.Color:=BackGroundColor;
       Panel11.Color:=BackGroundColor;
       Panel13.Color:=BackGroundColor;
       Panel8.Color:=ForeGroundColor;
       Panel12.Color:=ForeGroundColor;

       {Read ColorDialog.CustomColors used from the ini file}
       With ColorDialog do
        for A:=0 to CustomColors.Count-1 do begin
          SVal:=ReadString('CustomColors', IntToStr(A),'x');
          if SVal <> 'x' then CustomColors[A]:=SVal;
        end;

       IVal:=ReadInteger('FL_RUBBERBAND', 'CropX', FaultyInt);
       if IVal <> FaultyInt then IX:=IVal;
       IVal:=ReadInteger('FL_RUBBERBAND', 'CropY', FaultyInt);
       if IVal <> FaultyInt then IY:=IVal;
       IVal:=ReadInteger('FL_RUBBERBAND', 'CropWidth', FaultyInt);
       if IVal <> FaultyInt then IXX:=IVal;
       IVal:=ReadInteger('FL_RUBBERBAND', 'CropHeight', FaultyInt);
       if IVal <> FaultyInt then IYY:=IVal;

      {read the active page name from the ini file}
       SVal:=ReadString('ActivePage', 'Page', 'x');

       if SVal <> 'x' then
          IlPages.ActivePage:=GetTabNumber(SVal)
       else
          IlPages.ActivePage:= TabSheet1;

       IlPagesChange(nil);
    end;
  end;
  FilterIni.Free;
end;

{*********************************************************************
Enable Menu Items and speed buttons except the ones previously diabled
*********************************************************************}

Procedure TFormEffect.EnableControls;
Var
 I : Integer;
begin
  for I := 0 to ComponentCount -1 do begin

    if Components[I] is TMenuItem then begin
        if TMenuItem(Components[I]).Tag = 0 then
          TMenuItem(Components[I]).Enabled:=True;
     end;


    if Components[I] is TSpeedButton then begin
        if TSpeedButton(Components[I]).Tag = 0 then
          TSpeedButton(Components[I]).Enabled:=True;
     end;

  end;
end;

{*********************************************************************
Disable Menu Items and speed buttons and write in the TAG if it is
all ready diabled
*********************************************************************}
Procedure TFormEffect.DisableControls;
Var
 I : Integer;
begin
  for I := 0 to ComponentCount -1 do begin

    if Components[I] is TMenuItem then begin
        if TMenuItem(Components[I]).Enabled then
           TMenuItem(Components[I]).Tag:=0
        else
           TMenuItem(Components[I]).Tag:=5;
        TMenuItem(Components[I]).Enabled:=False;
     end;


    if Components[I] is TSpeedButton then begin
        if TSpeedButton(Components[I]).Enabled then
           TSpeedButton(Components[I]).Tag:=0
        else
           TSpeedButton(Components[I]).Tag:=5;
        TSpeedButton(Components[I]).Enabled:=False;
     end;

  end;
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.StopProcessBtnClick(Sender: TObject);
begin
    WantCancelNow:=True;
end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.ReloadimageBtnClick(Sender: TObject);
begin
    RestoreImage(1);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.DisplayHint(Sender: TObject);
begin
     ilStatus.Panels.Items[1].Text:=Application.Hint;
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.EnableRubberBand;
begin
 if not HSRubberband.Down then begin
  ILR.iParent:=FImage;
  ILR.OnRubberBand:=Image1Rubberband;
  FImage.OnMouseDown:=Image1MouseDown;
  FImage.OnMouseMove:=Image1MouseMove;
  FImage.OnMouseUp:=Image1MouseUp;
  FImage.OnPaint:=Image1Paint;
  ResetRubberbandBtn.Enabled:=True;
  Label59.Visible:=True;
  Label60.Visible:=True;
  Label61.Visible:=True;
  Label62.Visible:=True;
  RLeftEdit.Visible:=True;
  RTopEdit.Visible:=True;
  RRightEdit.Visible:=True;
  RBottomEdit.Visible:=True;
 end;
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.DisableRubberBand;
begin
  FImage.OnMouseMove:=nil;
  FImage.OnMouseUp:=nil;
  FImage.OnPaint:=nil;
  Label59.Visible:=False;
  Label60.Visible:=False;
  Label61.Visible:=False;
  Label62.Visible:=False;
  RLeftEdit.Visible:=False;
  RTopEdit.Visible:=False;
  RRightEdit.Visible:=False;
  RBottomEdit.Visible:=False;
  ResetRubberbandBtn.Enabled:=False;
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.HSRubberbandClick(Sender: TObject);
begin
   if HSRubberband.Down then begin
       HSRubberband.Caption:='Показати';
       DisableRubberBand
   end else begin
       HSRubberband.Caption:='Сховати';
       EnableRubberBand;
   end;
   FImage.Refresh;
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.Image1MouseDown(Sender: TObject;
                                      Button: TMouseButton;
                                      Shift: TShiftState;
                                      X,
                                      Y: Integer);
var
  clr   : TColor;
  hpal  : HPALETTE;
begin
  //Only do this when we have adib
  if (Assigned(FImage.ILD.DibBitmap)) and (ColorPalette1.Checked) and (FImage.Ild.Bits <16) then begin
     //Get the color
     clr:=FImage.Canvas.Pixels[x,y];
     //Set the track bars
     trbRed.Position := GetRValue(ColorToRGB(clr));
     trbGreen.Position := GetGValue(ColorToRGB(clr));
     trbBlue.Position := GetBValue(ColorToRGB(clr));
     hPal := FImage.Ild.Palette;
     //When we have a palette get the palette index number
     if hPal <> 0 then
      SelColor:=GetNearestPaletteIndex(hPal, ColorToRGB(clr));
     //Update the track bars
    TrackBarChange(trbRed);
  end;

  if CanRubberBand(LowerCase(IlPages.ActivePage.Caption)) then
    ILR.MouseDown(Button,Shift,X,Y);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.Image1MouseMove(Sender: TObject;
                                      Shift: TShiftState;
                                      X,
                                      Y: Integer);
begin
    ILR.MouseMove(Shift,X,Y);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.Image1MouseUp(Sender: TObject;
                                    Button: TMouseButton;
                                    Shift: TShiftState;
                                    X,
                                    Y: Integer);
begin
     ILR.MouseUp(Button,Shift,X,Y);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.Image1Paint(Sender: TObject);
begin
     ILR.PaintRect;
end;

{*********************************************************************

*********************************************************************}


procedure TFormEffect.Image1Rubberband(Sender: TObject;
                                       Button: TMouseButton;
                                       Shift: TShiftState;
                                       X,
                                       Y,
                                       XX,
                                       YY: Integer);
begin
 if Assigned(FImage.ILD.DibBitmap) then begin
    InRubberband:=True;
    IX := Round(MIW / FImage.Width * X);
    IY := Round(MIH / FImage.Height * Y);
    IXX := Round(MIW / FImage.Width * XX);
    IYY := Round(MIH / FImage.Height * YY);
    FImage.PaintL:=X;
    FImage.PaintT:=Y;
    FImage.PaintW:=XX-X+1;
    FImage.PaintH:=YY-Y+1;
    RLeftEdit.Text:=IntToStr(IX);
    RTopEdit.Text:=IntToStr(IY);
    RRightEdit.Text:=IntToStr(IXX);
    RBottomEdit.Text:=IntToStr(IYY);
    if PasteImage then FImage.Paint;
    InRubberband:=False;
 end;
end;

{*********************************************************************

*********************************************************************}


procedure TFormEffect.ResetRubberbandBtnClick(Sender: TObject);
begin
   Ilr.DropRect(5, 5,FImage.Width-10,FImage.Height-10);
   FImage.Refresh;
end;

{*********************************************************************

*********************************************************************}

Function TFormEffect.LongToBool(Bl : Integer) : Boolean;
begin
    result:=False;
    if bl = 1 then result:=True;
end;
{*********************************************************************

*********************************************************************}

Function TFormEffect.BoolToShort(Bl : Boolean) : SmallInt;
begin
    result:=0;
    if bl then result:=1;
end;

{*********************************************************************

*********************************************************************}

Function TFormEffect.DibUpdate(upDib : THandle): SmallInt;
begin
  result:=1;
  if upDib > 0 then
      FImage.ILD.DibBitmap:=PBitmapInfo(GlobalLock(FImage.ILD.AssignDib(upDib)));
end;

{*********************************************************************

*********************************************************************}

Function TFormEffect.ProgressStatus(Progress : SmallInt) : SmallInt;
begin
 if WantCancelNow then begin
    {Pass a 0 to the dll to indicate that we want to cancel}  
    Result:=0;
 end else begin
    result:=1;
    if Progress = 0  then begin
     ilProgress.Position:=0;
     Application.ProcessMessages;
     FImage.Paint;
    end;

    {Process the Last call}
    if Progress > 99  then begin
     ilProgress.Position:=Progress;
     Application.ProcessMessages;
     FImage.Paint;
     exit;
    end;

    {Some speed improvement when only processing each fifth call}
    if Progress > ilProgress.Position+5 then begin
     ilProgress.Position:=Progress;
     {Set the message caption}
     ilStatus.Panels.Items[1].Text := ILProgressMessage;
     Application.ProcessMessages;
     FImage.Paint;
    end;
 end;
end;


{*********************************************************************

*********************************************************************}

procedure TFormEffect.FormResize(Sender: TObject);
begin
  if not Closing then begin
    ilProgress.Top:=ilStatus.Top+3;
    ilProgress.Left:=ilStatus.Width-ilProgress.Width-15;
    Panel5.Width:=IlPages.Left-5;

    if (Assigned(FImage.ILD.DibBitmap)) and (Assigned(Ilr)) then begin
     if FImage.ILD.Width > 0 then begin
      IX := Round((FImage.Width / MIW) * IX);
      IXX := Round((FImage.Width / MIW) * IXX-IX);
     end;
     if FImage.ILD.Height >0 then begin
      IY := Round((FImage.Height / MIH) * IY);
      IYY := Round((FImage.Height / MIH) * IYY-IY);
     end;
     Ilr.DropRect(IX, IY, IXX, IYY);
     FImage.Paint;
    end;

  end;
end;


{*********************************************************************

*********************************************************************}
procedure TFormEffect.MotionBlurSet(Sender: TObject);
begin
   Label25.Visible:=true;
   if MotionZoom.Checked then begin
    Label25.Visible:=false;
    WhatMotion:=1
   end else if MotionRotate.Checked then
    WhatMotion:=2
   else WhatMotion:=3;
   mtAnglebar.Visible:=Label25.Visible;
   mtAngleEdit.Visible:=Label25.Visible;
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.brMaskColorBtnClick(Sender: TObject);
begin
  ColorDialog.Color:=MaskColor;
  if ColorDialog.Execute then
     MaskColor:=ColorDialog.Color;
  Panel10.Color:=MaskColor;
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.BackColorClick(Sender: TObject);
begin
  ColorDialog.Color:=BackGroundColor;
  if ColorDialog.Execute then
     BackGroundColor:=ColorDialog.Color;
  Panel7.Color:=BackGroundColor;
  Panel9.Color:=BackGroundColor;
  Panel11.Color:=BackGroundColor;
  Panel13.Color:=BackGroundColor;
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.ForeColorBtnClick(Sender: TObject);
begin
  ColorDialog.Color:=ForeGroundColor;
  if ColorDialog.Execute then
     ForeGroundColor:=ColorDialog.Color;
  Panel8.Color:=ForeGroundColor;
  Panel12.Color:=ForeGroundColor;
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.EditKeyPress(Sender: TObject; var Key: Char);
begin
  iKeyPress(Key);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.iKeyPress(var Key: Char);
begin
  if not IsValidChar(Key) then
  begin
    Key := #0;
    MessageBeep(0)
  end;
end;

{*********************************************************************

*********************************************************************}

function TFormEffect.IsValidChar(Key: Char): Boolean;
begin
  Result := (Key in [DecimalSeparator, '+', '-', '0'..'9']) or
    ((Key < #32) and (Key <> Chr(VK_RETURN)));
  if not Result and ((Key >= #32) or (Key = Char(VK_BACK)) or (Key = Char(VK_DELETE))) then
    Result := False;
end;

{*********************************************************************

*********************************************************************}

function TFormEffect.EditInt(Sender: TObject) : Integer;
begin
    if TEdit(Sender).Text = '-' then TEdit(Sender).Text := '-1';
    try
       Result:=StrToInt(TEdit(Sender).Text);
    except
       Result:=0;
    end
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.ResetEdit(Sender: TObject; iMin, iMax : Integer);
begin
    if TEdit(Sender).Text = '' then TEdit(Sender).Text := '0';
    if (EditInt(Sender) > iMax) then TEdit(Sender).Text:=IntToStr(iMax);
    if (EditInt(Sender) < iMin) then TEdit(Sender).Text:=IntToStr(iMin);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.RealEditKeyPress(Sender: TObject; var Key: Char);
begin
  riKeyPress(Key);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.riKeyPress(var Key: Char);
begin
  if not rIsValidChar(Key) then
  begin
    Key := #0;
    MessageBeep(0)
  end;
end;

{*********************************************************************

*********************************************************************}

function TFormEffect.rIsValidChar(Key: Char): Boolean;
begin
  Result := (Key in [DecimalSeparator, '.', '-', '0'..'9']) or
    ((Key < #32) and (Key <> Chr(VK_RETURN)));
  if not Result and ((Key >= #32) or (Key = Char(VK_BACK)) or (Key = Char(VK_DELETE))) then
    Result := False;
end;

{*********************************************************************

*********************************************************************}

function TFormEffect.rEditInt(Sender: TObject) : Double;
begin
    if TEdit(Sender).Text = '-' then TEdit(Sender).Text := '-1';
    try
       Result:=StrToFloat(TEdit(Sender).Text);
    except
       Result:=0;
    end
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.rResetEdit(Sender: TObject; iMin, iMax : Integer);
begin
    if TEdit(Sender).Text = '' then TEdit(Sender).Text := '0';
    if (rEditInt(Sender) > iMax) then TEdit(Sender).Text:=Format('%3.2f', [iMax / 10]);
    if (rEditInt(Sender) < iMin) then TEdit(Sender).Text:=Format('%3.2f', [iMin / 10]);
end;



{*********************************************************************

*********************************************************************}

procedure TFormEffect.Transitions1Click(Sender: TObject);
begin
     IlPages.ActivePage:=GetTabNumber('Transitions');
     IlPagesChange(nil);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.MenuItemToTab(Sender: TObject);
begin
     IlPages.ActivePage:=GetTabNumber(TMenuItem(Sender).Caption);
     IlPagesChange(nil);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.BleedEditChange(Sender: TObject);
begin
    ResetEdit(Sender, BleedBar.Min, BleedBar.Max);
    BleedBar.Position:=EditInt(Sender);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.BleedBarChange(Sender: TObject);
begin
   BleedEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.BlurEditChange(Sender: TObject);
begin
    ResetEdit(Sender, BlurBar.Min, BlurBar.Max);
    BlurBar.Position:=EditInt(Sender);
end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.BlurBarChange(Sender: TObject);
begin
   BlurEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.BrightEditChange(Sender: TObject);
begin
    ResetEdit(Sender, BrightBar.Min, BrightBar.Max);
    BrightBar.Position:=EditInt(Sender);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.BrightBarChange(Sender: TObject);
begin
   BrightEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.DarkBarChange(Sender: TObject);
begin
   DarkEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.DarkEditChange(Sender: TObject);
begin
    ResetEdit(Sender, DarkBar.Min, DarkBar.Max);
    DarkBar.Position:=EditInt(Sender);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.EdgeBarChange(Sender: TObject);
begin
   EdgeEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.EdgeEditChange(Sender: TObject);
begin
    ResetEdit(Sender, EdgeBar.Min, EdgeBar.Max);
    EdgeBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.EnhanceEditChange(Sender: TObject);
begin
    ResetEdit(Sender, EnGraveBar.Min, EnGraveBar.Max);
    EnGraveBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.EnGraveBarChange(Sender: TObject);
begin
   EnhanceEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.enGammaRedBarChange(Sender: TObject);
begin
   enGammaRedEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.enGammaRedEditChange(Sender: TObject);
begin
    ResetEdit(Sender, enGammaRedBar.Min, enGammaRedBar.Max);
    enGammaRedBar.Position:=EditInt(Sender);
end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.enGammaGreenBarChange(Sender: TObject);
begin
   enGammaGreenEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.enGammaGreenEditChange(Sender: TObject);
begin
    ResetEdit(Sender, enGammaGreenBar.Min, enGammaGreenBar.Max);
    enGammaGreenBar.Position:=EditInt(Sender);
end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.enGammaBlueBarChange(Sender: TObject);
begin
   enGammaBlueEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.enGammaBlueEditChange(Sender: TObject);
begin
    ResetEdit(Sender, enGammaBlueBar.Min, enGammaBlueBar.Max);
    enGammaBlueBar.Position:=EditInt(Sender);
end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.enContrastBarChange(Sender: TObject);
begin
   enContrastEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.enContrastEditChange(Sender: TObject);
begin
    ResetEdit(Sender, enContrastBar.Min, enContrastBar.Max);
    enContrastBar.Position:=EditInt(Sender);
end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.enBrightBarChange(Sender: TObject);
begin
   enBrightEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.enBrightEditChange(Sender: TObject);
begin
    ResetEdit(Sender, enBrightBar.Min, enBrightBar.Max);
    enBrightBar.Position:=EditInt(Sender);
end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.GammaEditChange(Sender: TObject);
begin
    ResetEdit(Sender, GammaBar.Min, GammaBar.Max);
    GammaBar.Position:=EditInt(Sender);
end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.GammaBarChange(Sender: TObject);
begin
   GammaEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.htAngleBarChange(Sender: TObject);
begin
   htAngleEdit.Text:=Format('%3.2f', [TTrackBar(Sender).Position/10]);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.htAngleEditChange(Sender: TObject);
begin
    rResetEdit(Sender, htAngleBar.Min, htAngleBar.Max);
    htAngleBar.Position:=Round(rEditInt(Sender)*10);
end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.htCellSizeBarChange(Sender: TObject);
begin
   htCellSizeEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.htCellSizeEditChange(Sender: TObject);
begin
    ResetEdit(Sender, htCellSizeBar.Min, htCellSizeBar.Max);
    htCellSizeBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.hsChannels(Sender: TObject);
begin
     if a3col.checked then begin
     {When All channels selected the HUE is 360 degrees}
      hsHueBar.max :=360;
      hsHueBar.position:=180;
     end else begin
     {When one channel selected the HUE is 120 degrees}
      hsHueBar.max :=120;
      hsHueBar.position:=60;
     end;
     hsHueEdit.Text:=IntToStr(hsHueBar.Position);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.hsHueBarChange(Sender: TObject);
begin
   hsHueEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.hsHueEditChange(Sender: TObject);
begin
    ResetEdit(Sender, hsHueBar.Min, hsHueBar.Max);
    hsHueBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.hsSatBarChange(Sender: TObject);
begin
   hsSatEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.hsSatEditChange(Sender: TObject);
begin
    ResetEdit(Sender, hsSatBar.Min, hsSatBar.Max);
    hsSatBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.hsBrightBarChange(Sender: TObject);
begin
   hsBrightEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.hsBrightEditChange(Sender: TObject);
begin
    ResetEdit(Sender, hsBrightBar.Min, hsBrightBar.Max);
    hsBrightBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.jgPeriodBarChange(Sender: TObject);
begin
   jgPeriodEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.jgPeriodEditChange(Sender: TObject);
begin
    ResetEdit(Sender, jgPeriodBar.Min, jgPeriodBar.Max);
    jgPeriodBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.jgAmpBarChange(Sender: TObject);
begin
   jgAmpEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.jgAmpEditChange(Sender: TObject);
begin
    ResetEdit(Sender, jgAmpBar.Min, jgAmpBar.Max);
    jgAmpBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.msPolygons(Sender: TObject);
begin
   if TRadioButton(Sender) = btnType2 then
     PolyBox.Caption:='Polygons'
   else
     PolyBox.Caption:='Squares';
end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.msSmooth(Sender: TObject);
begin
   if TRadioButton(Sender) = MosSur1 then
     SmoothBox.Caption:='Smooth'
   else
     SmoothBox.Caption:='Rough';
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.msSizeBarChange(Sender: TObject);
begin
   msSizeEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.msSizeEditChange(Sender: TObject);
begin
    ResetEdit(Sender, msSizeBar.Min, msSizeBar.Max);
    msSizeBar.Position:=EditInt(Sender);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.msSpaceBarChange(Sender: TObject);
begin
   msSpaceEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.msSpaceEditChange(Sender: TObject);
begin
    ResetEdit(Sender, msSpaceBar.Min, msSpaceBar.Max);
    msSpaceBar.Position:=EditInt(Sender);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.msLightBarChange(Sender: TObject);
begin
   msLightEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.msLightEditChange(Sender: TObject);
begin
    ResetEdit(Sender, msLightBar.Min, msLightBar.Max);
    msLightBar.Position:=EditInt(Sender);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.msHeightBarChange(Sender: TObject);
begin
   msHeightEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.msHeightEditChange(Sender: TObject);
begin
    ResetEdit(Sender, msHeightBar.Min, msHeightBar.Max);
    msHeightBar.Position:=EditInt(Sender);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.msRandomBarChange(Sender: TObject);
begin
   msRandomEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.msRandomEditChange(Sender: TObject);
begin
    ResetEdit(Sender, msRandomBar.Min, msRandomBar.Max);
    msRandomBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.mtAnglebarChange(Sender: TObject);
begin
   mtAngleEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.mtAngleEditChange(Sender: TObject);
begin
    ResetEdit(Sender, mtAngleBar.Min, mtAngleBar.Max);
    mtAngleBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.mtValueBarChange(Sender: TObject);
begin
   mtValueEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.mtValueEditChange(Sender: TObject);
begin
    ResetEdit(Sender, mtValueBar.Min, mtValueBar.Max);
    mtValueBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.brEdgeBarChange(Sender: TObject);
begin
   brEdgeEdit.Text:=IntToStr(TTrackBar(Sender).Position);
   ShapeImage1.EdgeSize:=SmallInt(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.brEdgeEditChange(Sender: TObject);
begin
    ResetEdit(Sender, brEdgeBar.Min, brEdgeBar.Max);
    brEdgeBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.brAngleBarChange(Sender: TObject);
begin
   brAngleEdit.Text:=IntToStr(TTrackBar(Sender).Position);
   ShapeImage1.Angle:=TTrackBar(Sender).Position;
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.brAngleEditChange(Sender: TObject);
begin
    ResetEdit(Sender, brAngleBar.Min, brAngleBar.Max);
    brAngleBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.brVectorsBarChange(Sender: TObject);
begin
   brVectorsEdit.Text:=IntToStr(TTrackBar(Sender).Position);
   ShapeImage1.Vectors:=TTrackBar(Sender).Position;
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.brVectorsEditChange(Sender: TObject);
begin
    ResetEdit(Sender, brVectorsBar.Min, brVectorsBar.Max);
    brVectorsBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.brVectorSizeBarChange(Sender: TObject);
begin
   brVectorSizeEdit.Text:=IntToStr(TTrackBar(Sender).Position);
   ShapeImage1.VectorP:=TTrackBar(Sender).Position;
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.brVectorSizeEditChange(Sender: TObject);
begin
    ResetEdit(Sender, brVectorSizeBar.Min, brVectorSizeBar.Max);
    brVectorSizeBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.brShapeComboChange(Sender: TObject);
var
 vis,
 Bvis : Boolean;
begin
  if Assigned(FImage.ILD.DibBitmap) then begin

    if brShapeCombo.ItemIndex = 0 then begin
        PreviewBtn.Enabled:=False;
        ApplyBtn.Enabled:=False;
        exit;
     end else begin
        PreviewBtn.Enabled:=True;
        ApplyBtn.Enabled:=True;
    end;

    if (Sender = TSpeedButton(PreviewBtn)) or (Sender = TMenuItem(Preview1)) or (Sender = TComboBox(brShapeCombo)) then begin
       ShapeImage1.Width := FImage.ILD.Width;
       ShapeImage1.Height :=FImage.ILD.Height;
    end else begin
       ShapeImage1.Width := MIW;
       ShapeImage1.Height :=MIH;
    end;

    ShapeImage1.Shape:=TMyShapeType(brShapeCombo.ItemIndex);

    if (brShapeCombo.Text = 'Star') or (brShapeCombo.Text = 'PolyGon') then
      vis := true
    else
      vis := false;

    if (brShapeCombo.Text = 'PolyGon') then
       Bvis := true
    else
       Bvis := false;

    brAngleBar.Visible:=BVis;
    labAngle.Visible:=BVis;
    brAngleEdit.Visible:=BVis;
    brVectorsBar.Visible:=Vis;
    labVectors.Visible:=Vis;
    brVectorsEdit.Visible:=Vis;
    brVectorSizeBar.Visible:=Vis;
    lavVecSize.Visible:=Vis;
    brVectorSizeEdit.Visible:=Vis;
 end;
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.brWindowColorClick(Sender: TObject);
begin
     brMaskColorBtn.Enabled:= not brWindowColor.Checked;
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.bfEdgeBarChange(Sender: TObject);
begin
   bfEdgeEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.bfEdgeEditChange(Sender: TObject);
begin
    ResetEdit(Sender, bfEdgeBar.Min, bfEdgeBar.Max);
    bfEdgeBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.bfWindoColorClick(Sender: TObject);
begin
     bfEdgeWColBtn.Enabled:= not bfWindoColor.Checked;
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.crColorsBarChange(Sender: TObject);
begin
   crColorsEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.crColorsEditChange(Sender: TObject);
begin
    ResetEdit(Sender, crColorsBar.Min, crColorsBar.Max);
    crColorsBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}


procedure TFormEffect.pcShadingBarChange(Sender: TObject);
begin
   pcShadingEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.pcShadingEditChange(Sender: TObject);
begin
    ResetEdit(Sender, pcShadingBar.Min, pcShadingBar.Max);
    pcShadingBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.nsRedBarChange(Sender: TObject);
begin
   nsRedEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.nsRedEditChange(Sender: TObject);
begin
    ResetEdit(Sender, nsRedBar.Min, nsRedBar.Max);
    nsRedBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.nsGreenBarChange(Sender: TObject);
begin
   nsGreenEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.nsGreenEditChange(Sender: TObject);
begin
    ResetEdit(Sender, nsGreenBar.Min, nsGreenBar.Max);
    nsGreenBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.nsBlueBarChange(Sender: TObject);
begin
   nsBlueEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.nsBlueEditChange(Sender: TObject);
begin
    ResetEdit(Sender, nsBlueBar.Min, nsBlueBar.Max);
    nsBlueBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.opValueBarChange(Sender: TObject);
begin
   opValueEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}
procedure TFormEffect.opValueEditChange(Sender: TObject);
begin
    ResetEdit(Sender, opValueBar.Min, opValueBar.Max);
    opValueBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.phValueEditChange(Sender: TObject);
begin
    ResetEdit(Sender, phValueBar.Min, phValueBar.Max);
    phValueBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.phValueBarChange(Sender: TObject);
begin
   phValueEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.dsValueBarChange(Sender: TObject);
begin
   dsValueEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.dsValueEditChange(Sender: TObject);
begin
   ResetEdit(Sender, dsValueBar.Min, dsValueBar.Max);
   dsValueBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.exValueBarChange(Sender: TObject);
begin
   exValueEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.exValueEditChange(Sender: TObject);
begin
   ResetEdit(Sender, exValueBar.Min, exValueBar.Max);
   exValueBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.plValueBarChange(Sender: TObject);
begin
   plValueEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.plValueEditChange(Sender: TObject);
begin
   ResetEdit(Sender, plValueBar.Min, plValueBar.Max);
   plValueBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.plAngleBarChange(Sender: TObject);
begin
   plAngleEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.plAngleEditChange(Sender: TObject);
begin
   ResetEdit(Sender, plAngleBar.Min, plAngleBar.Max);
   plAngleBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.rtValueBarChange(Sender: TObject);
begin
   rtValueEdit.Text:=Format('%3.2f', [TTrackBar(Sender).Position/10]);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.rtValueEditChange(Sender: TObject);
begin
   rResetEdit(Sender, rtValueBar.Min, rtValueBar.Max);
   rtValueBar.Position:=Round(rEditInt(Sender)*10);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.shValueEditChange(Sender: TObject);
begin
   ResetEdit(Sender, shValueBar.Min, shValueBar.Max);
   shValueBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.shValueBarChange(Sender: TObject);
begin
   shValueEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.soValueBarChange(Sender: TObject);
begin
   soValueEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.soValueEditChange(Sender: TObject);
begin
   ResetEdit(Sender, soValueBar.Min, soValueBar.Max);
   soValueBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}


procedure TFormEffect.sprValueBarChange(Sender: TObject);
begin
   sprValueEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.sprValueEditChange(Sender: TObject);
begin
   ResetEdit(Sender, sprValueBar.Min, sprValueBar.Max);
   sprValueBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.sprRandomBarChange(Sender: TObject);
begin
   sprRandomEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.sprRandomEditChange(Sender: TObject);
begin
   ResetEdit(Sender, sprRandomBar.Min, sprRandomBar.Max);
   sprRandomBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.thValueBarChange(Sender: TObject);
begin
   thValueEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.thValueEditChange(Sender: TObject);
begin
   ResetEdit(Sender, thValueBar.Min, thValueBar.Max);
   thValueBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.trDelayBarChange(Sender: TObject);
begin
   trDelayEdit.Text:=IntToStr(TTrackBar(Sender).Position);
   FFXDelay:=TTrackBar(Sender).Position;
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.trDelayEditChange(Sender: TObject);
begin
   ResetEdit(Sender, trDelayBar.Min, trDelayBar.Max);
   trDelayBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.trThickbarChange(Sender: TObject);
begin
   trThickEdit.Text:=IntToStr(TTrackBar(Sender).Position);
   FFXColRowThick:=TTrackBar(Sender).Position;
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.trThickEditChange(Sender: TObject);
begin
   ResetEdit(Sender, trThickBar.Min, trThickBar.Max);
   trThickBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.wpValueEditChange(Sender: TObject);
begin
   ResetEdit(Sender, wpValueBar.Min, wpValueBar.Max);
   wpValueBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.wpValueBarChange(Sender: TObject);
begin
   wpValueEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.wvLengthBarChange(Sender: TObject);
begin
   wvLengthEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.wvLengthEditChange(Sender: TObject);
begin
   ResetEdit(Sender, wvLengthBar.Min, wvLengthBar.Max);
   wvLengthBar.Position:=EditInt(Sender);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.wvPhaseBarChange(Sender: TObject);
begin
   wvPhaseEdit.Text:=Format('%3.2f', [TTrackBar(Sender).Position/10]);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.wvPhaseEditChange(Sender: TObject);
begin
   rResetEdit(Sender, wvPhaseBar.Min, wvPhaseBar.Max);
   wvPhaseBar.Position:=Round(rEditInt(Sender)*10);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.wvAmplBarChange(Sender: TObject);
begin
   wvAmplEdit.Text:=Format('%3.2f', [TTrackBar(Sender).Position/10]);
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.wvAmplEditChange(Sender: TObject);
begin
   rResetEdit(Sender, wvAmplBar.Min, wvAmplBar.Max);
   wvAmplBar.Position:=Round(rEditInt(Sender)*10);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.wrpScaleBarChange(Sender: TObject);
begin
   wrpScaleEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.wrpScaleEditChange(Sender: TObject);
begin
   ResetEdit(Sender, wrpScaleBar.Min, wrpScaleBar.Max);
   wrpScaleBar.Position:=EditInt(Sender);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.wrpVecRotateEditChange(Sender: TObject);
begin
   ResetEdit(Sender, wrpVecRotateBar.Min, wrpVecRotateBar.Max);
   wrpVecRotateBar.Position:=EditInt(Sender);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.wrpVecRotateBarChange(Sender: TObject);
begin
   wrpVecRotateEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.wrpStepsBarChange(Sender: TObject);
begin
   wrpStepsEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.wrpStepsEditChange(Sender: TObject);
begin
   ResetEdit(Sender, wrpStepsBar.Min, wrpStepsBar.Max);
   wrpStepsBar.Position:=EditInt(Sender);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.wrpDisplacementBarChange(Sender: TObject);
begin
   wrpDisplacementEdit.Text:=IntToStr(TTrackBar(Sender).Position);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.wrpDisplacementEditChange(Sender: TObject);
begin
   ResetEdit(Sender, wrpDisplacementBar.Min, wrpDisplacementBar.Max);
   wrpDisplacementBar.Position:=EditInt(Sender);
end;

{*********************************************************************

*********************************************************************}

function TFormEffect.CanRubberBand(Pge : String) : Boolean;
begin
     PasteImage:=False;
     FImage.PaintPaste:=False;
     PreviewBtn.Enabled:=True;
     ApplyBtn.Enabled:=True;
     PasteTimer.Enabled:=False;
     Result:=False;
     if Pge = LowerCase('AutoContrast') then Result:=True;
     if Pge = LowerCase('Bleed') then Result:=True;
     if Pge = LowerCase('Borders') then begin
                                          Result:=False;
                                          ShapeImage1.Shape:=TMyShapeType(brShapeCombo.ItemIndex);
                                          if ShapeImage1.Shape = shNone then begin
                                             PreviewBtn.Enabled:=False;
                                             ApplyBtn.Enabled:=False;
                                          end else begin
                                             PreviewBtn.Enabled:=True;
                                             ApplyBtn.Enabled:=True;
                                          end;
                                        end;
     if Pge = LowerCase('Border Fade') then Result:=True;
     if Pge = LowerCase('Blur') then Result:=True;
     if Pge = LowerCase('Bright') then Result:=False;
     if Pge = LowerCase('Dark') then Result:=False;
     if Pge = LowerCase('Color') then Result:=False;
     if Pge = LowerCase('Color Palette') then begin
                                               Result:=False;
                                               PreviewBtn.Enabled:=False;
                                               ApplyBtn.Enabled:=False;
                                              end;
     if Pge = LowerCase('Page Curl') then Result:=True;
     if Pge = LowerCase('Edge Detection') then Result:=True;
     if Pge = LowerCase('Engrave') then Result:=True;
     if Pge = LowerCase('Enhance') then Result:=True;
     if Pge = LowerCase('Gray Area') then Result:=True;
     if Pge = LowerCase('Gamma') then Result:=False;
     if Pge = LowerCase('HalfTone') then Result:=False;
     if Pge = LowerCase('Hue and Saturation') then Result:=True;
     if Pge = LowerCase('Invert') then Result:=False;
     if Pge = LowerCase('Jiggle') then Result:=True;
     if Pge = LowerCase('Mirror') then Result:=False;
     if Pge = LowerCase('Mosaic') then Result:=True;
     if Pge = LowerCase('Motion') then Result:=False;
     if Pge = LowerCase('Noisy') then Result:=True;
     if Pge = LowerCase('Oil Paint') then Result:=True;
     if Pge = LowerCase('Paste Image') then begin
                                              Result:=True;
                                              PasteImage:=True;
                                              FImage.PaintPaste:=True;
                                              PreviewBtn.Enabled:=False;
                                              PasteTimer.Enabled:=True;
                                             end;
     if Pge = LowerCase('Pinch Hole') then Result:=True;
     if Pge = LowerCase('Pixel Fix') then Result:=True;
     if Pge = LowerCase('Extrude') then Result:=False;
     if Pge = LowerCase('Polar') then Result:=True;
     if Pge = LowerCase('Rotate') then Result:=True;
     if Pge = LowerCase('Sharp') then Result:=True;
     if Pge = LowerCase('Soft') then Result:=True;
     if Pge = LowerCase('Spray') then Result:=True;
     if Pge = LowerCase('Tile Maker') then Result:=False;
     if Pge = LowerCase('Threshold') then Result:=True;
     if Pge = LowerCase('Transitions') then Result:=False;
     if Pge = LowerCase('WhirlPool') then Result:=True;
     if Pge = LowerCase('Wave') then Result:=True;
     if Pge = LowerCase('Warp') then Result:=False;
end;

{*********************************************************************

*********************************************************************}
procedure TFormEffect.MillionColorsClick(Sender: TObject);
begin
     crColorsBar.Enabled:=not MillionColors.Checked;
     crColorsEdit.Enabled:=not MillionColors.Checked;
     R1.Enabled:=not MillionColors.Checked;
     R2.Enabled:=not MillionColors.Checked;
     R3.Enabled:=not MillionColors.Checked;
     R4.Enabled:=not MillionColors.Checked;
     Label5.Enabled:=not MillionColors.Checked;
     Label53.Enabled:=not MillionColors.Checked;
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.ImageInfo;
begin
 if Assigned(FImage.ILD.DibBitmap) then begin
    case FImage.ILD.Bits of
    1: begin
         Label54.Caption:='Current displayed image has a palette of 1 color';
         MillionColors.Enabled:=True;         
       end;
    4: begin
         MillionColors.Enabled:=True;
         Label54.Caption:='Current displayed image has a palette of 16 colors';
       end;
    8: begin
         MillionColors.Enabled:=True;
         Label54.Caption:='Current displayed image has a palette of 256 colors';
       end;
    16,
    24:begin
         MillionColors.Checked:=False;
         MillionColors.Enabled:=False;
         Label54.Caption:='Current displayed image has milions of colors';
       end;
    end;
 end else Label54.Caption:='';
end;

{*********************************************************************
allow/disallow rubberband when flipping pages
*********************************************************************}

procedure TFormEffect.IlPagesChange(Sender: TObject);
var
 I         : Integer;
begin
  Applied:=True;
  ImageInfo;

  HSRubberband.Enabled:=CanRubberBand(LowerCase(IlPages.ActivePage.Caption));

  for I := 0 to ComponentCount -1 do
    if Components[I] is TMenuItem then
     if TMenuItem(Components[I]).GroupIndex = 0 then
      if LowerCase(TMenuItem(Components[I]).Caption) = LowerCase(IlPages.ActivePage.Caption) then
        TMenuItem(Components[I]).Checked:=True
      else
        TMenuItem(Components[I]).Checked:=False;


  if Assigned(FImage.ILD.DibBitmap) then
   if (LowerCase(IlPages.ActivePage.Caption) = LowerCase(ColorPalette1.Caption)) then begin
    if FImage.Ild.Bits >8 then begin
     trbRed.Enabled:=False;
     trbGreen.Enabled:=False;
     trbBlue.Enabled:=False;
     PalOpt.Enabled:=False;
     PalCombo.Enabled:=False;
     Panel17.Enabled:=False;
     pbPalette.Enabled:=False;
     Label64.Visible:=True;
     RestoreImage(1);
    end else begin
     trbRed.Enabled:=True;
     trbGreen.Enabled:=True;
     trbBlue.Enabled:=True;
     PalOpt.Enabled:=True;
     PalCombo.Enabled:=True;
     Panel17.Enabled:=True;
     pbPalette.Enabled:=True;
     Label64.Visible:=False;
     RestoreImage(3);
   end;
  end else begin
     if IsInPalette then MakeBDib;
     IsInPalette:=False;
     trbRed.Enabled:=False;
     trbGreen.Enabled:=False;
     trbBlue.Enabled:=False;
     PalOpt.Enabled:=False;
     PalCombo.Enabled:=False;
     Panel17.Enabled:=False;
     pbPalette.Enabled:=False;
     Label64.Visible:=True;
     RestoreImage(1);
  end;

  if not Assigned(FImage.ILD.DibBitmap) then begin
     PreviewBtn.Enabled:=false;
     ApplyBtn.Enabled:=false;
     exBtn.Enabled:=false;
  end else begin
     PreviewBtn.Enabled:=true;
     ApplyBtn.Enabled:=true;
     exBtn.Enabled:=true;
     //brEdgeBarChange(Self);
  end;

  if CanRubberBand(LowerCase(IlPages.ActivePage.Caption)) then
     EnableRubberBand
  else
     DisableRubberBand;

  FImage.Repaint;
end;


{*********************************************************************
Get the tab number according tab name
*********************************************************************}
Function TFormEffect.GetTabNumber(TName : String) : TTabSheet;
var
 I : Integer;
begin
   result:=nil;
   for i:=0 to IlPages.Pagecount -1 do
     if IlPages.Pages[I].Caption = TName then result:=IlPages.Pages[I];
   if result = nil then result:= IlPages.FindNextPage(IlPages.Pages[0], True, True);
end;


{*********************************************************************
Restore the previous image
*********************************************************************}
procedure TFormEffect.RestoreImage(W : Byte);
begin
    if bDib >0 then begin
      if W=3 then begin
       if FImage.MainDib <> nil then
        FImage.MainDib.Free;

       FImage.MainDib:=ILTDib.Create;
       FImage.MainDib.DestroyDibOnExit:=False;
       FImage.MainDib.DibBitmap:=PBitmapInfo(GlobalLock(MainDib));

       FImage.ILD.Free;
       FImage.ILD:=ILTDib.Create;
       FImage.ILD.DestroyDibOnExit:=False;
       FImage.ILD.DibBitmap:=PBitmapInfo(GlobalLock(MainDib));
      end else begin
       FImage.MainDib.Free;
       FImage.MainDib:=Nil;
       FImage.ILD.Free;
       FImage.ILD:=ILTDib.Create;
       FImage.ILD.DibBitmap:=PBitmapInfo(GlobalLock(FImage.ILD.AssignDib(bDib)));
      end;

      if W = 1 then FImage.Repaint;
    end;
end;

{*********************************************************************
Apply the effect to the main image or the preview image
*********************************************************************}

procedure TFormEffect.DoEffect(Sender: TObject);
var
 R,
 G,
 B          : SmallInt;
 K,
 MaskHandle : HNDIB;
 HM         : HBitmap;
 HP         : HPalette;
 iValue     : Integer;
 sValue     : SmallInt;
 doRED      : SmallInt;
 doGRN      : SmallInt;
 doBLU      : SmallInt;
 doYEL      : SmallInt;
 doMAG      : SmallInt;
 doCYN      : SmallInt;
 PR         : TRect;
 CropX,
 CropY,
 CropWidth,
 CropHeight : Integer;
 ApplyOnly  : Boolean;
 EffectHDib : THandle;
 BPH        : PBitmapInfoHeader;
begin

 if Assigned(FImage.ILD.DibBitmap) then begin

 if ColorPalette1.Checked then begin
  exit;
 end;

 WantCancelNow:=False;
 TempHandle:=0;
 ilProgress.Position:=0;
 Try
    if (Sender = TSpeedButton(ApplyBtn)) or (Sender = TMenuItem(Apply1)) then
      ApplyOnly:=True
    else
      ApplyOnly:=False;

    if ApplyOnly then begin
       {Apply the effect to the real image}
       //RestoreImage(0);
      CropX:=IX;
      CropY:=IY;
      CropWidth:=IXX;
      CropHeight:=IYY;
      if not PasteImage then begin
          if CropX < 0 then CropX:=0;
          if CropY < 0 then CropY:=0;
          if CropWidth > MIW then CropWidth:=MIW;
          if CropHeight > MIH then CropHeight:=MIH;
       end;
       EffectHDib:=MainDib;
       PR:=Rect(CropX,  CropY, CropWidth, CropHeight);
       ReloadimageBtn.Enabled:=False;
       Applied:=True;
    end else begin
       {Apply the effect to the preview image}
       RestoreImage(0);
       EffectHDib:=GlobalHandle(FImage.ILD.DibBitmap);
       CropX:= Round(FImage.ILD.Width / MIW * IX);
       CropY := Round(FImage.ILD.Height / MIH * IY);
       CropWidth := Round(FImage.ILD.Width / MIW * IXX);
       CropHeight := Round(FImage.ILD.Height / MIH * IYY);
       if not PasteImage then begin
          if CropX < 0 then CropX:=0;
          if CropY < 0 then CropY:=0;
          if CropWidth > FImage.ILD.Width then CropWidth:=FImage.ILD.Width;
          if CropHeight > FImage.ILD.Height then CropHeight:=FImage.ILD.Height;
       end;
       PR:=Rect(CropX,  CropY, CropWidth, CropHeight);
       ReloadimageBtn.Enabled:=True;
       Applied:=False;
    end;

    DisableRubberBand;
    DisableControls;
    Screen.Cursor:=crHourGlass;
    StopProcessBtn.Enabled:=True;

    if Mirror1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:= MirrorDibImage(EffectHDib, VBox.Checked, HBox.Checked);
    {////////////////////////////////////////////////////////////////////}
    end else if Rotate1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
      RotateDegreeDib(EffectHDib,
                      CropX,
                      CropY,
                      CropWidth,
                      CropHeight,
                      rtValueBar.Position / 10,
                      BackGroundColor);
      TempHandle := 0;
    {////////////////////////////////////////////////////////////////////}
    end else if PasteImage1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     if GlobalSize(PasteHDib) >0 then begin
      K:=ScaleDibImage(PasteHDib,CropWidth-CropX,CropHeight-CropY,24);
      TempHandle:=DropDibImage(EffectHDib,K,-1,-1,-1,CropY,CropX);
      while GMEM_LOCKCOUNT AND GlobalFlags(K) > 0 do GlobalUnlock(K);
      GlobalFree(K);
     end;
    {////////////////////////////////////////////////////////////////////}
    end else if Borders1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     brShapeComboChange(Sender);
     if brWindowColor.Checked then begin
        R := GetRValue(ColorToRGB(Color));
        G := GetGValue(ColorToRGB(Color));
        B := GetBValue(ColorTORGB(Color));
     end else begin
        R := GetRValue(ColorToRGB(MaskColor));
        G := GetGValue(ColorToRGB(MaskColor));
        B := GetBValue(ColorToRGB(MaskColor));
     end;
     HM :=ShapeImage1.Picture.Bitmap.Handle;
     HP :=ShapeImage1.Picture.Bitmap.Palette;
     MaskHandle:=IHBitmapToDib(HM, HP, FImage.ILD.Bits);
     TempHandle:=MergeDibImage(EffectHDib,
                               MaskHandle,
                               R,
                               G,
                               B,
                               0,
                               0);
     while GMEM_LOCKCOUNT AND GlobalFlags(MaskHandle) > 0 do GlobalUnlock(MaskHandle);
     GlobalFree(MaskHandle);
    {////////////////////////////////////////////////////////////////////}
    end else if Fade1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     if bfWindoColor.Checked then begin
        R := GetRValue(ColorToRGB(Color));
        G := GetGValue(ColorToRGB(Color));
        B := GetBValue(ColorTORGB(Color));
     end else begin
        R := GetRValue(ColorToRGB(BackGroundColor));
        G := GetGValue(ColorToRGB(BackGroundColor));
        B := GetBValue(ColorToRGB(BackGroundColor));
     end;
     TempHandle:= FadeDibImage(EffectHDib,
                               CropX,
                               CropY,
                               CropWidth,
                               CropHeight,
                               bfEdgeBar.Position,
                               R,
                               G,
                               B,
                               LongInt(Self),
                               ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if MotionBlur1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:= MotionDibImage(EffectHDib,
                                 CropX,
                                 CropY,
                                 CropWidth,
                                 CropHeight,
                                 mtValueBar.Position,
                                 mtAnglebar.Position,
                                 WhatMotion,
                                 LongInt(Self),
                                 ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if Blur1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:= BlurryDibImage(EffectHDib,
                                 CropX,
                                 CropY,
                                 CropWidth,
                                 CropHeight,
                                 BlurBar.Position,
                                 LongInt(Self),
                                 ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if PinchHole1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=PinchDibImage(EffectHDib,
                               CropX,
                               CropY,
                               CropWidth,
                               CropHeight,
                               phValueBar.Position,
                               LongInt(Self),
                               ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if Polar1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=PolarDibImage(EffectHDib,
                               CropX,
                               CropY,
                               CropWidth,
                               CropHeight,
                               plValueBar.Position,
                               plAngleBar.Position,
                               PolInv.Checked,
                               PolBack.Checked,
                               LongInt(Self),
                               ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if PageCurl1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:= CurlDibImage(EffectHDib,
                               CropX,
                               CropY,
                               CropWidth,
                               CropHeight,
                               B_CFC.Checked,
                               B_CBC.Checked,
                               C_Trans.Checked,
                               B_CUBC.Checked,
                               B_CUFC.Checked,
                               CShade.Checked,
                               C_LT.Checked,
                               C_RT.Checked,
                               C_LB.Checked,
                               C_RB.Checked,
	                       C_OV.Checked,
                               C_OH.Checked,
                               BackGroundColor,
                               ForeGroundColor,
                               pcShadingBar.Position,
                               LongInt(Self),
                               ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if Mosaic1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=MosiacDibImage(EffectHDib,
                                CropX,
                                CropY,
                                CropWidth,
                                CropHeight,
                                msSizeBar.Position,
  		                msHeightBar.Position,
  		                msSpaceBar.Position,
  		                msLightBar.Position,
  		                msRandomBar.Position,
                                LongInt(BoolToShort(btnType.Checked)),
                                LongInt(BoolToShort(Not MosSur2.Checked)),
  		                MosAntiA.Checked,
                                ForeGroundColor,
                                BackGroundColor,
                                LongInt(Self),
                                ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if OilPaint1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=OilPaintDibImage(EffectHDib,
                                  CropX,
                                  CropY,
                                  CropWidth,
                                  CropHeight,
                                  opValueBar.Position,
                                  LongInt(Self),
                                  ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if Extrude1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=ExtrudeDibImage(EffectHDib,
                                 BoolToShort(Levels.Checked),
                                 exValueBar.Position,
                                 LongInt(Self),
                                 ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if Spray1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=SprayDibImage(EffectHDib,
                               CropX,
                               CropY,
                               CropWidth,
                               CropHeight,
                               sprValueBar.Position,
                               sprRandomBar.Position,
                               LongInt(Self),
                               ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if WhirlPool1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=whirlDibImage(EffectHDib,
                               CropX,
                               CropY,
                               CropWidth,
                               CropHeight,
                               wpValueBar.Position,
                               LongInt(Self),
                               ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if Wave1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=WaveTheDibImage(EffectHDib,
                                 CropX,
                                 CropY,
                                 CropWidth,
                                 CropHeight,
                                 wvAmplBar.Position,
                                 wvLengthBar.Position,
			         wvPhaseBar.Position,
			         LongInt(BoolToShort(Smear.Checked)),
			         LongInt(BoolToShort(Refl.Checked)),
                                 LongInt(Self),
                                 ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if Warp1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=WarpDibImage(EffectHDib,
                              BoolToShort(RgbToHueBox.Checked),
                              BoolToShort(RGBToSaturationBox.Checked),
                              BoolToShort(ConvoleTgle.Checked),
                              wrpScaleBar.Position,
	                      wrpVecRotateBar.Position,
	                      wrpStepsBar.Position,
		              wrpDisplacementBar.Position,
                              LongInt(Self),
                              ProgressCall,
                              DibUpdateCall);
    {////////////////////////////////////////////////////////////////////}
    end else if Jiggle1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     {Jiggle the image}
     TempHandle:= JiggleDibImage(EffectHDib,
                                 CropX,
                                 CropY,
                                 CropWidth,
                                 CropHeight,
                                 jgPeriodBar.Position,
                                 jgAmpBar.Position,
                                 LongInt(BoolToShort(not jgSine.Checked)),
                                 LongInt(Self),
                                 ProgressCall);
     {end Jiggle the image}
    {////////////////////////////////////////////////////////////////////}
    end else if Bleed1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=BleedDibImage(EffectHDib,
                               CropX,
                               CropY,
                               CropWidth,
                               CropHeight,
                               BleedBar.Position,
                               LongInt(Self),
                               ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if AutoContrast1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=AutoContrastDibImage(EffectHDib,
                                      CropX,
                                      CropY,
                                      CropWidth,
                                      CropHeight,
                                      LongInt(Self),
                                      ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if Bright1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=BrightDibImage (EffectHDib, BrightBar.Position);
    {////////////////////////////////////////////////////////////////////}
    end else if Dark1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=BrightDibImage (EffectHDib, -DarkBar.Position);
    {////////////////////////////////////////////////////////////////////}
    end else if Color1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     if MillionColors.Checked then begin
       TempHandle:=MoreColorDib(EffectHDib,24);
     end else begin
      if R1.Checked then
        TempHandle:=LessColorDib(EffectHDib,crColorsBar.Position, IL_BAYER);
      if R2.Checked then
        TempHandle:=LessColorDib(EffectHDib,crColorsBar.Position, IL_BURKES);
      if R3.Checked then
        TempHandle:=LessColorDib(EffectHDib,crColorsBar.Position, IL_FLOYD);
      if R4.Checked then
        TempHandle:=LessColorDib(EffectHDib,crColorsBar.Position, IL_GRAYSCALE);
     end;
    {////////////////////////////////////////////////////////////////////}
    end else if ColorPalette1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
    //This one will happen on the main dib
    {////////////////////////////////////////////////////////////////////}
    end else if EdgeDetection1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=EdgeDibImage(EffectHDib,
                              CropX,
                              CropY,
                              CropWidth,
                              CropHeight,
                              EdgeBar.Position,
                              LongInt(Self),
                              ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if Engrave1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=EngraveDibImage(EffectHDib,
                                 CropX,
                                 CropY,
                                 CropWidth,
                                 CropHeight,
                                 EnGraveBar.Position,
                                 LongInt(Self),
                                 ProgressCall);
     {////////////////////////////////////////////////////////////////////}
    end else if Enhance1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
    {Enhance Image}
     TempHandle:=EnhanceDibImage(EffectHDib,
                                 CropX,
                                 CropY,
                                 CropWidth,
                                 CropHeight,
                                 enBrightBar.Position,
                                 enContrastBar.Position,
                                 enGammaRedBar.Position,
                                 enGammaGreenBar.Position,
                                 enGammaBlueBar.Position,
                                 LongInt(Self),
                                 ProgressCall);
     {End Enhance Image}
    {////////////////////////////////////////////////////////////////////}
    end else if GrayArea1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=GrayAreaDibImage(EffectHDib,
                                  CropX,
                                  CropY,
                                  CropWidth,
                                  CropHeight,
                                  LongInt(Self),
                                  ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if Gamma1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     {Gamma Correction}
     TempHandle:=GammaDibImage(EffectHDib, GammaBar.Position);
     {End Gamma Correction}
    {////////////////////////////////////////////////////////////////////}
    end else if HalfTone1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
      {Half tone image}
      iValue:=0;
      if Rcircle.Checked then iValue:=0;
      if Rellipse.Checked then iValue:=1;
      if Rsqaure.Checked then iValue:=2;
      if Rdiamond.Checked then iValue:=3;
      if Rline.Checked then iValue:=4;
      if Rcross.Checked then iValue:=5;
      TempHandle:=HalfToneDibImage(EffectHDib,
                                   htCellSizeBar.Position,
                                   htAngleBar.Position / 10,
                                   iValue,
                                   LongInt(Self),
                                   ProgressCall);
    {End Half tone image}
    {////////////////////////////////////////////////////////////////////}
    end else if HueSaturation1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
    {Hue - Saturation Bright }
     if a3col.Checked then begin
      {We do all channels}
       doRED:=1;
       doGRN:=1;
       doBLU:=1;
       doYEL:=1;
       doMAG:=1;
       doCYN:=1;
     end else begin
      {What channners are we doing}
      doRED:=BoolToShort(rRed.Checked);
      doGRN:=BoolToShort(rGreen.Checked);
      doBLU:=BoolToShort(rBlue.Checked);
      doYEL:=BoolToShort(rYel.Checked);
      doMAG:=BoolToShort(rMag.Checked);
      doCYN:=BoolToShort(rCyn.Checked);
     end;

     if a3col.checked then
       sValue:=SmallInt(hsHueBar.Position-180)
     else
       sValue:=SmallInt(hsHueBar.Position-60);
     HueandSaturationDib(EffectHDib,
                         doRED,
                         doGRN,
                         doBLU,
                         doYEL,
                         doMAG,
                         doCYN,
                         sValue,
                         SmallInt(hsSatBar.Position-100),
                         SmallInt(hsBrightBar.Position-100),
                         @PR,
                         LongInt(Self),
                         ProgressCall);
     { end Hue - Saturation - Bright }
    {////////////////////////////////////////////////////////////////////}
    end else if Invert1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
      InvertDib(EffectHDib);
    {////////////////////////////////////////////////////////////////////}
    end else if Noisy1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=NoisyDibImage(EffectHDib,
                               CropX,
                               CropY,
                               CropWidth,
                               CropHeight,
                               LongInt(BoolToShort(nsGaus.Checked)),
                               LongInt(BoolToShort(UseGrayValueofPixels.Checked)),
                               nsRedBar.Position,
                               nsGreenBar.Position,
                               nsBlueBar.Position,
                               LongInt(Self),
                               ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if Sharp1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=SharpDibImage(EffectHDib,
                               CropX,
                               CropY,
                               CropWidth,
                               CropHeight,
                               shValueBar.Position,
                               LongInt(Self),
                               ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if Soft1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=SharpDibImage(EffectHDib,
                               CropX,
                               CropY,
                               CropWidth,
                               CropHeight,
                               -soValueBar.Position,
                               LongInt(Self),
                               ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if Despeckle1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=PixelFixDibImage(EffectHDib,
                                  CropX,
                                  CropY,
                                  CropWidth,
                                  CropHeight,
                                  dsValueBar.Position,
                                  LongInt(Self),
                                  ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if MakeTile1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=TileDibImage(EffectHDib,
                              LongInt(Self),
                              ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if Threshold1.Checked then begin
    {////////////////////////////////////////////////////////////////////}
     TempHandle:=ThresholdDibImage(EffectHDib,
                                   CropX,
                                   CropY,
                                   CropWidth,
                                   CropHeight,
                                   thValueBar.Position,
                                   BoolToShort(ThresAnti.Checked),
                                   LongInt(Self),
                                   ProgressCall);
    {////////////////////////////////////////////////////////////////////}
    end else if Transitions1.Checked then begin
    {////////////////////////////////////////////////////////////////////}

    {////////////////////////////////////////////////////////////////////}
    end;


    {Apply the effect to the real image of the calling class}
    if ApplyOnly then begin
        FImage.ILD.Free;
        FImage.ILD:=ILTDib.Create;
        if Color1.Checked then begin
            if TempHandle > 0 then
                   MainDib:=TempHandle
            else
                   MainDib:=EffectHDib;
            if EffectHDib > 0 then begin
               while GMEM_LOCKCOUNT AND GlobalFlags(EffectHDib) > 0 do GlobalUnlock(EffectHDib);
               GlobalFree(EffectHDib);
            end;
        end else begin
            if TempHandle > 0 then begin
               while GMEM_LOCKCOUNT AND GlobalFlags(MainDib) > 0 do GlobalUnlock(MainDib);
               GlobalFree(MainDib);
               MainDib := 0;
               MainDib:=TempHandle;
            end else
               MainDib:=EffectHDib;

        end;
    // ------------------------------------------------------
        PyDib:=GlobalLock(MainDib);
        BPH:=PBitmapInfoHeader(PyDib);
        Bits:=BPH^.biBitCount;
        MIW:=BPH^.biWidth;
        MIH:=BPH^.biHeight;
        GlobalUnlock(MainDib);

        FImage.ILD.DibBitmap:=PBitmapInfo(GlobalLock(ScaleDibImage(MainDib,
                                                                   FImage.Width,
                                                                   FImage.Height,
                                                                   Bits)));
        while GMEM_LOCKCOUNT AND GlobalFlags(bDib) > 0 do GlobalUnlock(bDib);
        Globalfree(bDib);
        bDib:=FImage.ILD.CopyDib;
    end else begin
        {Apply the effect to this image}
        if TempHandle > 0 then begin
           FImage.ILD.Free;
           FImage.ILD:=ILTDib.Create;
           FImage.ILD.DibBitmap:=PBitmapInfo(GlobalLock(TempHandle));
        end;
        if TempHandle = 0 then begin
           FImage.ILD.DestroyDibOnExit:=False;
           FImage.ILD.Free;
           FImage.ILD:=ILTDib.Create;
           FImage.ILD.DibBitmap:=PBitmapInfo(GlobalLock(EffectHDib));
        end;
    end;

  finally
    if CanRubberBand(LowerCase(IlPages.ActivePage.Caption)) then
     EnableRubberBand;
    EnableControls;
    StopProcessBtn.Enabled:=False;
    ilStatus.Panels.Items[1].Text := '';
    Screen.Cursor:=crDefault;
    ImageInfo;
  end;

  FImage.Repaint;

 end;

 end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ExitBTNDwn then ModalResult:=mrOk else ModalResult:=mrCancel;

  if bDib <> 0 then begin
   while GMEM_LOCKCOUNT AND GlobalFlags(bDib) > 0 do GlobalUnlock(bDib);
   Globalfree(bDib);
   end;
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.DriveComboBox1Change(Sender: TObject);
begin
  DirectoryListBox1.Drive := DriveComboBox1.Drive;
end;


{*********************************************************************

*********************************************************************}

procedure TFormEffect.DirectoryListBox1Change(Sender: TObject);
begin
  FileListBox1.Directory := DirectoryListBox1.Directory;
end;
{*********************************************************************

*********************************************************************}

procedure TFormEffect.PasteFromClipBtnClick(Sender: TObject);
var
 sDIB : THandle;
begin
 if (Clipboard.HasFormat(CF_DIB)) and (OpenClipBoard(Handle)) then begin
   FImage.PasteILD:=Nil;
   PasteFImage.ILD.Free;
   PasteFImage.ILD:=ILTDib.Create;
   sDIB:=GetClipboardData(CF_DIB);
   PasteHDib:=FImage.ILD.AssignDib(sDIB);
   PasteFImage.ILD.DibBitmap:=PBitmapInfo(GlobalLock(PasteHDib));
   CloseClipboard;
   FImage.PasteILD:=PasteFImage.ILD;
   FImage.Paint;
  end;
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.PasteTimerTimer(Sender: TObject);
begin
  PasteFromClipBtn.Enabled:=Clipboard.HasFormat(CF_DIB);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.FileListBox1Change(Sender: TObject);
var
   pExtension : string[4];
begin
     if FileExists(FileListBox1.FileName) Then Begin
       ilProgress.Position:=0;
       PasteFImage.ILD.DibBitmap:=nil;
       PasteHDib:=0;
       pExtension:=UpperCase(ExtractFileExt(FileListBox1.FileName));

       FImage.PasteILD:=Nil;

       if pExtension =  '.BMP' then begin
        BmpDib(FileListBox1.FileName,
               GetDeviceRes(PasteFImage.Canvas.Handle),
               0,
               @PasteHDib,
               HIPAL,
               LongInt(Self),
               ProgressCall);
       end;

       if pExtension =  '.PNG' then begin
        PngDib(FileListBox1.FileName,
               GetDeviceRes(PasteFImage.Canvas.Handle),
               0,
               @PasteHDib,
               HIPAL,
               LongInt(Self),
               ProgressCall);
       end;

       if pExtension =  '.GIF' then begin
        GifDib(FileListBox1.FileName,
               GetDeviceRes(PasteFImage.Canvas.Handle),
               0,
               @PasteHDib,
               HIPAL,
               LongInt(Self),
               ProgressCall);
       end;

       if pExtension =  '.PCX' then begin
        Pcxdib(FileListBox1.FileName,
               GetDeviceRes(PasteFImage.Canvas.Handle),
               0,
               @PasteHDib,
               HIPAL,
               LongInt(Self),
               ProgressCall);
       end;

       if pExtension =  '.JPG' then begin
        jpgdib(FileListBox1.FileName,
               GetDeviceRes(PasteFImage.Canvas.Handle),
               0,
               @PasteHDib,
               HIPAL,
               LongInt(Self),
               ProgressCall);
       end;

       if pExtension =  '.TIF' then begin
        Tifdib(FileListBox1.FileName,
               GetDeviceRes(PasteFImage.Canvas.Handle),
               0,
               0,
               @PasteHDib,
               LongInt(Self),
               ProgressCall);
       end;

       if pExtension =  '.PCD' then begin
        Pcddib(FileListBox1.FileName,
               GetDeviceRes(PasteFImage.Canvas.Handle),
               0,
               1,
               @PasteHDib,
               LongInt(Self),
               ProgressCall);
       end;

       if pExtension =  '.TGA' then begin
        Tgadib(FileListBox1.FileName,
               GetDeviceRes(PasteFImage.Canvas.Handle),
               0,
               PasteHDib,
               LongInt(Self),
               ProgressCall);
       end;

       if GlobalSize(PasteHDib) >0 then begin
         PasteFImage.ILD.DibBitmap:=PBitmapInfo(GlobalLock(PasteHDib));
         FImage.PasteILD:=PasteFImage.ILD;
         FImage.PaintPaste:=True;
         PasteFImage.Refresh;
         FImage.Refresh;
       end;
       
     end;
 end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.ScanSelectClick(Sender: TObject);
begin
     SelectTwainSource(Handle);
end;

{*********************************************************************

*********************************************************************}

procedure TFormEffect.ScanImageClick(Sender: TObject);
begin
  ilProgress.Position:=0;
  PasteFImage.ILD.DibBitmap:=nil;
  FImage.PasteILD:=Nil;
  PasteHDib:=0;
  ScanTwainDib (Handle,
                GetDeviceRes(PasteFImage.Canvas.Handle),
                0,
                0,
                HIPAL,
                @PasteHDib,
                LongInt(Self),
                ProgressCall);
  if GlobalSize(PasteHDib) >0 then begin
     PasteFImage.ILD.DibBitmap:=PBitmapInfo(GlobalLock(PasteHDib));
     FImage.PasteILD:=PasteFImage.ILD;
     FImage.PaintPaste:=True;
     PasteFImage.Refresh;
     FImage.Refresh;
  end;
end;


{******************************************************************************

******************************************************************************}
function TFormEffect.DisplayDC: hDC;
begin
  result := pbPalette.Canvas.Handle;
end;

{******************************************************************************

******************************************************************************}
procedure TFormEffect.Panel17MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     pbPaletteMouseDown(Sender, Button, Shift, X, Y);
end;

{******************************************************************************

******************************************************************************}
procedure TFormEffect.pbPaletteMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  r,c:       byte;
  PalEntry:  TPaletteEntry;
  hPal    :  hPalette;
begin
///
  r := Y div BoxDim.y;
  c := X div BoxDim.x;

  SelColor := byte(r * 16 + c);
//  showmessage(InttoStr(r)+' -- '+InttoStr(c));}
///  SelColor := byte(TrackBar1.Position);

  hPal:=0;
  if Assigned(FImage.MainDib) then
  if FImage.MainDib.DibBitmap <> nil then
      hPal := FImage.MainDib.Palette;

  if hPal <> 0 then
   if GetPaletteEntries(HPal, SelColor, 1, PalEntry) > 0 then begin
    selecting := True;
    trbRed.Position := PalEntry.peRed;
    trbGreen.Position := PalEntry.peGreen;
    trbBlue.Position := PalEntry.peBlue;

    RedPrevious := PalEntry.peRed;
    GreenPrevious := PalEntry.peGreen;
    BluePrevious := PalEntry.peBlue;

    selecting := False;
    TrackBarChange(trbRed);
    end;
end;

{******************************************************************************

******************************************************************************}

procedure TFormEffect.pbPalettePaint(Sender: TObject);
var
  r,c:        integer;      {row and column}
  colorindex: longint;
  Brush,
  OldBrush :  hBrush;
  Opal,
  hPal     :  hPalette;
begin
///
  Brush := 0;
  OldBrush := 0;
  Opal:=0;
  hPal:=0;

  if Assigned(FImage.MainDib) then
   if FImage.MainDib.DibBitmap <> nil then
    hPal := FImage.MainDib.Palette
   else
    hPal:=0;

  if hPal <> 0 then begin
   Opal:=SelectPalette(DisplayDC, hPal, False);
   RealizePalette(DisplayDC);
  end;

  for colorindex := 0 to 255 do begin
    r := colorindex div 16 + 1;
    c := colorindex mod 16 + 1;
    try
      Brush := CreateSolidBrush($01000000 or colorindex);
      OldBrush := SelectObject(DisplayDC, Brush);
      Rectangle( DisplayDC, ((c-1) * BoxDim.x) + 2, ((r-1) * BoxDim.y) + 2,
                                    c * BoxDim.x + 2, r * BoxDim.y + 2);
    finally
      SelectObject(DisplayDC, OldBrush);
      DeleteObject(Brush);
    end; {try}
    end; {for}

  if Opal <> 0 then
   SelectPalette(DisplayDC, Opal, False);

end; {pbPalette.OnPaint}


{******************************************************************************

******************************************************************************}

procedure TFormEffect.TrackBarChange(Sender: TObject);
var
  pPalEntry: PPaletteEntry;
  hPal     : hPalette;
begin
///
  if (not Selecting) then begin
    IsInPalette:=true;
    lblRed.Caption := 'Red: ' + IntToStr(trbRed.Position);
    lblGreen.Caption := 'Green: ' + IntToStr(trbGreen.Position);
    lblBlue.Caption := 'Blue: ' + IntToStr(trbBlue.Position);
    lblPalText.Caption := 'Color Index: ' + IntToStr(SelColor);

///    trbRed.Position := 255;
///    trbGreen.Position := 125;
///    trbBlue.Position := 125;
    pnlColor.Color := RGB(trbRed.Position, trbGreen.Position, trbBlue.Position);
//  pnlColor.Color := RGB(255, 125, 125);

    pPalEntry := new(PPaletteEntry);
    pPalEntry^.peRed := trbRed.Position;
    pPalEntry^.peGreen := trbGreen.Position;
    pPalEntry^.peBlue := trbBlue.Position;
    pPalEntry^.peFlags := PC_RESERVED;

    hPal:=0;
    if Assigned(FImage.MainDib) then
     if FImage.MainDib.DibBitmap <> nil then
      hPal := FImage.MainDib.Palette;

    if hPal <> 0 then
     AnimatePalette(hPal, SelColor, 1, pPalEntry);

     //SeqntDib.Palette:=hPal;
    Dispose(pPalEntry);
  end;

  pnlColorClick(Self);
end;

{******************************************************************************

******************************************************************************}
procedure TFormEffect.pnlColorClick(Sender: TObject);
var
  pPalEntry:  PPaletteEntry;
  hPal     :  hPalette;
begin
   pPalEntry:=nil;
    if Assigned(FImage.MainDib) then begin
     if FImage.MainDib.DibBitmap <> nil then
      hPal := FImage.MainDib.Palette
     else
     hPal:=0;
    try
      pPalEntry := new(PPaletteEntry);
      pPalEntry^.peRed := trbRed.Position;
      pPalEntry^.peGreen := trbGreen.Position;
      pPalEntry^.peBlue := trbBlue.Position;
      pPalEntry^.peFlags := 0;
      if hPal <> 0 then
        SetPaletteEntries(hPal, SelColor, 1, pPalEntry^);
      pbPalette.Repaint;
    finally
      Dispose(pPalEntry);
      FImage.MainDib.Palette:=hPal;
      FImage.Paint;
    end;
   end;
end;

{******************************************************************************

******************************************************************************}

procedure TFormEffect.PalOptClick(Sender: TObject);
var
 Oldpal,
 HPal : HPalette;
begin
  HPal:=0;
  Case PalCombo.ItemIndex of
    {Create GrayScale Palette and Optimize Image}
    0: begin
            Screen.Cursor:=crHourGlass;
            IsInPalette:=true;
            HPal:=CreateGrayPalette(FImage.MainDib.NumColors);
            Oldpal:=FImage.MainDib.Palette;
            FImage.Paint;
            pbPalette.Refresh;
            OptimizeDibPalette(HPal, GlobalHandle(FImage.MainDib.DibBitmap), LongInt(Self), ProgressCall);
            DeleteObject(Oldpal);
            FImage.MainDib.Palette:=HPal;
            FImage.Paint;
            pbPalette.Refresh;
            Screen.Cursor:=crDefault;
       end;
    {Load Palette from File and Optimize Image}
    1: begin
        if PalOpen.Execute then begin
          Screen.Cursor:=crHourGlass;
          IsInPalette:=true;
          HPal:=FImage.MainDib.Palette;
          LoadPaletteFromFile(PalOpen.Filename,HPal);
          FImage.Paint;
          pbPalette.Refresh;
          OptimizeDibPalette(HPal, GlobalHandle(FImage.MainDib.DibBitmap), LongInt(Self), ProgressCall);
          FImage.Paint;
          pbPalette.Refresh;
          Screen.Cursor:=crDefault;
        end;
       end;
    {Load Palette from File and Apply}
    2: begin
        if PalOpen.Execute then begin
          IsInPalette:=true;
          HPal:=FImage.MainDib.Palette;
          LoadPaletteFromFile(PalOpen.Filename,HPal);
          FImage.MainDib.Palette:=HPal;
          FImage.Paint;
          pbPalette.Refresh;
        end;
      end;
    {Save Palette to File}
    3: begin
        if PalSave.Execute then
          SavePaletteToFile(PalSave.Filename, FImage.MainDib.Palette, FImage.MainDib.NumColors);
       end;
  end;
end;

{******************************************************************************

******************************************************************************}

procedure TFormEffect.FXMethod(Sender: TObject);
Var
 DC : HDC;
begin
  DC:=GetDc(Panel5.Handle);
  FImage.Visible:=False;
  try
    if TRadioButton(Sender) = FXN then begin
     bFXN:=TRadioButton(Sender).Checked;
    end else
    if TRadioButton(Sender) = FXH then begin
     bFXH:=TRadioButton(Sender).Checked;
       FXSkipHorizontalDib(DC,
                           GlobalHandle(FImage.ILD.DibBitmap),
                           FFXColRowThick,
                           FFXDelay);
    end else
    if TRadioButton(Sender) = FXV then begin
     bFXV:=TRadioButton(Sender).Checked;
       FXSkipVerticalDib(DC,
                         GlobalHandle(FImage.ILD.DibBitmap),
                         FFXColRowThick,
                         FFXDelay);
    end else
    if TRadioButton(Sender) = FXD then begin
     bFXD:=TRadioButton(Sender).Checked;
       FXSkipDiagonalsDib(DC,
                          GlobalHandle(FImage.ILD.DibBitmap),
                          FFXColRowThick,
                          FFXDelay);
    end else
    if TRadioButton(Sender) = FXS then begin
     bFXS:=TRadioButton(Sender).Checked;
       FXSkipDiagonalSquaresDib(DC,
                                GlobalHandle(FImage.ILD.DibBitmap),
                                FFXColRowThick,
                                FFXDelay);
    end else
    if TRadioButton(Sender) = FXR then begin
     bFXR:=TRadioButton(Sender).Checked;
       FXSkipRectanglesDib(DC,
                           GlobalHandle(FImage.ILD.DibBitmap),
                           FFXDelay);
    end;
  finally
    ReleaseDc(Panel5.Handle, DC);
    FImage.Visible:=True;
  end;
end;

{******************************************************************************

******************************************************************************}

procedure TFormEffect.TrackBar1Change(Sender: TObject);
begin
FormEffect.pbPaletteMouseDown(Sender, mbRight, [ssAlt],  0, 0);
end;

end.

