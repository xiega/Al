tableextension 50101 "WK-Table_Item_ex" extends Item
{
    fields
    {
        field(50101; "Height [cm]"; Decimal)
        {
            Caption = 'Height';
            DataClassification = ToBeClassified;
        }
        field(50102; "Width [cm]"; Decimal)
        {
            Caption = 'Width';
            DataClassification = ToBeClassified;
        }
        field(50103; "Length [cm]"; Decimal)
        {
            Caption = 'Length';
            DataClassification = ToBeClassified;
        }
        field(50104; "SizedBool"; Boolean)
        {
            Caption = 'SizedBool';
            DataClassification = ToBeClassified;
        }
        field(50105; "Bool"; Boolean)
        {
            Caption = 'Bool';
            DataClassification = ToBeClassified;
        }
    }
}
