unit SearchView;
interface
uses SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, Forms, Dialogs, Grids,
     ExtCtrls, Buttons, StdCtrls, DB, DBGrids,
     CustomView;

type
  TSearchView = class(TCustomView)
    DataSource: TDataSource;
    PanelGround: TPanel;
    MemoQuery: TMemo;
    DBGrid: TDBGrid;
    PanelArriba: TPanel;
    BtnImageSearch: TSpeedButton;
    EditSearchText: TEdit;
    BtnCancel: TSpeedButton;
    BtnAccept: TSpeedButton;
  private
  public
  end;

implementation
{$R *.DFM}

end.

