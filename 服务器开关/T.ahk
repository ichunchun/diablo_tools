try
{
    ProcessClose "D2CS.exe"
    ProcessClose "D2DBS.exe"
    ProcessClose "PvPGN.exe"
    ProcessClose "D2GS.exe"
    ProcessClose "D2GSSVC.exe"
}

if !ProcessExist("D2GS.exe")
{
    try
    {
        loop files "update/D2GS-113C(3)/*.*", ""
            FileMove "update/D2GS-113C(3)/" A_LoopFileName, "D2GS-113C(3)/" A_LoopFileName, 1
    }
}

Run "PvPGN/P.exe"
Run "D2GS-113C(3)/D.exe"

while true
    if !ProcessExist("D2GS.exe")
    {
        Sleep 1000
        Run "D2GS-113C(3)/D.exe"
    }
    else
        break


TimeString_data := FormatTime(, "LongDate")
TimeString := FormatTime(, "Time")
IniWrite "The Restart time is " TimeString, "Record.ini", TimeString_data,