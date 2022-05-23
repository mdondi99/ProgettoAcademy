table 50200 "PRJ CustomerOverview"
{
    Caption = 'CustomerOverview';
    DataClassification = CustomerContent;
    fields
    {
        field(1; MovementNo; Integer)
        {
            Caption = 'Movement Number';
            DataClassification = CustomerContent;
        }
        field(2; ClientNo; Code[20])
        {
            Caption = 'Client Number';
            DataClassification = CustomerContent;
        }
        field(3; ClientName; Text[60])
        {
            Caption = 'Client Name';
            DataClassification = CustomerContent;
        }
        field(4; SourceCode; Code[20])
        {
            Caption = 'Source Code';
            DataClassification = CustomerContent;
        }
        field(5; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
        }
        field(6; LastRunDate; DateTime)
        {
            Caption = 'Last Run Date';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(Key1; MovementNo)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

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