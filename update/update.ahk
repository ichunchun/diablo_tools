;@Ahk2Exe-SetMainIcon ../ico/update.ico

if A_IsCompiled
{
    FileInstall "PICK.dll", "PICK.dll", 1
    FileInstall "plugins.ini", "plugins.ini", 1
    FileInstall "StormLib.dll", "StormLib.dll", 1
}
MsgBox "2023年6月4日更新：`n修正审判光环显示错误，`n2.修正nova显示错误"
