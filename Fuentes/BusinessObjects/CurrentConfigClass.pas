(***********************************************************)
(* Contains a class with the details of the current config *)
(* for the conection to an enterprise, including:          *)
(*     - The conection to the DB of the Enterprise         *)
(*     - The user currently connected                      *)
(*     - The profile options of the User                   *)
(* juanc.cilleruelo@gmail.com                              *)
(***********************************************************)
unit CurrentConfigClass;

interface

uses Classes, StdCtrls,
     DBController,
     UserClass,
     ListOfProfileOptions,
     ConfigurationClass;

type
  TCurrentConfig = class(TPersistent)
  private
    FDBConnection      :TDBController; {Between controller we need this class}
    FUserAuthenticated :TUser;
    FProfileOptions    :TProfileOptionsList;
    FAPPLICATION       :string;
    FCD_PROFILE        :string;
    FCD_ENTERPRISE     :string;
    function GetRunningDirectory :string;
  protected
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Initialize; virtual;
    procedure CreateUserAuthenticated(prmUser :TUser);
    procedure CreateDBConfiguration(prmDBConfiguration :TSdaDBConfig);
    property UserAuthenticated :TUser         read FUserAuthenticated write FUserAuthenticated;
    property DBConnection      :TDBController read FDBConnection      write FDBConnection;
    property APPLICATION       :string        read FAPPLICATION       write FAPPLICATION;
    property CD_PROFILE        :string        read FCD_PROFILE        write FCD_PROFILE;
    property CD_ENTERPRISE     :string        read FCD_ENTERPRISE     write FCD_ENTERPRISE;
    property RunningDirectory  :string        read GetRunningDirectory;
  published
  end;

implementation
uses SysUtils, TypInfo, Forms;

{ TOption }
constructor TCurrentConfig.Create;
begin
   inherited;
end;

procedure TCurrentConfig.CreateUserAuthenticated(prmUser: TUser);
begin
   FUserAuthenticated := TUser.Create;
   FUserAuthenticated.CD_USER       := prmUser.CD_USER      ;
   FUserAuthenticated.DS_USER       := prmUser.DS_USER      ;
   FUserAuthenticated.PASSWORD      := prmUser.PASSWORD     ;
   FUserAuthenticated.ADMINISTRATOR := prmUser.ADMINISTRATOR;
end;

procedure TCurrentConfig.CreateDBConfiguration(prmDBConfiguration :TSdaDBConfig);
begin
   FDBConnection := TDBController.Create(prmDBConfiguration);
   DBConnection.DBConfig.HostName := FCD_ENTERPRISE;
end;

destructor TCurrentConfig.Destroy;
begin
   inherited;
end;

procedure TCurrentConfig.Initialize;
begin
   DBConnection.DBConfig.HostName := FCD_ENTERPRISE;
   DBConnection.OpenConnection;
   {$Message Warn 'Falta Cargar la Lista de Options del Perfil y Aplicarla'}
end;

function TCurrentConfig.GetRunningDirectory:string;
begin
   Result := ExtractFilePath(Forms.Application.ExeName);
end;

end.
