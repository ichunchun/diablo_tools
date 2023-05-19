try
{
    loop files "update/D2GS-113C(3)/*.*", ""
        FileMove "update/D2GS-113C(3)/" A_LoopFileName, "D2GS-113C(3)/" A_LoopFileName, 1
}

Run "D2GS-113C(3)/D.exe"
Run "PvPGN/P.exe"
TimeString_data := FormatTime(, "LongDate")
TimeString := FormatTime(, "Time")
IniWrite "The Restart time is " TimeString, "Record.ini", TimeString_data,