pageextension 50000 "OPT PageExt50000" extends "Ship-to Address" //300
{
    layout
    {
        addlast(General)
        {

            field(Blocked; Rec.Blocked)
            {

                ToolTip = 'Specifies the value of the Blocked field.';
                ApplicationArea = All;
                Caption = 'Blocked';

                trigger OnValidate()
                var
                    ShipAddrCard: Page "Ship-to Address";


                // ShipCode
                begin
                    if Rec.Blocked then begin
                        ShipAddrCard.SetRecord(Rec);
                        CurrPage.Close();
                        ShipAddrCard.Editable := false;
                        ShipAddrCard.Run();
                    end;
                end;

            }
        }
    }



    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage()
    begin
        if Rec.Blocked then begin
            CurrPage.Editable(false);
        end;

    end;
}