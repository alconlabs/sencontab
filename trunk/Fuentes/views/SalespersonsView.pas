unit SalespersonsView;

interface

uses Buttons, Classes, Controls, DB, DBCtrls, DBTables, Dialogs, ExtCtrls, Forms, Graphics, Grids, Mask,
     Messages, StdCtrls, SysUtils, WinProcs, WinTypes, DBGrids,
     CustomView;

type
  TSalespersonsView = class(TCustomView)
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
    EditNOMBRE: TDBEdit;
    EditCOMERCIAL: TDBEdit;
    DataSource: TDataSource;
  private
  public
  end;

implementation

{$R *.DFM}

end.
