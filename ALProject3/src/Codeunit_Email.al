codeunit 50109 MyCodeunit
{
    procedure vali(Email: Text)
    var
        MyParametr: Text;
    begin
        Pattern := '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

        if Regex.IsMatch(Email, Pattern, 0) then
            Message('Match')
        else
            Message('No Match');

        MyParametr := 'Hello Subskrybent';
        OnAfterMailValidation(MyParametr);
    end;

    [IntegrationEvent(false, false)]
    procedure OnAfterMailValidation(EventParametr: Text);
    begin
    end;

    var
        Matches: Record Matches;
        Regex: Codeunit Regex;
        Pattern: Text;
        subskrybcja: Codeunit Sub;
}