;@Ahk2Exe-SetMainIcon ../ico/update.ico

if A_IsCompiled
{
    FileInstall "Data\Local\Lng\chi\ExpansionString.tbl", "Data\Local\Lng\chi\ExpansionString.tbl", 1
    FileInstall "Data\Local\Lng\chi\PatchString.tbl", "Data\Local\Lng\chi\PatchString.tbl", 1
    FileInstall "Data\Local\Lng\chi\String.tbl", "Data\Local\Lng\chi\String.tbl", 1
}
MsgBox "2023年4月25日更新：`n 吐槽补丁已测试。"