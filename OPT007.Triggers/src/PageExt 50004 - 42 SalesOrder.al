pageextension 50004 "OPT PageExt50004" extends "Sales Order" // 42
{
    layout
    {
        modify("Ship-to Code")
        {
            trigger OnBeforeValidate()
            var
                ShipList: Record "Ship-to Address";
                ShipSelectErr: Label 'Cannot select a blocked address';
            begin
                if Rec."Ship-to Code" <> '' then begin
                    ShipList.Get(Rec."Sell-to Customer No.", Rec."Ship-to Code");
                    if ShipList.Blocked then begin
                        Error(ShipSelectErr);
                    end;
                end;
            end;
        }
    }

    trigger OnModifyRecord(): Boolean
    var
        ShipList: Record "Ship-to Address";
        ShipSelectErr: Label 'Cannot select a blocked address';

    begin
        if Rec."Ship-to Code" <> '' then begin
            ShipList.Get(Rec."Sell-to Customer No.", Rec."Ship-to Code");
            if ShipList.Blocked then begin
                Error(ShipSelectErr);
            end;
        end;
    end;
}