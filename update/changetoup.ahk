Loop Files, "*.exe"
{
    file_array := StrSplit(A_LoopFileName, ".")
    FileMove A_LoopFileName, file_array[1] ".up", 1
}