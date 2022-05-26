pageextension 50001 "OPT PageExt50001" extends "Ship-to Address List" //301
{
    layout
    {
        addafter(Name)
        {

            field(OPTBlocked; Rec.Blocked)
            {
                ToolTip = 'Specifies the value of the Blocked field.';
                ApplicationArea = All;
                Caption = 'Blocked';
            }
        }
    }

    actions
    {
        addafter("&Address")
        {
            action(OPTUnlockAddress)
            {
                Caption = 'Unlock Address';
                ApplicationArea = All;
                Image = Action;

                trigger OnAction()
                var
                    ShipAddrCard: Page "Ship-to Address";
                begin
                    Rec.Blocked := false;
                    ShipAddrCard.SetRecord(Rec);
                    ShipAddrCard.Editable(true);
                    Rec.Modify(true);
                    ShipAddrCard.Update(false);
                end;
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    var
        DeleteErr: Label 'Cannot delete address if blocked';
    begin
        if Rec.Blocked then begin
            Error(DeleteErr);
        end;
    end;


}