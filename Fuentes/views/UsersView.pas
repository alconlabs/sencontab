unit UsersView;
interface
uses Buttons, Forms, Windows, Messages, DBClient, SysUtils, 
     Grids, StdCtrls, Controls, ExtCtrls, Graphics, Classes, DBCtrls, ComCtrls,
     CustomView, ImgList;

type
  TUsersView = class(TCustomView)
    ListViewUsers: TListView;
    ImageListIcons: TImageList;
    Panel2: TPanel;
    BtnImageNew: TImage;
    BtnImageEdit: TImage;
    BtnImageDelete: TImage;
    Panel3: TPanel;
    BtnImageList: TImage;
    BtnImageReport: TImage;
    BtnImageSmallIcons: TImage;
    BtnImageIcons: TImage;
    EditSearch: TEdit;
    BtnImageSearch: TImage;
    procedure FormShow(Sender: TObject);
  private
  public
  protected
  end;

  {TODO : Crear nuevo usuario        }
  {TODO : Eliminar Usuario           }
  {TODO : Crear b�squeda de usuarios }
  {TODO : Implementar B�squeda Super }
  {TODO : Implementar, para la edici�n, eliminaci�n, en la modelo el m�todo ReferecedOn}
  {TODO : En la implementaci�n de la clase, crear los n�evos m�todos ya utilizados     }


implementation
uses Dialogs;
{$R *.DFM}

procedure TUsersView.FormShow(Sender: TObject);
begin
   inherited;
   //SetBounds(0, FormPrincipal.Panel1.Top + FormPrincipal.Panel1.Height + 1, Width, Height);
end;

end.













