inherited frmSystemConfiguration: TfrmSystemConfiguration
  Caption = 'System Configuration'
  ExplicitTop = -19
  ExplicitWidth = 800
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    inherited pnlCommand: TPanel
      inherited btnNew: TBitBtn
        Visible = False
      end
      inherited btnDelete: TBitBtn
        Visible = False
      end
    end
  end
  object pnlSystemType: TJvCaptionPanel [1]
    Left = 0
    Top = 0
    Width = 400
    Height = 523
    Align = alLeft
    Buttons = []
    Caption = ''
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWhite
    CaptionFont.Height = -13
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    OutlookLook = False
    TabOrder = 1
    ExplicitLeft = 2
  end
  object pnlSystemCode: TJvCaptionPanel [2]
    Left = 408
    Top = 0
    Width = 376
    Height = 523
    Align = alClient
    Buttons = []
    Caption = 'System Value'
    CaptionPosition = dpTop
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWhite
    CaptionFont.Height = -13
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    OutlookLook = False
    TabOrder = 2
    ExplicitLeft = 406
    object cxGrid1: TcxGrid
      Left = 1
      Top = 146
      Width = 360
      Height = 362
      Align = alClient
      TabOrder = 0
      LookAndFeel.NativeStyle = False
      ExplicitLeft = -1
      ExplicitTop = 147
      object grdGeneral: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = FormDataSource
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object grdGeneralColumn1: TcxGridDBColumn
          Caption = 'Code'
          DataBinding.FieldName = 'CFG_CODE'
          Width = 74
        end
        object grdGeneralColumn2: TcxGridDBColumn
          Caption = 'Description'
          DataBinding.FieldName = 'CFG_DESCRIPTION'
          Width = 94
        end
        object grdGeneralColumn3: TcxGridDBColumn
          Caption = 'Value'
          DataBinding.FieldName = 'CFG_VALUE'
          Width = 76
        end
        object grdGeneralColumn4: TcxGridDBColumn
          Caption = 'Data Type'
          DataBinding.FieldName = 'DATA_TYPE'
          Width = 102
        end
      end
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object cxGrid1DBCardView1: TcxGridDBCardView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.CardIndent = 7
      end
      object grdDocument: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object grdDocControl: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DsDocControl
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.GroupByBox = False
        object grdDocControlColumn1: TcxGridDBColumn
          Caption = 'Code'
          DataBinding.FieldName = 'RUN_CD'
          Width = 71
        end
        object grdDocControlColumn2: TcxGridDBColumn
          Caption = 'Description'
          DataBinding.FieldName = 'RUN_DES'
          Width = 128
        end
        object grdDocControlColumn3: TcxGridDBColumn
          Caption = 'Next No.'
          DataBinding.FieldName = 'RUN_NO'
          Width = 86
        end
        object grdDocControlColumn4: TcxGridDBColumn
          Caption = 'Year'
          DataBinding.FieldName = 'RUN_YR'
          Width = 48
        end
        object grdDocControlColumn5: TcxGridDBColumn
          Caption = 'Restart Flag'
          DataBinding.FieldName = 'UPDATE_STS'
        end
        object grdDocControlColumn6: TcxGridDBColumn
          Caption = 'Last Date'
          DataBinding.FieldName = 'RUN_DATE'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = grdGeneral
      end
      object cxGrid1Level4: TcxGridLevel
        GridView = grdDocControl
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 26
      Width = 360
      Height = 120
      Align = alTop
      TabOrder = 1
      object pgSystemconfig: TPageControl
        Left = 1
        Top = 1
        Width = 358
        Height = 118
        ActivePage = tabGeneralConfig
        Align = alClient
        MultiLine = True
        TabHeight = 1
        TabOrder = 0
        TabPosition = tpLeft
        ExplicitHeight = 151
        object tabGeneralConfig: TTabSheet
          Caption = 'tabGeneral'
          ExplicitTop = 3
          object lblCfgCode: TLabel
            Left = 24
            Top = 11
            Width = 25
            Height = 13
            Caption = 'Code'
          end
          object lblCfgDescription: TLabel
            Left = 127
            Top = 11
            Width = 53
            Height = 13
            Caption = 'Description'
          end
          object lblCfgValue: TLabel
            Left = 230
            Top = 11
            Width = 26
            Height = 13
            Caption = 'Value'
          end
          object Label3: TLabel
            Left = 24
            Top = 59
            Width = 50
            Height = 13
            Caption = 'Data Type'
          end
          object DBEdit6: TDBEdit
            Left = 24
            Top = 30
            Width = 97
            Height = 21
            DataField = 'CFG_CODE'
            DataSource = FormDataSource
            TabOrder = 0
          end
          object DBEdit7: TDBEdit
            Left = 127
            Top = 30
            Width = 97
            Height = 21
            DataField = 'CFG_DESCRIPTION'
            DataSource = FormDataSource
            TabOrder = 1
          end
          object DBEdit8: TDBEdit
            Left = 230
            Top = 30
            Width = 97
            Height = 21
            DataField = 'CFG_VALUE'
            DataSource = FormDataSource
            TabOrder = 2
          end
          object DBComboBox1: TDBComboBox
            Left = 24
            Top = 78
            Width = 105
            Height = 21
            DataField = 'DATA_TYPE'
            DataSource = FormDataSource
            Items.Strings = (
              'INTEGER'
              'STRING'
              'DATE'
              'DATETIME')
            TabOrder = 3
          end
        end
        object TabDocControl: TTabSheet
          Caption = 'TabDocControl'
          ImageIndex = 1
          ExplicitTop = 3
          ExplicitHeight = 143
          object lblCode: TLabel
            Left = 16
            Top = 3
            Width = 25
            Height = 13
            Caption = 'Code'
          end
          object lblDescription: TLabel
            Left = 87
            Top = 3
            Width = 53
            Height = 13
            Caption = 'Description'
          end
          object lblNextNo: TLabel
            Left = 199
            Top = 3
            Width = 43
            Height = 13
            Caption = 'Next No.'
          end
          object lblYear: TLabel
            Left = 16
            Top = 51
            Width = 22
            Height = 13
            Caption = 'Year'
          end
          object lblDate: TLabel
            Left = 87
            Top = 51
            Width = 23
            Height = 13
            Caption = 'Date'
          end
          object Label1: TLabel
            Left = 199
            Top = 51
            Width = 36
            Height = 13
            Caption = 'Restart'
          end
          object DBEdit1: TDBEdit
            Left = 16
            Top = 22
            Width = 65
            Height = 21
            DataField = 'RUN_CD'
            DataSource = DsDocControl
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 87
            Top = 22
            Width = 106
            Height = 21
            DataField = 'RUN_DES'
            DataSource = DsDocControl
            TabOrder = 1
          end
          object DBEdit3: TDBEdit
            Left = 199
            Top = 22
            Width = 97
            Height = 21
            DataField = 'RUN_NO'
            DataSource = DsDocControl
            TabOrder = 2
          end
          object DBEdit4: TDBEdit
            Left = 16
            Top = 70
            Width = 65
            Height = 21
            DataField = 'RUN_YR'
            DataSource = DsDocControl
            TabOrder = 3
          end
          object cxDBDateEdit1: TcxDBDateEdit
            Left = 87
            Top = 70
            DataBinding.DataField = 'RUN_DATE'
            DataBinding.DataSource = DsDocControl
            TabOrder = 4
            Width = 106
          end
          object DBEdit5: TDBEdit
            Left = 199
            Top = 70
            Width = 97
            Height = 21
            DataField = 'UPDATE_STS'
            DataSource = DsDocControl
            TabOrder = 5
          end
        end
      end
    end
  end
  object cxSplitter1: TcxSplitter [3]
    Left = 400
    Top = 0
    Width = 8
    Height = 523
    ExplicitLeft = 672
    ExplicitTop = 88
    ExplicitHeight = 100
  end
  inherited JvFormAutoSize1: TJvFormAutoSize
    Active = False
  end
  object DsDocControl: TDataSource
    DataSet = cdsDocControl
    Left = 696
    Top = 232
  end
  object cdsDocControl: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 232
  end
end
