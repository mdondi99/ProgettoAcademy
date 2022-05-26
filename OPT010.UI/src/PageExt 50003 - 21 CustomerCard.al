pageextension 50003 "OPT PageExt50003" extends "Customer Card" // 21
{
    layout
    {
        modify("First Name")
        {
            ShowMandatory = Rec."Individual Person";
        }
        modify("Last Name")
        {
            ShowMandatory = Rec."Individual Person";
        }
        modify("Fiscal Code")
        {
            ShowMandatory = Rec."Individual Person";
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    // var
    //     myInt: Integer;
}