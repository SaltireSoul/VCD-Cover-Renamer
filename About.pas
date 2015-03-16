unit About;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, CoolForm, ButtonComps, StdCtrls, XPMenu, CoolButton, ShellAPI,
  jpeg;

type
  TAboutForm = class(TForm)
    CoolForm: TCoolForm;
    lblHeader: TLabel;
    btnReturn: TSelButton;
    listin: TMemo;
    ed1: TEdit;
    lbl1: TLabel;
    XPMenu: TXPMenu;
    btnWebsite: TCoolButton;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    btnEmail: TCoolButton;
    Border: TShape;
    Label4: TLabel;
    Label5: TLabel;
    logo: TImage;
    procedure btnReturnClick(Sender: TObject);
    procedure btnWebsiteClick(Sender: TObject);
    procedure btnWebsiteMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnWebsiteMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnEmailClick(Sender: TObject);
    procedure logoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

implementation

{$R *.DFM}

procedure TAboutForm.btnReturnClick(Sender: TObject);
begin
   ModalResult:=mrOK;
end;

procedure TAboutForm.btnWebsiteClick(Sender: TObject);
begin
   ShellExecute(handle, 'open', pChar(btnWebsite.caption) , NIL, NIL, SW_SHOWNORMAL);
end;

procedure TAboutForm.btnEmailClick(Sender: TObject);
begin
  //ShellExecute(handle, 'open', 'mailto:', NIL, NIL, SW_SHOWNORMAL);
end;

procedure TAboutForm.logoClick(Sender: TObject);
begin
   //ShellExecute(handle, 'open', 'http://www.archtechnologies.co.uk/', NIL,NIL, SW_SHOWNORMAL);
end;

procedure TAboutForm.btnWebsiteMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
   var temp:tCoolButton;
begin
   temp:=tCoolButton(Sender);
   temp.Font.Color:=$00A56E3A;
end;

procedure TAboutForm.btnWebsiteMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
   var temp:tCoolButton;
begin
   temp:=tCoolButton(Sender);
   temp.Font.Color:=clWhite;
end;

end.
