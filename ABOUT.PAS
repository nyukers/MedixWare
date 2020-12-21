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

unit about;

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
  StdCtrls,
  Buttons,
  ExtCtrls,
  sysutils,
  Tmultip,
  shellapi, Animate, GIFCtrl;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    PMultiImage1  : TPMultiImage;
    Timer1 : TTimer;
    Label2: TLabel;
    Label7: TLabel;
    Image2: TImage;
    RxGIFAnimator1: TRxGIFAnimator;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel1Click(Sender: TObject);
    procedure Label7DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.DFM}

procedure TAboutBox.Timer1Timer(Sender: TObject);
begin
	PMultiImage1.Trigger;
end;

procedure TAboutBox.FormCreate(Sender: TObject);
begin
   {Create A credit message on the fly}
    PMultiImage1.FreeMsg(True);
   {Clear Message text if any}
    PMultiImage1.CreditBoxList.Clear;
   {Define Message text}
    PMultiImage1.CreditBoxList.Add(' MedixWare 2000, ver 1.01 ');
    PMultiImage1.CreditBoxList.Add(' Johnt Win Service, (C)opyright 1994 - 2001. ');
    PMultiImage1.CreditBoxList.Add(' Call (8-0432) 43-66-45.       ');
    PMultiImage1.CreditBoxList.Add(' Another medical services are :  ');
    PMultiImage1.CreditBoxList.Add(' "Форма 20" для стаціонару             ');
    PMultiImage1.CreditBoxList.Add(' "Тепловізор Р5" для КФД                  ');
    PMultiImage1.CreditBoxList.Add(' "Dentist-Station" для лікаря-стоматолога');
    PMultiImage1.CreditBoxList.Add(' "Картотека" для малого МЗ             ');
    {set Message font name;  Note you could do this also with a font dialog}
    PMultiImage1.MsgFont.Name := 'Times New Roman';
   {set Message font size}
    PMultiImage1.MsgFont.Size := -11;
   {set Message speed from 0 is fast to 10 is slow}
    PMultiImage1.MsgSpeed := 0;
   {set Message background. Note you could do this also with a color dialog}
    PMultiImage1.MsgBkGrnd := clWhite;
    {font color}
    PMultiImage1.MsgFont.Color := clBlack;
   {SUBMIT THE MESSAGE}
    PMultiImage1.NewCreditMessage;
//    Timer1.Enabled := True;
end;


procedure TAboutBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//   Action:=caFree;
//   AboutBox:=nil;
end;

//initialization
//  AboutBox:=nil;
procedure TAboutBox.Panel1Click(Sender: TObject);
begin
Close;
end;

procedure TAboutBox.Label7DblClick(Sender: TObject);
begin
 ShellExecute
 (Application.Handle,'open','mailto:nyuk@narod.ru',nil,nil,0);
end;

end.







