table 50111 "TempReportSelection"
{
    Caption = 'Temporary Table';
    TableType = Temporary;

    fields
    {
        field(1; "Invoice No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Sell-to Customer Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(3; "Sell-to Address"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(4; "Sell-to City"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(5; "Sell-to Post Code"; Text[20])
        {
            DataClassification = CustomerContent;
        }
        field(6; "Sell-to Country/Region Code"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(12; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Height [cm]"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Width [cm]"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Length [cm]"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17; SizedBool; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Item No.")
        {
            Clustered = true;
        }
    }
}