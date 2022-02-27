unit butonu;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, LMessages,
  {$IFDEF UNIX}unix{$ELSE} Windows{$ENDIF}, SysUtils,
  Forms, Controls, Graphics, Messages, Dialogs,
  ExtCtrls, Types,LCLType,  LazUTF8;




type

  Tobutonstate = (obenters, obleaves, obdowns);
  ToExpandStatus = (oExpanded, oCollapsed); // collapsed panel
  Tcapdirection = (ocup, ocdown, ocleft, ocright);
  Tbutondirection = (obleft, obright);
  Tokindstate = (oVertical, oHorizontal);

  { TOcolors }
  TOPersistent = class(TPersistent)
    owner: TPersistent;
    constructor Create(Aowner: TPersistent); overload virtual;
  end;

  Tocolor = class(TOPersistent)
  private
    Fstartc, fstopc, fborderc, ffontcolor: Tcolor;
    fborder: integer;
    function getborder: integer;
    function getbordercolor: Tcolor;
    function getstartcolor: Tcolor;
    function getstopcolor: Tcolor;
    function getfontcolor: Tcolor;
    procedure Setborder(const Value: integer);
    procedure Setbordercolor(const Value: Tcolor);
    procedure Setstartcolor(const Value: Tcolor);
    procedure Setstopcolor(const Value: Tcolor);
    procedure setfontcolor(const Value: Tcolor);
  public
    function paint: boolean;
  published
    property Border: integer read getborder write Setborder default 1;
    property Startcolor: TColor read getstartcolor write setstartcolor;
    property Stopcolor: TColor read getstopcolor write setstopcolor;
    property Bordercolor: TColor read getbordercolor write setbordercolor;
    property Fontcolor: TColor read getfontcolor write Setfontcolor;
  end;

  { ToCustomcontrol }

  ToCustomcontrol = class(TCustomControl)
  private
    fbackground: Tocolor;
    Fkind: Tokindstate;
//    fbackgroundcolored: boolean;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure CreateParams(var Params: TCreateParams);
    procedure Drawtorect(Cnv: Tcanvas; rc: Trect; tc: ToColor; Fkindi: Tokindstate);
    function Getkind: Tokindstate;
    procedure SetKind(AValue: Tokindstate);
  protected
  public
    Backgroundcolored : boolean;
    constructor Create(Aowner: TComponent); override;
    destructor Destroy; override;
    procedure paint; override;
    property Kind: Tokindstate read Getkind write SetKind;
    property Caption;

  published
    property Background: Tocolor read fbackground write fbackground;
    property Action;
    property Align;
    property Anchors;
    property AutoSize;
    property BidiMode;
    property ChildSizing;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ParentBidiMode;
    property OnChangeBounds;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDrag;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Visible;
  end;



  { TOGraphicControl }

  TOGraphicControl = class(TGraphicControl)
  private
    fbackground: Tocolor;
    Fkind: Tokindstate;
//    fbackgroundcolored: boolean;
    function Getkind: Tokindstate;
    function GetTransparent: boolean;
    procedure Setkind(Value: Tokindstate);
    procedure Drawtorect(Cnv: Tcanvas; rc: Trect; tc: ToColor; Fkindi: Tokindstate);
    procedure SetTransparent(AValue: boolean);
  public
    Backgroundcolored : boolean;
    constructor Create(Aowner: TComponent); override;
    destructor Destroy; override;
    procedure paint; override;
    property Kind: Tokindstate read Getkind          write Setkind default oHorizontal;
    property Caption;
  published
    property Background: Tocolor read fbackground write fbackground;
    property Transparent: boolean read GetTransparent
      write SetTransparent default True;
    property Action;
    property Align;
    property Anchors;
    property AutoSize;
    property BidiMode;
    property Constraints;
    property Enabled;
    property Font;
    property ParentBidiMode;
    property OnChangeBounds;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDrag;
    property ParentFont;
    property ParentShowHint;
    property ParentColor;
    property PopupMenu;
    property ShowHint;
    property Visible;
  end;


  { TOCustomProgressBar }

  TOProgressBar = class(TOGraphicControl)
  private
    fbar: Tocolor;
    FOnChange: TNotifyEvent;
    fposition, fmax, fmin: Int64;
    ftext: string;
    FCaptonvisible: boolean;
    procedure setposition(const Val: Int64);
    procedure setmax(const Val: Int64);
    procedure setmin(const Val: Int64);
    function Getposition: Int64;
    function Getmin: Int64;
    function Getmax: Int64;
  public
    constructor Create(Aowner: TComponent); override;
    destructor Destroy; override;
    procedure paint; override;
  published
    property Captonvisible: boolean read FCaptonvisible write FCaptonvisible;
    property Background;
    property Bar: Tocolor read fbar write fbar;
    property Min: Int64 read Getmin write setmin;
    property Max: Int64 read Getmax write setmax;
    property Position: Int64 read Getposition write setposition;
    property Onchange: TNotifyEvent read FOnChange write FOnChange;
    property Kind;
    property Transparent;
    property Action;
    property Align;
    property Anchors;
    property AutoSize;
    property BidiMode;
    property Constraints;
    property Enabled;
    property Font;
    property ParentBidiMode;
    property OnChangeBounds;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDrag;
    property ParentFont;
    property ParentShowHint;
    property ParentColor;
    property PopupMenu;
    property ShowHint;
    property Visible;
  end;

  { Tobuton }

  Tobuton = class(ToGraphicControl)
  private
    fenter, fleave, fdown, fdisabled: Tocolor;
    fstate: Tobutonstate;
    //    fonstatechange: Tobutonstatechange;
  protected
    procedure CMonmouseenter(var Messages: Tmessage); message CM_MOUSEENTER;
    procedure CMonmouseleave(var Messages: Tmessage); message CM_MOUSELEAVE;

    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X: integer; Y: integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X: integer; Y: integer); override;
  public
    constructor Create(Aowner: TComponent); override;
    destructor Destroy; override;
    procedure paint; override;
  published
    property ColorEnter: Tocolor read fenter write fenter;
    property ColorLeave: Tocolor read fleave write fleave;
    property ColorDown: Tocolor read fdown write fdown;
    property ColorDisable: Tocolor read fdisabled write fdisabled;
    property State: Tobutonstate read fstate write fstate;
    property Caption;
    property Transparent;
    property Action;
    property Align;
    property Anchors;
    property AutoSize;
    property BidiMode;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ParentBidiMode;
    property OnChangeBounds;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDrag;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ParentColor;
    property ShowHint;
    property Visible;

  end;

  { TOGraphicPanel }

  TOGraphicPanel = class(ToGraphicControl)
  public
    procedure paint; override;
  published
    property Background;
    property Kind;
    property Caption;
    property Transparent;
    property Action;
    property Align;
    property Anchors;
    property AutoSize;
    property BidiMode;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ParentBidiMode;
    property OnChangeBounds;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDrag;
    property ParentFont;
    property ParentShowHint;
    property ParentColor;
    property PopupMenu;
    property ShowHint;
    property Visible;
  end;


  TOpanel = class(ToCustomcontrol)
  public
    procedure paint; override;
  published
    property Background;
    property Kind;
    property Caption;
    property Action;
    property Align;
    property Anchors;
    property AutoSize;
    property BidiMode;
    property ChildSizing;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ParentBidiMode;
    property OnChangeBounds;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDrag;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Visible;
  end;

  { TCollapExpandpanel }

  TCollapExpandpanel = class(ToCustomcontrol)
  private
    FStatus: ToExpandStatus;
    FOnCollapse: TNotifyEvent;
    FOnExpand: TNotifyEvent;
    FExpandButton: Tobuton;
    FAutoCollapse: boolean;
    fminheight: integer;
    fnormalheight: integer;
    //    fheight         : integer;
    fbutonen, fbutonle, fbutondown: Tocolor;
    fbutondirection: Tbutondirection;
    procedure SetStatus(const AValue: ToExpandStatus);
    procedure SetAutoCollapse(const AValue: boolean);
    procedure SetOnCollapse(const AValue: TNotifyEvent);
    procedure SetOnExpand(const AValue: TNotifyEvent);
    function GetMinheight: integer;
    function GetNormalheight: integer;
    procedure Setminheight(const Avalue: integer);
    procedure Setnormalheight(const Avalue: integer);
    procedure ResizePanel();
  protected
    procedure OnMyButtonClick(Sender: TObject);
    procedure DblClick; override;
  public
    constructor Create(Aowner: TComponent); override;
    destructor Destroy; override;
    procedure paint; override;
  published
    property OnExpand: TNotifyEvent read FOnExpand write SetOnExpand;
    property OnCollapse: TNotifyEvent
      read FOnCollapse write SetOnCollapse;
    property AutoCollapse: boolean
      read FAutoCollapse write SetAutoCollapse;
    property Status: ToExpandStatus read FStatus write SetStatus;
    property Minheight: integer read GetMinheight write Setminheight;
    property Normalheight: integer
      read GetNormalheight write Setnormalheight;
    property Caption;//String            read Gettexti         write Settexti;
    property Kind;
    property ButtonEnter: Tocolor read fbutonen write fbutonen;
    property ButtonLeave: Tocolor read fbutonle write fbutonle;
    property ButtonDown: Tocolor read fbutondown write fbutondown;
    property ButtonPosition: Tbutondirection
      read fbutondirection write fbutondirection;
    property Background;
    property Action;
    property Align;
    property Anchors;
    property AutoSize;
    property BidiMode;
    property ChildSizing;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ParentBidiMode;
    property OnChangeBounds;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDrag;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Visible;

  end;




  { Tocheckbox }

  Tocheckbox = class(ToGraphicControl)
  private
    obenter, obleave, obdown, obdisabled, obcheckenters, obcheckleaves: ToColor;
    fstate: Tobutonstate;
    fcheckwidth: integer;
    fchecked: boolean;
    fcaptiondirection: Tcapdirection;
    FOnChange: TNotifyEvent;
    function GetChecWidth: integer;
    procedure SetChecWidth(AValue: integer);
    procedure SetCaptionmod(const val: Tcapdirection);
    procedure SetChecked(const Value: boolean);
    function GetChecked: boolean;
    procedure SetState(const Value: Tobutonstate);
    function GetState: Tobutonstate;
    function GetCaptionmod: Tcapdirection;
    procedure deaktifdigerleri;
  protected
    procedure CMonmouseenter(var Messages: Tmessage); message CM_MOUSEENTER;
    procedure CMonmouseleave(var Messages: Tmessage); message CM_MOUSELEAVE;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure CreateParams(var Params: TCreateParams);
    procedure CMHittest(var msg: TCMHIttest);
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X: integer; Y: integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X: integer; Y: integer); override;
  public
    constructor Create(Aowner: TComponent); override;
    destructor Destroy; override;
    procedure paint; override;
  published
    property ColorEnter: Tocolor read obenter write obenter;
    property ColorLeave: Tocolor read obleave write obleave;
    property ColorDown: Tocolor read obdown write obdown;
    property ColorCheckEnter: Tocolor read obcheckenters write obcheckenters;
    property ColorCheckLeave: Tocolor read obcheckleaves write obcheckleaves;
    property ColorDisable: Tocolor read obdisabled write obdisabled;
    property Caption;
    property State: Tobutonstate read GetState write SetState;
    property Checked: boolean read GetChecked write SetChecked;
    property ChecWidth: integer read GetChecWidth write SetChecWidth;
    property CaptionDirection: Tcapdirection read GetCaptionmod write SetCaptionmod;
    property Transparent;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property Action;
    property Align;
    property Anchors;
    property AutoSize;
    property BidiMode;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ParentBidiMode;
    property OnChangeBounds;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDrag;
    property ParentFont;
    property ParentShowHint;
    property ParentColor;
    property PopupMenu;
    property ShowHint;
    property Visible;
  end;

  ToRadiobutton = class(Tocheckbox)
  published
    property ColorEnter;
    property ColorLeave;
    property ColorDown;
    property ColorCheckEnter;
    property ColorCheckLeave;
    property Caption;
    property CaptionDirection;
    property State;
    property Checked;
    property Transparent;
    property Action;
    property Align;
    property Anchors;
    property AutoSize;
    property BidiMode;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ParentBidiMode;
    property OnChange;
    property OnChangeBounds;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDrag;
    property ParentFont;
    property ParentShowHint;
    property ParentColor;
    property PopupMenu;
    property ShowHint;
    property Visible;
  end;

  { TOTrackBar }

  TOTrackBar = class(ToGraphicControl)
  private
    obenter, obleave, obdown, fdisabled: ToColor;
    fcbutons: Tobutonstate;
    fcenterbuttonarea: TRect;
    FW, FH: integer;
    FPosition, FXY, FPosValue: integer;
    FMin, FMax: integer;
    FIsPressed: boolean;
    FOnChange: TNotifyEvent;
    procedure centerbuttonareaset;
    function CheckRange(const Value: integer): integer;
    function Getcolors(xx: Tobutonstate): Tocolor;
    function MaxMin: integer;
    function CalculatePosition(const Value: integer): integer;
    function GetPosition: integer;
    procedure CMonmouseenter(var Messages: Tmessage); message CM_MOUSEENTER;
    procedure CMonmouseleave(var Messages: Tmessage); message CM_MOUSELEAVE;
    procedure SetMax(const Value: integer);
    procedure SetMin(const Value: integer);
    function SliderFromPosition(const Value: integer): integer;
    function PositionFromSlider(const Value: integer): integer;
    procedure SetPosition(Value: integer); virtual;
    procedure SetPercentage(Value: integer);
    procedure Changed;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: integer); override;
    function GetPercentage: integer;
    //    property Positioning : Boolean read FIsPressed;
  published
    { Published declarations }
    property Background;//   : Tocolor          read fbackground    write fbackground;
    property ButtonLeave: Tocolor read obleave write obleave;
    property ButtonEnter: Tocolor read obenter write obenter;
    property ButtonDown: Tocolor read obdown write obdown;
    property ButtonDisabled: Tocolor read fdisabled write fdisabled;
    property Position: integer read GetPosition write SetPosition;
    property Percentage: integer read GetPercentage write SetPercentage;
    property Kind;//         : Tokindstate    read Getkind          write Setkind;
    property Max: integer read FMax write SetMax;
    property Min: integer read FMin write SetMin;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property Action;
    property Align;
    property Anchors;
    property AutoSize;
    property BidiMode;
    property Constraints;
    property Enabled;
    property Font;
    property ParentBidiMode;
    property OnChangeBounds;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDrag;
    property ParentFont;
    property ParentShowHint;
    property ParentColor;
    property PopupMenu;
    property ShowHint;
    property Visible;
    property Transparent;
  end;

  { TOCustomScrollBar }

  { ToScrollBar }

  ToScrollBar = class(ToGraphicControl)
  private
    obenter, obleave, obdown, fdisabled: ToColor;
    fcbutons, flbutons, frbutons: Tobutonstate;
    flbuttonrect, frbuttonrect, Ftrackarea, fcenterbuttonarea: TRect;
    FW, FH: integer;
    FPosition, FXY, FPosValue: integer;
    FMin, FMax: integer;
    FIsPressed: boolean;
    FOnChange: TNotifyEvent;
    procedure centerbuttonareaset;
    function Getcolors(xx: Tobutonstate): Tocolor;
    procedure SetPosition(Value: integer);
    procedure SetMax(Val: integer);
    procedure Setmin(Val: integer);
    function Getposition: integer;
    function Getmin: integer;
    function Getmax: integer;
    function CheckRange(const Value: integer): integer;
    function MaxMin: integer;
    function CalculatePosition(const Value: integer): integer;
    function SliderFromPosition(const Value: integer): integer;
    function PositionFromSlider(const Value: integer): integer;
    procedure SetPercentage(Value: integer);
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X: integer; Y: integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X: integer; Y: integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: integer); override;

    procedure CMonmouseenter(var Messages: Tmessage); message CM_MOUSEENTER;
    procedure CMonmouseleave(var Messages: Tmessage); message CM_MOUSELEAVE;
  public
    constructor Create(Aowner: TComponent); override;
    destructor Destroy; override;
    procedure paint; override;
    function GetPercentage: integer;
  published
    property Background;
    property ButtonLeave    : Tocolor      read obleave     write obleave;
    property ButtonEnter    : Tocolor      read obenter     write obenter;
    property ButtonDown     : Tocolor      read obdown      write obdown;
    property ButtonDisabled : Tocolor      read fdisabled   write fdisabled;
    property Min            : integer      read Getmin      write setmin;
    property Max            : integer      read Getmax      write setmax;
    property Position       : integer      read Getposition write setposition;
    property OnChange       : TNotifyEvent read FOnChange   write FOnChange;
    property Kind;
    property Action;
    property Align;
    property Anchors;
    property AutoSize;
    property BidiMode;
    property Constraints;
    property Enabled;
    property Font;
    property ParentBidiMode;
    property OnChangeBounds;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDrag;
    property ParentFont;
    property ParentShowHint;
    property ParentColor;
    property PopupMenu;
    property ShowHint;
    property Visible;
    property Transparent;
  end;



  { ToListBox }

  ToListBox = class(ToCustomcontrol)
  private
    Flist: TStrings;//List;
    findex: integer;
    fvert, fhorz: ToScrollBar;
    FItemsShown, FitemHeight, Fitemoffset: integer;
    //FFocusedItem: integer;
    Fselectedcolor:Tcolor;
    function DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    function DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean;   override;

    function GetItemAt(Pos: TPoint): integer;
    function getitemheight: integer;
    function GetItemIndex: integer;
    function ItemRect(Item: integer): TRect;
    procedure LinesChanged(Sender: TObject);
    procedure MoveDown;
    procedure MoveEnd;
    procedure MoveHome;
    procedure MoveUp;
    procedure setitemheight(avalue: integer);
    procedure SetItemIndex(Avalue: integer);
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X: integer; Y: integer); override;
    procedure Scrollchange(Sender: TObject);
  protected
    procedure KeyDown(var Key: word; Shift: TShiftState);virtual;
    procedure SetString(AValue: TStrings); virtual;
   // procedure KeyDown(var Key: word; Shift: TShiftState); override;
  public
    constructor Create(Aowner: TComponent); override;
    destructor Destroy; override;
    procedure paint; override;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure Clear;
  published
    property Items            : TStrings    read Flist          write SetString;
    property ItemIndex        : integer     read GetItemIndex   write SetItemIndex;
    property ItemHeight       : integer     read GetItemHeight  write SetItemHeight;
    property HorizontalScroll : ToScrollBar read fhorz          write fhorz;
    property VertialScroll    : ToScrollBar read fvert          write fvert;
    property Selectedcolor    : Tcolor      Read Fselectedcolor write Fselectedcolor;
    property Background;
    property Action;
    property Align;
    property Anchors;
    property AutoSize;
    property BidiMode;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ParentBidiMode;
    property OnChangeBounds;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDrag;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Visible;
    property TabOrder;
    property TabStop default true;
  end;



  { ToChecklistbox }
  TCheckEvent = procedure ( Sender : TObject ; Index : Integer ) of object;

  ToChecklistbox = class(ToCustomcontrol)
  private
    obenter, obleave, obdown, obdisabled, obcheckenters, obcheckleaves: ToColor;
    Flist: TStrings;
    findex,fstateindex: integer;
    Fstate:Tobutonstate;
    Fstatelist,Fchecklist: TList;
    fvert, fhorz: ToScrollBar;
    FItemsShown, FitemHeight, Fitemoffset: integer;
    Fbuttonheight:integer;
    Fselectedcolor:Tcolor;
    FOnCheck 	  : TCheckEvent;
    FOnUnCheck    : TCheckEvent;
    FUserCheck    : Boolean;
    FClickInBox   : Boolean;
    function DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    function DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean;   override;
    function getbuttonheight: integer;
    function GetItemAt(Pos: TPoint): integer;
    function GetItemIndex: integer;
    function getstatenumber(index: integer): integer;
    function ItemRect(Item: integer): TRect;
    function CheckBoxRect( Index : Integer ) : TRect;
    procedure LinesChanged(Sender: TObject);
    procedure MoveDown;
    procedure MoveEnd;
    procedure MoveHome;
    procedure MoveUp;
    procedure setbuttonheight(avalue: integer);
    procedure SetItemIndex(Avalue: integer);
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X: integer; Y: integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X: integer; Y: integer); override;
    procedure MouseEnter; override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseLeave; override;
    procedure Scrollchange(Sender: TObject);
    procedure KeyDown(var Key: word; Shift: TShiftState);
    procedure SetString(AValue: TStrings);

    function  IsChecked( Index : Integer ) : Boolean;
    procedure Check( Index : Integer ; AChecked : Boolean );
    function GetAllChecked : Boolean;
    function GetNoneChecked : Boolean;
  protected
    procedure CheckEvent( Index : Integer ); virtual;
    procedure UnCheckEvent( Index : Integer ); virtual;
  public
    constructor Create(Aowner: TComponent); override;
    destructor Destroy; override;
    procedure paint; override;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure Clear;
    procedure CheckSelection(AChecked : Boolean);
    procedure Toggle(Index : Integer);
    procedure CheckAll(AChecked : Boolean);
    property Checked[Index : Integer] : Boolean read 	IsChecked write Check;
  published
    property Items            : TStrings    read Flist          write SetString;
    property ItemIndex        : integer     read GetItemIndex   write SetItemIndex;
    property ButtonHeight     : integer     read GetButtonHeight write SetButtonHeight;
    property HorizontalScroll : ToScrollBar read fhorz          write fhorz;
    property VertialScroll    : ToScrollBar read fvert          write fvert;
    property Selectedcolor    : Tcolor      read Fselectedcolor write Fselectedcolor;
    property OnCheck 	      : TCheckEvent read FOnCheck       write FOnCheck;
    property OnUncheck 	      : TCheckEvent read FOnUncheck     write FOnUnCheck;
    property ColorEnter       : Tocolor     read obenter        write obenter;
    property ColorLeave       : Tocolor     read obleave        write obleave;
    property ColorDown        : Tocolor     read obdown         write obdown;
    property ColorDisable     : Tocolor     read obdisabled     write obdisabled;
    property ColorCheckEnter  : Tocolor     read obcheckenters  write obcheckenters;
    property ColorCheckLeave  : Tocolor     read obcheckleaves  write obcheckleaves;
    property AllChecked       : Boolean     read GetAllChecked;
    property NoneChecked      : Boolean     read GetNoneChecked;
    property Background;
    property Action;
    property Align;
    property Anchors;
    property AutoSize;
    property BidiMode;
    property ChildSizing;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ParentBidiMode;
    property OnChangeBounds;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDrag;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Visible;
  end;


  Tocustomedit = class;
  { Toncaret }

  Toncaret = class(TOPersistent)
  private
    parent: Tocustomedit;
    FHeight, FWidth: integer;
    fvisibled: boolean;
    fblinkcolor: Tcolor;
    fblinktime: integer;
    function Getblinktime: integer;
    procedure Setblinktime(const Value: integer);
    function Getvisible: boolean;
    procedure Setvisible(const Value: boolean);
    procedure ontimerblink(Sender: TObject);
    function Paint: boolean;
  public
    CaretPos: TPoint;
    //PositionX, PositionY: integer;
    caretvisible: boolean;
    blinktimer: Ttimer;
    constructor Create(aowner: TPersistent);
    destructor Destroy; override;
  published
    //    property PositionX : integer read FPosx        write FPosx;
    //    property PositionY : integer read FPosy        write FPosy;
    property Visible: boolean read Getvisible write Setvisible;
    //    property Caretvisible : boolean read fcaretvisible write fcaretvisible;
    property Blinktime: integer read Getblinktime write Setblinktime;
    property Height: integer read FHeight write FHeight;
    property Width: integer read FWidth write FWidth;
    property Color: Tcolor read fblinkcolor write fblinkcolor;
    //    property Blink     : TTimer  read fblinktimer  write fblinktimer;


  end;


  ToCharCase = (ecNormal, ecUppercase, ecLowerCase);
  TOEchoMode = (emNormal, emNone, emPassword);


  { Tocustomedit }

  Tocustomedit = class(ToCustomControl)
  private
    fSelStart: TPoint;
    fSelLength: integer;
    fVisibleTextStart: TPoint;
    fMultiLine: boolean;
    //  fLines: TStrings; // Just a reference, never Free
    fFullyVisibleLinesCount, fLineHeight: integer;
    // Filled on drawing to be used in customdrawncontrols.pas
    fPasswordChar: char;
    // customizable extra margins, zero is the base value
    fLeftTextMargin, fRightTextMargin: integer;
    FNumbersOnly: boolean;
    Fcharcase: ToCharCase;
    fEchoMode: TOEchoMode;
    DragDropStarted: boolean;
    FLines: TStrings;
    FOnChange: TNotifyEvent;
    FReadOnly: boolean;
    FCarets: Toncaret;
    function Caretttopos(leftch: integer): integer;
    procedure DrawCaret;
    procedure DrawText;
    function GetCaretPos: TPoint;
    function GetCharCase: ToCharCase;
    function GetEchoMode: TOEchoMode;
    function GetLeftTextMargin: integer;
    function GetMultiLine: boolean;


    function GetRightTextMargin: integer;
    function GetPasswordChar: char;
    //    procedure HandleCaretTimer(Sender: TObject);
    procedure DoDeleteSelection;
    procedure DoClearSelection;
    procedure DoManageVisibleTextStart;
    procedure SetCaretPost(AValue: TPoint);
    procedure SetCharCase(const Value: ToCharCase);
    procedure SetEchoMode(const Value: TOEchoMode);
    procedure SetLeftTextMargin(AValue: integer);
    procedure SetLines(AValue: TStrings);
    procedure SetMultiLine(AValue: boolean);
    procedure SetNumberOnly(const Value: boolean);

    procedure SetRightTextMargin(AValue: integer);
    procedure SetText(AValue: string);
    procedure SetPasswordChar(AValue: char);
    function MousePosToCaretPos(X, Y: integer): TPoint;
    function IsSomethingSelected: boolean;
//    function GetMeasures(AMeasureID: integer): integer;// virtual; abstract;
  protected
    function GetText: string; virtual;
    function GetNumberOnly: boolean; virtual;
    function GetReadOnly: boolean; virtual;
    procedure setreadonly(avalue: boolean); virtual;
    procedure RealSetText(const Value: TCaption); override;

    // to update on caption changes, don't change this as it might break descendents
    // for descendents to override
    procedure DoChange; virtual;
    // keyboard
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure KeyDown(var Key: word; Shift: TShiftState); override;
    procedure KeyUp(var Key: word; Shift: TShiftState); override;
    procedure UTF8KeyPress(var UTF8Key: TUTF8Char); override;
    // mouse
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: integer); override;
    procedure MouseEnter; override;
    procedure MouseLeave; override;
    procedure WMSetFocus(var Message: TLMSetFocus); message LM_SETFOCUS;
    procedure WMKillFocus(var Message: TLMKILLFOCUS); message LM_KILLFOCUS;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetCurrentLine(): string;
    procedure SetCurrentLine(AStr: string);
    property LeftTextMargin: integer read GetLeftTextMargin write SetLeftTextMargin;
    property RightTextMargin: integer read GetRightTextMargin write SetRightTextMargin;
    // selection info in a format compatible with TEdit
    function GetSelStartX: integer;
    function GetSelLength: integer;
    procedure SetSelStartX(ANewX: integer);
    procedure SetSelLength(ANewLength: integer);
    property CaretPos: TPoint read GetCaretPos write SetCaretPost;
    property Lines: TStrings read FLines write SetLines;
    property MultiLine: boolean read GetMultiLine
      write SetMultiLine default False;
    property PasswordChar: char read GetPasswordChar
      write SetPasswordChar default #0;
    procedure paint; override;
  published
    property Background: Tocolor read fbackground write fbackground;
    property ReadOnly: boolean read GetReadOnly   write SetReadOnly default False;
    property Text: string read GetText
      write SetText stored False; // This is already stored in Lines
    property NumberOnly: boolean read GetNumberOnly write SetNumberOnly;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property Action;
    property Align;
    property Anchors;
    property AutoSize;
    property BidiMode;
    property CharCase: ToCharCase read GetCharCase write SetCharCase;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property TabStop;
    property TabOrder;
    property ParentBidiMode;
    property OnChangeBounds;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDrag;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Visible;

  end;


  Toedit = class(Tocustomedit)
  protected
    //    property Carets;
    property Background;
    property Text;
    //    property Selstart;
    //    property SelEnd;
    //    property SelText;
    property PasswordChar;
    property OnChange;
    property Action;
    property Align;
    property Anchors;
    property AutoSize;
    property BidiMode;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property TabStop;
    property TabOrder;
    property ParentBidiMode;
    property OnChangeBounds;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDrag;
    property ReadOnly;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Visible;
  end;

  { Tomemo }

  Tomemo = class(Tocustomedit)
  public
    constructor Create(AOwner: TComponent); override;
  protected
    //    property Carets;
    property Lines;
    property Background;
    property Text;
    //    property Selstart;
    //    property SelEnd;
    //    property SelText;
    property PasswordChar;
    property OnChange;
    property Action;
    property Align;
    property Anchors;
    property AutoSize;
    property BidiMode;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property TabStop;
    property TabOrder;
    property ParentBidiMode;
    property OnChangeBounds;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDrag;
    property ReadOnly;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Visible;
  end;



  { ToSpinEdit }

  ToSpinEdit = class(ToCustomcontrol)
  private
   Fdbutton       : Tobuton;
   Fubutton       : Tobuton;
   Fedit          : Toedit;
   Fonchange      : TNotifyEvent;
   fReadOnly      : Boolean;
   fvalue         : integer;
   fmin,Fmax      : integer;
   Fbuttonwidth   : integer;
   Fbuttonheight  : integer;
   procedure feditchange(sender: tobject);
   function getbuttonheight: integer;
   function getbuttonwidth: integer;
   function Getmax: integer;
   function Getmin: integer;
   procedure kclick(Sender: TObject);
   function Gettext: integer;
   procedure setbuttonheight(avalue: integer);
   procedure setbuttonwidth(avalue: integer);
   procedure Setmax(AValue: integer);
   procedure Setmin(AValue: integer);
   procedure Settext(Avalue: integer);
   procedure KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
   procedure Resize;override;
   public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy;override;
    procedure Paint;override;
  published
    property Value         : integer       read Gettext         write SetText;
    property MaxValue      : integer       read Getmin          write Setmin;
    property MinValue      : integer       read Getmax          write Setmax;
    property Buttonwidth   : integer       read GetButtonwidth  write SetButtonwidth;
    property Buttonheight  : integer       read GetButtonheight write SetButtonheight;
    property OnChange      : TNotifyEvent  read FOnChange       write FOnChange;
    property ReadOnly      : boolean       read freadonly       write freadonly;
{    property ButtonEnter   : Tocolor      read fobenter       write fobenter;
    property ButtonLeave   : Tocolor      read fobleave       write fobleave;
    property ButtonDown    : Tocolor      read fobdown        write fobdown;
    property ButtonDisable : Tocolor      read ffdisabled     write ffdisabled;     }
  //  property Background;
    property Action;
    property Align;
    property Anchors;
    property AutoSize;
    property BidiMode;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property TabStop;
    property TabOrder;
    property ParentBidiMode;
    property OnChangeBounds;
    property ParentFont;
    property ParentShowHint;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDrag;
    property PopupMenu;
    property ShowHint;
    property Visible;
  end;

  { Tocombobox }

  Tocombobox = class(ToCustomcontrol)
  private
   fobenter       : Tocolor;
   fobleave       : Tocolor;
   fobdown        : Tocolor;
   ffdisabled     : ToColor;
   Fliste         : TStrings;
   Fedit          : Toedit;
   Fonchange      : TNotifyEvent;
   fReadOnly      : Boolean;
   Fitemindex     : integer;
   fbutonarea     : Trect;
   FItemsShown    : integer;
   FitemHeight    : integer;
   Fitemoffset    : integer;
   Fselectedcolor : Tcolor;
   fdropdown      : boolean;
   Fbutton        : Tobuton;
   procedure kclick(Sender: TObject);
   function Gettext: string;
   function GetItemIndex: integer;
   procedure LinesChanged(Sender: TObject);
   procedure MoveDown;
   procedure MoveEnd;
   procedure MoveHome;
   procedure MoveUp;
   procedure SetItemIndex(Avalue: integer);
   procedure SetStrings(AValue: TStrings);
   procedure SetText(AValue: string);
   procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X: integer; Y: integer); override;
   procedure KeyDown(var Key: word; Shift: TShiftState);
   procedure LstPopupReturndata(Sender: TObject; const Str:string; const indx:integer);
   procedure LstPopupShowHide(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy;override;
    procedure Paint;override;
    procedure BeginUpdate;
    procedure Clear;
    procedure EndUpdate;
  published
    property Text          : string       read Gettext        write SetText;
    property Items         : TStrings     read Fliste         write SetStrings;
    property OnChange      : TNotifyEvent read FOnChange      write FOnChange;
    property ReadOnly      : boolean      read freadonly      write freadonly;
    property Itemindex     : integer      read Getitemindex   write Setitemindex;
    property Selectedcolor : Tcolor       read Fselectedcolor write Fselectedcolor;
    property ButtonEnter   : Tocolor      read fobenter       write fobenter;
    property ButtonLeave   : Tocolor      read fobleave       write fobleave;
    property ButtonDown    : Tocolor      read fobdown        write fobdown;
    property ButtonDisable : Tocolor      read ffdisabled     write ffdisabled;
  //  property Background;
    property Action;
    property Align;
    property Anchors;
    property AutoSize;
    property BidiMode;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property TabStop;
    property TabOrder;
    property ParentBidiMode;
    property OnChangeBounds;
    property ParentFont;
    property ParentShowHint;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDrag;
    property PopupMenu;
    property ShowHint;
    property Visible;
  end;

  { Tpopupformcombobox }
  type
  TReturnStintEvent = procedure (Sender: TObject; const ftext: string; const itemind:integer) of object;

  Tpopupformcombobox= class(TcustomForm)
    procedure listboxDblClick(Sender: TObject);
//    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
//    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    FCaller: Tocombobox;
    FClosed: boolean;
    oblist :ToListBox;
    FOnReturnDate: TReturnStintEvent;
    constructor Create(TheOwner: TComponent);override;
    procedure CMDeactivate(var Message: TLMessage); message CM_DEACTIVATE;
    procedure DoClose(var CloseAction: TCloseAction); override;
    procedure DoShow;override;
    procedure KeepInView(const PopupOrigin: TPoint);
    procedure ReturnstringAnditemindex;
  protected
    procedure Paint; override;
  end;



procedure Register;

implementation
{$IFDEF UNIX}uses math;{$ENDIF}

procedure Register;
begin
  RegisterComponents('Standard', [Tobuton]);
  RegisterComponents('Standard', [Topanel]);
  RegisterComponents('Standard', [TOGraphicPanel]);
  RegisterComponents('Standard', [TCollapExpandpanel]);
  RegisterComponents('Standard', [Toedit]);
  RegisterComponents('Standard', [ToSpinEdit]);
  RegisterComponents('Standard', [Tomemo]);
  RegisterComponents('Standard', [Tocombobox]);
  RegisterComponents('Standard', [Tocheckbox]);
  RegisterComponents('Standard', [ToRadiobutton]);
  RegisterComponents('Standard', [TOProgressBar]);
  RegisterComponents('Standard', [TOTrackBar]);
  RegisterComponents('Standard', [ToScrollBar]);
  RegisterComponents('Standard', [ToListBox]);
  RegisterComponents('Standard', [ToChecklistbox]);


end;





function ValueRange(const Value, Min, Max: integer): integer;
begin
  if Value < Min then
    Result := Min
  else if Value > Max then
    Result := Max
  else
    Result := Value;
end;


procedure DrawTransparentRectangle(Canvas: TCanvas; Rect: TRect;
  Color: TColor; Transparency: integer);
var
  X, Y: integer;
  C: TColor;
  R, G, B: integer;
  RR, RG, RB: integer;
begin
  RR := GetRValue(Color);
  RG := GetGValue(Color);
  RB := GetBValue(Color);
  for Y := Rect.Top to Rect.Bottom - 1 do
    for X := Rect.Left to Rect.Right - 1 do
    begin
      C := Canvas.Pixels[X, Y];
      R := Round(0.01 * (Transparency * GetRValue(C) + (100 - Transparency) * RR));
      G := Round(0.01 * (Transparency * GetGValue(C) + (100 - Transparency) * RG));
      B := Round(0.01 * (Transparency * GetBValue(C) + (100 - Transparency) * RB));
      Canvas.Pixels[X, Y] := RGB(R, G, B);
    end;
end;


procedure ShowCombolistPopup(const APosition: TPoint;
  const OnReturnDate: TReturnStintEvent; const OnShowHide: TNotifyEvent;
  ACaller: Tocombobox);
var
  PopupForm: Tpopupformcombobox;
begin

  PopupForm := Tpopupformcombobox.Create(Application);
  PopupForm.SetBounds(APosition.x,APosition.y,150,250);
  PopupForm.BorderStyle:=bsNone;
//  PopupForm.Name:='xyzzyx';
{  PopupForm.Width:=150;
  PopupForm.Height:=250;  }
  PopupForm.FCaller := ACaller;
  PopupForm.FOnReturnDate := OnReturnDate;
  PopupForm.OnShow := OnShowHide;
  PopupForm.OnHide := OnShowHide;
  PopupForm.Show;
  PopupForm.KeepInView(APosition);   // must be after Show for PopupForm.AutoSize to be in effect.
end;




{ Tpopupformcombobox }

procedure Tpopupformcombobox.listboxDblClick(Sender: TObject);
begin
//Fedit.Text:=ToListBox(sender).Items[ToListBox(sender).ItemIndex];
//Fitemindex:=ToListBox(sender).ItemIndex;
//Tform(ToListBox(sender).parent).Close;
  if ToListBox(sender).items.Count>0 then
  ReturnstringAnditemindex;
end;



 procedure Tpopupformcombobox.DoClose(var CloseAction: TCloseAction);
begin
  FClosed := true;
  Application.RemoveOnDeactivateHandler(@FormDeactivate);
  CloseAction:=caFree;
  inherited DoClose(CloseAction);
  //Application.Terminate;
end;

 procedure Tpopupformcombobox.DoShow;
begin
  inherited DoShow;
    oblist.items:=FCaller.items;

end;

constructor Tpopupformcombobox.Create(TheOwner: TComponent);
begin
  inherited CreateNew(TheOwner);

 FClosed := false;
 Application.AddOnDeactivateHandler(@FormDeactivate);
  oblist :=ToListBox.Create(self);
  oblist.Parent:=self;
  oblist.Align:=alClient;
//  oblist.items.Assign(FCaller.Fliste);//:=FCaller.items;// .Assign(FCaller.Items);
  oblist.OnClick:=@listboxDblClick;
end;

procedure Tpopupformcombobox.CMDeactivate(var Message: TLMessage);
begin
 FormDeactivate(self);
end;

procedure Tpopupformcombobox.FormDeactivate(Sender: TObject);
begin
  Hide;
  if (not FClosed) then
   Close;
end;



procedure Tpopupformcombobox.KeepInView(const PopupOrigin: TPoint);
var
  ABounds: TRect;
  P: TPoint;
begin
  ABounds := Screen.MonitorFromPoint(PopupOrigin).WorkAreaRect; // take care of taskbar
  if PopupOrigin.X + Width > ABounds.Right then
    Left := ABounds.Right - Width
  else if PopupOrigin.X < ABounds.Left then
    Left := ABounds.Left
  else
    Left := PopupOrigin.X;
  if PopupOrigin.Y + Height > ABounds.Bottom then
  begin
    if Assigned(FCaller) then
      Top := PopupOrigin.Y - FCaller.Height - Height
    else
      Top := ABounds.Bottom - Height;
  end else if PopupOrigin.Y < ABounds.Top then
    Top := ABounds.Top
  else
    Top := PopupOrigin.Y;
  if Left < ABounds.Left then Left := 0;
  if Top < ABounds.Top then Top := 0;

end;

procedure Tpopupformcombobox.ReturnstringAnditemindex;
begin
   if Assigned(FOnReturnDate) then
    FOnReturnDate(Self, oblist.items[oblist.itemindex],oblist.itemindex);
  if not FClosed then
    Close;

end;

procedure Tpopupformcombobox.Paint;
begin
  inherited Paint;
end;




{ TOcolors }

constructor TOPersistent.Create(Aowner: TPersistent);
begin
  inherited Create;
  owner := Aowner;
end;

{ Tocolor }

function Tocolor.paint: boolean;
begin
  if (self.owner is TOProgressBar) and Assigned(Self.owner) then
    TOProgressBar(self.owner).paint;
  if (self.owner is Tobuton) and Assigned(Self.owner) then
    Tobuton(self.owner).paint;
  if (self.owner is Tocheckbox) and Assigned(Self.owner) then
    Tocheckbox(self.owner).paint;
  if (self.owner is ToRadiobutton) and Assigned(Self.owner) then
    ToRadiobutton(self.owner).paint;
  if (self.owner is Topanel) and Assigned(Self.owner) then
    Topanel(self.owner).paint;
//  if (self.owner is ToCustomcontrol) and Assigned(Self.owner) then
//    ToCustomcontrol(self.owner).paint;
//  if (self.owner is TOGraphicControl) and Assigned(Self.owner) then
//    TOGraphicControl(self.owner).paint;
  Result := True;
end;

function Tocolor.getborder: integer;
begin
  Result := fborder;
end;

function Tocolor.getbordercolor: Tcolor;
begin
  Result := fborderc;
end;

function Tocolor.getstartcolor: Tcolor;
begin
  Result := Fstartc;
end;

function Tocolor.getstopcolor: Tcolor;
begin
  Result := fstopc;
end;

function Tocolor.getfontcolor: Tcolor;
begin
  Result := ffontcolor;
end;

procedure Tocolor.Setborder(const Value: integer);
begin
  if Value <> fborder then
  begin
    fborder := Value;
    Tcontrol(self.owner).Invalidate;
  end;
end;

procedure Tocolor.Setbordercolor(const Value: Tcolor);
begin
  if Value <> fborderc then
  begin
    fborderc := Value;
    Tcontrol(self.owner).Invalidate;
  end;
end;

procedure Tocolor.Setstartcolor(const Value: Tcolor);
begin
  if Value <> Fstartc then
  begin
    Fstartc := Value;
    Tcontrol(self.owner).Invalidate;
  end;
end;

procedure Tocolor.Setstopcolor(const Value: Tcolor);
begin
  if Value <> fstopc then
  begin
    fstopc := Value;
    Tcontrol(self.owner).Invalidate;
  end;
end;

procedure Tocolor.setfontcolor(const Value: Tcolor);
begin
  if Value <> ffontcolor then
  begin
    ffontcolor := Value;
    Tcontrol(self.owner).Invalidate;
  end;
end;

{ TOGraphicControl }

function TOGraphicControl.Getkind: Tokindstate;
begin
  Result := Fkind;
end;

function TOGraphicControl.GetTransparent: boolean;
begin
  Result := Color = clNone;
end;


procedure TOGraphicControl.Setkind(Value: Tokindstate);
var
  x: integer;
begin
  if Fkind = Value then exit;
  Fkind := Value;
  if ((csDesigning in ComponentState) and (not (csLoading in ComponentState))) then
  begin
    X := self.Width;
    self.Width := Height;
    self.Height := X;
  end;

end;

procedure TOGraphicControl.Drawtorect(Cnv: Tcanvas; rc: Trect; tc: ToColor;
  Fkindi: Tokindstate);
var
  gradienrect1, gradienrect2: Trect;
begin
  Cnv.Brush.Color := tc.bordercolor;
  cnv.FillRect(rc);

  rc := Rect(rc.Left + tc.Border, rc.Top + tc.Border, rc.Right - tc.Border, rc.Bottom - tc.Border);

  if Fkindi = oHorizontal then
  begin
    gradienrect1 := Rect(rc.Left, rc.top, rc.Right, rc.Bottom div 2);
    gradienrect2 := Rect(rc.Left, rc.bottom div 2, rc.Right, rc.Bottom);
    Cnv.GradientFill(gradienrect1, tc.startcolor, tc.stopcolor, gdVertical);
    Cnv.GradientFill(gradienrect2, tc.stopcolor, tc.startcolor, gdVertical);
  end
  else
  begin
    gradienrect1 := Rect(rc.Left, rc.top, rc.Right div 2, rc.Bottom);
    gradienrect2 := Rect(rc.Right div 2, rc.top, rc.Right, rc.Bottom);
    Cnv.GradientFill(gradienrect1, tc.startcolor, tc.stopcolor, gdHorizontal);
    Cnv.GradientFill(gradienrect2, tc.stopcolor, tc.startcolor, gdHorizontal);
  end;

end;

procedure TOGraphicControl.SetTransparent(AValue: boolean);
begin
  if transparent = AValue then
    exit;
  if AValue then
    Color := clNone
  else
  if Color = clNone then
    Color := clBackground;
end;

constructor TOGraphicControl.Create(Aowner: TComponent);
begin
  inherited Create(Aowner);
  parent := TWinControl(Aowner);
  ControlStyle := ControlStyle + [csClickEvents, csCaptureMouse,
    csDoubleClicks];
  self.Width := 250;
  self.Height := 150;
  background := Tocolor.Create(self);
  background.Startcolor := clActiveBorder;
  background.Stopcolor := clMenu;
  background.Border := 1;
  background.Bordercolor := clBlack;
  Fkind := oHorizontal;
  Transparent := True;
  backgroundcolored := True;
  ParentColor:=true;
end;

destructor TOGraphicControl.Destroy;
begin
  if Assigned(fbackground) then FreeAndNil(fbackground);
  inherited Destroy;
end;

procedure TOGraphicControl.paint;
begin
  inherited paint;
  if backgroundcolored = True then  // do have a component clientrect paint?
    Drawtorect(self.canvas, ClientRect, fbackground, Fkind);
end;


{ ToCustomcontrol }

constructor ToCustomcontrol.Create(Aowner: TComponent);
begin
  inherited Create(Aowner);
  parent := TWinControl(Aowner);
  ControlStyle := ControlStyle + [csAcceptsControls,
    csParentBackground, csClickEvents, csCaptureMouse, csDoubleClicks];
  self.Width := 250;
  self.Height := 150;
  background := Tocolor.Create(self);
  background.Startcolor := clActiveBorder;
  background.Stopcolor := clMenu;
  background.Border := 1;
  background.Bordercolor := clBlack;
  ParentBackground := True;
  Fkind := oHorizontal;
  backgroundcolored := True;
end;

destructor ToCustomcontrol.Destroy;
begin
  if Assigned(fbackground) then FreeAndNil(fbackground);
  inherited Destroy;
end;

procedure ToCustomcontrol.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  SetBkMode(Message.dc, TRANSPARENT);
  Message.Result := 1;
end;

procedure ToCustomcontrol.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  params.exstyle := params.exstyle or WS_EX_TRANSPARENT or {$IFNDEF UNIX} WS_EX_LAYERED or{$ENDIF}
    WS_CLIPCHILDREN;
end;

 {
procedure ToCustomcontrol.drawstateb(xx: Tobutonstate; out gg: integer; out ff,
  st, en, fn: Tcolor);
begin

end;
}
procedure ToCustomcontrol.Drawtorect(Cnv: Tcanvas; rc: Trect;
  tc: ToColor; Fkindi: Tokindstate);
var
  gradienrect1, gradienrect2: Trect;
begin
  Cnv.Brush.Color := tc.bordercolor;
  cnv.FillRect(rc);
  //Cnv.FrameRect(rc);// FillRect(rc);
  //border

 { rc:=Rect(rc.Left+tc.Border,rc.Top+tc.Border,rc.Right-tc.Border,rc.Bottom-tc.Border);
  Cnv.Brush.Color :=tc.Stopcolor;
  Cnv.FrameRect(rc);
  rc:=Rect(rc.Left+tc.Border,rc.Top+tc.Border,rc.Right-tc.Border,rc.Bottom-tc.Border);
  Cnv.Brush.Color := tc.bordercolor;
  Cnv.FrameRect(rc);}
  rc := Rect(rc.Left + tc.Border, rc.Top + tc.Border, rc.Right - tc.Border, rc.Bottom - tc.Border);

  if Fkindi = oHorizontal then
  begin
    gradienrect1 := Rect(rc.Left, rc.top, rc.Right, rc.Bottom div 2);
    gradienrect2 := Rect(rc.Left, rc.bottom div 2, rc.Right, rc.Bottom);
    Cnv.GradientFill(gradienrect1, tc.startcolor, tc.stopcolor, gdVertical);
    Cnv.GradientFill(gradienrect2, tc.stopcolor, tc.startcolor, gdVertical);
  end
  else
  begin
    gradienrect1 := Rect(rc.Left, rc.top, rc.Right div 2, rc.Bottom);
    gradienrect2 := Rect(rc.Right div 2, rc.top, rc.Right, rc.Bottom);
    Cnv.GradientFill(gradienrect1, tc.startcolor, tc.stopcolor, gdHorizontal);
    Cnv.GradientFill(gradienrect2, tc.stopcolor, tc.startcolor, gdHorizontal);
  end;

end;

function ToCustomcontrol.Getkind: Tokindstate;
begin
  Result := Fkind;
end;

procedure ToCustomcontrol.SetKind(AValue: Tokindstate);
var
  x: integer;
begin
  if Fkind = Avalue then exit;
  Fkind := Avalue;
  if ((csDesigning in ComponentState) and (not (csLoading in ComponentState))) then
  begin
    X := self.Width;
    self.Width := Height;
    self.Height := X;
  end;

end;



procedure ToCustomcontrol.paint;
begin
  inherited paint;
  if backgroundcolored = True then  // do have a component clientrect paint?
    Drawtorect(self.canvas, ClientRect, fbackground, Fkind);
end;




{ Topanel }

procedure Topanel.paint;
var
  textx, Texty: integer;
begin
  inherited paint;

  if Length(Caption) > 0 then
  begin
    self.Canvas.Font.Color := fbackground.fontcolor;
    textx := (Width div 2) - (self.canvas.TextWidth(Caption) div 2);
    Texty := (Height div 2) - (self.canvas.TextHeight(Caption) div 2);
    self.canvas.Brush.Style := bsClear;
    self.canvas.TextOut(Textx, Texty, (Caption));
  end;
end;




{ TOGraphicPanel }

procedure Tographicpanel.paint;
var
  textx, Texty: integer;
begin
  inherited paint;
  if Length(Caption) > 0 then
  begin
    self.Canvas.Font.Color := fbackground.fontcolor;
    textx := (Width div 2) - (self.canvas.TextWidth(Caption) div 2);
    Texty := (Height div 2) - (self.canvas.TextHeight(Caption) div 2);
    self.canvas.Brush.Style := bsClear;
    self.canvas.TextOut(Textx, Texty, (Caption));
  end;
end;

{ TOCustomTrackBar }


constructor TOTrackBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Parent := AOwner as TWinControl;
  Width := 180;
  Height := 20;
  FPosValue := 0;
  obleave := Tocolor.Create(self);
  with obleave do
  begin
    Startcolor := clActiveBorder;
    Stopcolor := clMenu;
    Border := 1;
    Bordercolor := clBlack;
    Fontcolor := clBlack;
  end;

  obenter := Tocolor.Create(self);
  with obenter do
  begin
    Startcolor := $00CDCDCD;
    Stopcolor := clMenu;
    Border := 1;
    Bordercolor := clBlack;
    Fontcolor := clBlue;
  end;
  obdown := Tocolor.Create(self);
  with obdown do
  begin
    Startcolor := clMenu;
    Stopcolor := $00A0A0A0;
    Border := 1;
    Bordercolor := clBlack;
    Fontcolor := clRed;
  end;

  fdisabled := Tocolor.Create(self);
  with fdisabled do
  begin
    Startcolor := clMenu;
    Stopcolor := $005D5D5D;
    Border := 1;
    Bordercolor := clBlack;
    Fontcolor := $002C2C2C;
  end;
  Fkind := oHorizontal;
  fcenterbuttonarea := Rect(1, 1, 19, 19);
  FIsPressed := False;
  FW := 0;
  FH := 0;
  FPosition := 0;
  FXY := 0;
  FPosValue := 0;
  FMin := 0;
  FMax := 100;
  backgroundcolored := True;

end;

destructor TOTrackBar.Destroy;
begin
  FreeAndNil(fdisabled);
  FreeAndNil(obleave);
  FreeAndNil(obenter);
  FreeAndNil(obdown);
  inherited Destroy;
end;

function TOTrackBar.CheckRange(const Value: integer): integer;
begin
  if FKind = oVertical then
    Result := PositionFromSlider(SliderFromPosition(
      ValueRange(Value, 0, (self.Height - fcenterbuttonarea.Height))))
  else
    Result := PositionFromSlider(SliderFromPosition(
      ValueRange(Value, 0, (self.Width - fcenterbuttonarea.Width))));
  FPosValue := SliderFromPosition(Result);
end;



// -----------------------------------------------------------------------------

function TOTrackBar.MaxMin: integer;
begin
  Result := FMax - FMin;
end;

// -----------------------------------------------------------------------------

function TOTrackBar.Getcolors(xx: Tobutonstate): Tocolor;
begin
  if Enabled = False then exit(fdisabled);// begin Result:=fdisabled; exit; end;
  case xx of
    obleaves: Result := obleave;
    obenters: Result := obenter;
    obdowns: Result := obdown;
  end;
end;

procedure TOTrackBar.Paint;
begin
  if csDesigning in ComponentState then
    Exit;
  inherited paint;
  centerbuttonareaset;
  Drawtorect(self.canvas, fcenterbuttonarea, Getcolors(fcbutons), Kind);
end;

// -----------------------------------------------------------------------------

function TOTrackBar.CalculatePosition(const Value: integer): integer;
begin

  if FKind = oHorizontal then
    Result := Value - Abs(FMin)
  else
    Result := Value;// FMax-Value; //for revers
end;

// -----------------------------------------------------------------------------

function TOTrackBar.GetPosition: integer;
begin
  Result := CalculatePosition(SliderFromPosition(FPosition));
end;


// -----------------------------------------------------------------------------

procedure TOTrackBar.SetPosition(Value: integer);
begin
  if FIsPressed then Exit;
  Value := ValueRange(Value, FMin, FMax);


  if FKind = oHorizontal then
  begin
    FPosition := PositionFromSlider(Value);
    FPosValue := Value - FMin;
  end
  else
  begin
    FPosition := PositionFromSlider(FMax - Value);
    FPosValue := Value; //FMax - Value;
  end;

  //  centerbuttonareaset;
  Changed;
  Invalidate;
end;

// -----------------------------------------------------------------------------

procedure TOTrackBar.SetMax(const Value: integer);
begin
  if Value <> FMax then FMax := Value;
end;

// -----------------------------------------------------------------------------

procedure TOTrackBar.SetMin(const Value: integer);
begin
  if Value <> FMin then FMin := Value;
end;

// -----------------------------------------------------------------------------

function TOTrackBar.GetPercentage: integer;
var
  Maxi, Pos, Z: integer;
begin
  Maxi := FMax + Abs(FMin);
  Pos := FPosValue + Abs(FMin);

  if FKind = oHorizontal then
    Z := 0
  else
    Z := 100;

  Result := Abs(Round(Z - (Pos / Maxi) * 100));
end;

// -----------------------------------------------------------------------------

procedure TOTrackBar.SetPercentage(Value: integer);
begin
  Value := ValueRange(Value, 0, 100);

  if FKind = oVertical then Value := Abs(FMax - Value);
  FPosValue := Round((Value * (FMax + Abs(FMin))) / 100);


  FPosition := PositionFromSlider(FPosValue);
  Changed;
  //invalidate;
end;

// -----------------------------------------------------------------------------

function TOTrackBar.SliderFromPosition(const Value: integer): integer;
begin

  if FKind = oVertical then
    Result := Round(Value / (self.Height - fcenterbuttonarea.Height) * MaxMin)
  else
    Result := Round(Value / (self.Width - fcenterbuttonarea.Width) * MaxMin);

end;

// -----------------------------------------------------------------------------

function TOTrackBar.PositionFromSlider(const Value: integer): integer;
begin
  if FKind = oHorizontal then
    Result := Round(((self.Width - fcenterbuttonarea.Width) / MaxMin) * Value)
  else
    Result := Round(((self.Height - fcenterbuttonarea.Height) / MaxMin) * Value);
end;


// -----------------------------------------------------------------------------

procedure TOTrackBar.centerbuttonareaset;
begin
  if FKind = oHorizontal then
  begin
    fcenterbuttonarea.Width := self.Height - (Background.Border * 2);
    fcenterbuttonarea.Height := self.Width - (Background.Border * 2);

    if fPosition <= 0 then
      fcenterbuttonarea := Rect(Background.Border * 2, Background.Border * 2,
        fcenterbuttonarea.Width + (Background.Border * 2), Height - (Background.Border * 2))
    else if fPosition >= (Width - fcenterbuttonarea.Width) then
      fcenterbuttonarea := Rect(Width - (fcenterbuttonarea.Width + (Background.Border * 2)),
        Background.Border * 2, Width - Background.Border, Height - (Background.Border * 2))
    else
      fcenterbuttonarea := Rect(FPosition, Background.Border * 2,
        FPosition + fcenterbuttonarea.Width, Height - (Background.Border * 2));
  end
  else
  begin
    fcenterbuttonarea.Height := self.Width - (Background.Border * 2);
    fcenterbuttonarea.Width := self.Height - (Background.Border * 2);


    if fPosition <= 0 then
      fcenterbuttonarea := Rect(Background.Border * 2, Background.Border * 2,
        Width - (Background.Border * 2), fcenterbuttonarea.Height - (Background.Border * 2))
    else if fPosition >= (Height - fcenterbuttonarea.Height) then
      fcenterbuttonarea := Rect(Background.Border * 2, Height -
        (fcenterbuttonarea.Height + (Background.Border * 2)), Width - (Background.Border * 2),
        Height - (Background.Border * 2))
    else
      fcenterbuttonarea := Rect(Background.Border * 2, FPosition, Width -
        (Background.Border * 2), FPosition + fcenterbuttonarea.Height);
    // Height-(Background.Border*2))
  end;

end;

// -----------------------------------------------------------------------------

procedure TOTrackBar.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if Button = mbLeft then
  begin
    FIsPressed := True;
    fcbutons := obdowns;
    if FKind = oHorizontal then
      FPosition := CheckRange(X)
    else
      FPosition := CheckRange(Y);

    Changed;
    invalidate;

  end;
end;

procedure TOTrackBar.MouseMove(Shift: TShiftState; X, Y: integer);
var
  MAXi: smallint;
begin
  inherited MouseMove(Shift, X, Y);
  if FIsPressed then
  begin
    if FKind = oHorizontal then
      MAXi := X
    else
      MAXi := Y;

    FPosition := CheckRange(MAXi);
    fcbutons := obdowns;
    Changed;
    Invalidate;
  end;
end;

// -----------------------------------------------------------------------------

procedure TOTrackBar.CMonmouseenter(var Messages: Tmessage);
begin
  if (not FIsPressed) and (Enabled) then
  begin
    fcbutons := obenters;
    Invalidate;
  end;
end;

procedure TOTrackBar.CMonmouseleave(var Messages: Tmessage);
begin
  if Enabled then
  begin
    if not FIsPressed then
    begin
      fcbutons := obleaves;
      Invalidate;
    end;
    inherited;
  end;
end;


procedure TOTrackBar.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  if FIsPressed then
  begin
    fcbutons := obenters;
    FIsPressed := False;
    Invalidate;
  end
  else
  begin
    if (Button = mbRight) and Assigned(PopupMenu) and not PopupMenu.AutoPopup then
    begin
      PopupMenu.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
    end;
    fcbutons := obleaves;
    Invalidate;
  end;
end;


procedure TOTrackBar.Changed;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;



// -----------------------------------------------------------------------------

constructor ToScrollBar.Create(Aowner: TComponent);
begin
  inherited Create(Aowner);
  Parent := AOwner as TWinControl;


  obleave := Tocolor.Create(self);
  with obleave do
  begin
    Startcolor := clActiveBorder;
    Stopcolor := clMenu;
    Border := 1;
    Bordercolor := clBlack;
    Fontcolor := clBlack;
  end;

  obenter := Tocolor.Create(self);
  with obenter do
  begin
    Startcolor := $00CDCDCD;
    Stopcolor := clMenu;
    Border := 1;
    Bordercolor := clBlack;
    Fontcolor := clBlue;
  end;
  obdown := Tocolor.Create(self);
  with obdown do
  begin
    Startcolor := clMenu;
    Stopcolor := $00A0A0A0;
    Border := 1;
    Bordercolor := clBlack;
    Fontcolor := clRed;
  end;

  fdisabled := Tocolor.Create(self);
  with fdisabled do
  begin
    Startcolor := clMenu;
    Stopcolor := $005D5D5D;
    Border := 1;
    Bordercolor := clBlack;
    Fontcolor := $002C2C2C;
  end;
  Flbuttonrect := Rect(1, 1, 20, 21);
  Frbuttonrect := Rect(179, 1, 199, 21);
  Ftrackarea := Rect(21, 1, 178, 21);
  Fkind := oHorizontal;
  fcbutons := obleaves;
  flbutons := obleaves;
  frbutons := obleaves;
  Width := 200;
  Height := 22;
  fmax := 100;
  fmin := 0;
  fposition := 0;
end;

destructor ToScrollBar.Destroy;
begin
  FreeAndNil(obenter);
  FreeAndNil(obleave);
  FreeAndNil(obdown);
  FreeAndNil(fdisabled);
  inherited Destroy;
end;

function ToScrollBar.Getcolors(xx: Tobutonstate): Tocolor;
begin
  if Enabled = False then exit(fdisabled);// begin Result:=fdisabled; exit; end;
  case xx of
    obleaves: Result := obleave;
    obenters: Result := obenter;
    obdowns: Result := obdown;
  end;
end;

procedure ToScrollBar.paint;
var
  Textx, Texty: integer;
begin
  if csDesigning in ComponentState then
    Exit;
  if not Visible then Exit;
  inherited paint;
  centerbuttonareaset;
  Drawtorect(self.canvas, flbuttonrect, Getcolors(flbutons), Kind);
  Drawtorect(self.canvas, frbuttonrect, Getcolors(frbutons), Kind);
  Drawtorect(self.canvas, fcenterbuttonarea, Getcolors(fcbutons), Kind);

  canvas.Font.Name:='arial';
  textx := (flbuttonrect.Width div 2) - (self.canvas.TextWidth('◄') div 2);
  Texty := (flbuttonrect.Height div 2) - (self.canvas.TextHeight('▲') div 2);

  self.canvas.Brush.Style := bsClear;
  if Kind = oHorizontal then
    self.canvas.TextOut(Textx, Texty, '◄')//'3')
  else
    self.canvas.TextOut(Textx, Texty, '▲');//'5');


  textx := (frbuttonrect.Right - frbuttonrect.Width div 2) -
    (self.canvas.TextWidth('◄') div 2);
  Texty := (frbuttonrect.bottom - frbuttonrect.Height div 2) -
    (self.canvas.TextHeight('▼') div 2);

  self.canvas.Brush.Style := bsClear;
  if Kind = oHorizontal then
    self.canvas.TextOut(Textx, Texty, '►')//'4')
  else
    self.canvas.TextOut(Textx, Texty, '▼');//▲ ▼ ► ◄ ‡ // ALT+30 ALT+31 ALT+16 ALT+17 ALT+0135



   textx := 2+ (fcenterbuttonarea.Right - fcenterbuttonarea.Width div 2) -
    (self.canvas.TextWidth('◄') div 2);
  Texty := (fcenterbuttonarea.bottom - fcenterbuttonarea.Height div 2) -
    (self.canvas.TextHeight('▼') div 2);
  // self.canvas.TextOut(Textx, Texty, '‡‡');


    self.canvas.Brush.Style := bsClear;
  if Kind = oHorizontal then
    self.canvas.TextOut(Textx, Texty, '=')//'4')
  else
    self.canvas.TextOut(Textx, Texty, '||');//▲ ▼ ► ◄ ‡ // ALT+30 ALT+31 ALT+16 ALT+17 ALT+0135


end;


procedure ToScrollBar.centerbuttonareaset;
var
  buttonh, borderwh: integer;
begin
  borderwh := Background.Border * 2; // border top, border bottom
  if FKind = oHorizontal then
  begin
    buttonh := self.Height - (borderwh);  // button Width and Height;
    Flbuttonrect := Rect(borderwh, borderwh, buttonh, buttonh);// left button
    Frbuttonrect := Rect(self.Width - (buttonh + borderwh), borderwh,
      self.Width - borderwh, buttonh); // right button
    Ftrackarea := Rect(flbuttonrect.Right, flbuttonrect.top,
      frbuttonrect.Left, frbuttonrect.Bottom);

    if fPosition <= 0 then
      fcenterbuttonarea := Rect(Flbuttonrect.Right,
        borderwh, Flbuttonrect.Right + buttonh + borderwh, self.Height - (borderwh))
    else if fPosition >= (Ftrackarea.Width) then //or position 100
      fcenterbuttonarea := Rect(Ftrackarea.Width - (buttonh + borderwh),
        borderwh, Ftrackarea.Width - borderwh, self.Height - borderwh)
    else
      fcenterbuttonarea := Rect(FPosition + buttonh, borderwh,
        FPosition + buttonh + buttonh, self.Height - borderwh);
    // fposition+leftbutton             // fposition+rightbutton  + centerbutton
  end
  else
  begin
    buttonh := self.Width - (borderwh);  // button Width and Height;
    Flbuttonrect := Rect(borderwh, borderwh, buttonh, buttonh);// top button
    Frbuttonrect := Rect(borderwh, self.Height -
      (buttonh + borderwh), self.Width - borderwh, self.Height - borderwh); // bottom button
    Ftrackarea := Rect(flbuttonrect.left, flbuttonrect.bottom,
      frbuttonrect.Right, frbuttonrect.top);


    if fPosition <= 0 then
      fcenterbuttonarea := Rect(borderwh, flbuttonrect.bottom + borderwh,
        self.Width - borderwh, flbuttonrect.bottom + buttonh + borderwh)
    else if fPosition >= (Ftrackarea.Height) then
      fcenterbuttonarea := Rect(borderwh, frbuttonrect.Top -
        (buttonh + borderwh), Width - borderwh, frbuttonrect.Top + borderwh)
    else
      fcenterbuttonarea := Rect(borderwh, FPosition + buttonh, Width -
        borderwh, FPosition + buttonh + buttonh);
    // fposition+topbutton             // fposition+bottombutton  + centerbutton
  end;

end;




function ToScrollBar.CheckRange(const Value: integer): integer;
begin
  if FKind = oVertical then
    Result := PositionFromSlider(SliderFromPosition(
      ValueRange(Value, 0, (Ftrackarea.Height - fcenterbuttonarea.Height))))
  else
    Result := PositionFromSlider(SliderFromPosition(
      ValueRange(Value, 0, (Ftrackarea.Width - fcenterbuttonarea.Width))));

  FPosValue := SliderFromPosition(Result);
end;


// -----------------------------------------------------------------------------

function ToScrollBar.MaxMin: integer;
begin
  Result := FMax - FMin;
end;

function ToScrollBar.CalculatePosition(const Value: integer): integer;
begin
  if FKind = oHorizontal then
    Result := Value - Abs(FMin)
  else
    Result := Value;//FMax-Value; //for revers
end;



// -----------------------------------------------------------------------------

function ToScrollBar.Getposition: integer;
begin
  Result :=FPosValue; //CalculatePosition(SliderFromPosition(FPosition));

end;

function ToScrollBar.Getmin: integer;
begin
  Result := fmin;
end;

function ToScrollBar.Getmax: integer;
begin
  Result := fmax;
end;


// -----------------------------------------------------------------------------






procedure ToScrollBar.SetPosition( Value: integer);
begin
  if FIsPressed then Exit;
  Value := ValueRange(Value, FMin, FMax);

  if FKind = oHorizontal then
  begin
    FPosition := PositionFromSlider(Value);
     FPosValue := Value - FMin;
    // WriteLn(fposition,'   ',FPosValue);
  end
  else
  begin
    FPosition := PositionFromSlider(value);// FMax - Val);
    FPosValue := Value; //FMax - Value;
  end;
  Changed;
  Invalidate;
end;

// -----------------------------------------------------------------------------

procedure ToScrollBar.SetMax(Val: integer);
begin
  if Val <> FMax then FMax := Val;
end;

// -----------------------------------------------------------------------------

procedure ToScrollBar.Setmin(Val: integer);
begin
  if Val <> FMin then FMin := Val;
end;



// -----------------------------------------------------------------------------

function ToScrollBar.GetPercentage: integer;
var
  Maxi, Pos, Z: integer;
begin
  Maxi := FMax + Abs(FMin);
  Pos := FPosValue + Abs(FMin);

  if FKind = oHorizontal then
    Z := 0
  else
    Z := 100;

  Result := Abs(Round(Z - (Pos / Maxi) * 100));
end;

// -----------------------------------------------------------------------------

procedure ToScrollBar.SetPercentage(Value: integer);
begin
  Value := ValueRange(Value, 0, 100);

  if FKind = oVertical then Value := Abs(FMax - Value);
  FPosValue := Round((Value * (FMax + Abs(FMin))) / 100);


  FPosition := PositionFromSlider(FPosValue);
  Changed;
 // Repaint;
end;


function ToScrollBar.SliderFromPosition(const Value: integer): integer;
var
  iHW: Integer;
begin
  iHW := 0;
  case FKind of
    oVertical   : iHW := Ftrackarea.Height - fcenterbuttonarea.Height;
    oHorizontal : iHW := Ftrackarea.Width - fcenterbuttonarea.Width;
  end;

  Result := Round(Value / iHW * MaxMin);

 {
begin

  if FKind = oVertical then
    Result := Round (Value / (Ftrackarea.Height - fcenterbuttonarea.Height) * MaxMin)
  else
    Result := round(Value / (Ftrackarea.Width - fcenterbuttonarea.Width) * MaxMin);
}
//WriteLn(Result, '   dssds'); //pozisyon  sliderden poziyona
end;

// -----------------------------------------------------------------------------

function ToScrollBar.PositionFromSlider(const Value: integer): integer;
var
  iHW: Integer;
begin
  iHW := 0;
  case FKind of
    oVertical   : iHW := Ftrackarea.Height - fcenterbuttonarea.Height;
    oHorizontal : iHW := Ftrackarea.Width - fcenterbuttonarea.Width;
  end;
  Result := Round((iHW / MaxMin) * Value);
{begin
 // WriteLn(round2(((Ftrackarea.Width - fcenterbuttonarea.Width) / MaxMin) * Value));

   if FKind = oHorizontal then
     Result := round(((Ftrackarea.Width - fcenterbuttonarea.Width) / MaxMin) * Value)
  else
    Result := round(((Ftrackarea.Height - fcenterbuttonarea.Height) / MaxMin) * Value);
  }
//     WriteLn(Result,'  ii'); // pozisyondan slider konumuna
 end;




procedure ToScrollBar.CMonmouseenter(var Messages: Tmessage);
var
  Cursorpos: TPoint;
begin
  if csDesigning in ComponentState then
    Exit;
  if not Enabled then
    Exit;
  if (fcbutons = obenters) and (flbutons = obenters) and (frbutons = obenters) then
    Exit;
  inherited MouseEnter;

  GetCursorPos(Cursorpos);
  Cursorpos := ScreenToClient(Cursorpos);


  if (PtInRect(flbuttonrect, Cursorpos)) then
  begin
    flbutons := obenters;
    frbutons := obleaves;
    fcbutons := obleaves;
  end
  else
  begin
    if (PtInRect(frbuttonrect, Cursorpos)) then
    begin
      flbutons := obleaves;
      frbutons := obenters;
      fcbutons := obleaves;
    end
    else
    begin
      if (PtInRect(fcenterbuttonarea, Cursorpos)) then
      begin
        flbutons := obleaves;
        frbutons := obleaves;
        fcbutons := obenters;
      end
      else
      begin
        flbutons := obleaves;
        frbutons := obleaves;
        fcbutons := obleaves;
      end;
    end;
  end;
  Invalidate;
end;



procedure ToScrollBar.CMonmouseleave(var Messages: Tmessage);
begin
  if csDesigning in ComponentState then
    Exit;
  if not Enabled then
    Exit;
  inherited MouseLeave;
  flbutons := obleaves;
  frbutons := obleaves;
  fcbutons := obleaves;
  Invalidate;
end;

procedure ToScrollBar.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X: integer; Y: integer);
var
  a:int64;
begin
  inherited MouseDown(Button, Shift, X, Y);
  if csDesigning in ComponentState then
    Exit;
  if not Enabled then
    Exit;

  if (Button = mbleft) and (PtInRect(flbuttonrect, point(X, Y))) then  // left button down
  begin
    position := position-1;
    flbutons := obdowns;
    frbutons := obleaves;
    fcbutons := obleaves;
    if Assigned(FOnChange) then FOnChange(Self);
  end
  else
  begin
    if (Button = mbleft) and (PtInRect(frbuttonrect, point(X, Y))) then   // right button down
    begin
      flbutons := obleaves;
      frbutons := obdowns;
      fcbutons := obleaves;
      Position := Position + 1;
      if Assigned(FOnChange) then FOnChange(Self);
    end
    else
    begin
      if (Button = mbleft) and (PtInRect(fcenterbuttonarea, point(X, Y))) then
        // right button down
      begin
        flbutons := obleaves;
        frbutons := obleaves;
        fcbutons := obdowns;
        fispressed := True;
        Invalidate;
      end
      else
      begin
        if (Button = mbleft) and (PtInRect(Ftrackarea, point(X, Y))) then
          // right button down
        begin
          flbutons := obleaves;
          frbutons := obleaves;
          fcbutons := obleaves;
          if Fkind = oHorizontal then
            FPosition :=
              CheckRange(x - (fcenterbuttonarea.Width + (fcenterbuttonarea.Width div 2)))
          else
            FPosition :=
              CheckRange(y - (fcenterbuttonarea.Height + (fcenterbuttonarea.Height div 2)));
           if Assigned(FOnChange) then FOnChange(Self);
             Invalidate;
        end
        else
        begin
          flbutons := obleaves;
          frbutons := obleaves;
          fcbutons := obleaves;
          FIsPressed := False;
          Invalidate;
        end;
      end;
    end;
  end;
 // paint;

end;

procedure ToScrollBar.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X: integer; Y: integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  FIsPressed := False;
  flbutons := obleaves;
  frbutons := obleaves;
  fcbutons := obleaves;
  Invalidate;
end;



procedure ToScrollBar.MouseMove(Shift: TShiftState; X, Y: integer);
begin
  inherited MouseMove(Shift, X, Y);
  if csDesigning in ComponentState then
    Exit;
  if (PtInRect(flbuttonrect, point(X, Y))) then
  begin
    fcbutons := obleaves;
    flbutons := obenters;
    frbutons := obleaves;
  end
  else
  begin
    if (PtInRect(frbuttonrect, point(X, Y))) then
    begin
      fcbutons := obleaves;
      flbutons := obleaves;
      frbutons := obenters;
    end
    else
    begin
      if (PtInRect(fcenterbuttonarea, point(X, Y))) then
      begin

        if fispressed then
        begin
          if Fkind = oHorizontal then
            FPosition :=
              CheckRange(x - (fcenterbuttonarea.Width + (fcenterbuttonarea.Width div 2)))
          else
            FPosition :=
              CheckRange(y - (fcenterbuttonarea.Height + (fcenterbuttonarea.Height div 2)));

         if Assigned(FOnChange) then FOnChange(Self);
        end;

        fcbutons := obenters;
        flbutons := obleaves;
        frbutons := obleaves;
      end
      else
      begin
        if fispressed then
        begin
          if Fkind = oHorizontal then
            FPosition :=
              CheckRange(x - (fcenterbuttonarea.Width + (fcenterbuttonarea.Width div 2)))
          else
            FPosition :=
              CheckRange(y - (fcenterbuttonarea.Height + (fcenterbuttonarea.Height div 2)));
         if Assigned(FOnChange) then FOnChange(Self);
        end;
        fcbutons := obleaves;
        flbutons := obleaves;
        frbutons := obleaves;
      end;
    end;
  end;
  Invalidate;
end;




{ Toncaret }

function Toncaret.Getblinktime: integer;
begin
  Result := fblinktime;
end;

procedure Toncaret.Setblinktime(const Value: integer);
begin
  if (Value <> fblinktime) and (Value > 10) then
  begin
    fblinktime := Value;
    blinktimer.Interval := fBlinktime;
  end;
end;

function Toncaret.Getvisible: boolean;
begin
  Result := fvisibled;
end;

procedure Toncaret.Setvisible(const Value: boolean);
begin
  if Value <> fvisibled then
    fvisibled := Value;

  blinktimer.Enabled := Value;

  if Value = False then
  begin
    caretvisible := False;
    paint;
  end;
end;


procedure Toncaret.ontimerblink(Sender: TObject);
begin
  caretvisible := not caretvisible;
  paint;
end;

function Toncaret.Paint: boolean;
begin
  //  if parent is Tocustomedit then
  //    Tocustomedit(parent).paint;

  if parent is Tocustomedit then
    Tocustomedit(parent).Invalidate;
  Result := True;
end;




constructor Toncaret.Create(aowner: TPersistent);
begin
  inherited Create;
  parent := Tocustomedit(aowner);
  // Self.owner:=Toedit;
  FHeight := 20;//Toedit(Self.owner).Height;
  FWidth := 2;
  fblinkcolor := clBlack; //- toedit(Self.owner).Background.Stopcolor;
  fblinktime := 600;
  blinktimer := TTimer.Create(nil);
  blinktimer.Interval := blinktime;
  blinktimer.OnTimer := @ontimerblink;
  blinktimer.Enabled := False;
  CaretPos.X := 0;
  CaretPos.Y := 0;
  caretvisible := False;

end;

destructor Toncaret.Destroy;
begin
  inherited Destroy;
  FreeAndNil(blinktimer);
end;


{ Tocustomedit }


{
function Tocustomedit.getpassword: char;
begin
  Result := fpassword;
end;

procedure Tocustomedit.setpassword(const Value: char);
begin
  if fpassword = Value then
    exit;

  fpassword := Value;
  case fpassword of
    #0: EchoMode := emNormal;
    ' ': EchoMode := emNone;
    else
      EchoMode := emPassword;
  end;
  paint;
end;
 }
function tocustomedit.getcharcase: tocharcase;
begin
  Result := FCharCase;
end;

function tocustomedit.getechomode: toechomode;
begin
  Result := fEchoMode;
end;

procedure tocustomedit.setechomode(const value: toechomode);
begin
  if fEchoMode = Value then
    exit;
  fEchoMode := Value;
  case fEchoMode of
    emNormal: PasswordChar := #0;
    emPassWord:
      if (PasswordChar = #0) or (PasswordChar = ' ') then
        PasswordChar := '*';
    emNone:
      PasswordChar := ' ';
  end;
  Invalidate;
end;

procedure tocustomedit.setcharcase(const value: tocharcase);
begin
  if FCharCase <> Value then
  begin
    FCharCase := Value;
    Invalidate;
  end;
end;

procedure tocustomedit.setlefttextmargin(avalue: integer);
begin
  if FLeftTextMargin = AValue then Exit;
  FLeftTextMargin := AValue;
  Invalidate;
end;

procedure tocustomedit.setlines(avalue: tstrings);
begin
  if FLines = AValue then Exit;
  FLines.Assign(AValue);
  DoChange();
  Invalidate;
end;

procedure tocustomedit.setmultiline(avalue: boolean);
begin
  if FMultiLine = AValue then Exit;
  FMultiLine := AValue;
  Invalidate;
end;

procedure tocustomedit.setnumberonly(const value: boolean);
begin
 if FNumbersOnly<>value then FNumbersOnly:=value;
end;

procedure tocustomedit.setreadonly(avalue: boolean);
begin
  if FReadOnly<>avalue then FReadOnly:=avalue;
end;

procedure tocustomedit.setrighttextmargin(avalue: integer);
begin
  if FRightTextMargin = AValue then Exit;
  FRightTextMargin := AValue;
  Invalidate;
end;

procedure tocustomedit.settext(avalue: string);
begin
  Lines.Text := aValue;
end;

procedure tocustomedit.setpasswordchar(avalue: char);
begin
  if AValue = FPasswordChar then Exit;
  FPasswordChar := AValue;
  Invalidate;
end;

 {
function Tocustomedit.GetControlId: TCDControlID;
begin
  Result := cidEdit;
end;

procedure Tocustomedit.CreateControlStateEx;
begin
  FEditState := TCDEditStateEx.Create;
  FStateEx := FEditState;
end;
}
procedure tocustomedit.realsettext(const value: tcaption);
begin
  inherited RealSetText(Value);
  Lines.Text := Value;
  Invalidate;
end;

procedure tocustomedit.dochange;
begin
  Changed;
  if Assigned(FOnChange) then FOnChange(Self);
end;

{
procedure Tocustomedit.HandleCaretTimer(Sender: TObject);
begin
  if FEventArrived then
  begin
    FEditState.CaretIsVisible := True;
    FEditState.EventArrived := False;
  end
  else FEditState.CaretIsVisible := not FEditState.CaretIsVisible;

  Invalidate;
end;    }

function tocustomedit.getlefttextmargin: integer;
begin
  Result := FLeftTextMargin;
end;

function tocustomedit.getcaretpos: tpoint;
begin
  Result := FCarets.CaretPos;//FEditState.CaretPos;
end;

function tocustomedit.getmultiline: boolean;
begin
  Result := FMultiLine;
end;

function tocustomedit.getreadonly: boolean;
begin
  Result:=FReadOnly;
end;

function tocustomedit.getnumberonly: boolean;
begin
 Result:= FNumbersOnly;
end;

function tocustomedit.getrighttextmargin: integer;
begin
  Result := FRightTextMargin;
end;

function tocustomedit.gettext: string;
begin
  if Multiline then
    Result := Lines.Text
  else if Lines.Count = 0 then
    Result := ''
  else
    Result := Lines[0];
end;

function tocustomedit.getpasswordchar: char;
begin
  Result := FPasswordChar;
end;

procedure tocustomedit.dodeleteselection;
var
  lSelLeftPos, lSelRightPos, lSelLength: integer;
  lControlText, lTextLeft, lTextRight: string;
begin
  if IsSomethingSelected then
  begin
    lSelLeftPos := FSelStart.X;
    if FSelLength < 0 then lSelLeftPos := lSelLeftPos + FSelLength;
    lSelRightPos := FSelStart.X;
    if FSelLength > 0 then lSelRightPos := lSelRightPos + FSelLength;
    lSelLength := FSelLength;
    if lSelLength < 0 then lSelLength := lSelLength * -1;
    lControlText := GetCurrentLine();

    // Text left of the selection
    lTextLeft := UTF8Copy(lControlText, FVisibleTextStart.X,
      lSelLeftPos - FVisibleTextStart.X + 1);

    // Text right of the selection
    lTextRight := UTF8Copy(lControlText, lSelLeftPos + lSelLength + 1, Length(lControlText));

    // Execute the deletion
    SetCurrentLine(lTextLeft + lTextRight);

    // Correct the caret position
    // FEditState.CaretPos.X
    FCarets.CaretPos.X := Length(lTextLeft);
  end;

  DoClearSelection;
end;

procedure tocustomedit.doclearselection;
begin
  FSelStart.X := 1;
  FSelStart.Y := 0;
  FSelLength := 0;
end;

// Imposes sanity limits to the visible text start
// and also imposes sanity limits on the caret
procedure tocustomedit.domanagevisibletextstart;
var
  lVisibleText, lLineText: string;
  lVisibleTextCharCount: integer;
  lAvailableWidth: integer;
begin
  // Moved to the left and we need to adjust the text start
  FVisibleTextStart.X := Min(FCarets.CaretPos.X{FEditState.CaretPos.X} + 1,
    FVisibleTextStart.X);

  // Moved to the right and we need to adjust the text start
  lLineText := GetCurrentLine();
  lVisibleText := UTF8Copy(lLineText, FVisibleTextStart.X, Length(lLineText));
  lAvailableWidth := Width - 3 -3;
  lVisibleTextCharCount := Canvas.TextFitInfo(lVisibleText, lAvailableWidth);
  FVisibleTextStart.X := Max(FCarets.CaretPos.X{FCaretPos.X} - lVisibleTextCharCount + 1,
    FVisibleTextStart.X);

  // Moved upwards and we need to adjust the text start
  FVisibleTextStart.Y := Min(FCarets.CaretPos.Y{FCaretPos.Y}, FVisibleTextStart.Y);

  // Moved downwards and we need to adjust the text start
  FVisibleTextStart.Y := Max(FCarets.CaretPos.Y{FCaretPos.Y} - FFullyVisibleLinesCount,
    FVisibleTextStart.Y);

  // Impose limits in the caret too
  //  FCaretPos.X
  FCarets.CaretPos.X := Min(FCarets.CaretPos.X{FCaretPos.X}, UTF8Length(lLineText));
  //  FCaretPos.Y
  FCarets.CaretPos.Y := Min(FCarets.CaretPos.Y{FCaretPos.Y}, FLines.Count - 1);
  //  FCaretPos.Y
  FCarets.CaretPos.Y := Max(FCarets.CaretPos.Y{FCaretPos.Y}, 0);
end;

procedure tocustomedit.setcaretpost(avalue: tpoint);
begin
  // FCaretPos.X
  FCarets.CaretPos.X := AValue.X;
  // FCaretPos.Y
  FCarets.CaretPos.Y := AValue.Y;
  Invalidate;
end;

function VisibleText(const aVisibleText: TCaption; const APasswordChar: char): TCaption;
begin
  if aPasswordChar = #0 then
    Result := aVisibleText
  else
    Result := StringOfChar(aPasswordChar, UTF8Length(aVisibleText));

end;
// Result.X -> returns a zero-based position of the caret
function tocustomedit.mousepostocaretpos(x, y: integer): tpoint;
var
  lStrLen, i: PtrInt;
  lVisibleStr, lCurChar: string;
  lPos, lCurCharLen: integer;
  lBestDiff: cardinal = $FFFFFFFF;
  lLastDiff: cardinal = $FFFFFFFF;
  lCurDiff, lBestMatch: integer;
begin
  // Find the best Y position
  lPos := Y - 3;//GetMeasures(TCDEDIT_TOP_TEXT_SPACING);
  if FLineHeight < 1 then FLineHeight := 1;
  // WriteLn('linehegit :',FLineHeight, lPos);
  Result.Y := lPos div FLineHeight;
  Result.Y := Min(Result.Y, FFullyVisibleLinesCount);
  Result.Y := Min(Result.Y, FLines.Count - 1);
  if Result.Y < 0 then
  begin
    Result.X := 1;
    Result.Y := 0;
    Exit;
  end;

  // Find the best X position
  Canvas.Font := Font;
  lVisibleStr := FLines.Strings[Result.Y];
  lVisibleStr := UTF8Copy(lVisibleStr, FVisibleTextStart.X, Length(lVisibleStr));
  lVisibleStr := VisibleText(lVisibleStr, FPasswordChar);
  lStrLen := UTF8Length(lVisibleStr);
  lPos := 3;//GetMeasures(TCDEDIT_LEFT_TEXT_SPACING);
  lBestMatch := 0;
  for i := 0 to lStrLen do
  begin
    lCurDiff := X - lPos;
    if lCurDiff < 0 then lCurDiff := lCurDiff * -1;

    if lCurDiff < lBestDiff then
    begin
      lBestDiff := lCurDiff;
      lBestMatch := i;
    end;

    // When the diff starts to grow we already found the caret pos, so exit
    if lCurDiff > lLastDiff then Break
    else
      lLastDiff := lCurDiff;

    if i <> lStrLen then
    begin
      lCurChar := UTF8Copy(lVisibleStr, i + 1, 1);
      lCurCharLen := Canvas.TextWidth(lCurChar);
      lPos := lPos + lCurCharLen;
    end;
  end;

  Result.X := lBestMatch + (FVisibleTextStart.X - 1);
  Result.X := Min(Result.X, FVisibleTextStart.X + lStrLen - 1);
end;

function tocustomedit.issomethingselected: boolean;
begin
  Result := FSelLength <> 0;
end;



procedure tocustomedit.doenter;
begin
  //  FCaretTimer.Enabled := True;
  FCarets.Visible := True;
  //FCaretIsVisible := True;
  inherited DoEnter;
end;

procedure tocustomedit.doexit;
begin
  //  FCaretTimer.Enabled := False;
  FCarets.Visible := False;
  // FCaretIsVisible := False;
  DoClearSelection();
  inherited DoExit;
end;

procedure tocustomedit.keydown(var key: word; shift: tshiftstate);
var
  lLeftText, lRightText, lOldText: string;
  lOldTextLength: PtrInt;
  lKeyWasProcessed: boolean = True;
begin
  inherited KeyDown(Key, Shift);


  lOldText := GetCurrentLine();
  lOldTextLength := UTF8Length(lOldText);
  FSelStart.Y := FCarets.CaretPos.Y;
  //FCaretPos.Y;//ToDo: Change this when proper multi-line selection is implemented

  case Key of
    // Backspace
    VK_BACK:
    begin
      // Selection backspace
      if IsSomethingSelected() then
        DoDeleteSelection()
      // Normal backspace
      else if FCarets.CaretPos.X > 0 then
      begin
        lLeftText := UTF8Copy(lOldText, 1, FCarets.CaretPos.X - 1);
        lRightText := UTF8Copy(lOldText, FCarets.CaretPos.X + 1,
          lOldTextLength);
        SetCurrentLine(lLeftText + lRightText);
        Dec(FCarets.CaretPos.X);
        DoManageVisibleTextStart();
        Invalidate;
      end;
    end;
    // DEL
    VK_DELETE:
    begin
      // Selection delete
      if IsSomethingSelected() then
        DoDeleteSelection()
      // Normal delete
      else if  FCarets.CaretPos.X < lOldTextLength then
      begin
        lLeftText := UTF8Copy(lOldText, 1, FCarets.CaretPos.X);
        lRightText := UTF8Copy(lOldText, FCarets.CaretPos.X+ 2,
          lOldTextLength);
        SetCurrentLine(lLeftText + lRightText);
        Invalidate;
      end;
    end;
    VK_LEFT:
    begin
      if (FCarets.CaretPos.X > 0) then
      begin
        // Selecting to the left
        if [ssShift] = Shift then
        begin
          if FSelLength = 0 then FSelStart.X := FCarets.CaretPos.X;
          Dec(FSelLength);
        end
        // Normal move to the left
        else
          FSelLength := 0;

        Dec(FCarets.CaretPos.X);
        DoManageVisibleTextStart();
        FCarets.Visible := True;
        Invalidate;
      end
      // if we are not moving, at least deselect
      else if ([ssShift] <> Shift) then
      begin
        FSelLength := 0;
        Invalidate;
      end;
    end;
    VK_HOME:
    begin
      if ( FCarets.CaretPos.X > 0) then
      begin
        // Selecting to the left
        if [ssShift] = Shift then
        begin
          if FSelLength = 0 then
          begin
            FSelStart.X := FCarets.CaretPos.X;
            FSelLength := -1 * FCarets.CaretPos.X;
          end
          else
            FSelLength := -1 * FSelStart.X;
        end
        // Normal move to the left
        else
          FSelLength := 0;


        FCarets.CaretPos.X := 0;
        DoManageVisibleTextStart();
        FCarets.Visible := True;
        Invalidate;
      end
      // if we are not moving, at least deselect
      else if (FSelLength <> 0) and ([ssShift] <> Shift) then
      begin
        FSelLength := 0;
        Invalidate;
      end;
    end;
    VK_RIGHT:
    begin
      if FCarets.CaretPos.X < lOldTextLength then
      begin
        // Selecting to the right
        if [ssShift] = Shift then
        begin
          if FSelLength = 0 then FSelStart.X := FCarets.CaretPos.X;
          Inc(FSelLength);
        end
        // Normal move to the right
        else
          FSelLength := 0;

        Inc(FCarets.CaretPos.X);
        DoManageVisibleTextStart();
        FCarets.Visible := True;
        Invalidate;
      end
      // if we are not moving, at least deselect
      else if ([ssShift] <> Shift) then
      begin
        FSelLength := 0;
        Invalidate;
      end;
    end;
    VK_END:
    begin
      if FCarets.CaretPos.X < lOldTextLength then
      begin
        // Selecting to the right
        if [ssShift] = Shift then
        begin
          if FSelLength = 0 then
            FSelStart.X := FCarets.CaretPos.X;
          FSelLength := lOldTextLength - FSelStart.X;
        end
        // Normal move to the right
        else
          FSelLength := 0;

         FCarets.CaretPos.X := lOldTextLength;
        DoManageVisibleTextStart();
        //  FCaretIsVisible := True;
        FCarets.Visible := True;
        Invalidate;
      end
      // if we are not moving, at least deselect
      else if (FSelLength <> 0) and ([ssShift] <> Shift) then
      begin
        FSelLength := 0;
        Invalidate;
      end;
    end;
    VK_UP:
    begin
      if (FCarets.CaretPos.Y > 0) then
      begin
        // Selecting downwards
      {if [ssShift] = Shift then
      begin
        if FSelLength = 0 then FSelStart.X := FCaretPos.X;
        Dec(FSelLength);
      end
      // Normal move downwards
      else} FSelLength := 0;

        Dec(FCarets.CaretPos.Y);
        DoManageVisibleTextStart();
        FCarets.Visible := True;
        Invalidate;
      end
      // if we are not moving, at least deselect
      else if ([ssShift] <> Shift) then
      begin
        FSelLength := 0;
        Invalidate;
      end;
    end;
    VK_DOWN:
    begin
      if FCarets.CaretPos.Y < FLines.Count - 1 then
      begin
      {// Selecting to the right
      if [ssShift] = Shift then
      begin
        if FSelLength = 0 then FSelStart.X := FCaretPos.X;
        Inc(FSelLength);
      end
      // Normal move to the right
      else} FSelLength := 0;

        Inc(FCarets.CaretPos.Y{FCaretPos.Y});
        DoManageVisibleTextStart();
        FCarets.Visible := True;
        Invalidate;
      end
      // if we are not moving, at least deselect
      else if ([ssShift] <> Shift) then
      begin
        FSelLength := 0;
        Invalidate;
      end;
    end;
    VK_RETURN:
    begin
      if not MultiLine then Exit;
      // Selection delete
      if IsSomethingSelected() then
        DoDeleteSelection();
      // If the are no contents at the moment, add two lines, because the first one always exists for the user
      if FLines.Count = 0 then
      begin
        FLines.Add('');
        FLines.Add('');
        // FCaretPos
        FCarets.CaretPos := Point(0, 1);
      end
      else
      begin
        // Get the two halves of the text separated by the cursor
        lLeftText := UTF8Copy(lOldText, 1, FCarets.CaretPos.X {FCaretPos.X});
        lRightText := UTF8Copy(lOldText, FCarets.CaretPos.X{FCaretPos.X} + 1,
          lOldTextLength);
        // Move the right part to a new line
        SetCurrentLine(lLeftText);
        FLines.Insert({FCaretPos.Y}FCarets.CaretPos.Y + 1, lRightText);
        // FCaretPos
        FCarets.CaretPos := Point(0, FCarets.CaretPos.Y{FCaretPos.Y} + 1);
      end;
      Invalidate;
    end;

    else
      lKeyWasProcessed := False;
  end; // case

  if lKeyWasProcessed then
  begin
    //    FEventArrived := True;
    Key := 0;
  end;
end;

procedure tocustomedit.keyup(var key: word; shift: tshiftstate);
begin
  inherited KeyUp(Key, Shift);

  // copy, paste, cut, etc
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_C:
      begin
      end;
    end;
  end;
end;

procedure tocustomedit.utf8keypress(var utf8key: tutf8char);
var
  lLeftText, lRightText, lOldText: string;
begin
  inherited UTF8KeyPress(UTF8Key);

  // ReadOnly disables key input
  if FReadOnly then Exit;

  // LCL-Carbon sends Backspace as a UTF-8 Char
  // LCL-Qt sends arrow left,right,up,down (#28..#31), <enter>, ESC, etc
  // Don't handle any non-char keys here because they are already handled in KeyDown
  if (UTF8Key[1] in [#0..#$1F, #$7F]) or ((UTF8Key[1] = #$c2) and
    (UTF8Key[2] in [#$80..#$9F])) then Exit;

  if (FNumbersOnly=true) and not ((UTF8Key[1] in [#30..#$39])  or (UTF8Key[1]=#$2e) or (UTF8Key[1]=#$2c)) then exit;
  // (UTF8Key[1] in [#30..#$39, #$2e, #$2c])  then Exit;



  DoDeleteSelection;                          //▲ ▼ ► ◄ ‡ // ALT+30 ALT+31 ALT+16 ALT+17 ALT+0135

  // Normal characters
  lOldText := GetCurrentLine();
  lLeftText := UTF8Copy(lOldText, 1, FCarets.CaretPos.X {FCaretPos.X});
  lRightText := UTF8Copy(lOldText, FCarets.CaretPos.X {FCaretPos.X} + 1,
    UTF8Length(lOldText));
  SetCurrentLine(lLeftText + UTF8Key + lRightText);
  Inc(FCarets.CaretPos.X{FCaretPos.X});
  DoManageVisibleTextStart();
  FCarets.Visible := True;
  Invalidate;
end;

procedure tocustomedit.mousedown(button: tmousebutton; shift: tshiftstate; x,
  y: integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  DragDropStarted := True;

  // Caret positioning
  // FCaretPos
  FCarets.CaretPos := MousePosToCaretPos(X, Y);
  FSelLength := 0;
  FSelStart.X := FCarets.CaretPos.X;
  FSelStart.Y := FCarets.CaretPos.Y;
  FCarets.Visible := True;
  FCarets.caretvisible:=true;

  SetFocus;

  Invalidate;
end;

procedure tocustomedit.mousemove(shift: tshiftstate; x, y: integer);
begin
  inherited MouseMove(Shift, X, Y);

  // Mouse dragging selection
  if DragDropStarted then
  begin
    // FEditState.CaretPos
    FCarets.CaretPos := MousePosToCaretPos(X, Y);
    FSelLength := FCarets.CaretPos.X{FCaretPos.X} - FSelStart.X;
    //    FEventArrived := True;
    //  FCaretIsVisible := True;
    FCarets.Visible := True;
    Invalidate;
  end;
end;

procedure tocustomedit.mouseup(button: tmousebutton; shift: tshiftstate; x,
  y: integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  DragDropStarted := False;
end;

procedure tocustomedit.mouseenter;
begin
  inherited MouseEnter;
end;

procedure tocustomedit.mouseleave;
begin
  inherited MouseLeave;
end;

procedure tocustomedit.wmsetfocus(var message: tlmsetfocus);
begin
 DoEnter;
end;

procedure tocustomedit.wmkillfocus(var message: tlmkillfocus);
begin
  DoExit;
end;

constructor tocustomedit.create(aowner: tcomponent);
begin
  inherited Create(AOwner);
  parent := TWinControl(Aowner);
  Width := 80;
  Height := 25;
  TabStop := True;
  Cursor  := crIBeam;
  ControlStyle := ControlStyle - [csAcceptsControls] +
    [csParentBackground, csClickEvents, csCaptureMouse, csDoubleClicks,
    csRequiresKeyboardInput];
{  fbackground := Tocolor.Create(self);
  with fbackground do
  begin
    Border := 1;
    Startcolor := clActiveBorder;
    Stopcolor := clMenu;
  end;
 }
  FLines := TStringList.Create;
  FVisibleTextStart := Point(1, 0);

  FPasswordChar := #0;
  FCarets := Toncaret.Create(self);

end;

destructor tocustomedit.destroy;
begin
  FreeAndNil(fbackground);

  FreeAndNil(FLines);
  inherited Destroy;
  //FCaretTimer.Free; Don't free here because it is assigned with a owner
end;

function tocustomedit.getcurrentline: string;
begin
  if (FLines.Count = 0) or (FCarets.CaretPos.Y{FCaretPos.Y} >= FLines.Count) then
    Result := ''
  else
    Result := FLines.Strings[FCarets.CaretPos.Y{FCaretPos.Y}];
end;

procedure tocustomedit.setcurrentline(astr: string);
begin
  if (FLines.Count = 0) or (FCarets.CaretPos.Y{FCaretPos.Y} >= FLines.Count) then
  begin
    FLines.Text := AStr;
    FVisibleTextStart.X := 1;
    FVisibleTextStart.Y := 0;
    FCarets.CaretPos.X := 0;
    FCarets.CaretPos.Y := 0;
    // FCaretPos.X := 0;
    // FCaretPos.Y := 0;
  end
  else
    FLines.Strings[{FCaretPos.Y}FCarets.CaretPos.Y] := AStr;
  DoChange();
end;

function tocustomedit.getselstartx: integer;
begin
  Result := FSelStart.X;
end;

function tocustomedit.getsellength: integer;
begin
  Result := FSelLength;
  if Result < 0 then Result := Result * -1;
end;

procedure tocustomedit.setselstartx(anewx: integer);
begin
  FSelStart.X := ANewX;
end;

procedure tocustomedit.setsellength(anewlength: integer);
begin
  FSelLength := ANewLength;
end;

function tocustomedit.caretttopos(leftch: integer): integer;
var
  a, i: integer;
begin
  a := 0;
  for i := leftch to Lines.Text.Length do
  begin
    a := a + Canvas.TextExtent(Lines.Text[i]).cx;
    if i >= fcarets.CaretPos.X then
      break;
  end;
end;

procedure tocustomedit.paint;
var
//  gradienrect1, gradienrect2, Selrect,
  caretrect: Trect;
//  textx, Texty, i, a: integer;
  lControlText, lTmpText: string;
  lCaretPixelPos: integer;
  lTextBottomSpacing, lTextTopSpacing, lCaptionHeight, lLineHeight, lLineTop: integer;
  lSize: TSize;
begin
  inherited paint;


  //  textx := (self.Width div 2) - (self.canvas.TextWidth(Lines.Text) div 2);
  //  Texty := (self.Height div 2) - (self.canvas.TextHeight(Lines.Text) div 2);
  //  fborderWidth := fbackground.Border;


  lCaptionHeight := self.canvas.TextHeight(self.Text);//GetMeasures(TCDEDIT_CAPTION_HEIGHT);
  lTextBottomSpacing := 3;//GetMeasures(TCDEDIT_BOTTOM_TEXT_SPACING);
  lTextTopSpacing := 3;//GetMeasures(TCDEDIT_TOP_TEXT_SPACING);
  lLineHeight := self.canvas.TextHeight('ŹÇ');
  lSize := Size(self.Width, self.Height);
  lLineHeight := Min(lSize.cy - lTextBottomSpacing, lLineHeight);
  lLineTop := lTextTopSpacing + Fcarets.CaretPos.Y * lLineHeight;




  //  gradienrect1 := Rect(fborderWidth, fborderWidth, self.Width - fborderWidth, (self.Height div 2));
  //  gradienrect2 := Rect(fborderWidth, (self.Height div 2), self.Width - fborderWidth, self.Height - fborderWidth);


  if Lines.Count = 0 then lControlText := ''
  else
    lControlText := Lines.Strings[Fcarets.CaretPos.Y];

  lTmpText := UTF8Copy(lControlText, fVisibleTextStart.X,
    Fcarets.CaretPos.X - fVisibleTextStart.X + 1);
  lTmpText := VisibleText(lTmpText, fPasswordChar);
  lCaretPixelPos := self.canvas.TextWidth(lTmpText) +3+ fLeftTextMargin;

  caretrect := Rect(lCaretPixelPos, lLineTop, lCaretPixelPos +
    FCarets.Width, lLineTop + lCaptionHeight);


 { with canvas do
  begin
    Brush.Color := fbackground.Bordercolor;
    FillRect(ClipRect);

    GradientFill(gradienrect1, fbackground.Startcolor, fbackground.Stopcolor,
      gdVertical);
    GradientFill(gradienrect2, fbackground.Stopcolor, fbackground.Startcolor,
      gdVertical);
  end;
  }
  Drawtorect(self.Canvas, ClientRect, Background, Kind);
  DrawText;


  if Fcarets.Caretvisible then
  begin
    canvas.Brush.Color := FCarets.Color;
    canvas.FillRect(caretrect);
  end;


  //    Brush.Color := selectcolor;//clActiveCaption;

  //  if fselected then
  //   if SelEnd>0 then
  //      FillRect(Selrect);

  //  Brush.Style := bsClear;
  //  TextOut(fborderWidth, Texty, Lines.Text);

  //   if FCarets.Caretvisible then
  //  begin
  //     DrawCaret;
  //   Brush.Color := FCarets.Color;
  //    FillRect(caretrect);
  //  end;
  // end;

end;

procedure tocustomedit.drawcaret;
//(ADest: TCanvas; ADestPos: TPoint; ASize: TSize; AState: TCDControlState; AStateEx: TCDEditStateEx);
var
  lTextTopSpacing, lCaptionHeight, lLineHeight, lLineTop: integer;
  lControlText, lTmpText: string;
  lTextBottomSpacing, lCaretPixelPos: integer;
  lSize: TSize;
  textx, Texty: integer;
begin

{



  if Lines.Count = 0 then lControlText := ''
  else lControlText := Lines.Strings[Fcarets.CaretPos.Y];
//  lCaptionHeight := GetMeasures(TCDEDIT_CAPTION_HEIGHT);
//  lTextBottomSpacing := GetMeasures(TCDEDIT_BOTTOM_TEXT_SPACING);
//  lTextTopSpacing := GetMeasures(TCDEDIT_TOP_TEXT_SPACING);
///  lLineHeight := self.canvas.TextHeight(cddTestStr)+2;
//  lSize := Size(self.Width, self.Height);
//  lLineHeight := Min(lSize.cy-lTextBottomSpacing, lLineHeight);
//  lLineTop := lTextTopSpacing + Fcarets.CaretPos.Y * lLineHeight;

  lTmpText := UTF8Copy(lControlText, fVisibleTextStart.X, Fcarets.CaretPos.X-fVisibleTextStart.X+1);
  lTmpText :=  VisibleText(lTmpText, fPasswordChar);
  lCaretPixelPos := self.canvas.TextWidth(lTmpText) //+ GetMeasures(TCDEDIT_LEFT_TEXT_SPACING)
    + fLeftTextMargin;

  textx := (self.Width div 2) - (self.canvas.TextWidth(Lines.Text) div 2);
  Texty := (self.Height div 2) - (self.canvas.TextHeight(Lines.Text) div 2);
  fborderWidth := fbackground.Border;

  self.canvas.Brush.Style := bsClear;
  //self.canvas.Pen.Color := clBlack;
  self.Canvas.TextOut(fborderWidth, Texty, lTmpText);

 if not Fcarets.Caretvisible then Exit;
  self.canvas.Pen.Color := clBlack;
  self.canvas.Pen.Style := psSolid;
  self.canvas.Line(lCaretPixelPos, fbackground.Border, lCaretPixelPos, self.Height-fbackground.Border);//lLineTop+lCaptionHeight);

  WriteLn(fVisibleTextStart.X,'   ',lCaretPixelPos,'   ',FCarets.CaretPos.X,'    ',FCarets.CaretPos.Y);
}
end;




procedure tocustomedit.drawtext;
//  ASize: TSize; AState: TCDControlState; AStateEx: TCDEditStateEx);
var
  lVisibleText, lControlText: TCaption;
  lSelLeftPos, lSelLeftPixelPos, lSelLength, lSelRightPos: integer;
  lTextWidth, lLineHeight, lLineTop: integer;
  lControlTextLen: PtrInt;
  lTextLeftSpacing, lTextTopSpacing, lTextBottomSpacing: integer;
  lTextColor: TColor;
  i, lVisibleLinesCount: integer;

  ASize: TSize;
begin
  // Background
  //DrawEditBackground(ADest, Point(0, 0), ASize, AState, AStateEx);
  // ADest:=self.Canvas;
  lTextColor := self.Font.Color;
  ASize := Size(self.Width, Self.Height);

  //  self.Canvas.Brush.Style := bsClear;
  self.Canvas.Font.Assign(self.Font);
  //  self.Canvas.Font.Color := lTextColor;
  lTextLeftSpacing := 3;//GetMeasures(TCDEDIT_LEFT_TEXT_SPACING);
  //lTextRightSpacing := GetMeasures(TCDEDIT_RIGHT_TEXT_SPACING);
  lTextTopSpacing := 3;//GetMeasures(TCDEDIT_TOP_TEXT_SPACING);
  lTextBottomSpacing := 3;//GetMeasures(TCDEDIT_BOTTOM_TEXT_SPACING);

  lLineHeight := self.Canvas.TextHeight('ŹÇ') + 2;
  lLineHeight := Min(ASize.cy - lTextBottomSpacing, lLineHeight);

  // Fill this to be used in other parts
  fLineHeight := lLineHeight;
  fFullyVisibleLinesCount := ASize.cy - lTextTopSpacing - lTextBottomSpacing;
  fFullyVisibleLinesCount := fFullyVisibleLinesCount div lLineHeight;
  fFullyVisibleLinesCount := Min(fFullyVisibleLinesCount, Lines.Count);

  // Calculate how many lines to draw
  if Multiline then
    lVisibleLinesCount := fFullyVisibleLinesCount + 1
  else
    lVisibleLinesCount := 1;

  lVisibleLinesCount := Min(lVisibleLinesCount, Lines.Count);

  // Now draw each line
  for i := 0 to lVisibleLinesCount - 1 do
  begin
    lControlText := Lines.Strings[fVisibleTextStart.Y + i];
    lControlText := VisibleText(lControlText, fPasswordChar);
    lControlTextLen := UTF8Length(lControlText);
    lLineTop := lTextTopSpacing + i * lLineHeight;

    // The text
    // self.Canvas.Pen.Style := psClear;
    self.Canvas.Brush.Style := bsClear;
    // ToDo: Implement multi-line selection
    if (fSelLength = 0) or (fSelStart.Y <> fVisibleTextStart.Y + i) then
    begin
      lVisibleText := UTF8Copy(lControlText, fVisibleTextStart.X, lControlTextLen);
      self.Canvas.TextOut(lTextLeftSpacing, lLineTop, lVisibleText);
    end
    // Text and Selection
    else
    begin
      lSelLeftPos := fSelStart.X;
      if fSelLength < 0 then lSelLeftPos := lSelLeftPos + fSelLength;

      lSelRightPos := fSelStart.X;
      if fSelLength > 0 then lSelRightPos := lSelRightPos + fSelLength;

      lSelLength := fSelLength;
      if lSelLength < 0 then lSelLength := lSelLength * -1;

      // Text left of the selection
      lVisibleText := UTF8Copy(lControlText, fVisibleTextStart.X,
        lSelLeftPos - fVisibleTextStart.X + 1);
      self.Canvas.TextOut(lTextLeftSpacing, lLineTop, lVisibleText);
      lSelLeftPixelPos := self.Canvas.TextWidth(lVisibleText) + lTextLeftSpacing;

      // The selection background
      lVisibleText := UTF8Copy(lControlText, lSelLeftPos + 1, lSelLength);
      lTextWidth := self.Canvas.TextWidth(lVisibleText);
      self.Canvas.Brush.Color := clblue; //fselectolor; //WIN2000_SELECTION_BACKGROUND;
      self.Canvas.Brush.Style := bsSolid;
      self.Canvas.Rectangle(Bounds(lSelLeftPixelPos, lLineTop, lTextWidth, lLineHeight));
      self.Canvas.Brush.Style := bsClear;

      // The selection text
      self.Canvas.Font.Color := clWhite;
      self.Canvas.TextOut(lSelLeftPixelPos, lLineTop, lVisibleText);
      lSelLeftPixelPos := lSelLeftPixelPos + lTextWidth;

      // Text right of the selection
      //  self.Canvas.Brush.Color := clWhite;
      self.Canvas.Brush.Style := bsClear;
      self.Canvas.Font.Color := lTextColor;
      lVisibleText := UTF8Copy(lControlText, lSelLeftPos + lSelLength + 1, lControlTextLen);
      self.Canvas.TextOut(lSelLeftPixelPos, lLineTop, lVisibleText);

    end;

  end;

  // And the caret
  // DrawCaret(ADest, Point(0, 0), ASize, AState, AStateEx);

  // In the end the frame, because it must be on top of everything
  //  DrawEditFrame(ADest, Point(0, 0), ASize, AState, AStateEx);
end;


{ Tomemo }

constructor Tomemo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MultiLine:=true;
end;

{ TOProgressBar }
constructor TOProgressBar.Create(Aowner: TComponent);
begin
  inherited Create(Aowner);
  parent := TWinControl(Aowner);
  ControlStyle := ControlStyle - [csAcceptsControls] +
    [csClickEvents, csCaptureMouse, csDoubleClicks, csSetCaption];
  Fkind := oHorizontal;
  self.Width := 150;
  self.Height := 10;
  fmin := 0;
  fmax := 100;
  fposition := 10;

  fbar := Tocolor.Create(self);
  fbar.Startcolor := clWhite;
  fbar.Stopcolor := $00FF9E28;
  fbar.Bordercolor := $008E4F00;
  fbar.Border := 2;
  FCaptonvisible := True;
end;

destructor TOProgressBar.Destroy;
begin
  FreeAndNil(fbar);
  inherited Destroy;
end;

procedure TOProgressBar.setposition(const Val: Int64);
begin
  fposition := ValueRange(Val, fmin, fmax);
  ftext := IntToStr(fposition);
  if Assigned(FOnChange) then FOnChange(Self);
  Invalidate;
end;

procedure TOProgressBar.setmax(const Val: Int64);
begin
  if fmax <> val then
  begin
    fmax := Val;
  end;
end;

procedure TOProgressBar.setmin(const Val: Int64);
begin
  if fmin <> val then
  begin
    fmin := Val;
  end;
end;

function TOProgressBar.Getposition: Int64;
begin
  Result := fposition;
end;

function TOProgressBar.Getmin: Int64;
begin
  Result := fmin;
end;

function TOProgressBar.Getmax: Int64;
begin
  Result := fmax;
end;


procedure TOProgressBar.paint;
var
  barborderrect: Trect;
  textx, Texty, fborderWidth: integer;
begin
  inherited paint;
  fborderWidth := fbar.Border;
  barborderrect := self.ClientRect;
  if Fkind = oHorizontal then
    barborderrect := Rect(barborderrect.Left + fborderWidth,
      barborderrect.Top + fborderWidth, (fposition * self.Width) div fmax,
      barborderrect.bottom - fborderWidth)
  else
    barborderrect := Rect(barborderrect.Left + fborderWidth,
      barborderrect.Top + fborderWidth, barborderrect.Right - fborderWidth,
      (fposition * self.Height) div fmax);

  Drawtorect(self.Canvas, barborderrect, fbar, self.Fkind);

  if FCaptonvisible = True then
  begin
    Canvas.Font.Color := Background.Fontcolor;
    // if Fkind=oVertical then
    // canvas.Font.Orientation:=-900;
    textx := (self.Width div 2) - (self.canvas.TextWidth(ftext) div 2);
    Texty := (self.Height div 2) - (self.canvas.TextHeight(Ftext) div 2);
    self.canvas.Brush.Style := bsClear;
    self.canvas.TextOut(Textx, Texty, ftext);
  end;

end;




{ ToCustomcheckbox }

function Tocheckbox.GetChecWidth: integer;
begin
  Result := fcheckwidth;
end;

procedure Tocheckbox.SetChecWidth(AValue: integer);
begin
  if fcheckwidth = AValue then exit;
  fcheckwidth := AValue;
  paint;
end;


function Tocheckbox.GetCaptionmod: Tcapdirection;
begin
  Result := fcaptiondirection;
end;

procedure Tocheckbox.SetCaptionmod(const val: Tcapdirection);
begin
  if fcaptiondirection = val then
    exit;
  fcaptiondirection := val;
  //  paint;
  Invalidate;
end;


procedure Tocheckbox.CMonmouseenter(var Messages: Tmessage);
begin
  fstate := obenters;
  Invalidate;
end;

procedure Tocheckbox.CMonmouseleave(var Messages: Tmessage);
begin
  fstate := obleaves;

  //  paint;
  Invalidate;
end;

procedure Tocheckbox.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X: integer; Y: integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if Button = mbLeft then
  begin
    fchecked := not fchecked;
    State := obdowns;
    if Assigned(FOnChange) then FOnChange(Self);

    Invalidate;
  end;
end;

procedure Tocheckbox.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X: integer; Y: integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  state := obenters;

  Invalidate;
end;

procedure Tocheckbox.SetChecked(const Value: boolean);
begin
  if FChecked <> Value then
  begin
    FChecked := Value;
    //   paint;
    Invalidate;
  end;
end;

function Tocheckbox.GetChecked: boolean;
begin
  Result := fchecked;
end;

{
procedure ToCustomcheckbox.SetCaption(const Value: string);
begin
  if Ftext <> Value then
  begin
    Ftext := Value;
 //   paint;
    Invalidate;
  end;
end;

function ToCustomcheckbox.GetCaption: string;
begin
  Result := Ftext;
end;
}
procedure Tocheckbox.SetState(const Value: Tobutonstate);
begin
  if fstate <> Value then
  begin
    fstate := Value;

    if (self is Toradiobutton) then
      deaktifdigerleri;

    //  paint;
    //  Invalidate;
  end;
end;

function Tocheckbox.GetState: Tobutonstate;
begin
  Result := fstate;
end;

procedure Tocheckbox.deaktifdigerleri;
var
  i: integer;
  Sibling: TControl;
begin

  if self.Parent <> nil then
    with self.Parent do
    begin
      for i := 0 to ControlCount - 1 do
      begin
        Sibling := Controls[i];
        if (Controls[i] is ToRadiobutton) and (Sibling <> Self) then
        begin
          ToRadiobutton(Sibling).SetChecked(False);// Checked := False;
          ToRadiobutton(Sibling).fstate := obleaves;// Checked := False;
          Invalidate;
        end;
      end;


    {

      for i := 0 to ControlCount - 1 do
        if (Controls[i] <> Self) and (Controls[i] is ToRadiobutton) and
          ((Controls[i] as ToRadiobutton).FGroupIndex =
          (Self as ToRadiobutton).FGroupIndex) then
          ToRadiobutton(Controls[i]).SetChecked(False);
      }
    end;
end;

procedure Tocheckbox.CMHittest(var msg: TCMHIttest);
begin
  inherited;
  //  if csDesigning in ComponentState then
  //    Exit;
  if PtInRegion(CreateRectRgn(0, 0, self.Width, self.Height), msg.XPos, msg.YPos) then
    msg.Result := HTCLIENT
  else
    msg.Result := HTNOWHERE;

end;

constructor Tocheckbox.Create(Aowner: TComponent);
begin
  inherited Create(Aowner);
  parent := TWinControl(Aowner);
  ControlStyle := ControlStyle + [csParentBackground, csClickEvents,
    csCaptureMouse, csDoubleClicks, csSetCaption];
  Width := 100;
  Height := 20;
  fcheckwidth := 20;
  fchecked := False;
  //fCaptionDirection:=cleft;
  obenter := Tocolor.Create(self);
  with obenter do
  begin
    border := 1;
    bordercolor := clblack;
    startcolor := $00CDCDCD;
    stopcolor := clmenu;
    Fontcolor := clBlue;
  end;

  obleave := Tocolor.Create(self);
  with obleave do
  begin
    border := 1;
    bordercolor := $006E6E6E;
    startcolor := clActiveBorder;
    stopcolor := clmenu;
    Fontcolor := clblack;
  end;

  obdown := Tocolor.Create(self);
  with obdown do
  begin
    border := 1;
    bordercolor := clblack;
    startcolor := clmenu;
    stopcolor := $00A0A0A0;
    Fontcolor := clRed;
  end;

  obcheckenters := Tocolor.Create(self);
  with obcheckenters do
  begin
    border := 1;
    bordercolor := clblack;
    startcolor := clBlack;
    stopcolor := clBlack;
    Fontcolor := clBlue;
  end;

  obcheckleaves := Tocolor.Create(self);
  with obcheckleaves do
  begin
    border := 1;
    bordercolor := clblack;
    startcolor := clBlack;
    stopcolor := clBlack;
    Fontcolor := clblack;
  end;

  obdisabled := Tocolor.Create(self);
  with obdisabled do
  begin
    border := 1;
    bordercolor := clblack;
    startcolor := clmenu;
    stopcolor := $005D5D5D;
    Fontcolor := $002C2C2C;
  end;

{  if (self is Toradiobutton) then
    Ftext := 'Radiobutton'
  else
    Ftext := 'Checkbox';
 }

  fstate := obleaves;
  fcaptiondirection := ocright; //cleft;
  backgroundcolored := False;
  // Transparent := True;
end;

destructor Tocheckbox.Destroy;
begin
  FreeAndNil(obenter);
  FreeAndNil(obleave);
  FreeAndNil(obdown);
  FreeAndNil(obcheckenters);
  FreeAndNil(obcheckleaves);

  inherited Destroy;
end;

procedure DrawEllipticRegion(wnd: HWND; rect: TRect);
var
  rgn: HRGN;
begin
  rgn := CreateEllipticRgn(rect.left, rect.top, rect.right, rect.bottom);
  SetWindowRgn(wnd, rgn, True);
end;

procedure Tocheckbox.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  SetBkMode(Message.dc, 1);
  Message.Result := 1;
end;

procedure Tocheckbox.CreateParams(var Params: TCreateParams);
begin
  inherited;// CreateParams(Params);
  params.exstyle := params.exstyle or WS_EX_TRANSPARENT or
   {$IFNDEF UNIX}WS_EX_LAYERED or{$ENDIF}
    WS_CLIPCHILDREN;
  //  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_LAYERED)
end;

procedure Tocheckbox.paint;
var
  gradienrect1, gradienrect2, checkrect, Radiorect, Textrectt, borderect: Types.Trect;
  textx, Texty, fborderWidth, fborderWidthT: integer;
  obstart, obend, checkendstart, checkedend, oborder: Tcolor;
  //Com:TComponent;
  //Brush: ibrus IGradientBrush;
  fbuttoncenter: integer;
  Tc:Tocolor;
begin
  inherited paint;

  // com:=self;

  if Enabled = False then
  begin
    obstart := obdisabled.Startcolor;
    obend := obdisabled.Stopcolor;
    oborder := obdisabled.Bordercolor;
    fborderWidth := obdisabled.Border;
    canvas.Font.Color := obdisabled.Fontcolor;
    if Checked = True then
    begin
      checkendstart := obcheckenters.Startcolor;
      checkedend := obcheckenters.Stopcolor;
    end;
  end
  else
  begin
    if Checked = True then
    begin

      case fstate of
        obenters:
        begin
          obstart := obenter.Startcolor;
          obend := obenter.Stopcolor;
          checkendstart := obcheckenters.Startcolor;
          checkedend := obcheckenters.Stopcolor;
          oborder := obenter.Bordercolor;
          fborderWidth := obenter.Border;
          canvas.Font.Color := obcheckenters.Fontcolor;
        end;
        obleaves:
        begin
          obstart := obleave.Startcolor;
          obend := obleave.Stopcolor;
          checkendstart := obcheckleaves.Startcolor;
          checkedend := obcheckleaves.Stopcolor;
          oborder := obcheckleaves.Bordercolor;
          fborderWidth := obleave.Border;
          canvas.Font.Color := obcheckleaves.Fontcolor;
        end;
        obdowns:
        begin
          obstart := obdown.Startcolor;
          obend := obdown.Stopcolor;
          fborderWidth := obdown.Border;
          oborder := obdown.Bordercolor;
          canvas.Font.Color := obdown.Fontcolor;
        end;
      end;
    end
    else
    begin
      case fstate of
        obenters:
        begin
          obstart := obenter.Startcolor;
          obend := obenter.Stopcolor;
          oborder := obenter.Bordercolor;
          fborderWidth := obenter.Border;
          canvas.Font.Color := obenter.Fontcolor;
        end;
        obleaves:
        begin
          obstart := obleave.Startcolor;
          obend := obleave.Stopcolor;
          oborder := obleave.Bordercolor;
          fborderWidth := obleave.Border;
          canvas.Font.Color := obleave.Fontcolor;
        end;
        obdowns:
        begin
          obstart := obdown.Startcolor;
          obend := obdown.Stopcolor;
          oborder := obdown.Bordercolor;
          fborderWidth := obdown.Border;
          canvas.Font.Color := obdown.Fontcolor;
        end;
      end;

    end;
  end;
{
  if Enabled = False then
  begin
    tc:=obdisabled;
  end
  else
  begin
    if Checked = True then
    begin
     case fstate of
         obenters:tc:=obcheckenters;
         obleaves:tc:=obcheckleaves;
         obdowns:tc:=obdown;
       end;
    end
    else
    begin
       case fstate of
         obenters:tc:=obenter;
         obleaves:tc:=obleave;
         obdowns:tc:=obdown;
       end;
     end;
  end;
}
  fborderWidthT := fborderWidth + 2;


  case fCaptionDirection of
    ocup:
    begin
      textx := (Width div 2) - (self.canvas.TextWidth(Caption) div 2);
      Texty := fborderWidth;
      fbuttoncenter := ((Height div 2) div 2) + (fcheckwidth div 2);
      borderect := Rect((Width div 2) - (fcheckwidth div 2), fbuttoncenter,
        (Width div 2) + (fcheckwidth div 2), fbuttoncenter + fcheckwidth);
    end;
    ocdown:
    begin
      textx := (Width div 2) - (self.canvas.TextWidth(Caption) div 2);
      Texty := ((Height div 2)) + fborderWidth;
      fbuttoncenter := ((Height div 2) div 2) - (fcheckwidth div 2);
      borderect := Rect((Width div 2) - (fcheckwidth div 2), fbuttoncenter,
        (Width div 2) + (fcheckwidth div 2), fbuttoncenter + fcheckwidth);
    end;
    ocleft:
    begin
      textx := Width - (fcheckwidth + self.canvas.TextWidth(Caption) + 5);
      Texty := (Height div 2) - (self.canvas.TextHeight(Caption) div 2);
      fbuttoncenter := (Height div 2) - (fcheckwidth div 2);
      borderect := Rect(Width - fcheckwidth, fbuttoncenter, Width, fbuttoncenter + fcheckwidth);
    end;
    ocright:
    begin
      textx := fcheckwidth + 5;
      Texty := (Height div 2) - (self.canvas.TextHeight(Caption) div 2);
      fbuttoncenter := (Height div 2) - (fcheckwidth div 2);
      borderect := Rect(0, fbuttoncenter, fcheckwidth, fbuttoncenter + fcheckwidth);
    end;
  end;

  gradienrect1 := Rect(borderect.left + fborderWidth, borderect.top + fborderWidth,
    borderect.Right - fborderWidth, borderect.top + (borderect.Height div 2));
  gradienrect2 := Rect(gradienrect1.left, gradienrect1.Bottom, gradienrect1.Right,
    (borderect.Bottom - fborderWidth));

  checkrect := Rect(gradienrect1.left + fborderWidtht, gradienrect1.top +
    fborderWidtht, gradienrect2.Right - fborderWidtht, gradienrect2.bottom -
    fborderWidtht);

//   Drawtorect(self.Canvas,borderect,Tc,Fkind);

  with canvas do
  begin
    if (self is Toradiobutton) then
    begin

      Brush.Color := oborder;
      Radiorect := Rect(gradienrect1.Left - fborderWidth, gradienrect1.top -
        fborderWidth, gradienrect2.Right + fborderWidth, gradienrect2.Bottom +
        fborderWidth);

      Ellipse(Radiorect);

      Radiorect := Rect(Radiorect.left + fborderWidth, Radiorect.top +
        fborderWidth, Radiorect.Right - fborderWidth, Radiorect.Bottom - fborderWidth);
      Brush.Color := obstart;
      Ellipse(Radiorect);


      if Checked then
      begin
        Brush.Color := checkendstart;
        Radiorect := Rect(Radiorect.left + fborderWidthT, Radiorect.top +
          fborderWidthT, Radiorect.Right - fborderWidthT, Radiorect.Bottom -
          fborderWidthT);

        Ellipse(Radiorect);

        Brush.Color := checkedend;
        Radiorect := Rect(Radiorect.left + fborderWidth, Radiorect.top +
          fborderWidth, Radiorect.Right - fborderWidth, Radiorect.Bottom - fborderWidth);
        Ellipse(Radiorect);
      end;

    end
    else
    begin

    {  Drawtorect(self.Canvas,borderect,Tc,Fkind);
      if fchecked = True then
      Drawtorect(self.Canvas,checkrect,Tc,Fkind);
      }
      Brush.Color := oborder;
      FillRect(borderect);
      GradientFill(gradienrect1, obstart, obend, gdVertical);
      GradientFill(gradienrect2, obend, obstart, gdVertical);

      if fchecked = True then
      begin
        Brush.Color := oborder;
        FillRect(checkrect);
   //     Brush.Style := bsClear;
   //     TextOut(checkrect.Width div 2, checkrect.Height div 2 , '֍');
        checkrect := Rect(checkrect.Left + fborderWidth, checkrect.top +
          fborderWidth, checkrect.Right - fborderWidth, checkrect.Bottom - fborderWidth);
        GradientFill(checkrect, checkendstart, checkedend, gdVertical);
        //√
      end;
    end;

    if Length(Caption) > 0 then
    begin
      Brush.Style := bsClear;
      TextOut(Textx, Texty, (Caption));
    end;

  end;

end;


procedure Tobuton.CMonmouseenter(var Messages: Tmessage);
begin
  inherited;
  fstate := obenters;
  Invalidate;
  //paint;
end;

procedure Tobuton.CMonmouseleave(var Messages: Tmessage);
begin
  inherited;
  fstate := obleaves;
  Invalidate;
  //paint;
end;

procedure Tobuton.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X: integer; Y: integer);
begin
  inherited;
  if Button = mbLeft then
  begin
    fstate := obdowns;
    Invalidate;
  end;
end;

procedure Tobuton.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X: integer; Y: integer);
begin
  inherited;
  fstate := obenters;
  Invalidate;
end;

constructor Tobuton.Create(Aowner: TComponent);
begin
  inherited Create(Aowner);
  parent := TWinControl(Aowner);
  ControlStyle := ControlStyle + [csParentBackground, csClickEvents,
    csCaptureMouse, csDoubleClicks, csSetCaption];
  backgroundcolored := False;
  self.Width := 120;
  self.Height := 40;
  fenter := Tocolor.Create(self);
  with fenter do
  begin
    border := 1;
    bordercolor := clblack;
    startcolor := $00CDCDCD;
    stopcolor := clmenu;
    Fontcolor := clBlue;
  end;
  fleave := Tocolor.Create(self);
  with fleave do
  begin
    border := 1;
    bordercolor := $006E6E6E;
    startcolor := clActiveBorder;
    stopcolor := clmenu;
    Fontcolor := clblack;
  end;
  fdown := Tocolor.Create(self);
  with fdown do
  begin
    border := 1;
    bordercolor := clblack;
    startcolor := clmenu;
    stopcolor := $00A0A0A0;
    Fontcolor := clRed;
  end;
  fdisabled := Tocolor.Create(self);
  with fdisabled do
  begin
    border := 1;
    bordercolor := clblack;
    startcolor := clmenu;
    stopcolor := $005D5D5D;
    Fontcolor := $002C2C2C;
  end;

  fstate := obleaves;

  // Ftext := 'Obutton';
end;

destructor Tobuton.Destroy;
begin
  FreeAndNil(fenter);
  FreeAndNil(fleave);
  FreeAndNil(fdown);
  FreeAndNil(fdisabled);
  inherited Destroy;
end;

procedure Tobuton.paint;
var
  textx, Texty: integer;
  fontcolor: Tcolor;
begin
  inherited paint;

  if Enabled = False then
  begin
    Drawtorect(Self.Canvas, ClientRect, fdisabled, Fkind);
    fontcolor := fdisabled.Fontcolor;
  end
  else
  begin
    case fstate of
      obleaves:
      begin
        Drawtorect(Self.Canvas, ClientRect, fleave, Fkind);
        fontcolor := fleave.Fontcolor;
      end;
      obenters:
      begin
        Drawtorect(Self.Canvas, ClientRect, fenter, Fkind);
        fontcolor := fenter.Fontcolor;
      end;
      obdowns:
      begin
        Drawtorect(Self.Canvas, ClientRect, fdown, Fkind);
        fontcolor := fdown.Fontcolor;
      end;
    end;
  end;



  textx := (self.Width div 2) - (self.canvas.TextWidth(Caption) div 2);
  Texty := (self.Height div 2) - (self.canvas.TextHeight(Caption) div 2);

  self.Font.Color := fontcolor;
  if Length(Caption) > 0 then
  begin
    self.canvas.Brush.Style := bsClear;
    self.canvas.TextOut(Textx, Texty, Caption);
  end;
end;



{ TCollapExpandpanel }

procedure TCollapExpandpanel.SetStatus(const AValue: ToExpandStatus);
begin
  if FStatus = AValue then Exit;
  FStatus := AValue;
  if (FAutoCollapse) then ResizePanel();
end;

function TCollapExpandpanel.GetMinheight: integer;
begin
  Result := fminheight;
end;

function TCollapExpandpanel.GetNormalheight: integer;
begin
  Result := fnormalheight;
end;

procedure TCollapExpandpanel.SetAutoCollapse(const AValue: boolean);
begin
  if FAutoCollapse = AValue then Exit;
  FAutoCollapse := AValue;
  ResizePanel();
end;

procedure TCollapExpandpanel.SetOnCollapse(const AValue: TNotifyEvent);
begin
  if FOnCollapse = AValue then Exit;
  FOnCollapse := AValue;
end;

procedure TCollapExpandpanel.SetOnExpand(const AValue: TNotifyEvent);
begin
  if FOnExpand = AValue then Exit;
  FOnExpand := AValue;
end;

procedure TCollapExpandpanel.Setminheight(const Avalue: integer);
begin
  if fminheight = AValue then Exit;
  fminheight := AValue;
  Self.Constraints.MinHeight := fminheight;
end;

procedure TCollapExpandpanel.Setnormalheight(const Avalue: integer);
begin
  if fnormalheight = AValue then Exit;
  fnormalheight := AValue;
  Self.Constraints.MaxHeight := fnormalheight;
end;




procedure TCollapExpandpanel.ResizePanel();
begin
  if (FStatus = oExpanded) then
  begin
    Self.Height := Normalheight;
  end
  else
  begin
    Self.Height := Minheight;
  end;

end;

procedure TCollapExpandpanel.OnMyButtonClick(Sender: TObject);
begin

  if (FStatus = oExpanded) then
  begin
    if Assigned(FOnCollapse) then FOnCollapse(Self);
    FStatus := oCollapsed;
    FExpandButton.Caption := '▼'; //▲ ▼ ► ◄  // ALT+30 ALT+31 ALT+16 ALT+17
  end
  else
  begin
    if Assigned(FOnExpand) then FOnExpand(Self);
    FStatus := oExpanded;
    FExpandButton.Caption := '▲';//▲ ▼ ► ◄  // ALT+30 ALT+31 ALT+16 ALT+17
  end;


  ResizePanel();

end;




procedure TCollapExpandpanel.DblClick;
var
  aPnt: TPoint;
begin
  GetCursorPos(aPnt);
  aPnt := ScreenToClient(aPnt);
  if PtInRect(Rect(Background.Border, Background.Border, self.Width -
    Background.Border, fminheight - Background.Border), aPnt) then
    OnMyButtonClick(self);
end;



constructor TCollapExpandpanel.Create(Aowner: TComponent);
begin

  inherited Create(Aowner);
  parent := TWinControl(Aowner);

  ControlStyle := ControlStyle + [csAcceptsControls, csParentBackground,
    csClickEvents, csCaptureMouse, csDoubleClicks, csSetCaption];

  Width := 250;
  Height := 150;

  FStatus := oExpanded;
  FAutoCollapse := False;
  fminheight := 30;
  fnormalheight := Height;
  //  Self.Constraints.MinHeight := fminheight;

  ParentBackground := True;
  fbutondirection := obright;

  fbutonen := Tocolor.Create(self);
  with fbutonen do
  begin
    border := 1;
    bordercolor := clblack;
    startcolor := $00CDCDCD;
    stopcolor := clmenu;
  end;
  fbutonle := Tocolor.Create(self);
  with fbutonle do
  begin
    border := 1;
    bordercolor := clblack;
    startcolor := clActiveBorder;
    stopcolor := clmenu;
  end;
  fbutondown := Tocolor.Create(self);
  with fbutondown do
  begin
    border := 1;
    bordercolor := clblack;
    startcolor := $00BD936C;
    stopcolor := clmenu;
  end;

  with Background do
  begin
    border := 1;
    bordercolor := clblack;
    startcolor := clActiveBorder;
    stopcolor := clmenu;
  end;

  if not Assigned(FExpandButton) then
  begin
    FExpandButton := Tobuton.Create(Self);
    with FExpandButton do
    begin
      Parent := self;
      Width := fminheight - self.Background.Border;
      Height := fminheight - self.Background.Border;
      Left := self.Width - (Width + self.Background.Border);
      top := self.Background.border + 1;
      Font.Size := 12;
      Caption := '▲'; //▲ ▼ ► ◄  // ALT+30 ALT+31 ALT+16 ALT+17
    //  Font.Name := 'Webdings';
      OnClick := @OnMyButtonClick;
      ColorDown := fbutondown;
      ColorEnter := fbutonen;
      ColorLeave := fbutonle;
    end;
  end;
end;

destructor TCollapExpandpanel.Destroy;
begin

  if Assigned(FExpandButton) then FreeAndNil(FExpandButton);
  inherited Destroy;
end;

procedure TCollapExpandpanel.paint;
var
  headerrect: TRect;
  textx, Texty: integer;
begin
  inherited paint;
  //headerrect:=Rect(Background.Border,Background.Border,self.Width-Background.Border,fminheight-Background.Border);

  headerrect := Rect(0, 0, self.Width, fminheight - Background.Border);

  //  fborderWidth:=Background.Border;

  if Assigned(FExpandButton) then
    with FExpandButton do
    begin
      Width := headerrect.Height;//-(self.Background.Border);
      Height := headerrect.Height;//-(self.Background.Border);
      if ButtonPosition = obright then
        Left := self.Width - Width
      else
        Left := 0;//self.Background.Border;

      top := 0;//self.Background.border;
    end;

  Drawtorect(self.canvas, headerrect, Background, Fkind);

  if Length(Caption) > 0 then
  begin
    canvas.Font.Color := Background.Fontcolor;
    textx := (self.Width div 2) - (self.canvas.TextWidth(Caption) div 2);
    Texty := (Minheight div 2) - (self.canvas.TextHeight(Caption) div 2);
    self.canvas.Brush.Style := bsClear;
    self.canvas.TextOut(Textx, Texty, (Caption));
  end;
  //end;
end;



{ ToListBox }




constructor tolistbox.create(aowner: tcomponent);
begin
  inherited Create(Aowner);
  parent       := TWinControl(Aowner);
  Width        := 180;
  Height       := 200;
  TabStop      := True;
  Fselectedcolor :=clblue;
  ControlStyle := ControlStyle - [csAcceptsControls] +
    [csParentBackground, csClickEvents, csCaptureMouse, csDoubleClicks];
  findex       := -1;
  Flist        := TStringList.Create;
  TStringList(Flist).OnChange := @LinesChanged;
  FItemsShown  := 0;
  FitemHeight  := self.canvas.TextExtent('Çİ').cy;
  Fitemoffset  := 0;
//  FFocusedItem := -1;
  fvert := ToScrollBar.Create(self);
  with fvert do
  begin
    Parent := self;
    Kind := oVertical;
    Width := 25;
    left := Self.Width - (25 + Background.Border);
    Top := Background.Border;
    Height := Self.Height - (Background.Border * 2);
    Max := 100;//Flist.Count;
    Min := 0;
    OnChange := @Scrollchange;
    Position := 0;
    Visible  := false;
  end;

end;

destructor tolistbox.destroy;
begin
  if Assigned(fvert) then
    FreeAndNil(fvert);
  if Assigned(fhorz) then
    FreeAndNil(fhorz);
    FreeAndNil(Flist);
  inherited Destroy;
end;


function tolistbox.getitemindex: integer;
begin
  Result := findex;
end;

procedure tolistbox.setitemindex(avalue: integer);
var
 Shown: integer;
begin
  if Flist.Count = 0 then exit;
  if findex = aValue then Exit;
  Shown := Height div FItemHeight;

  if (Flist.Count > 0) and (aValue >= -1) and (aValue <= Flist.Count) then
  begin
    findex := aValue;

    if (aValue < FItemOffset) then
      FItemOffset := aValue
    else if aValue > (FItemOffset + (Shown - 1)) then
      FItemOffset := ValueRange(aValue - (Shown - 1), 0, Flist.Count - Shown);
  end
  else
  begin
    findex := -1;
  end;
  Invalidate;
end;

function tolistbox.getitemat(pos: tpoint): integer;
begin
  Result := -1;
  if Pos.Y >= 0 then
  begin
    Result := FItemOffset + Pos.Y div FItemHeight;
    if (Result > Items.Count - 1) or (Result > (FItemOffset + FItemsShown) - 1) then
      Result := -1;
  end;
end;

function tolistbox.getitemheight: integer;
begin
 Result:=FitemHeight;
end;

procedure tolistbox.setitemheight(avalue: integer);
begin
 if avalue<>FitemHeight then FitemHeight:=avalue;
end;

procedure tolistbox.mousedown(button: tmousebutton; shift: tshiftstate;
  x: integer; y: integer);
var
  ClickedItem: integer;
begin
  if button = mbLeft then
  begin
    ClickedItem := GetItemAt(Point(X, Y));
    if ClickedItem>-1 then findex:=ClickedItem;
  end;
   // Invalidate;
    SetFocus;
    Invalidate;
  inherited MouseDown(Button, Shift, X, Y);
end;


function tolistbox.domousewheeldown(shift: tshiftstate; mousepos: tpoint
  ): boolean;
begin
  inherited;
  if not Fvert.visible then exit;
  Fvert.Position := Fvert.Position+Mouse.WheelScrollLines;
  FItemOffset := fvert.Position;
  Result := True;
  Invalidate;
end;

// -----------------------------------------------------------------------------

function tolistbox.domousewheelup(shift: tshiftstate; mousepos: tpoint
  ): boolean;
begin
  inherited;
  if not Fvert.visible then exit;
  Fvert.Position := Fvert.Position-Mouse.WheelScrollLines;
  FItemOffset := fvert.Position;
  Result := True;
  Invalidate;
end;


procedure tolistbox.scrollchange(sender: tobject);
begin
  FItemOffset := fvert.Position;
  Invalidate;
end;

function tolistbox.itemrect(item: integer): trect;
var
  r: TRect;
begin
  r := Rect(0, 0, 0, 0);

  if (Item >= FItemOffset - 1) and ((Item - FItemOffset) * FItemHeight < Height) then
  begin
    r.Top := (Item - FItemOffset) * FItemHeight;
    r.Bottom := r.Top + FItemHeight;
    r.Left := 0;

    if Assigned(fvert) and (fvert.Visible) then
      r.Right := fvert.Left
    else
      r.Right := Width;

    if Assigned(fhorz) and (fhorz.Visible) then
      r.Bottom := fhorz.Top
    else
      r.Bottom := Height;
  end;

  Result := r;
end;



procedure tolistbox.paint;
var
  a, b, k, i: integer;
begin
  inherited paint;
  if Flist.Count > 0 then
  begin

    FItemsShown := self.Height div FitemHeight;

    if Flist.Count-FItemsShown+1 > 0 then
    begin
       with fvert do
       begin
         Width := 25;
         left := Self.Width - (Width + Background.Border);
         Top := Background.Border;
         Height := Self.Height - (Background.Border * 2);
         Max:=Flist.Count-FItemsShown;
       end;
    end;
    //else
    //fvert.Max:=0;


    if Flist.Count * FItemHeight > self.Height then
      fvert.Visible := True
    else
      fvert.Visible := False;



    a := Background.Border;
    b := a;
    canvas.Brush.Style := bsClear;

    for i := FItemOffset to (FItemOffset + (Height) div FItemHeight) - 1 do
    begin
      if i < Flist.Count then
      begin
        if i = findex then
        begin
          canvas.Brush.Color := Fselectedcolor;
          canvas.Brush.Style := bsSolid;
          if Assigned(fvert) then
           canvas.FillRect(a, b, self.Width-(fvert.Width+ (a*2)),b + FitemHeight)
          else
          canvas.FillRect(a, b, self.Width - a,b + FitemHeight);
          Canvas.TextOut(a, b, Flist[i]);
        end
        else
        begin
          canvas.Brush.Style := bsClear;
          Canvas.TextOut(a, b, Flist[i]);
        end;
        b := b + FitemHeight;
        if (b >= Height) then Break;
      end;
    end;
  end;
end;

procedure tolistbox.beginupdate;
begin
  Flist.BeginUpdate;
end;

procedure tolistbox.endupdate;
begin
  Flist.EndUpdate;
end;


procedure tolistbox.clear;
begin
  Flist.Clear;
end;

procedure tolistbox.lineschanged(sender: tobject);
begin
 Invalidate;
end;

procedure tolistbox.keydown(var key: word; shift: tshiftstate);
var
  x: integer;
begin

  case key of
    VK_RETURN: if (Flist.Count > 0) and (findex > -1) then
      begin
 //
      end;
    VK_UP: begin
      MoveUp;
      Invalidate;
     end;
    VK_DOWN: begin
      MoveDown;
      Invalidate;
    end;
    VK_HOME: begin
      MoveHome;
      Invalidate;
    end;
    VK_END: begin
      MoveEnd;
      Invalidate;
    end;
    VK_PRIOR: if flist.Count > 0 then
      begin
        x := FItemOffset - FItemsShown;
        if x < 0 then x := 0;
        FItemOffset := x;
        findex:=x;
        Invalidate;
      end;
    VK_NEXT: if Flist.Count > 0 then
      begin
        x := FItemOffset + FItemsShown;
        if x >= flist.Count then x := Flist.Count - 1;
        if Flist.Count <= FItemsShown then
          FItemOffset := 0
        else if x > (Flist.Count - FItemsShown) then
          FItemOffset := Flist.Count - FItemsShown
        else
          FItemOffset := x;

         findex:=x;
         Invalidate;
      end;
    else
  end;
// SetFocus;
// Self.DoEnter;
//  WriteLn('ok');
inherited;
end;

procedure tolistbox.setstring(avalue: tstrings);
begin
  if Flist=AValue then Exit;
  Flist.Assign(AValue);
  // this is correct statement
//  FStrings.Assign(AValue);
  // this is not correct
  // FStrings := AValue;
end;



procedure tolistbox.moveup;
var
  Shift: boolean;
begin
  if flist.Count > 0 then
  begin
    Shift := GetKeyState(VK_SHIFT) < 0;

    if (findex > (FItemOffset + FItemsShown)) or (findex < (FItemOffset)) then
    begin
      findex := FItemOffset;
    end
    else if (findex > 0) and (findex < Flist.Count) then
    begin
      // SCROLL?????
      if ((findex - FItemOffset) = 0) and (FItemOffset > 0) then
        Dec(FItemOffset);

      Dec(findex);

    end;

  end;
end;



// -----------------------------------------------------------------------------

procedure tolistbox.movedown;
var
  Shift: boolean;
begin
  if flist.Count > 0 then
  begin
    Shift := GetKeyState(VK_SHIFT) < 0;

    if (findex > (FItemOffset + FItemsShown)) or (findex < (FItemOffset)) then
    begin
      findex := FItemOffset;
    end
    else if (findex >= 0) and (findex < Flist.Count - 1) then
    begin
      Inc(findex);
      // SCROLL?????
      if (findex - FItemOffset) > FItemsShown - 1 then
        Inc(FItemOffset);
    end;

  end;
end;

// -----------------------------------------------------------------------------

procedure tolistbox.movehome;
var
  i: integer;
begin
  if flist.Count > 0 then
  begin
    findex := 0;
    FItemOffset := 0;
  end;
end;

// -----------------------------------------------------------------------------

procedure tolistbox.moveend;
var
  i: integer;
begin
  if flist.Count > 0 then
  begin
    findex := Flist.Count - 1;
    if (Flist.Count - FItemsShown) >= 0 then
      FItemOffset := Flist.Count - FItemsShown
    else
      FItemOffset := 0;
  end;
end;

{ ToChecklistbox }



constructor tochecklistbox.create(aowner: tcomponent);
begin
  inherited Create(AOwner);
  parent := TWinControl(Aowner);
  Width := 180;
  Height := 200;
  TabStop := True;
  ControlStyle := ControlStyle - [csAcceptsControls] +
    [csParentBackground, csClickEvents, csCaptureMouse, csDoubleClicks];

//  fCaptionDirection := ocleft;
  obenter := Tocolor.Create(self);
  with obenter do
  begin
    border := 1;
    bordercolor := clblack;
    startcolor := $00CDCDCD;
    stopcolor := clmenu;
    Fontcolor := clBlue;
  end;

  obleave := Tocolor.Create(self);
  with obleave do
  begin
    border := 2;
    bordercolor := $006E6E6E;
    startcolor := clActiveBorder;
    stopcolor := clmenu;
    Fontcolor := clblack;
  end;

  obdown := Tocolor.Create(self);
  with obdown do
  begin
    border := 2;
    bordercolor := clSilver;
    startcolor := clmenu;
    stopcolor := $00A0A0A0;
    Fontcolor := clRed;
  end;

  obcheckenters := Tocolor.Create(self);
  with obcheckenters do
  begin
    border := 2;
    bordercolor := clSilver;
    startcolor := clmenu;
    stopcolor := clActiveBorder;
    Fontcolor := clBlue;
  end;

  obcheckleaves := Tocolor.Create(self);
  with obcheckleaves do
  begin
    border := 2;
    bordercolor := clSilver;
    startcolor := clActiveBorder;
    stopcolor := clmenu;
    Fontcolor := clblack;
  end;

  obdisabled := Tocolor.Create(self);
  with obdisabled do
  begin
    border := 2;
    bordercolor := clSilver;
    startcolor := clmenu;
    stopcolor := $005D5D5D;
    Fontcolor := $002C2C2C;
  end;
  Fbuttonheight := 10;
  findex := -1;
  FItemsShown  := 0;
  FitemHeight  := self.canvas.TextExtent('Çİ').cy;
  Fitemoffset  := 0;
  Flist := TStringList.Create;
  TStringList(Flist).OnChange := @LinesChanged;
  Fchecklist := TList.Create;
  Fstatelist := Tlist.Create;
  fvert := ToScrollBar.Create(self);
  with fvert do
  begin
    Parent := self;
    Kind := oVertical;
    Width := 25;
    left := Self.Width - (25 + Background.Border);
    Top := Background.Border;
    Height := Self.Height - (Background.Border * 2);
    Max := 100;//Flist.Count;
    Min := 0;
    OnChange := @Scrollchange;
    Position := 0;
    Visible  := false;
  end;
end;

destructor tochecklistbox.destroy;
begin
  FreeAndNil(Flist);
  FreeAndNil(Fchecklist);
  FreeAndNil(Fstatelist);
  FreeAndNil(fvert);
  inherited Destroy;
end;

procedure tochecklistbox.paint;
var
  a, b, k, i,p: integer;
  gr1,gr2:TRect;//color;
  obstart,obend,oborder,checkendstart,checkedend:Tcolor;
  fborderWidth:integer;
  chechrect:Trect;
begin
  inherited paint;
  if Flist.Count > 0 then
  begin

    FItemsShown := self.Height div FitemHeight;

    if Flist.Count-FItemsShown+1 > 0 then
    begin
       with fvert do
       begin
         Width := 25;
         left := Self.Width - (Width + Background.Border);
         Top := Background.Border;
         Height := Self.Height - (Background.Border * 2);
         Max:=Flist.Count-FItemsShown;
       end;
    end;
    //else
    //fvert.Max:=0;


    if Flist.Count * FItemHeight > self.Height then
      fvert.Visible := True
    else
      fvert.Visible := False;


    Fbuttonheight:=FitemHeight-3;
    a := Background.Border;
    b := a;
    canvas.Brush.Style := bsClear;

    for i := FItemOffset to (FItemOffset + (Height) div FItemHeight) - 1 do
    begin
      if i < Flist.Count then
      begin
        Fstate:=obleaves;
        case getstatenumber(i)of
        0:Fstate:=obenters;
        1:Fstate:=obleaves;
        2:Fstate:=obdowns;
        end;



          if Enabled = False then
          begin
            obstart := obdisabled.Startcolor;
            obend := obdisabled.Stopcolor;
            oborder := obdisabled.Bordercolor;
            fborderWidth := obdisabled.Border;
            canvas.Font.Color := obdisabled.Fontcolor;
            if (IsChecked(i)) and (fstateindex=i) then
            begin
              checkendstart := obcheckenters.Startcolor;
              checkedend := obcheckenters.Stopcolor;
            end;
          end
          else
          begin
             if (IsChecked(i)) and (fstateindex=i) then
             begin
                case fstate of
                  obenters:
                  begin
                    obstart := obenter.Startcolor;
                    obend := obenter.Stopcolor;
                    checkendstart := obcheckenters.Startcolor;
                    checkedend := obcheckenters.Stopcolor;
                    oborder := obenter.Bordercolor;
                    fborderWidth := obenter.Border;
                    canvas.Font.Color := obcheckenters.Fontcolor;
                  end;
                  obleaves:
                  begin
                    obstart := obleave.Startcolor;
                    obend := obleave.Stopcolor;
                    checkendstart := obcheckleaves.Startcolor;
                    checkedend := obcheckleaves.Stopcolor;
                    oborder := obcheckleaves.Bordercolor;
                    fborderWidth := obleave.Border;
                    canvas.Font.Color := obcheckleaves.Fontcolor;
                  end;
                  obdowns:
                  begin
                    obstart := obdown.Startcolor;
                    obend := obdown.Stopcolor;
                    fborderWidth := obdown.Border;
                    oborder := obdown.Bordercolor;
                    canvas.Font.Color := obdown.Fontcolor;
                  end;
                end;
              end
              else
              begin
                case fstate of
                  obenters:
                  begin
                    obstart := obenter.Startcolor;
                    obend := obenter.Stopcolor;
                    oborder := obenter.Bordercolor;
                    fborderWidth := obenter.Border;
                    canvas.Font.Color := obenter.Fontcolor;
                  end;
                  obleaves:
                  begin
                    obstart := obleave.Startcolor;
                    obend := obleave.Stopcolor;
                    oborder := obleave.Bordercolor;
                    fborderWidth := obleave.Border;
                    canvas.Font.Color := obleave.Fontcolor;
                  end;
                  obdowns:
                  begin
                    obstart := obdown.Startcolor;
                    obend := obdown.Stopcolor;
                    oborder := obdown.Bordercolor;
                    fborderWidth := obdown.Border;
                    canvas.Font.Color := obdown.Fontcolor;
                  end;
                end;
              end;
          end;






        if i = findex then
        begin
          canvas.Brush.Color := Fselectedcolor;
          canvas.Brush.Style := bsSolid;

       //  if IsChecked(I) then
       //   a:=a+FitemHeight;

          if Assigned(fvert) then
           canvas.FillRect(a, b, self.Width-(fvert.Width+ (a*2)),b + FitemHeight)
          else
          canvas.FillRect(a, b, self.Width - a,b + FitemHeight);
        end;
        //else
       // begin     /// not selected

        //   chechrect:= Rect(fborderWidth,b,fborderWidth+FitemHeight,b+(FitemHeight));
           chechrect:= Rect(fborderWidth,b,fborderWidth+Fbuttonheight,b+(Fbuttonheight));
           canvas.Brush.Color:=oborder;
           Canvas.FillRect(chechrect);  /// for border


           // background
           gr1:=rect(fborderWidth,b+fborderWidth,Fbuttonheight,b+Fbuttonheight div 2); //FitemHeight-fborderWidth,b+(FitemHeight div 2));
           gr2:=rect(gr1.Left,gr1.Bottom,gr1.Right,gr1.Bottom+(Fbuttonheight div 2));//(FitemHeight div 2));
           canvas.GradientFill(gr1, obstart,obend, gdVertical);
           canvas.GradientFill(gr2, obend,obstart,  gdVertical);


         {  chechrect:= Rect(fborderWidth,b+fborderWidth,fborderWidth+FitemHeight,b+(FitemHeight));
           canvas.Brush.Color:=oborder;
           Canvas.FillRect(chechrect);  /// for border


           // background
           gr1:=rect(fborderWidth,b+fborderWidth,FitemHeight-fborderWidth,b+(FitemHeight div 2));
           gr2:=rect(gr1.Left,gr1.Bottom,gr1.Right,gr1.Bottom+(FitemHeight div 2));
        //    gr1:=rect(fborderWidth,b+fborderWidth,Fbuttonheight,Fbuttonheight div 2);
        //    gr2:=rect(gr1.Left,gr1.Bottom,gr1.Right,gr1.Bottom+(Fbuttonheight div 2));
           canvas.GradientFill(gr1, obstart,obend, gdVertical);
           canvas.GradientFill(gr2, obend,obstart,  gdVertical);
         }
           // if checked?
          if (IsChecked(i)) then
          begin
            chechrect:= Rect(fborderWidth*2,b+fborderWidth,fborderWidth+Fbuttonheight-fborderWidth,b+(Fbuttonheight)-fborderWidth);
            canvas.Brush.Color := oborder;
            canvas.FillRect(chechrect);

            chechrect := Rect(chechrect.Left + fborderWidth, chechrect.top +
              fborderWidth, chechrect.Right - fborderWidth, chechrect.Bottom - fborderWidth);
            canvas.GradientFill(chechrect, checkendstart, checkedend, gdVertical);
            {chechrect:= Rect(fborderWidth*2,b+5,fborderWidth+FitemHeight-5,b+(FitemHeight)-5);
            canvas.Brush.Color := oborder;
            canvas.FillRect(chechrect);

            chechrect := Rect(chechrect.Left + fborderWidth, chechrect.top +
              fborderWidth, chechrect.Right - fborderWidth, chechrect.Bottom - fborderWidth);
            canvas.GradientFill(chechrect, checkendstart, checkedend, gdVertical);
            }
            //√
          end;
       // end;

        canvas.Brush.Style := bsClear;
        Canvas.TextOut(a+(FitemHeight * 2), b, Flist[i]);

        b := b + FitemHeight;
        if (b >= Height) then Break;
      end;
    end;
  end;
end;
 
function tochecklistbox.domousewheeldown(shift: tshiftstate; mousepos: tpoint
  ): boolean;
begin
  Result:=inherited DoMouseWheelDown(Shift, MousePos);
end;

function tochecklistbox.domousewheelup(shift: tshiftstate; mousepos: tpoint
  ): boolean;
begin
  Result:=inherited DoMouseWheelUp(Shift, MousePos);
end;

function tochecklistbox.getbuttonheight: integer;
begin
  Result:=Fbuttonheight;
end;

function tochecklistbox.getitemat(pos: tpoint): integer;
begin
Result := -1;
  if Pos.Y >= 0 then
  begin
    Result := FItemOffset + Pos.Y div FItemHeight;
    if (Result > Items.Count - 1) or (Result > (FItemOffset + FItemsShown) - 1) then
      Result := -1;
  end;
end;

function tochecklistbox.getitemindex: integer;
begin
  Result := findex;
end;

function tochecklistbox.itemrect(item: integer): trect;
var
  r: TRect;
begin
  r := Rect(0, 0, 0, 0);

  if (Item >= FItemOffset - 1) and ((Item - FItemOffset) * FItemHeight < Height) then
  begin
    r.Top := (Item - FItemOffset) * FItemHeight;
    r.Bottom := r.Top + FItemHeight;
    r.Left := 0;

    if Assigned(fvert) and (fvert.Visible) then
      r.Right := fvert.Left
    else
      r.Right := Width;

    if Assigned(fhorz) and (fhorz.Visible) then
      r.Bottom := fhorz.Top
    else
      r.Bottom := Height;
  end;

  Result := r;

end;

function tochecklistbox.checkboxrect(index: integer): trect;
begin
    Result := ItemRect( Index );
  with Result do
    begin
    //  Inc( Left , 2 );
      left:=Background.Border+1;
      Top := Top + ( ( Bottom - Top ) - FitemHeight ) div 2;
      Right := Left + FitemHeight div 2 ;
      Bottom := Top + FitemHeight;
    end;
end;



procedure tochecklistbox.mousedown(button: tmousebutton; shift: tshiftstate;
  x: integer; y: integer);
  var
 Rect      : TRect;
begin
inherited MouseDown(Button, Shift, X, Y);
  if ( Button = mbLeft ) then
   begin
   fIndex := GetItemAt(Point( X , Y ));
    if ( fIndex > -1 ) then
    begin
      //  if MustClickInBox then  // only check click ?
       //   Rect := CheckBoxRect( Index )
       // else
      Rect := ItemRect(fIndex);  // item click
       if PtInRect( Rect , Point( X , Y ) ) then { if the user clicked inside the check box }
       begin
     	    Toggle(fIndex );
            fstateindex:=findex;
            Fstatelist.Items[findex]:=Pointer(2);
            invalidate;
       end;
    end;
  end;
end;

procedure tochecklistbox.mouseup(button: tmousebutton; shift: tshiftstate;
  x: integer; y: integer);
begin

end;

procedure tochecklistbox.mouseenter;
begin

end;

procedure tochecklistbox.mousemove(shift: tshiftstate; x, y: integer);
 var
  rect:Trect;
  i: Integer;
begin
  inherited MouseMove(Shift, X, Y);

  for i:=0 to Fstatelist.Count-1 do      // clear state
  if integer(Fstatelist.Items[i])<>2 then
  Fstatelist.Items[i]:=Pointer(1);

  fstateindex := GetItemAt(point(X,Y));
  if ( fstateindex > -1 ) then
  begin
    Rect := ItemRect(fstateindex);  // item click
    if PtInRect( Rect , point(x,Y) ) then
    Fstatelist.Items[fstateindex]:=Pointer(0);
  end;
  invalidate;
end;

procedure tochecklistbox.mouseleave;
var
  i: Integer;
begin
  inherited MouseLeave;
  for i:=0 to Fstatelist.Count-1 do
  if integer(Fstatelist.Items[i])<>2 then
  Fstatelist.Items[i]:=Pointer(1);
  Invalidate;
end;

procedure tochecklistbox.scrollchange(sender: tobject);
begin
  FItemOffset := fvert.Position;
  Invalidate;
end;

procedure tochecklistbox.keydown(var key: word; shift: tshiftstate);
begin

end;

procedure tochecklistbox.setstring(avalue: tstrings);
begin
 if Flist=AValue then Exit;
  Flist.Assign(AValue);
end;

function tochecklistbox.getstatenumber(index: integer): integer;
begin
 result:= 1;
 Result := integer(Fstatelist.Items[index]);

end;

function tochecklistbox.ischecked(index: integer): boolean;
begin
    Result := Fchecklist.IndexOf(Pointer(Index)) > -1;
end;

procedure tochecklistbox.check(index: integer; achecked: boolean);
begin
  if IsChecked( Index ) <> AChecked then
    begin
      if not AChecked then
        begin
        Fchecklist.Delete( Fchecklist.IndexOf(Pointer(Index)));
        Fstatelist.Items[index]:=Pointer(1);
       end else
       begin
        Fchecklist.Add(pointer(Index));
        Fstatelist.Items[index]:=Pointer(2);
       end;

       if ( AChecked ) then
       	CheckEvent( Index )
       else
       	UnCheckEvent( Index );
     end;

end;

function tochecklistbox.getallchecked: boolean;
begin
  Result := Fchecklist.Count = Items.Count;
end;

function tochecklistbox.getnonechecked: boolean;
begin
  Result := Fchecklist.Count = 0;
end;

procedure tochecklistbox.checkevent(index: integer);
begin
  if ( Assigned( FOnCheck ) ) then
    OnCheck( Self , Index );
end;

procedure tochecklistbox.uncheckevent(index: integer);
begin
  if ( Assigned( FOnUncheck ) ) then
   OnUnCheck( Self , Index );
end;

procedure tochecklistbox.setitemindex(avalue: integer);
begin
  if Flist.Count = 0 then exit;
  if Avalue = findex then exit;
  findex := Avalue;
end;

procedure tochecklistbox.beginupdate;
begin
Flist.BeginUpdate;
end;

procedure tochecklistbox.endupdate;
begin
 Flist.EndUpdate;
end;

procedure tochecklistbox.clear;
begin
  Flist.Clear;
  Fchecklist.Clear;
end;

procedure tochecklistbox.checkselection(achecked: boolean);
var
	Index : Integer;
begin
 {   if ( SelCount > 0 ) then
      for Index := 0 to Items.Count - 1 do
  if ( Selected[ Index ] ) then
      Checked[ Index ] := AChecked;
 }
end;

procedure tochecklistbox.toggle(index: integer);
begin
 Checked[ Index ] := not Checked[ Index ];
end;

procedure tochecklistbox.checkall(achecked: boolean);
var
Index : Integer;
begin
  for Index := 0 to Items.Count - 1 do
    Checked[ Index ] := AChecked;
end;

procedure tochecklistbox.lineschanged(sender: tobject);
var
i:integer;
begin
 Fstatelist.Clear;
 for i:=0 to flist.count-1 do
 Fstatelist.Add(Pointer(1));
 Invalidate;
end;

procedure tochecklistbox.movedown;
begin

end;

procedure tochecklistbox.moveend;
begin

end;

procedure tochecklistbox.movehome;
begin

end;

procedure tochecklistbox.moveup;
begin

end;

procedure tochecklistbox.setbuttonheight(avalue: integer);
begin
if Fbuttonheight<>avalue then Fbuttonheight:=avalue;
end;





{ Tocombobox }




function Tocombobox.Gettext: string;
begin
 if Fitemindex>-1 then
 Result := Fliste[Fitemindex]
 else
 Result:='';
end;




procedure Tocombobox.SetItemIndex(Avalue: integer);
var
 Shown: integer;
begin
  if Fliste.Count = 0 then exit;
  if Fitemindex = aValue then Exit;
  Shown := Height div FItemHeight;

  if (Fliste.Count > 0) and (aValue >= -1) and (aValue <= Fliste.Count) then
  begin
    Fitemindex := aValue;

    if (aValue < FItemOffset) then
      FItemOffset := aValue
    else if aValue > (FItemOffset + (Shown - 1)) then
      FItemOffset := ValueRange(aValue - (Shown - 1), 0, Fliste.Count - Shown);
  end
  else
  begin
    Fitemindex := -1;
  end;
  Invalidate;
end;

procedure Tocombobox.SetStrings(AValue: TStrings);
begin
  if Fliste=AValue then Exit;
  Fliste.Assign(AValue);
end;


procedure Tocombobox.LstPopupReturndata(Sender: TObject; const Str: string;
  const indx: integer);
begin
  try
   self.Text:=str;
   Fitemindex:=indx;
   Invalidate;
  except
    on E:Exception do
      MessageDlg(E.Message, mtError, [mbOK], 0);
  end;

end;

procedure Tocombobox.LstPopupShowHide(Sender: TObject);
begin
  fdropdown := (Sender as Tpopupformcombobox).Visible;
  if fdropdown=true then
  Fbutton.Caption :='▲'      //▲ ▼ ► ◄  // ALT+30 ALT+31 ALT+16 ALT+17
 else
  Fbutton.Caption :='▼';     //▲ ▼ ► ◄  // ALT+30 ALT+31 ALT+16 ALT+17
  Invalidate;
end;



procedure Tocombobox.kclick(Sender: TObject);
var
 aa:Tpoint;
begin
if Fliste.Count= 0 then  exit;
aa := ControlToScreen(Point(0, Height));
ShowCombolistPopup(aa, @LstPopupReturndata, @LstPopupShowHide, self);
 //Invalidate;
end;


procedure Tocombobox.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X: integer; Y: integer);
begin
  if button = mbLeft then
  begin
   // GetOwningForm(self).ScreenToClient(Point(xx,yy));

    if not (PtInRect(ClientRect,point(x, y))) then
     begin
       kclick(self);
      Invalidate;
     end;

  end;
  inherited MouseDown(Button, Shift, X, Y);
end;



function Tocombobox.GetItemIndex: integer;
begin
 Result := Fitemindex;
end;



procedure Tocombobox.SetText(AValue: string);
begin

end;


procedure Tocombobox.BeginUpdate;
begin
 Fliste.BeginUpdate;
end;
procedure Tocombobox.EndUpdate;
begin
Fliste.EndUpdate;
end;
procedure Tocombobox.Clear;
begin
Fliste.Clear;
end;

constructor Tocombobox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  parent := TWinControl(Aowner);
 // backgroundcolored:=false; // do not paint oncustomcontrol
  Width := 150;
  Height := 30;
//  TabStop := True;
  Fselectedcolor :=clblue;
  ControlStyle := ControlStyle +//- [csAcceptsControls] +
    [csAcceptsControls,csParentBackground, csClickEvents, csCaptureMouse, csDoubleClicks];
//  fbutonarea := Rect(Width-30,0,Width,30);
  Fitemindex := -1;
  Fliste := TStringList.Create;
  TStringList(Fliste).OnChange := @LinesChanged;



  fobenter := Tocolor.Create(self);
  with fobenter do
  begin
    border := 1;
    bordercolor := clblack;
    startcolor := $00CDCDCD;
    stopcolor := clmenu;
    Fontcolor := clBlue;
  end;

  fobleave := Tocolor.Create(self);
  with fobleave do
  begin
    border := 1;
    bordercolor := $006E6E6E;
    startcolor := clActiveBorder;
    stopcolor := clmenu;
    Fontcolor := clblack;
  end;

  fobdown := Tocolor.Create(self);
  with fobdown do
  begin
    border := 1;
    bordercolor := clblack;
    startcolor := clmenu;
    stopcolor := $00A0A0A0;
    Fontcolor := clRed;
  end;

  ffdisabled := Tocolor.Create(self);
  with ffdisabled do
  begin
    border := 1;
    bordercolor := clblack;
    startcolor := clmenu;
    stopcolor := $005D5D5D;
    Fontcolor := $002C2C2C;
  end;

  Fbutton := Tobuton.Create(self);
  with fbutton do
  begin
   parent := self;
   Align  := alRight;
   Width  := Height;
   OnClick :=@kclick;
   Caption :='▼';         //▲ ▼ ► ◄  // ALT+30 ALT+31 ALT+16 ALT+17
 {  ColorDown:=fobdown;
   ColorEnter:=fobenter;
   ColorLeave:=fobleave;
   ColorDisable:=ffdisabled;   }

  end;

  Fedit:=Toedit.Create(self);
  with Fedit do
  begin
    Parent := Self;
    Align  := alClient;
    Enabled:= false;
//    font:=self.Font;
//    onMouseDown:=@self.MouseDown;
    {Left   := 0;
    Top    := 0;
    Width  := 120;
    Height := 30;}
 //   Background:= self.Background;
  end;


   // combobox dropdown windows


end;

destructor Tocombobox.Destroy;
begin
  if Assigned(Fliste) then FreeAndNil(Fliste);
  if Assigned(Fedit) then FreeAndNil(Fedit);

  if Assigned(fobdown) then FreeAndNil(fobdown);
  if Assigned(fobenter) then FreeAndNil(fobenter);
  if Assigned(fobleave) then FreeAndNil(fobleave);
  if Assigned(ffdisabled) then FreeAndNil(ffdisabled);
  if Assigned(Fbutton) then FreeAndNil(Fbutton);

  inherited Destroy;
end;


procedure Tocombobox.Paint;
begin
  inherited Paint;
  if Assigned(Fbutton) then
  with fbutton do
  begin
   Align  := alRight;
   Width  := Height;
  { ColorDown:=fobdown;
   ColorEnter:=fobenter;
   ColorLeave:=fobleave;
   ColorDisable:=ffdisabled; }
  end;
  if Assigned(Fedit) then
  with Fedit do
  begin
   if Fitemindex>-1 then
   Text:=Fliste[Fitemindex];
 //   Align  := alClient;
    {Left   := 0;
    Top    := 0;
    Width  := 120;
    Height := 30;}
 //   Background:= self.Background;
  end;
 //
end;



procedure Tocombobox.LinesChanged(Sender: TObject);
begin

//  Fliste.BeginUpdate;
//  Olist.BeginUpdate;
//  Olist.items. Assign(Fliste);
 // ShowMessage('ok');
//  Olist.EndUpdate;
//  Fliste.EndUpdate;

 Invalidate;
end;

procedure Tocombobox.KeyDown(var Key: word; Shift: TShiftState);
var
  x: integer;
begin

  case key of
    VK_RETURN: if (Fliste.Count > 0) and (Fitemindex > -1) then
      begin
 //
      end;
    VK_UP: begin
      MoveUp;
      Invalidate;
     end;
    VK_DOWN: begin
      MoveDown;
      Invalidate;
    end;
    VK_HOME: begin
      MoveHome;
      Invalidate;
    end;
    VK_END: begin
      MoveEnd;
      Invalidate;
    end;
    VK_PRIOR: if fliste.Count > 0 then
      begin
        x := FItemOffset - FItemsShown;
        if x < 0 then x := 0;
        FItemOffset := x;
        Fitemindex  :=x;
        Invalidate;
      end;
    VK_NEXT: if Fliste.Count > 0 then
      begin
        x := FItemOffset + FItemsShown;
        if x >= fliste.Count then x := Fliste.Count - 1;
        if Fliste.Count <= FItemsShown then
          FItemOffset := 0
        else if x > (Fliste.Count - FItemsShown) then
          FItemOffset := Fliste.Count - FItemsShown
        else
          FItemOffset := x;

         Fitemindex:=x;
         Invalidate;
      end;
    else
  end;

inherited;
end;



procedure Tocombobox.MoveUp;
var
  Shift: boolean;
begin
  if fliste.Count > 0 then
  begin
    Shift := GetKeyState(VK_SHIFT) < 0;

    if (Fitemindex > (FItemOffset + FItemsShown)) or (Fitemindex < (FItemOffset)) then
    begin
      Fitemindex := FItemOffset;
    end
    else if (Fitemindex > 0) and (Fitemindex < Fliste.Count) then
    begin
      // SCROLL?????
      if ((Fitemindex - FItemOffset) = 0) and (FItemOffset > 0) then
        Dec(FItemOffset);

      Dec(Fitemindex);

    end;

  end;
end;

// -----------------------------------------------------------------------------

procedure Tocombobox.MoveDown;
var
  Shift: boolean;
begin
  if fliste.Count > 0 then
  begin
    Shift := GetKeyState(VK_SHIFT) < 0;

    if (Fitemindex > (FItemOffset + FItemsShown)) or (Fitemindex < (FItemOffset)) then
    begin
      Fitemindex := FItemOffset;
    end
    else if (Fitemindex >= 0) and (Fitemindex < Fliste.Count - 1) then
    begin
      Inc(Fitemindex);
      // SCROLL?????
      if (Fitemindex - FItemOffset) > FItemsShown - 1 then
        Inc(FItemOffset);
    end;

  end;
end;

// -----------------------------------------------------------------------------

procedure Tocombobox.MoveHome;
var
  i: integer;
begin
  if fliste.Count > 0 then
  begin
    Fitemindex := 0;
    FItemOffset := 0;
  end;
end;

// -----------------------------------------------------------------------------

procedure Tocombobox.MoveEnd;
var
  i: integer;
begin
  if fliste.Count > 0 then
  begin
    Fitemindex := Fliste.Count - 1;
    if (Fliste.Count - FItemsShown) >= 0 then
      FItemOffset := Fliste.Count - FItemsShown
    else
      FItemOffset := 0;
  end;
end;






{ ToSpinEdit }

procedure tospinedit.kclick(sender: tobject);
begin
  if sender=Fubutton then
       inc(fvalue)
  else if sender=Fdbutton then
       dec(fvalue);
 Fedit.Text:=inttostr(fvalue);
 Invalidate;
end;

function tospinedit.getmax: integer;
begin
  result:=Fmax;
end;

function tospinedit.getmin: integer;
begin
  result:=Fmin;
end;

function tospinedit.gettext: integer;
begin
  Result:=strtoint(Fedit.Text);
end;

procedure tospinedit.setbuttonheight(avalue: integer);
begin
  if Fbuttonheight<>AValue then Fbuttonheight:=AValue;
end;

procedure tospinedit.setbuttonwidth(avalue: integer);
begin
   if Fbuttonwidth<>AValue then Fbuttonwidth:=AValue;
end;

procedure tospinedit.setmax(avalue: integer);
begin
 if Fmax<>AValue then Fmax:=AValue;
end;

procedure tospinedit.setmin(avalue: integer);
begin
 if Fmin<>AValue then Fmin:=AValue;
end;

procedure tospinedit.settext(avalue: integer);
begin
 fvalue:=Avalue;//ValueRange(fvalue,fmin,fmax);
 fedit.Text:=IntToStr(fvalue);
end;

procedure tospinedit.keydown(sender: tobject; var key: word; shift: tshiftstate
  );
begin
 inherited KeyDown(Key, Shift);
 if Key=VK_UP then
 Inc(fvalue)
 else
 if Key=VK_DOWN then
 dec(fvalue);


  if (key=VK_UP) or (key=VK_DOWN) then
  Settext(fvalue);
end;

procedure tospinedit.resize;
begin
 if Assigned(Fubutton) then
   fubutton.SetBounds((self.Width-(Fbuttonwidth+(self.Background.Border*2))),self.Background.Border,Fbuttonwidth,Fbuttonheight);

 if Assigned(Fdbutton) then
   fdbutton.SetBounds((self.Width-(Fbuttonwidth+(self.Background.Border*2))),self.Height-(Fbuttonheight+self.Background.Border),Fbuttonwidth,Fbuttonheight);


  if Assigned(Fedit) then
  with Fedit do
  begin
   Width  := self.Width-(Fubutton.Width+self.Background.Border);
   Height := self.Height-(self.Background.Border *2);
   Left   := self.Background.Border;
   top    := self.Background.Border;
  end;
end;

constructor tospinedit.create(aowner: tcomponent);
begin
  inherited Create(AOwner);
   Backgroundcolored:=False;
  parent := TWinControl(Aowner);
  Width := 100;
  Height := 25;
  ControlStyle := ControlStyle - [csAcceptsControls] +
    [csParentBackground, csClickEvents, csCaptureMouse, csDoubleClicks];

  Fbuttonwidth  := 11;
  Fbuttonheight := 11;


  fubutton := Tobuton.Create(self);
  with fubutton do
  begin
   parent := self;
   Width  := self.Height div 2;
   Height := Width;
   Left   := self.Width-(Width+self.Background.Border);
   top    := self.Background.Border;
   OnClick :=@kclick;
   Caption :='▲';     //► ◄ ▲ ▼  // ALT+30 ALT+31 ALT+16 ALT+17
  end;


  Fdbutton := Tobuton.Create(self);
  with Fdbutton do
  begin
   parent := self;
   Width  := self.Height div 2;
   Height := Width;
   Left   := self.Width-(Width+self.Background.Border);
   top    := fdbutton.Height+self.Background.Border;
   OnClick :=@kclick;
   Caption :='▼';
  end;

  Fedit:=Toedit.Create(self);
  with Fedit do
  begin
    Parent := Self;
   Enabled:= true;
   Width  := self.Width-(Fubutton.Width+self.Background.Border);
   Height := self.Height-(self.Background.Border *2);
   Left   := self.Background.Border;
   top    := self.Background.Border;
   text   := '0';
   NumberOnly:=true;
   onChange:=@Feditchange;
  end;
  fedit.onKeyDown :=@KeyDown;

 fmin := 0;
 fmax := 0;
 fvalue:= 0;
end;

destructor tospinedit.destroy;
begin
  if Assigned(Fedit) then FreeAndNil(Fedit);
  if Assigned(Fdbutton) then FreeAndNil(Fdbutton);
  if Assigned(Fubutton) then FreeAndNil(Fubutton);
  inherited Destroy;
end;

procedure tospinedit.feditchange(sender: tobject);
begin
  fvalue:=strtoint(Fedit.Text);
end;

function tospinedit.getbuttonheight: integer;
begin
  Result:=Fbuttonheight;
end;

function tospinedit.getbuttonwidth: integer;
begin
  Result:=Fbuttonwidth;
end;

procedure tospinedit.paint;
begin
  inherited Paint;
end;



end.
