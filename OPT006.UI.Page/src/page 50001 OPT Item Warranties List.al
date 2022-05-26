page 50001 "OPT Item Warranties List"
{
    Caption = 'Item Warranties List';
    PageType = List;
    // ApplicationArea = Basic, Suite;
    // UsageCategory = Lists;
    SourceTable = "OPT Item Warranties";

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
                    trigger OnValidate()
                    var
                        Warranties: Record "OPT Warranty";
                    begin
                        Warranties.Get(Rec."OPT Warranty No.");
                        Rec."OPT Description" := Warranties."OPT Description";
                        Rec."OPT Starting Date" := Warranties."OPT Starting Date";
                        Rec."OPT Ending Date" := Warranties."OPT Ending Date";

                        CurrPage.Update(true);
                    end;

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
                    Editable = false;
                }


            }
        }

    }


    actions
    {
        area(Processing)
        {
            action(Warranties)
            {
                ApplicationArea = All;
                RunObject = page "OPT Warranties List";
                Caption = 'Warranties';
                Image = ListPage;
            }
        }
    }
    // var
    //     ItemNo: Code[20];
}