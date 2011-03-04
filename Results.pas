unit Results;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CoolButton, ExtCtrls, CoolForm, XPMenu, StdCtrls, TrMemo;

type
  TRenameForm = class(TForm)
    btnClose: TCoolButton;
    XPMenu: TXPMenu;
    CoolForm: TCoolForm;
    Border: TShape;
    lblHeader: TLabel;
    Memo: TMemo;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RenameForm: TRenameForm;

implementation

{$R *.DFM}

procedure TRenameForm.btnCloseClick(Sender: TObject);
begin
   Memo.Lines.Clear;
   Close;
end;

procedure TRenameForm.FormShow(Sender: TObject);
begin
   if Memo.Lines.Count<=0 then Memo.Lines.Add('All Files Renamed Successfully');
end;

end.
