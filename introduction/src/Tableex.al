tableextension 50105 Email extends Customer
{
    fields
    {
        field(50100; Email; Text[50])
        {
            Caption = 'Email';
            DataClassification = ToBeClassified;
            InitValue = 'mail@gmail.com';
        }
    }
}
