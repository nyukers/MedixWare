program uziscan;

uses
  Forms,
  main1 in 'main1.pas' {FormMain},
  Ufullscr in 'Ufullscr.pas' {FullSlide},
  U_p_size in 'U_p_size.pas' {Printersize},
  video in 'video.pas' {FormVideo},
  about in 'about.pas' {AboutBox},
  files in 'files.pas' {FormFileBMP},
  Psw in 'Psw.pas' {PDlg},
  tobase in 'tobase.pas' {FormFrame2Base},
  data in 'data.pas' {DataModule1: TDataModule},
  view in 'view.pas' {FormView},
  dovidnik in 'dovidnik.pas' {FormDovidka},
  protocol in 'protocol.pas' {FormProtocol},
  select in 'select.pas' {FormSelectBase},
  image1 in 'image1.pas' {FormImage},
  rolik in 'rolik.pas' {FormRolikParam},
  filter in 'filter.pas' {FormEffect},
  jws99 in '..\..\J\jws99.pas',
  inter in 'inter.pas' {FormInter},
  image2 in 'image2.pas' {FormImageInfo},
  arc in 'arc.pas' {FormArc},
  anograf in 'anograf.pas' {FormAnograf},
  chart1 in 'chart1.pas' {FormChart},
  Select2 in 'Select2.pas' {FormSelectDovidBase},
  export1 in 'export1.pas' {FormExport1},
  Qrorder0 in 'Qrorder0.pas' {FormQReport0: TQuickRep},
  Qrorder1 in 'Qrorder1.pas' {FormQReport1: TQuickRep},
  Qrorder2 in 'Qrorder2.pas' {FormQReport2: TQuickRep},
  Qrorder3 in 'Qrorder3.pas' {FormQReport3: TQuickRep},
  Qrorder4 in 'Qrorder4.pas' {FormQReport4: TQuickRep},
  quest in 'quest.pas' {FormQuest},
  Psw2 in 'Psw2.pas' {PDlg2};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'MedixWare 2000';
  Application.HelpFile := 'uzi.HLP';
  Application.CreateForm(TPDlg, PDlg);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFormFileBMP, FormFileBMP);
  Application.CreateForm(TFormImageInfo, FormImageInfo);
  Application.CreateForm(TFormSelectBase, FormSelectBase);
  Application.CreateForm(TFormSelectDovidBase, FormSelectDovidBase);
  Application.CreateForm(TPDlg2, PDlg2);
  Application.Run;
end.
