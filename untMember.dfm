inherited frmMember: TfrmMember
  Caption = 'Members'
  ClientHeight = 513
  ClientWidth = 526
  DoubleBuffered = True
  ExplicitWidth = 542
  ExplicitHeight = 552
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    Top = 479
    Width = 526
    Height = 34
    ExplicitTop = 479
    ExplicitWidth = 526
    ExplicitHeight = 34
    inherited pnlCommand: TPanel
      Left = 106
      Width = 419
      Height = 32
      ExplicitLeft = 106
      ExplicitWidth = 419
      ExplicitHeight = 32
      inherited btnNew: TBitBtn
        Left = 171
        Height = 21
        Caption = 'Add'
        ExplicitLeft = 171
        ExplicitHeight = 21
      end
      inherited btnEdit: TBitBtn
        Left = 6
        Height = 21
        Visible = False
        ExplicitLeft = 6
        ExplicitHeight = 21
      end
      inherited btnDelete: TBitBtn
        Left = 252
        Height = 21
        ExplicitLeft = 252
        ExplicitHeight = 21
      end
      inherited btnSave: TBitBtn
        Left = 88
        Height = 21
        Visible = False
        ExplicitLeft = 88
        ExplicitHeight = 21
      end
      inherited btnCancel: TBitBtn
        Left = 333
        Height = 21
        ExplicitLeft = 333
        ExplicitHeight = 21
      end
    end
  end
  object cxGrid1: TcxGrid [1]
    Left = 0
    Top = 0
    Width = 526
    Height = 479
    Align = alClient
    TabOrder = 1
    object grdMember: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = FormDataSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = grdMember
    end
  end
  inherited JvFormAutoSize1: TJvFormAutoSize
    Active = False
  end
end
