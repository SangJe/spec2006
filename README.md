# spec2006

```bash
├── specsrc : 만들어야할 것
├── extract_spec.sh : iso 압축 해제 하는 스크립트 (출처: hacklog)
└── mvall.sh : gem5 실행 폴더로 옮기는 코드 무시하세요.
└── build.sh : 빌드 스크립트 (출처: haclog)
└── run.sh : runspec을 돌려 binary로 빌드하는 스크립트. 아래 config.cfg를 물고 들어가서 실행됨
└── config.cfg : x86 binary로 빌드하는 스크립트. spec_src/config 폴더안으로 옮기세요.
└── runall.sh : 모든 worload를 한번에 빌드하기 위한 스크립트. 무시하세요.
└── spec_cpu2006.iso : 만들어야 할 것
``` 

- 참교자료1: (https://sjp38.github.io/post/spec_cpu2006_install/)
- 참고자료2: (https://ryotta-205.tistory.com/48)

## How to Run?
1. extract_spec.sh --> build.sh 순으로 실행 시켜 첫번째 빌드 하기
2. config.cfg 파일 옮기기
3. run.sh <workload_name> 실행해서 binary로 빌드 완료하기

## run.sh 실행 전 변경 리스트

- SPEC2006은 gcc-4 버전에 맞춰 작성된 코드이기 때문에 현 최선 버전의 gcc에서 빌드할 때 오류가 발생한다. 따라서 아래의 목록대로 코드를 변경해 주어야 합니다.

|경로|오류내용|해결|
|------|---|---|
|447.dealII/src/include/lac/vector.h|strlen is not a member of 'std'|<code> #inlcude &lt;cstring&gt;</code>을 추가 해 주어야 함.|
|450.soplex/src/mpsinput.cc|getline()의 리턴 타입이 바뀌어서 연산자 ==와 호환이 안됨. | <code> m_input.getline(m_buf, sizeof(m_buf)); if (m_input.eof()); </code>로 코드 변경 |
|483.xalancbmk/run/build_base_amd64-m64-gcc42-nn.0000/FormatterToHTML.cpp| memset was not declared in this scope|<code> #inlcude &lt;cstring&gt;</code>을 추가 해 주어야 함.|


## build.sh 실행 전 리스트

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



 
