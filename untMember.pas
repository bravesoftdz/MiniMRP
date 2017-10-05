unit untMember;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untMaster, Data.DB, Datasnap.DBClient, JvComponentBase, JvFormAutoSize, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TfrmMember = class(TfrmMaster)
    grdMember: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    procedure btnNewClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FMemberGroup: Integer;
    FUserID: Integer;
    procedure SetMemberGroup(const Value: Integer);
    procedure SetUserID(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    Property MemberGroup: Integer read FMemberGroup write SetMemberGroup;
    property UserID: Integer read FUserID write SetUserID;
  end;

var
  frmMember: TfrmMember;

implementation

{$R *.dfm}

uses untMRPDM;

{ TfrmMaster1 }

procedure TfrmMember.btnDeleteClick(Sender: TObject);
begin
//
end;

procedure TfrmMember.btnNewClick(Sender: TObject);
var
  S:string;
begin
  S:='INSERT INTO USGROUPMEMBERS (GROUP_ID,USER_ID) VALUES ('
  +IntToStr(MemberGroup)+','+IntToStr(UserID)+')';

  proxy.SQLExecute(S);
  frmMember.MemberGroup:=MemberGroup;
end;

procedure TfrmMember.FormCreate(Sender: TObject);
begin
  inherited;
  FormDataSet.RemoteServer:= DM.RemoteServ;
end;

procedure TfrmMember.SetMemberGroup(const Value: Integer);
begin
  FMemberGroup := Value;
  FormDataSet.RemoteServer:= DM.RemoteServ;
  FormDataSet.Data := FormDataSet.DataRequest(
  'SELECT U.*,M.GROUP_ID from USNAME U, USGroupMembers M ' +
  ' WHERE U.USER_ID = M.USER_ID AND M.GROUP_ID =' + IntToStr(FMemberGroup));
  FormDataSource.DataSet:=FormDataSet;
  grdMember.DataController.DataSource:= FormDataSource;
end;

procedure TfrmMember.SetUserID(const Value: Integer);
begin
    FUserID := Value;
end;

end.
