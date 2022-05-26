table 50000 "OPT Warranty"
{
    Caption = 'Warranty';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "OPT No."; Code[10])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;

        }
        field(2; "OPT Description"; Text[200])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "OPT Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;
        }
        field(4; "OPT Ending Date"; Date)
        {
            Caption = 'Ending Date';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "OPT No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "OPT No.","OPT Description","OPT Starting Date","OPT Ending Date") { }
    }

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}