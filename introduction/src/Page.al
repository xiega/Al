page 50103 Emp
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Emp;

    layout
    {
        area(Content)
        {
            repeater(_Insert)
            {
                field(Id; Rec."Id")
                {
                    ApplicationArea = All;

                }
                field(Name; Rec."Name")
                {
                    ApplicationArea = All;

                }

                field(Salary; Rec."Salary")
                {
                    ApplicationArea = All;

                }
                field(City; Rec."City")
                {
                    ApplicationArea = All;

                }

                field(Gender; Rec."Gender")
                {
                    ApplicationArea = All;

                }

                field(Email; Rec."Email")
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Subskrybuj)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message('Zasubskrybowano');
                end;
            }
        }
    }
}