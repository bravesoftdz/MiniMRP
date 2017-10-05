unit untSystemConfiguration;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untMaster, Data.DB, Datasnap.DBClient, JvComponentBase, JvFormAutoSize, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxSplitter, JvExExtCtrls, JvExtComponent, JvCaptionPanel, untMRPDM,
  untUserGroup, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxGridCustomLayoutView, cxGridCardView, cxGridDBCardView,
  Vcl.ComCtrls, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, Vcl.Mask, Vcl.DBCtrls, UntConstant;

type
  TfrmSystemConfiguration = class(TfrmMaster)
    pnlSystemType: TJvCaptionPanel;
    pnlSystemCode: TJvCaptionPanel;
    cxSplitter1: TcxSplitter;
    grdGeneral: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel1: TPanel;
    grdGeneralColumn1: TcxGridDBColumn;
    grdGeneralColumn2: TcxGridDBColumn;
    grdGeneralColumn3: TcxGridDBColumn;
    grdGeneralColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBCardView1: TcxGridDBCardView;
    grdDocument: TcxGridDBTableView;
    cxGrid1Level4: TcxGridLevel;
    grdDocControl: TcxGridDBTableView;
    grdDocControlColumn1: TcxGridDBColumn;
    grdDocControlColumn2: TcxGridDBColumn;
    grdDocControlColumn3: TcxGridDBColumn;
    grdDocControlColumn4: TcxGridDBColumn;
    grdDocControlColumn5: TcxGridDBColumn;
    pgSystemconfig: TPageControl;
    tabGeneralConfig: TTabSheet;
    TabDocControl: TTabSheet;
    grdDocControlColumn6: TcxGridDBColumn;
    lblCode: TLabel;
    DBEdit1: TDBEdit;
    lblDescription: TLabel;
    DBEdit2: TDBEdit;
    lblNextNo: TLabel;
    DBEdit3: TDBEdit;
    lblYear: TLabel;
    DBEdit4: TDBEdit;
    lblDate: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    Label1: TLabel;
    DBEdit5: TDBEdit;
    lblCfgCode: TLabel;
    DBEdit6: TDBEdit;
    lblCfgDescription: TLabel;
    DBEdit7: TDBEdit;
    lblCfgValue: TLabel;
    DBEdit8: TDBEdit;
    Label3: TLabel;
    DBComboBox1: TDBComboBox;
    DsDocControl: TDataSource;
    cdsDocControl: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    FCurrentType: Integer;
    procedure MemberGroupClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure SetCurrentType(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    property CurrentType: Integer read FCurrentType write SetCurrentType;
  end;

var
  frmSystemConfiguration: TfrmSystemConfiguration;

implementation

{$R *.dfm}


procedure TfrmSystemConfiguration.MemberGroupClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  CurrentType := frmUserGroup.FormDataSet.FieldByName('group_id').AsInteger;
  pnlSystemCode.Caption := 'System Code of  ' + frmUserGroup.FormDataSet.FieldByName('group_name').AsString;
  if FCurrentType = 200000 then // General code
  begin
    pgSystemconfig.ActivePage := tabGeneralConfig;
    cxGrid1.Levels[1].Visible := False;
    cxGrid1.Levels[0].Visible := True;
    FormDataSet.Data := FormDataSet.DataRequest('SELECT * FROM SYSTEM_CONFIG');
  end
  else
  begin
    pgSystemconfig.ActivePage := TabDocControl;
    cxGrid1.Levels[0].Visible := False;
    cxGrid1.Levels[1].Visible := True;
    cdsDocControl.Data := cdsDocControl.DataRequest('SELECT * FROM DOC_CONTROL');
  end;

end;

procedure TfrmSystemConfiguration.SetCurrentType(const Value: Integer);
begin
  FCurrentType := Value;
end;

procedure TfrmSystemConfiguration.btnCancelClick(Sender: TObject);
begin
  if pgSystemconfig.ActivePage = tabGeneralConfig then
  begin
    FormDataSet.Cancel;
  end
  else
  begin
    cdsDocControl.Cancel;
  end;
  btnEdit.Enabled := True;
  btnCancel.Enabled := False;
  btnSave.Enabled := False;

end;

procedure TfrmSystemConfiguration.btnEditClick(Sender: TObject);
begin
  if pgSystemconfig.ActivePage = tabGeneralConfig then
  begin
    FormDataSet.Edit;
  end
  else
  begin
    cdsDocControl.Edit;
  end;
  btnSave.Enabled := True;
  btnCancel.Enabled := True;
  btnEdit.Enabled := False;
end;

procedure TfrmSystemConfiguration.btnSaveClick(Sender: TObject);
begin
  try
    if pgSystemconfig.ActivePage = tabGeneralConfig then
    begin
      FormDataSet.ApplyUpdates(0);
    end
    else
    begin
      cdsDocControl.ApplyUpdates(0);
    end;

    btnEdit.Enabled := True;
    btnCancel.Enabled := False;
    btnSave.Enabled := False;
    MessageDlg(msgSaveCompleted, mtInformation, [mbOK], 0);
  except
    MessageDlg(msgSaveFail, mtError, [mbOK], 0);
  end;

end;

procedure TfrmSystemConfiguration.FormCreate(Sender: TObject);
begin
  inherited;
  JvFormAutoSize1.Active := False;

  FormDataSet.RemoteServer := DM.RemoteServ;
  frmUserGroup := TfrmUserGroup.Create(pnlSystemType);

  frmUserGroup.GroupCode := 200000;
  frmUserGroup.GroupFormName := 'System Type';

  frmUserGroup.ManualDock(pnlSystemType, nil, alClient);
  frmUserGroup.Visible := True;
  frmUserGroup.Align := alClient;

  Application.ProcessMessages;

  frmUserGroup.grdGroup.OnCellClick := MemberGroupClick;
  grdGeneral.Styles.StyleSheet := DM.StDefault;
  grdDocControl.Styles.StyleSheet := DM.StDefault;

  cdsDocControl.RemoteServer := DM.RemoteServ;
  cdsDocControl.ProviderName := 'sqlcmd';
  cdsDocControl.DataRequest('SELECT * FROM DOC_CONTROL');
end;

end.
