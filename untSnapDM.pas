//
// Created by the DataSnap proxy generator.
// 3/10/2017 23:59:41
//

unit untSnapDM;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, FireDAC.Comp.Client, Data.DBXJSONReflect;

type
  TDMClient = class(TDSAdminClient)
  private
    FFDConnection1BeforeConnectCommand: TDBXCommand;
    FFDConnection1AfterConnectCommand: TDBXCommand;
    FFDConnection1AfterDisconnectCommand: TDBXCommand;
    FDataModuleCreateCommand: TDBXCommand;
    FApplicationEvents1IdleCommand: TDBXCommand;
    FSQLExecuteCommand: TDBXCommand;
    FSQLDataRequestCommand: TDBXCommand;
    FGetServerDateTimeCommand: TDBXCommand;
    FGetDBDateTimeCommand: TDBXCommand;
    FGenDocNoCommand: TDBXCommand;
    FCallStoreProcCommand: TDBXCommand;
    FGetTableCommand: TDBXCommand;
    FCheckExistedTableCommand: TDBXCommand;
    FGetSystemOptionCommand: TDBXCommand;
    FGetSystemOptionValCommand: TDBXCommand;
    FUserTableCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure FDConnection1AfterConnect(Sender: TObject);
    procedure FDConnection1AfterDisconnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    function SQLExecute(Input: string): Integer;
    function SQLDataRequest(Input: string): TDataSet;
    function GetServerDateTime: TDateTime;
    function GetDBDateTime: TDateTime;
    function GenDocNo(Input: string): string;
    function CallStoreProc(ProcName: string; inputParam: TParams): TDataSet;
    function GetTable(inputTableName: string): TDataSet;
    function CheckExistedTable(inputTableName: string): Boolean;
    function GetSystemOption(SystemType: Integer): TDataSet;
    function GetSystemOptionVal(SystemCode: string; SystemType: Integer): TDataSet;
    function UserTable: TFDTable;
  end;

implementation

procedure TDMClient.FDConnection1BeforeConnect(Sender: TObject);
begin
  if FFDConnection1BeforeConnectCommand = nil then
  begin
    FFDConnection1BeforeConnectCommand := FDBXConnection.CreateCommand;
    FFDConnection1BeforeConnectCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFDConnection1BeforeConnectCommand.Text := 'TDM.FDConnection1BeforeConnect';
    FFDConnection1BeforeConnectCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FFDConnection1BeforeConnectCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FFDConnection1BeforeConnectCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FFDConnection1BeforeConnectCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FFDConnection1BeforeConnectCommand.ExecuteUpdate;
end;

procedure TDMClient.FDConnection1AfterConnect(Sender: TObject);
begin
  if FFDConnection1AfterConnectCommand = nil then
  begin
    FFDConnection1AfterConnectCommand := FDBXConnection.CreateCommand;
    FFDConnection1AfterConnectCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFDConnection1AfterConnectCommand.Text := 'TDM.FDConnection1AfterConnect';
    FFDConnection1AfterConnectCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FFDConnection1AfterConnectCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FFDConnection1AfterConnectCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FFDConnection1AfterConnectCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FFDConnection1AfterConnectCommand.ExecuteUpdate;
end;

procedure TDMClient.FDConnection1AfterDisconnect(Sender: TObject);
begin
  if FFDConnection1AfterDisconnectCommand = nil then
  begin
    FFDConnection1AfterDisconnectCommand := FDBXConnection.CreateCommand;
    FFDConnection1AfterDisconnectCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFDConnection1AfterDisconnectCommand.Text := 'TDM.FDConnection1AfterDisconnect';
    FFDConnection1AfterDisconnectCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FFDConnection1AfterDisconnectCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FFDConnection1AfterDisconnectCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FFDConnection1AfterDisconnectCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FFDConnection1AfterDisconnectCommand.ExecuteUpdate;
end;

procedure TDMClient.DataModuleCreate(Sender: TObject);
begin
  if FDataModuleCreateCommand = nil then
  begin
    FDataModuleCreateCommand := FDBXConnection.CreateCommand;
    FDataModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDataModuleCreateCommand.Text := 'TDM.DataModuleCreate';
    FDataModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDataModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDataModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDataModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDataModuleCreateCommand.ExecuteUpdate;
end;

procedure TDMClient.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
  if FApplicationEvents1IdleCommand = nil then
  begin
    FApplicationEvents1IdleCommand := FDBXConnection.CreateCommand;
    FApplicationEvents1IdleCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FApplicationEvents1IdleCommand.Text := 'TDM.ApplicationEvents1Idle';
    FApplicationEvents1IdleCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FApplicationEvents1IdleCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FApplicationEvents1IdleCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FApplicationEvents1IdleCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FApplicationEvents1IdleCommand.Parameters[1].Value.SetBoolean(Done);
  FApplicationEvents1IdleCommand.ExecuteUpdate;
  Done := FApplicationEvents1IdleCommand.Parameters[1].Value.GetBoolean;
end;

function TDMClient.SQLExecute(Input: string): Integer;
begin
  if FSQLExecuteCommand = nil then
  begin
    FSQLExecuteCommand := FDBXConnection.CreateCommand;
    FSQLExecuteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSQLExecuteCommand.Text := 'TDM.SQLExecute';
    FSQLExecuteCommand.Prepare;
  end;
  FSQLExecuteCommand.Parameters[0].Value.SetWideString(Input);
  FSQLExecuteCommand.ExecuteUpdate;
  Result := FSQLExecuteCommand.Parameters[1].Value.GetInt32;
end;

function TDMClient.SQLDataRequest(Input: string): TDataSet;
begin
  if FSQLDataRequestCommand = nil then
  begin
    FSQLDataRequestCommand := FDBXConnection.CreateCommand;
    FSQLDataRequestCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSQLDataRequestCommand.Text := 'TDM.SQLDataRequest';
    FSQLDataRequestCommand.Prepare;
  end;
  FSQLDataRequestCommand.Parameters[0].Value.SetWideString(Input);
  FSQLDataRequestCommand.ExecuteUpdate;
  Result := TCustomSQLDataSet.Create(nil, FSQLDataRequestCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FSQLDataRequestCommand.FreeOnExecute(Result);
end;

function TDMClient.GetServerDateTime: TDateTime;
begin
  if FGetServerDateTimeCommand = nil then
  begin
    FGetServerDateTimeCommand := FDBXConnection.CreateCommand;
    FGetServerDateTimeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetServerDateTimeCommand.Text := 'TDM.GetServerDateTime';
    FGetServerDateTimeCommand.Prepare;
  end;
  FGetServerDateTimeCommand.ExecuteUpdate;
  Result := FGetServerDateTimeCommand.Parameters[0].Value.AsDateTime;
end;

function TDMClient.GetDBDateTime: TDateTime;
begin
  if FGetDBDateTimeCommand = nil then
  begin
    FGetDBDateTimeCommand := FDBXConnection.CreateCommand;
    FGetDBDateTimeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetDBDateTimeCommand.Text := 'TDM.GetDBDateTime';
    FGetDBDateTimeCommand.Prepare;
  end;
  FGetDBDateTimeCommand.ExecuteUpdate;
  Result := FGetDBDateTimeCommand.Parameters[0].Value.AsDateTime;
end;

function TDMClient.GenDocNo(Input: string): string;
begin
  if FGenDocNoCommand = nil then
  begin
    FGenDocNoCommand := FDBXConnection.CreateCommand;
    FGenDocNoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGenDocNoCommand.Text := 'TDM.GenDocNo';
    FGenDocNoCommand.Prepare;
  end;
  FGenDocNoCommand.Parameters[0].Value.SetWideString(Input);
  FGenDocNoCommand.ExecuteUpdate;
  Result := FGenDocNoCommand.Parameters[1].Value.GetWideString;
end;

function TDMClient.CallStoreProc(ProcName: string; inputParam: TParams): TDataSet;
begin
  if FCallStoreProcCommand = nil then
  begin
    FCallStoreProcCommand := FDBXConnection.CreateCommand;
    FCallStoreProcCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FCallStoreProcCommand.Text := 'TDM.CallStoreProc';
    FCallStoreProcCommand.Prepare;
  end;
  FCallStoreProcCommand.Parameters[0].Value.SetWideString(ProcName);
  FCallStoreProcCommand.Parameters[1].Value.SetDBXReader(TDBXParamsReader.Create(inputParam, FInstanceOwner), True);
  FCallStoreProcCommand.ExecuteUpdate;
  Result := TCustomSQLDataSet.Create(nil, FCallStoreProcCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FCallStoreProcCommand.FreeOnExecute(Result);
end;

function TDMClient.GetTable(inputTableName: string): TDataSet;
begin
  if FGetTableCommand = nil then
  begin
    FGetTableCommand := FDBXConnection.CreateCommand;
    FGetTableCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetTableCommand.Text := 'TDM.GetTable';
    FGetTableCommand.Prepare;
  end;
  FGetTableCommand.Parameters[0].Value.SetWideString(inputTableName);
  FGetTableCommand.ExecuteUpdate;
  Result := TCustomSQLDataSet.Create(nil, FGetTableCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FGetTableCommand.FreeOnExecute(Result);
end;

function TDMClient.CheckExistedTable(inputTableName: string): Boolean;
begin
  if FCheckExistedTableCommand = nil then
  begin
    FCheckExistedTableCommand := FDBXConnection.CreateCommand;
    FCheckExistedTableCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FCheckExistedTableCommand.Text := 'TDM.CheckExistedTable';
    FCheckExistedTableCommand.Prepare;
  end;
  FCheckExistedTableCommand.Parameters[0].Value.SetWideString(inputTableName);
  FCheckExistedTableCommand.ExecuteUpdate;
  Result := FCheckExistedTableCommand.Parameters[1].Value.GetBoolean;
end;

function TDMClient.GetSystemOption(SystemType: Integer): TDataSet;
begin
  if FGetSystemOptionCommand = nil then
  begin
    FGetSystemOptionCommand := FDBXConnection.CreateCommand;
    FGetSystemOptionCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetSystemOptionCommand.Text := 'TDM.GetSystemOption';
    FGetSystemOptionCommand.Prepare;
  end;
  FGetSystemOptionCommand.Parameters[0].Value.SetInt32(SystemType);
  FGetSystemOptionCommand.ExecuteUpdate;
  Result := TCustomSQLDataSet.Create(nil, FGetSystemOptionCommand.Parameters[1].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FGetSystemOptionCommand.FreeOnExecute(Result);
end;

function TDMClient.GetSystemOptionVal(SystemCode: string; SystemType: Integer): TDataSet;
begin
  if FGetSystemOptionValCommand = nil then
  begin
    FGetSystemOptionValCommand := FDBXConnection.CreateCommand;
    FGetSystemOptionValCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetSystemOptionValCommand.Text := 'TDM.GetSystemOptionVal';
    FGetSystemOptionValCommand.Prepare;
  end;
  FGetSystemOptionValCommand.Parameters[0].Value.SetWideString(SystemCode);
  FGetSystemOptionValCommand.Parameters[1].Value.SetInt32(SystemType);
  FGetSystemOptionValCommand.ExecuteUpdate;
  Result := TCustomSQLDataSet.Create(nil, FGetSystemOptionValCommand.Parameters[2].Value.GetDBXReader(False), True);
  Result.Open;
  if FInstanceOwner then
    FGetSystemOptionValCommand.FreeOnExecute(Result);
end;

function TDMClient.UserTable: TFDTable;
begin
  if FUserTableCommand = nil then
  begin
    FUserTableCommand := FDBXConnection.CreateCommand;
    FUserTableCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUserTableCommand.Text := 'TDM.UserTable';
    FUserTableCommand.Prepare;
  end;
  FUserTableCommand.ExecuteUpdate;
  if not FUserTableCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDBXClientCommand(FUserTableCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDTable(FUnMarshal.UnMarshal(FUserTableCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FUserTableCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;


constructor TDMClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TDMClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TDMClient.Destroy;
begin
  FFDConnection1BeforeConnectCommand.DisposeOf;
  FFDConnection1AfterConnectCommand.DisposeOf;
  FFDConnection1AfterDisconnectCommand.DisposeOf;
  FDataModuleCreateCommand.DisposeOf;
  FApplicationEvents1IdleCommand.DisposeOf;
  FSQLExecuteCommand.DisposeOf;
  FSQLDataRequestCommand.DisposeOf;
  FGetServerDateTimeCommand.DisposeOf;
  FGetDBDateTimeCommand.DisposeOf;
  FGenDocNoCommand.DisposeOf;
  FCallStoreProcCommand.DisposeOf;
  FGetTableCommand.DisposeOf;
  FCheckExistedTableCommand.DisposeOf;
  FGetSystemOptionCommand.DisposeOf;
  FGetSystemOptionValCommand.DisposeOf;
  FUserTableCommand.DisposeOf;
  inherited;
end;

end.

