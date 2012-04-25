@ECHO OFF
ECHO This BAT file runs all the unit tests for the ANSYS_MACROS

SET CurDir=%CD%
SET Ansys_Path=C:\ANSYS121\v121\ansys\bin\WINX64
SET ExE=RunAll

%Ansys_Path%\ANSYS -b <%ExE%.mac> file.out

ECHO Unit Tests Compleate, See OUT_UNIT.out for results

PAUSE