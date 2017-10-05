unit untSetPermissionOfgroup;

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
  TfrmSetPermissionOfgroup = class(TfrmMaster)
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
  frmSetPermissionOfgroup: TfrmSetPermissionOfgroup;
  frmUserGroup,frmUserGroup2: TfrmUserGroup;
  frmMember: tfrmMember;

implementation

{$R *.dfm}


uses untSnapDM;

procedure TfrmSetPermissionOfgroup.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSetPermissionOfgroup.btnDeleteClick(Sender: TObject);
var
  s: string;
begin
  s := 'DELETE FROM USGROUPMEMBERS WHERE USER_ID=' + FormDataSet.FieldByName('GROUP_ID').AsString
    + ' AND GROUP_ID=' + frmUserGroup.FormDataSet.FieldByName('GROUP_ID').AsString;
  proxy.SQLExecute(s);

  CurrentUserGroup := frmUserGroup.FormDataSet.FieldByName('GROUP_ID').AsInteger;
end;

procedure TfrmSetPermissionOfgroup.btnSaveClick(Sender: TObject);
var
  s: string;
begin
  s := 'INSERT INTO USGROUPMEMBERS (GROUP_ID,USER_ID) VALUES ('
    + frmUserGroup.FormDataSet.FieldByName('GROUP_ID').AsString + ',' + frmUserGroup2.FormDataSet.FieldByName('GROUP_ID').AsString + ')';

  proxy.SQLExecute(s);

  SetSQLText('SELECT U.*,M.GROUP_ID UGROUP_ID from USGROUP U, USGROUPMEMBERS M '
    + ' WHERE U.GROUP_ID = M.USER_ID AND M.GROUP_ID=' + frmUserGroup.FormDataSet.FieldByName('GROUP_ID').AsString);
end;

procedure TfrmSetPermissionOfgroup.FormCreate(Sender: TObject);
var
  AHandled: THandle;
  Chk, F1, F2: TField;
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


  frmUserGroup2:= TfrmUserGroup.Create(Panel1);
  frmUserGroup2.GroupCode:=900000;
  frmUserGroup2.GroupFormName:='User Group';

  frmUserGroup2.ManualDock(pnlAllUsers, nil, alClient);
  frmUserGroup2.Visible := True;
  frmUserGroup2.Align := alClient;
  frmUserGroup2.pnlBottom.Hide;
  frmUserGroup2.pnlUserDetail.Hide;

  grdMembers.Styles.StyleSheet:= DM.StDefault;
  pnlAllUsers.Caption:='All User Group';
end;

procedure TfrmSetPermissionOfgroup.AddMember(Sender: TObject);
begin

end;

procedure TfrmSetPermissionOfgroup.MemberGroupClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  CurrentUserGroup := frmUserGroup.FormDataSet.FieldByName('GROUP_ID').AsInteger;
  pnlMembers.Caption:= 'Members of '+frmUserGroup.FormDataSet.FieldByName('group_name').AsString+' group';
end;

procedure TfrmSetPermissionOfgroup.SetCurrentUserGroup(const Value: integer);
var
  s: string;
begin
  FCurrentUserGroup := Value;
  s := 'SELECT U.*,M.GROUP_ID UGROUP_ID from USGROUP U, USGROUPMEMBERS M ' +
    ' WHERE U.GROUP_ID = M.USER_ID AND M.GROUP_ID =' + frmUserGroup.FormDataSet.FieldByName('GROUP_ID').AsString;
  FormDataSet.Data := FormDataSet.DataRequest(s);
  btnSave.Enabled := True;
end;

end.
