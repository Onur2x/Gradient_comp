unit ongrid;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Windows, Messages, Controls, Graphics, Forms, StdCtrls, Grids,Math,Types,dialogs;

type
  {
   TOnItem = class(TCollectionItem)
   private
      FCaption   : String;
      FSelected  : Boolean;
      FCurrent   : Boolean;
   public
      constructor Create(Collectioni: TCollection); override;
      destructor Destroy; override;
      procedure Assign(Source: TPersistent); override;
      property Selected : Boolean read FSelected write FSelected;
      property Current  : Boolean read FCurrent  write FCurrent;
      property Index;
   published
      property Caption   : String      read FCaption   write FCaption;
   end;

  TOnItems = class(TOwnedCollection)
  private
     function GetItem(Index: Integer): TOnItem;
     procedure SetItem(Index: Integer; const Value: TOnItem);
  protected
     procedure Update(Item: TCollectionItem); override;
  public
     constructor Create(AOwner: TPersistent; ItemClassi: TCollectionItemClass);
     function Add: TOnItem;
     procedure Clear;
     procedure Delete(Index: Integer);
     function Insert(Index: Integer): TOnItem;
     function IndexOf(Value: TOnItem): Integer;
//     procedure Sort(Mode: TUSPlaylistItemsSortMode);
     property Items[Index: Integer]: TOnItem read GetItem write SetItem; default;
  end;

  TOnDeleteItem = procedure(Sender: TObject; Length: Cardinal) of object;
}
//  TOnGrid = class;

  { TOnGrid }

  TOnGrid = class(TCustomControl)
  private
    FFont                  : TFont;
    Fitems                 : Tstrings;
   // FListItems             : TOnItems;
    FItemOffset            : Integer;
    FItemsShown            : SmallInt;
    FFocusedItem           : Integer;
    FCurrentItem           : Integer;
    FItemHeight            : Byte;
    FIsDblClicked          : Boolean;
    FIsClicked             : Boolean;
    FNoPaintCurrent        : Boolean;
    FAutoHideScrollBar     : Boolean;
    FScrollBarWidth,
    FScrollBarTopMargin,
    FScrollBarBottomMargin : Byte;
    FItemDblClick          : TNotifyEvent;
    FItemClick             : TNotifyEvent;
    FItemEnterKey          : TNotifyEvent;
//    FOnDeleteItem          : TOnDeleteItem;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure SetItems(Value: Tstrings);
    function GetItems(Index: Integer):TStrings;

    function ItemRect(Item: Integer): TRect;
//    procedure DrawItem(ACanvas: TBitmap; Item: TOnItem; X1, X2: SmallInt);
    Function GetItemAt(Pos: TPoint): Integer;
    procedure SetCurrentItem(const Value: Integer);
    procedure ScrollBarChange(Sender: TObject);
    procedure CNKeyDown(var Message: TWMKeyDown); message CN_KEYDOWN;
  protected
    procedure Paint; override;
    function DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    function DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean; override;
  public
    HScrollBar,VScrollBar : TScrollBar;
    constructor Create(Aowner: TComponent); override;
    destructor Destroy; override;
    procedure DblClick; override;
    procedure Click;  override;
    procedure MouseDown(Button : TMouseButton; Shift : TShiftState; X,Y : Integer); override;
    procedure MouseUp(Button : TMouseButton; Shift : TShiftState; X,Y : Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure ClearSelection(RepaintAll: Boolean = False);
    procedure setFont(Fontn:Tfont);
    procedure SelectAll;
    procedure InvertSelection;
    procedure MoveUp;
    procedure MoveDown;
    procedure MoveHome;
    procedure MoveEnd;
    procedure FindItem(Texti: String);

  published
  //  property Items[Index: Integer]: TOnItem read GetItem write SetItem; default;
    property Colums                  : TStrings         read Fitems                 write SetItems;
    property SelectedIndex           : Integer          read FFocusedItem;
    property CurrentItem             : Integer          read FCurrentItem           write SetCurrentItem;
    property ScrollBarWidth          : Byte             read FScrollBarWidth        write FScrollBarWidth;
    property ScrollBarTopMargin      : Byte             read FScrollBarTopMargin    write FScrollBarTopMargin;
    property ScrollBarBottomMargin   : Byte             read FScrollBarBottomMargin write FScrollBarBottomMargin;
    property AutoHideScrollBar       : Boolean          read FAutoHideScrollBar     write FAutoHideScrollBar;
    property OnItemDblClick          : TNotifyEvent     read FItemDblClick          write FItemDblClick;
    property OnItemClick             : TNotifyEvent     read FItemClick             write FItemClick;
    property OnItemEnterKey          : TNotifyEvent     read FItemEnterKey          write FItemEnterKey;
//    property OnDeleteItem            : TOnDeleteItem    read FOnDeleteItem          write FOnDeleteItem;
    property Font                    : TFont            read FFont                  write SetFont      stored True;
    property Anchors;
    property DragCursor;
    property DragKind;
    property DragMode;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnStartDrag;
    property TabOrder;
    property TabStop;
    property Visible;
    property Color;
    property Constraints;
    property Enabled;
    property ParentBidiMode;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property OnClick;
    property OnContextPopup;
    property OnEndDock;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnPaint;
    property OnResize;
  end;

{ TBorderControl
  A control with a system drawn border following the current theme, and an
  additional margin as implemented by TWinControl.BorderWidth. }

{  TBorderControl = class(TCustomControl)
  private
    FBorderStyle: TBorderStyle;
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure WMNCPaint(var Message: TWMNCPaint); message WM_NCPAINT;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    function TotalBorderWidth: Integer; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle
      default bsSingle;
    property BorderWidth;
  end;
  }

{ TAnimRowScroller
  A scroll box with a vertical scroll bar and vertically stacked items with a
  fixed row height. Scrolling with the scroll bar is animated alike Windows'
  own default list box control. Scrolling is also possible by dragging the
  content with the left mouse button. }
 {
  TAnimRowScroller = class(TBorderControl)
  private
    FAutoHideScrollBar: Boolean;
    FDragScroll: Boolean;
    FDragScrolling: Boolean;
    FDragSpeed: Single;
    FDragStartPos: Integer;
    FPrevScrollPos: Integer;
    FPrevTick: Cardinal;
    FRow: Integer;
    FRowCount: Integer;
    FRowHeight: Integer;
    FScrollingPos: Integer;
    FScrollPos: Integer;
    FWheelScrollLines: Integer;
    procedure Drag;
    function IsWheelScrollLinesStored: Boolean;
    procedure Scroll;
    procedure SetAutoHideScrollBar(Value: Boolean);
    procedure SetRow(Value: Integer);
    procedure SetRowCount(Value: Integer);
    procedure SetScrollPos(Value: Integer; Animate, Snap: Boolean);
    procedure UpdateScrollBar;
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
  protected
    procedure CreateWnd; override;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
      MousePos: TPoint): Boolean; override;
    procedure DrawFocusRect; virtual;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer); override;
    procedure Resize; override;
    procedure SetRowHeight(Value: Integer); virtual;
    procedure WndProc(var Message: TMessage); override;
    property AutoHideScrollBar: Boolean read FAutoHideScrollBar
      write SetAutoHideScrollBar default True;
    property Row: Integer read FRow write SetRow default -1;
    property RowCount: Integer read FRowCount write SetRowCount;
    property RowHeight: Integer read FRowHeight write SetRowHeight
      default DefRowHeight;
    property DragScroll: Boolean read FDragScroll write FDragScroll
      default True;
    property DragScrolling: Boolean read FDragScrolling;
    property ScrollingPos: Integer read FScrollingPos;
    property WheelScrollLines: Integer read FWheelScrollLines
      write FWheelScrollLines stored IsWheelScrollLinesStored;
  public
    constructor Create(AOwner: TComponent); override;
    procedure MouseWheelHandler(var Message: TMessage); override;
    function Scrolling: Boolean;
  end;
 }
procedure Register;

implementation

{ TOnGrid }

procedure Register;
begin
RegisterComponents('Standard', [TOnGrid]);
end;



procedure yaziyaz(TT: TCanvas; TF: TFont; re: TRect; Fcap: string; asd: TAlignment);
var
  stl: TTextStyle;
begin
  TT.Font.Quality := fqCleartype;
  TT.Font.Name := TF.Name;//'CALIBRI';
  TT.Font.Size := TF.size;
  TT.Font.Color := TF.Color;//$00FFC884;
  TT.Font.style := TF.style;//$00FFC884;
  TT.Brush.Style := bsClear;
  stl.Alignment := asd;
  stl.Wordbreak := True;
  stl.Layout := tlCenter;
  stl.SingleLine := False;
  TT.TextRect(RE, 0, 0, Fcap, stl);
end;


procedure TOnGrid.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
    Invalidate;
end;

procedure TOnGrid.SetItems(Value: TStrings);
begin
  Fitems.Assign(Value);
end;

function TOnGrid.GetItems(Index: Integer):Tstrings;
begin
 // Result:=Fitems[index];
  //if Assigned(Colums[index]) then
//  Result:= Colums[index];// FListItems[Index];
end;

function TOnGrid.ItemRect(Item: Integer): TRect;
var
  r :TRect;
begin
  r := Rect(0, 0, 0, 0);

  if (Item >= FItemOffset - 1) and ((Item - FItemOffset) * FItemHeight < Height) then
  begin

    r.Top    := ((Item - FItemOffset) * FItemHeight);//-(FUst.FSBottom-FUst.FSTop); // + 2; // 2 = TOP MARGIN!!
    r.Bottom :=(r.Top + FItemHeight);//-(FAlt.FSBottom-FAlt.FSTop) ;
    r.Left   :=0;//(FSol.FSright-FSol.FSleft)- 0;

   { if ScrollBar.Visible then
      r.Right := hScrollBar.Left-(FSag.FSright-FSag.FSleft)
    else  }
      r.Right := Width;//-(FSag.FSright-FSag.FSleft);
  end;

  Result := r;

end;

{
procedure TOnGrid.DrawItem(ACanvas: TBitmap; Item: TOnItem; X1, X2: SmallInt
  );
var
 KAYNAK, r : TRect;
  //colr:TBGRAPixel;
begin
  //r := ItemRect(Item.Index);
   if Item.FSelected then
  begin
    ACanvas.FillRect(r.Left, r.Top, r.Right, r.Bottom, FSelectedColor,dmSet);
    colr:=FTextSelectedColor;
  end
  else
  begin
    colr:=FTextColor;
  end;


 // if (Item.Index = FCurrentItem) and not FNoPaintCurrent then
      begin
      // KAYNAK := Rect(0, 0, Factiveitems.FSRight, Factiveitems.FSBottom);
    //   Acanvas.Canvas.CopyRect();
    //   DrawPartnormal(kaynak, self, r, False);
   end;

 //  UpdateFont(ACanvas.Canvas.Handle,ACanvas.Canvas.Font);

 //  DrawText(ACanvas.canvas.Handle, PChar(Fitems.Caption), -1, r, DT_END_ELLIPSIS);
//  colr:=FTextCurrentColor;


//     colr:=BGRABlack;
{  if FShowNumbers then
  begin
    ExtTextout(ACanvas.canvas.Handle, r.Left+3, r.Top, 0, NIL, PChar(IntToStr(Item.Index+1)), Length(IntToStr(Item.Index+1)), NIL);
    Inc(r.Left, X1);
  end
  else
  begin
  }

//  end;

//  if FShowNumbers or FShowLength then
//    Dec(r.Right, (3+X2));





end;
 }
function ValueRange(const Value, Min, Max: Integer): Integer;
begin
  if Value < Min then
    Result := Min
  else if Value > Max then
    Result := Max
  else
    Result := Value;
end;
function TOnGrid.GetItemAt(Pos: TPoint): Integer;
begin
   Result := -1;
  if Pos.Y >= 0 then
  begin
    Result := FItemOffset + Pos.Y div FItemHeight;
//    if (Result > Colums[1].Count-1) or (Result > (FItemOffset+FItemsShown)-1) then
//      Result := -1;
  end;
end;

procedure TOnGrid.SetCurrentItem(const Value: Integer);
var
  Shown: Integer;
begin
 { if FCurrentItem = Value then Exit;
  Shown := Height div FItemHeight;

  if (Colums[1].Count > 0) and (Value >= -1) and (Value <= Colums[1].Count) then
  begin
    FCurrentItem    := Value;
    FNoPaintCurrent := False;

    if (Value < FItemOffset) then
      FItemOffset := Value
    else if Value > (FItemOffset + (Shown - 1)) then
      FItemOffset := ValueRange(Value - (Shown - 1), 0, Colums[1].Count - Shown);
  end
  else
  begin
    FCurrentItem    := -1;
    FNoPaintCurrent := True;
  end;

  Paint;
    }
end;

procedure TOnGrid.ScrollBarChange(Sender: TObject);
begin

end;

procedure TOnGrid.CNKeyDown(var Message: TWMKeyDown);
var
  x: Integer;
begin
 // case Message.CharCode of
 {   VK_RETURN : if (Colums[1].Count > 0) and (FFocusedItem > -1) then
                begin
                  FCurrentItem    := FFocusedItem;
                  FNoPaintCurrent := False;
                  Paint;
                  if Assigned(FItemEnterKey) then FItemEnterKey(Self);
                end;
    VK_UP     : begin
                  MoveUp;
                  Paint;
                end;
    VK_DOWN   : begin
                  MoveDown;
                  Paint;
                end;
    VK_HOME   : begin
                  MoveHome;
                  Paint;
                end;
    VK_END    : begin
                  MoveEnd;
                  Paint;
                end;
    VK_PRIOR  : if Colums[1].Count > 0 then
                begin
                  x := FItemOffset-FItemsShown;
                  if x < 0 then x := 0;

                  ClearSelection;
                  FItemOffset  := x;
                  FFocusedItem := x;
                  Colums[1][FFocusedItem].FSelected := True;

                  Paint;
                end;
    VK_NEXT   : if Colums[1].Count > 0 then
                begin
                  x := FItemOffset+FItemsShown;
                  if x >= Colums[1].Count then x := Colums[1].Count-1;

                  ClearSelection;
                  if Colums[1].Count <= FItemsShown then
                    FItemOffset  := 0
                  else if x > (Colums[1].Count - FItemsShown) then
                    FItemOffset  := Colums[1].Count - FItemsShown
                  else
                    FItemOffset  := x;
                  FFocusedItem := x;
                  Colums[1][FFocusedItem].FSelected := True;

                  Paint;
                end;
  else
    inherited;
  end;
   }
//end;

end;

procedure TOnGrid.Paint;
var
  i,o:integer;
  r:Trect;
begin
  inherited Paint;
 // FItemHeight:=self.Canvas.TextWidth(Colums[0].GetItem(0).Caption);

 // for o :=0 to Fitems.Count-1 do// FItemOffset to (FItemOffset + (Height) div FItemHeight)-1 do
    begin


  //for i :=0 to Fitems[o];// FItemOffset to (FItemOffset + (Height) div FItemHeight)-1 do
    begin
    //  if i < Fitems[0].Count then
     // DrawItem(Fresim, Items[i], 0, 0);
      begin
     //   DrawItem(Fresim, Items[i], x1, x2);
    //   r := ItemRect(Fitems[0].Index);
        { if (Colums[0][i].Index = FCurrentItem) and not FNoPaintCurrent then
          begin
           KAYNAK := Rect(Factiveitems.FSLeft, Factiveitems.FSTop, Factiveitems.FSRight, Factiveitems.FSBottom);
           DrawPartnormal(kaynak, self, r, False);
           colr:=FTextColor;
         end
         else
         colr:=FTextCurrentColor;
       }

      // UpdateFont(Fresim.Canvas.Handle,Font);
   //    DrawText(Fresim.canvas.Handle, PChar(Items[i].FCaption), -1, r, DT_END_ELLIPSIS);
     //  canvas.TextOut(r.Left,r.Top,PChar(Colums[0][i].Caption));
     //    fresim.Canvas.TextOut(r.Left,r.Top,PChar(Items[i].FCaption));
     //  fResim.TextRect(R,PChar(Items[i].FCaption),al,aa,colr);
     end;

    end;
end;

end;

function TOnGrid.DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint
  ): Boolean;
begin
 // Result:=inherited DoMouseWheelDown(Shift, MousePos);
  hScrollBar.Position := hScrollBar.Position+Mouse.WheelScrollLines;
  Result := True;
end;

function TOnGrid.DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  //Result:=inherited DoMouseWheelUp(Shift, MousePos);
  hScrollBar.Position := hScrollBar.Position-Mouse.WheelScrollLines;
  Result := True;
end;

constructor TOnGrid.Create(Aowner: TComponent);
var
  i:integer;
begin
  inherited Create(Aowner);
  parent                  := TWinControl(AOwner);
  ControlStyle            := ControlStyle + [csClickEvents, csCaptureMouse, csAcceptsControls];

  Self.Height             := 190;
  Self.Width              := 190;
 { Font                    := TFont.Create;
  Font.Name               := 'Tahoma';
  Font.Size               := 8;
  Font.Style              := [];  }
//  i                       := 10;
//  for i:=0 to 10  do
//  Colums[i]              := TOnItems.Create(Self, TOnItem);
//  ShowMessage('ok');
  FItemOffset             := 0;
  FItemHeight             := 14;
  FFocusedItem            := -1;
  FCurrentItem            := -1;

  FIsDblClicked           := False;
  FIsClicked              := False;
  FScrollBarWidth         := 0;
  FScrollBarTopMargin     := 0;
  FScrollBarBottomMargin  := 0;
  FAutoHideScrollBar      := False;
  FNoPaintCurrent         := False;
  DragKind                := dkDrag;
  DragMode                := dmManual;
  DragCursor              := crAppStart;

  {ScrollBar               := TONScrollBar.Create(Self);
  ScrollBar.Parent        := Self;
  ScrollBar.State         := Fvertical;
  ScrollBar.Height        := Self.Height;
  ScrollBar.Width         := 20;
  ScrollBar.Visible       := True;
  ScrollBar.Max           := 1;
  ScrollBar.OnChange      := @ScrollBarChange;
  FScrollBarWidth         := ScrollBar.Width;
  }
  FScrollBarTopMargin     := 1;
  FScrollBarBottomMargin  := 1;

  TabStop                 := True;

end;

destructor TOnGrid.Destroy;
//var
 // i:TOnItems;
begin
 // for i in FListItems do
  begin
   //FreeAndNil(i);

  end;
 // ScrollBar.Free;  ScrollBar  := NIL;
  inherited Destroy;
end;

procedure TOnGrid.DblClick;
var
  pt : TPoint;
  i  : Integer;
begin
  FIsDblClicked := True;

 { if Colums[1].Count > 0 then
  begin
    GetCursorPos(pt);
    i := GetItemAt(ScreenToClient(pt));
    if i > -1 then
    begin
      FCurrentItem    := i;
      FNoPaintCurrent := False;
      Paint;
      if Assigned(FItemDblClick) then FItemDblClick(Self);
    end;
  end;
}
  inherited DblClick;
end;

procedure TOnGrid.Click;
var
  pt : TPoint;
  i  : Integer;
begin
  FIsClicked := True;

 { if Colums[1].Count > 0 then
  begin
    GetCursorPos(pt);
    i := GetItemAt(ScreenToClient(pt));
    if i > -1 then
    begin
      FCurrentItem    := i;
      FNoPaintCurrent := False;
      Paint;
      if Assigned(FItemClick) then FItemClick(Self);
    end;
  end;
 }
  inherited Click;
end;

procedure TOnGrid.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);

  var
  ClickedItem, i: Integer;
begin
 { if button = mbLeft then
  begin
    ClickedItem := GetItemAt(Point(X, Y));

    if (ssShift in Shift) then
    begin
      ClearSelection;

      if (ClickedItem > -1) and (FFocusedItem > -1) Then
      begin
        if ClickedItem < FFocusedItem then
        begin
          for i := FFocusedItem downto ClickedItem do
            Colums[1][i].FSelected := True;
        end
        else if ClickedItem > FFocusedItem then
        begin
          for i := FFocusedItem to ClickedItem do
            Colums[1][i].FSelected := True;
        end
        else
          Colums[1][FFocusedItem].FSelected := True;
      end;
    end
    else if (ssCtrl in Shift) then
    begin
      if (ClickedItem > -1) and (ClickedItem < Colums[1].Count) then
      begin
        FFocusedItem := ClickedItem;
        Colums[1][FFocusedItem].FSelected := not Colums[1][FFocusedItem].FSelected;
      end;
    end
    else
    begin
      if ClickedItem > -1 then
      begin
        if Colums[1][ClickedItem].FSelected then
        begin
          FFocusedItem := ClickedItem;
          //if not FIsDblClicked then BeginDrag(False, 4);
        end
        else
        begin
          ClearSelection;

          FFocusedItem := ClickedItem;
          Colums[1][FFocusedItem].FSelected := True;
          BeginDrag(False, 4);
        end;
      end
      else
      begin
        ClearSelection;
        FFocusedItem := -1;
      end;
    end;

    Invalidate;
    SetFocus;
  end;
 }
  inherited MouseDown(Button,Shift,X,Y);
end;

procedure TOnGrid.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  FIsDblClicked := False;
  FIsClicked    := False;
  if (Button = mbLeft) then
    inherited MouseUp(Button, Shift, X, Y)
  else if (Button = mbRight) and Assigned(PopupMenu) and (not PopupMenu.AutoPopup) then
    PopupMenu.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TOnGrid.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
end;

procedure TOnGrid.ClearSelection(RepaintAll: Boolean);
  var
    i: Integer;
  begin
{    if Colums[1].Count > 0 then
    begin
      for i := 0 to Colums[1].Count-1 do
        Colums[1][i].FSelected := False;
    FFocusedItem:=-1;

      if RepaintAll then Paint;
    end;
 }
end;

procedure TOnGrid.setFont(Fontn: Tfont);
begin
{  if font <> Fontn then
  begin
   Font := Fontn;
   //FTextCurrentColor:=Fontn.Color;
   Paint;
  end;
 }
end;

procedure TOnGrid.SelectAll;
  var
    i: Integer;
  begin
{    if Colums[1].Count > 0 then
    begin
      Colums[1].BeginUpdate;
      try
        for i := 0 to Colums[1].Count-1 do
          Colums[1][i].FSelected := True;
      finally
        Colums[1].EndUpdate;
      end;
    end;
 }
end;

procedure TOnGrid.InvertSelection;
  var
    i: Integer;
  begin
{    if Colums[1].Count > 0 then
    begin
      Colums[1].BeginUpdate;
      try
        for i := 0 to Colums[1].Count-1 do
          Colums[1][i].FSelected := not Colums[1][i].FSelected;
      finally
        Colums[1].EndUpdate;
      end;
    end;
   }
end;

procedure TOnGrid.MoveUp;
var
  Shift: Boolean;
begin
 { if Colums[1].Count > 0 then
  begin
    Shift := GetKeyState(VK_SHIFT) < 0;

    if (FFocusedItem > (FItemOffset+FItemsShown)) or (FFocusedItem < (FItemOffset)) then
    begin
      FFocusedItem := FItemOffset;
      if not Shift then ClearSelection;
      Colums[1][FFocusedItem].FSelected := True;
    end
    else if (FFocusedItem > 0) and (FFocusedItem < Colums[1].Count) then
    begin
      // SCROLL?????
      if ((FFocusedItem-FItemOffset) = 0) and (FItemOffset > 0) then
        dec(FItemOffset);

      if not Shift then ClearSelection;
      Dec(FFocusedItem);
      if FFocusedItem > -1 then
        Colums[1][FFocusedItem].FSelected := True;
    end;
  end;
 }
end;

procedure TOnGrid.MoveDown;
var
  Shift: Boolean;
begin
{  if Colums[1].Count > 0 then
  begin
    Shift := GetKeyState(VK_SHIFT) < 0;

    if (FFocusedItem > (FItemOffset+FItemsShown)) or (FFocusedItem < (FItemOffset)) then
    begin
      FFocusedItem := FItemOffset;
      if not Shift then ClearSelection;
      Colums[1][FFocusedItem].FSelected := True;
    end
    else if (FFocusedItem >= 0) and (FFocusedItem < Colums[1].Count-1) then
    begin
      if not Shift then ClearSelection;
      Inc(FFocusedItem);
      if FFocusedItem > -1 then
        Colums[1][FFocusedItem].FSelected := True;

      // SCROLL?????
      if (FFocusedItem-FItemOffset) > FItemsShown-1 then
        inc(FItemOffset);
    end;
  end;
 }
end;

procedure TOnGrid.MoveHome;
var
  i: Integer;
begin
 { if Colums[1].Count > 0 then
  begin
    ClearSelection;

    if GetKeyState(VK_SHIFT) < 0 then
    begin
//      if FFocusedItem > 0 then
        for i := FFocusedItem downto 0 do
          Colums[1][i].FSelected := True;
    end
    else
      Colums[1][0].FSelected := True;

    FFocusedItem := 0;
    FItemOffset  := 0;
  end;
 }
end;

procedure TOnGrid.MoveEnd;
var
  i: Integer;
begin
 { if Colums[1].Count > 0 then
  begin
    ClearSelection;

    if GetKeyState(VK_SHIFT) < 0 then
    begin
      for i := FFocusedItem to Colums[1].Count-1 do
        Colums[1][i].FSelected := True;
    end
    else
      Colums[1][Colums[1].Count-1].FSelected := True;

    FFocusedItem := Colums[1].Count-1;

    if (Colums[1].Count-FItemsShown) >= 0 then
      FItemOffset := Colums[1].Count-FItemsShown
    else
      FItemOffset := 0;
  end;
 }
end;

procedure TOnGrid.FindItem(Texti: String);
var
  i : Integer;
  l : SmallInt;
begin
{  if Colums[1].Count > 0 then
  begin
    ClearSelection(Texti = '');
    if Texti = '' then Exit;

    Colums[1].BeginUpdate;
    try
      Text := AnsiLowerCase(Texti);
      l    := Length(Texti);

      for i := 0 to Colums[1].Count-1 do
        if AnsiLowerCase(Copy(Colums[1][i].FCaption, 1, l)) = Texti then
        begin
          Colums[1][i].Selected := True;

          if not ((i > FItemOffset) and (i < FItemOffset+FItemsShown)) then
            FItemOffset := i;

          Break;
        end;
    finally
      Colums[1].EndUpdate;
    end;
  end;
}
end;

end.

