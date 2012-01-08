unit CRSQLConnection;
interface

uses
  Windows, Messages, SysUtils, Classes, DB, SqlExpr, DBXpress;

type
  TCRSQLConnection = class(TSQLConnection)
  private
  protected
    procedure ConnectionOptions; override;
  public
    function CreateQuery(const prmSQL :array of string):TSQLQuery;
  published
  end;

implementation

const
  coLongStrings         = TSQLConnectionOption(101);
  coEnableBCD           = TSQLConnectionOption(102);
  coTrimFixedChar       = TSQLConnectionOption(103);
  coInternalName        = TSQLConnectionOption(201);
  coUseQuoteChar        = TSQLConnectionOption(202);
  coCharLength          = TSQLConnectionOption(203);
  coCharset             = TSQLConnectionOption(204);
  coIntegerPrecision    = TSQLConnectionOption(205);
  coSmallIntPrecision   = TSQLConnectionOption(206);
  coFloatPrecision      = TSQLConnectionOption(207);
  coBCDPrecision        = TSQLConnectionOption(208);
  coUseUnicode          = TSQLConnectionOption(209);
  coFetchAll            = TSQLConnectionOption(301);
  coPrepared            = TSQLConnectionOption(302);
  coParamPrefix         = TSQLConnectionOption(303);
  coEnableBoolean       = TSQLConnectionOption(304);
  //coUseUTF8             = TSQLConnectionOption(305);
  coCommandTimeout      = TSQLConnectionOption(306);
  coRequiredFields      = TSQLConnectionOption(307);

  SLongStrings          = 'LongStrings';
  SEnableBCD            = 'EnableBCD';
  SInternalName         = 'InternalName';
  SUseQuoteChar         = 'UseQuoteChar';
  SFetchAll             = 'FetchAll';
  SCharLength           = 'CharLength';
  SPrepared             = 'Prepared';
  SParamPrefix          = 'ParamPrefix';
  STrimFixedChar        = 'TrimFixedChar';
  SCharset              = 'Charset';
  SIntegerPrecision     = 'IntegerPrecision';
  SSmallIntPrecision    = 'SmallIntPrecision';
  SFloatPrecision       = 'FloatPrecision';
  SBCDPrecision         = 'BCDPrecision';
  SEnableBoolean        = 'EnableBoolean';
  SUseUnicode           = 'UseUnicode';
  //SUseUTF8              = 'UseUTF8';
  SCommandTimeout       = 'CommandTimeout';
  SCommandTimeout2      = 'Command Timeout';
  SRequiredFields       = 'RequiredFields';

{ TCRSQLConnection }

procedure TCRSQLConnection.ConnectionOptions;
begin
  if Params.Values[SUseQuoteChar     ] <> '' then SQLConnection.SetOption(coUseQuoteChar     , LongInt (UpperCase(trim(Params.Values[SUseQuoteChar     ])) = 'TRUE'));
  inherited;
  if Params.Values[SLongStrings      ] <> '' then SQLConnection.SetOption(coLongStrings      , LongInt (UpperCase(trim(Params.Values[SLongStrings      ])) = 'TRUE'));
  if Params.Values[SEnableBCD        ] <> '' then SQLConnection.SetOption(coEnableBCD        , LongInt (UpperCase(trim(Params.Values[SEnableBCD        ])) = 'TRUE'));
  if Params.Values[SInternalName     ] <> '' then SQLConnection.SetOption(coInternalName     , Integer (               Params.Values[SInternalName     ]));
  if Params.Values[SFetchAll         ] <> '' then SQLConnection.SetOption(coFetchAll         , LongInt (UpperCase(trim(Params.Values[SFetchAll         ])) = 'TRUE'));
  if Params.Values[SCharLength       ] <> '' then SQLConnection.SetOption(coCharLength       , StrToInt(          trim(Params.Values[SCharLength       ])));
  if Params.Values[SPrepared         ] <> '' then SQLConnection.SetOption(coPrepared         , LongInt (UpperCase(trim(Params.Values[SPrepared         ])) = 'TRUE'));
  if Params.Values[SParamPrefix      ] <> '' then SQLConnection.SetOption(coParamPrefix      , LongInt (UpperCase(trim(Params.Values[SParamPrefix      ])) = 'TRUE'));
  if Params.Values[STrimFixedChar    ] <> '' then SQLConnection.SetOption(coTrimFixedChar    , LongInt (UpperCase(trim(Params.Values[STrimFixedChar    ])) = 'TRUE'));
  if Params.Values[SCharset          ] <> '' then SQLConnection.SetOption(coCharset          , Integer (               Params.Values[SCharset          ]));
  if Params.Values[SIntegerPrecision ] <> '' then SQLConnection.SetOption(coIntegerPrecision , StrToInt(               Params.Values[SIntegerPrecision ]));
  if Params.Values[SSmallIntPrecision] <> '' then SQLConnection.SetOption(coSmallIntPrecision, StrToInt(               Params.Values[SSmallIntPrecision]));
  if Params.Values[SFloatPrecision   ] <> '' then SQLConnection.SetOption(coFloatPrecision   , StrToInt(               Params.Values[SFloatPrecision   ]));
  if Params.Values[SBCDPrecision     ] <> '' then SQLConnection.SetOption(coBCDPrecision     , Integer (               Params.Values[SBCDPrecision     ]));
  if Params.Values[SEnableBoolean    ] <> '' then SQLConnection.SetOption(coEnableBoolean    , Integer (               Params.Values[SEnableBoolean    ]));
  if Params.Values[SUseUnicode       ] <> '' then SQLConnection.SetOption(coUseUnicode       , LongInt (UpperCase(trim(Params.Values[SUseUnicode       ])) = 'TRUE'));
{ if Params.Values[SUseUTF8          ] <> '' then SQLConnection.SetOption(coUseUTF8          , LongInt (UpperCase(trim(Params.Values[SUseUTF8          ])) = 'TRUE'));}
  if Params.Values[SCommandTimeout   ] <> '' then SQLConnection.SetOption(coCommandTimeout   , StrToInt(               Params.Values[SCommandTimeout   ]));
  if Params.Values[SCommandTimeout2  ] <> '' then SQLConnection.SetOption(coCommandTimeout   , StrToInt(               Params.Values[SCommandTimeout2  ]));
  if Params.Values[SRequiredFields   ] <> '' then SQLConnection.SetOption(coRequiredFields   , LongInt (          PChar(Params.Values[SRequiredFields  ])));
end;

function TCRSQLConnection.CreateQuery(const prmSQL :array of string):TSQLQuery;
var Query :TSQLQuery;
    i     :Integer;
begin
   Query := TSQLQuery.Create(nil);
   Query.SQLConnection := Self;
   for i := Low(prmSQL) to High(prmSQL) do begin
      Query.SQL.Add(prmSQL[i]);
   end;
   Result := Query;
end;

end.
