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

unit U_p_size;

{Includes settings to compile in either 16 or 32 bit}
{$I DEFILIB.INC}

interface

uses
{$IFDEF DEL32}
  Windows,
{$ELSE}
  WinTypes,
  WinProcs,
{$ENDIF}
  Classes,
  Graphics,
  Forms,
  Controls,
  Buttons,
  StdCtrls,
  ExtCtrls,
  Spin;

type
  TPrintersize = class(TForm)
    OKBtn: TBitBtn;
    Bevel1: TBevel;
    WidthSpinEdit: TSpinEdit;
    HeigthSpinEdit: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    BitBtn1: TBitBtn;
    CB1: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
  private
    { Private declarations }
    bwt, bht : integer;
  public
    { Public declarations }
  end;

var
  Printersize: TPrintersize;

implementation

{$R *.DFM}

procedure TPrintersize.FormActivate(Sender: TObject);
begin
 bwt:= WidthSpinEdit.Value;
 bht:=HeigthSpinEdit.Value;
end;


procedure TPrintersize.RadioButton1Click(Sender: TObject);
begin
 HeigthSpinEdit.Value:=bht;
 WidthSpinEdit.Value:=bwt;
end;

procedure TPrintersize.RadioButton2Click(Sender: TObject);
begin
 HeigthSpinEdit.Value:=bht*2;
 WidthSpinEdit.Value:=bwt*2;
end;

procedure TPrintersize.RadioButton3Click(Sender: TObject);
begin
 HeigthSpinEdit.Value:=bht*3;
 WidthSpinEdit.Value:=bwt*3;
end;

procedure TPrintersize.RadioButton4Click(Sender: TObject);
begin
 HeigthSpinEdit.Value:=bht*4;
 WidthSpinEdit.Value:=bwt*4;
end;

procedure TPrintersize.RadioButton5Click(Sender: TObject);
begin
 HeigthSpinEdit.Value:=bht*5;
 WidthSpinEdit.Value:=bwt*5;
end;

procedure TPrintersize.RadioButton6Click(Sender: TObject);
begin
 HeigthSpinEdit.Value:=bht*6;
 WidthSpinEdit.Value:=bwt*6;
end;

end.
