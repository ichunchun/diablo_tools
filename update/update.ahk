;@Ahk2Exe-SetMainIcon ../ico/update.ico

if A_IsCompiled
{
    FileInstall "Patch_D2.mpq", "Patch_D2.mpq", 1
}
MsgBox "2023年6月4日更新：`n修正审判光环显示错误，`n2.修正nova显示错误"