inherited frmUsers: TfrmUsers
  Caption = 'Users'
  PixelsPerInch = 96
  TextHeight = 13
  object pnlUserDetail: TPanel [1]
    Left = 0
    Top = 0
    Width = 784
    Height = 121
    Align = alTop
    TabOrder = 1
    OnMouseMove = pnlUserDetailMouseMove
    object lblUserID: TLabel
      Left = 24
      Top = 13
      Width = 19
      Height = 13
      Caption = #3619#3627#3633#3626
    end
    object lblLoginName: TLabel
      Left = 152
      Top = 13
      Width = 36
      Height = 13
      Caption = #3612#3641#3657#3651#3594#3657#3591#3634#3609
    end
    object lblFullName: TLabel
      Left = 328
      Top = 13
      Width = 14
      Height = 13
      Caption = #3594#3639#3656#3629
    end
    object lblPassword: TLabel
      Left = 527
      Top = 13
      Width = 38
      Height = 13
      Caption = #3619#3627#3633#3626#3612#3656#3634#3609
    end
    object lblaccesscount: TLabel
      Left = 424
      Top = 67
      Width = 95
      Height = 13
      Caption = #3592#3635#3609#3623#3609#3588#3619#3633#3657#3591#3607#3637#3656#3648#3586#3657#3634#3619#3632#3610#3610
    end
    object lblCreatedDate: TLabel
      Left = 200
      Top = 67
      Width = 39
      Height = 13
      Caption = #3611#3657#3629#3609#3648#3617#3639#3656#3629
    end
    object lblLastAccess: TLabel
      Left = 24
      Top = 67
      Width = 46
      Height = 13
      Caption = #3648#3586#3657#3634#3651#3594#3657#3648#3617#3639#3656#3629
    end
    object Id: TDBEdit
      Left = 24
      Top = 32
      Width = 113
      Height = 21
      DataField = 'USER_ID'
      DataSource = FormDataSource
      ReadOnly = True
      TabOrder = 0
    end
    object LoginName: TDBEdit
      Left = 152
      Top = 32
      Width = 161
      Height = 21
      DataField = 'LOGIN_NAME'
      DataSource = FormDataSource
      MaxLength = 20
      TabOrder = 1
    end
    object FullName: TDBEdit
      Left = 328
      Top = 32
      Width = 193
      Height = 21
      DataField = 'FULL_NAME'
      DataSource = FormDataSource
      MaxLength = 30
      TabOrder = 2
    end
    object Password: TDBEdit
      Left = 527
      Top = 32
      Width = 122
      Height = 21
      DataField = 'PASSWORD'
      DataSource = FormDataSource
      MaxLength = 254
      PasswordChar = '*'
      TabOrder = 3
    end
    object AccessCount: TDBEdit
      Left = 424
      Top = 83
      Width = 97
      Height = 21
      DataField = 'ACCESS_COUNT'
      DataSource = FormDataSource
      ReadOnly = True
      TabOrder = 7
    end
    object LastAccess: TJvDBDateEdit
      Left = 24
      Top = 83
      Width = 113
      Height = 21
      DataField = 'LAST_ACCESS'
      DataSource = FormDataSource
      ReadOnly = True
      ShowNullDate = False
      TabOrder = 4
    end
    object Status: TDBCheckBox
      Left = 668
      Top = 32
      Width = 129
      Height = 21
      Caption = #3651#3594#3657#3591#3634#3609#3652#3604#3657
      Color = clBtnFace
      DataField = 'ENABLED'
      DataSource = FormDataSource
      ParentColor = False
      TabOrder = 5
      ValueChecked = 'T'
      ValueUnchecked = 'F'
      OnExit = StatusExit
    end
    object CreatedDate: TJvDBDateEdit
      Left = 200
      Top = 86
      Width = 193
      Height = 21
      DataField = 'CREATED_DATE'
      DataSource = FormDataSource
      ReadOnly = True
      ShowNullDate = False
      TabOrder = 6
    end
  end
  object cxGrid1: TcxGrid [2]
    Left = 0
    Top = 121
    Width = 784
    Height = 402
    Align = alClient
    TabOrder = 2
    LookAndFeel.NativeStyle = False
    object grdUsers: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = FormDataSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object grdUsersColumn1: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'USER_ID'
        HeaderAlignmentHorz = taCenter
        Width = 83
      end
      object grdUsersColumn2: TcxGridDBColumn
        DataBinding.FieldName = 'LOGIN_NAME'
        HeaderAlignmentHorz = taCenter
        Width = 118
      end
      object grdUsersColumn3: TcxGridDBColumn
        DataBinding.FieldName = 'FULL_NAME'
        HeaderAlignmentHorz = taCenter
        Width = 150
      end
      object grdUsersColumn4: TcxGridDBColumn
        DataBinding.FieldName = 'PASSWORD'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.PasswordChar = '*'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 149
      end
      object grdUsersColumn5: TcxGridDBColumn
        DataBinding.FieldName = 'LAST_ACCESS'
        PropertiesClassName = 'TcxDateEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 156
      end
      object grdUsersColumn6: TcxGridDBColumn
        DataBinding.FieldName = 'ENABLED'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = '1'
        Properties.DisplayUnchecked = '0'
        Properties.DisplayGrayed = '-1'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        HeaderAlignmentHorz = taCenter
        Width = 113
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = grdUsers
    end
  end
  inherited FormDataSet: TClientDataSet
    Left = 736
    Top = 16
  end
  inherited FormDataSource: TDataSource
    Left = 736
    Top = 72
  end
end
