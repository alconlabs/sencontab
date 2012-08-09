unit TypesOfJournalView;

interface

uses Buttons, Classes, Controls, DB, DBCtrls, Dialogs, ExtCtrls, Forms, Graphics, Grids, Mask,
     Messages, StdCtrls, SysUtils, WinProcs, WinTypes, DBGrids,
     CustomView;

type
   TTypesOfJournalView = class(TCustomView)
    DataSource: TDataSource;
    PanelBackground: TPanel;
    Panel1: TPanel;
    BtnNew: TSpeedButton;
    BtnDelete: TSpeedButton;
    BtnAccept: TSpeedButton;
    BtnCancel: TSpeedButton;
    BtnReport: TSpeedButton;
    BtnModify: TSpeedButton;
    DBGrid: TDBGrid;
    Datos: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    EditDESCRIPCION: TDBEdit;
    EditTIPODIARIO: TDBEdit;
   private
   public
   end;

implementation

{$R *.DFM}

end.
