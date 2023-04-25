A_Clipboard := ""

loop files "*", "R"
    IF A_LoopFileName = "bianli.ahk" or A_LoopFileName = "changetoup.ahk" or A_LoopFileName = "update.ahk"
        continue
    else
    {
        ; MsgBox A_LoopFilePath
        temp := "FileInstall " '"' A_LoopFilePath '"' ", " '"' A_LoopFilePath '"' ", 1"
        A_Clipboard .= temp
        A_Clipboard .= "`n"
    }