unit fMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    Separator1: TMenuItem;
    Open1: TOpenDialog;
    Save1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  Open1.InitialDir := GetCurrentDir;
  if Open1.Execute then
  begin
    Image1.Picture.LoadFromFile(Open1.FileName);
    Image1.Show;
  end
  else
    ShowMessage('Ничего не выбрано!');
  Image1.Show;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  str: String; //путь к файлу
  i: Integer;
begin

  if(ParamCount > 0) then
    begin
      str := ParamStr(1);
      for i := 2 to ParamCount do
        str := str + ' ' + ParamStr(i);
      Image1.Picture.LoadFromFile(str);
      Image1.Show;
    end;

end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  if Save1.Execute then
    Image1.Picture.SaveToFile(Save1.FileName)
  else
    ShowMessage('Не сохранено!');
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  Image1.Hide; //прячем
end;

end.

