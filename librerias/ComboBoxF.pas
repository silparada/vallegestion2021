unit ComboBoxF;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils, ExtCtrls;

type
  TComboBoxF = class(StdCtrls.TComboBox)
  private
    FStoredItems: TStringList;
    procedure FilterItems;
    procedure StoredItemsChange(Sender: TObject);
    procedure SetStoredItems(const Value: TStringList);
    procedure CNCommand(var AMessage: TWMCommand); message CN_COMMAND;
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property StoredItems: TStringList read FStoredItems write SetStoredItems;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TComboBoxF]);
end;

{}constructor TComboBoxF.Create(AOwner: TComponent);
    begin
      inherited;
      AutoComplete := False;
      FStoredItems := TStringList.Create;
      FStoredItems.OnChange := StoredItemsChange;
    end;

{}destructor TComboBoxF.Destroy;
    begin
      FStoredItems.Free;
      inherited;
    end;

{}procedure TComboBoxF.CNCommand(var AMessage: TWMCommand);
    begin
      // we have to process everything from our ancestor
      inherited;
      // if we received the CBN_EDITUPDATE notification
      if AMessage.NotifyCode = CBN_EDITUPDATE then begin
        // fill the items with the matches
        FilterItems;
      end;
    end;

{}procedure TComboBoxF.FilterItems;
    type
      TSelection = record
        StartPos, EndPos: Integer;
      end;
    var
      I: Integer;
      Selection: TSelection;
      xText: string;
    begin
      // store the current combo edit selection
      SendMessage(Handle, CB_GETEDITSEL, WPARAM(@Selection.StartPos), LPARAM(@Selection.EndPos));

      // begin with the items update
      Items.BeginUpdate;
      try
        // if the combo edit is not empty, then clear the items
        // and search through the FStoredItems
        if Text <> '' then begin
          // clear all items
          Items.Clear;
          // iterate through all of them
          for I := 0 to FStoredItems.Count - 1 do begin
            // check if the current one contains the text in edit
    //      if ContainsText(FStoredItems[I], Text) then
            if Pos( Text, FStoredItems[I])>0 then begin
              // and if so, then add it to the items
              Items.Add(FStoredItems[I]);
            end;
          end;
        end else begin
          // else the combo edit is empty
          // so then we'll use all what we have in the FStoredItems
          Items.Assign(FStoredItems)
        end;
      finally
        // finish the items update
        Items.EndUpdate;
      end;

      // and restore the last combo edit selection
      xText := Text;
      SendMessage(Handle, CB_SHOWDROPDOWN, Integer(True), 0);
      if (Items<>nil) and (Items.Count>0) then begin
        ItemIndex := 0;
      end else begin
        ItemIndex := -1;
      end;
      Text := xText;
      SendMessage(Handle, CB_SETEDITSEL, 0, MakeLParam(Selection.StartPos, Selection.EndPos));

    end;

{}procedure TComboBoxF.StoredItemsChange(Sender: TObject);
    begin
      if Assigned(FStoredItems) then
        FilterItems;
    end;

{}procedure TComboBoxF.SetStoredItems(const Value: TStringList);
    begin
      if Assigned(FStoredItems) then
        FStoredItems.Assign(Value)
      else
        FStoredItems := Value;
    end;


end.
