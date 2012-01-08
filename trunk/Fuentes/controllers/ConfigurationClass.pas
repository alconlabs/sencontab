unit ConfigurationClass;

interface

uses Classes, Graphics, CRSQLConnection;

type
  TSdaDBConfig = class
  private
    FDriverName         :string;
    FLibraryName        :string;
    FBlobSize           :Integer;
    FLongStrings        :Boolean;
    FEnableBCD          :Boolean;
    FFetchAll           :Boolean;
    FTrimFixedChar      :Boolean;

    FHostName           :string;
    FDataBase           :string;
    FUser_Name          :string;
    FPassword           :string;
    function  GetDBVersion :string;
    procedure SetPassword(Value :string);
    function  GetPassword:string;
    function  Crypto(const Value :string):string;
  public
    constructor Create;
    procedure AssignValuesTo(prmDB :TCRSQLConnection);
    property DBVersion     :string  read GetDBVersion; {This value is not for INI file.}

    property DriverName    :string  read FDriverName    write FDriverName   ;
    property LibraryName   :string  read FLibraryName   write FLibraryName  ;
    property BlobSize      :Integer read FBlobSize      write FBlobSize     ;
    property LongStrings   :Boolean read FLongStrings   write FLongStrings  ;
    property EnableBCD     :Boolean read FEnableBCD     write FEnableBCD    ;
    property FetchAll      :Boolean read FFetchAll      write FFetchAll     ;
    property TrimFixedChar :Boolean read FTrimFixedChar write FTrimFixedChar;

    property HostName      :string  read FHostName      write FHostName     ;
    property DataBase      :string  read FDataBase      write FDataBase     ;
    property User_Name     :string  read FUser_Name     write FUser_Name    ;
    property Password      :string  read GetPassword    write SetPassword   ;
  end;

  TConfiguration = class
  private
    FDBConfig            :TSdaDBConfig;

    FTempFolder          :string;      {TODO : When assign this value, if the folder doesn't exist, create it}
    FDelayDocuments      :Integer;
    FRemoteUser          :Boolean;

    function  IsKeyPressed(const VirtKeyCode: Integer): Boolean;
    function  GetConfigFileName:string;
    function  CheckEnvironment():Boolean;
    function  IsApplicationOK :Boolean;
  public
    constructor Create();
    destructor  Destroy(); override;
    /// <summary>
    /// Get the current instance of the class a save it into the configuration file to allow the next run of the appliction
    /// to use the current parameters.
    /// <param name="FileName">Is the name of the target file. </param>
    /// <param name="Config"  >Is the Configuratgion to be serialized in a XML file. </param>
    /// </summary>
    procedure Serialize;
    /// <summary>
    /// Read from the XML file in the system the curren configuration and assign the values to his respectives properties.
    /// <param name="FileName">Is the name of the origin file. </param>
    /// <returns> A TConfiguration class object. </returns>
    /// </summary>
    procedure Deserialize;
    /// <summary>
    /// Indicate the version of the program that we are currently running.
    /// <returns> A string containing the text of the version. </returns>
    /// </summary>
    property DBConfig       :TSdaDBConfig read FDBConfig    write FDBConfig;
    property ConfigFileName :string       read GetConfigFileName;
  end;

implementation

uses SysUtils, Forms, INIFiles, Utilidades, Windows, Dialogs, SqlExpr, DBXpress,
     WizardConnectDB, HashCriptography;

constructor TConfiguration.Create();
begin
   inherited;
   FDBConfig := TSdaDBConfig.Create;
  
   FTempFolder     := ExtractFilePath(Application.ExeName)+'TEMP';
   FDelayDocuments := 60000;
   FRemoteUser     := False;

   DecimalSeparator  := ',';
   ThousandSeparator := '.';
   CurrencyDecimals  :=  2 ;
   DateSeparator     := '/';
   ShortDateFormat   := 'dd/mm/yyyy';
   LongDateFormat    := 'dd de mmmm de yyyy';
   TimeSeparator     := ':';
   ShortTimeFormat   := 'hh:mm';
   LongTimeFormat    := 'hh:mm:ss';

   ShortMonthNames[ 1] := 'Ene';
   ShortMonthNames[ 2] := 'Feb';
   ShortMonthNames[ 3] := 'Mar';
   ShortMonthNames[ 4] := 'Abr';
   ShortMonthNames[ 5] := 'May';
   ShortMonthNames[ 6] := 'Jun';
   ShortMonthNames[ 7] := 'Jul';
   ShortMonthNames[ 8] := 'Ago';
   ShortMonthNames[ 9] := 'Sep';
   ShortMonthNames[10] := 'Oct';
   ShortMonthNames[11] := 'Nov';
   ShortMonthNames[12] := 'Dic';

   LongMonthNames[ 1] := 'Enero'     ;
   LongMonthNames[ 2] := 'Febrero'   ;
   LongMonthNames[ 3] := 'Marzo'     ;
   LongMonthNames[ 4] := 'Abril'     ;
   LongMonthNames[ 5] := 'Mayo'      ;
   LongMonthNames[ 6] := 'Junio'     ;
   LongMonthNames[ 7] := 'Julio'     ;
   LongMonthNames[ 8] := 'Agosto'    ;
   LongMonthNames[ 9] := 'Septiembre';
   LongMonthNames[10] := 'Octubre'   ;
   LongMonthNames[11] := 'Noviembre' ;
   LongMonthNames[12] := 'Diciembre' ;

   ShortDayNames[1] := 'Dom';
   ShortDayNames[2] := 'Lun';
   ShortDayNames[3] := 'Mar';
   ShortDayNames[4] := 'Mie';
   ShortDayNames[5] := 'Jue';
   ShortDayNames[6] := 'Vie';
   ShortDayNames[7] := 'Sáb';

   LongDayNames[1] := 'Domingo'  ;
   LongDayNames[2] := 'Lunes'    ;
   LongDayNames[3] := 'Martes'   ;
   LongDayNames[4] := 'Miércoles';
   LongDayNames[5] := 'Jueves'   ;
   LongDayNames[6] := 'Viernes'  ;
   LongDayNames[7] := 'Sábado'   ;

   TwoDigitYearCenturyWindow := 25;

   CheckEnvironment();
   if not IsApplicationOK then begin
      MessageDlg('Error : The database don''t seems to be a senCille accounting Database.', mtError, [mbOK], 0);
      Application.Terminate;
   end;
end;

destructor TConfiguration.Destroy();
begin
   FDBConfig.Free;
end;

function TConfiguration.IsKeyPressed(const VirtKeyCode: Integer): Boolean;
begin
   // High bit set when key is pressed => GetKeyState returns -ve value
   Result := Windows.GetKeyState(VirtKeyCode) < 0;
end;

function TConfiguration.CheckEnvironment():Boolean;
var WizardConnection :TWizardConnectDB;
begin
   {TODO: improve... shall return true or false correctly. And out of here, this value shall be managed.}

   if not FileExists(ConfigFileName) then begin
      try
        WizardConnection := TWizardConnectDB.CreateWizard(Self);
        Result := WizardConnection.Execute;
      except
        MessageDlg('No fué posible configurar la aplicación: ' + ConfigFileName+'.', mtInformation, [mbOK], 0);
        Result := False;
      end;
   end
   else begin
     // Configuration file Exists
     try
        if IsKeyPressed(VK_SHIFT) then begin
           Deserialize;
           try
              WizardConnection := TWizardConnectDB.CreateWizard(Self);
              Result := WizardConnection.Execute;
           except
              MessageDlg('No fué posible configurar la aplicación: ' + ConfigFileName+'.', mtInformation, [mbOK], 0);
              Result := False;
           end;
        end
        else Deserialize;
     except
       Result := False;
     end;
   end;
end;

function TConfiguration.IsApplicationOK :Boolean;
var DB :TCRSQLConnection;
    Q  :TSQLQuery;
begin
   DB := TCRSQLConnection.Create(nil);
   Self.DBConfig.AssignValuesTo(DB);
   try
      Q := DB.CreateQuery(
           ['SELECT COUNT(*) THEREIS             ',
            'FROM   APPLICATIONS                 ',
            'WHERE  APPLICATION = ''ACCOUNTING'' ']);
      try
         try
            Q.Open;
            Result := Q.FieldByName('THEREIS').AsInteger > 0;
         except
            Result := False;
         end;
      finally
         Q.Free;
      end;

      if Result then begin
         Q := DB.CreateQuery(
              ['SELECT DB_VERSION                   ',
               'FROM   APPLICATIONS                 ',
               'WHERE  APPLICATION = ''ACCOUNTING'' ']);
         try
            try
               Q.Open;
               Result := Q.FieldByName('DB_VERSION').AsString = Self.DBConfig.DBVersion;
            except
               Result := False;
            end;
         finally
            Q.Free;
         end;
      end;
   finally
     DB.Free;
   end;
end;

procedure TConfiguration.Serialize;
var ConfigFile  :TIniFile;
begin
   ConfigFile := TIniFile.Create(ConfigFileName);
   try
      {SDADBCONFIG}
      ConfigFile.WriteString ('SDADBCONFIG', 'DriverName'   , FDBConfig.FDriverName   );
      ConfigFile.WriteString ('SDADBCONFIG', 'LibraryName'  , FDBConfig.FLibraryName  );

      ConfigFile.WriteInteger('SDADBCONFIG', 'BlobSize'     , FDBConfig.FBlobSize     );
      if FDBConfig.FLongStrings then ConfigFile.WriteString('SDADBCONFIG', 'LongStrings'  , 'TRUE')
                                else ConfigFile.WriteString('SDADBCONFIG', 'LongStrings'  , 'FALSE');

      if FDBConfig.FEnableBCD then ConfigFile.WriteString('SDADBCONFIG', 'EnableBCD'    , 'TRUE' )
                              else ConfigFile.WriteString('SDADBCONFIG', 'EnableBCD'    , 'FALSE');

      if FDBConfig.FFetchAll then ConfigFile.WriteString('SDADBCONFIG', 'FetchAll'     , 'TRUE' )
                             else ConfigFile.WriteString('SDADBCONFIG', 'FetchAll'     , 'FALSE');

      if FDBConfig.FTrimFixedChar then ConfigFile.WriteString('SDADBCONFIG', 'TrimFixedChar', 'TRUE' )
                                  else ConfigFile.WriteString('SDADBCONFIG', 'TrimFixedChar', 'FALSE');

      ConfigFile.WriteString ('SDADBCONFIG', 'HostName'     , FDBConfig.FHostName     );
      ConfigFile.WriteString ('SDADBCONFIG', 'DataBase'     , FDBConfig.FDataBase     );
      ConfigFile.WriteString ('SDADBCONFIG', 'User_Name'    , FDBConfig.FUser_Name    );
      ConfigFile.WriteString ('SDADBCONFIG', 'Password'     , FDBConfig.FPassword     );

      {OPTIONS}                                                                          {Si no existe tempfolder, crearlo en este momento.}
      ConfigFile.WriteString ('OPTIONS'    , 'TempFolder'    , FTempFolder            ); {FTempFolder     := ExtractFilePath(Application.ExeName)+'TEMP';}
      ConfigFile.WriteInteger('OPTIONS'    , 'DelayDocuments', FDelayDocuments        );

      if FRemoteUser then ConfigFile.WriteString('OPTIONS'    , 'RemoteUser'    , 'TRUE' )
                     else ConfigFile.WriteString('OPTIONS'    , 'RemoteUser'    , 'FALSE');

      {FORMATS}
      ConfigFile.WriteString ('FORMATS', 'DecimalSeparator'   , DecimalSeparator );
      ConfigFile.WriteString ('FORMATS', 'ThousandSeparator'  , ThousandSeparator);
      ConfigFile.WriteInteger('FORMATS', 'CurrencyDecimals'   , CurrencyDecimals );
      ConfigFile.WriteString ('FORMATS', 'DateSeparator'      , DateSeparator    );
      ConfigFile.WriteString ('FORMATS', 'ShortDateFormat'    , ShortDateFormat  );
      ConfigFile.WriteString ('FORMATS', 'LongDateFormat'     , LongDateFormat   );
      ConfigFile.WriteString ('FORMATS', 'TimeSeparator'      , TimeSeparator    );
      ConfigFile.WriteString ('FORMATS', 'ShortTimeFormat'    , ShortTimeFormat  );
      ConfigFile.WriteString ('FORMATS', 'LongTimeFormat'     , LongTimeFormat   );

      ConfigFile.WriteString('FORMATS', 'ShortMonthNames__1', ShortMonthNames[ 1]);
      ConfigFile.WriteString('FORMATS', 'ShortMonthNames__2', ShortMonthNames[ 2]);
      ConfigFile.WriteString('FORMATS', 'ShortMonthNames__3', ShortMonthNames[ 3]);
      ConfigFile.WriteString('FORMATS', 'ShortMonthNames__4', ShortMonthNames[ 4]);
      ConfigFile.WriteString('FORMATS', 'ShortMonthNames__5', ShortMonthNames[ 5]);
      ConfigFile.WriteString('FORMATS', 'ShortMonthNames__6', ShortMonthNames[ 6]);
      ConfigFile.WriteString('FORMATS', 'ShortMonthNames__7', ShortMonthNames[ 7]);
      ConfigFile.WriteString('FORMATS', 'ShortMonthNames__8', ShortMonthNames[ 8]);
      ConfigFile.WriteString('FORMATS', 'ShortMonthNames__9', ShortMonthNames[ 9]);
      ConfigFile.WriteString('FORMATS', 'ShortMonthNames_10', ShortMonthNames[10]);
      ConfigFile.WriteString('FORMATS', 'ShortMonthNames_11', ShortMonthNames[11]);
      ConfigFile.WriteString('FORMATS', 'ShortMonthNames_12', ShortMonthNames[12]);

      ConfigFile.WriteString('FORMATS', 'LongMonthNames__1', LongMonthNames[ 1]);
      ConfigFile.WriteString('FORMATS', 'LongMonthNames__2', LongMonthNames[ 2]);
      ConfigFile.WriteString('FORMATS', 'LongMonthNames__3', LongMonthNames[ 3]);
      ConfigFile.WriteString('FORMATS', 'LongMonthNames__4', LongMonthNames[ 4]);
      ConfigFile.WriteString('FORMATS', 'LongMonthNames__5', LongMonthNames[ 5]);
      ConfigFile.WriteString('FORMATS', 'LongMonthNames__6', LongMonthNames[ 6]);
      ConfigFile.WriteString('FORMATS', 'LongMonthNames__7', LongMonthNames[ 7]);
      ConfigFile.WriteString('FORMATS', 'LongMonthNames__8', LongMonthNames[ 8]);
      ConfigFile.WriteString('FORMATS', 'LongMonthNames__9', LongMonthNames[ 9]);
      ConfigFile.WriteString('FORMATS', 'LongMonthNames_10', LongMonthNames[10]);
      ConfigFile.WriteString('FORMATS', 'LongMonthNames_11', LongMonthNames[11]);
      ConfigFile.WriteString('FORMATS', 'LongMonthNames_12', LongMonthNames[12]);

      ConfigFile.WriteString('FORMATS', 'ShortDayNames_1', ShortDayNames[1]);
      ConfigFile.WriteString('FORMATS', 'ShortDayNames_2', ShortDayNames[2]);
      ConfigFile.WriteString('FORMATS', 'ShortDayNames_3', ShortDayNames[3]);
      ConfigFile.WriteString('FORMATS', 'ShortDayNames_4', ShortDayNames[4]);
      ConfigFile.WriteString('FORMATS', 'ShortDayNames_5', ShortDayNames[5]);
      ConfigFile.WriteString('FORMATS', 'ShortDayNames_6', ShortDayNames[6]);
      ConfigFile.WriteString('FORMATS', 'ShortDayNames_7', ShortDayNames[7]);

      ConfigFile.WriteString('FORMATS', 'LongDayNames_1', LongDayNames[1]);
      ConfigFile.WriteString('FORMATS', 'LongDayNames_2', LongDayNames[2]);
      ConfigFile.WriteString('FORMATS', 'LongDayNames_3', LongDayNames[3]);
      ConfigFile.WriteString('FORMATS', 'LongDayNames_4', LongDayNames[4]);
      ConfigFile.WriteString('FORMATS', 'LongDayNames_5', LongDayNames[5]);
      ConfigFile.WriteString('FORMATS', 'LongDayNames_6', LongDayNames[6]);
      ConfigFile.WriteString('FORMATS', 'LongDayNames_7', LongDayNames[7]);

      ConfigFile.WriteInteger('FORMATS','TwoDigitYearCenturyWindow', TwoDigitYearCenturyWindow);
      ConfigFile.UpdateFile;
   finally
      ConfigFile.Free;
   end;
end;

procedure TConfiguration.Deserialize;
var ConfigFile  :TIniFile;
    BooleanStr  :string;
begin
   ConfigFile := TIniFile.Create(ConfigFileName);
   try
      FDBConfig.FDriverName    := ConfigFile.ReadString ('SDADBCONFIG', 'DriverName'   , 'SQLServer'     );
      FDBConfig.FLibraryName   := ConfigFile.ReadString ('SDADBCONFIG', 'LibraryName'  , 'dbexpsda.dll'  ); // 'dbexpsda30.dll' - for Delphi 2006 or Turbo products

      FDBConfig.FBlobSize      := ConfigFile.ReadInteger('SDADBCONFIG', 'BlobSize'     , -1              );

      BooleanStr := ConfigFile.ReadString('SDADBCONFIG', 'LongStrings'  , 'TRUE');
      FDBConfig.FLongStrings := UpperCase(BooleanStr) = 'TRUE';

      BooleanStr := ConfigFile.ReadString('SDADBCONFIG', 'EnableBCD'    , 'TRUE');
      FDBConfig.FEnableBCD := UpperCase(BooleanStr) = 'TRUE';

      BooleanStr := ConfigFile.ReadString('SDADBCONFIG', 'FetchAll'     , 'TRUE');
      FDBConfig.FFetchAll := UpperCase(BooleanStr) = 'TRUE';

      BooleanStr := ConfigFile.ReadString('SDADBCONFIG', 'TrimFixedChar', 'TRUE');
      FDBConfig.FTrimFixedChar := UpperCase(BooleanStr) = 'TRUE';

      FDBConfig.FHostName      := ConfigFile.ReadString ('SDADBCONFIG', 'HostName'     , '');
      FDBConfig.FDataBase      := ConfigFile.ReadString ('SDADBCONFIG', 'DataBase'     , '');
      FDBConfig.FUser_Name     := ConfigFile.ReadString ('SDADBCONFIG', 'User_Name'    , '');
      FDBConfig.FPassword      := ConfigFile.ReadString ('SDADBCONFIG', 'Password'     , '');

      {OPTIONS}
      FTempFolder            := ConfigFile.ReadString ('OPTIONS'    , 'TempFolder'    , ExtractFilePath(Application.ExeName)+'TEMP');
      FDelayDocuments        := ConfigFile.ReadInteger('OPTIONS'    , 'DelayDocuments', 60000                                      );

      BooleanStr := ConfigFile.ReadString('OPTIONS'    , 'RemoteUser'    , 'FALSE');
      FRemoteUser := UpperCase(BooleanStr) = 'TRUE';

      DecimalSeparator  := ConfigFile.ReadString ('FORMATS', 'SEPARADOR_DECIMALES' , ','                      )[1];
      ThousandSeparator := ConfigFile.ReadString ('FORMATS', 'SEPARADOR_DE_MILES'  , '.'                      )[1];
      CurrencyDecimals  := ConfigFile.ReadInteger('FORMATS', 'DECIMALES_MONEDA'    ,  2                       );
      DateSeparator     := ConfigFile.ReadString ('FORMATS', 'SEPARADOR_FECHA'     , '/'                      )[1];
      ShortDateFormat   := ConfigFile.ReadString ('FORMATS', 'FORMATO_FECHA_CORTA' , 'dd/mm/yyyy'             );
      LongDateFormat    := ConfigFile.ReadString ('FORMATS', 'FORMATO_FECHA_LARGA' , 'dd de mmmm del año yyyy');
      TimeSeparator     := ConfigFile.ReadString ('FORMATS', 'SEPARADOR_HORA'      , ':'                      )[1];
      ShortTimeFormat   := ConfigFile.ReadString ('FORMATS', 'FORMATO_HORA_CORTA'  , 'hh:mm'                  );
      LongTimeFormat    := ConfigFile.ReadString ('FORMATS', 'FORMATO_HORA_LARGA'  , 'hh:mm:ss'               );

      ShortMonthNames[ 1] := ConfigFile.ReadString('FORMATS', 'NOMBRE_CORTO_MES_1' , 'Ene');
      ShortMonthNames[ 2] := ConfigFile.ReadString('FORMATS', 'NOMBRE_CORTO_MES_2' , 'Feb');
      ShortMonthNames[ 3] := ConfigFile.ReadString('FORMATS', 'NOMBRE_CORTO_MES_3' , 'Mar');
      ShortMonthNames[ 4] := ConfigFile.ReadString('FORMATS', 'NOMBRE_CORTO_MES_4' , 'Abr');
      ShortMonthNames[ 5] := ConfigFile.ReadString('FORMATS', 'NOMBRE_CORTO_MES_5' , 'May');
      ShortMonthNames[ 6] := ConfigFile.ReadString('FORMATS', 'NOMBRE_CORTO_MES_6' , 'Jun');
      ShortMonthNames[ 7] := ConfigFile.ReadString('FORMATS', 'NOMBRE_CORTO_MES_7' , 'Jul');
      ShortMonthNames[ 8] := ConfigFile.ReadString('FORMATS', 'NOMBRE_CORTO_MES_8' , 'Ago');
      ShortMonthNames[ 9] := ConfigFile.ReadString('FORMATS', 'NOMBRE_CORTO_MES_9' , 'Sep');
      ShortMonthNames[10] := ConfigFile.ReadString('FORMATS', 'NOMBRE_CORTO_MES_10', 'Oct');
      ShortMonthNames[11] := ConfigFile.ReadString('FORMATS', 'NOMBRE_CORTO_MES_11', 'Nov');
      ShortMonthNames[12] := ConfigFile.ReadString('FORMATS', 'NOMBRE_CORTO_MES_12', 'Dic');

      LongMonthNames[ 1] := ConfigFile.ReadString('FORMATS', 'NOMBRE_LARGO_MES_1' , 'Enero'     );
      LongMonthNames[ 2] := ConfigFile.ReadString('FORMATS', 'NOMBRE_LARGO_MES_2' , 'Febrero'   );
      LongMonthNames[ 3] := ConfigFile.ReadString('FORMATS', 'NOMBRE_LARGO_MES_3' , 'Marzo'     );
      LongMonthNames[ 4] := ConfigFile.ReadString('FORMATS', 'NOMBRE_LARGO_MES_4' , 'Abril'     );
      LongMonthNames[ 5] := ConfigFile.ReadString('FORMATS', 'NOMBRE_LARGO_MES_5' , 'Mayo'      );
      LongMonthNames[ 6] := ConfigFile.ReadString('FORMATS', 'NOMBRE_LARGO_MES_6' , 'Junio'     );
      LongMonthNames[ 7] := ConfigFile.ReadString('FORMATS', 'NOMBRE_LARGO_MES_7' , 'Julio'     );
      LongMonthNames[ 8] := ConfigFile.ReadString('FORMATS', 'NOMBRE_LARGO_MES_8' , 'Agosto'    );
      LongMonthNames[ 9] := ConfigFile.ReadString('FORMATS', 'NOMBRE_LARGO_MES_9' , 'Septiembre');
      LongMonthNames[10] := ConfigFile.ReadString('FORMATS', 'NOMBRE_LARGO_MES_10', 'Octubre'   );
      LongMonthNames[11] := ConfigFile.ReadString('FORMATS', 'NOMBRE_LARGO_MES_11', 'Noviembre' );
      LongMonthNames[12] := ConfigFile.ReadString('FORMATS', 'NOMBRE_LARGO_MES_12', 'Diciembre' );

      ShortDayNames[1] := ConfigFile.ReadString('FORMATS', 'NOMBRE_CORTO_DIA_1', 'Dom');
      ShortDayNames[2] := ConfigFile.ReadString('FORMATS', 'NOMBRE_CORTO_DIA_2', 'Lun');
      ShortDayNames[3] := ConfigFile.ReadString('FORMATS', 'NOMBRE_CORTO_DIA_3', 'Mar');
      ShortDayNames[4] := ConfigFile.ReadString('FORMATS', 'NOMBRE_CORTO_DIA_4', 'Mie');
      ShortDayNames[5] := ConfigFile.ReadString('FORMATS', 'NOMBRE_CORTO_DIA_5', 'Jue');
      ShortDayNames[6] := ConfigFile.ReadString('FORMATS', 'NOMBRE_CORTO_DIA_6', 'Vie');
      ShortDayNames[7] := ConfigFile.ReadString('FORMATS', 'NOMBRE_CORTO_DIA_7', 'Sáb');

      LongDayNames[1] := ConfigFile.ReadString('FORMATS', 'NOMBRE_LARGO_DIA_1', 'Domingo'  );
      LongDayNames[2] := ConfigFile.ReadString('FORMATS', 'NOMBRE_LARGO_DIA_2', 'Lunes'    );
      LongDayNames[3] := ConfigFile.ReadString('FORMATS', 'NOMBRE_LARGO_DIA_3', 'Martes'   );
      LongDayNames[4] := ConfigFile.ReadString('FORMATS', 'NOMBRE_LARGO_DIA_4', 'Miércoles');
      LongDayNames[5] := ConfigFile.ReadString('FORMATS', 'NOMBRE_LARGO_DIA_5', 'Jueves'   );
      LongDayNames[6] := ConfigFile.ReadString('FORMATS', 'NOMBRE_LARGO_DIA_6', 'Viernes'  );
      LongDayNames[7] := ConfigFile.ReadString('FORMATS', 'NOMBRE_LARGO_DIA_7', 'Sábado'   );

      TwoDigitYearCenturyWindow := ConfigFile.ReadInteger('FORMATS','VENTANA_CENTURIA_PARA_DOS_DIGITOS',25);
   finally
      ConfigFile.Free;
   end;
end;

{ TSDADBCONFIG }
procedure TSDADBCONFIG.AssignValuesTo(prmDB :TCRSQLConnection);
begin
   prmDB.LoginPrompt    := False;
   prmDB.KeepConnection := True;
   prmDB.ConnectionName := 'SQLConnection';
   prmDB.DriverName     := FDriverName;
   prmDB.LibraryName    := FLibraryName;
   prmDB.GetDriverFunc  := 'getSQLDriverSQLServer';
   prmDB.VendorLib      := 'sqloledb.dll';
   prmDB.Params.Add('BlobSize=-1');


   { EnableBCD }
   { This boolean option with True value allows dataset to represent number fields as TBCDField and TFMTBCDField.                                 }
   { The default value of this option is True (beginning from version 1.80). If you assign EnableBCD to False it establishes the following values }
   { To use this option with TCRSQLConnection you may set it in Params property of TCRSQLConnection.                                              }

   //prmDB.SQLConnection.SetOption(coEnableBCD, Integer(FEnableBCD));
   if FEnableBCD then prmDB.Params.Add('EnableBCD=True' )
                 else prmDB.Params.Add('EnableBCD=False');

   { CommandTimeout }
   { This integer option specifies amount of time to attempt execution of a command. Use CommandTimeout to specify the amount of time that expires }
   { before an attempt to execute a command is considered unsuccessful. Measured in seconds. If a command is successfully executed prior to the    }
   { expiration of the seconds specified, CommandTimeout has no effect.                                                                            }
   { The default value is 0 (infinite).                                                                                                            }

   //prmDB.SQLConnection.SetOption(coCommandTimeout, 3); {not used}

   { FetchAll }
   { Set FetchAll to True to request all records of the query from database server when the dataset is opening. When set to False, records are     }
   { retrieved when a data-aware component or a program requests it. If a query can return a lot of records, set this property to False if initial }
   { response time is important.                                                                                                                   }
   { Note: in some cases FetchAll = False may conflict with transaction control, working with temporary tables and may cause deadlocks on editing  }
   { statements with ORDER BY clause.    Default value is True.                                                                                    }

   //prmDB.SQLConnection.SetOption(coFetchAll, Integer(FFetchAll));
   if FFetchAll then prmDB.Params.Add('FetchAll=True' )
                else prmDB.Params.Add('FetchAll=False');

   { LongStrings }
   { This boolean option when turned on allows dataset to represent long strings (more than 255 symbols) as memo. }
   { Default value of this option is True.                                                                        }

   //prmDB.SQLConnection.SetOption(coLongStrings, Integer(FLongStrings));
   if FLongStrings then prmDB.Params.Add('LongStrings=True' )
                   else prmDB.Params.Add('LongStrings=False');

   { ParamPrefix }

   { Specifies whether to return '@' before name of the parameter in StoredProc. Used for compatibility with standard driver. }
   { Default value of this option is False.                                                                                   }

   // SQLConnection1.SQLConnection.SetOption(TSQLConnectionOption(coParamPrefix), Integer(True)); // not used

   { Prepared }
   { Set Prepared to True to execute query preparation on the server that allows to increase performance on multiple execution of the queries. }
   { Preparation is especially effective on executing Stored Procedures.                                                                       }
   { Note that query preparing has some limitations:                                                                                           }
   {                           unable getting values of output-parameters;                                                                     }
   {                           doesn't support temporary objects (tables etc).                                                                 }
   { Note: in contrast to setting TCustomSQLDataSet.Prepared to True that prepares a query only on client side,                                }
   { setting SetOption(coPrepared, Integer(True)) prepares a query on the server.                                                              }
   { Default value is False.                                                                                                                   }

   //prmDB.SQLConnection.SetOption(coPrepared, Integer(True)); // Not used

   { RequiredFields }
   { Manages of TField.Required property assignment. This option can be one of the following values:        }
   {     'None' - all fields are marked as not required                                                     }
   {     'Required' - all fields are marked as they are declared on server                                  }
   {     'NonAutoInc' - all fields except autoincrement fields are marked as they are declared on server    }
   { Default value of this option is 'None'.                                                                }

   //prmDB.SQLConnection.SetOption(coRequiredFields, Integer(PChar('Required'))); // Not used

   { TrimFixedChar }
   { Specifies whether to discard all trailing spaces in string fields of the dataset.                      }

   //prmDB.SQLConnection.SetOption(coTrimFixedChar, Integer(FTrimFixedChar));
   if FTrimFixedChar then prmDB.Params.Add('TrimFixedChar=True' )
                     else prmDB.Params.Add('TrimFixedChar=False');

   { UseUnicode }
   { Enables or disables Unicode support. Affects character data fetched from the server. When set to True, all character data from nchar and  }
   { nvarchar columns is stored as WideStrings, and TStringField is replaced with TWideStringFiled.                                            }
   { This option is available only for Delphi 2006 and Turbo products.                                                                         }
   { Default value of this option is True.                                                                                                     }

   //prmDB.SQLConnection.SetOption(coUseUnicode, Integer(True)); not used

   {--------------------------------------------------------}
   { After configure all parameters, we set connection data}
   prmDB.Params.Add('HostName='+FHostName    );
   prmDB.Params.Add('DataBase='+FDataBase    );
   prmDB.Params.Add('User_Name='+FUser_Name  );
   prmDB.Params.Add('Password='+Self.Password);
end;

constructor TSDADBCONFIG.Create;
begin
   FLibraryName   := 'dbexpsda.dll'; // 'dbexpsda30.dll' - for Delphi 2006 or Turbo products
   FDriverName    := 'SQLServer';
   FBlobSize      := -1;
   FLongStrings   := True;
   FEnableBCD     := True;
   FFetchAll      := True;
   FTrimFixedChar := True;

   FHostName      := '';
   FDataBase      := '';
   FUser_Name     := '';
   FPassword      := '';
end;

function TSDADBCONFIG.GetDBVersion :string;
begin
   Result := '00.01';  { This is a key point in the program. }
end;

function TSDADBCONFIG.Crypto(const Value :string):string;
var CharIndex :Integer;
begin
   Result := Value;
   for CharIndex := 1 to Length(Value) do begin
      Result[CharIndex] := Chr(not(Ord(Value[CharIndex]) + CharIndex ));
   end;
end;

function TSDADBCONFIG.GetPassword:string;
begin
   Result := Crypto(FPassword);
end;

procedure TSDADBCONFIG.SetPassword(Value :string);
begin
   if Crypto(Value) <> FPassword then begin
      FPassword := Crypto(Value);
   end; 
end;

function TConfiguration.GetConfigFileName: string;
var ExeName   :string;
    Extension :string;
    FileName  :string;
begin
  // Get the current Application exe name, without the extension
  ExeName   := ExtractFileName(Application.ExeName);
  Extension := ExtractFileExt (Application.ExeName);
  FileName  := Copy(ExeName, 1, Length(ExeName)-Length(Extension));

  Result := ExtractFilePath(Application.ExeName) + FileName + '.INI';
end;

end.
