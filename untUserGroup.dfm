inherited frmUserGroup: TfrmUserGroup
  Caption = 'frmMasterGroup'
  ClientWidth = 468
  ExplicitWidth = 484
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    Width = 468
    ExplicitWidth = 468
    inherited pnlCommand: TPanel
      Left = 52
      ExplicitLeft = 52
    end
  end
  object pnlUserDetail: TPanel [1]
    Left = 0
    Top = 0
    Width = 468
    Height = 73
    Align = alTop
    TabOrder = 1
    object lblGroupID: TLabel
      Left = 24
      Top = 13
      Width = 65
      Height = 13
      AutoSize = False
      Caption = #3619#3627#3633#3626
    end
    object lblGroupName: TLabel
      Left = 95
      Top = 13
      Width = 161
      Height = 13
      AutoSize = False
      Caption = #3594#3639#3656#3629
    end
    object lblGroupDescription: TLabel
      Left = 262
      Top = 13
      Width = 193
      Height = 13
      AutoSize = False
      Caption = #3588#3635#3629#3608#3636#3610#3634#3618
    end
    object Id: TDBEdit
      Left = 24
      Top = 32
      Width = 65
      Height = 21
      DataField = 'GROUP_ID'
      DataSource = FormDataSource
      MaxLength = 10
      ReadOnly = True
      TabOrder = 0
    end
    object FullName: TDBEdit
      Left = 262
      Top = 32
      Width = 193
      Height = 21
      DataField = 'GROUP_DESCRIPTION'
      DataSource = FormDataSource
      MaxLength = 254
      TabOrder = 1
    end
    object LoginName: TDBEdit
      Left = 95
      Top = 32
      Width = 161
      Height = 21
      DataField = 'GROUP_NAME'
      DataSource = FormDataSource
      MaxLength = 254
      TabOrder = 2
    end
  end
  object cxGrid1: TcxGrid [2]
    Left = 0
    Top = 73
    Width = 468
    Height = 450
    Align = alClient
    TabOrder = 2
    LookAndFeel.NativeStyle = False
    object grdGroup: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = FormDataSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object grdGroupColumn1: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'GROUP_ID'
        HeaderAlignmentHorz = taCenter
        Width = 60
      end
      object grdGroupColumn2: TcxGridDBColumn
        Caption = 'NAME'
        DataBinding.FieldName = 'GROUP_NAME'
        HeaderAlignmentHorz = taCenter
        Width = 183
      end
      object grdGroupColumn3: TcxGridDBColumn
        Caption = 'DESCRIPTION'
        DataBinding.FieldName = 'GROUP_DESCRIPTION'
        HeaderAlignmentHorz = taCenter
        Width = 211
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = grdGroup
    end
  end
  inherited JvFormAutoSize1: TJvFormAutoSize
    Active = False
    Left = 392
    Top = 320
  end
  object JvFormAutoSize2: TJvFormAutoSize
    Active = True
    Left = 320
    Top = 224
  end
end
