unit UsersView;
interface
uses Buttons, Forms, Windows, Messages, SysUtils, Dialogs, 
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
    EditSearchText: TEdit;
    BtnImageSearch: TImage;
    Shape1: TShape;
    procedure FormCreate(Sender: TObject);
  private
  public
  protected
  end;

  {TODO : Falta un nuevo estado para el usuario : BLOQUEADO }
  {TODO : No se debe poder eliminar todos los administradores. Al guardar un Administrador se desactivan los demás. }

  {TODO : Implementar lo de los códigos repetidos en la modelo }
  {TODO : Implementar, para la edición, eliminación, en la modelo el método ReferecedOnTable           }

  {TODO : En la implementación de la clase, crear los nuevos métodos ya utilizados                     }
  {TODO : En la implementación de la modelo, crear los nuevos métodos ya utilizados                    }

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













