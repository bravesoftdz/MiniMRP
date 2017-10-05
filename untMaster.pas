unit untMaster;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  JvComponentBase, JvFormAutoSize, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient, untMRPDM, Vcl.Grids, Vcl.DBGrids, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrmMaster = class(TForm)
    pnlBottom: TPanel;
    pnlCommand: TPanel;
    btnNew: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnSave: TBitBtn;
    JvFormAutoSize1: TJvFormAutoSize;
    btnCancel: TBitBtn;
    FormDataSet: TClientDataSet;
    FormDataSource: TDataSource;
    FormPermissionData: TClientDataSet;

    procedure btnSaveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDataSourceStateChange(Sender: TObject);
  private
    { Private declarations }
    FformState: TDataSetState;
    procedure SetformState(const Value: TDataSetState);

  public
    { Public declarations }
    property FormState: TDataSetState read FformState write SetformState;
    procedure SetSQLText(const Value: string);
  end;

var
  frmMaster: TfrmMaster;
  { FSetFormDataSet: TClientDataSet;
    FSetFormDataSOurce: TDataSource;
  }

implementation

{$R *.dfm}


uses UntConstant;

procedure TfrmMaster.btnCancelClick(Sender: TObject);
begin
  TClientDataSet(FormDataSet).Cancel;
end;

procedure TfrmMaster.btnDeleteClick(Sender: TObject);
begin
  if MessageDlg(msgConfirmToDelete, mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    TClientDataSet(FormDataSet).Delete;
    TClientDataSet(FormDataSet).ApplyUpdates(0);
  end;
end;

procedure TfrmMaster.btnEditClick(Sender: TObject);
begin
  FormDataSet.Edit;
end;

procedure TfrmMaster.btnNewClick(Sender: TObject);
begin
  FormDataSet.Append;
end;

procedure TfrmMaster.btnSaveClick(Sender: TObject);
begin
  try
    FormDataSet.ApplyUpdates(0);
    MessageDlg(msgSaveCompleted, mtWarning, [mbOK], 0);
  except on E: Exception do
    MessageDlg(msgSaveFail+#10#13+e.Message, mtError, [mbOK], 0);
  end;

end;

procedure TfrmMaster.FormCreate(Sender: TObject);
Var
  cmp: TComponent;
begin
  FormDataSet.RemoteServer:= DM.RemoteServ;
  FormDataset.RemoteServer:=DM.RemoteServ;
  FormDataSet.ProviderName:='sqlcmd';
  TcxGridTableView(FindComponent('grdOfFormHead')).Styles.StyleSheet:= DM.StDefault;
  TcxGridTableView(FindComponent('grdOfFormDetail')).Styles.StyleSheet:= DM.StDefault;

end;

procedure TfrmMaster.FormDataSourceStateChange(Sender: TObject);
begin
  SetformState(FormDataSet.State);
end;

procedure TfrmMaster.SetformState(const Value: TDataSetState);
begin

//  if Value = dsInactive then
//  begin
//    pnlCommand.Enabled := False;
//  end

  //else
  if Value = dsBrowse then
  begin
    btnNew.Enabled := True;
    btnEdit.Enabled := True;
    btnDelete.Enabled := True;
    btnSave.Enabled := False;
    btnCancel.Enabled := False;
  end
  else if Value = dsEdit then
  begin
    btnNew.Enabled := False;
    btnEdit.Enabled := False;
    btnDelete.Enabled := False;
    btnSave.Enabled := True;
    btnCancel.Enabled := True;
  end
  else if Value = dsInsert then
  begin
    btnNew.Enabled := False;
    btnEdit.Enabled := False;
    btnDelete.Enabled := False;
    btnSave.Enabled := True;
    btnCancel.Enabled := True;
  end;
end;

procedure TfrmMaster.SetSQLText(const Value: string);
begin
  if Value <> '' then
    FormDataSet.Data := FormDataSet.DataRequest(Value);

  FormDataSource.DataSet := FormDataSet;
end;

end.
