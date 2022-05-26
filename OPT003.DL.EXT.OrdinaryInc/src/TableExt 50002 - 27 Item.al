tableextension 50002 "OPT TableExt50002" extends Item // 27
{
    fields
    {
        field(50000; "OPT Frame Type"; Enum "OPT Frame Type")
        {
            Caption = 'Frame Type';
            // OptionMembers = "Round","Square","Cat-eye","Drop";
            // OptionCaption = ;
            DataClassification = CustomerContent;
            ObsoleteState = Removed;
            ObsoleteReason = 'Unnecessary addition';
        }
        field(50001; "OPT Frame Color"; Text[100])
        {
            Caption = 'Frame Color';
            DataClassification = CustomerContent;
            ObsoleteState = Removed;
            ObsoleteReason = 'Unnecessary addition';
        }
        field(50002; "OPT Temples Color"; Text[100])
        {
            Caption = 'Temples Color';
            DataClassification = CustomerContent;
            ObsoleteState = Removed;
            ObsoleteReason = 'Unnecessary addition';
        }
        field(50003; "OPT Lenses Color"; Text[100])
        {
            Caption = 'Lenses Color';
            DataClassification = CustomerContent;
            ObsoleteState = Removed;
            ObsoleteReason = 'Unnecessary addition';
        }
    }

    var
        FrameTypeLbl: Label 'Round, Square, Cat-eye, Drop';
}