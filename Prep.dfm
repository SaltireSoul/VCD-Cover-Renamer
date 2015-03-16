object FormPrep: TFormPrep
  Left = 443
  Top = 508
  BorderStyle = bsNone
  Caption = 'Prep Files For Renaming'
  ClientHeight = 276
  ClientWidth = 528
  Color = 9070154
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Border: TShape
    Left = 0
    Top = 0
    Width = 528
    Height = 276
    Align = alClient
    Brush.Color = 9070154
  end
  object CoolForm: TCoolForm
    left = 0
    top = 0
    width = 528
    height = 276
    Align = alClient
    Mask2 = {00000000}
  end
  object lblHeader: TLabel
    Left = 8
    Top = 0
    Width = 513
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = '.:: Prep For Renaming ::.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object btnRenameFiles: TSelButton
    Left = 417
    Top = 242
    Width = 105
    Height = 20
    Caption = 'Rename Files'
    Color = 9070154
    ColorBorder = clBlack
    Enabled = True
    OnClick = btnRenameFilesClick
    ColorOverCaption = clWhite
    ColorOver = 7030830
    ColorDown = 7030830
    Alignment = taCenter
    BorderWidth = 1
    ShowHint = True
    ParentShowHint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
  end
  object lblNewFilename: TLabel
    Left = 16
    Top = 141
    Width = 73
    Height = 13
    Caption = 'New Filename :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 16
    Top = 37
    Width = 41
    Height = 13
    Caption = 'Files In :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object btnClose: TCoolButton
    Left = 503
    Top = 0
    Width = 25
    Height = 25
    Hint = 'Close'
    Caption = 'X'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = btnCloseClick
  end
  object Label2: TLabel
    Left = 16
    Top = 197
    Width = 96
    Height = 13
    Caption = 'Letters to Remove :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object btnBrowseFiles: TSelButton
    Left = 15
    Top = 242
    Width = 105
    Height = 20
    Caption = 'Browse Files'
    Color = 9070154
    ColorBorder = clBlack
    Enabled = True
    OnClick = btnBrowseFilesClick
    ColorOverCaption = clWhite
    ColorOver = 7030830
    ColorDown = 7030830
    Alignment = taCenter
    BorderWidth = 1
    ShowHint = True
    ParentShowHint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
  end
  object Label1: TLabel
    Left = 264
    Top = 37
    Width = 49
    Height = 13
    Caption = 'Files Out :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object btnUpdateFilename: TSelButton
    Left = 127
    Top = 242
    Width = 105
    Height = 20
    Caption = 'Display Filename'
    Color = 9070154
    ColorBorder = clBlack
    Enabled = True
    OnClick = btnUpdateFilenameClick
    ColorOverCaption = clWhite
    ColorOver = 7030830
    ColorDown = 7030830
    Alignment = taCenter
    BorderWidth = 1
    ShowHint = True
    ParentShowHint = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
  end
  object Label4: TLabel
    Left = 16
    Top = 173
    Width = 54
    Height = 13
    Caption = 'Extension :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object btnClear: TCoolButton
    Left = 240
    Top = 242
    Width = 49
    Height = 20
    Caption = 'Clear'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = btnClearClick
    OnMouseDown = btnClearMouseDown
    OnMouseUp = btnClearMouseUp
  end
  object memo1: TMemo
    Left = 16
    Top = 50
    Width = 241
    Height = 81
    Color = 8410679
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    WordWrap = False
  end
  object edNewFilename: TEdit
    Left = 96
    Top = 136
    Width = 409
    Height = 21
    Color = 8410679
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object Memo2: TMemo
    Left = 264
    Top = 50
    Width = 241
    Height = 81
    Color = 8410679
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    WordWrap = False
  end
  object edExtension: TEdit
    Left = 96
    Top = 168
    Width = 153
    Height = 21
    Color = 8410679
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = 'jpg'
  end
  object cbCharBack: TComboBox
    Left = 119
    Top = 192
    Width = 130
    Height = 21
    Color = 8410679
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 4
    Text = '3'
    OnChange = cbCharBackChange
  end
  object XPMenu: TXPMenu
    DimLevel = 30
    GrayLevel = 10
    Font.Charset = ANSI_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Color = 13160660
    IconBackColor = 13160660
    MenuBarColor = 13160660
    SelectColor = 6956042
    SelectBorderColor = 6956042
    SelectFontColor = clBlack
    DisabledColor = clGray
    SeparatorColor = 13160660
    CheckedColor = 6956042
    IconWidth = 24
    DrawSelect = True
    UseSystemColors = False
    OverrideOwnerDraw = False
    Gradient = False
    FlatMenu = False
    AutoDetect = True
    Active = True
    Left = 40
    Top = 8
  end
  object OpenDialog: TOpenDialog
    Filter = 'All Files|*.*'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 8
    Top = 8
  end
end
