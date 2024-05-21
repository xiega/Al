pageextension 50106 "email in list" extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field("Email"; Rec."Email")
            {
                ApplicationArea = All;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Message('Dodany Email na końcu ');
    end;
}