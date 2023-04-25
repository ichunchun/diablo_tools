;@Ahk2Exe-SetMainIcon ../ico/update.ico

if A_IsCompiled
{
    FileInstall "Data\Local\Lng\Chi\ExpansionString.tbl", "Data\Local\Lng\Chi\ExpansionString.tbl", 1
    FileInstall "Data\Local\Lng\Chi\PatchString.tbl", "Data\Local\Lng\Chi\PatchString.tbl", 1
    FileInstall "Data\Local\Lng\Chi\String.tbl", "Data\Local\Lng\Chi\String.tbl", 1
}
MsgBox "2023年4月25日更新：`n 多彩版即客户端自带版本。"