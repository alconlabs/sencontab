unit ProfilesView;
interface
uses Buttons, Forms, Windows, Messages, SysUtils, Dialogs, 
     Grids, StdCtrls, Controls, ExtCtrls, Graphics, Classes, ComCtrls,
     CustomView, ImgList;

type
  TProfilesView = class(TCustomView)
    ListView: TListView;
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

  {TODO : Implementar lo de los códigos repetidos en la modelo }
  {TODO : Implementar, para la edición, eliminación, en la modelo el método ReferecedOnTable }

implementation
{$R *.DFM}

procedure TProfilesView.FormCreate(Sender: TObject);
begin
   inherited;
   ListView.SmallImages := SmallImages;
   ListView.LargeImages := LargeImages;
   ListView.StateImages := StateImages;
end;


end.













