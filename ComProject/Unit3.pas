unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Project1_TLB, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    procedure Edit1DblClick(Sender: TObject);
    procedure Edit2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  fileCo : ICopyFile;
implementation

{$R *.dfm}


procedure TForm3.Button1Click(Sender: TObject);
var
  c: Integer;
begin
 fileCo.Set_FileToCopy(Edit1.Text);
 fileCo.Set_FolderWhCopy(Edit2.Text);
 c:= fileCo.copy;
end;

procedure TForm3.Edit1DblClick(Sender: TObject);
begin
if OpenDialog1.Execute then
  Edit1.Text:=OpenDialog1.FileName;
end;

procedure TForm3.Edit2DblClick(Sender: TObject);
begin
if SaveDialog1.Execute then
  Edit2.Text:=SaveDialog1.FileName;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
fileCo:= CoCopyFile.Create;
end;

end.
