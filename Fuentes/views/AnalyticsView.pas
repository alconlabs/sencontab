unit AnalyticsView;
interface
uses Buttons, Classes, Controls, DB, DBCtrls, Dialogs, ExtCtrls, Forms, Graphics, Grids, Mask,
     Messages, StdCtrls, SysUtils, WinProcs, WinTypes, DBGrids, dblookup,
     CustomView;
type
  TAnalyticsView = class(TCustomView)
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
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EditNOMBRE: TDBEdit;
    EditCUENTA: TDBEdit;
    ComboBoxID_DELEGACION: TDBLookupComboBox;
    ComboBoxID_DEPARTAMENTO: TDBLookupComboBox;
    ComboBoxID_SECCION: TDBLookupComboBox;
    ComboBoxID_PROYECTO: TDBLookupComboBox;
    SDelegacion: TDataSource;
    SDepartamento: TDataSource;
    SSeccion: TDataSource;
    SProyecto: TDataSource;
  private
  public
  end;

implementation

{$R *.DFM}

end.
