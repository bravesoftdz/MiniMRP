unit untUsers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, StrUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untMaster, Data.DB, JvComponentBase,
  JvFormAutoSize, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Datasnap.DBClient, Vcl.Mask, Vcl.DBCtrls, JvExMask, JvToolEdit, JvDBControls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit, cxCalendar, cxCheckBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmUsers = class(TfrmMaster)
    pnlUserDetail: TPanel;
    Id: TDBEdit;
    LoginName: TDBEdit;
    FullName: TDBEdit;
    Password: TDBEdit;
    AccessCount: TDBEdit;
    LastAccess: TJvDBDateEdit;
    Status: TDBCheckBox;
    CreatedDate: TJvDBDateEdit;
    grdUsers: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    grdUsersColumn1: TcxGridDBColumn;
    grdUsersColumn2: TcxGridDBColumn;
    grdUsersColumn3: TcxGridDBColumn;
    grdUsersColumn4: TcxGridDBColumn;
    grdUsersColumn5: TcxGridDBColumn;
    grdUsersColumn6: TcxGridDBColumn;
    lblUserID: TLabel;
    lblLoginName: TLabel;
    lblFullName: TLabel;
    lblPassword: TLabel;
    lblaccesscount: TLabel;
    lblCreatedDate: TLabel;
    lblLastAccess: TLabel;
    procedure btnSaveClick(Sender: TObject);
    procedure dsFormDataSourceStateChange(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure StatusExit(Sender: TObject);
    procedure pnlUserDetailMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsers: TfrmUsers;

implementation

{$R *.dfm}


uses UntConstant, untMRPDM, untSnapDM;

procedure TfrmUsers.btnDeleteClick(Sender: TObject);
VAR
  i: integer;
  S: string;
begin
  if (MessageDlg(msgConfirmToDelete, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    S := 'DELETE FROM USNAME WHERE USER_ID=' + FormDataSet.FieldByName('User_id').AsString;
    i := proxy.SQLExecute(S);
    inherited;
  end;
end;

procedure TfrmUsers.btnNewClick(Sender: TObject);
begin
  inherited;
  FormDataSet.FieldByName(Status.DataField).AsString:='T';
end;

procedure TfrmUsers.btnSaveClick(Sender: TObject);
var
  i: integer;
  s1, s2, S: String;
begin
  try
    with FormDataSet do
    begin

      FieldByName('Created_Date').AsDateTime := Dm.GetDBDate;
      FieldByName('Access_Count').AsInteger := 0;
      FieldByName('Last_Access').AsDateTime := 0;

      if State = dsInsert then
      begin
        FieldByName('User_id').AsString := Copy(Dm.GetDocNo('USERID'), 5, 10);
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
        S := 'INSERT INTO USNAME ('
          + LeftStr(s1, Length(s1) - 1) + ') VALUES ('
          + LeftStr(s2, Length(s2) - 1) + ')';
        i := proxy.SQLExecute(S);
        // i:= DM.SQLCmd(S,DM.tempClientDataSet);
      end
      else if State = dsEdit then
      begin
        Post;
        s1 := 'UPDATE USNAME SET ';
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
        S := s1 + LeftStr(s2, Length(s2) - 1) + ' WHERE USER_ID=' + FieldByName('User_id').AsString;
        i := proxy.SQLExecute(S);
      end;
    end;
    MessageDlg(msgSaveCompleted, mtInformation, [mbOK], 0);
  Except
    MessageDlg(msgSaveFail, mtError, [mbOK], 0);
  end;

end;

procedure TfrmUsers.dsFormDataSourceStateChange(Sender: TObject);
begin
  inherited;
  if (FormDataSet.State = dsInsert) then
    Id.ReadOnly := False
  else
    Id.ReadOnly := True;

end;

procedure TfrmUsers.FormCreate(Sender: TObject);
begin
  FormDataSet.RemoteServer:= DM.RemoteServ;
  SetSQLText('select * from usname');
  grdUsers.DataController.DataSource:= FormDataSource;
  grdUsers.Styles.StyleSheet:=DM.StDefault;
end;

procedure TfrmUsers.pnlUserDetailMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  StatusExit(Sender);
end;

procedure TfrmUsers.StatusExit(Sender: TObject);
begin
  inherited;
  if Status.Checked then
    Status.Caption:= 'Enabled'
  else
    Status.Caption:='Disabled';
end;

end.
