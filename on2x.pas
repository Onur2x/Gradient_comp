{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit on2x;

{$warn 5023 off : no warning about unused units}
interface

uses
  butonu, databasecontrol, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('butonu', @butonu.Register);
  RegisterUnit('databasecontrol', @databasecontrol.Register);
end;

initialization
  RegisterPackage('on2x', @Register);
end.
