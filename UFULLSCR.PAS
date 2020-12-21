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

unit Ufullscr;

{Includes settings to compile in either 16 or 32 bit}
{$I DEFILIB.INC}

interface

uses
  SysUtils,
{$IFDEF DEL32}
  Windows,
{$ELSE}
  WinTypes,
  WinProcs,
{$ENDIF}
  Messages,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Buttons,
  ExtCtrls,
  TMultip;    {PMultiImage VCL component}

type
  TFullSlide = class(TForm)
    MultiImage1: TPMultiImage;
    procedure ImageClick(Sender: TObject);
    procedure MultiImage1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure MultiImage1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FullSlide: TFullSlide;

implementation

{$R *.DFM}

{-------------------------------------------------------------------------}
{---------------------------------------------------------------------}

procedure TFullSlide.ImageClick(Sender: TObject);
begin
  fullslide.close;
end;

procedure TFullSlide.MultiImage1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 ImageClick(Sender);
end;

procedure TFullSlide.FormShow(Sender: TObject);
begin
  SetBounds(0,0,screen.width,screen.height);
  MultiImage1.top:=0;
  MultiImage1.left:=0;
  MultiImage1.height:=screen.height;
  MultiImage1.width:=screen.width;
end;

procedure TFullSlide.MultiImage1Click(Sender: TObject);
begin
   ImageClick(sender);
end;

end.


