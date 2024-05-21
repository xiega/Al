codeunit 50101 "WK-EventPrint"
{
    SingleInstance = true;

    var
        TempTableItem: Record Item temporary;
        TempTableHeader: Record "Sales Invoice Header" temporary;

    [EventSubscriber(ObjectType::Page, Page::"Posted Sales Invoice", 'OnBeforeSalesInvHeaderPrintRecords', '', false, false)]
    local procedure "Posted Sales Invoice_OnBeforeSalesInvHeaderPrintRecords"(var SalesInvHeader: Record "Sales Invoice Header"; var IsHandled: Boolean)
    var
        SalesInvLine: Record "Sales Invoice Line";
        Item: Record Item;
        MyReport: Report "Selected Items Report";
    begin
        IsHandled := true;

        SalesInvHeader.PrintRecords(true);

        TempTableItem.DELETEALL;
        TempTableHeader.DELETEALL;

        TempTableHeader.INIT;
        TempTableHeader."No." := SalesInvHeader."No.";
        TempTableHeader."Sell-to Customer Name" := SalesInvHeader."Sell-to Customer Name";
        TempTableHeader."Sell-to Address" := SalesInvHeader."Sell-to Address";
        TempTableHeader."Sell-to City" := SalesInvHeader."Sell-to City";
        TempTableHeader."Sell-to Post Code" := SalesInvHeader."Sell-to Post Code";
        TempTableHeader."Sell-to Country/Region Code" := SalesInvHeader."Sell-to Country/Region Code";
        TempTableHeader.INSERT;

        SalesInvLine.SETRANGE("Document No.", SalesInvHeader."No.");

        IF SalesInvLine.FINDSET THEN BEGIN
            REPEAT
                IF Item.GET(SalesInvLine."No.") THEN BEGIN
                    IF Item.SizedBool THEN BEGIN
                        TempTableItem.INIT;
                        TempTableItem."No." := Item."No.";
                        TempTableItem.Description := Item.Description;
                        TempTableItem."Height [cm]" := Item."Height [cm]";
                        TempTableItem."Width [cm]" := Item."Width [cm]";
                        TempTableItem."Length [cm]" := Item."Length [cm]";
                        TempTableItem.SizedBool := Item.SizedBool;
                        TempTableItem.INSERT;
                    END;
                END;
            UNTIL SalesInvLine.NEXT = 0;
        END ELSE BEGIN
            MESSAGE('Brak pozycji na fakturze.');
        END;

        IF TempTableItem.ISEMPTY THEN BEGIN
            MESSAGE('Brak pozycji na fakturze.');
        END ELSE BEGIN
            Clear(MyReport);
            //MyReport.SetTableView(TempTableItem);
            MyReport.RunModal();
        END;
    end;

    procedure GetTempItemTable(var outTempItem: Record item temporary)
    begin
        TempTableItem.Reset();
        IF TempTableItem.FINDSET THEN
            repeat
                outTempItem.TransferFields(TempTableItem);
                outTempItem.Insert()
            until TempTableItem.NEXT = 0;
    end;

    procedure GetTempHeaderTable() ReturnValue: Record "Sales Invoice Header" temporary
    begin
        ReturnValue := TempTableHeader;
    end;
}
