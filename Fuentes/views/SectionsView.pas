unit SectionsView;

interface

uses Buttons, Classes, Controls, DB, DBCtrls, Dialogs, ExtCtrls, Forms, Graphics, Grids, Mask,
     Messages, StdCtrls, SysUtils, WinProcs, WinTypes, DBGrids,
     CustomView;

type
   TSectionsView = class(TCustomView)
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
    EditNOMBRE: TDBEdit;
    EditID_SECCION: TDBEdit;
   private
   public
   end;

implementation

{$R *.DFM}

end.
