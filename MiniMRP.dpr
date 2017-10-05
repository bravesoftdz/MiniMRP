program MiniMRP;

uses
  Vcl.Forms,
  untMPRMain in 'untMPRMain.pas' {frmMRPMain},
  untMRPDM in 'untMRPDM.pas' {DM: TDataModule},
  UntConstant in 'UntConstant.pas',
  UntLogin in 'UntLogin.pas' {frmLogin},
  untSnapDM in 'untSnapDM.pas',
  untDatabase in 'untDatabase.pas' {frmDatabase},
  untUserManagement in 'untUserManagement.pas' {frmUserManagement},
  untConfig in 'untConfig.pas' {frmConfiguration},
  untMaster in 'untMaster.pas' {frmMaster},
  untUsers in 'untUsers.pas' {frmUsers},
  untUserGroup in 'untUserGroup.pas' {frmUserGroup},
  untSetUserGroupMember in 'untSetUserGroupMember.pas' {frmSetUserGroupMember},
  untMember in 'untMember.pas' {frmMember},
  untSetPermissionOfUser in 'untSetPermissionOfUser.pas' {frmSetPermissionOfUser},
  untSetPermissionOfgroup in 'untSetPermissionOfgroup.pas' {frmSetPermissionOfgroup},
  untSystemConfiguration in 'untSystemConfiguration.pas' {frmSystemConfiguration},
  untFormReader in 'untFormReader.pas' {frmFormReader};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmSystemConfiguration, frmSystemConfiguration);
  Application.CreateForm(TfrmFormReader, frmFormReader);
  Application.Run;
end.
