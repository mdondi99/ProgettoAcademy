page 50211 "PRJ Expression Card"
{
    Caption = 'Expression Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            group(Input)
            {
                Caption = 'Input';
                field(Value1; Value1)
                {
                    Caption = 'Value1';
                    ApplicationArea = All;

                }
                field(Value2; Value2)
                {
                    Caption = 'Value2';
                    ApplicationArea = All;

                }
            }
            group(Output)
            {
                Caption = 'Output';
                field(Result; Result)
                {
                    Caption = 'Output';
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
            action(Execute)
            {
                ApplicationArea = All;
                Caption = 'Execute';
                Image = ExecuteBatch;

                trigger OnAction()
                begin
                    Result := Value1 > Value2;
                end;
            }
        }
    }

    var
        Value1, Value2 : Integer;
        Result: Boolean;
}