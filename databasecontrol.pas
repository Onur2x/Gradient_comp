unit databasecontrol;


  {$mode ObjFPC}{$H+}

interface

uses
  Classes, LMessages,
    {$IFDEF UNIX}unix{$ELSE} Windows{$ENDIF}, SysUtils,
  Forms, Controls, Graphics, Messages, Dialogs,StdCtrls,
  ExtCtrls, Types, LCLType, LazUTF8,butonu,db;

type

  { TFieldDataLink }

  TFieldDataLink = class(TDataLink)
  private
    FField: TField;
    FFieldName: string;
    FControl: TComponent;
    // Callbacks
    FOnDataChange: TNotifyEvent;
    FOnEditingChange: TNotifyEvent;
    FOnUpdateData: TNotifyEvent;
    FOnActiveChange: TNotifyEvent;
    // Curent State of Affairs
    FEditing: Boolean;
    FEditingSourceSet: boolean;
    FEditingSource: Boolean;
    IsModified: Boolean;
    function FieldCanModify: boolean;
    function IsKeyField(aField: TField): Boolean;
    function GetCanModify: Boolean;
    // set current field
    procedure SetFieldName(const Value: string);
    procedure UpdateField;
    // make sure the field/fieldname is valid before we do stuff with it
    procedure ValidateField;
    procedure ResetEditingSource;
  protected
    // Testing Events
    procedure ActiveChanged; override;
    procedure EditingChanged; override;
    procedure LayoutChanged; override;
    procedure RecordChanged(aField: TField); override;
    procedure UpdateData; override;

    procedure FocusControl(aField: TFieldRef); Override;
  public
    constructor Create;
    // for control intitiating db changes etc
    function Edit: Boolean;

    procedure Modified;
    procedure Reset;

    // Attached control
    property Control: TComponent read FControl write FControl;

    // Basic DB interfaces
    property Field: TField read FField;
    property FieldName: string read FFieldName write SetFieldName;

    // Current State of DB
    property CanModify: Boolean read GetCanModify;
    property Editing: Boolean read FEditing;
    property EditingSource: boolean read FEditingSource;

    // Our Callbacks
    property OnDataChange: TNotifyEvent read FOnDataChange write FOnDataChange;
    property OnEditingChange: TNotifyEvent read FOnEditingChange write FOnEditingChange;
    property OnUpdateData: TNotifyEvent read FOnUpdateData write FOnUpdateData;
    property OnActiveChange: TNotifyEvent read FOnActiveChange write FOnActiveChange;
  end;

  { TODBEdit }

  TODBEdit = class(Toedit)
  private
    FDataLink: TFieldDataLink;
    procedure DataChange(Sender: TObject);
    function editcanmodify: boolean;
    procedure reset;
    procedure UpdateData(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure CMGetDataLink(var Message: TLMessage); message CM_GETDATALINK;

  protected

    procedure SetReadOnly(Value: Boolean); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure UTF8KeyPress(var UTF8Key: TUTF8Char); override;

    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

//    function EditCanModify: Boolean; override;
    function GetText: string; override;
    procedure dochange; override;
    function GetReadOnly: Boolean; override;
//    procedure Change; override;
//    procedure Reset; override;

    procedure WMSetFocus(var Message: TLMSetFocus); message LM_SETFOCUS;
    procedure WMKillFocus(var Message: TLMKillFocus); message LM_KILLFOCUS;
    procedure WndProc(var Message: TLMessage); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ExecuteAction(AAction: TBasicAction): Boolean; override;
    function UpdateAction(AAction: TBasicAction): Boolean; override;
    property Field: TField read GetField;
  published
 //   property CustomEditMask: Boolean read FCustomEditMask write FCustomEditMask default False;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;

    property Align;
    property Anchors;
    property AutoSize;
    property BiDiMode;
    property BorderSpacing;
    property BorderStyle;
    property CharCase;
    property Color;
    property Constraints;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ParentBiDiMode;
    property ParentColor;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnChange;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditingDone;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnStartDrag;
    property OnUTF8KeyPress;
  end;



  { TODBText }

  TODBText = class(TCustomLabel)
  private
    FDataLink: TFieldDataLink;

    procedure DataChange(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;

    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure CMGetDataLink(var Message: TLMessage); message CM_GETDATALINK;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ExecuteAction(AAction: TBasicAction): Boolean; override;
    function UpdateAction(AAction: TBasicAction): Boolean; override;
    property Field: TField read GetField;
  published
    property Align;
    property Alignment;
    property Anchors;
    property AutoSize;
    property BidiMode;
    property BorderSpacing;
    property Color;
    property Constraints;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property FocusControl;
    property Font;
    property Layout;
    property ParentBidiMode;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowAccelChar;
    property ShowHint;
    property Transparent;
    property Visible;
    property WordWrap;
    property OnClick;
    property OnDblClick;
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
    property OnChangeBounds;
    property OnContextPopup;
    property OnResize;
    property OnStartDrag;
    property OptimalFill;
  end;

  { TOCustomDBListBox }

  TOCustomDBListBox = class(TOListBox)
  private
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;

    function GetReadOnly: Boolean;
    procedure SetReadOnly(Value: Boolean);

    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure CMGetDataLink(var Message: TLMessage); message CM_GETDATALINK;
  protected
    FDataLink: TFieldDataLink;
    procedure DataChange(Sender: TObject); virtual; abstract;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure UpdateData(Sender: TObject); virtual; abstract;
    // we need to override the Items Write method for db aware.
    procedure SetString(Values : TStrings); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ExecuteAction(AAction: TBasicAction): Boolean; override;
    function UpdateAction(AAction: TBasicAction): Boolean; override;
    property Field: TField read GetField;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;

    //same as dbedit need to match the datalink status
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
  end;

  { TDBListBox }

  { TODBListBox }

  TODBListBox = class(TOCustomDBListBox)
  protected
    procedure DataChange(Sender: TObject); override;
//    procedure DoSelectionChange(User: Boolean); override;
    procedure UpdateData(Sender: TObject); override;
  public
    procedure EditingDone; override;
  published
    property Align;
    property Anchors;
    property BiDiMode;
    property BorderSpacing;
    property BorderStyle;
    property Color;
    property Constraints;
    property DataField;
    property DataSource;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ItemHeight;
    property Items;
//    property MultiSelect;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
//    property OnDrawItem;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyPress;
    property OnKeyDown;
    property OnKeyUp;
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
    property OnUTF8KeyPress;
//    property Options;
    property ParentBiDiMode;
    property ParentDoubleBuffered;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
//    property Sorted;
//    property Style;
    property TabOrder;
    property TabStop;
//    property TopIndex;
    property Visible;
  end;

procedure Register;

implementation
var
  FieldClasses: TFpList;
 
procedure Register;
begin
  RegisterComponents('Standard', [TODBText]);
  RegisterComponents('Standard', [TODBEdit]);
  RegisterComponents('Standard', [TODBListBox]);

end;

procedure RegField(const FieldClass: TFieldClass);
begin
  if FieldClasses = nil then FieldClasses := TFpList.Create;
  if (FieldClass <> Nil) And (FieldClasses.IndexOf(FieldClass) = -1) then
  begin
    FieldClasses.Add(FieldClass);
    RegisterNoIcon([FieldClass]);
   Classes.RegisterClass(FieldClass);
  end;
end;

procedure RegFields(const AFieldClasses: array of TFieldClass);
var I: Integer;
begin
  for I := Low(AFieldClasses) to High(AFieldClasses) do
    RegField(AFieldClasses[I]);
end;

procedure ChangeDataSource(AControl: TControl; Link: TDataLink;
  NewDataSource: TDataSource);
begin
  if Link.DataSource=NewDataSource then exit;
  if Link.DataSource<>nil then
    Link.DataSource.RemoveFreeNotification(AControl);
  Link.DataSource:=NewDataSource;
  if Link.DataSource<>nil then
    Link.DataSource.FreeNotification(AControl);
end;

function FieldIsEditable(Field: TField): boolean;
begin
  result := (Field<>nil) and (not Field.Calculated) and
            (Field.DataType<>ftAutoInc) and (Field.FieldKind<>fkLookup)
end;

function FieldCanAcceptKey(Field: TField; AKey: char): boolean;
begin
  Result := FieldIsEditable(Field) and Field.IsValidChar(AKey);
end;

{ TODBListBox }

procedure todblistbox.datachange(sender: tobject);
var
  DataLinkField: TField;
begin
  DataLinkField := FDataLink.Field;
  if Assigned(DataLinkField) then
    ItemIndex := Items.IndexOf(DataLinkField.Text)
  else
    ItemIndex := -1;

end;
{
procedure todblistbox.doselectionchange(user: boolean);
begin
 if User then
  begin
    if FDataLink.CanModify then
    begin
      //protect against undesired call to DataChange
      FDataLink.OnDataChange := nil;
      if FDataLink.Edit then
        FDataLink.Modified;
      FDataLink.OnDataChange := @DataChange;
    end
    else
      DataChange(Self);
  end;
  inherited DoSelectionChange(User);
end;
 }
procedure todblistbox.updatedata(sender: tobject);
begin
 if ItemIndex >= 0 then
    FDataLink.Field.Text := Items[ItemIndex];
end;

procedure todblistbox.editingdone;
begin
 FDataLink.UpdateRecord;
  inherited editingdone;
end;

{ TOCustomDBListBox }

function tocustomdblistbox.getdatafield: string;
begin
    Result := FDataLink.FieldName;
end;

function tocustomdblistbox.getdatasource: tdatasource;
begin
  Result := FDataLink.DataSource;
end;

function tocustomdblistbox.getfield: tfield;
begin
  Result := FDataLink.Field;
end;

function tocustomdblistbox.getreadonly: boolean;
begin
 Result := FDataLink.ReadOnly;
end;

procedure tocustomdblistbox.setreadonly(value: boolean);
begin
 FDataLink.ReadOnly := Value;
end;

procedure tocustomdblistbox.setdatafield(const value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure tocustomdblistbox.setdatasource(value: tdatasource);
begin
  ChangeDataSource(Self,FDataLink,Value);
end;

procedure tocustomdblistbox.cmgetdatalink(var message: tlmessage);
begin
  Message.Result := PtrUInt(FDataLink);
end;

procedure tocustomdblistbox.keydown(var key: word; shift: tshiftstate);
begin
   inherited KeyDown(Key,Shift);
  case Key of
  VK_ESCAPE:
    begin
      //cancel out of editing by reset on esc
      FDataLink.Reset;
      Key := VK_UNKNOWN;
    end;
  VK_DOWN, VK_UP:
    begin
      FDataLink.Edit;
    end;
  end;
end;

procedure tocustomdblistbox.notification(acomponent: tcomponent;
  operation: toperation);
begin
  inherited notification(acomponent, operation);
    if (Operation=opRemove) then begin
    if (FDataLink<>nil) and (AComponent=DataSource) then
      DataSource:=nil;
  end;
end;

procedure tocustomdblistbox.setstring(values: tstrings);
begin
   Items.Assign(Values);
  DataChange(Self);
end;

constructor tocustomdblistbox.create(aowner: tcomponent);
begin
  inherited create(aowner);
    FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := @DataChange;
  FDataLink.OnUpdateData := @UpdateData;
end;

destructor tocustomdblistbox.destroy;
begin
  FDataLink.Destroy;
  inherited destroy;
end;

function tocustomdblistbox.executeaction(aaction: tbasicaction): boolean;
begin
  Result := inherited ExecuteAction(AAction) or
            (FDataLink <> nil) and FDataLink.ExecuteAction(AAction);
end;

function tocustomdblistbox.updateaction(aaction: tbasicaction): boolean;
begin
  Result := inherited UpdateAction(AAction) or
              (FDataLink <> nil) and FDataLink.UpdateAction(AAction);
end;

{ TODBText }

procedure todbtext.datachange(sender: tobject);
begin
  if FDataLink.Field <> nil then
    Caption := FDataLink.Field.DisplayText
  // This designing check avoids getting a 1x1 control in design mode,
  // see http://bugs.freepascal.org/view.php?id=19021
  else if csDesigning in ComponentState then
    Caption := Name
  else
    Caption := '';
end;

function todbtext.getdatafield: string;
begin
  Result := FDataLink.FieldName;
end;

function todbtext.getdatasource: tdatasource;
begin
 Result := FDataLink.DataSource;
end;

function todbtext.getfield: tfield;
begin
   Result := FDataLink.Field;
end;

procedure todbtext.setdatafield(const value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure todbtext.setdatasource(value: tdatasource);
begin
  ChangeDataSource(Self,FDataLink,Value);
end;

procedure todbtext.cmgetdatalink(var message: tlmessage);
begin
    Message.Result := PtrUInt(FDataLink);
end;

procedure todbtext.notification(acomponent: tcomponent; operation: toperation);
begin
  inherited notification(acomponent, operation);
    // if the datasource is being removed then we need to make sure
  // we are updated or we can get AV/Seg's *cough* as I foolishly
  // discovered firsthand....
  if (Operation=opRemove) then begin
    if (FDataLink<>nil) and (AComponent=DataSource) then
      DataSource:=nil;
  end;
end;


procedure todbtext.loaded;
begin
  inherited loaded;
   if csDesigning in ComponentState then
    Caption := Name
end;

constructor todbtext.create(aowner: tcomponent);
begin
  inherited create(aowner);
    FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := @DataChange;
end;

destructor todbtext.destroy;
begin
  FDataLink.Free;
  inherited Destroy;
end;

function todbtext.executeaction(aaction: tbasicaction): boolean;
begin

    Result := inherited ExecuteAction(AAction) or
            (FDataLink <> nil) and FDataLink.ExecuteAction(AAction);
end;

function todbtext.updateaction(aaction: tbasicaction): boolean;
begin
  Result := inherited UpdateAction(AAction) or
             (FDataLink <> nil) and FDataLink.UpdateAction(AAction);
end;

{ TDBEdit }

procedure todbedit.datachange(sender: tobject);
var
  DataLinkField: TField;
begin
  DataLinkField := FDataLink.Field;
  if DataLinkField <> nil then begin
    //use Field EditMask by default
//    if not FCustomEditMask then
//      EditMask := DataLinkField.EditMask;
///    Alignment := DataLinkField.Alignment;

    //if we are focused its possible to edit,
    //if the field is currently modifiable
 //  if FDatalink.CanModify then
      //display the real text since we can modify it
 //     RestoreMask(DatalinkField.Text);
      Text:=DatalinkField.Text;


 //   end else
      //otherwise display the pretified/formated text since we can't
 //     DisableMask(DataLinkField.DisplayText);
 //   if (DataLinkField.DataType in [ftString, ftFixedChar, ftWidestring, ftFixedWideChar])
 //     and (MaxLength = 0) then
 //     MaxLength := DatalinkField.Size;
  end
  else begin
    Text := '';
  end;
  Invalidate;

end;

procedure todbedit.updatedata(sender: tobject);
begin
  FDataLink.Field.Text := Text;
end;

function todbedit.getdatafield: string;
begin
  Result := FDataLink.FieldName;
end;

function todbedit.getdatasource: tdatasource;
begin
 Result := FDataLink.DataSource;
end;

function todbedit.getfield: tfield;
begin
  Result := FDataLink.Field;
end;


function TODBEdit.getreadonly: boolean;
begin
 // result:=inherited getreadonly;
   Result := FDataLink.ReadOnly;
end;


procedure todbedit.setdatafield(const value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure todbedit.setdatasource(value: tdatasource);
begin
 ChangeDataSource(Self,FDataLink,Value);
end;

procedure todbedit.cmgetdatalink(var message: tlmessage);
begin
  Message.Result := PtrUInt(FDataLink);
end;


procedure todbedit.setreadonly(value: boolean);
begin
  inherited;
  FDataLink.ReadOnly := Value;
end;


procedure todbedit.keydown(var key: word; shift: tshiftstate);
begin
  inherited keydown(key, shift);
  case key of
    VK_ESCAPE:
      begin
        //cancel out of editing by reset on esc, but only when in editing mode
        if FDataLink.Editing then begin
          FDataLink.Reset;
 //         SelectAll;
          Key := VK_UNKNOWN;
        end;
      end;
    VK_DELETE, VK_BACK:
      begin
        if not FieldIsEditable(FDatalink.Field) or not FDataLink.Edit then
          Key := VK_UNKNOWN;
      end;
    VK_RETURN:
      if FDatalink.Editing then // soner: take changes, without this you must
        FDatalink.UpdateRecord; // change focus to other dbctrl
  end;
end;

procedure todbedit.utf8keypress(var utf8key: tutf8char);
  var
  CharKey: Char;
begin
  inherited UTF8KeyPress(UTF8Key);
  //If the pressed key is unicode then map the char to #255
  //Necessary to keep the TField.IsValidChar check
  if Length(UTF8Key) = 1 then
    CharKey := UTF8Key[1]
  else
    CharKey := #255;

  //handle standard keys
  if CharKey in [#32..#255] then
  begin
    if not FieldCanAcceptKey(FDataLink.Field, CharKey) or not FDatalink.Edit then
      UTF8Key := '';
  end;
end;

procedure todbedit.notification(acomponent: tcomponent; operation: toperation);
begin
  inherited notification(acomponent, operation);
  if (Operation=opRemove) then begin
    if (FDataLink<>nil) and (AComponent=DataSource) then
      DataSource:=nil;
end;

end;



function todbedit.editcanmodify: boolean;
begin
 Result := FDataLink.CanModify;
end;

function todbedit.gettext: string;
begin
  if not (csDesigning in ComponentState) and not FDatalink.Active then begin
      Result := '';
      exit;
    end;
    Result:=inherited GetText;
end;

procedure todbedit.dochange;
begin
  FDataLink.Modified;
  inherited DoChange;
end;


procedure TODBEdit.reset;
begin
  FDataLink.reset;
  //inherited Reset;
end;

procedure todbedit.wmsetfocus(var message: tlmsetfocus);
//  var
 //   EditOnFocus: Boolean;
  begin
    // update text before inherited so DoEnter has the new text
//    if not FFocusedDisplay then
 //   begin
  //    FFocusedDisplay := True;
      // some widgetsets do not notify clipboard actions properly. Put at edit state at entry
 //     EditOnFocus := WidgetSet.GetLCLCapability(lcReceivesLMClearCutCopyPasteReliably) = LCL_CAPABILITY_NO;
 //     if EditOnFocus then
//      begin
        if FDataLink.Edit then
        text:=FDataLink.Field.Text;
 //     end
 //     else
//        FDataLink.Reset;
 //   end;
    inherited WMSetFocus(Message);

end;

procedure todbedit.wmkillfocus(var message: tlmkillfocus);
begin
    inherited WMKillFocus(Message);
//  FFocusedDisplay := False;
  if csDestroying in ComponentState then Exit;
  if FDatalink.Editing then
  begin
    FDatalink.UpdateRecord;
    //check for Focused before disabling the mask since SetFocus can be called
    //inside events propagated by WMKillFocus or UpdateRecord
    if not Focused then
    begin
 //     DisableMask(FDataLink.Field.DisplayText);
      Text:=FDataLink.Field.DisplayText;
      //reset the modified flag that is changed after setting the text
      FDataLink.IsModified := False;
    end;
  end
  else
    FDatalink.Reset;
end;

procedure todbedit.wndproc(var message: tlmessage);
begin
  case Message.Msg of
    LM_CLEAR,
    LM_CUT,
    LM_PASTE:
      begin
        if FDataLink.CanModify then
        begin
          //LCL changes the Text before LM_PASTE is called and not after like Delphi. Issue 20330
          //When Edit is called the Text property is reset to the previous value
          //Add a workaround while bug is not fixed
          FDataLink.OnDataChange := nil;
          FDatalink.Edit;
          FDataLink.Modified;
          FDataLink.OnDataChange := @DataChange;
          inherited WndProc(Message);
        end
        else
          Message.Result := 1; // prevent calling default window proc
      end;
    else
      inherited WndProc(Message);
  end;
end;

constructor todbedit.create(aowner: tcomponent);
begin
 inherited Create(AOwner);
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := @DataChange;
  FDataLink.OnUpdateData := @UpdateData;
end;

destructor todbedit.destroy;
begin
  FDataLink.Destroy;
  inherited Destroy;
end;

function todbedit.executeaction(aaction: tbasicaction): boolean;
begin
  Result := inherited ExecuteAction(AAction) or
           (FDataLink <> nil) and FDataLink.ExecuteAction(AAction);
end;

function todbedit.updateaction(aaction: tbasicaction): boolean;
begin
     Result := inherited UpdateAction(AAction) or
            (FDataLink <> nil) and FDataLink.UpdateAction(AAction);
end;

{ TFieldDataLink }

function TFieldDataLink.FieldCanModify: boolean;
var
  FieldList: TList;
  i: Integer;
begin
  result := Assigned(FField);
  if not result then
    exit;

  if FField.FieldKind=fkLookup then
  begin
    FieldList := TList.Create;
    try
      DataSet.GetFieldList(FieldList, FField.KeyFields);
      result := (FieldList.Count>0);
      i := 0;
      while result and (i<FieldList.Count) do
      begin
        result := TField(FieldList[i]).CanModify;
        inc(i);
      end;
    finally
      FieldList.Free;
    end;
  end else
    result := FField.CanModify;
end;

function TFieldDataLink.IsKeyField(aField: TField): Boolean;
var
  KeyFieldName, KeyFields: String;
  StrPos: Integer;
begin
  KeyFields := FField.KeyFields;
  StrPos := 1;
  while StrPos <= Length(KeyFields) do
  begin
    KeyFieldName := ExtractFieldName(KeyFields, StrPos);
    if SameText(aField.FieldName, KeyFieldName) then
    begin
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;

{TFieldDataLink  Private Methods}
{
  If the field exists and can be modified, then
  we CanModify as long as this hasn't been set
  ReadOnly somewhere else. Do we need any extra tests here?
}
function TFieldDataLink.GetCanModify: Boolean;
begin
  if FieldCanModify then
    Result := not ReadOnly
  else
    Result := False;
end;

{
  Set the FieldName and then notify the changes though EditingChanged and Reset
  Ensure FField is nil if something goes wrong or FieldName is empty
}
procedure TFieldDataLink.SetFieldName(const Value: string);
begin
  if FFieldName <> Value then
  begin
    FFieldName := Value;
    UpdateField;
    if Active then
    begin
      EditingChanged;
      Reset;
    end;
  end;
end;

procedure TFieldDataLink.UpdateField;
begin
  if Active and (FFieldName <> '') then
    FField := DataSet.FieldByName(FFieldName)
  else
    FField := nil;
end;

{
  This function checks if FField is still associated with the dataset
  If not update the field
}
procedure TFieldDataLink.ValidateField;
begin
  if not (DataSet.FindField(FFieldName) = FField) then
    UpdateField;
end;

procedure TFieldDataLink.ResetEditingSource;
begin
  FEditingSource := false;
  FEditingSourceSet := false;
end;

{TFieldDataLink  Protected Methods}

procedure TFieldDataLink.ActiveChanged;
begin
  if FFieldName <> '' then
  begin
    UpdateField;
    EditingChanged;
    Reset;
  end;
  if Assigned(FOnActiveChange) then
    FOnActiveChange(Self);
end;

procedure TFieldDataLink.EditingChanged;
var
  RealEditState : Boolean;
begin
  RealEditState := (CanModify and Inherited Editing);

  if (FEditing <> RealEditState) then
  begin
    FEditing := RealEditState;
    if not FEditing then
    begin
      IsModified := False;
      ResetEditingSource;
    end;
    if Assigned(FOnEditingChange) then
      FOnEditingChange(Self);
  end;
end;


procedure TFieldDataLink.LayoutChanged;
begin
  ValidateField;
  if FField <> nil then
  begin
    EditingChanged;
    RecordChanged(nil);
  end;
end;


procedure TFieldDataLink.RecordChanged(aField: TField);
begin
  if (aField = nil) or (aField = FField) or
   ((FField <> nil) and (FField.FieldKind = fkLookup) and IsKeyField(aField)) then
    Reset;
end;


procedure TFieldDataLink.UpdateData;
begin
  if not IsModified then
    exit;
  try
    if Assigned(FOnUpdateData) then
      FOnUpdateData(Self);
  finally
    IsModified := False;
  end;
end;



procedure TFieldDataLink.FocusControl(aField: TFieldRef);
var
  WinControl: TWinControl;
begin
  if Assigned(aField) and (aField^ = FField) and (FControl is TWinControl) then
  begin
    WinControl := TWinControl(FControl);
    if WinControl.CanFocus then
    begin
      aField^ := nil;
      WinControl.SetFocus;
    end;
  end;
end;



constructor TFieldDataLink.Create;
begin
  inherited Create;
  VisualControl := True;
  //FField := nil;
  //FFieldname := '';
end;


function TFieldDataLink.Edit: Boolean;
var
  editingSrc: Boolean;
begin
  editingSrc := (not FEditing) and (Dataset<>nil) and not(Dataset.State in dsEditModes);

  if (not FEditing) and CanModify then
    inherited Edit;

  Result := FEditing;

  if not FEditingSourceSet then
  begin
    // should be triggered one time only if editing succeeded
    FEditingSource := FEditing and editingSrc;
    FEditingSourceSet := true;
  end;
end;


procedure TFieldDataLink.Modified;
begin
  IsModified := True;
end;


procedure TFieldDataLink.Reset;
begin
  if Assigned(FOnDataChange) then
    FOnDataChange(Self);

  IsModified := False;
  ResetEditingSource;
end;

end.
