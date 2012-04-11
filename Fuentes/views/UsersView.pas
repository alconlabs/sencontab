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
  {TODO : No se debe poder eliminar todos los administradores. Al guardar un Administrador se desactivan los dem�s. }
  {TODO : Plantear la opci�n de un bot�n independiente para la modificaci�n del password. }
  {TODO : A�adir todo el control del password al modificarlo, junto m�s datos o s�lamente el password }

  {TODO : Implementar lo de los c�digos repetidos en la modelo }
  {TODO : Implementar, para la edici�n, eliminaci�n, en la modelo el m�todo ReferecedOnTable           }

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













