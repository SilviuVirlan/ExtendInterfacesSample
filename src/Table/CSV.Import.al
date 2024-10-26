table 50100 "CSV Import Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(2; "Account No."; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(3; Amount; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(4; Entity; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(5; Department; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(6; "File Name"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(7; "Posting Date"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(8; "Document No."; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(9; "Account Type"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(10; Description; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(11; "Payor Code"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(12; "Service Code"; Text[250])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        _lastImportedLine: Record "CSV Import Line";
    begin
        if "Entry No." = 0 then begin
            if _lastImportedLine.FindLast() then
                "Entry No." := _lastImportedLine."Entry No." + 1
            else
                "Entry No." := 1;
        end;
    end;
}