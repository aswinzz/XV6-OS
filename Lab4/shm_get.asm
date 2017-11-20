
_shm_get:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

//
int main(void){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 08             	sub    $0x8,%esp
  int i=0;
  int j=0;

  if(shmget(12,(char *)0x7FFF0000,20480)<0){
  11:	68 00 50 00 00       	push   $0x5000
  16:	68 00 00 ff 7f       	push   $0x7fff0000
  1b:	6a 0c                	push   $0xc
  1d:	e8 20 04 00 00       	call   442 <shmget>
  22:	83 c4 10             	add    $0x10,%esp
  25:	85 c0                	test   %eax,%eax
  27:	0f 88 c3 00 00 00    	js     f0 <main+0xf0>
#include "types.h"
#include "user.h"

//
int main(void){
  2d:	b8 00 00 ff 7f       	mov    $0x7fff0000,%eax
  32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }

  char *test = (char*) 0x7FFF0000;
  char *temp = test;
  for(;i<4096; i++){
    *test = 'A';
  38:	c6 00 41             	movb   $0x41,(%eax)
    test++;
  3b:	83 c0 01             	add    $0x1,%eax
    printf(1,"error\n");
  }

  char *test = (char*) 0x7FFF0000;
  char *temp = test;
  for(;i<4096; i++){
  3e:	3d 00 10 ff 7f       	cmp    $0x7fff1000,%eax
  43:	75 f3                	jne    38 <main+0x38>
  45:	8d 76 00             	lea    0x0(%esi),%esi
    *test = 'A';
    test++;
  }
  for(;i<8192; i++){
    *test = 'B';
  48:	c6 00 42             	movb   $0x42,(%eax)
    test++;
  4b:	83 c0 01             	add    $0x1,%eax
  char *temp = test;
  for(;i<4096; i++){
    *test = 'A';
    test++;
  }
  for(;i<8192; i++){
  4e:	3d 00 20 ff 7f       	cmp    $0x7fff2000,%eax
  53:	75 f3                	jne    48 <main+0x48>
  55:	8d 76 00             	lea    0x0(%esi),%esi
    *test = 'B';
    test++;
  }
  for(;i<20479;i++){
    *test = 'C';
  58:	c6 00 43             	movb   $0x43,(%eax)
    test++;
  5b:	83 c0 01             	add    $0x1,%eax
  }
  for(;i<8192; i++){
    *test = 'B';
    test++;
  }
  for(;i<20479;i++){
  5e:	3d ff 4f ff 7f       	cmp    $0x7fff4fff,%eax
  63:	75 f3                	jne    58 <main+0x58>
    *test = 'C';
    test++;
  }
  *test = '\0';
  65:	c6 05 ff 4f ff 7f 00 	movb   $0x0,0x7fff4fff
  test = temp;

  if(fork()==0){
  6c:	e8 29 03 00 00       	call   39a <fork>
  71:	85 c0                	test   %eax,%eax
  73:	75 71                	jne    e6 <main+0xe6>
    //child
    sleep(100);
  75:	83 ec 0c             	sub    $0xc,%esp
  78:	6a 64                	push   $0x64
  7a:	e8 b3 03 00 00       	call   432 <sleep>
    char *test1;
    if(shmget(12,(char *)0x20000000,0) < 0){
  7f:	83 c4 0c             	add    $0xc,%esp
  82:	6a 00                	push   $0x0
  84:	68 00 00 00 20       	push   $0x20000000
  89:	6a 0c                	push   $0xc
  8b:	e8 b2 03 00 00       	call   442 <shmget>
  90:	83 c4 10             	add    $0x10,%esp
  93:	85 c0                	test   %eax,%eax
  95:	ba 00 00 00 20       	mov    $0x20000000,%edx
  9a:	79 1f                	jns    bb <main+0xbb>
      printf(1,"Child error");
  9c:	51                   	push   %ecx
  9d:	51                   	push   %ecx
  9e:	68 17 08 00 00       	push   $0x817
  a3:	6a 01                	push   $0x1
  a5:	e8 46 04 00 00       	call   4f0 <printf>
      exit();
  aa:	e8 f3 02 00 00       	call   3a2 <exit>
  af:	90                   	nop
    for(;j<4096;j++){
      if(*test1 != 'A'){
        printf(1,"Fail on Page 1 %c\n", *test1);
        exit();
      }
      test1++;
  b0:	83 c2 01             	add    $0x1,%edx
    if(shmget(12,(char *)0x20000000,0) < 0){
      printf(1,"Child error");
      exit();
    }
    test1 =(char*) 0x20000000;
    for(;j<4096;j++){
  b3:	81 fa 00 10 00 20    	cmp    $0x20001000,%edx
  b9:	74 4b                	je     106 <main+0x106>
      if(*test1 != 'A'){
  bb:	0f be 02             	movsbl (%edx),%eax
  be:	3c 41                	cmp    $0x41,%al
  c0:	74 ee                	je     b0 <main+0xb0>
        printf(1,"Fail on Page 1 %c\n", *test1);
  c2:	52                   	push   %edx
  c3:	50                   	push   %eax
  c4:	68 23 08 00 00       	push   $0x823
  c9:	6a 01                	push   $0x1
  cb:	e8 20 04 00 00       	call   4f0 <printf>
        exit();
  d0:	e8 cd 02 00 00       	call   3a2 <exit>
        printf(1,"Fail on page 3 -> 5\n");
        exit();
      }
      test1++;
    }
    printf(1,"Child exiting with success!\n");
  d5:	50                   	push   %eax
  d6:	50                   	push   %eax
  d7:	68 5a 08 00 00       	push   $0x85a
  dc:	6a 01                	push   $0x1
  de:	e8 0d 04 00 00       	call   4f0 <printf>
  e3:	83 c4 10             	add    $0x10,%esp
  }

  wait();
  e6:	e8 bf 02 00 00       	call   3aa <wait>
  /*  int test1[15];
  int * test = malloc(4096);
  printf(1,"test is %p, %x, %d\n",test,test,test);
  printf(1,"test1 is %p, %x, %d\n",test1,test1,test1);*/
  exit();
  eb:	e8 b2 02 00 00       	call   3a2 <exit>
int main(void){
  int i=0;
  int j=0;

  if(shmget(12,(char *)0x7FFF0000,20480)<0){
    printf(1,"error\n");
  f0:	50                   	push   %eax
  f1:	50                   	push   %eax
  f2:	68 10 08 00 00       	push   $0x810
  f7:	6a 01                	push   $0x1
  f9:	e8 f2 03 00 00       	call   4f0 <printf>
  fe:	83 c4 10             	add    $0x10,%esp
 101:	e9 27 ff ff ff       	jmp    2d <main+0x2d>
 106:	b8 00 10 00 00       	mov    $0x1000,%eax
 10b:	eb 10                	jmp    11d <main+0x11d>
 10d:	8d 76 00             	lea    0x0(%esi),%esi
        printf(1,"Fail on Page 1 %c\n", *test1);
        exit();
      }
      test1++;
    }
    for(;j<8192;j++){
 110:	83 c0 01             	add    $0x1,%eax
      if(*test1 != 'B'){
        printf(1,"Fail on page2\n");
        exit();
      }
      test1++;
 113:	83 c2 01             	add    $0x1,%edx
        printf(1,"Fail on Page 1 %c\n", *test1);
        exit();
      }
      test1++;
    }
    for(;j<8192;j++){
 116:	3d 00 20 00 00       	cmp    $0x2000,%eax
 11b:	74 18                	je     135 <main+0x135>
      if(*test1 != 'B'){
 11d:	80 3a 42             	cmpb   $0x42,(%edx)
 120:	74 ee                	je     110 <main+0x110>
        printf(1,"Fail on page2\n");
 122:	51                   	push   %ecx
 123:	51                   	push   %ecx
 124:	68 36 08 00 00       	push   $0x836
 129:	6a 01                	push   $0x1
 12b:	e8 c0 03 00 00       	call   4f0 <printf>
        exit();
 130:	e8 6d 02 00 00       	call   3a2 <exit>
 135:	81 ea 00 20 00 00    	sub    $0x2000,%edx
 13b:	eb 0a                	jmp    147 <main+0x147>
      }
      test1++;
    }
    for(;j<20479;j++){
 13d:	83 c0 01             	add    $0x1,%eax
 140:	3d ff 4f 00 00       	cmp    $0x4fff,%eax
 145:	74 8e                	je     d5 <main+0xd5>
      if(*test1 != 'C'){
 147:	80 3c 02 43          	cmpb   $0x43,(%edx,%eax,1)
 14b:	74 f0                	je     13d <main+0x13d>
        printf(1,"Fail on page 3 -> 5\n");
 14d:	52                   	push   %edx
 14e:	52                   	push   %edx
 14f:	68 45 08 00 00       	push   $0x845
 154:	6a 01                	push   $0x1
 156:	e8 95 03 00 00       	call   4f0 <printf>
        exit();
 15b:	e8 42 02 00 00       	call   3a2 <exit>

00000160 <strcpy>:
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	53                   	push   %ebx
 164:	8b 45 08             	mov    0x8(%ebp),%eax
 167:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 16a:	89 c2                	mov    %eax,%edx
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 170:	83 c1 01             	add    $0x1,%ecx
 173:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 177:	83 c2 01             	add    $0x1,%edx
 17a:	84 db                	test   %bl,%bl
 17c:	88 5a ff             	mov    %bl,-0x1(%edx)
 17f:	75 ef                	jne    170 <strcpy+0x10>
 181:	5b                   	pop    %ebx
 182:	5d                   	pop    %ebp
 183:	c3                   	ret    
 184:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 18a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000190 <strcmp>:
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	56                   	push   %esi
 194:	53                   	push   %ebx
 195:	8b 55 08             	mov    0x8(%ebp),%edx
 198:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 19b:	0f b6 02             	movzbl (%edx),%eax
 19e:	0f b6 19             	movzbl (%ecx),%ebx
 1a1:	84 c0                	test   %al,%al
 1a3:	75 1e                	jne    1c3 <strcmp+0x33>
 1a5:	eb 29                	jmp    1d0 <strcmp+0x40>
 1a7:	89 f6                	mov    %esi,%esi
 1a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 1b0:	83 c2 01             	add    $0x1,%edx
 1b3:	0f b6 02             	movzbl (%edx),%eax
 1b6:	8d 71 01             	lea    0x1(%ecx),%esi
 1b9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1bd:	84 c0                	test   %al,%al
 1bf:	74 0f                	je     1d0 <strcmp+0x40>
 1c1:	89 f1                	mov    %esi,%ecx
 1c3:	38 d8                	cmp    %bl,%al
 1c5:	74 e9                	je     1b0 <strcmp+0x20>
 1c7:	29 d8                	sub    %ebx,%eax
 1c9:	5b                   	pop    %ebx
 1ca:	5e                   	pop    %esi
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret    
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
 1d0:	31 c0                	xor    %eax,%eax
 1d2:	29 d8                	sub    %ebx,%eax
 1d4:	5b                   	pop    %ebx
 1d5:	5e                   	pop    %esi
 1d6:	5d                   	pop    %ebp
 1d7:	c3                   	ret    
 1d8:	90                   	nop
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001e0 <strlen>:
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1e6:	80 39 00             	cmpb   $0x0,(%ecx)
 1e9:	74 12                	je     1fd <strlen+0x1d>
 1eb:	31 d2                	xor    %edx,%edx
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
 1f0:	83 c2 01             	add    $0x1,%edx
 1f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1f7:	89 d0                	mov    %edx,%eax
 1f9:	75 f5                	jne    1f0 <strlen+0x10>
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
 1fd:	31 c0                	xor    %eax,%eax
 1ff:	5d                   	pop    %ebp
 200:	c3                   	ret    
 201:	eb 0d                	jmp    210 <memset>
 203:	90                   	nop
 204:	90                   	nop
 205:	90                   	nop
 206:	90                   	nop
 207:	90                   	nop
 208:	90                   	nop
 209:	90                   	nop
 20a:	90                   	nop
 20b:	90                   	nop
 20c:	90                   	nop
 20d:	90                   	nop
 20e:	90                   	nop
 20f:	90                   	nop

00000210 <memset>:
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	8b 55 08             	mov    0x8(%ebp),%edx
 217:	8b 4d 10             	mov    0x10(%ebp),%ecx
 21a:	8b 45 0c             	mov    0xc(%ebp),%eax
 21d:	89 d7                	mov    %edx,%edi
 21f:	fc                   	cld    
 220:	f3 aa                	rep stos %al,%es:(%edi)
 222:	89 d0                	mov    %edx,%eax
 224:	5f                   	pop    %edi
 225:	5d                   	pop    %ebp
 226:	c3                   	ret    
 227:	89 f6                	mov    %esi,%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000230 <strchr>:
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	53                   	push   %ebx
 234:	8b 45 08             	mov    0x8(%ebp),%eax
 237:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 23a:	0f b6 10             	movzbl (%eax),%edx
 23d:	84 d2                	test   %dl,%dl
 23f:	74 1d                	je     25e <strchr+0x2e>
 241:	38 d3                	cmp    %dl,%bl
 243:	89 d9                	mov    %ebx,%ecx
 245:	75 0d                	jne    254 <strchr+0x24>
 247:	eb 17                	jmp    260 <strchr+0x30>
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 250:	38 ca                	cmp    %cl,%dl
 252:	74 0c                	je     260 <strchr+0x30>
 254:	83 c0 01             	add    $0x1,%eax
 257:	0f b6 10             	movzbl (%eax),%edx
 25a:	84 d2                	test   %dl,%dl
 25c:	75 f2                	jne    250 <strchr+0x20>
 25e:	31 c0                	xor    %eax,%eax
 260:	5b                   	pop    %ebx
 261:	5d                   	pop    %ebp
 262:	c3                   	ret    
 263:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <gets>:
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	56                   	push   %esi
 275:	53                   	push   %ebx
 276:	31 f6                	xor    %esi,%esi
 278:	8d 7d e7             	lea    -0x19(%ebp),%edi
 27b:	83 ec 1c             	sub    $0x1c,%esp
 27e:	eb 29                	jmp    2a9 <gets+0x39>
 280:	83 ec 04             	sub    $0x4,%esp
 283:	6a 01                	push   $0x1
 285:	57                   	push   %edi
 286:	6a 00                	push   $0x0
 288:	e8 2d 01 00 00       	call   3ba <read>
 28d:	83 c4 10             	add    $0x10,%esp
 290:	85 c0                	test   %eax,%eax
 292:	7e 1d                	jle    2b1 <gets+0x41>
 294:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 298:	8b 55 08             	mov    0x8(%ebp),%edx
 29b:	89 de                	mov    %ebx,%esi
 29d:	3c 0a                	cmp    $0xa,%al
 29f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 2a3:	74 1b                	je     2c0 <gets+0x50>
 2a5:	3c 0d                	cmp    $0xd,%al
 2a7:	74 17                	je     2c0 <gets+0x50>
 2a9:	8d 5e 01             	lea    0x1(%esi),%ebx
 2ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2af:	7c cf                	jl     280 <gets+0x10>
 2b1:	8b 45 08             	mov    0x8(%ebp),%eax
 2b4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 2b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2bb:	5b                   	pop    %ebx
 2bc:	5e                   	pop    %esi
 2bd:	5f                   	pop    %edi
 2be:	5d                   	pop    %ebp
 2bf:	c3                   	ret    
 2c0:	8b 45 08             	mov    0x8(%ebp),%eax
 2c3:	89 de                	mov    %ebx,%esi
 2c5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 2c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2cc:	5b                   	pop    %ebx
 2cd:	5e                   	pop    %esi
 2ce:	5f                   	pop    %edi
 2cf:	5d                   	pop    %ebp
 2d0:	c3                   	ret    
 2d1:	eb 0d                	jmp    2e0 <stat>
 2d3:	90                   	nop
 2d4:	90                   	nop
 2d5:	90                   	nop
 2d6:	90                   	nop
 2d7:	90                   	nop
 2d8:	90                   	nop
 2d9:	90                   	nop
 2da:	90                   	nop
 2db:	90                   	nop
 2dc:	90                   	nop
 2dd:	90                   	nop
 2de:	90                   	nop
 2df:	90                   	nop

000002e0 <stat>:
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	56                   	push   %esi
 2e4:	53                   	push   %ebx
 2e5:	83 ec 08             	sub    $0x8,%esp
 2e8:	6a 00                	push   $0x0
 2ea:	ff 75 08             	pushl  0x8(%ebp)
 2ed:	e8 f0 00 00 00       	call   3e2 <open>
 2f2:	83 c4 10             	add    $0x10,%esp
 2f5:	85 c0                	test   %eax,%eax
 2f7:	78 27                	js     320 <stat+0x40>
 2f9:	83 ec 08             	sub    $0x8,%esp
 2fc:	ff 75 0c             	pushl  0xc(%ebp)
 2ff:	89 c3                	mov    %eax,%ebx
 301:	50                   	push   %eax
 302:	e8 f3 00 00 00       	call   3fa <fstat>
 307:	89 1c 24             	mov    %ebx,(%esp)
 30a:	89 c6                	mov    %eax,%esi
 30c:	e8 b9 00 00 00       	call   3ca <close>
 311:	83 c4 10             	add    $0x10,%esp
 314:	8d 65 f8             	lea    -0x8(%ebp),%esp
 317:	89 f0                	mov    %esi,%eax
 319:	5b                   	pop    %ebx
 31a:	5e                   	pop    %esi
 31b:	5d                   	pop    %ebp
 31c:	c3                   	ret    
 31d:	8d 76 00             	lea    0x0(%esi),%esi
 320:	be ff ff ff ff       	mov    $0xffffffff,%esi
 325:	eb ed                	jmp    314 <stat+0x34>
 327:	89 f6                	mov    %esi,%esi
 329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000330 <atoi>:
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	53                   	push   %ebx
 334:	8b 4d 08             	mov    0x8(%ebp),%ecx
 337:	0f be 11             	movsbl (%ecx),%edx
 33a:	8d 42 d0             	lea    -0x30(%edx),%eax
 33d:	3c 09                	cmp    $0x9,%al
 33f:	b8 00 00 00 00       	mov    $0x0,%eax
 344:	77 1f                	ja     365 <atoi+0x35>
 346:	8d 76 00             	lea    0x0(%esi),%esi
 349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 350:	8d 04 80             	lea    (%eax,%eax,4),%eax
 353:	83 c1 01             	add    $0x1,%ecx
 356:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 35a:	0f be 11             	movsbl (%ecx),%edx
 35d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 360:	80 fb 09             	cmp    $0x9,%bl
 363:	76 eb                	jbe    350 <atoi+0x20>
 365:	5b                   	pop    %ebx
 366:	5d                   	pop    %ebp
 367:	c3                   	ret    
 368:	90                   	nop
 369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000370 <memmove>:
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
 375:	8b 5d 10             	mov    0x10(%ebp),%ebx
 378:	8b 45 08             	mov    0x8(%ebp),%eax
 37b:	8b 75 0c             	mov    0xc(%ebp),%esi
 37e:	85 db                	test   %ebx,%ebx
 380:	7e 14                	jle    396 <memmove+0x26>
 382:	31 d2                	xor    %edx,%edx
 384:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 388:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 38c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 38f:	83 c2 01             	add    $0x1,%edx
 392:	39 da                	cmp    %ebx,%edx
 394:	75 f2                	jne    388 <memmove+0x18>
 396:	5b                   	pop    %ebx
 397:	5e                   	pop    %esi
 398:	5d                   	pop    %ebp
 399:	c3                   	ret    

0000039a <fork>:
 39a:	b8 01 00 00 00       	mov    $0x1,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <exit>:
 3a2:	b8 02 00 00 00       	mov    $0x2,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <wait>:
 3aa:	b8 03 00 00 00       	mov    $0x3,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <pipe>:
 3b2:	b8 04 00 00 00       	mov    $0x4,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <read>:
 3ba:	b8 05 00 00 00       	mov    $0x5,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <write>:
 3c2:	b8 10 00 00 00       	mov    $0x10,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <close>:
 3ca:	b8 15 00 00 00       	mov    $0x15,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <kill>:
 3d2:	b8 06 00 00 00       	mov    $0x6,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <exec>:
 3da:	b8 07 00 00 00       	mov    $0x7,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <open>:
 3e2:	b8 0f 00 00 00       	mov    $0xf,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <mknod>:
 3ea:	b8 11 00 00 00       	mov    $0x11,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <unlink>:
 3f2:	b8 12 00 00 00       	mov    $0x12,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <fstat>:
 3fa:	b8 08 00 00 00       	mov    $0x8,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <link>:
 402:	b8 13 00 00 00       	mov    $0x13,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <mkdir>:
 40a:	b8 14 00 00 00       	mov    $0x14,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <chdir>:
 412:	b8 09 00 00 00       	mov    $0x9,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <dup>:
 41a:	b8 0a 00 00 00       	mov    $0xa,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <getpid>:
 422:	b8 0b 00 00 00       	mov    $0xb,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <sbrk>:
 42a:	b8 0c 00 00 00       	mov    $0xc,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <sleep>:
 432:	b8 0d 00 00 00       	mov    $0xd,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <uptime>:
 43a:	b8 0e 00 00 00       	mov    $0xe,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <shmget>:
 442:	b8 16 00 00 00       	mov    $0x16,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    
 44a:	66 90                	xchg   %ax,%ax
 44c:	66 90                	xchg   %ax,%ax
 44e:	66 90                	xchg   %ax,%ax

00000450 <printint>:
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
 456:	89 c6                	mov    %eax,%esi
 458:	83 ec 3c             	sub    $0x3c,%esp
 45b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 45e:	85 db                	test   %ebx,%ebx
 460:	74 7e                	je     4e0 <printint+0x90>
 462:	89 d0                	mov    %edx,%eax
 464:	c1 e8 1f             	shr    $0x1f,%eax
 467:	84 c0                	test   %al,%al
 469:	74 75                	je     4e0 <printint+0x90>
 46b:	89 d0                	mov    %edx,%eax
 46d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 474:	f7 d8                	neg    %eax
 476:	89 75 c0             	mov    %esi,-0x40(%ebp)
 479:	31 ff                	xor    %edi,%edi
 47b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 47e:	89 ce                	mov    %ecx,%esi
 480:	eb 08                	jmp    48a <printint+0x3a>
 482:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 488:	89 cf                	mov    %ecx,%edi
 48a:	31 d2                	xor    %edx,%edx
 48c:	8d 4f 01             	lea    0x1(%edi),%ecx
 48f:	f7 f6                	div    %esi
 491:	0f b6 92 80 08 00 00 	movzbl 0x880(%edx),%edx
 498:	85 c0                	test   %eax,%eax
 49a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 49d:	75 e9                	jne    488 <printint+0x38>
 49f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 4a2:	8b 75 c0             	mov    -0x40(%ebp),%esi
 4a5:	85 c0                	test   %eax,%eax
 4a7:	74 08                	je     4b1 <printint+0x61>
 4a9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 4ae:	8d 4f 02             	lea    0x2(%edi),%ecx
 4b1:	8d 79 ff             	lea    -0x1(%ecx),%edi
 4b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4b8:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 4bd:	83 ec 04             	sub    $0x4,%esp
 4c0:	83 ef 01             	sub    $0x1,%edi
 4c3:	6a 01                	push   $0x1
 4c5:	53                   	push   %ebx
 4c6:	56                   	push   %esi
 4c7:	88 45 d7             	mov    %al,-0x29(%ebp)
 4ca:	e8 f3 fe ff ff       	call   3c2 <write>
 4cf:	83 c4 10             	add    $0x10,%esp
 4d2:	83 ff ff             	cmp    $0xffffffff,%edi
 4d5:	75 e1                	jne    4b8 <printint+0x68>
 4d7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4da:	5b                   	pop    %ebx
 4db:	5e                   	pop    %esi
 4dc:	5f                   	pop    %edi
 4dd:	5d                   	pop    %ebp
 4de:	c3                   	ret    
 4df:	90                   	nop
 4e0:	89 d0                	mov    %edx,%eax
 4e2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4e9:	eb 8b                	jmp    476 <printint+0x26>
 4eb:	90                   	nop
 4ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004f0 <printf>:
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
 4f5:	53                   	push   %ebx
 4f6:	8d 45 10             	lea    0x10(%ebp),%eax
 4f9:	83 ec 2c             	sub    $0x2c,%esp
 4fc:	8b 75 0c             	mov    0xc(%ebp),%esi
 4ff:	8b 7d 08             	mov    0x8(%ebp),%edi
 502:	89 45 d0             	mov    %eax,-0x30(%ebp)
 505:	0f b6 1e             	movzbl (%esi),%ebx
 508:	83 c6 01             	add    $0x1,%esi
 50b:	84 db                	test   %bl,%bl
 50d:	0f 84 b0 00 00 00    	je     5c3 <printf+0xd3>
 513:	31 d2                	xor    %edx,%edx
 515:	eb 39                	jmp    550 <printf+0x60>
 517:	89 f6                	mov    %esi,%esi
 519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 520:	83 f8 25             	cmp    $0x25,%eax
 523:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 526:	ba 25 00 00 00       	mov    $0x25,%edx
 52b:	74 18                	je     545 <printf+0x55>
 52d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 530:	83 ec 04             	sub    $0x4,%esp
 533:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 536:	6a 01                	push   $0x1
 538:	50                   	push   %eax
 539:	57                   	push   %edi
 53a:	e8 83 fe ff ff       	call   3c2 <write>
 53f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 542:	83 c4 10             	add    $0x10,%esp
 545:	83 c6 01             	add    $0x1,%esi
 548:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 54c:	84 db                	test   %bl,%bl
 54e:	74 73                	je     5c3 <printf+0xd3>
 550:	85 d2                	test   %edx,%edx
 552:	0f be cb             	movsbl %bl,%ecx
 555:	0f b6 c3             	movzbl %bl,%eax
 558:	74 c6                	je     520 <printf+0x30>
 55a:	83 fa 25             	cmp    $0x25,%edx
 55d:	75 e6                	jne    545 <printf+0x55>
 55f:	83 f8 64             	cmp    $0x64,%eax
 562:	0f 84 f8 00 00 00    	je     660 <printf+0x170>
 568:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 56e:	83 f9 70             	cmp    $0x70,%ecx
 571:	74 5d                	je     5d0 <printf+0xe0>
 573:	83 f8 73             	cmp    $0x73,%eax
 576:	0f 84 84 00 00 00    	je     600 <printf+0x110>
 57c:	83 f8 63             	cmp    $0x63,%eax
 57f:	0f 84 ea 00 00 00    	je     66f <printf+0x17f>
 585:	83 f8 25             	cmp    $0x25,%eax
 588:	0f 84 c2 00 00 00    	je     650 <printf+0x160>
 58e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 591:	83 ec 04             	sub    $0x4,%esp
 594:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 598:	6a 01                	push   $0x1
 59a:	50                   	push   %eax
 59b:	57                   	push   %edi
 59c:	e8 21 fe ff ff       	call   3c2 <write>
 5a1:	83 c4 0c             	add    $0xc,%esp
 5a4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 5a7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 5aa:	6a 01                	push   $0x1
 5ac:	50                   	push   %eax
 5ad:	57                   	push   %edi
 5ae:	83 c6 01             	add    $0x1,%esi
 5b1:	e8 0c fe ff ff       	call   3c2 <write>
 5b6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 5ba:	83 c4 10             	add    $0x10,%esp
 5bd:	31 d2                	xor    %edx,%edx
 5bf:	84 db                	test   %bl,%bl
 5c1:	75 8d                	jne    550 <printf+0x60>
 5c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5c6:	5b                   	pop    %ebx
 5c7:	5e                   	pop    %esi
 5c8:	5f                   	pop    %edi
 5c9:	5d                   	pop    %ebp
 5ca:	c3                   	ret    
 5cb:	90                   	nop
 5cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5d0:	83 ec 0c             	sub    $0xc,%esp
 5d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5d8:	6a 00                	push   $0x0
 5da:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5dd:	89 f8                	mov    %edi,%eax
 5df:	8b 13                	mov    (%ebx),%edx
 5e1:	e8 6a fe ff ff       	call   450 <printint>
 5e6:	89 d8                	mov    %ebx,%eax
 5e8:	83 c4 10             	add    $0x10,%esp
 5eb:	31 d2                	xor    %edx,%edx
 5ed:	83 c0 04             	add    $0x4,%eax
 5f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5f3:	e9 4d ff ff ff       	jmp    545 <printf+0x55>
 5f8:	90                   	nop
 5f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 600:	8b 45 d0             	mov    -0x30(%ebp),%eax
 603:	8b 18                	mov    (%eax),%ebx
 605:	83 c0 04             	add    $0x4,%eax
 608:	89 45 d0             	mov    %eax,-0x30(%ebp)
 60b:	85 db                	test   %ebx,%ebx
 60d:	74 7c                	je     68b <printf+0x19b>
 60f:	0f b6 03             	movzbl (%ebx),%eax
 612:	84 c0                	test   %al,%al
 614:	74 29                	je     63f <printf+0x14f>
 616:	8d 76 00             	lea    0x0(%esi),%esi
 619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 620:	88 45 e3             	mov    %al,-0x1d(%ebp)
 623:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 626:	83 ec 04             	sub    $0x4,%esp
 629:	6a 01                	push   $0x1
 62b:	83 c3 01             	add    $0x1,%ebx
 62e:	50                   	push   %eax
 62f:	57                   	push   %edi
 630:	e8 8d fd ff ff       	call   3c2 <write>
 635:	0f b6 03             	movzbl (%ebx),%eax
 638:	83 c4 10             	add    $0x10,%esp
 63b:	84 c0                	test   %al,%al
 63d:	75 e1                	jne    620 <printf+0x130>
 63f:	31 d2                	xor    %edx,%edx
 641:	e9 ff fe ff ff       	jmp    545 <printf+0x55>
 646:	8d 76 00             	lea    0x0(%esi),%esi
 649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 650:	83 ec 04             	sub    $0x4,%esp
 653:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 656:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 659:	6a 01                	push   $0x1
 65b:	e9 4c ff ff ff       	jmp    5ac <printf+0xbc>
 660:	83 ec 0c             	sub    $0xc,%esp
 663:	b9 0a 00 00 00       	mov    $0xa,%ecx
 668:	6a 01                	push   $0x1
 66a:	e9 6b ff ff ff       	jmp    5da <printf+0xea>
 66f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 672:	83 ec 04             	sub    $0x4,%esp
 675:	8b 03                	mov    (%ebx),%eax
 677:	6a 01                	push   $0x1
 679:	88 45 e4             	mov    %al,-0x1c(%ebp)
 67c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 67f:	50                   	push   %eax
 680:	57                   	push   %edi
 681:	e8 3c fd ff ff       	call   3c2 <write>
 686:	e9 5b ff ff ff       	jmp    5e6 <printf+0xf6>
 68b:	b8 28 00 00 00       	mov    $0x28,%eax
 690:	bb 77 08 00 00       	mov    $0x877,%ebx
 695:	eb 89                	jmp    620 <printf+0x130>
 697:	66 90                	xchg   %ax,%ax
 699:	66 90                	xchg   %ax,%ax
 69b:	66 90                	xchg   %ax,%ax
 69d:	66 90                	xchg   %ax,%ax
 69f:	90                   	nop

000006a0 <free>:
 6a0:	55                   	push   %ebp
 6a1:	a1 18 0b 00 00       	mov    0xb18,%eax
 6a6:	89 e5                	mov    %esp,%ebp
 6a8:	57                   	push   %edi
 6a9:	56                   	push   %esi
 6aa:	53                   	push   %ebx
 6ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6ae:	8b 10                	mov    (%eax),%edx
 6b0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 6b3:	39 c8                	cmp    %ecx,%eax
 6b5:	73 19                	jae    6d0 <free+0x30>
 6b7:	89 f6                	mov    %esi,%esi
 6b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 6c0:	39 d1                	cmp    %edx,%ecx
 6c2:	72 1c                	jb     6e0 <free+0x40>
 6c4:	39 d0                	cmp    %edx,%eax
 6c6:	73 18                	jae    6e0 <free+0x40>
 6c8:	89 d0                	mov    %edx,%eax
 6ca:	39 c8                	cmp    %ecx,%eax
 6cc:	8b 10                	mov    (%eax),%edx
 6ce:	72 f0                	jb     6c0 <free+0x20>
 6d0:	39 d0                	cmp    %edx,%eax
 6d2:	72 f4                	jb     6c8 <free+0x28>
 6d4:	39 d1                	cmp    %edx,%ecx
 6d6:	73 f0                	jae    6c8 <free+0x28>
 6d8:	90                   	nop
 6d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6e0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6e3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6e6:	39 fa                	cmp    %edi,%edx
 6e8:	74 19                	je     703 <free+0x63>
 6ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6ed:	8b 50 04             	mov    0x4(%eax),%edx
 6f0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6f3:	39 f1                	cmp    %esi,%ecx
 6f5:	74 23                	je     71a <free+0x7a>
 6f7:	89 08                	mov    %ecx,(%eax)
 6f9:	a3 18 0b 00 00       	mov    %eax,0xb18
 6fe:	5b                   	pop    %ebx
 6ff:	5e                   	pop    %esi
 700:	5f                   	pop    %edi
 701:	5d                   	pop    %ebp
 702:	c3                   	ret    
 703:	03 72 04             	add    0x4(%edx),%esi
 706:	89 73 fc             	mov    %esi,-0x4(%ebx)
 709:	8b 10                	mov    (%eax),%edx
 70b:	8b 12                	mov    (%edx),%edx
 70d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 710:	8b 50 04             	mov    0x4(%eax),%edx
 713:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 716:	39 f1                	cmp    %esi,%ecx
 718:	75 dd                	jne    6f7 <free+0x57>
 71a:	03 53 fc             	add    -0x4(%ebx),%edx
 71d:	a3 18 0b 00 00       	mov    %eax,0xb18
 722:	89 50 04             	mov    %edx,0x4(%eax)
 725:	8b 53 f8             	mov    -0x8(%ebx),%edx
 728:	89 10                	mov    %edx,(%eax)
 72a:	5b                   	pop    %ebx
 72b:	5e                   	pop    %esi
 72c:	5f                   	pop    %edi
 72d:	5d                   	pop    %ebp
 72e:	c3                   	ret    
 72f:	90                   	nop

00000730 <malloc>:
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
 735:	53                   	push   %ebx
 736:	83 ec 0c             	sub    $0xc,%esp
 739:	8b 45 08             	mov    0x8(%ebp),%eax
 73c:	8b 15 18 0b 00 00    	mov    0xb18,%edx
 742:	8d 78 07             	lea    0x7(%eax),%edi
 745:	c1 ef 03             	shr    $0x3,%edi
 748:	83 c7 01             	add    $0x1,%edi
 74b:	85 d2                	test   %edx,%edx
 74d:	0f 84 93 00 00 00    	je     7e6 <malloc+0xb6>
 753:	8b 02                	mov    (%edx),%eax
 755:	8b 48 04             	mov    0x4(%eax),%ecx
 758:	39 cf                	cmp    %ecx,%edi
 75a:	76 64                	jbe    7c0 <malloc+0x90>
 75c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 762:	bb 00 10 00 00       	mov    $0x1000,%ebx
 767:	0f 43 df             	cmovae %edi,%ebx
 76a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 771:	eb 0e                	jmp    781 <malloc+0x51>
 773:	90                   	nop
 774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 778:	8b 02                	mov    (%edx),%eax
 77a:	8b 48 04             	mov    0x4(%eax),%ecx
 77d:	39 cf                	cmp    %ecx,%edi
 77f:	76 3f                	jbe    7c0 <malloc+0x90>
 781:	39 05 18 0b 00 00    	cmp    %eax,0xb18
 787:	89 c2                	mov    %eax,%edx
 789:	75 ed                	jne    778 <malloc+0x48>
 78b:	83 ec 0c             	sub    $0xc,%esp
 78e:	56                   	push   %esi
 78f:	e8 96 fc ff ff       	call   42a <sbrk>
 794:	83 c4 10             	add    $0x10,%esp
 797:	83 f8 ff             	cmp    $0xffffffff,%eax
 79a:	74 1c                	je     7b8 <malloc+0x88>
 79c:	89 58 04             	mov    %ebx,0x4(%eax)
 79f:	83 ec 0c             	sub    $0xc,%esp
 7a2:	83 c0 08             	add    $0x8,%eax
 7a5:	50                   	push   %eax
 7a6:	e8 f5 fe ff ff       	call   6a0 <free>
 7ab:	8b 15 18 0b 00 00    	mov    0xb18,%edx
 7b1:	83 c4 10             	add    $0x10,%esp
 7b4:	85 d2                	test   %edx,%edx
 7b6:	75 c0                	jne    778 <malloc+0x48>
 7b8:	31 c0                	xor    %eax,%eax
 7ba:	eb 1c                	jmp    7d8 <malloc+0xa8>
 7bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7c0:	39 cf                	cmp    %ecx,%edi
 7c2:	74 1c                	je     7e0 <malloc+0xb0>
 7c4:	29 f9                	sub    %edi,%ecx
 7c6:	89 48 04             	mov    %ecx,0x4(%eax)
 7c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 7cc:	89 78 04             	mov    %edi,0x4(%eax)
 7cf:	89 15 18 0b 00 00    	mov    %edx,0xb18
 7d5:	83 c0 08             	add    $0x8,%eax
 7d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7db:	5b                   	pop    %ebx
 7dc:	5e                   	pop    %esi
 7dd:	5f                   	pop    %edi
 7de:	5d                   	pop    %ebp
 7df:	c3                   	ret    
 7e0:	8b 08                	mov    (%eax),%ecx
 7e2:	89 0a                	mov    %ecx,(%edx)
 7e4:	eb e9                	jmp    7cf <malloc+0x9f>
 7e6:	c7 05 18 0b 00 00 1c 	movl   $0xb1c,0xb18
 7ed:	0b 00 00 
 7f0:	c7 05 1c 0b 00 00 1c 	movl   $0xb1c,0xb1c
 7f7:	0b 00 00 
 7fa:	b8 1c 0b 00 00       	mov    $0xb1c,%eax
 7ff:	c7 05 20 0b 00 00 00 	movl   $0x0,0xb20
 806:	00 00 00 
 809:	e9 4e ff ff ff       	jmp    75c <malloc+0x2c>
