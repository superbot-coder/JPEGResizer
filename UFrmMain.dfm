object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'JPEG Resizer'
  ClientHeight = 741
  ClientWidth = 1314
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object LblFileInput: TLabel
    Left = 18
    Top = 87
    Width = 53
    Height = 13
    Caption = 'FileInput:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblFileOutput: TLabel
    Left = 680
    Top = 87
    Width = 61
    Height = 13
    Caption = 'FileOutput:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblFiSize: TLabel
    Left = 18
    Top = 106
    Width = 79
    Height = 13
    Caption = 'Input file size:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblFoSize: TLabel
    Left = 680
    Top = 106
    Width = 87
    Height = 13
    Caption = 'Output file size:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblNewWidth: TLabel
    Left = 293
    Top = 37
    Width = 62
    Height = 13
    Caption = 'New Width:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblNewHeight: TLabel
    Left = 448
    Top = 37
    Width = 66
    Height = 13
    Caption = 'New Height:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblPreView: TLabel
    Left = 272
    Top = 515
    Width = 100
    Height = 13
    Caption = 'Preview: 240x135'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPreviewText: TLabel
    Left = 8
    Top = 515
    Width = 167
    Height = 13
    Caption = 'Preview defiult size: 240x135 '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblQuality: TLabel
    Left = 623
    Top = 13
    Width = 149
    Height = 13
    Caption = 'Compression Quality: 90%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblPreViewQuality: TLabel
    Left = 262
    Top = 557
    Width = 189
    Height = 13
    Caption = 'Preview Comression quality: 90%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BtnOpen: TButton
    Left = 41
    Top = 32
    Width = 110
    Height = 25
    Caption = 'Open JPEG'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = BtnOpenClick
  end
  object BtnResize: TButton
    Left = 166
    Top = 32
    Width = 113
    Height = 25
    Caption = 'Resize'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BtnResizeClick
  end
  object PnlImage: TPanel
    Left = 7
    Top = 534
    Width = 240
    Height = 135
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = 'Preview'
    FullRepaint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object ImagePreView: TImage
      Left = 17
      Top = 16
      Width = 208
      Height = 105
      Align = alCustom
      Center = True
      Proportional = True
    end
  end
  object PnlSourceImage: TPanel
    Left = 10
    Top = 125
    Width = 640
    Height = 360
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = 'Source Image'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object ImageInput: TImage
      Left = 48
      Top = 40
      Width = 552
      Height = 288
      Center = True
      Proportional = True
      Stretch = True
    end
  end
  object PnlDestImage: TPanel
    Left = 666
    Top = 125
    Width = 640
    Height = 360
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = 'Destination Image'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object ImageResizeble: TImage
      Left = 40
      Top = 41
      Width = 529
      Height = 280
      Center = True
      Proportional = True
      Transparent = True
    end
  end
  object SpEditNewWidth: TSpinEdit
    Left = 363
    Top = 34
    Width = 67
    Height = 22
    MaxValue = 15000
    MinValue = 1
    TabOrder = 5
    Value = 1280
  end
  object SpEditNewHeight: TSpinEdit
    Left = 520
    Top = 34
    Width = 67
    Height = 22
    MaxValue = 5000
    MinValue = 1
    TabOrder = 6
    Value = 720
  end
  object TrackBarCompressionQuality: TTrackBar
    Left = 609
    Top = 32
    Width = 295
    Height = 36
    Max = 100
    Min = 35
    ParentShowHint = False
    PageSize = 1
    Frequency = 5
    Position = 90
    ShowHint = False
    TabOrder = 7
    OnChange = TrackBarCompressionQualityChange
  end
  object TrackBarPreview: TTrackBar
    Left = 253
    Top = 576
    Width = 295
    Height = 33
    Max = 100
    Min = 35
    Frequency = 5
    Position = 90
    TabOrder = 8
    OnChange = TrackBarPreviewChange
  end
  object OpenDlg: TOpenDialog
    Filter = #1060#1072#1081#1083#1099': (*.jpg)|*.jpg|'#1060#1072#1081#1083#1099': (*.jpeg)|*.jpeg'
    InitialDir = 'C:\Users\USER\Desktop\GamesDB\ToResiz'
    Left = 632
    Top = 528
  end
end
