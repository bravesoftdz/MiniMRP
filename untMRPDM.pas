unit untMRPDM;

interface

uses
  System.SysUtils, System.Classes, iniFiles, Data.DB, Data.SqlExpr,
  Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, DBXCompressionFilter,
  DataSnap.DSSession, Data.FMTBcd, DataSnap.Provider, DataSnap.DBClient,
  cxStyles, cxGridTableView, cxClasses, untSnapDM, Datasnap.Win.MConnect, Datasnap.Win.SConnect;

type
  TDM = class(TDataModule)
    SQLConnection1: TSQLConnection;
    MasterTab1: TClientDataSet;
    MasterTab2: TClientDataSet;
    MasterTab3: TClientDataSet;
    MasterTab4: TClientDataSet;
    cxStyleRepository1: TcxStyleRepository;
    tempClientDataSet: TClientDataSet;
    RemoteServ: TSocketConnection;
    Transact: TClientDataSet;
    StDefault: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    procedure DataModuleCreate(Sender: TObject);
    procedure SQLConnection1AfterConnect(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    procedure SQLCmd(Input: string); overload;
    procedure SQLCmd(Input: string; Sender: TDataSet); overload;
    procedure SQLExec(Input: string);
    function GetDocNo(DocCode: string): string;
    function GetServDate: TDateTime;
    function GetDBDate: TDateTime;
    function GetSystemOption(SystemCode: String; SystemType: integer): TDataSet; overload;
    function GetSystemOption(SystemType: integer): TDataSet; overload;
  end;

var
  DM: TDM;
  proxy: TDMClient;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}


procedure TDM.SQLCmd(Input: string);
begin
    tempClientDataSet.Data:= tempClientDataSet.DataRequest(Input);
end;

procedure TDM.SQLExec(Input: string);
begin
  Transact.DataRequest(Input);
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  //proxy := TDMClient.Create(SQLConnection1.DBXConnection);
end;

function TDM.GetDBDate: TDateTime;
begin
  Result := proxy.GetDBDateTime;
end;

function TDM.GetDocNo(DocCode: string): string;
begin
  Result := proxy.GenDocNo(DocCode);
end;

function TDM.GetServDate: TDateTime;
begin
  Result := proxy.GetServerDateTime;
end;

function TDM.GetSystemOption(SystemCode: String; SystemType: integer): TDataSet;
begin
  Result := proxy.GetSystemOptionVal(SystemCode, SystemType);
end;

function TDM.GetSystemOption(SystemType: integer): TDataSet;
begin
  Result := proxy.GetSystemOption(SystemType);
end;

procedure TDM.SQLCmd(Input: string; Sender: TDataSet);
begin
  TClientDataSet(Sender).Data:= TClientDataSet(Sender).DataRequest(Input);
end;

procedure TDM.SQLConnection1AfterConnect(Sender: TObject);
begin
  proxy:= TDMClient.Create(SQLConnection1.DBXConnection);
end;

end.
