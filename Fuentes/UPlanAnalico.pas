unit UPlanAnalico;
interface
uses Classes, comctrls, Controls, Db, DBClient, DBCtrls, Dialogs, ExtCtrls, fcButton, fcImage, fcimageform,
     fcImgBtn, Forms, Graphics, IBCustomDataSet, IBQuery, Mask, Messages, OvcBase, OvcDbNF, OvcDbPF,
     OvcEF, OvcNF, OvcPB, OvcPF, StdCtrls, SysUtils, Windows, Wwdbcomb, wwdbdatetimepicker, wwdbedit,
     wwdblook, Wwdotdot,
     CustomView;

type
   TWPlanAnalitico = class(TCustomView)
      Panel5:           TPanel;
      Panel4:           TPanel;
      Panel3:           TPanel;
      lTitulo:          TLabel;
      Shape1:           TShape;
      BtnEdtAceptar:    TfcImageBtn;
      BtnEdtSalir:      TfcImageBtn;
      QFichero:         TClientDataSet;
      SFichero:         TDataSource;
      OvcController1:   TOvcController;
      fcIBCerrar:       TfcImageBtn;
      QAnaliticas:      TIBQuery;
      GroupBox3:        TGroupBox;
      Label6:           TLabel;
      Label7:           TLabel;
      Label8:           TLabel;
      Label9:           TLabel;
      Label10:          TLabel;
      wwDBLookupCombo1: TwwDBLookupCombo;
      eDelegacion:      TwwDBLookupCombo;
      eDepartamento:    TwwDBLookupCombo;
      eSeccion:         TwwDBLookupCombo;
      eProyecto:        TwwDBLookupCombo;
      wwDBLookupCombo2: TwwDBLookupCombo;
      QFicheroCUENTA:   TStringField;
      QFicheroDESCCUENTA: TStringField;
      QFicheroID_PROYECTO: TStringField;
      QFicheroID_SECCION: TStringField;
      QFicheroID_DEPARTAMENTO: TStringField;
      QFicheroID_DELEGACION: TStringField;
      QFicheroDESCPROYECTO: TStringField;
      QFicheroDESCSECCION: TStringField;
      QFicheroDESCDEPARTAMENTO: TStringField;
      QFicheroDESCDELEGACION: TStringField;
      CDSFiltro:        TClientDataSet;
      DSFiltro:         TDataSource;
      Panel1:           TPanel;
      Formulario:       TfcImageForm;
      procedure BtnEdtSalirClick(Sender: TObject);
      procedure BtnEdtAceptarClick(Sender: TObject);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtnEdtAceptarMouseEnter(Sender: TObject);
      procedure BtnEdtAceptarMouseLeave(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      procedure CrearFichero;
      procedure CrearFiltro;
      procedure RellenarFichero;
   public
   end;

var WPlanAnalitico: TWPlanAnalitico;

implementation
uses Cadenas, DM, DMConta, Globales, MenuPrincipal;
{$R *.DFM}

procedure TWPlanAnalitico.CrearFichero;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, FieldDefs do begin
      Active := False;
      Clear;
      Add('CUENTA', ftString, 10, False);
      Add('DESCCUENTA', ftString, 50, False);
      Add('ID_PROYECTO', ftString, 10, False);
      Add('ID_SECCION', ftString, 10, False);
      Add('ID_DEPARTAMENTO', ftString, 10, False);
      Add('ID_DELEGACION', ftString, 10, False);
      Add('DESCPROYECTO', ftString, 50, False);
      Add('DESCSECCION', ftString, 50, False);
      Add('DESCDEPARTAMENTO', ftString, 50, False);
      Add('DESCDELEGACION', ftString, 50, False);
      CreateDataSet;
      Active := True;
   end;
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QFichero, IndexDefs do begin
      Add('', '', []);
      Add('TITULO', 'TITULO;GRUPO;CUENTA', []);
   end;
end;

procedure TWPlanAnalitico.CrearFiltro;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with CDSFiltro do begin
      Active := False;
      {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
      with FieldDefs do begin
         Clear;
         Add('CUENTA', ftString, 10, False);
         Add('ID_DELEGACION', ftString, 10, False);
         Add('ID_DEPARTAMENTO', ftString, 10, False);
         Add('ID_SECCION', ftString, 10, False);
         Add('ID_PROYECTO', ftString, 10, False);
      end;
      CreateDataSet;
      Active := True;
      Append;
   end;
end;

procedure TWPlanAnalitico.RellenarFichero;
begin
   {$Message Warn 'La instrucción WITH es ofuscadora de código`'}
   with QAnaliticas, SQL do begin
      Close;
      Clear;
      Add('SELECT A.*, P.NOMBRE DESCPROYECTO, S.NOMBRE DESCSECCION,     ');
      Add('       DEP.NOMBRE DESCDEPARTAMENTO, DEL.NOMBRE DESCDELEGACION');
      Add('FROM ANALITICAS A LEFT JOIN PROYECTO P                       ');
      Add('                  ON A.ID_PROYECTO = P.ID_PROYECTO           ');
      Add('                  LEFT JOIN SECCION S                        ');
      Add('                  ON A.ID_SECCION = S.ID_SECCION             ');
      Add('                  LEFT JOIN DEPARTAMENTO DEP                 ');
      Add('                  ON A.ID_DEPARTAMENTO = DEP.ID_DEPARTAMENTO ');
      Add('                  LEFT JOIN DELEGACION DEL                   ');
      Add('                  ON A.ID_DELEGACION = DEL.ID_DELEGACION     ');
      Add('WHERE NOT A.CUENTA IS NULL                                   ');

      if CDSFiltro.FieldByName('CUENTA').AsString <> '' then   begin
         Add('   AND A.CUENTA = :CUENTA');
      end;

      if CDSFiltro.FieldByName('ID_PROYECTO').AsString <> '' then   begin
         Add('   AND A.ID_PROYECTO = :ID_PROYECTO');
      end;

      if CDSFiltro.FieldByName('ID_SECCION').AsString <> '' then   begin
         Add('   AND A.ID_SECCION = :ID_SECCION');
      end;

      if CDSFiltro.FieldByName('ID_DEPARTAMENTO').AsString <> '' then   begin
         Add('   AND A.ID_DEPARTAMENTO = :ID_DEPARTAMENTO');
      end;

      if CDSFiltro.FieldByName('ID_DELEGACION').AsString <> '' then   begin
         Add('   AND A.ID_DELEGACION = :ID_DELEGACION');
      end;

      Add('ORDER BY A.CUENTA, A.ID_DELEGACION, A.ID_DEPARTAMENTO,       ');
      Add('         A.ID_SECCION, A.ID_PROYECTO                         ');

      if CDSFiltro.FieldByName('CUENTA').AsString <> '' then   begin
         ParamByName('CUENTA').AsString := CDSFiltro.FieldByName('CUENTA').AsString;
      end;

      if CDSFiltro.FieldByName('ID_PROYECTO').AsString <> '' then   begin
         ParamByName('ID_PROYECTO').AsString := CDSFiltro.FieldByName('ID_PROYECTO').AsString;
      end;

      if CDSFiltro.FieldByName('ID_SECCION').AsString <> '' then   begin
         ParamByName('ID_SECCION').AsString := CDSFiltro.FieldByName('ID_SECCION').AsString;
      end;

      if CDSFiltro.FieldByName('ID_DEPARTAMENTO').AsString <> '' then   begin
         ParamByName('ID_DEPARTAMENTO').AsString := CDSFiltro.FieldByName('ID_DEPARTAMENTO').AsString;
      end;

      if CDSFiltro.FieldByName('ID_DELEGACION').AsString <> '' then   begin
         ParamByName('ID_DELEGACION').AsString := CDSFiltro.FieldByName('ID_DELEGACION').AsString;
      end;

      Open;
   end;

   while not QAnaliticas.EOF do begin
      QFichero.Append;
      QFicheroCUENTA.AsString     := QAnaliticas.FieldByName('CUENTA').AsString;
      QFicheroDESCCUENTA.AsString := QAnaliticas.FieldByName('NOMBRE').AsString;
      if not QAnaliticas.FieldByName('ID_DELEGACION').IsNull then   begin
         QFicheroID_DELEGACION.AsString  := QAnaliticas.FieldByName('ID_DELEGACION').AsString;
         QFicheroDESCDELEGACION.AsString := QAnaliticas.FieldByName('DESCDELEGACION').AsString;
      end;
      if not QAnaliticas.FieldByName('ID_DEPARTAMENTO').IsNull then   begin
         QFicheroID_DEPARTAMENTO.AsString  := QAnaliticas.FieldByName('ID_DEPARTAMENTO').AsString;
         QFicheroDESCDEPARTAMENTO.AsString := QAnaliticas.FieldByName('DESCDEPARTAMENTO').AsString;
      end;
      if not QAnaliticas.FieldByName('ID_PROYECTO').IsNull then   begin
         QFicheroID_PROYECTO.AsString  := QAnaliticas.FieldByName('ID_PROYECTO').AsString;
         QFicheroDESCPROYECTO.AsString := QAnaliticas.FieldByName('DESCPROYECTO').AsString;
      end;
      if not QAnaliticas.FieldByName('ID_SECCION').IsNull then   begin
         QFicheroID_SECCION.AsString  := QAnaliticas.FieldByName('ID_SECCION').AsString;
         QFicheroDESCSECCION.AsString := QAnaliticas.FieldByName('DESCSECCION').AsString;
      end;
      QFichero.Post;
      QAnaliticas.Next;
   end;

   QFichero.First;
end;

procedure TWPlanAnalitico.FormCreate(Sender: TObject);
begin
   CrearFiltro;
   CrearFichero;
end;

procedure TWPlanAnalitico.BtnEdtSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TWPlanAnalitico.BtnEdtAceptarClick(Sender: TObject);
begin
   // Primero vaciar el fichero
   QFichero.EmptyDataSet;

   // Pasamos al siguiente registro para que el ultimo campo se guarde correctamente
   Perform(wm_NextDlgCtl, 0, 0);

   RellenarFichero;

   FormPrincipal.LanzarListado('LPLANANALITICO.RTM', SFichero);
end;

procedure TWPlanAnalitico.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = Chr(VK_RETURN)) then  begin
      Key := #0;
      SelectNext(ActiveControl, GetKeyState(vk_Shift) and $80 = 0, True);
   end;
end;

procedure TWPlanAnalitico.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: begin
         key := 0;
         BtnEdtSalir.Click;
      end;
      VK_F3: begin
         BtnEdtAceptar.Click;
      end;
   end;
end;

procedure TWPlanAnalitico.BtnEdtAceptarMouseEnter(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtnBlanco);
end;

procedure TWPlanAnalitico.BtnEdtAceptarMouseLeave(Sender: TObject);
begin
   (Sender as TfcImageBtn).Image.LoadFromFile(gvDirImagenes + gcBtn);
end;

procedure TWPlanAnalitico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Formulario.Free;
   Formulario := nil;
end;

end.
