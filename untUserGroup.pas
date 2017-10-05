unit untUserGroup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untMaster, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, JvComponentBase, JvFormAutoSize,
  Vcl.Buttons, Vcl.ExtCtrls, Datasnap.DBClient, untMRPDM, untSnapDM, Vcl.Grids, Vcl.DBGrids;

type
  TfrmUserGroup = class(TfrmMaster)
    pnlUserDetail: TPanel;
    lblGroupID: TLabel;
    lblGroupName: TLabel;
    lblGroupDescription: TLabel;
    Id: TDBEdit;
    FullName: TDBEdit;
    LoginName: TDBEdit;
    cxGrid1: TcxGrid;
    grdGroup: TcxGridDBTableView;
    grdGroupColumn1: TcxGridDBColumn;
    grdGroupColumn2: TcxGridDBColumn;
    grdGroupColumn3: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    JvFormAutoSize2: TJvFormAutoSize;
    procedure FormCreate(Sender: TObject);
    procedure dsFormDataSourceStateChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    FGroupCode: integer;
    FGroupFormName: string;
    procedure SetGroupCode(const Value: integer);
    procedure SetGroupFormName(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property GroupCode: integer read FGroupCode write SetGroupCode;
    property GroupFormName: string read FGroupFormName write SetGroupFormName;
  end;

var
  frmUserGroup: TfrmUserGroup;

implementation

{$R *.dfm}


uses UntConstant, StrUtils;

{ TfrmMaster1 }

procedure TfrmUserGroup.btnDeleteClick(Sender: TObject);
VAR
  i: integer;
  S: string;
begin
  if (MessageDlg(msgConfirmToDelete, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    S := 'DELETE FROM USGROUP WHERE GROUP_ID=' + FormDataSet.FieldByName('Group_Id').AsString;
    i := proxy.SQLExecute(S);
    inherited;
  end;
end;

procedure TfrmUserGroup.btnSaveClick(Sender: TObject);
var
  i: integer;
  s1, s2, S: String;
  grp: string;
begin
  try
    with FormDataSet do
    begin
      if State = dsInsert then
      begin
        grp := LeftStr(IntToStr(GroupCode), 1);
        i := StrToIntDef(Copy(Dm.GetDocNo('GROUPID' + grp), 5, 10), 1) + GroupCode;
        FieldByName('GROUP_ID').AsString := i.ToString;
        Post;
        for i := 0 to FieldCount - 1 do
        begin
          s1 := s1 + Fields[i].FieldName + ',';
          if Fields[i].DataType = ftString then
            s2 := s2 + QuotedStr(Fields[i].AsString) + ','
          else
            if Fields[i].DataType = ftDateTime then
            s2 := s2 + QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss', Fields[i].AsDateTime)) + ','
          else
            if Fields[i].DataType = ftInteger then
            s2 := s2 + Fields[i].AsString + ','
          else
            if Fields[i].DataType = ftShortint then
            s2 := s2 + Fields[i].AsString + ',';
        end;
        S := 'INSERT INTO USGROUP ('
          + LeftStr(s1, Length(s1) - 1) + ') VALUES ('
          + LeftStr(s2, Length(s2) - 1) + ')';
        i := proxy.SQLExecute(S);
      end
      else if State = dsEdit then
      begin
        Post;
        s1 := 'UPDATE USGROUP SET ';
        for i := 1 to FieldCount - 1 do
        begin
          if Fields[i].DataType = ftString then
            s2 := s2 + Fields[i].FieldName + '=' + QuotedStr(Fields[i].AsString) + ','
          else
            if Fields[i].DataType = ftDateTime then
            s2 := s2 + Fields[i].FieldName + '=' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss', Fields[i].AsDateTime)) + ','
          else
            if Fields[i].DataType = ftInteger then
            s2 := s2 + Fields[i].FieldName + '=' + Fields[i].AsString + ','
          else
            if Fields[i].DataType = ftShortint then
            s2 := s2 + Fields[i].FieldName + '=' + Fields[i].AsString + ',';
        end;
        S := s1 + LeftStr(s2, Length(s2) - 1) + ' WHERE GROUP_ID=' + FieldByName('GROUP_ID').AsString;
        i := proxy.SQLExecute(S);
      end;
    end;
    MessageDlg(msgSaveCompleted, mtInformation, [mbOK], 0);
  Except
    MessageDlg(msgSaveFail, mtError, [mbOK], 0);
  end;

end;

procedure TfrmUserGroup.dsFormDataSourceStateChange(Sender: TObject);
begin
  inherited;
  if (FormDataSet.State = dsInsert) then
    Id.ReadOnly := False
  else
    Id.ReadOnly := True;
end;

procedure TfrmUserGroup.FormCreate(Sender: TObject);
begin
  inherited;
  FormDataSet.RemoteServer := Dm.RemoteServ;

  GroupFormName := 'User group';
  if GroupCode > 1 then
  begin
    SetSQLText('select * from usgroup where group_id between ' + IntToStr(GroupCode) + ' and ' + IntToStr(GroupCode + 99999));
  end
  else
    GroupCode := 900000;

  grdGroup.DataController.DataSource := FormDataSource;

  grdGroup.Styles.StyleSheet := Dm.StDefault;
end;

procedure TfrmUserGroup.SetGroupCode(const Value: integer);
begin
  FGroupCode := Value;
  SetSQLText('select * from usgroup where group_id between ' + IntToStr(GroupCode) + ' and ' + IntToStr(GroupCode + 99999));
end;

procedure TfrmUserGroup.SetGroupFormName(const Value: string);
begin
  FGroupFormName := Value;
  Caption := Value;
end;

end.
