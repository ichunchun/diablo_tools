;@Ahk2Exe-SetMainIcon ../ico/update.ico

if A_IsCompiled
{
    FileInstall "Patch_D2.mpq", "Patch_D2.mpq", 1
}
MsgBox "2023年5月1日更新：`n本服特色：`n1.无限洗点，无限注入，无限打孔`n2.杀牛王可以继续牛场`n3.小袋子和100页翻页100页共享箱子`n4.部分技能同步2.4官方，85场景同步2.4官方，符文之语同步2.4官方`n5.德鲁伊动物园开放，刺客可以召唤2个战士或者2个大师，或者1个大师1个战士`n6.暗金附魔 `n"