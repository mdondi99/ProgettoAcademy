codeunit 50203 "PRJ Customer Overview Mgmt"
{
    trigger OnRun()
    begin

    end;

    var
        CustomerOverview: Record "PRJ CustomerOverview";
        Customer: Record Customer;
        SourceCode: Record "Source Code";
        GLEntry: Record "G/L Entry - VAT Entry Link";
        NextEntryNo: Integer;
}