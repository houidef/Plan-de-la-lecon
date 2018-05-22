unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxClasses, dxRibbon, dxBar, ImgList,upreview, ComCtrls, Preview, ExtDlgs,
  ExtCtrls, Menus, StdCtrls, dxStatusBar, dxRibbonStatusBar, cxContainer,
  cxEdit, cxTrackBar, dxBarExtItems, dxRibbonGallery,Unit2, cxCheckBox,
  cxBarEditItem, cxMemo, cxTimeEdit,_FormNouveauPlan, cxRadioGroup,
  cxCheckGroup,unit3;

type
  TForm1 = class(TForm)
    dxRibbon1Tab1: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab2: TdxRibbonTab;
    dxRibbon1Tab3: TdxRibbonTab;
    dxRibbon1Tab4: TdxRibbonTab;
    cxLargeImages: TcxImageList;
    ImageList: TImageList;
    ZoomPopupMenu: TPopupMenu;
    ZoomActualSize: TMenuItem;
    ZoomPageWidth: TMenuItem;
    ZoomPageHeight: TMenuItem;
    ZoomWholePage: TMenuItem;
    UnitsPopupMenu: TPopupMenu;
    Pixels1: TMenuItem;
    N01mm1: TMenuItem;
    N001mm1: TMenuItem;
    N001inch1: TMenuItem;
    N0001inch1: TMenuItem;
    Twips1: TMenuItem;
    Points1: TMenuItem;
    Splitter: TSplitter;
    SaveTIFDialog: TSaveDialog;
    SavePictureDialog: TSavePictureDialog;
    SavePDFDialog: TSaveDialog;
    SaveDialog: TSaveDialog;
    PrinterSetupDialog: TPrinterSetupDialog;
    PreviewPopupMenu: TPopupMenu;
    AddRandomPages1: TMenuItem;
    Clear1: TMenuItem;
    PageSetupDialog: TPageSetupDialog;
    PagePopupMenu: TPopupMenu;
    MoveCurrentFirstMenuItem: TMenuItem;
    MoveCurrentUpMenuItem: TMenuItem;
    MoveCurrentDownMenuItem: TMenuItem;
    MoveCurrentLastMenuItem: TMenuItem;
    N3: TMenuItem;
    AddPageBeforeCurrentMenuItem: TMenuItem;
    AddPageAfterCurrentMenuItem: TMenuItem;
    N1: TMenuItem;
    ReplaceCurrentMenuItem: TMenuItem;
    EditCurrentMenuItem: TMenuItem;
    N2: TMenuItem;
    DeleteCurrent: TMenuItem;
    ExportCurrent: TMenuItem;
    N7: TMenuItem;
    CopyCurrent: TMenuItem;
    OpenDialog: TOpenDialog;
    PrintPreview: TPrintPreview;
    ThumbnailPreview: TThumbnailPreview;
    ThumbViewerPopupMenu: TPopupMenu;
    ReduceThumbnailSizeMenuItem: TMenuItem;
    EnlargeThumbnailSizeMenuItem: TMenuItem;
    N5: TMenuItem;
    HotTrackMenuItem: TMenuItem;
    MultiSelectMenuItem: TMenuItem;
    Grayscale1: TMenuItem;
    ThumbGrayNever: TMenuItem;
    ThumbGrayAlways: TMenuItem;
    ThumbGrayPreview: TMenuItem;
    N6: TMenuItem;
    ArrangeTopMenuItem: TMenuItem;
    ArrangeLeftMenuItem: TMenuItem;
    N4: TMenuItem;
    AddPageMenuItem: TMenuItem;
    DeleteAllMenuItem: TMenuItem;
    StatusBar1: TdxRibbonStatusBar;
    dxRibbonStatusBar1Container2: TdxStatusBarContainerControl;
    cxTrackBar1: TcxTrackBar;
    cxImageList1: TcxImageList;
    cxSmallImages: TcxImageList;
    BarManager: TdxBarManager;
    BarManagerBar2: TdxBar;
    BarManagerBar3: TdxBar;
    BarManagerBar5: TdxBar;
    BarManagerBar7: TdxBar;
    BarManagerBar8: TdxBar;
    BarManagerBar1: TdxBar;
    BarManagerBar9: TdxBar;
    BarManagerBar10: TdxBar;
    BarManagerBar11: TdxBar;
    BarManagerBar12: TdxBar;
    BarManagerBar6: TdxBar;
    BarManagerBar13: TdxBar;
    BarManagerBar14: TdxBar;
    dxBarButtonNew: TdxBarLargeButton;
    dxBarButtonOpen: TdxBarLargeButton;
    dxBarButtonSave: TdxBarLargeButton;
    dxBarButtonPrint: TdxBarLargeButton;
    dxBarButtonExit: TdxBarLargeButton;
    dxBarSubItemSaveAs: TdxBarSubItem;
    dxBarSeparator: TdxBarSeparator;
    dxBarButtonSaveAsRTF: TdxBarButton;
    dxBarButtonSaveAsText: TdxBarButton;
    rgiItemSymbol: TdxRibbonGalleryItem;
    dxBarSubItem1: TdxBarSubItem;
    dxBarStatic1: TdxBarStatic;
    dxBarButton8: TdxBarButton;
    dxBarButtonUndo: TdxBarLargeButton;
    dxBarButtonCut: TdxBarLargeButton;
    dxBarButtonCopy: TdxBarLargeButton;
    dxBarButtonPaste: TdxBarLargeButton;
    dxBarButtonClear: TdxBarLargeButton;
    dxBarButtonSelectAll: TdxBarLargeButton;
    dxBarButtonFind: TdxBarLargeButton;
    dxBarButtonReplace: TdxBarLargeButton;
    rgiUndo: TdxRibbonGalleryItem;
    bstSelectionInfo: TdxBarStatic;
    dxBarComboFontSize: TdxBarCombo;
    dxBarButtonBold: TdxBarLargeButton;
    dxBarButtonItalic: TdxBarLargeButton;
    dxBarButtonUnderline: TdxBarLargeButton;
    dxBarButtonBullets: TdxBarLargeButton;
    dxBarButtonAlignLeft: TdxBarLargeButton;
    dxBarButtonCenter: TdxBarLargeButton;
    dxBarButtonAlignRight: TdxBarLargeButton;
    dxBarButtonProtected: TdxBarLargeButton;
    dxBarButtonFont: TdxBarLargeButton;
    dxBarComboFontName: TdxBarFontNameCombo;
    rgiFontColor: TdxRibbonGalleryItem;
    rgiColorTheme: TdxRibbonGalleryItem;
    dxBarButtonFontColor: TdxBarButton;
    dxBarButton1: TdxBarLargeButton;
    dxBarButton2: TdxBarLargeButton;
    dxBarButton3: TdxBarLargeButton;
    dxBarButton4: TdxBarLargeButton;
    dxBarButton5: TdxBarLargeButton;
    dxBarButton6: TdxBarLargeButton;
    dxBarButton7: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButtonBlackScheme: TdxBarLargeButton;
    dxBarLargeButtonBlueScheme: TdxBarLargeButton;
    dxBarLargeButtonSilverScheme: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    btnLineNumber: TdxBarButton;
    btnColumnNumber: TdxBarButton;
    btnLocked: TdxBarButton;
    stModified: TdxBarStatic;
    dxBarButtonOptions: TdxBarButton;
    dxBarGroup1: TdxBarGroup;
    dxRibbonDropDownGallery1: TdxRibbonDropDownGallery;
    BarManagerBar15: TdxBar;
    dxBarButton9: TdxBarButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    BarManagerBar16: TdxBar;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarButton12: TdxBarButton;
    dxBarButton13: TdxBarButton;
    dxBarButton14: TdxBarButton;
    dxBarCombo1: TdxBarCombo;
    dxBarCombo2: TdxBarCombo;
    BarManagerBar17: TdxBar;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarListItem1: TdxBarListItem;
    dxBarDateCombo1: TdxBarDateCombo;
    dxBarSpinEdit1: TdxBarSpinEdit;
    dxBarSpinEdit2: TdxBarSpinEdit;
    dxBarSpinEdit3: TdxBarSpinEdit;
    dxBarSpinEdit4: TdxBarSpinEdit;
    dxBarSpinEdit5: TdxBarSpinEdit;
    dxBarImageCombo1: TdxBarImageCombo;
    dxBarEdit1: TdxBarEdit;
    cxBarEditItem1: TcxBarEditItem;
    dxBarSubItem2: TdxBarSubItem;
    dxBarMRUListItem1: TdxBarMRUListItem;
    dxRibbonGalleryItem1: TdxRibbonGalleryItem;
    cxBarEditItem2: TcxBarEditItem;
    cxBarEditItem3: TcxBarEditItem;
    dxBarEdit2: TdxBarEdit;
    BarManagerBar4: TdxBar;
    BarManagerBar18: TdxBar;
    dxBarLargeButton11: TdxBarLargeButton;
    dxBarLargeButton12: TdxBarLargeButton;
    dxBarLargeButton13: TdxBarLargeButton;
    dxBarListItem2: TdxBarListItem;
    dxBarToolbarsListItem1: TdxBarToolbarsListItem;
    dxBarMRUListItem2: TdxBarMRUListItem;
    dxRibbonGalleryItem2: TdxRibbonGalleryItem;
    dxRibbonDropDownGallery2: TdxRibbonDropDownGallery;
    dxBarButton15: TdxBarButton;
    dxBarEdit3: TdxBarEdit;
    dxBarLargeButton14: TdxBarLargeButton;
    dxBarLargeButton15: TdxBarLargeButton;
    dxBarButton16: TdxBarButton;
    dxBarButton17: TdxBarButton;
    dxBarSeparator1: TdxBarSeparator;
    dxBarSubItem3: TdxBarSubItem;
    dxBarEdit4: TdxBarEdit;
    cxBarEditItem4: TcxBarEditItem;
    cxBarEditItem5: TcxBarEditItem;
    dxBarButton18: TdxBarButton;
    BarManagerBar19: TdxBar;
    cxBarEditItem6: TcxBarEditItem;
    cxBarEditItem7: TcxBarEditItem;
    cxBarEditItem8: TcxBarEditItem;
    dxBarApplicationMenu1: TdxBarApplicationMenu;
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure cxTrackBar1PropertiesChange(Sender: TObject);
    procedure dxBarButtonNewClick(Sender: TObject);
    procedure dxBarButtonSaveClick(Sender: TObject);
    procedure dxBarButtonOpenClick(Sender: TObject);
    procedure dxBarButtonPrintClick(Sender: TObject);
    procedure dxBarComboFontNameChange(Sender: TObject);
    procedure dxBarComboFontSizeChange(Sender: TObject);
    procedure dxBarButtonFontColorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxBarSpinEdit5ButtonClick(Sender: TdxBarSpinEdit;
      Button: TdxBarSpinEditButton);
    procedure dxBarSpinEdit4ButtonClick(Sender: TdxBarSpinEdit;
      Button: TdxBarSpinEditButton);
    procedure dxBarEdit2Change(Sender: TObject);
    procedure dxBarDateCombo1Change(Sender: TObject);
    procedure dxBarDateCombo1Click(Sender: TObject);
    procedure PrintPreviewResize(Sender: TObject);
    procedure PrintPreviewZoomChange(Sender: TObject);
    procedure PrintPreviewChange(Sender: TObject);
    procedure cxBarEditItem6Change(Sender: TObject);
  private
    { Private declarations }
    FColorPickerController: TColorPickerController;
  public
    DateJour,ObjPedagogique,ObjGeneral,ObjSpecifique,Outillage,Cell4,TitrePlan:TCell;
    TabTitre,TabOutillage,TabPlan,XCell3,XCell4:TACell;
    ObjectVisible:Boolean;
    PageBoundsAfterMargin: TRect;
    NChapitre:Integer;
    NLecon:Integer;
    created: Boolean;
    Titre: string;
    Date: string;
    procedure DrawPageGarde;
    procedure CreatePageGarde;
    procedure DrawPlan;
    procedure CreatePlan;
    function repos(R: TRect; x, y: real): TRect;
    procedure SetFontColor;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Types;

{$R *.dfm}
function tocm(x: Integer):integer;
var
  OneCM :TPoint;
  dwidth,dheight:Integer;
  V:Integer;
begin
  OneCM   := Form1.PrintPreview.PointFrom(mmLoMetric, 100, 100);
  result  :=round(x*OneCM.x);
end;
procedure TForm1.DrawPageGarde;
var
  R,R1: TRect;
  ARow,ACol:integer;
  Rev,NObj:Integer;
  tmp:Real;
  Text: String;
  AObj,Size:Integer;
  Owidth,Oheight:Integer;
begin
    cxBarEditItem6Change(self);
    R := PageBoundsAfterMargin;
    Owidth:=18;//tocm(R.right-R.left);
    Oheight:=tocm(R.bottom-R.Top);
    R := repos(R,0.5,1);
    Size:=PrintPreview.Font.Size;
    PrintPreview.Zoom:=10*PrintPreview.ZoomStep;
    //DateJour==================================================================
    DateJour.Clear;
    DateJour.writeln('Date de Mise a Jour:'+Date,taRightJustify);
    DateJour.reforme(taRightJustify,5,1);
    //TabTitre:=================================================================
    TabTitre.Clear;
    {XCell0.XWidth[1]:=4;
    XCell0.XWidth[2]:=10;
    XCell0.XWidth[3]:=4;
    XCell0.YWidth[1]:=2.5; }
    TabTitre.draw(taLeftJustify);
    TabTitre.FCell[1,1].WriteLn('Section:'+'TS/informatique',taLeftJustify);
    TabTitre.FCell[1,1].WriteLn;
    TabTitre.FCell[1,1].WriteLn('Module:'+'Réseau',taLeftJustify);
    TabTitre.FCell[2,1].WriteLn;
    TabTitre.FCell[2,1].WriteLn('Titre:'+Titre,taCenter);
    TabTitre.FCell[3,1].WriteLn('Chapitre N°:'+inttostr(NChapitre),taLeftJustify);
    TabTitre.FCell[3,1].WriteLn;
    TabTitre.FCell[3,1].WriteLn('Leçon N°:'+inttostr(NLecon),taLeftJustify);
    //ObjPedagogique:===========================================================
    ObjPedagogique.Clear;
    ObjPedagogique.WriteLn('Objectifs Pédagogiques ',taCenter);
    ObjPedagogique.reforme(tacenter,5,1);
    //ObjGeneral:===============================================================
    ObjGeneral.Clear;
    ObjGeneral.WriteLn('Objectif Géneral: ',taLeftJustify);
    ObjGeneral.WriteLn;
    ObjGeneral.WriteLn('                   A la fin de la leçon chaque stagiaire doit etre capable de : ',taLeftJustify);
    ObjGeneral.WriteLn;
    ObjGeneral.reforme(taLeftJustify,Owidth,4);
    //ObjSpecifique:============================================================
    ObjSpecifique.Clear;
    ObjSpecifique.WriteLn('Objectifs Specifiques: ',taLeftJustify);
    ObjSpecifique.WriteLn;
    for AObj:=1 to 5 do begin
      ObjSpecifique.WriteLn('  ('+inttostr(AObj)+'): _________________________ ',taLeftJustify);
      ObjSpecifique.WriteLn;
    end;
    ObjSpecifique.WriteLn;
    ObjSpecifique.reforme(taLeftJustify,Owidth,6);
     //Outillage:===============================================================
    Outillage.Clear;
    Outillage.WriteLn('Outillage et Matieres d''ouvres ',taCenter);
    Outillage.WriteLn;
    Outillage.reforme(tacenter,5,1);
    //TabOutillage:=============================================================
    TabOutillage.Clear;
    {
    TabOutillage.XWidth[1]:=5;
    TabOutillage.XWidth[2]:=5;
    TabOutillage.YWidth[1]:=1;
    TabOutillage.YWidth[2]:=2.5; }
    TabOutillage.draw(taCenter);
    TabOutillage.FCell[1,1].WriteLn('Enseignant',tacenter);
    TabOutillage.FCell[2,1].Writeln('Stagiaire',taCenter);
    for AObj:=1 to 5 do begin
        TabOutillage.FCell[1,2].WriteLn('------',tacenter);
        TabOutillage.FCell[2,2].WriteLn('------',taCenter);
    end;
    //==========================================================================
    Cell4.Clear;
    Cell4.WriteLn;
    Cell4.WriteLn('Durée: ',taLeftJustify);
    Cell4.WriteLn;
    Cell4.WriteLn('Moyennes Dédactiques: ',taLeftJustify);
    Cell4.WriteLn;
    for AObj:=1 to 5 do begin
        Cell4.WriteLn('------',taLeftJustify);
    end;
    Cell4.reforme(taLeftJustify,18,6);
    PrintPreview.NewPage;
    //==========================================================================
    TitrePlan.Clear;
    TitrePlan.Writeln('PLAN DE LA LECON',taCenter);
    TitrePlan.Writeln;
    //==========================================================================
    TabPlan.clear;
    Rev:=1;
    NObj:=1;
    TabPlan.Row:=3+Rev+NObj*3;
    TabPlan.Col:=2;
    TabPlan.XWidth[1]:=9;
    TabPlan.XWidth[2]:=9;
    TabPlan.YWidth[1]:=0.5;
    if(Rev=1) then TabPlan.YWidth[2]:=3;
    TabPlan.draw(taLeftJustify);
    TabPlan.FCell[1,1].WriteLn('Stagiaire',taCenter);
    TabPlan.FCell[2,1].WriteLn('Professeur',taCenter);
    //Tab Révision:=============================================================
    if(Rev=1) then begin
        TabPlan.FCell[2,2].WriteLn('Révision:',taLeftJustify);
        TabPlan.FCell[2,2].WriteLn('...............................................',taLeftJustify);
        TabPlan.FCell[2,2].WriteLn('...............................................',taLeftJustify);
        TabPlan.FCell[2,2].WriteLn('...............................................',taLeftJustify);
        TabPlan.FCell[2,2].WriteLn('...............................................',taLeftJustify);
    end;
    //Tab Extraction Du Titre ==================================================
    TabPlan.FCell[2,3].WriteLn('Extraction Du Titre:',taLeftJustify);
    TabPlan.FCell[2,4].WriteLn('Affichage des objectifs:',taLeftJustify);
    //Tab objectifs ============================================================
    for AObj:=1 to NObj do begin
        TabPlan.FCell[2,4+AObj].WriteLn('Mise en diffeculté N°:'+inttostr(AObj),taLeftJustify);
        TabPlan.FCell[2,5+AObj].WriteLn('Démonstration & Explication N°:'+inttostr(AObj),taLeftJustify);
        TabPlan.FCell[2,6+AObj].WriteLn('Evaluation Partielle N°:'+inttostr(AObj),taLeftJustify);
    end;


end;

procedure TForm1.dxBarLargeButton1Click(Sender: TObject);
var
  MainForm:TMainForm;
begin
MainForm:=TMainForm.create(self);
MainForm.Show;
end;

function TForm1.repos(R: TRect; x, y: real): TRect;
 var
  OneCM: TPoint;
begin

    OneCM := PrintPreview.PointFrom(mmLoMetric, 100, 100);
    InflateRect(R, -round(X*OneCM.X), -round(Y*OneCM.Y));
    result:=R;
end;


procedure TForm1.cxTrackBar1PropertiesChange(Sender: TObject);
begin
  with PrintPreview do Zoom :=  cxTrackBar1.Position*ZoomStep;
end;

procedure TForm1.dxBarButtonNewClick(Sender: TObject);
var
FormNouveauPlan:TFormNouveauPlan;
begin
 FormNouveauPlan:=TFormNouveauPlan.Create(Self);
  if(FormNouveauPlan.showmodal=mrOk) then begin
    Titre:=FormNouveauPlan.EditTitre.Text;
    NLecon:= FormNouveauPlan.cxSpinEdit1.Value;
    NChapitre:= FormNouveauPlan.cxSpinEdit2.Value;
   DrawPlan;
  end;
end;

procedure TForm1.dxBarButtonSaveClick(Sender: TObject);
begin
  if SaveDialog.Execute then
    PrintPreview.SaveToFile(SaveDialog.FileName);
end;

procedure TForm1.dxBarButtonOpenClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    PrintPreview.LoadFromFile(OpenDialog.FileName);
end;

procedure TForm1.dxBarButtonPrintClick(Sender: TObject);
begin
  PrintPreview.SetPrinterOptions;
  if PrinterSetupDialog.Execute then
    PrintPreview.Print;
end;

procedure TForm1.dxBarComboFontNameChange(Sender: TObject);
begin
  PrintPreview.Font.Name:= dxBarComboFontName.Text;
  DrawPlan;
end;

procedure TForm1.dxBarComboFontSizeChange(Sender: TObject);
begin
  PrintPreview.Font.Size:= StrToInt(dxBarComboFontSize.Text);
  DrawPlan;
end;

procedure TForm1.dxBarButtonFontColorClick(Sender: TObject);
begin
SetFontColor;
end;

procedure TForm1.SetFontColor;
var
  Color:TColor;
begin
Color:=FColorPickerController.Color;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ObjectVisible:=True;
  created:=False;
  FColorPickerController := TColorPickerController.Create(rgiFontColor, rgiColorTheme, dxRibbonDropDownGallery1);
  CreatePlan;
end;

procedure TForm1.dxBarSpinEdit5ButtonClick(Sender: TdxBarSpinEdit;
  Button: TdxBarSpinEditButton);
begin
   NChapitre:=dxBarSpinEdit5.IntCurValue;
   DrawPlan;
end;

procedure TForm1.dxBarSpinEdit4ButtonClick(Sender: TdxBarSpinEdit;
  Button: TdxBarSpinEditButton);
begin
   NLecon:=dxBarSpinEdit4.IntCurValue;
   DrawPlan;
end;

procedure TForm1.DrawPlan;
begin
  with PrintPreview do
  begin
    {$IFDEF COMPILER7_UP}
    PageBoundsAfterMargin := GetPageSetupParameters(PageSetupDialog);
    {$ELSE}
    PageBoundsAfterMargin := PageBounds;
    with PointFrom(mmLoMetric, 100, 100) do
      InflateRect(PageBoundsAfterMargin, -X, -Y);
    {$ENDIF}
    BeginDoc;
    try

        DrawPageGarde;

    finally
      EndDoc;
    end;
  end;
end;

procedure TForm1.dxBarEdit2Change(Sender: TObject);
begin
   Titre:=dxBarEdit2.text;
   DrawPlan;
end;

procedure TForm1.dxBarDateCombo1Change(Sender: TObject);
begin
Date:=dxBarDateCombo1.Text;
DrawPlan;
end;

procedure TForm1.dxBarDateCombo1Click(Sender: TObject);
begin
Date:=dxBarDateCombo1.Text;
DrawPlan;
end;

procedure TForm1.PrintPreviewResize(Sender: TObject);
begin
  if Created  then begin
          TitrePlan.position;
         cell4.position;
         Outillage.position;
         ObjGeneral.position;
         ObjPedagogique.position;
         ObjSpecifique.position;
         DateJour.position;
         TabTitre.position;
         TabOutillage.position;
         TabPlan.position;
  end;
end;

procedure TForm1.PrintPreviewZoomChange(Sender: TObject);
begin
  PrintPreviewResize(self);
end;

procedure TForm1.PrintPreviewChange(Sender: TObject);
begin

  if Created  then begin
   DateJour.TestVisible(PrintPreview.CurrentPage);
   ObjPedagogique.TestVisible(PrintPreview.CurrentPage);
   ObjSpecifique.TestVisible(PrintPreview.CurrentPage);
   ObjGeneral.TestVisible(PrintPreview.CurrentPage);
   Outillage.TestVisible(PrintPreview.CurrentPage);
   Cell4.TestVisible(PrintPreview.CurrentPage);
   TitrePlan.TestVisible(PrintPreview.CurrentPage);
   TabTitre.TestVisible(PrintPreview.CurrentPage);
   TabOutillage.TestVisible(PrintPreview.CurrentPage);
   TabPlan.TestVisible(PrintPreview.CurrentPage);
 end;
end;

procedure TForm1.cxBarEditItem6Change(Sender: TObject);
var
AValue:string;
begin

ObjectVisible := cxBarEditItem6.EditValue;
 //DrawPlan;
 if created then begin
   DateJour.ObjectVisible:=ObjectVisible;
   ObjPedagogique.ObjectVisible:=ObjectVisible;
   ObjSpecifique.ObjectVisible:=ObjectVisible;
   ObjGeneral.ObjectVisible:=ObjectVisible;
   Outillage.ObjectVisible:=ObjectVisible;
   Cell4.ObjectVisible:=ObjectVisible;
   TitrePlan.ObjectVisible:=ObjectVisible;
   TabTitre.ObjectVisible:=ObjectVisible;
   TabOutillage.ObjectVisible:=ObjectVisible;
   TabPlan.ObjectVisible:=ObjectVisible;
   DateJour.TestVisible(PrintPreview.CurrentPage);
   ObjPedagogique.TestVisible(PrintPreview.CurrentPage);
   ObjGeneral.TestVisible(PrintPreview.CurrentPage);
   ObjSpecifique.TestVisible(PrintPreview.CurrentPage);
   Outillage.TestVisible(PrintPreview.CurrentPage);
   Cell4.TestVisible(PrintPreview.CurrentPage);
   TitrePlan.TestVisible(PrintPreview.CurrentPage);
   TabTitre.TestVisible(PrintPreview.CurrentPage);
   TabOutillage.TestVisible(PrintPreview.CurrentPage);
   TabPlan.TestVisible(PrintPreview.CurrentPage);
 end;
end;

procedure TForm1.CreatePageGarde;
var
  R,R1: TRect;
  ARow,ACol:integer;
  Rev,NObj:Integer;
  tmp:Real;
  Text: String;
  AObj,Size:Integer;
begin
    ObjectVisible:=False;
    R := PageBoundsAfterMargin;
    R := repos(R,0.5,1);
    Size:=PrintPreview.Font.Size;
    PrintPreview.Zoom:=10*PrintPreview.ZoomStep;
//      DateJour:

    //==========================================================================
    R1:=R;
   // R1.left:=R1.right-PrintPreview.Canvas.TextWidth('Date de Mise a Jour:'+Date);
    //TabTitre:=================================================================
    DateJour:=TCell.create(R1,PrintPreview,Size,ObjectVisible);
    DateJour.Caption1:='Date de Mise a Jour';
    //DateJour.reforme(taRightJustify,5,1);
    //TabTitre:=================================================================
    R1:=repos(R,0,1);
    TabTitre:=TACell.create(R1,PrintPreview,Size,ObjectVisible);
    TabTitre.Row:=1;
    TabTitre.Col:=3;
    TabTitre.XWidth[1]:=4;
    TabTitre.XWidth[2]:=10;
    TabTitre.XWidth[3]:=4;
    TabTitre.YWidth[1]:=2.5;
    TabTitre.draw(taLeftJustify);
    {TabTitre.FCell[1,1].WriteLn('Section:'+'TS/informatique',taLeftJustify);
    TabTitre.FCell[1,1].WriteLn;
    TabTitre.FCell[1,1].WriteLn('Module:'+'Réseau',taLeftJustify);
    TabTitre.FCell[2,1].WriteLn;
    TabTitre.FCell[2,1].WriteLn('Titre:'+Titre,taCenter);
    TabTitre.FCell[3,1].WriteLn('Chapitre N°:'+inttostr(NChapitre),taLeftJustify);
    TabTitre.FCell[3,1].WriteLn;
    TabTitre.FCell[3,1].WriteLn('Leçon N°:'+inttostr(NLecon),taLeftJustify); }
    //==========================================================================
        R1:=R;
        R1.Top:=TabTitre.Tpos.Bottom+100;
        R1.Bottom:=R1.Top+500;
    //ObjPedagogique:===========================================================
    ObjPedagogique:=TCell.create(R1,PrintPreview,Size,ObjectVisible);
    ObjPedagogique.WriteLn('Objectifs Pédagogiques ',taCenter);
    ObjPedagogique.reforme(taCenter,5,1);
    //==========================================================================
        R1:=R;
        R1.Top:=ObjPedagogique.Tpos.Bottom+100;
        R1.Bottom:=R1.Top+500;
     //ObjGeneral:==============================================================
    ObjGeneral:=TCell.create(R1,PrintPreview,Size,ObjectVisible);
    ObjGeneral.WriteLn('Objectif Géneral: ',taLeftJustify);
    ObjGeneral.WriteLn;
    ObjGeneral.WriteLn('                   A la fin de la leçon chaque stagiaire doit etre capable de : ',taLeftJustify);
    ObjGeneral.WriteLn;
    ObjGeneral.reforme(taLeftJustify,18,4);
    //==========================================================================
        R1:=R;
        R1.Top:=ObjGeneral.Tpos.Bottom+100;
        R1.Bottom:=R1.Top+500;
    //ObjSpecifique:============================================================
    ObjSpecifique:=TCell.create(R1,PrintPreview,Size,ObjectVisible);
    ObjSpecifique.WriteLn('Objectifs Specifiques: ',taLeftJustify);
    ObjSpecifique.WriteLn;
    for AObj:=1 to 5 do begin
      ObjSpecifique.WriteLn('  ('+inttostr(AObj)+'): _________________________ ',taLeftJustify);
      ObjSpecifique.WriteLn;
    end;
    ObjSpecifique.WriteLn;
    ObjSpecifique.reforme(taLeftJustify,18,6);
    //==========================================================================
        R1:=R;
        R1.Top:=ObjSpecifique.Tpos.Bottom+100;
        R1.Bottom:=R1.Top+500;
     //Outillage:===============================================================
    Outillage:=TCell.create(R1,PrintPreview,Size,ObjectVisible);
    Outillage.WriteLn('Outillage et Matieres d''ouvres ',taCenter);
    Outillage.WriteLn;
    Outillage.reforme(taCenter,5,1);
    //==========================================================================
        R1:=R;
        R1.Top:=Outillage.Tpos.Bottom+100;
        R1.Bottom:=R1.Top+500;
     //TabOutillage:============================================================
    TabOutillage:=TACell.create(R1,PrintPreview,Size,ObjectVisible);
    TabOutillage.Row:=2;
    TabOutillage.Col:=2;
    TabOutillage.XWidth[1]:=5;
    TabOutillage.XWidth[2]:=5;
    TabOutillage.YWidth[1]:=1;
    TabOutillage.YWidth[2]:=2.5;
    TabOutillage.draw(taCenter);
    TabOutillage.FCell[1,1].WriteLn('Enseignant',taCenter);
    TabOutillage.FCell[2,1].Writeln('Stagiaire',taCenter);
    for AObj:=1 to 5 do begin
        TabOutillage.FCell[1,2].WriteLn('------',taCenter);
        TabOutillage.FCell[2,2].WriteLn('------',taCenter);
    end;
    //==============================================
        R1:=R;
        R1.Top:=TabOutillage.Tpos.Bottom+100;
        R1.Bottom:=R1.Top+500;
    //=============================================

    Cell4:=TCell.create(R1,PrintPreview,Size,ObjectVisible);
    Cell4.WriteLn;
    Cell4.WriteLn('Durée: ',taLeftJustify);
    Cell4.WriteLn;
    Cell4.WriteLn('Moyennes Dédactiques: ',taLeftJustify);
    Cell4.WriteLn;
    for AObj:=1 to 5 do begin
        Cell4.WriteLn('------',taLeftJustify);
    end;
    Cell4.Reforme(taLeftJustify,18,6);
    PrintPreview.NewPage;
    //==============================================
        R1:=R;
       // R1.Top:=0;
        R1.Bottom:=R1.Top+5000;
    //=============================================
    TitrePlan:=TCell.create(R1,PrintPreview,Size,ObjectVisible);
    TitrePlan.Writeln('PLAN DE LA LECON',taCenter);
    TitrePlan.Writeln;
    R1.Top:= TitrePlan.RectPos.Top+1000;
    //=====================================================================
    TabPlan:=TACell.create(R1,PrintPreview,11,ObjectVisible);
    Rev:=1;
    NObj:=1;
    TabPlan.Row:=3+Rev+NObj*3;
    TabPlan.Col:=2;
    TabPlan.XWidth[1]:=9;
    TabPlan.XWidth[2]:=9;
    TabPlan.YWidth[1]:=0.5;
    if(Rev=1) then TabPlan.YWidth[2]:=3;
    TabPlan.draw(taLeftJustify);
    TabPlan.FCell[1,1].WriteLn('Stagiaire',taCenter);
    TabPlan.FCell[2,1].WriteLn('Professeur',taCenter);
    if(Rev=1) then begin
        TabPlan.FCell[2,2].WriteLn('Révision:',taLeftJustify);
        TabPlan.FCell[2,2].WriteLn('...............................................',taLeftJustify);
        TabPlan.FCell[2,2].WriteLn('...............................................',taLeftJustify);
        TabPlan.FCell[2,2].WriteLn('...............................................',taLeftJustify);
        TabPlan.FCell[2,2].WriteLn('...............................................',taLeftJustify);
    end;
    TabPlan.FCell[2,3].WriteLn('Extraction Du Titre:',taLeftJustify);
    TabPlan.FCell[2,4].WriteLn('Affichage des objectifs:',taLeftJustify);
    for AObj:=1 to NObj do begin
        TabPlan.FCell[2,4+AObj].WriteLn('Mise en diffeculté N°:'+inttostr(AObj),taLeftJustify);
        TabPlan.FCell[2,5+AObj].WriteLn('Démonstration & Explication N°:'+inttostr(AObj),taLeftJustify);
        TabPlan.FCell[2,6+AObj].WriteLn('Evaluation Partielle N°:'+inttostr(AObj),taLeftJustify);
    end;
    //====================
       DateJour.StatusBar1:=StatusBar1;
   ObjPedagogique.StatusBar1:=StatusBar1;
   ObjGeneral.StatusBar1:=StatusBar1;
   Outillage.StatusBar1:=StatusBar1;
   ObjSpecifique.StatusBar1:=StatusBar1;
   Cell4.StatusBar1:=StatusBar1;
   TitrePlan.StatusBar1:=StatusBar1;
   TabTitre.StatusBar1:=StatusBar1;
   TabOutillage.StatusBar1:=StatusBar1;
   TabPlan.StatusBar1:=StatusBar1;
   //=====
   DateJour.Fpage:=1;
   ObjPedagogique.Fpage:=1;
   ObjGeneral.Fpage:=1;
   Outillage.Fpage:=1;
   ObjSpecifique.Fpage:=1;
   Cell4.Fpage:=1;
   TitrePlan.Fpage:=2;
   TabTitre.Fpage:=1;
   TabOutillage.Fpage:=1;
   TabPlan.Fpage:=2;

   created:=True;

end;

procedure TForm1.CreatePlan;
begin
  with PrintPreview do
  begin
    {$IFDEF COMPILER7_UP}
    PageBoundsAfterMargin := GetPageSetupParameters(PageSetupDialog);
    {$ELSE}
    PageBoundsAfterMargin := PageBounds;
    with PointFrom(mmLoMetric, 100, 100) do
      InflateRect(PageBoundsAfterMargin, -X, -Y);
    {$ENDIF}
    //BeginDoc;
    //try

        CreatePageGarde;

    //finally
     // EndDoc;
    //end;
  end;
end;

end.
