unit ProjectsView;

interface

uses Buttons, Classes, Controls, Forms, Graphics, Messages, SysUtils, DB,
     ExtCtrls, Grids, StdCtrls, DBGrids, ComCtrls, DBCtrls, Mask,
     CustomView;
type
   TProjectsView = class(TCustomView)
    DataSource: TDataSource;
    PanelBackground: TPanel;
    Datos: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EditNOMBRE: TDBEdit;
    EditID_PROYECTO: TDBEdit;
    Panel1: TPanel;
    BtnNew: TSpeedButton;
    BtnDelete: TSpeedButton;
    BtnAccept: TSpeedButton;
    BtnCancel: TSpeedButton;
    BtnReport: TSpeedButton;
    BtnModify: TSpeedButton;
    DBGrid: TDBGrid;
   private
   public
   end;

implementation

{$R *.DFM}

end.
