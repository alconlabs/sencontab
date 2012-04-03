unit UsersView;
interface
uses Buttons, Forms, Windows, Messages, SysUtils, 
     Grids, StdCtrls, Controls, ExtCtrls, Graphics, Classes, ComCtrls,
     CustomView, ImgList;

type
  TUsersView = class(TCustomView)
    ListViewUsers: TListView;
    Panel2: TPanel;
    BtnImageNew: TImage;
    BtnImageEdit: TImage;
    BtnImageDelete: TImage;
    Panel3: TPanel;
    BtnImageList: TImage;
    BtnImageReport: TImage;
    BtnImageIcons: TImage;
    EditSearch: TEdit;
    BtnImageSearch: TImage;
    procedure FormCreate(Sender: TObject);
  private
  public
  protected
  end;

  {TODO : Falta implementar el estado del usuario como en tortoise }
  {TODO : Si es Administrador, el icono cambia con un check box verde sobreimpreso como en SVNTortoise }
  {TODO : Crear búsqueda de usuarios }
  {TODO : Implementar Búsqueda Super }
  {TODO : Implementar, para la edición, eliminación, en la modelo el método ReferecedOnTable           }
  {TODO : En la implementación de la clase, crear los nuevos métodos ya utilizados                     }
  {TODO : En la implementación de la modelo, crear los nuevos métodos ya utilizados                    }
  {TODO : No se pueden eliminar el administrador. Al guardar un Administrador se desactivan los demás. }


implementation
{$R *.DFM}

procedure TUsersView.FormCreate(Sender: TObject);
begin
   inherited;
   ListViewUsers.SmallImages := SmallImages;
   ListViewUsers.LargeImages := LargeImages;
   ListViewUsers.StateImages := StateImages;
end;

end.













