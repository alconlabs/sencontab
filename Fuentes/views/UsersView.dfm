object UsersView: TUsersView
  Left = 641
  Top = 140
  Width = 603
  Height = 403
  Caption = 'Gesti'#243'n de Usuarios'
  Color = 14275008
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  DesignSize = (
    595
    369)
  PixelsPerInch = 96
  TextHeight = 14
  object Shape1: TShape
    Left = 537
    Top = 48
    Width = 21
    Height = 20
    Anchors = [akTop, akRight]
    Brush.Color = 82109668
    Shape = stRoundSquare
  end
  object BtnImageSearch: TImage
    Left = 539
    Top = 50
    Width = 16
    Height = 16
    Cursor = crHandPoint
    Hint = 'Buscar por este concepto'
    Anchors = [akTop, akRight]
    ParentShowHint = False
    Picture.Data = {
      07544269746D617092020000424D920200000000000092010000280000001000
      000010000000010008000000000000010000120B0000120B0000570000005700
      000000000000FFFFFF00FF00FF00726061009C370300BB6E3B00CB8B5C00D194
      6400C77A3500DFAD8000D2883800DDA05B00E8BE9100D8923F00F0CB9D00FBED
      DC00E0A04F00E2A55400E4AA5B00E5AC5F00E6AE6200E9B97900EABA7D00EBBD
      7E00ECC08800EEC58D00F2D0A200F0CDA100F4D3A800F3D5AE00F5DBB800F5DE
      BF00F8E4CA00F9E6CD00FAEAD600FBEDDB00FDF1E100FDF2E300FBF0E100FCF3
      E700FDF6ED00E4A95800EAB97400EDBD7A00F1C68A00EDC38900F3CB9200F1CB
      9500F3CE9A00F5D29E00F6D7A900F2D2A600F7D9AD00F9DFB800F7DDB700FBE1
      BC00F6DEBC00F9E2C000F7E0BF00FAE5C600F8E3C600FAE8CF00F8E8D100FAEA
      D400FBECD600FBEEDB00FCEFDD00FCF0DE00FBEFDE00FDF3E500FDF5E900FDF5
      EA00FADDAF00F9DEB500FCE6C400FAE7CA00FEECCF00FCEACD00FDEDD3004755
      540074C8DB000097CA000077B000005992000F41830001256E00010152000202
      0202020202020202020202565602020202020202020202020202565452560202
      0202020202020202025654515356020202020404040404025655515356020202
      0404080B12100A04035055560202020405152E302F2D2A110A4F560202020204
      183436381E1D0E172904020202020407493B3D213C1F1E332A0D04020202040C
      4A404123223F23210E1104020202041C4C434527262647261D1404020202041B
      4E24462825440F3E1A130402020204094C4345272422201E1911040202020204
      354E4243233D3A332B0402020202020406374D4D4B39322C0B04020202020202
      04040C344831160404020202020202020202040404040402020202020202}
    ShowHint = True
    Transparent = True
  end
  object EditSearchText: TEdit
    Left = 384
    Top = 48
    Width = 153
    Height = 20
    Anchors = [akTop, akRight]
    Color = 82109668
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
  end
  object ListViewUsers: TListView
    Left = 24
    Top = 88
    Width = 553
    Height = 252
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = 82109668
    Columns = <>
    Ctl3D = False
    DragMode = dmAutomatic
    FullDrag = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 232
    Top = 40
    Width = 113
    Height = 41
    BevelOuter = bvNone
    Color = 14275008
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object BtnImageNew: TImage
      Left = 7
      Top = 6
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Hint = 'Crear ficha de un nuevo usuario'
      ParentShowHint = False
      Picture.Data = {
        07544269746D617076060000424D760600000000000036040000280000001800
        0000180000000100080000000000400200000000000000000000000100000000
        0000FFAE2400FE890000FF920000FFAE2300FA7D0000FF970000FFA10F00FFAC
        2000FFAE2500FFA41500FFAF2600FF9B0200FD860000FD850000FFA91C00FE8D
        0000FFA01000FA810000FF9D0800FF8D0000FFA71800D8801E00FFAC2200FD79
        0000FFA91D00BF4E0000D0731D00C2571500F9790000FFA71500D37C2600D77E
        1B00FFB02900FFA81900FFAF2500FA7E0000F9760000FF850000B85C2600FF99
        0100FFAA1D00FF890000FF830000FFB02700FF960000FF9A0200FF7E0000FFA5
        1400B6460000FFAF1F00FFD88400FFBF4A00FFAF1E00FFB02300FFD98400FEFD
        FA00F8790000E7880E00FFAE1B00E9B27900FDFAF700FDF9F600DE8D3500FFBE
        4900FFD57D00FF9D0900FEFCFA00E59F4800E9C2AA00F8BD5D00FFBA4300E985
        0300DA8A3B00B7470000E8C0A400FFAD1B00ECBF9600E49E4800FFA72A00FFB2
        2300FF980100FFB32F00FFB93B00DD8C3600FFB83B00FB820000FFC14C00FFD5
        7A00F0B66000FFC14F00E5820400FB810000C7560000D99A6B00FB942300F59A
        1B00FFBC4300D9853100FFAA1E00FAD08000FB850000C5713C00FFA71900FFA7
        3100DA8D3D00E2993F00FBCA6A00ED8B0A00FCB13100FFD17200E56F0600FFBB
        4000EAB37A00C25C1600B6490000DB8A3100E98E1500FF8D0200D5843500EA8F
        1000E6973F00FF910000F97A0000CD7F5100B95C2700DC680700FEDC9000FFCE
        6700FFCF6C00D65A0000FA820000D9770800DC801D00FFA71A00E9AD6400FDF5
        EB00CC8D5E00FC850000FC7A0000DA5C0000FFA81800DD7C0C00D87D1F00EF6C
        0000E6640000F2B04700E3902900E1821100CC702300FD8B0300FA990500FF9F
        1300FF9F1E00FFC65200FC890500DFAF8F00FF990C00FC880300EED1BE00FE8A
        0200E3B39200D1752900FFC95800DE7C0600B4521B00F6720000F9B84E00FF86
        0900FF9F0900B8490000CA875700CA600D00E17E1100FFBF4700F4AE5300F8BE
        6200E29C4F00FF9E2700FFBD3E00FDF7EF00FB850600CA794800FD840600F2CE
        A100FFAC2100FF9A0100FFD87F00FFC25100F8C16400FFC35600D4853C00FB83
        0300DA842D00FF930000FFAB2100FF8E0000E38E2400EB6A0000F7AA2E00C650
        0000FFB73800FFA02600BA5F2900FFA02D00EDBD8900F4C06800F28D2300EEBE
        8300FFA41400EE6F0100CA885A00FB790000F3D3AE00DB892D00D4976900EB90
        1400C8774200FEF9F200FFA00F00FFAF2800FC810000FA750000FA760000FDCC
        6C00D4791700FFCF6E00F6AC4500C0652600C4622700FF8D0100EBC7A800FFAE
        2200FFB12C00FFB22C00FC750000FFBA3800FC860000FFCA6500FCF1E500FFAC
        1F00FF9C0800F1CAA000FFB43200DB7B0A00E8C0A700FFB12600EBC7B100DD88
        2F00DA7E1C00E3620000F8760000BD4C0000FF9E0800FF9E0900C5550000FFFF
        FF00FFFFFFFFFFFFFFFF3DA06526CA7B9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF3C5DAB6EA58F8B1B44FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6945EB6D324EA
        F9A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD678B1BF0438FAA5C7FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFD2AEC99D11231C1749FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFAAE2989F895B042EA9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF885F9CE5010D82
        2A72FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF769650020F290C0DFEFFFFFFFFFFFF
        FFFFB3708474D777396BA82D0579C30164255C1919FB30E4F4FFCCC46CF53534
        4B2FDAFD2D2C0213010C252A2E17A5901BF63EA6EB0000070E212F1041B905C1
        0F290D55041C24DD81B5D5E15208000307288CD006FC0B05021301ECDC237ADE
        C57C733659E90800030728850906120B05020F010C11048AD1265363573FF220
        2B0A166221090612272C0275959AB4A77DD83B4D7EBA7FA2993354DB18660906
        F0270B974E67CBCE714AEE4CC0E01F15151F80C8B80E142F065A47ACF88E1AE3
        9B42FFFFFFFFFFFFFF1A6A6022EF0E141DA3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF1E45AD0AE707183A83FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EAF56200303C2
        31F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEBCBD510800034F8DFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF6858ED46E80A222B93FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFB769326DBB6FB2C6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD98643CD40DF91
        92F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87CF48A161B0D437FFFFFFFFFFFF
        FFFF}
      ShowHint = True
      Transparent = True
    end
    object BtnImageEdit: TImage
      Left = 47
      Top = 6
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Hint = 'Editar el usuario seleccionado'
      ParentShowHint = False
      Picture.Data = {
        07544269746D617076060000424D760600000000000036040000280000001800
        0000180000000100080000000000400200000000000000000000000100000000
        000000000000000080000080000000808000800000008000800080800000C0C0
        C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
        E00000400000004020000040400000406000004080000040A0000040C0000040
        E00000600000006020000060400000606000006080000060A0000060C0000060
        E00000800000008020000080400000806000008080000080A0000080C0000080
        E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
        E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
        E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
        E00040000000400020004000400040006000400080004000A0004000C0004000
        E00040200000402020004020400040206000402080004020A0004020C0004020
        E00040400000404020004040400040406000404080004040A0004040C0004040
        E00040600000406020004060400040606000406080004060A0004060C0004060
        E00040800000408020004080400040806000408080004080A0004080C0004080
        E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
        E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
        E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
        E00080000000800020008000400080006000800080008000A0008000C0008000
        E00080200000802020008020400080206000802080008020A0008020C0008020
        E00080400000804020008040400080406000804080008040A0008040C0008040
        E00080600000806020008060400080606000806080008060A0008060C0008060
        E00080800000808020008080400080806000808080008080A0008080C0008080
        E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
        E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
        E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
        E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
        E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
        E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
        E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
        E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
        E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
        E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
        A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00FF0052F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A000A0A0A5B
        07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B0A372F261C0A5BA5FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF07123737372F261C135C07FFFFFFFFFFFFFFFFFFFFFF
        FFFFFF5B6E7F37372F2F26131207FFFFFFFFFFFFFFFFFFFFFFFFFF0712777F77
        371C1D251D1207FFFFFFFFFFFFFFFFFFFFFFFFFF5B6E7F7F7F25262F27251207
        FFFFFFFFFFFFFFFFFFFFFFFFAE1C7F7F7F2E372E2F27251207FFFFFFFFFFFFFF
        FFFFFFFFFF5B6E6D26363F372E2F2F251207FFFFFFFFFFFFFFFFFFFFFF6D0336
        FBFBFBFB372E2F2F251207FFFFFFFFFFFFFFFFFFFFFF642DFBFBFBFBFB3F2F2F
        2F260A07FFFFFFFFFFFFFFFFFFFFFF1B36FBFBFBFBFB3F2F3726924907FFFFFF
        FFFFFFFFFFFFFFFF1B36FBFBFBFBFBFB2E9AE3D24907FFFFFFFFFFFFFFFFFFFF
        FF1B36FBFBFBFB3FA309EC92D24A07FFFFFFFFFFFFFFFFFFFFFF1B36FBFBFBAC
        0809A3ECE3894907FFFFFFFFFFFFFFFFFFFFFF1B36FB63F6F6AC09099BE3D249
        EFFFFFFFFFFFFFFFFFFFFFFF1B63F6F607F608A309EC930E0A07FFFFFFFFFFFF
        FFFFFFFFFF5BF707F6F6F50809A4F9F90154FFFFFFFFFFFFFFFFFFFFFFFF5BF7
        F607F6F6F717F9F90E0AFFFFFFFFFFFFFFFFFFFFFFFFFF5BF7F6F6BD5F1F17F9
        F900FFFFFFFFFFFFFFFFFFFFFFFFFFFF5BF7BD5F5F5F1F170E0AFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF521E5F6F675F170C54FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF080A141E1F1E145307FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF085D130A135C
        07FF}
      ShowHint = True
      Transparent = True
    end
    object BtnImageDelete: TImage
      Left = 87
      Top = 6
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Hint = 'Eliminar el usuario seleccionado'
      ParentShowHint = False
      Picture.Data = {
        07544269746D617076060000424D760600000000000036040000280000001800
        0000180000000100080000000000400200000000000000000000000100000000
        00003535350034343400323232008080800026262600D9D9D900363636008989
        8900818181003D3D3D0053535300D1D1D100B6B6B600DADADA00313131003C3C
        3C0098989800D0D0D000B5B5B500D6D6D600BDBDBD003B3B3B008C8C8C003F3F
        3F00A2A2A2004E4E4E0061616100B3B3B3008B8B8B0040404000A1A1A100C4C4
        C400E0E0E0007B7B7B0067676600B0B0B0002C2C2C005A5A5A00E3E3E3009C9C
        9C00C3C3C30072727200DFDFDF00D7D7D700FBFBFB00CDCDCD00444545009E9F
        9F002A2A2A0084848400929292003A3A3A008A8A8A00FCFCFC002F2F2F004646
        46004C4C4C00747474004141410027272700EFEFEF00D8D8D800B4B4B4008282
        8200DCDCDC006C6C6C003E3E3E0056565600D4D4D400B8B8B800999999003939
        39009595950011111100AAAAAA0077777700545454007F7F7F00C8C8C8004A4A
        4A004242420065656500CCCCCC005151510055555500C7C7C7005D5D5D009797
        970038383800D2D2D2006B6B6B009A9A9A00DCDBDB0052525100F9F9F9007D7D
        7D004F4F4F0032323300F2F2F200909190005252520052535200E6E6E6003737
        3700DBDBDB00B7B7B700BCBCBC00A3A3A300DEDEDE00C6C6C600B2B2B2009696
        960083838300AFAFAF0048484800BABABA0020202000252525005E5F5E00D3D3
        D3008F8F8F00232323001E1E1E003333330063636200E4E4E40064646400DDDD
        DD00A0A0A000ADADAD007E7E7E0022222200767676007878780079797900C9C9
        C900FEFEFE00BFC0C0005B5B5B00242424003A3B3B00BABAB900686868008D8C
        8C0073747400767777008181800094949400898A8A003E3F3F00B2B2B3002726
        2700BEBEBE005C5B5C00B4B4B50047474700BCBDBC0024252500DEDFDF009495
        9500C2C3C300A1A2A200BFBEBE00BFBFBF00908F8F00565758004E4D4D00A5A5
        A500B0B0AF003B3C3B0088878600BAB9B900A8A7A800BAB9BA0060605F002221
        2100C0BFC00099999A0056575700B7B7B80070706F003A3A3900BBBBBB007C7B
        7B0080818000D3D3D400B5B5B600C3C4C400C1C1C100C1C2C100D5D5D5008586
        850047474800D1D1D2001A1A1A00373838000C0C0C003C3D3C004F505000EBEB
        EB00757575009D9D9D0026272700DEDDDD00D8D7D700F6F6F600868585008F90
        8F0087878700D8D8D90091929100CFD0D0003D3D3C00A09F9F0053525300908F
        900098989900171717007776770081828100DAD9D900B4B5B5007E7F7F005858
        5800FAFAFA00C5C5C50070717000A09FA000B7B6B600464645008F909000CBCC
        CB00DDDEDD00BDBDBC00D7D6D600A8A8A800303030003031310099989900DCDC
        DB00DFDFDE006E6E6E00A2A2A300C1C1C20023232400C2C2C200DBDBDA00C2C3
        C20083838200DDDCDC00393938002E2E2E007A7B7A00BBBABA0021212100FFFF
        FF00FF2C3C21259B172E724F0636240002307404241A7162FFFFFFCD08177656
        7E7E21821A5419564337019D83742514FFFFFF0554C894BA1B0BEFD11E1CB8C9
        D8BF4C42063B4232FFFFFF6AFBB6143E6ED305EAE30703C910CE0A09060E0484
        FFFFFF2336736ADD6E110D138034032F46310A0F0615745AFFFFFFEB0E9C1412
        9611F62B803408D5B1F865C5000FFE64FFFFFF077B1414121B0B5CCC1E1C3F2F
        10DB650900A983502CFFFF7015B098693E59403D18163FC96F035D0F018C8B06
        3CFFFF21D4BDA3B39A777F05F21608279FDE530F0133752466FF88DAE5288945
        12B9CBDC6B16925BD25F6015014704796CFF355137E1BCAB0CBE2A68181C4D10
        CFFC193361C304AF13FF357C3855F3ADE4BE2A0DA13482488F85A6B50267CA7A
        0BFF2C605D87F773452B2A05ACAA3F93073938470E0097D952FFE02E53E76D8D
        A205E8130C78E6483129C66761003B494EFF5E3A0A232DBB2D40680BA0231832
        03F1A595FA003B49E1FF5E17431BBE059E207FC1283E6BA45F5A8A3809020449
        28FF3533A6B44DB74B86842941221A250AB24F3A150EF4C44EFF1D1D1AD007D7
        EE465B4648E6070886E2514C19C01D0247082E715211592BF92026260D0B55FD
        812F6303908E7CD6ED00500C3D0D5C6C2026667D407787E9A81E323185412243
        79094203188169F52D44130D3D11E10CA757078422DF193AC26FAB997B0E0224
        EC0610570A17096491AE0230750430581C3CFFFFC77D1F0C4A161D1B704B9078
        C8371E4A126DF0FFFFFFFFFFFFFFFFFFFF627601010102365841FFFFFFFFFFFF
        FFFF}
      ShowHint = True
      Transparent = True
    end
  end
  object Panel3: TPanel
    Left = 32
    Top = 40
    Width = 121
    Height = 41
    BevelOuter = bvNone
    Color = 14275008
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object BtnImageList: TImage
      Left = 7
      Top = 6
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Hint = 'Muestra una lista de resultados'
      ParentShowHint = False
      Picture.Data = {
        07544269746D617076060000424D760600000000000036040000280000001800
        0000180000000100080000000000400200000000000000000000000100000001
        0000FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FD00FD00FB00FB00F600F600EE01EE00E102E100CF04
        CF00BA07BA009E0A9E00770F77004F144F00371837002A1B2A001E1E1E001F1F
        1F00202020002121210022222200232323002424240025252500262626002727
        270028282800292929002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002938
        29001E4D1E000D6A0D0004790400017F01000080000000800000008000000080
        0000008000000080000000800000008000000080000000800000008000000080
        0000008000000080000000800000008000000080000000800000008000000080
        0000008000000080000000800000008000000080000000800000008000000080
        0000008000000080000000800000008000000080000000800000008000000080
        0000008000000080000000800000008000000080000000800000008000000080
        0000008000000080000000800000008000000080000000800000008000000080
        0000008000000080000000800000008000000080000000800000008000000080
        0000008000000080000000800000008000000080000000800000008000000080
        0000018001000280020003800300068006000A800A000E800E00168016002080
        20002E802E003E813E00528152006C826C008484840085858500868686008787
        870088888800898989008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F
        8F00909090009191910092929200939393009494940095959500969696009797
        970098989800999999009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F
        9F00A0A0A000A1A1A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7
        A700A8A8A800A9A9A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00B3B3
        B300C5C4C300D2D1CF00E3E0DE00EEEBE900F6F4F100FBF8F600FDFBF800FEFC
        F900FEFCFA00FEFCFA00FEFCF900FEFBF700FEFAF500FEF9F400FEF9F200FEF8
        F000FEF7EF00FEF6EE00FEF5EC00FEF4EA00FEF3E800FEF3E600FEF2E400FEF1
        E200FEEFDF00FEEEDD00FEEEDB00FEECD900FEEBD600FEEAD400FEE9D200FEE8
        D100FEE8D000FEE7CE00FEE6CC00FEE5CA00FEE4C800FEE4C700FEE3C600FEE2
        C400FEE1C200FEE0C000FEDFBE00FEDEBD00FEDEBB00FEDDBA00FEDCB900FEDB
        B700FEDBB500FEDAB400FED9B200FED9B100FED8AF00FED7AE00FED6AC00FED6
        AA00FED5A900FED4A700FED3A500FED2A300FED0A000FECF9D00FECE9C00FDCD
        9A00FDCD9900FDCC9800FCC99400F9C38B00F3B77800E8A35A00DD8D3900D47B
        1D00CE700C00CB6A0300CA680000CA680000CA680000CA680000CA680000CA68
        00000A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0AFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD0A0A0AFDD7D9DADDE0E2E4E7E9EAECEC
        EDEEF1F1F1F1F1F1FD0A0AFDD3D636363636363636363636363636363636F1F1
        FD0A0AFDD2D336363636363636363636363636363636F1F1FD0A0AFDCED1D3D6
        D8D9DDE0E2E4E6E8EAEBECEDEEF1F1F1FD0A0AFDCDCE36363636363636363636
        363636363636F1F1FD0A0AFDCBCC36363636363636363636363636363636EDF0
        FD0A0AFDC9CBCCCED2D3D6D8D9DCDFE1E4E6E8E9EBECEDEDFD0A0AFDC7C93636
        3636363636363636363636363636ECEDFD0A0AFDC6C736363636363636363636
        363636363636EBECFD0A0AFDC5C5C7C9CACCCED1D3D6D7D9DDDFE1E3E6E8E9EA
        FD0A0AFDC1C336363636363636363636363636363636E7E9FD0A0AFDBFC13636
        3636363636363636363636363636E4E8FD0A0AFDBEC0C1C3C5C7C8CACCCED0D2
        D5D7D9DCDDE1E3E5FD0A0AFDBCBE36363636363636363636363636363636E0E3
        FD0A0AFDBBBB36363636363636363636363636363636DDE1FD0A0AFDB9BBBBBC
        C0C1C3C5C7C8CACCCDD0D2D5D7D9DCDDFD0A0AFDB8B836363636363636363636
        363636363636D8DBFD0A0AFDB8B836363636363636363636363636363636D6D8
        FD0A0AFDB8B8B8B8BBBBBCBFC0C2C5C6C8C9CBCDD0D2D3D6FD0A0AFDB8B8B8B8
        B8BABBBCBFC0C3C5C6C7C9CBCDD0D1D3FD0A0A0AFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFD0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A
        0A0A}
      ShowHint = True
      Transparent = True
    end
    object BtnImageReport: TImage
      Left = 44
      Top = 6
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Hint = 'Muestra un informe por resultado'
      ParentShowHint = False
      Picture.Data = {
        07544269746D617076060000424D760600000000000036040000280000001800
        0000180000000100080000000000400200000000000000000000000100000000
        0000CC666600FFFFFF00B2B2B200E19C8C00EDC8C800DCD6CD00FFFAF100EBC3
        C300FFFCF700FFECCE00FFFDFA00FFF5E500EDBEAE00FFEFD500FFF2DE00FFF9
        F000FFFEFC00FFFDFB00FFEDD000FFF3E000FFF8ED00FFF8EE00FFF1D900FFFB
        F600FFF4E300FFF1DA00FFEBCC00EABE8400FFF7EB00FFF1DC00FFFFFD00FFF6
        E700FFFEFE00FFFCF900FFEED200FFF9EF00FFF0D800FFEFD700FFE7C100DC91
        2800FFF7E900FFE8C300FFE9C800FFF2DC00FFFAF300FFEED300FFF0D700FFF7
        EA00FFEDD100FFE6BF00FFFBF500FFFAF400FFFEFD00FFFFFE00FFEBCA00FFF6
        E800E5AE6500FFECCC00FFF5E300FFF5E800FFFCF500FFFBF700FFEED500FFFD
        F800FFE7C200FFE8C400FFE9C700FFEAC700FFE4BA00FFFBF300FFFDF900FFEA
        C900FFEBC900FFE9C500FFE8C600FFEDD300FFE6BE00FFFEFB00FFE6BD00E09E
        4100FFF8EC00FFFCF800DE9A3E00E3A95500FFF3E100FFF7EC00FFFFFC00FFED
        D200FFFBF400FFF9ED00FFFAF200FFF6EA00FFFAEF00FFE5BC00FFE8C500FFE9
        C600FFEACA00FFFFFF0000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000370000007C922900922C990000007C00180026000012
        F5000000000000000000800000000012F50012F5A8002CB700006C7C92000001
        B60026301000F5880000000012000000000080A08E0000007C00100026000026
        300012F58800A0A50000F47C80000012F50000792C0000000000100000000000
        000000001200F5F80000FE0012000000000012F5BC00F0FF00006877D1000048
        5B000000FE00F5D400006200120000279E000000240000000000FE0000000000
        000000000000F5E800005D00120077D24A00000000009E620000120027000000
        000012F5F80000120000000000000000000047D0CA005B7600009F0048000014
        490014492800A9AB00000000420000260000279E620000240000FF0000000000
        000042AAC100792C00006800000000485B000000FF00499F0000710014000012
        F60041DCA900792C000028000000001449000000000000000000280000000018
        EE0000007700001D0000200000000000010000010600000000003C0014000012
        F400706D6200F6983B00180012007C91EE009206F000FFFF7C00EBFFFF007C92
        0600809A0F0000007C000800140000140000809A200049287C00000014000000
        00000000000000000000000000000000000044C0C400EE5A0000040018000017
        450018EE5E00F9AE0000FF001200FFFFFF0018EE2800C12E00005A0044000018
        EE00616161000000000000000000000000000000000000616161616161000303
        030303030303030303030303030300616161616161000406142F0B541D242D09
        365F264E4403006161616161610004450F553B180E190D301A4329315D030061
        61616161610004170615280B132B255709604A404C0300616161616161000408
        58231C373A0E160D121A2A413103006161616161610004211706152F0B131D2E
        2209485E26030061616161616100040A3D02051C050202190212022A29030061
        6161616161000410460202140205022B022D0236490300616161616161000434
        11082C0F5037180E160D12394203006161616161610004354D02050215020B02
        022E02094703006161616161610004011E0502025C021F02051602121A030061
        61616161610004012011213C06145B0B131D244B090300616161616161000401
        01020A05020F021F0202020D3003006161616161610004010102100202060228
        0205022522030061616161616100040101011E0A082C0F1C1F180E193E030061
        616161616100040101012011211706590C0C0C0C0C0300616161616161000401
        010101561108332300000000000000616161616161000401010101351051325A
        00534F27270007616161616161000401010101011E0A0833001B385200076161
        61616161610004010101010120103F32001B3800076161616161616161000401
        0101010101340A08001B00076161616161616161610004040404040404040404
        0000076161616161616161616100000000000000000000000007616161616161
        6161}
      ShowHint = True
      Transparent = True
    end
    object BtnImageIcons: TImage
      Left = 79
      Top = 6
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Hint = 'Muestra el resultado en Iconos'
      ParentShowHint = False
      Picture.Data = {
        07544269746D617076060000424D760600000000000036040000280000001800
        0000180000000100080000000000400200000000000000000000000100000000
        000066333300CC666600AD575700F097970000000000F0C7C700D1741000F0B6
        B600D0700C00FFFFFF00FFABAB00E5B0B000B2B2B200FFA9A900DB923400C281
        8100D5812000FFBEBE00FFD1D100D98D2E00FFDAD900FFEAC700D27A1700FFC1
        C100D7872700DE9A3E00CC670200FFD2D200FFEEEF00FFA0A000D0751100FFF2
        F200DD9A9A00D37A1800CE6D0800CD690400FFEDD100F09B9B00FFF8EC00FFDF
        DE00FFE6E500CC660100CC680300FF999900FFF4E300FFB4B400D37C1A00F0D1
        D100D0731000FFD8D700FFEED500D47E1D00CF700B00F08F9000FFBABA00CE6C
        0800FFCECE00FF9B9C00CD6B0600CD6B0500FFB9BA00CC670100CF710D00FFDA
        DA00D5801F00FFA8A800DD777700FFADAE00D6832200DC912800FFA4A500D073
        0F00DD7A7A00CF6D0900FFC3C400FFCACA00FFB5B500E5898900FFAFAF00F7A5
        A500F0B7B700CD690300FFFFFF00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000370000007C922900922C990000007C00180026000012
        F5000000000000000000800000000012F50012F5A8002CB700006C7C92000001
        B60026301000F5880000000012000000000080A08E0000007C00100026000026
        300012F58800A0A50000F47C80000012F50000792C0000000000100000000000
        000000001200F5F80000FE0012000000000012F5BC00F0FF00006877D1000048
        5B000000FE00F5D400006200120000279E000000240000000000FE0000000000
        000000000000F5E800005D00120077D24A00000000009E620000120027000000
        000012F5F80000120000000000000000000047D0CA005B7600003F004800001D
        D3001DD2C800A9AB00000000420000260000279E620000240000FF0000000000
        000042AAC100792C00006800000000485B000000FF00D33F000071001D000012
        F60041DCA900792C0000C8000000001DD2000000000000000000280000000018
        EE0000007700001D0000200000000000010000010600000000003C0014000012
        F400706D6200F6983B00180012007C91EE009206F000FFFF7C00EBFFFF007C92
        0600809A0F0000007C000800140000140000809A2000D2C87C0000001D000000
        00000000000000000000000000000000000044C0C400EE5B0000040018000017
        450018EE5F00F9AF0000FF001200FFFFFF0018EE2800C12E00005B0044000018
        EE0052525252520F0202020202020202020202020F525252525252525252520F
        503F4B36364F2525253535480F52525252525252525252200F38384A3C3C411D
        1D1D1D0F20525252525252525252522F200F4D434639392B2B420F202F525252
        5252520B01010202020202020202020202020202020202010B520B0103030303
        03030303030303030303030303030303010B010712111111111111112D2D0A0A
        0A0A0A0A0A0A0A0D03010107120000000000000000000000000000000000000D
        030201071200060606060608080808080808493A3A1A000D0302010712000606
        060804040404040404040822231A000D030201071200060606080409262C2415
        150408221A29000D030201071200060606080409262C2432150408222329000D
        0302010712000606060804090C0C0C0C150408222329000D0302010731001616
        161E04092609243215041E343B3D000D0302010731001616161E04090C0C0C0C
        15041E343B3D004E0302010727001010102104090909040404042130371A004C
        0302010727001010102104090909044504102130371A00170302010727000E0E
        18180409090904040E18332E3E2A0017030201071C000E0E0E1804040404040E
        0E18332E3E2A0017030201071C00191919131313131313191913444047510017
        030201071C00000000000000000000000000000000000017030201071C1F1F1F
        1F282828141414141414141B1B1B1B1703010B01050505050505050505050505
        0505050505050505010B520B0101010101010101010101010101010101010101
        0B52}
      ShowHint = True
      Transparent = True
    end
  end
end