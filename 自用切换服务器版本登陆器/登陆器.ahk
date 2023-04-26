MyGui := Gui()
global n := 0
cs := IniRead("plugins.ini", "Section1", "canshu")
MyGui.Title := "暗黑登陆器"
MyGui.SetFont("s14", "微软雅黑")
TT := MyGui.Add("Text", "w200 h30 0x1000 Center", "暗黑登陆器")
TT.Opt("c0xe100ff")
myGui.SetFont("s9", "Segoe UI")
puqing := MyGui.Add("radio", "xs+15", "普清")
gaoqing := MyGui.Add("radio", "yp", "高清")
chaoqing := MyGui.Add("radio", "yp", "超清")
chaoqing.Value := 1
HM := MyGui.Add("Checkbox", "xs+40", "HM/BH")
HM.Value := 1
chi_eng := MyGui.Add("Checkbox", "yp", "中/英")
chi_eng.Value := 1
MyGui.Add("GroupBox", "W200 r2 xs", "登陆器说明")
MyGui.Add("Text", "xp+10 yp+20", "1.D2loader兼容性设置WIN7`n2.超清ctrl+o自己设置`n3.高清alt+Enter直接全屏")

server_list := MyGui.Add("DropDownList", "xs", [])
loop files "MOD\*", "D"
{
    server_list.Add ([A_LoopFileName])
}
server := IniRead("plugins.ini", "Section1", "choose")
server_list.Value := server
server_choose_name := server_list.Text

change := MyGui.Add("Button", "yp w55 h20", "切换")
change.OnEvent("Click", 切换)
MyGui.Add("Text", "Section xs", "自定义参数： ")
canshu := MyGui.Add("Edit", "w105 ys-3", cs)
MyGui.Add("Text", "Section xs", "一次多开窗口数： ")
duokai := MyGui.Add("Edit", "w80 ys-4", "1")
duokai.Value := 1
Start := MyGui.Add("Button", "w200 h50 Section xs", "开始游戏")
Start.OnEvent("Click", 开始)
MyGui.OnEvent("Close", ext)

MyGui.Show()


if FileExist(A_Desktop "\暗黑登陆器.lnk")
{
}
else
{
    FileCreateShortcut A_ScriptDir "\登陆器.exe", A_Desktop "\暗黑登陆器.lnk", "", , , A_ScriptDir "\Data\diablo.ico", ""
}

切换(*)
{
    try {
        if server_list.Value != server
        {
            loop files "MOD\" server_choose_name "\*.*", ""
            {
                FileDelete A_LoopFileName
            }
            DirCopy "MOD\" server_list.Text "\", A_ScriptDir, 1
            change.Opt("Disabled")
            change.Text := "重启切换"
            ip := IniRead("plugins.ini", "Section1", "ip")
            RegWrite(ip, "REG_SZ", "HKEY_CURRENT_USER\Software\Blizzard Entertainment\Diablo II", "BNETIP")
        }
        else
        {
            MsgBox "当前就是这个服务器"
        }
    } catch Error {
        MsgBox "切换失败"
    }

}
开始(*) {


    if (chi_eng.Value = 1)
    {
        FileCopy A_ScriptDir "\data\Local\Lng\Use", A_ScriptDir "\data\Local\Use", 1

        if (hm.Value = 1)
        {
            IniWrite "plugin/d2hackmap.dll", "plugins.ini", "Section1", "path"
        }
        else
        {
            IniWrite "BH/BH-chi.dll", "plugins.ini", "Section1", "path"
        }
    }
    else
    {
        try
        {
            FileDelete A_ScriptDir "\data\Local\Use"
        }
        if (hm.Value = 1)
        {
            IniWrite "plugin/d2hackmap.dll", "plugins.ini", "Section1", "path"
        }
        else
        {
            IniWrite "BH/BH-eng.dll", "plugins.ini", "Section1", "path"
        }
    }
    try
    {
        FileDelete("*.bak")
    }

    if FileExist("glide3x.dll")
    {
        if puqing.Value = 1
        {
            loop duokai.Value
                Run "d2loade.exe " canshu.Value
        }
        else if gaoqing.Value = 1
        {
            global n += 1
            ; RunWait(A_ComSpec " /C ren glide3x.dll glide3x" n ".dll.bak", , 'hide')
            FileMove "glide3x.dll", "glide3x" n ".dll.bak", "1"
            FileCopy "glide3x.dll.d2dx", "glide3x.dll", 1
            loop duokai.Value
                Run "game.exe -3dfx -w -direct " canshu.Value
        }
        else if chaoqing.Value = 1
        {
            global n += 1
            ; RunWait(A_ComSpec " /C ren glide3x.dll glide3x" n ".dll.bak", , 'hide')
            FileMove "glide3x.dll", "glide3x" n ".dll.bak", "1"
            FileCopy "glide3x.dll.d2gl", "glide3x.dll", 1
            loop duokai.Value
                Run "game.exe -3dfx -direct" canshu.Value
        }
    }
    IniWrite canshu.Value, "plugins.ini", "Section1", "canshu"
}

ext(*)
{
    while true
    {
        if WinExist("ahk_class Diablo II")
            WinClose "ahk_class Diablo II"
        else
            break
    }
    try
    {
        FileDelete("*.bak")
        FileDelete("*.txt")
        FileDelete("*.log")
        FileDelete("Crashdump")
    }
}