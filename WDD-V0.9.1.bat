@echo off
::echo Windows Defender Disable v0.009
::pause
::netsh advfirewall set allprofiles state off
::netsh advfirewall set privateprofile state off
::Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
::pause
::exit
@NetSh AdvFirewall Show AllProfiles State|Find /I " ON">Nul&&(goto on)||goto off
:on
netsh advfirewall set allprofiles state off
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
REG ADD “hklm\software\policies\microsoft\windows defender” /v DisableAntiSpyware /t REG_DWORD /d 1 /f
echo Windows Defender and Firewall are now OFF
pause
exit
:off
netsh advfirewall set allprofiles state on
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 0 /f
REG ADD “hklm\software\policies\microsoft\windows defender” /v DisableAntiSpyware /t REG_DWORD /d 0 /f
echo Windows Defender and Firewall are now ON
pause
exit
