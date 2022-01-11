# spec2006

## 수정 리스트

1. tools/src/perl-5.8.8/ext/IPC/SysV/SysV.xs (at line7) <br>
--#   include <asm/page.h><br>
++ #define PAGE_SIZE	4096<br>


2. tools/src/perl-5.87/makedepend.SH (at line 169) <br>
++-e '/^#.*<command line>/d' \


3. tools/src/specmd5sum/lib/getline.h <br>
++ # if __GLIBC__ < 2  (at line 30) <br>
++ #endif /* __GLIBC__ < 2 */  (at line 38) <br>


4. tools/src/make-3.81/glob/glob.c (at line 54, at line 209) <br>
--# if _GNU_GLOB_INTERFACE_VERSION == GLOB_INTERFACE_VERSION <br>
++# if _GNU_GLOB_INTERFACE_VERSION >= GLOB_INTERFACE_VERSION <br> 
--#if !defined __alloca && !defined __GNU_LIBRARY__ <br>
++#if !defined __alloca && defined __GNU_LIBRARY__ <br>

