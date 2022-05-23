codeunit 50201 "PRJCompanyAddressProvider" implements PRJIAddressProvider
{
    procedure GetAddress(): Text;
    begin
        exit('Company address \ Denmark 2800')
    end;
}