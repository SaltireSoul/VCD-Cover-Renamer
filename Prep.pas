unit Prep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  XPMenu, StdCtrls, jpeg, CoolButton, ButtonComps, ExtCtrls, CoolForm;

type
  TFormPrep = class(TForm)
    Border: TShape;
    CoolForm: TCoolForm;
    lblHeader: TLabel;
    btnRenameFiles: TSelButton;
    lblNewFilename: TLabel;
    Label3: TLabel;
    memo1: TMemo;
    edNewFilename: TEdit;
    XPMenu: TXPMenu;
    btnClose: TCoolButton;
    OpenDialog: TOpenDialog;
    Label2: TLabel;
    btnBrowseFiles: TSelButton;
    Label1: TLabel;
    Memo2: TMemo;
    btnUpdateFilename: TSelButton;
    Label4: TLabel;
    edExtension: TEdit;
    cbCharBack: TComboBox;
    btnClear: TCoolButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnBrowseFilesClick(Sender: TObject);
    procedure btnRenameFilesClick(Sender: TObject);
    procedure btnUpdateFilenameClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnClearMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnClearMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbCharBackChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function DisplayNewFilename(i:integer):string;
    Procedure Clear;
  end;

var
  FormPrep: TFormPrep;

implementation

{$R *.DFM}

procedure TFormPrep.btnCloseClick(Sender: TObject);
begin
   Clear;
   ModalResult:=mrOK;
end;

procedure TFormPrep.btnBrowseFilesClick(Sender: TObject);
var i:integer;
begin
   if OpenDialog.Execute then begin
      for i:=0 to OpenDialog.Files.Count-1 do begin
         memo1.Lines.Add(OpenDialog.Files.Strings[i]);
      end;

      if memo1.lines.count <> 0 then begin
         edNewFilename.text:=ExtractFileName(DisplayNewFilename(0));
         for i:=0 to length(edNewFilename.text)-1 do begin
            cbCharBack.Items.Add(IntToStr(i));
         end;
      end;
   end;
end;

function TFormPrep.DisplayNewFilename(i: integer):string;
var newfilename,oldfilename,path:string;
    x,y,m:integer;
    temp:string;
begin
   oldfilename:=ExtractFilename(memo1.Lines.Strings[i]);
   path:=ExtractFilePath(memo1.Lines.Strings[i]);
   temp:='';

   if StrToInt(cbCharBack.text) >= length(oldfilename) then begin
      application.MessageBox('Sorry, But You cannot delete that many characters from the file','Yeah You',0);
      exit;
   end;

      x:=length(oldfilename)-StrToInt(cbCharBack.text);
      if oldfilename[x]='.' then x:=x-1;
      for y:=1 to x do begin
         temp:=temp+oldfilename[y];
      end;

      m:=length(temp);
      if temp[m]='.' then
        temp:=temp+edExtension.text
      else
        temp:=temp+'.'+edExtension.text;

      newfilename:=temp;

   Result:=path+newfilename;
end;

procedure TFormPrep.btnRenameFilesClick(Sender: TObject);
var i:integer;
    oldfilename, newfilename:string;
begin
   memo2.lines.Clear;
   for i:=0 to memo1.lines.Count-1 do begin
      oldfilename:=memo1.Lines.Strings[i];
      newfilename:=DisplayNewFilename(i);
      
      if RenameFile(oldfilename, newfilename) then begin
         Memo2.Lines.Add(newfilename);
      end;
   end;
end;

procedure TFormPrep.btnUpdateFilenameClick(Sender: TObject);
begin
   if memo1.lines.count <> 0 then
   edNewFilename.text:=ExtractFilename(DisplayNewFilename(0));
end;

procedure TFormPrep.btnClearClick(Sender: TObject);
begin
   Clear;
end;

procedure TFormPrep.btnClearMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
   var temp:tCoolButton;
begin
   temp:=tCoolButton(Sender);
   temp.Font.Color:=$006B482E;
end;

procedure TFormPrep.btnClearMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
   var temp:tCoolButton;
begin
   temp:=tCoolButton(Sender);
   temp.Font.Color:=clwhite;
end;

procedure TFormPrep.Clear;
begin
   memo1.Lines.Clear;
   edNewFilename.Text:='';
   edExtension.Text:='jpg';
   cbCharBack.Text:='3';
end;

procedure TFormPrep.cbCharBackChange(Sender: TObject);
begin
   btnUpdateFilenameClick(sender);
end;

end.
