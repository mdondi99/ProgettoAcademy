page 50215 "PRJ Customer Overview List"
{
    Caption = 'Customer Overview List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "PRJ CustomerOverview";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(MovementNo; MovementNo)
                {
                    ApplicationArea = All;
                }
                field(ClientNo; ClientNo)
                {
                    ApplicationArea = All;

                }
                field(ClientName; ClientName)
                {
                    ApplicationArea = All;
                }
                field(SourceCode; SourceCode)
                {
                    ApplicationArea = All;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = All;
                }
                field(LastRunDate; LastRunDate)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    // actions
    // {
    //     area(Processing)
    //     {
    //         action(ActionName)
    //         {
    //             ApplicationArea = All;

    //             trigger OnAction();
    //             begin

    //             end;
    //         }
    //     }
    // }
}