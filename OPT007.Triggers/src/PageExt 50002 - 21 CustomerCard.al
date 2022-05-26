pageextension 50002 "OPT PageExt50002" extends "Customer Card" // 21
{
    layout
    {
    }

    actions
    {
        // Add changes to page actions here
    }


    trigger OnModifyRecord(): Boolean
    var
        Customer: Record Customer;
        ShipList: Record "Ship-to Address";

        FirstNameErr: Label 'First Name field must be filled';
        FiscalCodeErr: Label 'Fiscal Code field must be filled';
        LastNameErr: Label 'Last Name field must be filled';
        ShipSelectErr: Label 'Cannot select a blocked address';

    begin


        Customer := Rec;
        if Customer."Individual Person" then begin
            if (Customer."First Name" = '') then begin
                Error(FirstNameErr);
            end;
            if (Customer."Last Name" = '') then begin
                Error(LastNameErr);
            end;
            if (Customer."Fiscal Code" = '') then begin
                Error(FiscalCodeErr);
            end;
        end;

        if Rec."Ship-to Code" <> '' then begin
            ShipList.Get(Rec."No.", Rec."Ship-to Code");
            if ShipList.Blocked then begin
                Error(ShipSelectErr);
            end;
        end;
    end;

    // var
    //     myInt: Integer;
}