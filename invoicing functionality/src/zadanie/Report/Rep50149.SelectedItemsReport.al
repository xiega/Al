
report 50112 "Selected Items Report"
{
    Caption = 'Selected Items Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = MyLayout;

    dataset
    {
        dataitem("TempReportSelection"; "TempReportSelection")
        {
            column("InvoiceNo"; "Invoice No.")
            {
            }
            column("SelltoCustomerName"; "Sell-to Customer Name")
            {
            }
            column("SelltoAddress"; "Sell-to Address")
            {
            }
            column("SelltoCity"; "Sell-to City")
            {
            }
            column("SelltoPostCode"; "Sell-to Post Code")
            {
            }
            column("SelltoCountryRegionCode"; "Sell-to Country/Region Code")
            {
            }
            column(Description; Description)
            {
            }
            column("Height"; "Height [cm]")
            {
            }
            column("Width"; "Width [cm]")
            {
            }
            column("Length"; "Length [cm]")
            {
            }
            column(SizedBool; "SizedBool")
            {
            }
        }
    }

    rendering
    {
        layout(MyLayout)
        {
            Type = RDLC;
            LayoutFile = './src/zadanie/layout/mylayout.rdl';
        }
    }

    trigger OnPreReport()
    var
        codeunitt: codeunit "WK-EventPrint";
        TempTableItem: Record Item temporary;
        TempHeaderItem: Record "Sales Invoice Header" temporary;
        Item: Record Item;
    begin
        "TempReportSelection".Reset();
        "TempReportSelection".DeleteAll();
        codeunitt.GetTempItemTable(TempTableItem);
        TempHeaderItem := codeunitt.GetTempHeaderTable();
        If TempTableItem.FindSet() then begin
            repeat
                "TempReportSelection".Init();
                "TempReportSelection"."Invoice No." := TempHeaderItem."No.";
                "TempReportSelection"."Sell-to Customer Name" := TempHeaderItem."Sell-to Customer Name";
                "TempReportSelection"."Sell-to Address" := TempHeaderItem."Sell-to Address";
                "TempReportSelection"."Sell-to City" := TempHeaderItem."Sell-to City";
                "TempReportSelection"."Sell-to Post Code" := TempHeaderItem."Sell-to Post Code";
                "TempReportSelection"."Sell-to Country/Region Code" := TempHeaderItem."Sell-to Country/Region Code";
                "TempReportSelection"."Item No." := TempTableItem."No.";
                "TempReportSelection".Description := TempTableItem.Description;
                "TempReportSelection"."Height [cm]" := TempTableItem."Height [cm]";
                "TempReportSelection"."Width [cm]" := TempTableItem."Width [cm]";
                "TempReportSelection"."Length [cm]" := TempTableItem."Length [cm]";
                "TempReportSelection".SizedBool := TempTableItem.SizedBool;
                "TempReportSelection".Insert();
            until TempTableItem.Next() = 0;
        end;
    end;
}
