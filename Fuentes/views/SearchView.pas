unit SearchView;
interface
uses SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,Forms, Dialogs, Grids,
     DB, DBTables, StdCtrls, Buttons, ComCtrls, ExtCtrls, DBCtrls, Mask,
     DBGrids, DBClient, IBCustomDataSet, IBDatabase, IBTableSet, IBQuery, DM, CustomView;

type
  TSearchView = class(TCustomView)
    DataSource: TDataSource;
    PanelGround: TPanel;
    MemoQuery: TMemo;
    DBGrid: TDBGrid;
    PanelArriba: TPanel;
    ccResButton1: TSpeedButton;
    EditSearchText: TEdit;
    BtnCancel: TSpeedButton;
    BtnAccept: TSpeedButton;
  private
 public
  end;

implementation
{$R *.DFM}



end.

