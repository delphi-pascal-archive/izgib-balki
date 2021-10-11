object Form5: TForm5
  Left = 175
  Top = 121
  BorderStyle = bsDialog
  Caption = 'Form5'
  ClientHeight = 183
  ClientWidth = 284
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 8
    Top = -1
    Width = 265
    Height = 20
    BevelOuter = bvNone
    TabOrder = 0
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 24
    Width = 273
    Height = 137
    ColCount = 4
    DefaultColWidth = 61
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 50
    TabOrder = 1
    OnDblClick = StringGrid1DblClick
    OnSelectCell = StringGrid1SelectCell
  end
  object Panel2: TPanel
    Left = 8
    Top = 24
    Width = 273
    Height = 137
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 31
      Top = 8
      Width = 21
      Height = 16
      Caption = 'd=  '
    end
    object Label2: TLabel
      Left = 107
      Top = 8
      Width = 11
      Height = 16
      Caption = 'м'
    end
    object Label3: TLabel
      Left = 155
      Top = 8
      Width = 21
      Height = 16
      Caption = 'd=  '
    end
    object Label4: TLabel
      Left = 231
      Top = 8
      Width = 11
      Height = 16
      Caption = 'м'
    end
    object Label5: TLabel
      Left = 31
      Top = 29
      Width = 21
      Height = 16
      Caption = 'd=  '
    end
    object Label6: TLabel
      Left = 107
      Top = 29
      Width = 11
      Height = 16
      Caption = 'м'
    end
    object Label7: TLabel
      Left = 155
      Top = 29
      Width = 21
      Height = 16
      Caption = 'd=  '
    end
    object Label8: TLabel
      Left = 231
      Top = 29
      Width = 11
      Height = 16
      Caption = 'м'
    end
    object Edit1: TEdit
      Left = 55
      Top = 7
      Width = 49
      Height = 24
      TabOrder = 0
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 179
      Top = 7
      Width = 49
      Height = 24
      TabOrder = 1
      OnKeyPress = Edit2KeyPress
    end
    object Edit3: TEdit
      Left = 55
      Top = 28
      Width = 49
      Height = 24
      TabOrder = 2
      OnKeyPress = Edit3KeyPress
    end
    object Edit4: TEdit
      Left = 179
      Top = 28
      Width = 49
      Height = 24
      TabOrder = 3
      OnKeyPress = Edit4KeyPress
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 48
      Width = 257
      Height = 81
      Caption = 'Геометрические характеристики'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object Label9: TLabel
        Left = 8
        Top = 21
        Width = 157
        Height = 15
        Caption = 'Площадь сечения               F='
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 168
        Top = 21
        Width = 64
        Height = 17
        AutoSize = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 234
        Top = 22
        Width = 9
        Height = 15
        Caption = 'м'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 244
        Top = 19
        Width = 5
        Height = 12
        Caption = '2'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 8
        Top = 39
        Width = 156
        Height = 15
        Caption = 'Момент инерции              Jz='
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 168
        Top = 39
        Width = 64
        Height = 17
        AutoSize = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 234
        Top = 40
        Width = 9
        Height = 15
        Caption = 'м'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 244
        Top = 37
        Width = 5
        Height = 12
        Caption = '4'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 8
        Top = 57
        Width = 164
        Height = 15
        Caption = 'Момент сопротивления  Wz='
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 174
        Top = 57
        Width = 57
        Height = 17
        AutoSize = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 234
        Top = 58
        Width = 9
        Height = 15
        Caption = 'м'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 244
        Top = 55
        Width = 5
        Height = 12
        Caption = '3'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
      end
    end
  end
end
