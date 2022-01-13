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


## 코드 변경 리스트

1. 447.dealII/src/include/lac/vector.h #inlcude<cstring> 추가하기 (이유: strlen is not a member of 'std' 오류 발생)
2. 450.soplex/src/mpsinput.cc (이유: getline()에 대해 == 연산자가 존재하지 않음) 아래처럼 변경 함. <br>
  m_input.getline(m_buf, sizeof(m_buf)); <br>
         if (m_input.eof()) <br>
3. 483.xalancbmk/run/build_base_amd64-m64-gcc42-nn.0000/FormatterToHTML.cpp (이유: memset was not declared in this scope)
  #include <cstring> 하기
 
