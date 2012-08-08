unit PaymentMethodsController;

interface

uses Classes, ComCtrls, Controls, ExtCtrls, Forms, Graphics,
     CustomController,
     DBController,
     CurrentConfigClass,
     DMPaymentMethods,
     PaymentMethodsView;

type
  TPaymentMethodsController = class(TCustomController)
  private
    FConfiguration :TCurrentConfig;
    DM             :TDataModulePaymentMethods;
    FView          :TPaymentMethodsView;
    FOrderFieldName :string;     {still not used}
    procedure InitializeView;
  protected
    {Delegate declarations}
    procedure OnShowForm    (Sender :TObject);
    procedure OnFormClose   (Sender: TObject; var Action: TCloseAction);
    procedure OnClick_New   (Sender :TObject);
    procedure OnClick_Modify(Sender :TObject);
    procedure OnClick_Delete(Sender :TObject);
    procedure OnClick_Report(Sender :TObject);
    procedure OnClick_Accept(Sender :TObject);
    procedure OnClick_Cancel(Sender :TObject);
    procedure OnClick_TitleDBGrid(Sender: TObject; AFieldName: string);  {still not assigned}
    procedure OnCalcTitleAttributes_DBGrid(Sender: TObject; AFieldName: string;   {still not assigned}
                                           AFont: TFont; ABrush: TBrush; var ATitleAlignment: TAlignment);
  public
    constructor Create(prmConfig :TCurrentConfig); reintroduce;
    destructor  Destroy; override;
    function    ShowView:Boolean;
  end;

implementation

uses SysUtils, Dialogs, DB, Windows, Messages, Buttons,
     CustomView;

constructor TPaymentMethodsController.Create(prmConfig :TCurrentConfig); 
begin
   inherited Create(prmConfig.DBConnection);

   FOrderFieldName := 'FORMAPAGO';  {Still not used}

   FConfiguration := prmConfig;

   Application.CreateForm(TDataModulePaymentMethods, DM);
   DM.Initialize(prmConfig.DBConnection);

   Application.CreateForm(TPaymentMethodsView, FView);

   FView.DataSource.DataSet  := DM.QPaymentMethods;

   FView.AppleIcons := [aiClose, aiMinimize, aiMaximize];
   FView.AppleIconsVisibles := [aiClose, aiMinimize, aiMaximize];

   InitializeView;

   FView.Mode := fmView;
end;

destructor TPaymentMethodsController.Destroy;
begin
   DM.Free;
   FView.Free;
end;

function TPaymentMethodsController.ShowView:Boolean;
begin
   {Assignament of Resources}
   FView.Caption     := 'Formas de Pago';

   FView.HelpType    := htKeyword;
   FView.HelpKeyword := FView.Name;

   {Assignment of delegates}
   FView.OnShow  := OnShowForm;
   FView.OnClose := OnFormClose;

   Result := True;
   FView.ShowModal;
end;

procedure TPaymentMethodsController.OnShowForm(Sender: TObject);
begin
   FView.DBGrid.SetFocus;
end;

procedure TPaymentMethodsController.InitializeView;
begin
   AddColumnToDBGrid(FView.DBGrid, 'FORMAPAGO', 'Código'     ,  40);
   AddColumnToDBGrid(FView.DBGrid, 'DESCRIBE' , 'Descripcion', 300);
   AddColumnToDBGrid(FView.DBGrid, 'UNIDADES' , 'Unids'      ,  40);
   AddColumnToDBGrid(FView.DBGrid, 'INTERVALO', 'Interv'     ,  20);
   AddColumnToDBGrid(FView.DBGrid, 'NUMVENCI' , 'NºVencs'    ,  20);
   AddColumnToDBGrid(FView.DBGrid, 'OBSOLETO' , 'Obs.'       ,  20);

   FView.ModeList.Add(TComponentMode.Create(FView.BtnNew              , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnModify           , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnDelete           , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnReport           , fmView));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnCancel           , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.BtnAccept           , fmEdit));

   FView.ModeList.Add(TComponentMode.Create(FView.EditFORMAPAGO       , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditDESCRIBE        , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditINTERVALO       , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.EditNUMVENCI        , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.RadioGroupCLASE     , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.CheckBoxOBSOLETO    , fmEdit));
   FView.ModeList.Add(TComponentMode.Create(FView.DBGrid              , fmView));

   FView.BtnNew.OnClick          := OnClick_New;
   FView.BtnModify.OnClick       := OnClick_Modify;
   FView.BtnDelete.OnClick       := OnClick_Delete;
   FView.BtnReport.OnClick       := OnClick_Report;
   FView.BtnAccept.OnClick       := OnClick_Accept;
   FView.BtnCancel.OnClick       := OnClick_Cancel;

   FView.Mode := fmView;
end;

procedure TPaymentMethodsController.OnClick_New(Sender: TObject);
begin
   FView.Mode := fmEdit;
   FView.EditFORMAPAGO.SetFocus;
   DM.QPaymentMethods.Append;
end;

procedure TPaymentMethodsController.OnClick_Modify(Sender :TObject);
begin
   FView.Mode := fmEdit;
   DM.QPaymentMethods.Edit;
end;

procedure TPaymentMethodsController.OnClick_Delete(Sender: TObject);
begin
   if DM.QPaymentMethods.IsEmpty then Exit;
   if MessageDlg('¿Desea borrar esta forma de pago?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      try DM.QPaymentMethods.Delete;
          DM.QPaymentMethods.ApplyUpdates(0);
      except DatabaseError('No se ha podido borrar la forma de pago seleccionada.');
      end;
   end;
end;

procedure TPaymentMethodsController.OnClick_Report(Sender: TObject);
begin
   {$Message Warn 'Crear una Controladora para lanzar los informes'} 
   //FormPrincipal.LanzarListado('LFormasPago.rtm', DataSource);
end;

procedure TPaymentMethodsController.OnClick_Accept(Sender: TObject);
begin
   if FView.Validate and DM.IntegrityValidate and DM.BussinesValidate then begin
      DM.QPaymentMethods.Post;
      DM.QPaymentMethods.ApplyUpdates(0);
      FView.Mode := fmView;
      FView.DBGrid.SetFocus;
   end;
end;

procedure TPaymentMethodsController.OnClick_Cancel(Sender: TObject);
begin
   if FView.Validate and DM.IntegrityValidate and DM.BussinesValidate then begin
      DM.QPaymentMethods.Cancel;
      DM.QPaymentMethods.ApplyUpdates(0);
      FView.Mode := fmView;
      FView.DBGrid.SetFocus;
   end;
end;


procedure TPaymentMethodsController.OnFormClose(Sender: TObject; var Action: TCloseAction);
begin
   //if QFichero.State = dsBrowse then  begin
      Action := caFree;
   //end
   //else begin
   //   MessageBeep(0);
   //   Abort;
   //end;
end;

procedure TPaymentMethodsController.OnClick_TitleDBGrid(Sender: TObject; AFieldName: String);
begin
   if (UpperCase(AFieldName) = 'FORMAPAGO') or (UpperCase(AFieldName) = 'DESCRIBE') or
      (UpperCase(AFieldName) = 'INTERVALO') or (UpperCase(AFieldName) = 'NUMVENCI') then  begin
      FOrderFieldName := UpperCase(AFieldName);
   end;
   FView.DBGrid.SetFocus;
end;

procedure TPaymentMethodsController.OnCalcTitleAttributes_DBGrid(
  Sender: TObject; AFieldName: string; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
   if (UpperCase(AFieldName) = UpperCase(FOrderFieldName)) then  begin
      ABrush.Color := clBlue;
      AFont.Style  := [fsBold];
      AFont.Color  := clWhite;
   end;
end;

end.

