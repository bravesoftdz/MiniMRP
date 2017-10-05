object frmUserManagement: TfrmUserManagement
  Left = 0
  Top = 0
  Caption = 'Users'
  ClientHeight = 561
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PgMainUser: TPageControl
    Left = 0
    Top = 0
    Width = 784
    Height = 561
    ActivePage = TabUsers
    Align = alClient
    TabHeight = 36
    TabOrder = 0
    TabWidth = 100
    object TabUsers: TTabSheet
      Caption = 'Users'
      ExplicitLeft = 8
      ExplicitTop = 46
    end
    object TabGroups: TTabSheet
      Caption = 'Groups'
      ImageIndex = 1
      ExplicitLeft = 8
      ExplicitTop = 46
    end
    object TabRoles: TTabSheet
      Caption = 'Roles'
      ImageIndex = 2
    end
    object TabPermission: TTabSheet
      Caption = 'Permission'
      ImageIndex = 3
      ExplicitLeft = 8
      ExplicitTop = 46
    end
  end
end
