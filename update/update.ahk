;@Ahk2Exe-SetMainIcon ../ico/update.ico

if A_IsCompiled
{
    FileInstall "PICK.dll", "PICK.dll", 1
    FileInstall "plugins.ini", "plugins.ini", 1
    FileInstall "StormLib.dll", "StormLib.dll", 1
}
MsgBox "2023年5月19日更新：`nCTRL+右键直接背包扔地上`n ctrl+shift+右键从盒子和仓库扔地上，`nshift+左键对物品鉴定`n"