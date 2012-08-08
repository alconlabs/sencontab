unit StatesView;

interface

uses Buttons, Forms, StdCtrls, Grids, Controls, ExtCtrls, Graphics, Classes,
     SysUtils, Messages, DB, Mask, DBCtrls, DBGrids, ComCtrls,
     CustomView;

type
   TStatesView = class(TCustomView)
    DataSource: TDataSource;
    PanelBackGround: TPanel;
    Datos: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EditNOMBRE: TDBEdit;
    EditPAIS: TDBEdit;
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
