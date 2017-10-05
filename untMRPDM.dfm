object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 376
  Width = 660
  object SQLConnection1: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=8888'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=24.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={"ZLibCompression":{"CompressMoreThan":"1024"}}'
      'Password=x'
      'User_Name=x'
      'DSAuthenticationPassword=x'
      'DSAuthenticationUser=x'
      'RemoteAppVer=8787')
    AfterConnect = SQLConnection1AfterConnect
    Connected = True
    Left = 56
    Top = 32
    UniqueId = '{CB2675D9-B45A-4EA3-B2B7-2BE43000D3D9}'
  end
  object MasterTab1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'sqlcmd'
    RemoteServer = RemoteServ
    Left = 56
    Top = 216
  end
  object MasterTab2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'sqlcmd'
    RemoteServer = RemoteServ
    Left = 136
    Top = 216
  end
  object MasterTab3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'sqlcmd'
    RemoteServer = RemoteServ
    Left = 216
    Top = 216
  end
  object MasterTab4: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'sqlcmd'
    RemoteServer = RemoteServ
    Left = 296
    Top = 216
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 152
    Top = 32
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11126946
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13886416
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11126946
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6592345
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = 13886416
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 2178849
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11126946
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6592345
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11126946
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = 6592345
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6592345
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object StDefault: TcxGridTableViewStyleSheet
      Caption = 'Spruce'
      Styles.Content = cxStyle1
      Styles.ContentEven = cxStyle2
      Styles.ContentOdd = cxStyle3
      Styles.Footer = cxStyle4
      Styles.Group = cxStyle5
      Styles.GroupByBox = cxStyle6
      Styles.Header = cxStyle7
      Styles.Inactive = cxStyle8
      Styles.Indicator = cxStyle9
      Styles.Preview = cxStyle10
      Styles.Selection = cxStyle11
      BuiltIn = True
    end
  end
  object tempClientDataSet: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM USNAME'
    Params = <>
    ProviderName = 'sqlcmd'
    RemoteServer = RemoteServ
    Left = 472
    Top = 216
  end
  object RemoteServ: TSocketConnection
    Connected = True
    ServerGUID = '{0DD7FC82-2558-4295-B215-3EFD6AB8CAE3}'
    ServerName = 'NewBroker.Dat'
    Address = '127.0.0.1'
    Port = 3333
    Left = 272
    Top = 32
  end
  object Transact: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'ConnectionExecute'
    RemoteServer = RemoteServ
    Left = 376
    Top = 216
  end
end
