unit files;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TFormFileBMP = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ComboBox2: TComboBox;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFileBMP: TFormFileBMP;

implementation

{$R *.DFM}

procedure TFormFileBMP.FormCreate(Sender: TObject);
begin
ComboBox1.ItemIndex:=3;
ComboBox2.ItemIndex:=0;
end;

end.
