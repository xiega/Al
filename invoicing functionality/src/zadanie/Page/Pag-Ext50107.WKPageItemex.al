pageextension 50107 "WK-Page-Item-ex" extends "Item Card"
{
    layout
    {
        addafter("Item")
        {
            group("Dimensions")
            {
                field("Height [cm]"; Rec."Height [cm]")
                {
                    ApplicationArea = All;
                }
                field("Width [cm]"; Rec."Width [cm]")
                {
                    ApplicationArea = All;
                }
                field("Length [cm]"; Rec."Length [cm]")
                {
                    ApplicationArea = All;
                }
                field("SizedBool"; Rec."SizedBool")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
