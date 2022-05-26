pageextension 50005 "OPT PageExt50005" extends "Item Card" // 30
{
    layout
    {
        // addafter(Item)
        // {
        //     group(Specifications)
        //     {
        //         Caption = 'Specifications';
        //         field("OPT Frame Type"; Rec."OPT Frame Type")
        //         {
        //             ToolTip = 'Specifies the value of the Frame Type field.';
        //             ApplicationArea = All;
        //         }

        //         field("OPT Frame Color"; Rec."OPT Frame Color")
        //         {
        //             ToolTip = 'Specifies the value of the Frame Color field.';
        //             ApplicationArea = All;
        //         }
        //         field("OPT Lenses Color"; Rec."OPT Lenses Color")
        //         {
        //             ToolTip = 'Specifies the value of the Lenses Color field.';
        //             ApplicationArea = All;
        //         }
        //         field("OPT Temples Color"; Rec."OPT Temples Color")
        //         {
        //             ToolTip = 'Specifies the value of the Temples Color field.';
        //             ApplicationArea = All;
        //         }

        //     }
        // }

        addbefore(ItemAttributesFactbox)
        {
            part(OPTFactWarr;"OPT Item Warranties List Part")
            {
                ApplicationArea = Basic,Suite;
                Caption= 'Item Warranties List';
                SubPageLink = "OPT Item No." = field("No.");
            }
        }
    }

    actions
    {
        addlast(ItemActionGroup)
        {
            action(Warranties)
            {
                ApplicationArea = All;
                Caption = 'Warranties';
                Image = List;
                Promoted = true;
                PromotedCategory = Category4;
                // PromotedIsBig = true;
                PromotedOnly = true;
                // RunObject = page "OPT Item Warranties List";
                // RunPageLink = "OPT Item No." = field("No.");


                trigger OnAction()
                var
                    Warranty: Record "OPT Item Warranties";
                    // Warranties: Page "OPT Item Warranties List";
                begin
                    // Warranty.SetFilter(Warranty."OPT Item No.", '=%1', Rec."No.");
                    Warranty.SetCurrentKey("OPT Item No.");
                    Warranty.SetRange("OPT Item No.", "No.");
                    Page.Run(Page::"OPT Item Warranties List", Warranty);
                    // Warranties.SetTableView(Warranty);
                    // if Warranties.RunModal() = Action::LookupOK then
                    //     Warranty."OPT Item No." := Rec."No.";
                end;
            }
        }
    }
}