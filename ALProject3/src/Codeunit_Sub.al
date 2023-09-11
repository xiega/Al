codeunit 50110 Sub
{
    procedure sub()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"MyCodeunit", 'OnAfterMailValidation', '', false, false)]
    local procedure OnAfterMailValidationSubscriber(EventParametr: Text);
    var

    begin
        Message(EventParametr);
    end;

    var
        myInt: Integer;
}