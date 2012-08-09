unit DelegationsView;
interface
uses Buttons, Classes, Controls, DB, DBClient, DBCtrls, DBTables, Dialogs, ExtCtrls, fcButton, fcImage,
     fcimageform, fcImgBtn, Forms, Graphics, Grids, IBCustomDataSet, IBDatabase, IBTableSet, jpeg, Mask,
     Messages, navegadorNotarios, OvcBase, OvcDbNF, OvcDbPF, OvcEF, OvcNF, OvcPB, OvcPF, StdCtrls,
     SysUtils, WinProcs, WinTypes, Wwdatsrc, Wwdbgrid, Wwdbigrd, Wwkeycb, CustomView,
  DBGrids;
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
