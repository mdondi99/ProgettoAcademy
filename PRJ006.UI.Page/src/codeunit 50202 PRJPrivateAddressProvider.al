codeunit 50202 "PRJPrivateAddressProvider" implements PRJIAddressProvider
{
    procedure GetAddress(): Text;
    begin
        exit('My Home address \ Denmark 2800')
    end;
}