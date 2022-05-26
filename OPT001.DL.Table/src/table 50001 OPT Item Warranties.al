table 50001 "OPT Item Warranties"
{
    DataClassification = ToBeClassified;
    DataCaptionFields = "OPT Item No.";
    

    fields
    {
        field(1; "OPT Warranty No."; Code[10])
        {
            Caption = 'Warranty No.';
            DataClassification = CustomerContent;
            TableRelation = "OPT Warranty";
        }
        field(2; "OPT Description"; Text[200])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(3; "OPT Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;
            Editable = false;

        }
        field(4; "OPT Ending Date"; Date)
        {
            Caption = 'Ending Date';
            DataClassification = CustomerContent;
            Editable = false;

        }
        field(5; "OPT Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
            Editable = false;

        }
        // field(6; "OPT Item Warranty No."; Code[20])
        // {
        //     Caption = 'Item No.';
        //     DataClassification = CustomerContent;
        //     Editable = false;

        // }
    }

    keys
    {
        key(Key1; "OPT Item No.", "OPT Warranty No.")
        {
            Clustered = true;
        }
    }

    // var
    //     myInt: Integer;

    trigger OnInsert()
    begin

    end;

    // trigger OnModify()
    // var
    //     Warranties: Record "OPT Warranty";
    // begin
    //     Warranties.Get(Rec."OPT Warranty No.");
    //     Rec."OPT Description" := Warranties."OPT Description";
    //     Rec."OPT Starting Date" := Warranties."OPT Starting Date";
    //     Rec."OPT Ending Date" := Warranties."OPT Ending Date";
    //     Rec.Modify(true);
    // end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}