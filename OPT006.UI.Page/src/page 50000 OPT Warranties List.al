page 50000 "OPT Warranties List"
{
    Caption = 'Warranties';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "OPT Warranty";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("OPT No."; Rec."OPT No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("OPT Description"; Rec."OPT Description")
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("OPT Starting Date"; Rec."OPT Starting Date")
                {
                    ToolTip = 'Specifies the value of the Starting Date field.';
                    ApplicationArea = All;
                }
                field("OPT Ending Date"; Rec."OPT Ending Date")
                {
                    ToolTip = 'Specifies the value of the Ending Date field.';
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        // area(Processing)
        // {
        //     action(ActionName)
        //     {
        //         ApplicationArea = All;

        //         trigger OnAction();
        //         begin

        //         end;
        //     }
        // }
    }
}