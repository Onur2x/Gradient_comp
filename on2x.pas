{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit on2x;

{$warn 5023 off : no warning about unused units}
interface

uses
  butonu, ongrid, databasecontrol, LazarusPackageIntf;

implementation

procedure register;
begin
  registerunit('butonu', @butonu.register);
  registerunit('databasecontrol', @databasecontrol.register);
end;

initialization
  registerpackage('on2x', @register);
end.
