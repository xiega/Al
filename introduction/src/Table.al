table 50104 Emp
{
    Caption = 'Emp Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Id"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Name"; Text[15])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Salary"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "City"; Enum City)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Gender"; Enum Gender)
        {
            DataClassification = ToBeClassified;
        }
        field(14; Email; Text[50])
        {
            DataClassification = ToBeClassified;
            InitValue = 'mail@gmail.com';
            trigger OnValidate()
            begin
                Codeu.vali(Email);
            end;
        }
    }

    keys
    {
        key(PK; "Id")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    begin
        Message('Data deleted');
    end;

    var
        Codeu: Codeunit MyCodeunit;
}