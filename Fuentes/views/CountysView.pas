unit CountysView;

interface

uses Forms, Windows, Grids, DBGrids, StdCtrls, Mask, Buttons, Controls, Classes,
     ExtCtrls, DB, ComCtrls, ccResButton, DBCtrls, Messages,  Graphics,
     CustomView, ccChildForm;
type
  TCountysView = class(TCustomView)
    Shape1: TShape;
    PanelBackground: TPanel;
    DataSource: TDataSource;
    PnlBtn: TPanel;
    BtnNew: TSpeedButton;
    BtnModify: TSpeedButton;
    BtnDelete: TSpeedButton;
    BtnReport: TSpeedButton;
    BtnAccept: TSpeedButton;
    BtnCancel: TSpeedButton;
    PanelEdit: TPanel;
    EditPROVINCIA: TDBEdit;
    Label1: TLabel;
    EditNOMBRE: TDBEdit;
    Label2: TLabel;
    EditCODIGO: TDBEdit;
    Label3: TLabel;
    DBGrid: TDBGrid;
  protected
  private
  public
  end;

implementation

{$R *.DFM}

end.

