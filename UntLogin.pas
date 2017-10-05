unit UntLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmLogin = class(TForm)
    edtUserName: TLabeledEdit;
    edtPassword: TLabeledEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses UntConstant, untMPRMain, untMRPDM;

procedure GetBuildInfo(var V1, V2, V3, V4: word);
var
  VerInfoSize, VerValueSize, Dummy: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  if VerInfoSize > 0 then
  begin
    GetMem(VerInfo, VerInfoSize);
    try
      if GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo) then
      begin
        VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
        with VerValue^ do
        begin
          V1 := dwFileVersionMS shr 16;
          V2 := dwFileVersionMS and $FFFF;
          V3 := dwFileVersionLS shr 16;
          V4 := dwFileVersionLS and $FFFF;
        end;
      end;
    finally
      FreeMem(VerInfo, VerInfoSize);
    end;
  end;
end;

function GetBuildInfoAsString: string;
var
  V1, V2, V3, V4: word;
begin
  GetBuildInfo(V1, V2, V3, V4);
  Result := IntToStr(V1) + '.' + IntToStr(V2) + '.' + IntToStr(V3) + '.' +
    IntToStr(V4);
end;

procedure TfrmLogin.btnCancelClick(Sender: TObject);
begin
  Self.Close;
  Application.Terminate;
end;

procedure TfrmLogin.btnOkClick(Sender: TObject);
var
  frm: TfrmMRPMain;
begin
  with DM.SQLConnection1 do
  begin
    Try
      Params.Values['DSAuthenticationUser'] := edtUserName.Text;
      Params.Values['DSAuthenticationPassword'] := edtPassword.Text;

      Connected := True;
      frm := TfrmMRPMain.Create(Self);
      frm.ShowModal;
    Finally
      Free;
      Self.Close;
    End;

  end;

end;

end.
