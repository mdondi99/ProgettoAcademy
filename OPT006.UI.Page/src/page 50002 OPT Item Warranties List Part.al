page 50002 "OPT Item Warranties List Part"
{
    Caption = 'Item Warranties';
    PageType = ListPart;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    RefreshOnActivate = true;
    SourceTable = "OPT Item Warranties";
    // SourceTableTemporary = true;
    // ApplicationArea = All;
    // UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("OPT Item No."; Rec."OPT Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                    ApplicationArea = All;

                }

                field("OPT Warranty No."; Rec."OPT Warranty No.")
                {
                    ToolTip = 'Specifies the value of the Warranty No. field.';
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
                    // Editable = false;
                }


            }
        }

    }
}