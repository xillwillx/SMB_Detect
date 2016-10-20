@echo off
c:\Masm32\BIN\ml.exe /c /coff /Cp *.asm
c:\Masm32\BIN\Link.exe /SUBSYSTEM:CONSOLE /LIBPATH:c:\MASM32\lib *.obj
If Exist *.obj del *.obj
If Exist *.exe GoTo X
echo.
echo.
echo Error(s) Mutha Fackuh!!!
pause > nul
:X

@echo Program Compiled.
