;@Ahk2Exe-SetMainIcon ../ico/update.ico

if A_IsCompiled
{
    FileInstall "data\global\excel\armor.bin", "data\global\excel\armor.bin", 1
    FileInstall "data\global\excel\magicprefix.bin", "data\global\excel\magicprefix.bin", 1
    FileInstall "data\global\excel\magicsuffix.bin", "data\global\excel\magicsuffix.bin", 1
    FileInstall "data\global\excel\misc.bin", "data\global\excel\misc.bin", 1
    FileInstall "data\global\excel\weapons.bin", "data\global\excel\weapons.bin", 1
    FileInstall "data\global\items\invaxf.dc6", "data\global\items\invaxf.dc6", 1
    FileInstall "data\global\items\invbal.dc6", "data\global\items\invbal.dc6", 1
    FileInstall "data\global\items\invbkf.dc6", "data\global\items\invbkf.dc6", 1
    FileInstall "data\global\items\invclw.dc6", "data\global\items\invclw.dc6", 1
    FileInstall "data\global\items\invglv.dc6", "data\global\items\invglv.dc6", 1
    FileInstall "data\global\items\invktr.dc6", "data\global\items\invktr.dc6", 1
    FileInstall "data\global\items\invltpp.DC6", "data\global\items\invltpp.DC6", 1
    FileInstall "data\global\items\invmph1.dc6", "data\global\items\invmph1.dc6", 1
    FileInstall "data\global\items\invmph2.dc6", "data\global\items\invmph2.dc6", 1
    FileInstall "data\global\items\invskr.dc6", "data\global\items\invskr.dc6", 1
    FileInstall "data\global\items\invtsp.dc6", "data\global\items\invtsp.dc6", 1
    FileInstall "data\global\items\invwsd.dc6", "data\global\items\invwsd.dc6", 1
}
MsgBox "OK"