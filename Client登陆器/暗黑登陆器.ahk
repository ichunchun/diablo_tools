;@Ahk2Exe-SetMainIcon ../ico/diablo.ico

MyGui := Gui()
global n := 0
MyGui.Title := "暗黑登陆器"
MyGui.SetFont("s14", "微软雅黑")
TT := MyGui.Add("Text", "w200 h60 0x1000 Center", "养老大本营`n 群号：391499959")
TT.Opt("c0xe100ff")
myGui.SetFont("s9", "Segoe UI")
gaoqing := MyGui.Add("radio", "xs+20", "高清显示")
chaoqing := MyGui.Add("radio", "yp", "超清显示")
chaoqing.Value := 1
chi_eng := MyGui.Add("Checkbox", "Section xs+20", "中英切换")
chi_eng.Value := 1
QS := MyGui.Add("Checkbox", "yp", "快捷施法")

MyGui.Add("GroupBox", "W195 r1 xs-20", "登陆器说明")
MyGui.Add("Text", "xp+10 yp+20", "快捷键查看plugin/d2hackmap.cfg")
MyGui.Add("Text", "Section xs-20", "自定义参数：")
param := MyGui.Add("Edit", "w103 ys-3", IniRead("plugins.ini", "Section1", "param"))
MyGui.Add("Text", "Section xs", "一次多开窗口数： ")
duokai := MyGui.Add("Edit", "w74 ys-4", "1")
duokai.Value := 1

DL := MyGui.Add("Button", "Section xs h21", "下载存档")
DL.OnEvent("Click", 下档)

AL := MyGui.Add("DropDownList", "ys w113", [])
try
{
    loop files, A_ScriptDir '\Save\D2cs\*.key'
    {

        acc_name := StrSplit(A_LoopFileName, ".")[1]
        AL.Add([acc_name])
    }

    AL.Value := 1
}

Start := MyGui.Add("Button", "w95 h50 Section xs", "开始游戏")
Start.OnEvent("Click", 开始)
Update := MyGui.Add("Button", "w90 h50 yp", "选择更新")
Update.OnEvent("Click", 更新)
MyGui.OnEvent("Close", ext)
MyGui.Show()


开始(*) {
    RegWrite(IniRead("plugins.ini", "Section1", "ip"), "REG_SZ", "HKEY_CURRENT_USER\Software\Blizzard Entertainment\Diablo II", "BNETIP")

    if (chi_eng.Value = 1)
    {
        FileCopy A_ScriptDir "\data\Local\Lng\Use", A_ScriptDir "\data\Local\Use", 1
    }
    else
    {
        try
        {
            FileDelete A_ScriptDir "\data\Local\Use"
        }
    }

    if FileExist("glide3x.dll")
    {
        if gaoqing.Value = 1
        {
            global n += 1
            FileMove "glide3x.dll", "glide3x" n ".dll.bak", "1"
            FileCopy "glide3x.dll.d2dx", "glide3x.dll", 1
            loop duokai.Value
                Run "game.exe -3dfx -w -direct " param.Value
        }
        else if chaoqing.Value = 1
        {
            global n += 1
            FileMove "glide3x.dll", "glide3x" n ".dll.bak", "1"
            FileCopy "glide3x.dll.d2gl", "glide3x.dll", 1
            loop duokai.Value
                Run "game.exe -3dfx -direct" param.Value
        }
        IniWrite param.Value, "plugins.ini", "Section1", "param"
    }
}
更新(*)
{
    SelectedFile := FileSelect(3, , "Open a file", "Text Documents (*.up)")
    if SelectedFile = ""
        return
    else
    {

        word_array := StrSplit(SelectedFile, "\")
        file_array := StrSplit(word_array[-1], ".")
        FileMove SelectedFile, file_array[1] ".exe", 1
        RunWait file_array[1] ".exe"
        FileDelete file_array[1] ".exe"
    }

}

ext(*)
{
    try
    {
        FileDelete("*.bak")
        FileDelete("*.txt")
        FileDelete("Crashdump")
    }
    ExitApp
}

下档(*)
{
    try {
        Download "http://124.220.5.26/backup/Savefile/charsave/" AL.Text ".d2x", A_ScriptDir "\Save\" AL.Text ".d2x"
        Download "http://124.220.5.26/backup/var/charsave/" AL.Text, A_ScriptDir "\Save\" AL.Text ".d2s"
        MsgBox AL.Text "存档已下载到本地，存档同步到今早凌晨4点！"
    } catch Error as e {
        MsgBox AL.Text "第一天的新号没办法下载哟！明天就可以了！"
    }


}

#HotIf WinActive("ahk_class Diablo II")  ;ahkv2中的hotif标准语句。

$F1::
{
    if (QS.Value = 1) {
        Send "{F1}" ;发送F1键
        Send "{RButton}"  ;发送右键
        while GetKeyState("F1", "P")  ;当F1键状态为按下时循环
        {
            Send "{RButton}"  ;发送右键
            Sleep(30)
        }
    }
    else {
        Send "{F1}"
    }
}

$F2::
{
    if (QS.Value = 1) {
        Send "{F2}" ;发送F1键
        Send "{RButton}"  ;发送右键
        while GetKeyState("F2", "P")  ;当F1键状态为按下时循环
        {
            Send "{RButton}"  ;发送右键
            Sleep(30)
        }
    }
    else {
        Send "{F2}"
    }
}

$F3::
{
    if (QS.Value = 1) {
        Send "{F3}" ;发送F1键
        Send "{RButton}"  ;发送右键
        while GetKeyState("F3", "P")  ;当F1键状态为按下时循环
        {
            Send "{RButton}"  ;发送右键
            Sleep(30)
        }
    }
    else {
        Send "{F3}"
    }
}

$F4::
{
    if (QS.Value = 1) {
        Send "{F4}" ;发送F1键
        Send "{RButton}"  ;发送右键
        while GetKeyState("F4", "P")  ;当F1键状态为按下时循环
        {
            Send "{RButton}"  ;发送右键
            Sleep(30)
        }
    }
    else {
        Send "{F4}"
    }
}

$F5::
{
    if (QS.Value = 1) {
        Send "{F5}" ;发送F1键
        Send "{RButton}"  ;发送右键
        while GetKeyState("F5", "P")  ;当F1键状态为按下时循环
        {
            Send "{RButton}"  ;发送右键
            Sleep(30)
        }
    }
    else {
        Send "{F5}"
    }
}

$F6::
{
    if (QS.Value = 1) {
        Send "{F6}" ;发送F1键
        Send "{RButton}"  ;发送右键
        while GetKeyState("F6", "P")  ;当F1键状态为按下时循环
        {
            Send "{RButton}"  ;发送右键
            Sleep(30)
        }
    }
    else {
        Send "{F6}"
    }
}

$F7::
{
    if (QS.Value = 1) {
        Send "{F7}" ;发送F1键
        Send "{RButton}"  ;发送右键
        while GetKeyState("F7", "P")  ;当F1键状态为按下时循环
        {
            Send "{RButton}"  ;发送右键
            Sleep(30)
        }
    }
    else {
        Send "{F7}"
    }
}

$F8::
{
    if (QS.Value = 1) {
        Send "{F8}" ;发送F1键
        Send "{RButton}"  ;发送右键
        while GetKeyState("F8", "P")  ;当F1键状态为按下时循环
        {
            Send "{RButton}"  ;发送右键
            Sleep(30)
        }
    }
    else {
        Send "{F8}"
    }
}