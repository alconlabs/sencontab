unit PaymentMethodsView;

interface

uses Buttons, Classes, Controls, DB, Dialogs, ExtCtrls, Forms, Graphics, 
     Messages, StdCtrls, SysUtils, DBGrids, DBCtrls, Grids, Mask,
     CustomView;

type
   TPaymentMethodsView = class(TCustomView)
    PanelBackGround: TPanel;
    Datos: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EditDESCRIBE: TDBEdit;
    EditFORMAPAGO: TDBEdit;
    RadioGroupCLASE: TDBRadioGroup;
    EditINTERVALO: TDBEdit;
    EditNUMVENCI: TDBEdit;
    CheckBoxOBSOLETO: TDBCheckBox;
    DataSource: TDataSource;
    DBGrid: TDBGrid;
    PnlBtn: TPanel;
    BtnNew: TSpeedButton;
    BtnModify: TSpeedButton;
    BtnDelete: TSpeedButton;
    BtnReport: TSpeedButton;
    BtnAccept: TSpeedButton;
    BtnCancel: TSpeedButton;
   private
   public
   end;

implementation

{$R *.DFM}

end.
