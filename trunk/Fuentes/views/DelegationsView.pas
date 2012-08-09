unit DelegationsView;
interface
uses Buttons, Classes, Controls, DB, DBCtrls, Dialogs, ExtCtrls, Forms, Graphics, Grids, jpeg, Mask,
     Messages, StdCtrls, SysUtils, WinProcs, WinTypes, DBGrids,
     CustomView;
     
type
   TDelegationsView = class(TCustomView)
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
    EditID_DELEGACION: TDBEdit;
   private
   public
   end;

implementation

{$R *.DFM}

end.
