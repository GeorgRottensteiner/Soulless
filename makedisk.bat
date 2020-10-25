@echo off
rem sprites
copy /b charstartbytes.dat+jg2home.spr home.spr-file
copy /b charstartbytes.dat+jg2rome.spr rome.spr-file
copy /b charstartbytes.dat+jg2egypt.spr egypt.spr-file
copy /b charstartbytes.dat+jg2maya.spr maya.spr-file
copy /b charstartbytes.dat+jg2antartica.spr antartica.spr-file
copy /b charstartbytes.dat+jg2ayersrock.spr ayersrock.spr-file
copy /b charstartbytes.dat+jg2atlantis.spr atlantis.spr-file
copy /b charstartbytes.dat+jg2ether.spr ether.spr-file
rem charsets
copy /b charstartbytes.dat+jg2home.chr home.chr 
copy /b charstartbytes.dat+jg2rome.chr rome.chr 
copy /b charstartbytes.dat+jg2egypt.chr egypt.chr 
copy /b charstartbytes.dat+jg2maya.chr maya.chr 
copy /b charstartbytes.dat+jg2antartica.chr antartica.chr 
copy /b charstartbytes.dat+jg2ayersrock.chr ayersrock.chr 
copy /b charstartbytes.dat+jg2atlantis.chr atlantis.chr 
copy /b charstartbytes.dat+jg2ether.chr ether.chr 
c1541 -format joegunn2,AA d64 joegunn2.d64
c1541 -attach joegunn2.d64 -write joegunn2loader.prg "joe gunn 2" -write jg2home.prg "0" -write home.chr "a" -write home.spr-file "m" -write jg2rome.prg "1" -write rome.chr "b" -write rome.spr-file "n" -write jg2egypt.prg "2" -write egypt.chr "c" -write egypt.spr-file "o" -write jg2maya.prg "3" -write maya.chr "d" -write maya.spr-file "p" -write jg2antartica.prg "4" -write antartica.chr "e" -write antartica.spr-file "q" -write jg2ayersrock.prg "5" -write ayersrock.chr "f" -write ayersrock.spr-file "r" -write jg2atlantis.prg "6" -write atlantis.chr "g" -write atlantis.spr-file "s" -write jg2ether.prg "7" -write ether.chr "h" -write ether.spr-file "t" -write ether.chr "save"

J:\emulator\C64\WinVICE\x64.exe -8 joegunn2.d64 joegunn2.d64