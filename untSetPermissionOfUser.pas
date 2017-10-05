unit untSetPermissionOfUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untMaster, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxSplitter,
  Data.DB, JvComponentBase, JvFormAutoSize, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, untUserGroup, untUsers, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxCheckBox, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, JvExExtCtrls, JvExtComponent, JvCaptionPanel,
  Data.SqlExpr, untMember, untMRPDM;

type
  TfrmSetPermissionOfUser = class(TfrmMaster)
    Panel1: TPanel;
    cxSplitter1: TcxSplitter;
    Panel2: TPanel;
    pnlMembers: TJvCaptionPanel;
    pnlAllUsers: TJvCaptionPanel;
    cxSplitter2: TcxSplitter;
    grdMembers: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    colUserID: TcxGridDBColumn;
    colUserFullName: TcxGridDBColumn;
    Panel3: TPanel;
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure MemberGroupClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    FCurrentUserGroup: integer;
    procedure SetCurrentUserGroup(const Value: integer);
    procedure AddMember(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
    property CurrentUserGroup: integer read FCurrentUserGroup write SetCurrentUserGroup;
  end;

var
  frmSetPermissionOfUser: TfrmSetPermissionOfUser;
  frmUserGroup: TfrmUserGroup;
  frmUsers: TfrmUsers;
  frmMember: tfrmMember;

implementation

{$R *.dfm}


uses untSnapDM;

procedure TfrmSetPermissionOfUser.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSetPermissionOfUser.btnDeleteClick(Sender: TObject);
var
  s: string;
begin
  s := 'DELETE FROM USGROUPMEMBERS WHERE USER_ID=' + FormDataSet.FieldByName('User_id').AsString
    + ' AND GROUP_ID=' + frmUserGroup.FormDataSet.FieldByName('GROUP_ID').AsString;
  proxy.SQLExecute(s);

  SetSQLText('SELECT U.*,M.GROUP_ID from USNAME U, USGroupMembers M '
    + ' WHERE U.USER_ID = M.USER_ID AND M.GROUP_ID=' + frmUserGroup.FormDataSet.FieldByName('GROUP_ID').AsString);
end;

procedure TfrmSetPermissionOfUser.btnSaveClick(Sender: TObject);
var
  s: string;
begin
  s := 'INSERT INTO USGROUPMEMBERS (GROUP_ID,USER_ID) VALUES ('
    + frmUserGroup.FormDataSet.FieldByName('GROUP_ID').AsString + ',' + frmUsers.FormDataSet.FieldByName('User_Id').AsString + ')';

  proxy.SQLExecute(s);

  SetSQLText('SELECT U.*,M.GROUP_ID from USNAME U, USGROUPMEMBERS M '
    + ' WHERE U.USER_ID = M.USER_ID AND M.GROUP_ID=' + frmUserGroup.FormDataSet.FieldByName('GROUP_ID').AsString);
end;

procedure TfrmSetPermissionOfUser.FormCreate(Sender: TObject);
var
  AHandled: THandle;
  s: string;
begin
  FormDataSet.RemoteServer:= DM.RemoteServ;
  frmUserGroup := TfrmUserGroup.Create(Panel1);
  frmUserGroup.GroupCode:=100000;
  frmUserGroup.GroupFormName:='Permission Group';

  frmUserGroup.ManualDock(Panel1, nil, alClient);
  frmUserGroup.Visible := True;
  frmUserGroup.Align := alClient;

  frmUserGroup.grdGroup.OnCellClick := MemberGroupClick;

  frmUsers := TfrmUsers.Create(pnlAllUsers);

  frmUsers.ManualDock(pnlAllUsers, Nil, alClient);
  frmUsers.Visible := True;
  frmUsers.Align := alClient;
  frmUsers.pnlUserDetail.Hide;
  frmUsers.pnlBottom.Hide;

  grdMembers.Styles.StyleSheet:= DM.StDefault;

end;

procedure TfrmSetPermissionOfUser.AddMember(Sender: TObject);
begin

end;

procedure TfrmSetPermissionOfUser.MemberGroupClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  CurrentUserGroup := frmUserGroup.FormDataSet.FieldByName('group_id').AsInteger;
  pnlMembers.Caption:= 'Members of '+frmUserGroup.FormDataSet.FieldByName('group_name').AsString+' group';
end;

procedure TfrmSetPermissionOfUser.SetCurrentUserGroup(const Value: integer);
var
  s: string;
  i: integer;
begin
  FCurrentUserGroup := Value;
  s := 'SELECT U.* from USNAME U, USGroupMembers M ' +
    ' WHERE U.USER_ID = M.USER_ID AND M.GROUP_ID =' + IntToStr(CurrentUserGroup);
  FormDataSet.Data := FormDataSet.DataRequest(s);
  btnSave.Enabled := True;
end;

end.
