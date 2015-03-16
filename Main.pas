unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  XPMenu, StdCtrls, ButtonComps, ComCtrls, CoolButton, Menus, ExtCtrls,
  CoolForm, Results, FileCtrl;

type
  TMainForm = class(TForm)
    listin: TMemo;
    listout: TMemo;
    XPMenu: TXPMenu;
    edNewFileName: TEdit;
    lblNewFilename: TLabel;
    lblHeader: TLabel;
    btnRename: TSelButton;
    btnBrowse: TSelButton;
    btnClose: TCoolButton;
    btnMinimize: TCoolButton;
    OpenDialog: TOpenDialog;
    edFilename: TEdit;
    lblFilename: TLabel;
    btnBack: TCoolButton;
    btnForward: TCoolButton;
    Label3: TLabel;
    edSeperator: TEdit;
    lblSeperator: TLabel;
    lblDefaultText: TLabel;
    edDefaultText: TEdit;
    lblcount: TLabel;
    lblNumFiles: TLabel;
    lblFileNum: TLabel;
    lblFileNumCount: TLabel;
    lblNewSeperator: TLabel;
    edNewSeperator: TEdit;
    cbSeries: TComboBox;
    lblSeries: TLabel;
    cbSeason: TComboBox;
    lblEpisodes: TLabel;
    lblNumEpisodes: TLabel;
    CoolForm: TCoolForm;
    backin: TMemo;
    frontin: TMemo;
    btnClear: TCoolButton;
    edfront: TEdit;
    lblfront: TLabel;
    edback: TEdit;
    lblback: TLabel;
    myfiles: TFileListBox;
    mydir: TDirectoryListBox;
    btnAbout: TCoolButton;
    Border: TShape;
    lblSeason: TLabel;
    btnPrepFiles: TSelButton;
    procedure btnMinimizeClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure btnRenameClick(Sender: TObject);
    procedure listinChange(Sender: TObject);
    procedure cbSeriesChange(Sender: TObject);
    procedure cbSeasonChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OnMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnClearClick(Sender: TObject);
    procedure btnForwardClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrepFilesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DisplayCFilename;
    procedure Renamefiles;
    function  FrontBack(filename:string):string;
    procedure Sort;
    procedure Split(side:string);
    procedure Clear;
    Procedure ShowFolders;
    Procedure ShowFiles;
  end;

const
  myFolder='\Listings\';

var
  MainForm: TMainForm;

  Count:integer=0;
  frontcovers:boolean=false;

  CurPath: string;
  PrePath: string;
  Path:    string;

implementation

uses About, Prep;

{$R *.DFM}
procedure TMainForm.btnMinimizeClick(Sender: TObject);
begin
   application.Minimize;
end;

procedure TMainForm.btnCloseClick(Sender: TObject);
begin
   application.Terminate;
end;

procedure TMainForm.listinChange(Sender: TObject);
begin
   DisplayCFilename;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
   lblNumEpisodes.Caption:=IntToStr(listout.Lines.Count);
end;

procedure TMainForm.btnBrowseClick(Sender: TObject);
var i:integer;
begin
   if OpenDialog.Execute then begin
      lblcount.Caption:=IntToStr(OpenDialog.Files.Count);

      for i:=0 to OpenDialog.Files.Count-1 do begin
         listin.Lines.Add(OpenDialog.Files.Strings[i]);
      end;

      inc(Count);
      lblFileNumCount.caption:=IntToStr(Count);
      displaycfilename;
   end;
   sort;
   split(edback.text);
   split(edfront.text);
end;


procedure TMainForm.displaycfilename;
var new,temp,ext,myseason:string;
begin
   if not frontcovers then begin
      edFilename.text:=ExtractFileName(backin.Lines.Strings[Count-1]);
      if count<10 then temp:='0'+IntToStr(count)
      else temp:=IntToStr(count);

      myseason:=ChangeFileExt(cbSeason.text,'');
      //SetLength(myseason,Length(myseason)-4);

      ext:=ExtractFileExt(backin.Lines.Strings[count-1]);
      new:=cbSeries.Text + ' ' + edDefaultText.Text + ' ' + myseason + temp + ' - ' + listout.Lines.Strings[count-1] + ' - ' + 'Back' + ext;
      edNewFileName.Text:=new;
   end
   else begin
      edFilename.text:=ExtractFileName(frontin.Lines.Strings[Count-1]);
      if count<10 then temp:='0'+IntToStr(count)
      else temp:=IntToStr(count);

      myseason:=cbSeason.text;
      SetLength(myseason,Length(myseason)-4);

      ext:=ExtractFileExt(frontin.Lines.Strings[count-1]);
      new:=cbSeries.Text + ' ' +  edDefaultText.Text + ' ' + myseason + temp + ' - ' + listout.Lines.Strings[count-1] + ' - ' + 'Front' + ext;
      edNewFileName.Text:=new;
   end;
end;


procedure TMainForm.btnRenameClick(Sender: TObject);
begin
   if Application.MessageBox('Please make sure your Front & Back text is correct then press OK to continue','Error Prevention', MB_OKCANCEL + MB_DEFBUTTON1) = IDOK then begin
      if ((backin.Lines.Count>0) and (frontin.Lines.Count>0)) then begin
         displaycfilename;
         renamefiles;
      end
      else begin
         Application.MessageBox('No Covers to Rename!','Yeah You!',0);
      end;
   end;
end;

procedure TMainForm.Renamefiles;
var
   oldfilename,newfilename:string;
   i:integer;
   new, temp, ext, myseason:string;
begin
   myseason:=cbSeason.text;
   SetLength(myseason,Length(myseason)-4);

   for i:=0 to backin.Lines.Count-1 do begin
      oldfilename:=backin.Lines.Strings[i];

      //Construct New File Name
      edfilename.Text:=ExtractFileName(backin.lines.strings[i]);
      if i+1<10 then temp:='0'+IntToStr(i+1)
      else temp:=IntToStr(i+1);

      ext:=ExtractFileExt(backin.lines.strings[i]);
      new:=cbSeries.Text + ' ' + edDefaultText.Text + ' ' + myseason + temp + ' - ' + listout.Lines.Strings[i] + ' - ' + 'Back' + ext;

      newfilename:=new;
      newfilename:=ExtractFilePath(oldfilename)+newfilename;

      //ReName Back Files
      if RenameFile(oldfilename, newfilename) then begin
         //RenameForm.Memo.Lines.Add(new + ' - Success');
      end
      else
      begin
         RenameForm.Memo.Lines.Add(new + ' - Unable To Change Name');
      end;
   end;

   
   for i:=0 to frontin.Lines.Count-1 do begin
      oldfilename:=frontin.Lines.Strings[i];

      //Construct New File Name
      edfilename.Text:=ExtractFileName(frontin.lines.strings[i]);
      if i+1<10 then temp:='0'+IntToStr(i+1)
      else temp:=IntToStr(i+1);

      ext:=ExtractFileExt(frontin.lines.strings[i]);
      new:=cbSeries.Text + ' ' + edDefaultText.Text + ' ' + myseason + temp + ' - ' + listout.Lines.Strings[i] + ' - ' + 'Front' + ext;

      newfilename:=new;
      newfilename:=ExtractFilePath(oldfilename)+newfilename;

      //ReName Front Files
      if RenameFile(oldfilename, newfilename) then begin
         //RenameForm.Memo.Lines.Add(new + ' - Success');
      end
      else begin
         RenameForm.Memo.Lines.Add(new + ' - Unable To Change Name');
      end;
   end;
   RenameForm.Show;
   Clear;
end;

function TMainForm.FrontBack(filename: string): string;
var i,x,pos:integer;
    temp,front,back:string;
begin
   x:=length(filename)-4;
   temp:='';
   front:=edfront.text;
   back:=edback.text;

   pos:=length(edback.text);
   for i:=x-pos+1 to x do begin
      temp:=temp+filename[i];
   end;
   if lowercase(temp)=lowercase(back) then begin
      result:=temp;
      exit;
   end;

   pos:=length(edfront.text);
   temp:='';
   for i:=x-pos+1 to x do begin
      temp:=temp+filename[i];
   end;
   if lowercase(temp)=lowercase(front) then begin
      result:=temp;
      exit;
   end;

   result:='Error';
end;

procedure TMainForm.cbSeriesChange(Sender: TObject);
begin
   ShowFiles;
   cbSeasonChange(Sender);
end;

procedure TMainForm.cbSeasonChange(Sender: TObject);
var tmp:string;
begin
   tmp:=Path+cbSeries.Items.Strings[cbSeries.ItemIndex]+ '\' +cbSeason.Items.Strings[cbSeason.ItemIndex];
   listout.Lines.LoadFromFile(tmp);
   lblNumEpisodes.Caption:=IntToStr(listout.Lines.Count);
   DisplayCFilename;
end;

procedure TMainForm.Sort;
var i:integer;
    temp:string;
begin
   for i:=0 to listin.lines.count-2 do begin
      if listin.Lines.Strings[i+1]<listin.Lines.Strings[i] then begin
         temp:=listin.Lines.Strings[i+1];
         listin.Lines.Strings[i+1]:=listin.Lines.Strings[i];
         listin.Lines.Strings[i]:=temp;
      end;
   end;

   if listin.lines.Strings[listin.lines.count-2]<listin.lines.Strings[0] then begin
      listin.lines.Insert(0,listin.lines.Strings[listin.lines.count-2]);
      listin.Lines.Move(listin.lines.count-1,listin.lines.count-2);
      listin.Lines.Delete(listin.lines.count-1);;
   end;
end;

procedure TMainForm.split(side: string);
var i:integer;
begin
   for i:=0 to listin.Lines.Count-1 do begin
      if lowercase(FrontBack(listin.Lines.Strings[i])) = lowercase(side) then begin
         if lowercase(side)=lowercase(edback.text) then backin.Lines.Add(listin.Lines.Strings[i])
         else if lowercase(side)=lowercase(edfront.text) then frontin.Lines.Add(listin.lines.strings[i]);
      end;
   end;
end;

procedure TMainForm.OnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
   var temp:tCoolButton;
begin
   temp:=tCoolButton(Sender);
   temp.Font.Color:=$006B482E;
end;

procedure TMainForm.OnMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
   var temp:tCoolButton;
begin
   temp:=tCoolButton(Sender);
   temp.Font.Color:=clwhite;
end;

procedure TMainForm.btnClearClick(Sender: TObject);
begin
   Clear;
end;

procedure TMainForm.Clear;
begin
   listin.Lines.Clear;
   lblFileNumCount.Caption:='0';
   Count:=0;
   edfilename.Text:='';
   lblcount.Caption:='0';
   backin.lines.Clear;
   frontin.Lines.Clear;
   edNewFileName.Text:='';
   frontcovers:=false;
end;

procedure TMainForm.btnForwardClick(Sender: TObject);
begin
   if ((backin.Lines.Count<=0) or (frontin.Lines.Count<=0)) then begin
      Application.MessageBox('No Can Do, Can''t Go Any Further!','Yeah You!',0);
      exit;
   end
   else if ((frontcovers=false) and (count>backin.Lines.Count-1)) then begin
      frontcovers:=true;
      count:=0;
   end
   else if ((frontcovers=true) and (count>frontin.Lines.Count-1)) then begin
      Application.MessageBox('No Can Do, Can''t Go Any Further!','Yeah You!',0);
      exit;
   end;

   inc(count);
   DisplayCFilename;
end;

procedure TMainForm.btnBackClick(Sender: TObject);
begin
   if ((backin.Lines.Count<=0) or (frontin.Lines.Count<=0)) then begin
      Application.MessageBox('No Can Do, Can''t Go Any Further!','Yeah You!',0);
      exit;
   end
   else if ((frontcovers=true) and (count=1)) then begin
      frontcovers:=false;
      count:=backin.Lines.Count;
      DisplayCFilename;
      Exit;
   end
   else if ((frontcovers=false) and (count=1)) then begin
      Application.MessageBox('No Can Do, Can''t Go Any Further!','Yeah You!',0);
      exit;
   end;

   dec(count);
   DisplayCFilename;
end;

procedure TMainForm.ShowFiles;
var i:integer;
begin
  //Shows The Files in the Combo Box
  PrePath := Path + cbSeries.Items.Strings[cbSeries.ItemIndex];
  myfiles.ApplyFilePath(Path+cbSeries.Items.Strings[cbSeries.ItemIndex]);
  myfiles.Update;
  cbSeason.Items.Clear;
  cbSeason.Items.Text := myfiles.Items.Text;
  for i := 0 to myfiles.ItemIndex do cbSeason.Items.Delete(0);
  cbSeason.ItemIndex := 0;
end;

procedure TMainForm.ShowFolders;
var i:integer;
begin
  //Shows the Folders in the Combo Box
  mydir.Directory := Path;
  cbSeries.Items.Text := mydir.Items.Text;
  for i := 0 to mydir.ItemIndex do cbSeries.Items.Delete(0);
  cbSeries.ItemIndex := 0;
end;

procedure TMainForm.btnAboutClick(Sender: TObject);
begin
  AboutForm.Showmodal;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Path:=CurPath + myFolder;
  ShowFolders;
  ShowFiles;
  cbSeasonChange(Sender);
end;

procedure TMainForm.btnPrepFilesClick(Sender: TObject);
begin
   FormPrep.Showmodal;
end;

initialization
  CurPath := GetCurrentDir;
end.
