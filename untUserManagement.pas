unit untUserManagement;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls;

type
  TfrmUserManagement = class(TForm)
    PgMainUser: TPageControl;
    TabUsers: TTabSheet;
    TabGroups: TTabSheet;
    TabRoles: TTabSheet;
    TabPermission: TTabSheet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUserManagement: TfrmUserManagement;

implementation

{$R *.dfm}

end.
