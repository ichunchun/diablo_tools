;@Ahk2Exe-SetMainIcon ico/diablo.ico

MyGui := Gui()

global n := 0
cs := IniRead("plugins.ini", "Section1", "canshu")
version_local := IniRead("plugins.ini", "Section1", "version")

MyGui.Title := "暗黑登陆器"
MyGui.SetFont("s14", "微软雅黑")
TT := MyGui.Add("Text", "w200 h60 0x1000 Center", "养老大本营`n 群号：391499959")
TT.Opt("c0xe100ff")
myGui.SetFont("s9", "Segoe UI")
puqing := MyGui.Add("radio", "xs+15", "普清")
gaoqing := MyGui.Add("radio", "yp", "高清")
chaoqing := MyGui.Add("radio", "yp", "超清")
chaoqing.Value := 1
MyGui.Add("GroupBox", "W200 r5 xs", "登陆器说明")
MyGui.Add("Text", "xp+10 yp+20", "1.参数自带-direct -w，`n2.-w 必须小写其他带空格`n3.win7不能运行超清`n4.win7高清要打补丁`n5.高清切换分辨率需要退出重进`n6.D2loader兼容性设置WIN7`n7.超清ctrl+o自己设置`n8.高清alt+Enter直接全屏")
MyGui.Add("Text", "Section xs", "自定义参数：")
canshu := MyGui.Add("Edit", "w105 ys-3", cs)
MyGui.Add("Text", "Section xs", "一次多开窗口数： ")
duokai := MyGui.Add("Edit", "w74 ys-4", "1")
duokai.Value := 1
Start := MyGui.Add("Button", "w95 h50 Section xs", "开始游戏")
Start.OnEvent("Click", 开始)
Update := MyGui.Add("Button", "w95 h50 yp", "选择更新")
Update.OnEvent("Click", 更新)

MyGui.OnEvent("Close", ext)
MyGui.Show()


开始(*) {
    RegWrite("124.220.5.26", "REG_SZ", "HKEY_CURRENT_USER\Software\Blizzard Entertainment\Diablo II", "BNETIP")

    if FileExist("glide3x.dll")
    {
        if puqing.Value = 1
        {
            loop duokai.Value
                Run "d2loade.exe -direct -w " canshu.Value
        }
        else if gaoqing.Value = 1
        {
            global n += 1
            RunWait(A_ComSpec " /C ren glide3x.dll glide3x" n ".dll.bak", , 'hide')
            FileCopy "glide3x.dll.d2dx", "glide3x.dll", 1
            loop duokai.Value
                Run "game.exe -3dfx -w -direct " canshu.Value
        }
        else if chaoqing.Value = 1
        {
            global n += 1
            RunWait(A_ComSpec " /C ren glide3x.dll glide3x" n ".dll.bak", , 'hide')
            FileCopy "glide3x.dll.G2DL", "glide3x.dll", 1
            loop duokai.Value
                Run "game.exe -3dfx -direct " canshu.Value
        }
    }
    IniWrite canshu.Value, "plugins.ini", "Section1", "canshu"
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
        FileDelete("Crashdump")
        FileDelete("*.txt")
    }
}

Version_Check(url)
{
    whr := ComObject("WinHttp.WinHttpRequest.5.1")
    whr.Open("GET", url)
    whr.Send()
    whr.WaitForResponse()
    version := whr.ResponseText
    return version
}

hotIfWinActive "ahk_class Diablo II"

$F1::
{
    Send "{f1}"
    Send "{RButton}"
}
$F2::
{
    Send "{f2}"
    Send "{RButton}"
}
$F3::
{
    Send "{f3}"
    Send "{RButton}"
}
$F4::
{
    Send "{f4}"
    Send "{RButton}"
}
$F5::
{
    Send "{f5}"
    Send "{RButton}"
}
$F6::
{
    Send "{f6}"
    Send "{RButton}"
}
$F7::
{
    Send "{f7}"
    Send "{RButton}"
}
$F8::
{
    Send "{f8}"
    Send "{RButton}"
}