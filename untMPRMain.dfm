object frmMRPMain: TfrmMRPMain
  Left = 0
  Top = 0
  Caption = 'Manufacturing System'
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = ApplicationEvents1Restore
  PixelsPerInch = 96
  TextHeight = 13
  object PgMainMRP: TPageControl
    Left = 0
    Top = 0
    Width = 784
    Height = 561
    ActivePage = TabReport
    Align = alClient
    TabHeight = 36
    TabOrder = 0
    TabWidth = 100
    object TabCreate: TTabSheet
      Caption = 'Create/Receive'
    end
    object TabTransform: TTabSheet
      Caption = 'Transform'
      ImageIndex = 1
    end
    object TabDispense: TTabSheet
      Caption = 'Dispense'
      ImageIndex = 2
    end
    object TabStock: TTabSheet
      Caption = 'Stock'
      ImageIndex = 3
    end
    object TabReport: TTabSheet
      Caption = 'Report'
      ImageIndex = 4
    end
  end
  object pnlMsg: TJvCaptionPanel
    Left = 599
    Top = 0
    Width = 185
    Height = 185
    Buttons = []
    Caption = 'Messages'
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWhite
    CaptionFont.Height = -13
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = [fsBold]
    FlatButtons = True
    OutlookLook = False
    TabOrder = 1
    object cxGrid1: TcxGrid
      Left = 26
      Top = 1
      Width = 144
      Height = 169
      Align = alClient
      TabOrder = 0
      LookAndFeel.NativeStyle = False
      ExplicitTop = -7
      object grdMessages: TcxGridBandedTableView
        Navigator.Buttons.CustomButtons = <>
        OnCellClick = grdMessagesCellClick
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Header = False
        Bands = <
          item
            Caption = 'All Messages'
            HeaderAlignmentHorz = taLeftJustify
            Width = 128
          end>
        object colMsg: TcxGridBandedColumn
          Width = 129
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = grdMessages
      end
    end
  end
  object ImageList1: TImageList
    Left = 992
    Top = 112
    Bitmap = {
      494C010102001C002C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      00000000000000000000000000000000000000000000FFFFFFFFA0A0A0FF0202
      01FF020201FF020201FF020201FF020201FF020201FF2A2A29FF3F3F3EFF0202
      01FF020201FF020201FF020201FF020201FF9F9F9F9F9F9F9F9F9F9F9F9F9F9F
      9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F
      9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF020201FF111110FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3C3C
      3BFFE7E7E7FF090908FFFFFFFFFFB2B2B1FFA0A0A0FF0D0D0CFFFFFFFFFFFFFF
      FFFF717170FF5C5C5BFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFF3F3
      F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3
      F3FFF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1919
      18FFFFFFFFFF020201FFFFFFFFFF848484FFFFFFFFFF333332FFFFFFFFFFFFFF
      FFFFAAAAAAFFB5B5B5FFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF0909
      08FF717170FF717170FF020201FF020201FF020201FF717170FF717170FF7171
      70FF020201FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0E0E
      0DFFFFFFFFFF020201FFFFFFFFFF4A4A49FFFFFFFFFF575756FFFFFFFFFFFFFF
      FFFFD8D8D8FFE5E5E5FFECECECFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF1111
      10FFFFFFFFFFFFFFFFFF020201FF020201FF020201FFFFFFFFFFFFFFFFFFFFFF
      FFFF020201FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0303
      02FFFFFFFFFF020201FFFFFFFFFF10100FFFFFFFFFFF898988FFFFFFFFFFD5D5
      D5FFFFFFFFFFF0F0F0FFD4D4D3FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF1111
      10FFFFFFFFFFFFFFFFFF020201FF020201FF020201FFFFFFFFFFFFFFFFFFFFFF
      FFFF020201FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D9D9FF4444
      44FF494948FF494948FFFFFFFFFF020201FF0A0A09FF070706FF0A0A09FFCFCF
      CFFF494948FF494948FF040403FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF1111
      10FFFFFFFFFFFFFFFFFF020201FF020201FF020201FFFFFFFFFFFFFFFFFFFFFF
      FFFF020201FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7FFEFEF
      EFFFFFFFFFFFFFFFFFFFFFFFFFFF939393FFFFFFFFFFFFFFFFFF020201FFFFFF
      FFFFFFFFFFFFFFFFFFFF070706FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF1111
      10FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF020201FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF020201FFFFFF
      FFFFFFFFFFFFFFFFFFFF5E5E5EFFE7E7E7FFFFFFFFFFFFFFFFFF020201FFFFFF
      FFFFFFFFFFFFFFFFFFFFDCDCDCFFC4C4C4FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ECECECFFFFFFFFFF1111
      10FFFFFFFFFFFFFFFFFF020201FFACACABFF020201FF494948FFFFFFFFFFFFFF
      FFFF020201FFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF020201FFFFFF
      FFFFFFFFFFFFFFFFFFFF020201FFFFFFFFFFFFFFFFFFFFFFFFFFD4D4D4FFE3E3
      E2FFFFFFFFFFFFFFFFFFCFCFCFFFFDFDFDFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000020201FFBDBDBDFF9C9C
      9BFFFFFFFFFFFFFFFFFFC8C8C7FFEFEFEFFFC8C8C7FFD8D8D8FFFFFFFFFFFFFF
      FFFFF4F4F4FF1C1C1BFF505050FFFFFFFFFFFFFFFFFFFFFFFFFF626262FFFFFF
      FFFFFFFFFFFFFFFFFFFF2E2E2DFFFFFFFFFFFFFFFFFFFFFFFFFF656564FFFDFD
      FDFFFFFFFFFFFFFFFFFF3E3E3DFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFF161615FF5252
      51FFFFFFFFFFFFFFFFFF020201FFACACABFF020201FF494948FFFFFFFFFFFFFF
      FFFF020201FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFF1D1D
      1CFF1D1D1CFF1D1D1CFFA4A4A4FFF9F9F9FFFFFFFFFFFFFFFFFF020201FFFFFF
      FFFF1D1D1CFF1D1D1CFF383837FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFF5F5F
      5FFF212120FFFFFFFFFF515150FFCBCBCBFF515150FF878786FFFEFEFEFF0202
      01FFE7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3434
      33FF8C8C8CFF080807FFFFFFFFFFE0E0E0FFDFDFDFFFDFDFDFFFF3F3F3FFFFFF
      FFFF444444FF414140FFFBFBFBFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFFBEBEBEFF030302FFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1FF020201FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0202
      01FFFFFFFFFF6C6C6CFFFFFFFFFF545453FFE3E3E3FF2B2B2AFFFFFFFFFF8686
      86FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFDFDFDFF020201FFF7F7F7FFA1A1A0FF0E0E0DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1616
      15FF020201FF030302FFFFFFFFFF020201FFFFFFFFFFFFFFFFFFCFCFCFFFFEFE
      FEFF020201FF020201FFF7F7F7FFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFF020201FF2E2E2DFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FF020201FF020201FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object jvAll: TJvCaptionButton
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Hint = '0'
    ImageIndex = 0
    Images = ImageList1
    Margin = 0
    OnClick = jvAllClick
    Left = 992
    Top = 56
  end
  object jvMe: TJvCaptionButton
    ButtonLeft = -36
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ImageIndex = 1
    Images = ImageList1
    Margin = 0
    Left = 992
    Top = 8
  end
  object ChannelManager: TDSClientCallbackChannelManager
    DSHostname = '127.0.0.1'
    DSPort = '8888'
    CommunicationProtocol = 'tcp/ip'
    ChannelName = 'MRPChannel'
    ManagerId = '395929.383288.394980'
    Left = 556
    Top = 65530
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = cxGrid1
    PopupMenus = <>
    Left = 644
    Top = 314
  end
  object ApplicationEvents1: TApplicationEvents
    OnMinimize = ApplicationEvents1Minimize
    OnRestore = ApplicationEvents1Restore
    Left = 332
    Top = 146
  end
end
