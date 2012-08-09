unit ProjectsView;

interface

uses Buttons, Classes, Controls, Forms, Graphics, Messages, SysUtils, DB,
     ExtCtrls, Grids, StdCtrls, DBGrids, ComCtrls, DBCtrls, Mask,
     CustomView;
     
type
   TProjectsView = class(TCustomView)
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
    EditNOMBRE: TDBEdit;
    Label2: TLabel;
    EditID_PROYECTO: TDBEdit;
    Label1: TLabel;
   private
   public
   end;

implementation

{$R *.DFM}

end.
