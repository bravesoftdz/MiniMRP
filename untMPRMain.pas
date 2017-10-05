unit untMPRMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, CommCtrl,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBXJSON, JSON, Winapi.DWMAPI, System.ImageList, Vcl.ImgList, Vcl.StdCtrls, JvComponentBase, JvCaptionButton,
  JvExControls, JvPageList, JvNavigationPane, Vcl.ExtCtrls, JvExExtCtrls, JvExtComponent, JvRollOut, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Datasnap.DSCommon, IniFiles, JvCaptionPanel, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxGridCustomPopupMenu, cxGridPopupMenu,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView, cxGridCustomView, cxClasses, cxGridLevel, cxGrid, Vcl.AppEvnts;

type
  TMRPCallback = class(TDBXCallback)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create;
    function Execute(const Arg: TJSONValue): TJSONValue; override;

  end;

type
  TfrmMRPMain = class(TForm)
    ImageList1: TImageList;
    jvAll: TJvCaptionButton;
    jvMe: TJvCaptionButton;
    PgMainMRP: TPageControl;
    TabCreate: TTabSheet;
    TabTransform: TTabSheet;
    TabDispense: TTabSheet;
    TabStock: TTabSheet;
    TabReport: TTabSheet;
    ChannelManager: TDSClientCallbackChannelManager;
    pnlMsg: TJvCaptionPanel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    grdMessages: TcxGridBandedTableView;
    colMsg: TcxGridBandedColumn;
    cxGridPopupMenu1: TcxGridPopupMenu;
    ApplicationEvents1: TApplicationEvents;

    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure jvAllClick(Sender: TObject);
    procedure grdMessagesCellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ApplicationEvents1Restore(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);

  protected

  private
    { Private declarations }
    FWndFrameSize: integer;
  public
    { Public declarations }
  end;

var
  frmMRPMain: TfrmMRPMain;

implementation

{$R *.dfm}


uses untMRPDM, untSnapDM, UntConstant;

procedure TfrmMRPMain.ApplicationEvents1Minimize(Sender: TObject);
begin
  pnlMsg.Hide;
end;

procedure TfrmMRPMain.ApplicationEvents1Restore(Sender: TObject);
begin
  pnlMsg.Left := Self.Width - pnlMsg.Width - 14;
end;

procedure TfrmMRPMain.Button1Click(Sender: TObject);
begin
  DM.SQLConnection1.Connected := True;
end;

{ TMyCallBack }

constructor TMRPCallback.Create;
begin

end;

function TMRPCallback.Execute(const Arg: TJSONValue): TJSONValue;
Var
  Msg: string;
begin
  Result := TJSONTrue.Create;
  if Arg is TJSONString then
  begin
    Msg := TJSONString(Arg).Value;
    TThread.Synchronize(nil,
      procedure
      begin
        UntConstant.CallBackAllCount := UntConstant.CallBackAllCount + 1;
        frmMRPMain.jvAll.Caption := inttostr(UntConstant.CallBackAllCount);
        frmMRPMain.grdMessages.DataController.RecordCount := frmMRPMain.grdMessages.DataController.RecordCount + 1;
        frmMRPMain.grdMessages.DataController.Values[frmMRPMain.grdMessages.DataController.RecordCount, frmMRPMain.colMsg.Index] := Msg;
      end
      );
  end;

end;

procedure TfrmMRPMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ChannelManager.UnregisterCallback(CallBackId);
  dm.SQLConnection1.Close;
end;

procedure TfrmMRPMain.FormCreate(Sender: TObject);
var
  ini, ini2: TiniFile;
  i: integer;
  s: string;
begin
  CallBackId := inttostr(GetTickCount());

  ChannelManager.RegisterCallback(CallBackId, TMRPCallback.Create);
  ini := TiniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  ini2 := TiniFile.Create(ChangeFileExt(ParamStr(0), 'Msg.ini'));
  i := ini.ReadInteger('CallBack', 'PendingCallNo', 0);
  ini.Free;
  ini2.Free;
end;

procedure TfrmMRPMain.grdMessagesCellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
AShift: TShiftState; var AHandled: Boolean);
var
  ini: TiniFile;
  i: integer;
begin
  CallBackAllCount := 0;
  DeleteFile(ChangeFileExt(ParamStr(0), 'Msg.ini'));
  ini := TiniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  ini.WriteInteger('CallBack', 'PendingCallNo', 0);
  ini.Free;
  if grdMessages.DataController.RecordCount > 0 then
    pnlMsg.Hint := grdMessages.DataController.Values[grdMessages.DataController.FocusedRowIndex, colMsg.Index];
end;

procedure TfrmMRPMain.jvAllClick(Sender: TObject);
begin
  pnlMsg.Visible := Not pnlMsg.Visible;
end;

end.
