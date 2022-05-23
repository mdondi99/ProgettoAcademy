page 50210 "PRJ Data Types Card"
{
    Caption = 'Data Types Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;


    // layout
    // {
    //     area(Content)
    //     {
    //         group(GroupName)
    //         {
    //             field(Name; NameSource)
    //             {
    //                 ApplicationArea = All;

    //             }
    //         }
    //     }
    // }

    // actions
    // {

    //     area(Processing)
    //     {
    //         action(ActionName)
    //         {
    //             ApplicationArea = All;

    //             trigger OnAction()
    //             begin

    //             end;
    //         }
    //     }
    // }


    trigger OnOpenPage()
    begin
        Message('The value of %1 is %2', 'YesOrNo', YesOrNo);
        Message('The value of %1 is %2', 'Amount', Amount);
        Message('The value of %1 is %2', 'When Was It', "When Was It");
        Message('The value of %1 is %2', 'What Time', "What Time");
        Message('The value of %1 is %2', 'Description', Description);
        Message('The value of %1 is %2', 'Code Number', "Code Number");
        Message('The value of %1 is %2', 'Ch', Ch);
        Message('The value of %1 is %2', 'Color', Color);
    end;

    var
        YesOrNo: Boolean;
        Ch: Char;
        "Code Number": Code[10];
        "When Was It": Date;
        Amount: Decimal;
        LoopNo: Integer;
        Color: Option Red,Orange,Yellow,Green,Blue,Purple;
        Description: Text[30];
        "What Time": Time;
}