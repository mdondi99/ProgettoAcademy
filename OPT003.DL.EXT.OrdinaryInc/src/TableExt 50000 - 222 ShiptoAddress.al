tableextension 50000 "OPT TableExt50000" extends "Ship-to Address" //222
{
    fields
    {
        field(50000; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption= 'Blocked';
        }
    }
}