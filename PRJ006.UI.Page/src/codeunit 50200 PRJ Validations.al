codeunit 50200 "PRJ Validations"
{
    trigger OnRun()
    begin

    end;

    local procedure CheckForPlusSign(TextToVerify: Text)
    var
        MessageLbl: Label 'The ''+'' sign is%1present in %2';
    begin
        if (Text.StrPos(TextToVerify, '+') > 0) then begin
            Message(MessageLbl, ' ', TextToVerify);
        end
        else begin
            Message(MessageLbl, ' not ', TextToVerify);
        end;
    end;



    [EventSubscriber(ObjectType::Page, Page::"Customer Card", 'OnBeforeValidateEvent', 'Address', false, false)]
    local procedure OnBeforeValidateAddress(Rec: Record Customer; xRec: Record Customer)
    begin
        CheckForPlusSign(Rec.Address);
    end;


}