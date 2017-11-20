
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
      11:	68 6b 4c 00 00       	push   $0x4c6b
      16:	6a 01                	push   $0x1
      18:	e8 63 39 00 00       	call   3980 <printf>

  if(open("usertests.ran", 0) >= 0){
      1d:	5a                   	pop    %edx
      1e:	59                   	pop    %ecx
      1f:	6a 00                	push   $0x0
      21:	68 7f 4c 00 00       	push   $0x4c7f
      26:	e8 37 38 00 00       	call   3862 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 14                	js     46 <main+0x46>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      32:	83 ec 08             	sub    $0x8,%esp
      35:	68 e8 53 00 00       	push   $0x53e8
      3a:	6a 01                	push   $0x1
      3c:	e8 3f 39 00 00       	call   3980 <printf>
    exit();
      41:	e8 dc 37 00 00       	call   3822 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      46:	50                   	push   %eax
      47:	50                   	push   %eax
      48:	68 00 02 00 00       	push   $0x200
      4d:	68 7f 4c 00 00       	push   $0x4c7f
      52:	e8 0b 38 00 00       	call   3862 <open>
      57:	89 04 24             	mov    %eax,(%esp)
      5a:	e8 eb 37 00 00       	call   384a <close>

  createdelete();
      5f:	e8 7c 11 00 00       	call   11e0 <createdelete>
  linkunlink();
      64:	e8 37 1a 00 00       	call   1aa0 <linkunlink>
  concreate();
      69:	e8 22 17 00 00       	call   1790 <concreate>
  fourfiles();
      6e:	e8 7d 0f 00 00       	call   ff0 <fourfiles>
  sharedfd();
      73:	e8 b8 0d 00 00       	call   e30 <sharedfd>

  bigargtest();
      78:	e8 e3 31 00 00       	call   3260 <bigargtest>
  bigwrite();
      7d:	e8 3e 23 00 00       	call   23c0 <bigwrite>
  bigargtest();
      82:	e8 d9 31 00 00       	call   3260 <bigargtest>
  bsstest();
      87:	e8 64 31 00 00       	call   31f0 <bsstest>
  sbrktest();
      8c:	e8 7f 2c 00 00       	call   2d10 <sbrktest>
  validatetest();
      91:	e8 aa 30 00 00       	call   3140 <validatetest>

  opentest();
      96:	e8 45 03 00 00       	call   3e0 <opentest>
  writetest();
      9b:	e8 d0 03 00 00       	call   470 <writetest>
  writetest1();
      a0:	e8 ab 05 00 00       	call   650 <writetest1>
  createtest();
      a5:	e8 76 07 00 00       	call   820 <createtest>

  openiputtest();
      aa:	e8 31 02 00 00       	call   2e0 <openiputtest>
  exitiputtest();
      af:	e8 3c 01 00 00       	call   1f0 <exitiputtest>
  iputtest();
      b4:	e8 57 00 00 00       	call   110 <iputtest>

  mem();
      b9:	e8 a2 0c 00 00       	call   d60 <mem>
  pipe1();
      be:	e8 3d 09 00 00       	call   a00 <pipe1>
  preempt();
      c3:	e8 c8 0a 00 00       	call   b90 <preempt>
  exitwait();
      c8:	e8 03 0c 00 00       	call   cd0 <exitwait>

  rmdot();
      cd:	e8 de 26 00 00       	call   27b0 <rmdot>
  fourteen();
      d2:	e8 99 25 00 00       	call   2670 <fourteen>
  bigfile();
      d7:	e8 c4 23 00 00       	call   24a0 <bigfile>
  subdir();
      dc:	e8 ff 1b 00 00       	call   1ce0 <subdir>
  linktest();
      e1:	e8 9a 14 00 00       	call   1580 <linktest>
  unlinkread();
      e6:	e8 05 13 00 00       	call   13f0 <unlinkread>
  dirfile();
      eb:	e8 40 28 00 00       	call   2930 <dirfile>
  iref();
      f0:	e8 3b 2a 00 00       	call   2b30 <iref>
  forktest();
      f5:	e8 56 2b 00 00       	call   2c50 <forktest>
  bigdir(); // slow
      fa:	e8 b1 1a 00 00       	call   1bb0 <bigdir>

  uio();
      ff:	e8 4c 34 00 00       	call   3550 <uio>

  exectest();
     104:	e8 a7 08 00 00       	call   9b0 <exectest>

  exit();
     109:	e8 14 37 00 00       	call   3822 <exit>
     10e:	66 90                	xchg   %ax,%ax

00000110 <iputtest>:
int stdout = 1;

// does chdir() call iput(p->cwd) in a transaction?
void
iputtest(void)
{
     110:	55                   	push   %ebp
     111:	89 e5                	mov    %esp,%ebp
     113:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
     116:	68 34 3d 00 00       	push   $0x3d34
     11b:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     121:	e8 5a 38 00 00       	call   3980 <printf>

  if(mkdir("iputdir") < 0){
     126:	c7 04 24 c7 3c 00 00 	movl   $0x3cc7,(%esp)
     12d:	e8 58 37 00 00       	call   388a <mkdir>
     132:	83 c4 10             	add    $0x10,%esp
     135:	85 c0                	test   %eax,%eax
     137:	78 58                	js     191 <iputtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
     139:	83 ec 0c             	sub    $0xc,%esp
     13c:	68 c7 3c 00 00       	push   $0x3cc7
     141:	e8 4c 37 00 00       	call   3892 <chdir>
     146:	83 c4 10             	add    $0x10,%esp
     149:	85 c0                	test   %eax,%eax
     14b:	0f 88 85 00 00 00    	js     1d6 <iputtest+0xc6>
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
     151:	83 ec 0c             	sub    $0xc,%esp
     154:	68 c4 3c 00 00       	push   $0x3cc4
     159:	e8 14 37 00 00       	call   3872 <unlink>
     15e:	83 c4 10             	add    $0x10,%esp
     161:	85 c0                	test   %eax,%eax
     163:	78 5a                	js     1bf <iputtest+0xaf>
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
     165:	83 ec 0c             	sub    $0xc,%esp
     168:	68 e9 3c 00 00       	push   $0x3ce9
     16d:	e8 20 37 00 00       	call   3892 <chdir>
     172:	83 c4 10             	add    $0x10,%esp
     175:	85 c0                	test   %eax,%eax
     177:	78 2f                	js     1a8 <iputtest+0x98>
    printf(stdout, "chdir / failed\n");
    exit();
  }
  printf(stdout, "iput test ok\n");
     179:	83 ec 08             	sub    $0x8,%esp
     17c:	68 6c 3d 00 00       	push   $0x3d6c
     181:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     187:	e8 f4 37 00 00       	call   3980 <printf>
}
     18c:	83 c4 10             	add    $0x10,%esp
     18f:	c9                   	leave  
     190:	c3                   	ret    
iputtest(void)
{
  printf(stdout, "iput test\n");

  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
     191:	50                   	push   %eax
     192:	50                   	push   %eax
     193:	68 a0 3c 00 00       	push   $0x3ca0
     198:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     19e:	e8 dd 37 00 00       	call   3980 <printf>
    exit();
     1a3:	e8 7a 36 00 00       	call   3822 <exit>
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
    printf(stdout, "chdir / failed\n");
     1a8:	50                   	push   %eax
     1a9:	50                   	push   %eax
     1aa:	68 eb 3c 00 00       	push   $0x3ceb
     1af:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     1b5:	e8 c6 37 00 00       	call   3980 <printf>
    exit();
     1ba:	e8 63 36 00 00       	call   3822 <exit>
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
     1bf:	52                   	push   %edx
     1c0:	52                   	push   %edx
     1c1:	68 cf 3c 00 00       	push   $0x3ccf
     1c6:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     1cc:	e8 af 37 00 00       	call   3980 <printf>
    exit();
     1d1:	e8 4c 36 00 00       	call   3822 <exit>
  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
     1d6:	51                   	push   %ecx
     1d7:	51                   	push   %ecx
     1d8:	68 ae 3c 00 00       	push   $0x3cae
     1dd:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     1e3:	e8 98 37 00 00       	call   3980 <printf>
    exit();
     1e8:	e8 35 36 00 00       	call   3822 <exit>
     1ed:	8d 76 00             	lea    0x0(%esi),%esi

000001f0 <exitiputtest>:
}

// does exit() call iput(p->cwd) in a transaction?
void
exitiputtest(void)
{
     1f0:	55                   	push   %ebp
     1f1:	89 e5                	mov    %esp,%ebp
     1f3:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "exitiput test\n");
     1f6:	68 fb 3c 00 00       	push   $0x3cfb
     1fb:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     201:	e8 7a 37 00 00       	call   3980 <printf>

  pid = fork();
     206:	e8 0f 36 00 00       	call   381a <fork>
  if(pid < 0){
     20b:	83 c4 10             	add    $0x10,%esp
     20e:	85 c0                	test   %eax,%eax
     210:	0f 88 82 00 00 00    	js     298 <exitiputtest+0xa8>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
     216:	75 48                	jne    260 <exitiputtest+0x70>
    if(mkdir("iputdir") < 0){
     218:	83 ec 0c             	sub    $0xc,%esp
     21b:	68 c7 3c 00 00       	push   $0x3cc7
     220:	e8 65 36 00 00       	call   388a <mkdir>
     225:	83 c4 10             	add    $0x10,%esp
     228:	85 c0                	test   %eax,%eax
     22a:	0f 88 96 00 00 00    	js     2c6 <exitiputtest+0xd6>
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
     230:	83 ec 0c             	sub    $0xc,%esp
     233:	68 c7 3c 00 00       	push   $0x3cc7
     238:	e8 55 36 00 00       	call   3892 <chdir>
     23d:	83 c4 10             	add    $0x10,%esp
     240:	85 c0                	test   %eax,%eax
     242:	78 6b                	js     2af <exitiputtest+0xbf>
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
     244:	83 ec 0c             	sub    $0xc,%esp
     247:	68 c4 3c 00 00       	push   $0x3cc4
     24c:	e8 21 36 00 00       	call   3872 <unlink>
     251:	83 c4 10             	add    $0x10,%esp
     254:	85 c0                	test   %eax,%eax
     256:	78 28                	js     280 <exitiputtest+0x90>
      printf(stdout, "unlink ../iputdir failed\n");
      exit();
    }
    exit();
     258:	e8 c5 35 00 00       	call   3822 <exit>
     25d:	8d 76 00             	lea    0x0(%esi),%esi
  }
  wait();
     260:	e8 c5 35 00 00       	call   382a <wait>
  printf(stdout, "exitiput test ok\n");
     265:	83 ec 08             	sub    $0x8,%esp
     268:	68 1e 3d 00 00       	push   $0x3d1e
     26d:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     273:	e8 08 37 00 00       	call   3980 <printf>
}
     278:	83 c4 10             	add    $0x10,%esp
     27b:	c9                   	leave  
     27c:	c3                   	ret    
     27d:	8d 76 00             	lea    0x0(%esi),%esi
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
      printf(stdout, "unlink ../iputdir failed\n");
     280:	83 ec 08             	sub    $0x8,%esp
     283:	68 cf 3c 00 00       	push   $0x3ccf
     288:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     28e:	e8 ed 36 00 00       	call   3980 <printf>
      exit();
     293:	e8 8a 35 00 00       	call   3822 <exit>

  printf(stdout, "exitiput test\n");

  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
     298:	51                   	push   %ecx
     299:	51                   	push   %ecx
     29a:	68 e1 4b 00 00       	push   $0x4be1
     29f:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     2a5:	e8 d6 36 00 00       	call   3980 <printf>
    exit();
     2aa:	e8 73 35 00 00       	call   3822 <exit>
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
     2af:	50                   	push   %eax
     2b0:	50                   	push   %eax
     2b1:	68 0a 3d 00 00       	push   $0x3d0a
     2b6:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     2bc:	e8 bf 36 00 00       	call   3980 <printf>
      exit();
     2c1:	e8 5c 35 00 00       	call   3822 <exit>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
     2c6:	52                   	push   %edx
     2c7:	52                   	push   %edx
     2c8:	68 a0 3c 00 00       	push   $0x3ca0
     2cd:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     2d3:	e8 a8 36 00 00       	call   3980 <printf>
      exit();
     2d8:	e8 45 35 00 00       	call   3822 <exit>
     2dd:	8d 76 00             	lea    0x0(%esi),%esi

000002e0 <openiputtest>:
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void
openiputtest(void)
{
     2e0:	55                   	push   %ebp
     2e1:	89 e5                	mov    %esp,%ebp
     2e3:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "openiput test\n");
     2e6:	68 30 3d 00 00       	push   $0x3d30
     2eb:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     2f1:	e8 8a 36 00 00       	call   3980 <printf>
  if(mkdir("oidir") < 0){
     2f6:	c7 04 24 3f 3d 00 00 	movl   $0x3d3f,(%esp)
     2fd:	e8 88 35 00 00       	call   388a <mkdir>
     302:	83 c4 10             	add    $0x10,%esp
     305:	85 c0                	test   %eax,%eax
     307:	0f 88 88 00 00 00    	js     395 <openiputtest+0xb5>
    printf(stdout, "mkdir oidir failed\n");
    exit();
  }
  pid = fork();
     30d:	e8 08 35 00 00       	call   381a <fork>
  if(pid < 0){
     312:	85 c0                	test   %eax,%eax
     314:	0f 88 92 00 00 00    	js     3ac <openiputtest+0xcc>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
     31a:	75 34                	jne    350 <openiputtest+0x70>
    int fd = open("oidir", O_RDWR);
     31c:	83 ec 08             	sub    $0x8,%esp
     31f:	6a 02                	push   $0x2
     321:	68 3f 3d 00 00       	push   $0x3d3f
     326:	e8 37 35 00 00       	call   3862 <open>
    if(fd >= 0){
     32b:	83 c4 10             	add    $0x10,%esp
     32e:	85 c0                	test   %eax,%eax
     330:	78 5e                	js     390 <openiputtest+0xb0>
      printf(stdout, "open directory for write succeeded\n");
     332:	83 ec 08             	sub    $0x8,%esp
     335:	68 a0 4c 00 00       	push   $0x4ca0
     33a:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     340:	e8 3b 36 00 00       	call   3980 <printf>
      exit();
     345:	e8 d8 34 00 00       	call   3822 <exit>
     34a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    }
    exit();
  }
  sleep(1);
     350:	83 ec 0c             	sub    $0xc,%esp
     353:	6a 01                	push   $0x1
     355:	e8 58 35 00 00       	call   38b2 <sleep>
  if(unlink("oidir") != 0){
     35a:	c7 04 24 3f 3d 00 00 	movl   $0x3d3f,(%esp)
     361:	e8 0c 35 00 00       	call   3872 <unlink>
     366:	83 c4 10             	add    $0x10,%esp
     369:	85 c0                	test   %eax,%eax
     36b:	75 56                	jne    3c3 <openiputtest+0xe3>
    printf(stdout, "unlink failed\n");
    exit();
  }
  wait();
     36d:	e8 b8 34 00 00       	call   382a <wait>
  printf(stdout, "openiput test ok\n");
     372:	83 ec 08             	sub    $0x8,%esp
     375:	68 68 3d 00 00       	push   $0x3d68
     37a:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     380:	e8 fb 35 00 00       	call   3980 <printf>
     385:	83 c4 10             	add    $0x10,%esp
}
     388:	c9                   	leave  
     389:	c3                   	ret    
     38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int fd = open("oidir", O_RDWR);
    if(fd >= 0){
      printf(stdout, "open directory for write succeeded\n");
      exit();
    }
    exit();
     390:	e8 8d 34 00 00       	call   3822 <exit>
{
  int pid;

  printf(stdout, "openiput test\n");
  if(mkdir("oidir") < 0){
    printf(stdout, "mkdir oidir failed\n");
     395:	51                   	push   %ecx
     396:	51                   	push   %ecx
     397:	68 45 3d 00 00       	push   $0x3d45
     39c:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     3a2:	e8 d9 35 00 00       	call   3980 <printf>
    exit();
     3a7:	e8 76 34 00 00       	call   3822 <exit>
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
     3ac:	52                   	push   %edx
     3ad:	52                   	push   %edx
     3ae:	68 e1 4b 00 00       	push   $0x4be1
     3b3:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     3b9:	e8 c2 35 00 00       	call   3980 <printf>
    exit();
     3be:	e8 5f 34 00 00       	call   3822 <exit>
    }
    exit();
  }
  sleep(1);
  if(unlink("oidir") != 0){
    printf(stdout, "unlink failed\n");
     3c3:	50                   	push   %eax
     3c4:	50                   	push   %eax
     3c5:	68 59 3d 00 00       	push   $0x3d59
     3ca:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     3d0:	e8 ab 35 00 00       	call   3980 <printf>
    exit();
     3d5:	e8 48 34 00 00       	call   3822 <exit>
     3da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003e0 <opentest>:

// simple file system tests

void
opentest(void)
{
     3e0:	55                   	push   %ebp
     3e1:	89 e5                	mov    %esp,%ebp
     3e3:	83 ec 10             	sub    $0x10,%esp
  int fd;

  printf(stdout, "open test\n");
     3e6:	68 7a 3d 00 00       	push   $0x3d7a
     3eb:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     3f1:	e8 8a 35 00 00       	call   3980 <printf>
  fd = open("echo", 0);
     3f6:	58                   	pop    %eax
     3f7:	5a                   	pop    %edx
     3f8:	6a 00                	push   $0x0
     3fa:	68 85 3d 00 00       	push   $0x3d85
     3ff:	e8 5e 34 00 00       	call   3862 <open>
  if(fd < 0){
     404:	83 c4 10             	add    $0x10,%esp
     407:	85 c0                	test   %eax,%eax
     409:	78 36                	js     441 <opentest+0x61>
    printf(stdout, "open echo failed!\n");
    exit();
  }
  close(fd);
     40b:	83 ec 0c             	sub    $0xc,%esp
     40e:	50                   	push   %eax
     40f:	e8 36 34 00 00       	call   384a <close>
  fd = open("doesnotexist", 0);
     414:	5a                   	pop    %edx
     415:	59                   	pop    %ecx
     416:	6a 00                	push   $0x0
     418:	68 9d 3d 00 00       	push   $0x3d9d
     41d:	e8 40 34 00 00       	call   3862 <open>
  if(fd >= 0){
     422:	83 c4 10             	add    $0x10,%esp
     425:	85 c0                	test   %eax,%eax
     427:	79 2f                	jns    458 <opentest+0x78>
    printf(stdout, "open doesnotexist succeeded!\n");
    exit();
  }
  printf(stdout, "open test ok\n");
     429:	83 ec 08             	sub    $0x8,%esp
     42c:	68 c8 3d 00 00       	push   $0x3dc8
     431:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     437:	e8 44 35 00 00       	call   3980 <printf>
}
     43c:	83 c4 10             	add    $0x10,%esp
     43f:	c9                   	leave  
     440:	c3                   	ret    
  int fd;

  printf(stdout, "open test\n");
  fd = open("echo", 0);
  if(fd < 0){
    printf(stdout, "open echo failed!\n");
     441:	50                   	push   %eax
     442:	50                   	push   %eax
     443:	68 8a 3d 00 00       	push   $0x3d8a
     448:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     44e:	e8 2d 35 00 00       	call   3980 <printf>
    exit();
     453:	e8 ca 33 00 00       	call   3822 <exit>
  }
  close(fd);
  fd = open("doesnotexist", 0);
  if(fd >= 0){
    printf(stdout, "open doesnotexist succeeded!\n");
     458:	50                   	push   %eax
     459:	50                   	push   %eax
     45a:	68 aa 3d 00 00       	push   $0x3daa
     45f:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     465:	e8 16 35 00 00       	call   3980 <printf>
    exit();
     46a:	e8 b3 33 00 00       	call   3822 <exit>
     46f:	90                   	nop

00000470 <writetest>:
  printf(stdout, "open test ok\n");
}

void
writetest(void)
{
     470:	55                   	push   %ebp
     471:	89 e5                	mov    %esp,%ebp
     473:	56                   	push   %esi
     474:	53                   	push   %ebx
  int fd;
  int i;

  printf(stdout, "small file test\n");
     475:	83 ec 08             	sub    $0x8,%esp
     478:	68 d6 3d 00 00       	push   $0x3dd6
     47d:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     483:	e8 f8 34 00 00       	call   3980 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     488:	59                   	pop    %ecx
     489:	5b                   	pop    %ebx
     48a:	68 02 02 00 00       	push   $0x202
     48f:	68 e7 3d 00 00       	push   $0x3de7
     494:	e8 c9 33 00 00       	call   3862 <open>
  if(fd >= 0){
     499:	83 c4 10             	add    $0x10,%esp
     49c:	85 c0                	test   %eax,%eax
     49e:	0f 88 8b 01 00 00    	js     62f <writetest+0x1bf>
    printf(stdout, "creat small succeeded; ok\n");
     4a4:	83 ec 08             	sub    $0x8,%esp
     4a7:	89 c6                	mov    %eax,%esi
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     4a9:	31 db                	xor    %ebx,%ebx
  int i;

  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
     4ab:	68 ed 3d 00 00       	push   $0x3ded
     4b0:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     4b6:	e8 c5 34 00 00       	call   3980 <printf>
     4bb:	83 c4 10             	add    $0x10,%esp
     4be:	66 90                	xchg   %ax,%ax
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     4c0:	83 ec 04             	sub    $0x4,%esp
     4c3:	6a 0a                	push   $0xa
     4c5:	68 24 3e 00 00       	push   $0x3e24
     4ca:	56                   	push   %esi
     4cb:	e8 72 33 00 00       	call   3842 <write>
     4d0:	83 c4 10             	add    $0x10,%esp
     4d3:	83 f8 0a             	cmp    $0xa,%eax
     4d6:	0f 85 d9 00 00 00    	jne    5b5 <writetest+0x145>
      printf(stdout, "error: write aa %d new file failed\n", i);
      exit();
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     4dc:	83 ec 04             	sub    $0x4,%esp
     4df:	6a 0a                	push   $0xa
     4e1:	68 2f 3e 00 00       	push   $0x3e2f
     4e6:	56                   	push   %esi
     4e7:	e8 56 33 00 00       	call   3842 <write>
     4ec:	83 c4 10             	add    $0x10,%esp
     4ef:	83 f8 0a             	cmp    $0xa,%eax
     4f2:	0f 85 d6 00 00 00    	jne    5ce <writetest+0x15e>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     4f8:	83 c3 01             	add    $0x1,%ebx
     4fb:	83 fb 64             	cmp    $0x64,%ebx
     4fe:	75 c0                	jne    4c0 <writetest+0x50>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
     500:	83 ec 08             	sub    $0x8,%esp
     503:	68 3a 3e 00 00       	push   $0x3e3a
     508:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     50e:	e8 6d 34 00 00       	call   3980 <printf>
  close(fd);
     513:	89 34 24             	mov    %esi,(%esp)
     516:	e8 2f 33 00 00       	call   384a <close>
  fd = open("small", O_RDONLY);
     51b:	58                   	pop    %eax
     51c:	5a                   	pop    %edx
     51d:	6a 00                	push   $0x0
     51f:	68 e7 3d 00 00       	push   $0x3de7
     524:	e8 39 33 00 00       	call   3862 <open>
  if(fd >= 0){
     529:	83 c4 10             	add    $0x10,%esp
     52c:	85 c0                	test   %eax,%eax
      exit();
    }
  }
  printf(stdout, "writes ok\n");
  close(fd);
  fd = open("small", O_RDONLY);
     52e:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     530:	0f 88 b1 00 00 00    	js     5e7 <writetest+0x177>
    printf(stdout, "open small succeeded ok\n");
     536:	83 ec 08             	sub    $0x8,%esp
     539:	68 45 3e 00 00       	push   $0x3e45
     53e:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     544:	e8 37 34 00 00       	call   3980 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     549:	83 c4 0c             	add    $0xc,%esp
     54c:	68 d0 07 00 00       	push   $0x7d0
     551:	68 c0 84 00 00       	push   $0x84c0
     556:	53                   	push   %ebx
     557:	e8 de 32 00 00       	call   383a <read>
  if(i == 2000){
     55c:	83 c4 10             	add    $0x10,%esp
     55f:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     564:	0f 85 95 00 00 00    	jne    5ff <writetest+0x18f>
    printf(stdout, "read succeeded ok\n");
     56a:	83 ec 08             	sub    $0x8,%esp
     56d:	68 79 3e 00 00       	push   $0x3e79
     572:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     578:	e8 03 34 00 00       	call   3980 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     57d:	89 1c 24             	mov    %ebx,(%esp)
     580:	e8 c5 32 00 00       	call   384a <close>

  if(unlink("small") < 0){
     585:	c7 04 24 e7 3d 00 00 	movl   $0x3de7,(%esp)
     58c:	e8 e1 32 00 00       	call   3872 <unlink>
     591:	83 c4 10             	add    $0x10,%esp
     594:	85 c0                	test   %eax,%eax
     596:	78 7f                	js     617 <writetest+0x1a7>
    printf(stdout, "unlink small failed\n");
    exit();
  }
  printf(stdout, "small file test ok\n");
     598:	83 ec 08             	sub    $0x8,%esp
     59b:	68 a1 3e 00 00       	push   $0x3ea1
     5a0:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     5a6:	e8 d5 33 00 00       	call   3980 <printf>
}
     5ab:	83 c4 10             	add    $0x10,%esp
     5ae:	8d 65 f8             	lea    -0x8(%ebp),%esp
     5b1:	5b                   	pop    %ebx
     5b2:	5e                   	pop    %esi
     5b3:	5d                   	pop    %ebp
     5b4:	c3                   	ret    
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
      printf(stdout, "error: write aa %d new file failed\n", i);
     5b5:	83 ec 04             	sub    $0x4,%esp
     5b8:	53                   	push   %ebx
     5b9:	68 c4 4c 00 00       	push   $0x4cc4
     5be:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     5c4:	e8 b7 33 00 00       	call   3980 <printf>
      exit();
     5c9:	e8 54 32 00 00       	call   3822 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
     5ce:	83 ec 04             	sub    $0x4,%esp
     5d1:	53                   	push   %ebx
     5d2:	68 e8 4c 00 00       	push   $0x4ce8
     5d7:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     5dd:	e8 9e 33 00 00       	call   3980 <printf>
      exit();
     5e2:	e8 3b 32 00 00       	call   3822 <exit>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     5e7:	83 ec 08             	sub    $0x8,%esp
     5ea:	68 5e 3e 00 00       	push   $0x3e5e
     5ef:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     5f5:	e8 86 33 00 00       	call   3980 <printf>
    exit();
     5fa:	e8 23 32 00 00       	call   3822 <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     5ff:	83 ec 08             	sub    $0x8,%esp
     602:	68 a5 41 00 00       	push   $0x41a5
     607:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     60d:	e8 6e 33 00 00       	call   3980 <printf>
    exit();
     612:	e8 0b 32 00 00       	call   3822 <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     617:	83 ec 08             	sub    $0x8,%esp
     61a:	68 8c 3e 00 00       	push   $0x3e8c
     61f:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     625:	e8 56 33 00 00       	call   3980 <printf>
    exit();
     62a:	e8 f3 31 00 00       	call   3822 <exit>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     62f:	83 ec 08             	sub    $0x8,%esp
     632:	68 08 3e 00 00       	push   $0x3e08
     637:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     63d:	e8 3e 33 00 00       	call   3980 <printf>
    exit();
     642:	e8 db 31 00 00       	call   3822 <exit>
     647:	89 f6                	mov    %esi,%esi
     649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000650 <writetest1>:
  printf(stdout, "small file test ok\n");
}

void
writetest1(void)
{
     650:	55                   	push   %ebp
     651:	89 e5                	mov    %esp,%ebp
     653:	56                   	push   %esi
     654:	53                   	push   %ebx
  int i, fd, n;

  printf(stdout, "big files test\n");
     655:	83 ec 08             	sub    $0x8,%esp
     658:	68 b5 3e 00 00       	push   $0x3eb5
     65d:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     663:	e8 18 33 00 00       	call   3980 <printf>

  fd = open("big", O_CREATE|O_RDWR);
     668:	59                   	pop    %ecx
     669:	5b                   	pop    %ebx
     66a:	68 02 02 00 00       	push   $0x202
     66f:	68 2f 3f 00 00       	push   $0x3f2f
     674:	e8 e9 31 00 00       	call   3862 <open>
  if(fd < 0){
     679:	83 c4 10             	add    $0x10,%esp
     67c:	85 c0                	test   %eax,%eax
     67e:	0f 88 64 01 00 00    	js     7e8 <writetest1+0x198>
     684:	89 c6                	mov    %eax,%esi
     686:	31 db                	xor    %ebx,%ebx
     688:	90                   	nop
     689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
     690:	83 ec 04             	sub    $0x4,%esp
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
     693:	89 1d c0 84 00 00    	mov    %ebx,0x84c0
    if(write(fd, buf, 512) != 512){
     699:	68 00 02 00 00       	push   $0x200
     69e:	68 c0 84 00 00       	push   $0x84c0
     6a3:	56                   	push   %esi
     6a4:	e8 99 31 00 00       	call   3842 <write>
     6a9:	83 c4 10             	add    $0x10,%esp
     6ac:	3d 00 02 00 00       	cmp    $0x200,%eax
     6b1:	0f 85 b3 00 00 00    	jne    76a <writetest1+0x11a>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
     6b7:	83 c3 01             	add    $0x1,%ebx
     6ba:	81 fb 8b 40 00 00    	cmp    $0x408b,%ebx
     6c0:	75 ce                	jne    690 <writetest1+0x40>
      printf(stdout, "error: write big file failed\n", i);
      exit();
    }
  }

  close(fd);
     6c2:	83 ec 0c             	sub    $0xc,%esp
     6c5:	56                   	push   %esi
     6c6:	e8 7f 31 00 00       	call   384a <close>

  fd = open("big", O_RDONLY);
     6cb:	58                   	pop    %eax
     6cc:	5a                   	pop    %edx
     6cd:	6a 00                	push   $0x0
     6cf:	68 2f 3f 00 00       	push   $0x3f2f
     6d4:	e8 89 31 00 00       	call   3862 <open>
  if(fd < 0){
     6d9:	83 c4 10             	add    $0x10,%esp
     6dc:	85 c0                	test   %eax,%eax
    }
  }

  close(fd);

  fd = open("big", O_RDONLY);
     6de:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     6e0:	0f 88 ea 00 00 00    	js     7d0 <writetest1+0x180>
     6e6:	31 db                	xor    %ebx,%ebx
     6e8:	eb 1d                	jmp    707 <writetest1+0xb7>
     6ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
     6f0:	3d 00 02 00 00       	cmp    $0x200,%eax
     6f5:	0f 85 9f 00 00 00    	jne    79a <writetest1+0x14a>
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
     6fb:	a1 c0 84 00 00       	mov    0x84c0,%eax
     700:	39 c3                	cmp    %eax,%ebx
     702:	75 7f                	jne    783 <writetest1+0x133>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
     704:	83 c3 01             	add    $0x1,%ebx
    exit();
  }

  n = 0;
  for(;;){
    i = read(fd, buf, 512);
     707:	83 ec 04             	sub    $0x4,%esp
     70a:	68 00 02 00 00       	push   $0x200
     70f:	68 c0 84 00 00       	push   $0x84c0
     714:	56                   	push   %esi
     715:	e8 20 31 00 00       	call   383a <read>
    if(i == 0){
     71a:	83 c4 10             	add    $0x10,%esp
     71d:	85 c0                	test   %eax,%eax
     71f:	75 cf                	jne    6f0 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     721:	81 fb 8a 40 00 00    	cmp    $0x408a,%ebx
     727:	0f 84 86 00 00 00    	je     7b3 <writetest1+0x163>
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
  }
  close(fd);
     72d:	83 ec 0c             	sub    $0xc,%esp
     730:	56                   	push   %esi
     731:	e8 14 31 00 00       	call   384a <close>
  if(unlink("big") < 0){
     736:	c7 04 24 2f 3f 00 00 	movl   $0x3f2f,(%esp)
     73d:	e8 30 31 00 00       	call   3872 <unlink>
     742:	83 c4 10             	add    $0x10,%esp
     745:	85 c0                	test   %eax,%eax
     747:	0f 88 b3 00 00 00    	js     800 <writetest1+0x1b0>
    printf(stdout, "unlink big failed\n");
    exit();
  }
  printf(stdout, "big files ok\n");
     74d:	83 ec 08             	sub    $0x8,%esp
     750:	68 56 3f 00 00       	push   $0x3f56
     755:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     75b:	e8 20 32 00 00       	call   3980 <printf>
}
     760:	83 c4 10             	add    $0x10,%esp
     763:	8d 65 f8             	lea    -0x8(%ebp),%esp
     766:	5b                   	pop    %ebx
     767:	5e                   	pop    %esi
     768:	5d                   	pop    %ebp
     769:	c3                   	ret    
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
      printf(stdout, "error: write big file failed\n", i);
     76a:	83 ec 04             	sub    $0x4,%esp
     76d:	53                   	push   %ebx
     76e:	68 df 3e 00 00       	push   $0x3edf
     773:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     779:	e8 02 32 00 00       	call   3980 <printf>
      exit();
     77e:	e8 9f 30 00 00       	call   3822 <exit>
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     783:	50                   	push   %eax
     784:	53                   	push   %ebx
     785:	68 0c 4d 00 00       	push   $0x4d0c
     78a:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     790:	e8 eb 31 00 00       	call   3980 <printf>
             n, ((int*)buf)[0]);
      exit();
     795:	e8 88 30 00 00       	call   3822 <exit>
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
     79a:	83 ec 04             	sub    $0x4,%esp
     79d:	50                   	push   %eax
     79e:	68 33 3f 00 00       	push   $0x3f33
     7a3:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     7a9:	e8 d2 31 00 00       	call   3980 <printf>
      exit();
     7ae:	e8 6f 30 00 00       	call   3822 <exit>
  n = 0;
  for(;;){
    i = read(fd, buf, 512);
    if(i == 0){
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
     7b3:	83 ec 04             	sub    $0x4,%esp
     7b6:	68 8a 40 00 00       	push   $0x408a
     7bb:	68 16 3f 00 00       	push   $0x3f16
     7c0:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     7c6:	e8 b5 31 00 00       	call   3980 <printf>
        exit();
     7cb:	e8 52 30 00 00       	call   3822 <exit>

  close(fd);

  fd = open("big", O_RDONLY);
  if(fd < 0){
    printf(stdout, "error: open big failed!\n");
     7d0:	83 ec 08             	sub    $0x8,%esp
     7d3:	68 fd 3e 00 00       	push   $0x3efd
     7d8:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     7de:	e8 9d 31 00 00       	call   3980 <printf>
    exit();
     7e3:	e8 3a 30 00 00       	call   3822 <exit>

  printf(stdout, "big files test\n");

  fd = open("big", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
     7e8:	83 ec 08             	sub    $0x8,%esp
     7eb:	68 c5 3e 00 00       	push   $0x3ec5
     7f0:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     7f6:	e8 85 31 00 00       	call   3980 <printf>
    exit();
     7fb:	e8 22 30 00 00       	call   3822 <exit>
    }
    n++;
  }
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
     800:	83 ec 08             	sub    $0x8,%esp
     803:	68 43 3f 00 00       	push   $0x3f43
     808:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     80e:	e8 6d 31 00 00       	call   3980 <printf>
    exit();
     813:	e8 0a 30 00 00       	call   3822 <exit>
     818:	90                   	nop
     819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000820 <createtest>:
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     820:	55                   	push   %ebp
     821:	89 e5                	mov    %esp,%ebp
     823:	53                   	push   %ebx
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
     824:	bb 30 00 00 00       	mov    $0x30,%ebx
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     829:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     82c:	68 2c 4d 00 00       	push   $0x4d2c
     831:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     837:	e8 44 31 00 00       	call   3980 <printf>

  name[0] = 'a';
     83c:	c6 05 c0 a4 00 00 61 	movb   $0x61,0xa4c0
  name[2] = '\0';
     843:	c6 05 c2 a4 00 00 00 	movb   $0x0,0xa4c2
     84a:	83 c4 10             	add    $0x10,%esp
     84d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
     850:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     853:	88 1d c1 a4 00 00    	mov    %bl,0xa4c1
     859:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     85c:	68 02 02 00 00       	push   $0x202
     861:	68 c0 a4 00 00       	push   $0xa4c0
     866:	e8 f7 2f 00 00       	call   3862 <open>
    close(fd);
     86b:	89 04 24             	mov    %eax,(%esp)
     86e:	e8 d7 2f 00 00       	call   384a <close>

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     873:	83 c4 10             	add    $0x10,%esp
     876:	80 fb 64             	cmp    $0x64,%bl
     879:	75 d5                	jne    850 <createtest+0x30>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     87b:	c6 05 c0 a4 00 00 61 	movb   $0x61,0xa4c0
  name[2] = '\0';
     882:	c6 05 c2 a4 00 00 00 	movb   $0x0,0xa4c2
     889:	bb 30 00 00 00       	mov    $0x30,%ebx
     88e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    unlink(name);
     890:	83 ec 0c             	sub    $0xc,%esp
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     893:	88 1d c1 a4 00 00    	mov    %bl,0xa4c1
     899:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
     89c:	68 c0 a4 00 00       	push   $0xa4c0
     8a1:	e8 cc 2f 00 00       	call   3872 <unlink>
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     8a6:	83 c4 10             	add    $0x10,%esp
     8a9:	80 fb 64             	cmp    $0x64,%bl
     8ac:	75 e2                	jne    890 <createtest+0x70>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     8ae:	83 ec 08             	sub    $0x8,%esp
     8b1:	68 54 4d 00 00       	push   $0x4d54
     8b6:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     8bc:	e8 bf 30 00 00       	call   3980 <printf>
}
     8c1:	83 c4 10             	add    $0x10,%esp
     8c4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8c7:	c9                   	leave  
     8c8:	c3                   	ret    
     8c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008d0 <dirtest>:

void dirtest(void)
{
     8d0:	55                   	push   %ebp
     8d1:	89 e5                	mov    %esp,%ebp
     8d3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     8d6:	68 64 3f 00 00       	push   $0x3f64
     8db:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     8e1:	e8 9a 30 00 00       	call   3980 <printf>

  if(mkdir("dir0") < 0){
     8e6:	c7 04 24 70 3f 00 00 	movl   $0x3f70,(%esp)
     8ed:	e8 98 2f 00 00       	call   388a <mkdir>
     8f2:	83 c4 10             	add    $0x10,%esp
     8f5:	85 c0                	test   %eax,%eax
     8f7:	78 58                	js     951 <dirtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
     8f9:	83 ec 0c             	sub    $0xc,%esp
     8fc:	68 70 3f 00 00       	push   $0x3f70
     901:	e8 8c 2f 00 00       	call   3892 <chdir>
     906:	83 c4 10             	add    $0x10,%esp
     909:	85 c0                	test   %eax,%eax
     90b:	0f 88 85 00 00 00    	js     996 <dirtest+0xc6>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
     911:	83 ec 0c             	sub    $0xc,%esp
     914:	68 15 45 00 00       	push   $0x4515
     919:	e8 74 2f 00 00       	call   3892 <chdir>
     91e:	83 c4 10             	add    $0x10,%esp
     921:	85 c0                	test   %eax,%eax
     923:	78 5a                	js     97f <dirtest+0xaf>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
     925:	83 ec 0c             	sub    $0xc,%esp
     928:	68 70 3f 00 00       	push   $0x3f70
     92d:	e8 40 2f 00 00       	call   3872 <unlink>
     932:	83 c4 10             	add    $0x10,%esp
     935:	85 c0                	test   %eax,%eax
     937:	78 2f                	js     968 <dirtest+0x98>
    printf(stdout, "unlink dir0 failed\n");
    exit();
  }
  printf(stdout, "mkdir test ok\n");
     939:	83 ec 08             	sub    $0x8,%esp
     93c:	68 ad 3f 00 00       	push   $0x3fad
     941:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     947:	e8 34 30 00 00       	call   3980 <printf>
}
     94c:	83 c4 10             	add    $0x10,%esp
     94f:	c9                   	leave  
     950:	c3                   	ret    
void dirtest(void)
{
  printf(stdout, "mkdir test\n");

  if(mkdir("dir0") < 0){
    printf(stdout, "mkdir failed\n");
     951:	50                   	push   %eax
     952:	50                   	push   %eax
     953:	68 a0 3c 00 00       	push   $0x3ca0
     958:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     95e:	e8 1d 30 00 00       	call   3980 <printf>
    exit();
     963:	e8 ba 2e 00 00       	call   3822 <exit>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
    printf(stdout, "unlink dir0 failed\n");
     968:	50                   	push   %eax
     969:	50                   	push   %eax
     96a:	68 99 3f 00 00       	push   $0x3f99
     96f:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     975:	e8 06 30 00 00       	call   3980 <printf>
    exit();
     97a:	e8 a3 2e 00 00       	call   3822 <exit>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
    printf(stdout, "chdir .. failed\n");
     97f:	52                   	push   %edx
     980:	52                   	push   %edx
     981:	68 88 3f 00 00       	push   $0x3f88
     986:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     98c:	e8 ef 2f 00 00       	call   3980 <printf>
    exit();
     991:	e8 8c 2e 00 00       	call   3822 <exit>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
    printf(stdout, "chdir dir0 failed\n");
     996:	51                   	push   %ecx
     997:	51                   	push   %ecx
     998:	68 75 3f 00 00       	push   $0x3f75
     99d:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     9a3:	e8 d8 2f 00 00       	call   3980 <printf>
    exit();
     9a8:	e8 75 2e 00 00       	call   3822 <exit>
     9ad:	8d 76 00             	lea    0x0(%esi),%esi

000009b0 <exectest>:
  printf(stdout, "mkdir test ok\n");
}

void
exectest(void)
{
     9b0:	55                   	push   %ebp
     9b1:	89 e5                	mov    %esp,%ebp
     9b3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     9b6:	68 bc 3f 00 00       	push   $0x3fbc
     9bb:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     9c1:	e8 ba 2f 00 00       	call   3980 <printf>
  if(exec("echo", echoargv) < 0){
     9c6:	5a                   	pop    %edx
     9c7:	59                   	pop    %ecx
     9c8:	68 ec 5c 00 00       	push   $0x5cec
     9cd:	68 85 3d 00 00       	push   $0x3d85
     9d2:	e8 83 2e 00 00       	call   385a <exec>
     9d7:	83 c4 10             	add    $0x10,%esp
     9da:	85 c0                	test   %eax,%eax
     9dc:	78 02                	js     9e0 <exectest+0x30>
    printf(stdout, "exec echo failed\n");
    exit();
  }
}
     9de:	c9                   	leave  
     9df:	c3                   	ret    
void
exectest(void)
{
  printf(stdout, "exec test\n");
  if(exec("echo", echoargv) < 0){
    printf(stdout, "exec echo failed\n");
     9e0:	50                   	push   %eax
     9e1:	50                   	push   %eax
     9e2:	68 c7 3f 00 00       	push   $0x3fc7
     9e7:	ff 35 e8 5c 00 00    	pushl  0x5ce8
     9ed:	e8 8e 2f 00 00       	call   3980 <printf>
    exit();
     9f2:	e8 2b 2e 00 00       	call   3822 <exit>
     9f7:	89 f6                	mov    %esi,%esi
     9f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a00 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     a00:	55                   	push   %ebp
     a01:	89 e5                	mov    %esp,%ebp
     a03:	57                   	push   %edi
     a04:	56                   	push   %esi
     a05:	53                   	push   %ebx
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     a06:	8d 45 e0             	lea    -0x20(%ebp),%eax

// simple fork and pipe read/write

void
pipe1(void)
{
     a09:	83 ec 38             	sub    $0x38,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     a0c:	50                   	push   %eax
     a0d:	e8 20 2e 00 00       	call   3832 <pipe>
     a12:	83 c4 10             	add    $0x10,%esp
     a15:	85 c0                	test   %eax,%eax
     a17:	0f 85 35 01 00 00    	jne    b52 <pipe1+0x152>
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
     a1d:	e8 f8 2d 00 00       	call   381a <fork>
  seq = 0;
  if(pid == 0){
     a22:	83 f8 00             	cmp    $0x0,%eax
     a25:	0f 84 86 00 00 00    	je     ab1 <pipe1+0xb1>
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
  } else if(pid > 0){
     a2b:	0f 8e 35 01 00 00    	jle    b66 <pipe1+0x166>
    close(fds[1]);
     a31:	83 ec 0c             	sub    $0xc,%esp
     a34:	ff 75 e4             	pushl  -0x1c(%ebp)
    total = 0;
    cc = 1;
     a37:	bf 01 00 00 00       	mov    $0x1,%edi
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
  seq = 0;
     a3c:	31 db                	xor    %ebx,%ebx
        exit();
      }
    }
    exit();
  } else if(pid > 0){
    close(fds[1]);
     a3e:	e8 07 2e 00 00       	call   384a <close>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     a43:	83 c4 10             	add    $0x10,%esp
      }
    }
    exit();
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
     a46:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     a4d:	83 ec 04             	sub    $0x4,%esp
     a50:	57                   	push   %edi
     a51:	68 c0 84 00 00       	push   $0x84c0
     a56:	ff 75 e0             	pushl  -0x20(%ebp)
     a59:	e8 dc 2d 00 00       	call   383a <read>
     a5e:	83 c4 10             	add    $0x10,%esp
     a61:	85 c0                	test   %eax,%eax
     a63:	0f 8e a3 00 00 00    	jle    b0c <pipe1+0x10c>
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     a69:	89 d9                	mov    %ebx,%ecx
     a6b:	8d 34 18             	lea    (%eax,%ebx,1),%esi
     a6e:	f7 d9                	neg    %ecx
     a70:	38 9c 0b c0 84 00 00 	cmp    %bl,0x84c0(%ebx,%ecx,1)
     a77:	8d 53 01             	lea    0x1(%ebx),%edx
     a7a:	75 1b                	jne    a97 <pipe1+0x97>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     a7c:	39 f2                	cmp    %esi,%edx
     a7e:	89 d3                	mov    %edx,%ebx
     a80:	75 ee                	jne    a70 <pipe1+0x70>
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
      cc = cc * 2;
     a82:	01 ff                	add    %edi,%edi
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     a84:	01 45 d4             	add    %eax,-0x2c(%ebp)
     a87:	b8 00 20 00 00       	mov    $0x2000,%eax
     a8c:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
     a92:	0f 4f f8             	cmovg  %eax,%edi
     a95:	eb b6                	jmp    a4d <pipe1+0x4d>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
     a97:	83 ec 08             	sub    $0x8,%esp
     a9a:	68 f6 3f 00 00       	push   $0x3ff6
     a9f:	6a 01                	push   $0x1
     aa1:	e8 da 2e 00 00       	call   3980 <printf>
          return;
     aa6:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
}
     aa9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     aac:	5b                   	pop    %ebx
     aad:	5e                   	pop    %esi
     aae:	5f                   	pop    %edi
     aaf:	5d                   	pop    %ebp
     ab0:	c3                   	ret    
    exit();
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
     ab1:	83 ec 0c             	sub    $0xc,%esp
     ab4:	ff 75 e0             	pushl  -0x20(%ebp)
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
  seq = 0;
     ab7:	31 f6                	xor    %esi,%esi
  if(pid == 0){
    close(fds[0]);
     ab9:	e8 8c 2d 00 00       	call   384a <close>
     abe:	83 c4 10             	add    $0x10,%esp
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     ac1:	89 f0                	mov    %esi,%eax
     ac3:	8d 96 09 04 00 00    	lea    0x409(%esi),%edx

// simple fork and pipe read/write

void
pipe1(void)
{
     ac9:	89 f3                	mov    %esi,%ebx
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     acb:	f7 d8                	neg    %eax
     acd:	8d 76 00             	lea    0x0(%esi),%esi
     ad0:	88 9c 18 c0 84 00 00 	mov    %bl,0x84c0(%eax,%ebx,1)
     ad7:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     ada:	39 d3                	cmp    %edx,%ebx
     adc:	75 f2                	jne    ad0 <pipe1+0xd0>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     ade:	83 ec 04             	sub    $0x4,%esp
     ae1:	89 de                	mov    %ebx,%esi
     ae3:	68 09 04 00 00       	push   $0x409
     ae8:	68 c0 84 00 00       	push   $0x84c0
     aed:	ff 75 e4             	pushl  -0x1c(%ebp)
     af0:	e8 4d 2d 00 00       	call   3842 <write>
     af5:	83 c4 10             	add    $0x10,%esp
     af8:	3d 09 04 00 00       	cmp    $0x409,%eax
     afd:	75 7b                	jne    b7a <pipe1+0x17a>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     aff:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     b05:	75 ba                	jne    ac1 <pipe1+0xc1>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
     b07:	e8 16 2d 00 00       	call   3822 <exit>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     b0c:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     b13:	75 26                	jne    b3b <pipe1+0x13b>
      printf(1, "pipe1 oops 3 total %d\n", total);
      exit();
    }
    close(fds[0]);
     b15:	83 ec 0c             	sub    $0xc,%esp
     b18:	ff 75 e0             	pushl  -0x20(%ebp)
     b1b:	e8 2a 2d 00 00       	call   384a <close>
    wait();
     b20:	e8 05 2d 00 00       	call   382a <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
     b25:	58                   	pop    %eax
     b26:	5a                   	pop    %edx
     b27:	68 1b 40 00 00       	push   $0x401b
     b2c:	6a 01                	push   $0x1
     b2e:	e8 4d 2e 00 00       	call   3980 <printf>
     b33:	83 c4 10             	add    $0x10,%esp
     b36:	e9 6e ff ff ff       	jmp    aa9 <pipe1+0xa9>
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
      printf(1, "pipe1 oops 3 total %d\n", total);
     b3b:	83 ec 04             	sub    $0x4,%esp
     b3e:	ff 75 d4             	pushl  -0x2c(%ebp)
     b41:	68 04 40 00 00       	push   $0x4004
     b46:	6a 01                	push   $0x1
     b48:	e8 33 2e 00 00       	call   3980 <printf>
      exit();
     b4d:	e8 d0 2c 00 00       	call   3822 <exit>
{
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
     b52:	83 ec 08             	sub    $0x8,%esp
     b55:	68 d9 3f 00 00       	push   $0x3fd9
     b5a:	6a 01                	push   $0x1
     b5c:	e8 1f 2e 00 00       	call   3980 <printf>
    exit();
     b61:	e8 bc 2c 00 00       	call   3822 <exit>
      exit();
    }
    close(fds[0]);
    wait();
  } else {
    printf(1, "fork() failed\n");
     b66:	83 ec 08             	sub    $0x8,%esp
     b69:	68 25 40 00 00       	push   $0x4025
     b6e:	6a 01                	push   $0x1
     b70:	e8 0b 2e 00 00       	call   3980 <printf>
    exit();
     b75:	e8 a8 2c 00 00       	call   3822 <exit>
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
     b7a:	83 ec 08             	sub    $0x8,%esp
     b7d:	68 e8 3f 00 00       	push   $0x3fe8
     b82:	6a 01                	push   $0x1
     b84:	e8 f7 2d 00 00       	call   3980 <printf>
        exit();
     b89:	e8 94 2c 00 00       	call   3822 <exit>
     b8e:	66 90                	xchg   %ax,%ax

00000b90 <preempt>:
}

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     b90:	55                   	push   %ebp
     b91:	89 e5                	mov    %esp,%ebp
     b93:	57                   	push   %edi
     b94:	56                   	push   %esi
     b95:	53                   	push   %ebx
     b96:	83 ec 24             	sub    $0x24,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     b99:	68 34 40 00 00       	push   $0x4034
     b9e:	6a 01                	push   $0x1
     ba0:	e8 db 2d 00 00       	call   3980 <printf>
  pid1 = fork();
     ba5:	e8 70 2c 00 00       	call   381a <fork>
  if(pid1 == 0)
     baa:	83 c4 10             	add    $0x10,%esp
     bad:	85 c0                	test   %eax,%eax
     baf:	75 02                	jne    bb3 <preempt+0x23>
     bb1:	eb fe                	jmp    bb1 <preempt+0x21>
     bb3:	89 c7                	mov    %eax,%edi
    for(;;)
      ;

  pid2 = fork();
     bb5:	e8 60 2c 00 00       	call   381a <fork>
  if(pid2 == 0)
     bba:	85 c0                	test   %eax,%eax
  pid1 = fork();
  if(pid1 == 0)
    for(;;)
      ;

  pid2 = fork();
     bbc:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     bbe:	75 02                	jne    bc2 <preempt+0x32>
     bc0:	eb fe                	jmp    bc0 <preempt+0x30>
    for(;;)
      ;

  pipe(pfds);
     bc2:	8d 45 e0             	lea    -0x20(%ebp),%eax
     bc5:	83 ec 0c             	sub    $0xc,%esp
     bc8:	50                   	push   %eax
     bc9:	e8 64 2c 00 00       	call   3832 <pipe>
  pid3 = fork();
     bce:	e8 47 2c 00 00       	call   381a <fork>
  if(pid3 == 0){
     bd3:	83 c4 10             	add    $0x10,%esp
     bd6:	85 c0                	test   %eax,%eax
  if(pid2 == 0)
    for(;;)
      ;

  pipe(pfds);
  pid3 = fork();
     bd8:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
     bda:	75 47                	jne    c23 <preempt+0x93>
    close(pfds[0]);
     bdc:	83 ec 0c             	sub    $0xc,%esp
     bdf:	ff 75 e0             	pushl  -0x20(%ebp)
     be2:	e8 63 2c 00 00       	call   384a <close>
    if(write(pfds[1], "x", 1) != 1)
     be7:	83 c4 0c             	add    $0xc,%esp
     bea:	6a 01                	push   $0x1
     bec:	68 f9 45 00 00       	push   $0x45f9
     bf1:	ff 75 e4             	pushl  -0x1c(%ebp)
     bf4:	e8 49 2c 00 00       	call   3842 <write>
     bf9:	83 c4 10             	add    $0x10,%esp
     bfc:	83 f8 01             	cmp    $0x1,%eax
     bff:	74 12                	je     c13 <preempt+0x83>
      printf(1, "preempt write error");
     c01:	83 ec 08             	sub    $0x8,%esp
     c04:	68 3e 40 00 00       	push   $0x403e
     c09:	6a 01                	push   $0x1
     c0b:	e8 70 2d 00 00       	call   3980 <printf>
     c10:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     c13:	83 ec 0c             	sub    $0xc,%esp
     c16:	ff 75 e4             	pushl  -0x1c(%ebp)
     c19:	e8 2c 2c 00 00       	call   384a <close>
     c1e:	83 c4 10             	add    $0x10,%esp
     c21:	eb fe                	jmp    c21 <preempt+0x91>
    for(;;)
      ;
  }

  close(pfds[1]);
     c23:	83 ec 0c             	sub    $0xc,%esp
     c26:	ff 75 e4             	pushl  -0x1c(%ebp)
     c29:	e8 1c 2c 00 00       	call   384a <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     c2e:	83 c4 0c             	add    $0xc,%esp
     c31:	68 00 20 00 00       	push   $0x2000
     c36:	68 c0 84 00 00       	push   $0x84c0
     c3b:	ff 75 e0             	pushl  -0x20(%ebp)
     c3e:	e8 f7 2b 00 00       	call   383a <read>
     c43:	83 c4 10             	add    $0x10,%esp
     c46:	83 f8 01             	cmp    $0x1,%eax
     c49:	74 1a                	je     c65 <preempt+0xd5>
    printf(1, "preempt read error");
     c4b:	83 ec 08             	sub    $0x8,%esp
     c4e:	68 52 40 00 00       	push   $0x4052
     c53:	6a 01                	push   $0x1
     c55:	e8 26 2d 00 00       	call   3980 <printf>
    return;
     c5a:	83 c4 10             	add    $0x10,%esp
  printf(1, "wait... ");
  wait();
  wait();
  wait();
  printf(1, "preempt ok\n");
}
     c5d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c60:	5b                   	pop    %ebx
     c61:	5e                   	pop    %esi
     c62:	5f                   	pop    %edi
     c63:	5d                   	pop    %ebp
     c64:	c3                   	ret    
  close(pfds[1]);
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    printf(1, "preempt read error");
    return;
  }
  close(pfds[0]);
     c65:	83 ec 0c             	sub    $0xc,%esp
     c68:	ff 75 e0             	pushl  -0x20(%ebp)
     c6b:	e8 da 2b 00 00       	call   384a <close>
  printf(1, "kill... ");
     c70:	58                   	pop    %eax
     c71:	5a                   	pop    %edx
     c72:	68 65 40 00 00       	push   $0x4065
     c77:	6a 01                	push   $0x1
     c79:	e8 02 2d 00 00       	call   3980 <printf>
  kill(pid1);
     c7e:	89 3c 24             	mov    %edi,(%esp)
     c81:	e8 cc 2b 00 00       	call   3852 <kill>
  kill(pid2);
     c86:	89 34 24             	mov    %esi,(%esp)
     c89:	e8 c4 2b 00 00       	call   3852 <kill>
  kill(pid3);
     c8e:	89 1c 24             	mov    %ebx,(%esp)
     c91:	e8 bc 2b 00 00       	call   3852 <kill>
  printf(1, "wait... ");
     c96:	59                   	pop    %ecx
     c97:	5b                   	pop    %ebx
     c98:	68 6e 40 00 00       	push   $0x406e
     c9d:	6a 01                	push   $0x1
     c9f:	e8 dc 2c 00 00       	call   3980 <printf>
  wait();
     ca4:	e8 81 2b 00 00       	call   382a <wait>
  wait();
     ca9:	e8 7c 2b 00 00       	call   382a <wait>
  wait();
     cae:	e8 77 2b 00 00       	call   382a <wait>
  printf(1, "preempt ok\n");
     cb3:	5e                   	pop    %esi
     cb4:	5f                   	pop    %edi
     cb5:	68 77 40 00 00       	push   $0x4077
     cba:	6a 01                	push   $0x1
     cbc:	e8 bf 2c 00 00       	call   3980 <printf>
     cc1:	83 c4 10             	add    $0x10,%esp
     cc4:	eb 97                	jmp    c5d <preempt+0xcd>
     cc6:	8d 76 00             	lea    0x0(%esi),%esi
     cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000cd0 <exitwait>:
}

// try to find any races between exit and wait
void
exitwait(void)
{
     cd0:	55                   	push   %ebp
     cd1:	89 e5                	mov    %esp,%ebp
     cd3:	56                   	push   %esi
     cd4:	be 64 00 00 00       	mov    $0x64,%esi
     cd9:	53                   	push   %ebx
     cda:	eb 14                	jmp    cf0 <exitwait+0x20>
     cdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
     ce0:	74 6f                	je     d51 <exitwait+0x81>
      if(wait() != pid){
     ce2:	e8 43 2b 00 00       	call   382a <wait>
     ce7:	39 c3                	cmp    %eax,%ebx
     ce9:	75 2d                	jne    d18 <exitwait+0x48>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     ceb:	83 ee 01             	sub    $0x1,%esi
     cee:	74 48                	je     d38 <exitwait+0x68>
    pid = fork();
     cf0:	e8 25 2b 00 00       	call   381a <fork>
    if(pid < 0){
     cf5:	85 c0                	test   %eax,%eax
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
    pid = fork();
     cf7:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     cf9:	79 e5                	jns    ce0 <exitwait+0x10>
      printf(1, "fork failed\n");
     cfb:	83 ec 08             	sub    $0x8,%esp
     cfe:	68 e1 4b 00 00       	push   $0x4be1
     d03:	6a 01                	push   $0x1
     d05:	e8 76 2c 00 00       	call   3980 <printf>
      return;
     d0a:	83 c4 10             	add    $0x10,%esp
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     d0d:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d10:	5b                   	pop    %ebx
     d11:	5e                   	pop    %esi
     d12:	5d                   	pop    %ebp
     d13:	c3                   	ret    
     d14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
     d18:	83 ec 08             	sub    $0x8,%esp
     d1b:	68 83 40 00 00       	push   $0x4083
     d20:	6a 01                	push   $0x1
     d22:	e8 59 2c 00 00       	call   3980 <printf>
        return;
     d27:	83 c4 10             	add    $0x10,%esp
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     d2a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d2d:	5b                   	pop    %ebx
     d2e:	5e                   	pop    %esi
     d2f:	5d                   	pop    %ebp
     d30:	c3                   	ret    
     d31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
     d38:	83 ec 08             	sub    $0x8,%esp
     d3b:	68 93 40 00 00       	push   $0x4093
     d40:	6a 01                	push   $0x1
     d42:	e8 39 2c 00 00       	call   3980 <printf>
     d47:	83 c4 10             	add    $0x10,%esp
}
     d4a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d4d:	5b                   	pop    %ebx
     d4e:	5e                   	pop    %esi
     d4f:	5d                   	pop    %ebp
     d50:	c3                   	ret    
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
        return;
      }
    } else {
      exit();
     d51:	e8 cc 2a 00 00       	call   3822 <exit>
     d56:	8d 76 00             	lea    0x0(%esi),%esi
     d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d60 <mem>:
  printf(1, "exitwait ok\n");
}

void
mem(void)
{
     d60:	55                   	push   %ebp
     d61:	89 e5                	mov    %esp,%ebp
     d63:	57                   	push   %edi
     d64:	56                   	push   %esi
     d65:	53                   	push   %ebx
     d66:	83 ec 14             	sub    $0x14,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     d69:	68 a0 40 00 00       	push   $0x40a0
     d6e:	6a 01                	push   $0x1
     d70:	e8 0b 2c 00 00       	call   3980 <printf>
  ppid = getpid();
     d75:	e8 28 2b 00 00       	call   38a2 <getpid>
     d7a:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
     d7c:	e8 99 2a 00 00       	call   381a <fork>
     d81:	83 c4 10             	add    $0x10,%esp
     d84:	85 c0                	test   %eax,%eax
     d86:	75 70                	jne    df8 <mem+0x98>
     d88:	31 db                	xor    %ebx,%ebx
     d8a:	eb 08                	jmp    d94 <mem+0x34>
     d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
     d90:	89 18                	mov    %ebx,(%eax)
     d92:	89 c3                	mov    %eax,%ebx

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     d94:	83 ec 0c             	sub    $0xc,%esp
     d97:	68 11 27 00 00       	push   $0x2711
     d9c:	e8 0f 2e 00 00       	call   3bb0 <malloc>
     da1:	83 c4 10             	add    $0x10,%esp
     da4:	85 c0                	test   %eax,%eax
     da6:	75 e8                	jne    d90 <mem+0x30>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     da8:	85 db                	test   %ebx,%ebx
     daa:	74 18                	je     dc4 <mem+0x64>
     dac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m2 = *(char**)m1;
     db0:	8b 3b                	mov    (%ebx),%edi
      free(m1);
     db2:	83 ec 0c             	sub    $0xc,%esp
     db5:	53                   	push   %ebx
     db6:	89 fb                	mov    %edi,%ebx
     db8:	e8 63 2d 00 00       	call   3b20 <free>
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     dbd:	83 c4 10             	add    $0x10,%esp
     dc0:	85 db                	test   %ebx,%ebx
     dc2:	75 ec                	jne    db0 <mem+0x50>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     dc4:	83 ec 0c             	sub    $0xc,%esp
     dc7:	68 00 50 00 00       	push   $0x5000
     dcc:	e8 df 2d 00 00       	call   3bb0 <malloc>
    if(m1 == 0){
     dd1:	83 c4 10             	add    $0x10,%esp
     dd4:	85 c0                	test   %eax,%eax
     dd6:	74 30                	je     e08 <mem+0xa8>
      printf(1, "couldn't allocate mem?!!\n");
      kill(ppid);
      exit();
    }
    free(m1);
     dd8:	83 ec 0c             	sub    $0xc,%esp
     ddb:	50                   	push   %eax
     ddc:	e8 3f 2d 00 00       	call   3b20 <free>
    printf(1, "mem ok\n");
     de1:	58                   	pop    %eax
     de2:	5a                   	pop    %edx
     de3:	68 c4 40 00 00       	push   $0x40c4
     de8:	6a 01                	push   $0x1
     dea:	e8 91 2b 00 00       	call   3980 <printf>
    exit();
     def:	e8 2e 2a 00 00       	call   3822 <exit>
     df4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else {
    wait();
  }
}
     df8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     dfb:	5b                   	pop    %ebx
     dfc:	5e                   	pop    %esi
     dfd:	5f                   	pop    %edi
     dfe:	5d                   	pop    %ebp
    }
    free(m1);
    printf(1, "mem ok\n");
    exit();
  } else {
    wait();
     dff:	e9 26 2a 00 00       	jmp    382a <wait>
     e04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
    if(m1 == 0){
      printf(1, "couldn't allocate mem?!!\n");
     e08:	83 ec 08             	sub    $0x8,%esp
     e0b:	68 aa 40 00 00       	push   $0x40aa
     e10:	6a 01                	push   $0x1
     e12:	e8 69 2b 00 00       	call   3980 <printf>
      kill(ppid);
     e17:	89 34 24             	mov    %esi,(%esp)
     e1a:	e8 33 2a 00 00       	call   3852 <kill>
      exit();
     e1f:	e8 fe 29 00 00       	call   3822 <exit>
     e24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     e2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000e30 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     e30:	55                   	push   %ebp
     e31:	89 e5                	mov    %esp,%ebp
     e33:	57                   	push   %edi
     e34:	56                   	push   %esi
     e35:	53                   	push   %ebx
     e36:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     e39:	68 cc 40 00 00       	push   $0x40cc
     e3e:	6a 01                	push   $0x1
     e40:	e8 3b 2b 00 00       	call   3980 <printf>

  unlink("sharedfd");
     e45:	c7 04 24 db 40 00 00 	movl   $0x40db,(%esp)
     e4c:	e8 21 2a 00 00       	call   3872 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     e51:	5b                   	pop    %ebx
     e52:	5e                   	pop    %esi
     e53:	68 02 02 00 00       	push   $0x202
     e58:	68 db 40 00 00       	push   $0x40db
     e5d:	e8 00 2a 00 00       	call   3862 <open>
  if(fd < 0){
     e62:	83 c4 10             	add    $0x10,%esp
     e65:	85 c0                	test   %eax,%eax
     e67:	0f 88 29 01 00 00    	js     f96 <sharedfd+0x166>
     e6d:	89 c7                	mov    %eax,%edi
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e6f:	8d 75 de             	lea    -0x22(%ebp),%esi
     e72:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     e77:	e8 9e 29 00 00       	call   381a <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e7c:	83 f8 01             	cmp    $0x1,%eax
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     e7f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e82:	19 c0                	sbb    %eax,%eax
     e84:	83 ec 04             	sub    $0x4,%esp
     e87:	83 e0 f3             	and    $0xfffffff3,%eax
     e8a:	6a 0a                	push   $0xa
     e8c:	83 c0 70             	add    $0x70,%eax
     e8f:	50                   	push   %eax
     e90:	56                   	push   %esi
     e91:	e8 fa 27 00 00       	call   3690 <memset>
     e96:	83 c4 10             	add    $0x10,%esp
     e99:	eb 0a                	jmp    ea5 <sharedfd+0x75>
     e9b:	90                   	nop
     e9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 1000; i++){
     ea0:	83 eb 01             	sub    $0x1,%ebx
     ea3:	74 26                	je     ecb <sharedfd+0x9b>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     ea5:	83 ec 04             	sub    $0x4,%esp
     ea8:	6a 0a                	push   $0xa
     eaa:	56                   	push   %esi
     eab:	57                   	push   %edi
     eac:	e8 91 29 00 00       	call   3842 <write>
     eb1:	83 c4 10             	add    $0x10,%esp
     eb4:	83 f8 0a             	cmp    $0xa,%eax
     eb7:	74 e7                	je     ea0 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
     eb9:	83 ec 08             	sub    $0x8,%esp
     ebc:	68 a8 4d 00 00       	push   $0x4da8
     ec1:	6a 01                	push   $0x1
     ec3:	e8 b8 2a 00 00       	call   3980 <printf>
      break;
     ec8:	83 c4 10             	add    $0x10,%esp
    }
  }
  if(pid == 0)
     ecb:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     ece:	85 c9                	test   %ecx,%ecx
     ed0:	0f 84 f4 00 00 00    	je     fca <sharedfd+0x19a>
    exit();
  else
    wait();
     ed6:	e8 4f 29 00 00       	call   382a <wait>
  close(fd);
     edb:	83 ec 0c             	sub    $0xc,%esp
     ede:	31 db                	xor    %ebx,%ebx
     ee0:	57                   	push   %edi
     ee1:	8d 7d e8             	lea    -0x18(%ebp),%edi
     ee4:	e8 61 29 00 00       	call   384a <close>
  fd = open("sharedfd", 0);
     ee9:	58                   	pop    %eax
     eea:	5a                   	pop    %edx
     eeb:	6a 00                	push   $0x0
     eed:	68 db 40 00 00       	push   $0x40db
     ef2:	e8 6b 29 00 00       	call   3862 <open>
  if(fd < 0){
     ef7:	83 c4 10             	add    $0x10,%esp
     efa:	31 d2                	xor    %edx,%edx
     efc:	85 c0                	test   %eax,%eax
  if(pid == 0)
    exit();
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
     efe:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(fd < 0){
     f01:	0f 88 a9 00 00 00    	js     fb0 <sharedfd+0x180>
     f07:	89 f6                	mov    %esi,%esi
     f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
     f10:	83 ec 04             	sub    $0x4,%esp
     f13:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     f16:	6a 0a                	push   $0xa
     f18:	56                   	push   %esi
     f19:	ff 75 d0             	pushl  -0x30(%ebp)
     f1c:	e8 19 29 00 00       	call   383a <read>
     f21:	83 c4 10             	add    $0x10,%esp
     f24:	85 c0                	test   %eax,%eax
     f26:	7e 27                	jle    f4f <sharedfd+0x11f>
     f28:	89 f0                	mov    %esi,%eax
     f2a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     f2d:	eb 13                	jmp    f42 <sharedfd+0x112>
     f2f:	90                   	nop
    for(i = 0; i < sizeof(buf); i++){
      if(buf[i] == 'c')
        nc++;
      if(buf[i] == 'p')
        np++;
     f30:	80 f9 70             	cmp    $0x70,%cl
     f33:	0f 94 c1             	sete   %cl
     f36:	0f b6 c9             	movzbl %cl,%ecx
     f39:	01 cb                	add    %ecx,%ebx
     f3b:	83 c0 01             	add    $0x1,%eax
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
     f3e:	39 c7                	cmp    %eax,%edi
     f40:	74 ce                	je     f10 <sharedfd+0xe0>
      if(buf[i] == 'c')
     f42:	0f b6 08             	movzbl (%eax),%ecx
     f45:	80 f9 63             	cmp    $0x63,%cl
     f48:	75 e6                	jne    f30 <sharedfd+0x100>
        nc++;
     f4a:	83 c2 01             	add    $0x1,%edx
     f4d:	eb ec                	jmp    f3b <sharedfd+0x10b>
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
     f4f:	83 ec 0c             	sub    $0xc,%esp
     f52:	ff 75 d0             	pushl  -0x30(%ebp)
     f55:	e8 f0 28 00 00       	call   384a <close>
  unlink("sharedfd");
     f5a:	c7 04 24 db 40 00 00 	movl   $0x40db,(%esp)
     f61:	e8 0c 29 00 00       	call   3872 <unlink>
  if(nc == 10000 && np == 10000){
     f66:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     f69:	83 c4 10             	add    $0x10,%esp
     f6c:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
     f72:	75 5b                	jne    fcf <sharedfd+0x19f>
     f74:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     f7a:	75 53                	jne    fcf <sharedfd+0x19f>
    printf(1, "sharedfd ok\n");
     f7c:	83 ec 08             	sub    $0x8,%esp
     f7f:	68 e4 40 00 00       	push   $0x40e4
     f84:	6a 01                	push   $0x1
     f86:	e8 f5 29 00 00       	call   3980 <printf>
     f8b:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     f8e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f91:	5b                   	pop    %ebx
     f92:	5e                   	pop    %esi
     f93:	5f                   	pop    %edi
     f94:	5d                   	pop    %ebp
     f95:	c3                   	ret    
  printf(1, "sharedfd test\n");

  unlink("sharedfd");
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
     f96:	83 ec 08             	sub    $0x8,%esp
     f99:	68 7c 4d 00 00       	push   $0x4d7c
     f9e:	6a 01                	push   $0x1
     fa0:	e8 db 29 00 00       	call   3980 <printf>
    return;
     fa5:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     fa8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fab:	5b                   	pop    %ebx
     fac:	5e                   	pop    %esi
     fad:	5f                   	pop    %edi
     fae:	5d                   	pop    %ebp
     faf:	c3                   	ret    
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
     fb0:	83 ec 08             	sub    $0x8,%esp
     fb3:	68 c8 4d 00 00       	push   $0x4dc8
     fb8:	6a 01                	push   $0x1
     fba:	e8 c1 29 00 00       	call   3980 <printf>
    return;
     fbf:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     fc2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fc5:	5b                   	pop    %ebx
     fc6:	5e                   	pop    %esi
     fc7:	5f                   	pop    %edi
     fc8:	5d                   	pop    %ebp
     fc9:	c3                   	ret    
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
    exit();
     fca:	e8 53 28 00 00       	call   3822 <exit>
  close(fd);
  unlink("sharedfd");
  if(nc == 10000 && np == 10000){
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
     fcf:	53                   	push   %ebx
     fd0:	52                   	push   %edx
     fd1:	68 f1 40 00 00       	push   $0x40f1
     fd6:	6a 01                	push   $0x1
     fd8:	e8 a3 29 00 00       	call   3980 <printf>
    exit();
     fdd:	e8 40 28 00 00       	call   3822 <exit>
     fe2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     fe9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ff0 <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
     ff0:	55                   	push   %ebp
     ff1:	89 e5                	mov    %esp,%ebp
     ff3:	57                   	push   %edi
     ff4:	56                   	push   %esi
     ff5:	53                   	push   %ebx
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");
     ff6:	be 06 41 00 00       	mov    $0x4106,%esi

  for(pi = 0; pi < 4; pi++){
     ffb:	31 db                	xor    %ebx,%ebx

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
     ffd:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    1000:	c7 45 d8 06 41 00 00 	movl   $0x4106,-0x28(%ebp)
    1007:	c7 45 dc 4f 42 00 00 	movl   $0x424f,-0x24(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    100e:	68 0c 41 00 00       	push   $0x410c
    1013:	6a 01                	push   $0x1
// time, to test block allocation.
void
fourfiles(void)
{
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    1015:	c7 45 e0 53 42 00 00 	movl   $0x4253,-0x20(%ebp)
    101c:	c7 45 e4 09 41 00 00 	movl   $0x4109,-0x1c(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    1023:	e8 58 29 00 00       	call   3980 <printf>
    1028:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    fname = names[pi];
    unlink(fname);
    102b:	83 ec 0c             	sub    $0xc,%esp
    102e:	56                   	push   %esi
    102f:	e8 3e 28 00 00       	call   3872 <unlink>

    pid = fork();
    1034:	e8 e1 27 00 00       	call   381a <fork>
    if(pid < 0){
    1039:	83 c4 10             	add    $0x10,%esp
    103c:	85 c0                	test   %eax,%eax
    103e:	0f 88 83 01 00 00    	js     11c7 <fourfiles+0x1d7>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    1044:	0f 84 e3 00 00 00    	je     112d <fourfiles+0x13d>
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");

  for(pi = 0; pi < 4; pi++){
    104a:	83 c3 01             	add    $0x1,%ebx
    104d:	83 fb 04             	cmp    $0x4,%ebx
    1050:	74 06                	je     1058 <fourfiles+0x68>
    1052:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    1056:	eb d3                	jmp    102b <fourfiles+0x3b>
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait();
    1058:	e8 cd 27 00 00       	call   382a <wait>
    105d:	bf 30 00 00 00       	mov    $0x30,%edi
    1062:	e8 c3 27 00 00       	call   382a <wait>
    1067:	e8 be 27 00 00       	call   382a <wait>
    106c:	e8 b9 27 00 00       	call   382a <wait>
    1071:	c7 45 d4 06 41 00 00 	movl   $0x4106,-0x2c(%ebp)
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    1078:	83 ec 08             	sub    $0x8,%esp
    total = 0;
    107b:	31 db                	xor    %ebx,%ebx
    wait();
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    107d:	6a 00                	push   $0x0
    107f:	ff 75 d4             	pushl  -0x2c(%ebp)
    1082:	e8 db 27 00 00       	call   3862 <open>
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1087:	83 c4 10             	add    $0x10,%esp
    wait();
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    108a:	89 c6                	mov    %eax,%esi
    108c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1090:	83 ec 04             	sub    $0x4,%esp
    1093:	68 00 20 00 00       	push   $0x2000
    1098:	68 c0 84 00 00       	push   $0x84c0
    109d:	56                   	push   %esi
    109e:	e8 97 27 00 00       	call   383a <read>
    10a3:	83 c4 10             	add    $0x10,%esp
    10a6:	85 c0                	test   %eax,%eax
    10a8:	7e 1c                	jle    10c6 <fourfiles+0xd6>
    10aa:	31 d2                	xor    %edx,%edx
    10ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
    10b0:	0f be 8a c0 84 00 00 	movsbl 0x84c0(%edx),%ecx
    10b7:	39 cf                	cmp    %ecx,%edi
    10b9:	75 5e                	jne    1119 <fourfiles+0x129>
  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
    10bb:	83 c2 01             	add    $0x1,%edx
    10be:	39 d0                	cmp    %edx,%eax
    10c0:	75 ee                	jne    10b0 <fourfiles+0xc0>
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
          exit();
        }
      }
      total += n;
    10c2:	01 c3                	add    %eax,%ebx
    10c4:	eb ca                	jmp    1090 <fourfiles+0xa0>
    }
    close(fd);
    10c6:	83 ec 0c             	sub    $0xc,%esp
    10c9:	56                   	push   %esi
    10ca:	e8 7b 27 00 00       	call   384a <close>
    if(total != 12*500){
    10cf:	83 c4 10             	add    $0x10,%esp
    10d2:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    10d8:	0f 85 d4 00 00 00    	jne    11b2 <fourfiles+0x1c2>
      printf(1, "wrong length %d\n", total);
      exit();
    }
    unlink(fname);
    10de:	83 ec 0c             	sub    $0xc,%esp
    10e1:	ff 75 d4             	pushl  -0x2c(%ebp)
    10e4:	83 c7 01             	add    $0x1,%edi
    10e7:	e8 86 27 00 00       	call   3872 <unlink>

  for(pi = 0; pi < 4; pi++){
    wait();
  }

  for(i = 0; i < 2; i++){
    10ec:	83 c4 10             	add    $0x10,%esp
    10ef:	83 ff 32             	cmp    $0x32,%edi
    10f2:	75 1a                	jne    110e <fourfiles+0x11e>
      exit();
    }
    unlink(fname);
  }

  printf(1, "fourfiles ok\n");
    10f4:	83 ec 08             	sub    $0x8,%esp
    10f7:	68 4a 41 00 00       	push   $0x414a
    10fc:	6a 01                	push   $0x1
    10fe:	e8 7d 28 00 00       	call   3980 <printf>
}
    1103:	83 c4 10             	add    $0x10,%esp
    1106:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1109:	5b                   	pop    %ebx
    110a:	5e                   	pop    %esi
    110b:	5f                   	pop    %edi
    110c:	5d                   	pop    %ebp
    110d:	c3                   	ret    
    110e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1111:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1114:	e9 5f ff ff ff       	jmp    1078 <fourfiles+0x88>
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
    1119:	83 ec 08             	sub    $0x8,%esp
    111c:	68 2d 41 00 00       	push   $0x412d
    1121:	6a 01                	push   $0x1
    1123:	e8 58 28 00 00       	call   3980 <printf>
          exit();
    1128:	e8 f5 26 00 00       	call   3822 <exit>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    112d:	83 ec 08             	sub    $0x8,%esp
    1130:	68 02 02 00 00       	push   $0x202
    1135:	56                   	push   %esi
    1136:	e8 27 27 00 00       	call   3862 <open>
      if(fd < 0){
    113b:	83 c4 10             	add    $0x10,%esp
    113e:	85 c0                	test   %eax,%eax
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    1140:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    1142:	78 5a                	js     119e <fourfiles+0x1ae>
        printf(1, "create failed\n");
        exit();
      }

      memset(buf, '0'+pi, 512);
    1144:	83 ec 04             	sub    $0x4,%esp
    1147:	83 c3 30             	add    $0x30,%ebx
    114a:	68 00 02 00 00       	push   $0x200
    114f:	53                   	push   %ebx
    1150:	bb 0c 00 00 00       	mov    $0xc,%ebx
    1155:	68 c0 84 00 00       	push   $0x84c0
    115a:	e8 31 25 00 00       	call   3690 <memset>
    115f:	83 c4 10             	add    $0x10,%esp
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
    1162:	83 ec 04             	sub    $0x4,%esp
    1165:	68 f4 01 00 00       	push   $0x1f4
    116a:	68 c0 84 00 00       	push   $0x84c0
    116f:	56                   	push   %esi
    1170:	e8 cd 26 00 00       	call   3842 <write>
    1175:	83 c4 10             	add    $0x10,%esp
    1178:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    117d:	75 0a                	jne    1189 <fourfiles+0x199>
        printf(1, "create failed\n");
        exit();
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
    117f:	83 eb 01             	sub    $0x1,%ebx
    1182:	75 de                	jne    1162 <fourfiles+0x172>
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
          exit();
        }
      }
      exit();
    1184:	e8 99 26 00 00       	call   3822 <exit>
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
    1189:	83 ec 04             	sub    $0x4,%esp
    118c:	50                   	push   %eax
    118d:	68 1c 41 00 00       	push   $0x411c
    1192:	6a 01                	push   $0x1
    1194:	e8 e7 27 00 00       	call   3980 <printf>
          exit();
    1199:	e8 84 26 00 00       	call   3822 <exit>
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "create failed\n");
    119e:	83 ec 08             	sub    $0x8,%esp
    11a1:	68 a7 43 00 00       	push   $0x43a7
    11a6:	6a 01                	push   $0x1
    11a8:	e8 d3 27 00 00       	call   3980 <printf>
        exit();
    11ad:	e8 70 26 00 00       	call   3822 <exit>
      }
      total += n;
    }
    close(fd);
    if(total != 12*500){
      printf(1, "wrong length %d\n", total);
    11b2:	83 ec 04             	sub    $0x4,%esp
    11b5:	53                   	push   %ebx
    11b6:	68 39 41 00 00       	push   $0x4139
    11bb:	6a 01                	push   $0x1
    11bd:	e8 be 27 00 00       	call   3980 <printf>
      exit();
    11c2:	e8 5b 26 00 00       	call   3822 <exit>
    fname = names[pi];
    unlink(fname);

    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    11c7:	83 ec 08             	sub    $0x8,%esp
    11ca:	68 e1 4b 00 00       	push   $0x4be1
    11cf:	6a 01                	push   $0x1
    11d1:	e8 aa 27 00 00       	call   3980 <printf>
      exit();
    11d6:	e8 47 26 00 00       	call   3822 <exit>
    11db:	90                   	nop
    11dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000011e0 <createdelete>:
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	57                   	push   %edi
    11e4:	56                   	push   %esi
    11e5:	53                   	push   %ebx
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    11e6:	31 db                	xor    %ebx,%ebx
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    11e8:	83 ec 44             	sub    $0x44,%esp
  enum { N = 20 };
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");
    11eb:	68 58 41 00 00       	push   $0x4158
    11f0:	6a 01                	push   $0x1
    11f2:	e8 89 27 00 00       	call   3980 <printf>
    11f7:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    11fa:	e8 1b 26 00 00       	call   381a <fork>
    if(pid < 0){
    11ff:	85 c0                	test   %eax,%eax
    1201:	0f 88 b7 01 00 00    	js     13be <createdelete+0x1de>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    1207:	0f 84 f6 00 00 00    	je     1303 <createdelete+0x123>
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    120d:	83 c3 01             	add    $0x1,%ebx
    1210:	83 fb 04             	cmp    $0x4,%ebx
    1213:	75 e5                	jne    11fa <createdelete+0x1a>
    1215:	8d 7d c8             	lea    -0x38(%ebp),%edi
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    1218:	31 f6                	xor    %esi,%esi
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait();
    121a:	e8 0b 26 00 00       	call   382a <wait>
    121f:	e8 06 26 00 00       	call   382a <wait>
    1224:	e8 01 26 00 00       	call   382a <wait>
    1229:	e8 fc 25 00 00       	call   382a <wait>
  }

  name[0] = name[1] = name[2] = 0;
    122e:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1232:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1238:	8d 46 30             	lea    0x30(%esi),%eax
    123b:	83 fe 09             	cmp    $0x9,%esi
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
    123e:	bb 70 00 00 00       	mov    $0x70,%ebx
    1243:	0f 9f c2             	setg   %dl
    1246:	85 f6                	test   %esi,%esi
    1248:	88 45 c7             	mov    %al,-0x39(%ebp)
    124b:	0f 94 c0             	sete   %al
    124e:	09 c2                	or     %eax,%edx
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1250:	8d 46 ff             	lea    -0x1(%esi),%eax
    1253:	88 55 c6             	mov    %dl,-0x3a(%ebp)
    1256:	89 45 c0             	mov    %eax,-0x40(%ebp)

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    1259:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      fd = open(name, 0);
    125d:	83 ec 08             	sub    $0x8,%esp
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
    1260:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[1] = '0' + i;
      fd = open(name, 0);
    1263:	6a 00                	push   $0x0
    1265:	57                   	push   %edi

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    1266:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    1269:	e8 f4 25 00 00       	call   3862 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    126e:	89 c1                	mov    %eax,%ecx
    1270:	83 c4 10             	add    $0x10,%esp
    1273:	c1 e9 1f             	shr    $0x1f,%ecx
    1276:	84 c9                	test   %cl,%cl
    1278:	74 0a                	je     1284 <createdelete+0xa4>
    127a:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    127e:	0f 85 11 01 00 00    	jne    1395 <createdelete+0x1b5>
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1284:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
    1288:	0f 86 44 01 00 00    	jbe    13d2 <createdelete+0x1f2>
        printf(1, "oops createdelete %s did exist\n", name);
        exit();
      }
      if(fd >= 0)
    128e:	85 c0                	test   %eax,%eax
    1290:	78 0c                	js     129e <createdelete+0xbe>
        close(fd);
    1292:	83 ec 0c             	sub    $0xc,%esp
    1295:	50                   	push   %eax
    1296:	e8 af 25 00 00       	call   384a <close>
    129b:	83 c4 10             	add    $0x10,%esp
    129e:	83 c3 01             	add    $0x1,%ebx
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    12a1:	80 fb 74             	cmp    $0x74,%bl
    12a4:	75 b3                	jne    1259 <createdelete+0x79>
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    12a6:	83 c6 01             	add    $0x1,%esi
    12a9:	83 fe 14             	cmp    $0x14,%esi
    12ac:	75 8a                	jne    1238 <createdelete+0x58>
    12ae:	be 70 00 00 00       	mov    $0x70,%esi
    12b3:	90                   	nop
    12b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12b8:	8d 46 c0             	lea    -0x40(%esi),%eax
    12bb:	bb 04 00 00 00       	mov    $0x4,%ebx
    12c0:	88 45 c7             	mov    %al,-0x39(%ebp)
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    12c3:	89 f0                	mov    %esi,%eax
      name[1] = '0' + i;
      unlink(name);
    12c5:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    12c8:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    12cb:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      unlink(name);
    12cf:	57                   	push   %edi
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
      name[1] = '0' + i;
    12d0:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    12d3:	e8 9a 25 00 00       	call   3872 <unlink>
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    12d8:	83 c4 10             	add    $0x10,%esp
    12db:	83 eb 01             	sub    $0x1,%ebx
    12de:	75 e3                	jne    12c3 <createdelete+0xe3>
    12e0:	83 c6 01             	add    $0x1,%esi
      if(fd >= 0)
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    12e3:	89 f0                	mov    %esi,%eax
    12e5:	3c 84                	cmp    $0x84,%al
    12e7:	75 cf                	jne    12b8 <createdelete+0xd8>
      name[1] = '0' + i;
      unlink(name);
    }
  }

  printf(1, "createdelete ok\n");
    12e9:	83 ec 08             	sub    $0x8,%esp
    12ec:	68 6b 41 00 00       	push   $0x416b
    12f1:	6a 01                	push   $0x1
    12f3:	e8 88 26 00 00       	call   3980 <printf>
}
    12f8:	83 c4 10             	add    $0x10,%esp
    12fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12fe:	5b                   	pop    %ebx
    12ff:	5e                   	pop    %esi
    1300:	5f                   	pop    %edi
    1301:	5d                   	pop    %ebp
    1302:	c3                   	ret    
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    1303:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    1306:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    130a:	be 01 00 00 00       	mov    $0x1,%esi
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    130f:	88 5d c8             	mov    %bl,-0x38(%ebp)
    1312:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[2] = '\0';
    1315:	31 db                	xor    %ebx,%ebx
    1317:	eb 12                	jmp    132b <createdelete+0x14b>
    1319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < N; i++){
    1320:	83 fe 14             	cmp    $0x14,%esi
    1323:	74 6b                	je     1390 <createdelete+0x1b0>
    1325:	83 c3 01             	add    $0x1,%ebx
    1328:	83 c6 01             	add    $0x1,%esi
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
    132b:	83 ec 08             	sub    $0x8,%esp

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
    132e:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    1331:	68 02 02 00 00       	push   $0x202
    1336:	57                   	push   %edi

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
    1337:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    133a:	e8 23 25 00 00       	call   3862 <open>
        if(fd < 0){
    133f:	83 c4 10             	add    $0x10,%esp
    1342:	85 c0                	test   %eax,%eax
    1344:	78 64                	js     13aa <createdelete+0x1ca>
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
    1346:	83 ec 0c             	sub    $0xc,%esp
    1349:	50                   	push   %eax
    134a:	e8 fb 24 00 00       	call   384a <close>
        if(i > 0 && (i % 2 ) == 0){
    134f:	83 c4 10             	add    $0x10,%esp
    1352:	85 db                	test   %ebx,%ebx
    1354:	74 cf                	je     1325 <createdelete+0x145>
    1356:	f6 c3 01             	test   $0x1,%bl
    1359:	75 c5                	jne    1320 <createdelete+0x140>
          name[1] = '0' + (i / 2);
          if(unlink(name) < 0){
    135b:	83 ec 0c             	sub    $0xc,%esp
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    135e:	89 d8                	mov    %ebx,%eax
    1360:	d1 f8                	sar    %eax
          if(unlink(name) < 0){
    1362:	57                   	push   %edi
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    1363:	83 c0 30             	add    $0x30,%eax
    1366:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    1369:	e8 04 25 00 00       	call   3872 <unlink>
    136e:	83 c4 10             	add    $0x10,%esp
    1371:	85 c0                	test   %eax,%eax
    1373:	79 ab                	jns    1320 <createdelete+0x140>
            printf(1, "unlink failed\n");
    1375:	83 ec 08             	sub    $0x8,%esp
    1378:	68 59 3d 00 00       	push   $0x3d59
    137d:	6a 01                	push   $0x1
    137f:	e8 fc 25 00 00       	call   3980 <printf>
            exit();
    1384:	e8 99 24 00 00       	call   3822 <exit>
    1389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
          }
        }
      }
      exit();
    1390:	e8 8d 24 00 00       	call   3822 <exit>
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
    1395:	83 ec 04             	sub    $0x4,%esp
    1398:	57                   	push   %edi
    1399:	68 f4 4d 00 00       	push   $0x4df4
    139e:	6a 01                	push   $0x1
    13a0:	e8 db 25 00 00       	call   3980 <printf>
        exit();
    13a5:	e8 78 24 00 00       	call   3822 <exit>
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
        if(fd < 0){
          printf(1, "create failed\n");
    13aa:	83 ec 08             	sub    $0x8,%esp
    13ad:	68 a7 43 00 00       	push   $0x43a7
    13b2:	6a 01                	push   $0x1
    13b4:	e8 c7 25 00 00       	call   3980 <printf>
          exit();
    13b9:	e8 64 24 00 00       	call   3822 <exit>
  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    13be:	83 ec 08             	sub    $0x8,%esp
    13c1:	68 e1 4b 00 00       	push   $0x4be1
    13c6:	6a 01                	push   $0x1
    13c8:	e8 b3 25 00 00       	call   3980 <printf>
      exit();
    13cd:	e8 50 24 00 00       	call   3822 <exit>
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    13d2:	85 c0                	test   %eax,%eax
    13d4:	0f 88 c4 fe ff ff    	js     129e <createdelete+0xbe>
        printf(1, "oops createdelete %s did exist\n", name);
    13da:	83 ec 04             	sub    $0x4,%esp
    13dd:	57                   	push   %edi
    13de:	68 18 4e 00 00       	push   $0x4e18
    13e3:	6a 01                	push   $0x1
    13e5:	e8 96 25 00 00       	call   3980 <printf>
        exit();
    13ea:	e8 33 24 00 00       	call   3822 <exit>
    13ef:	90                   	nop

000013f0 <unlinkread>:
}

// can I unlink a file and still read it?
void
unlinkread(void)
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	56                   	push   %esi
    13f4:	53                   	push   %ebx
  int fd, fd1;

  printf(1, "unlinkread test\n");
    13f5:	83 ec 08             	sub    $0x8,%esp
    13f8:	68 7c 41 00 00       	push   $0x417c
    13fd:	6a 01                	push   $0x1
    13ff:	e8 7c 25 00 00       	call   3980 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1404:	5b                   	pop    %ebx
    1405:	5e                   	pop    %esi
    1406:	68 02 02 00 00       	push   $0x202
    140b:	68 8d 41 00 00       	push   $0x418d
    1410:	e8 4d 24 00 00       	call   3862 <open>
  if(fd < 0){
    1415:	83 c4 10             	add    $0x10,%esp
    1418:	85 c0                	test   %eax,%eax
    141a:	0f 88 e6 00 00 00    	js     1506 <unlinkread+0x116>
    printf(1, "create unlinkread failed\n");
    exit();
  }
  write(fd, "hello", 5);
    1420:	83 ec 04             	sub    $0x4,%esp
    1423:	89 c3                	mov    %eax,%ebx
    1425:	6a 05                	push   $0x5
    1427:	68 b2 41 00 00       	push   $0x41b2
    142c:	50                   	push   %eax
    142d:	e8 10 24 00 00       	call   3842 <write>
  close(fd);
    1432:	89 1c 24             	mov    %ebx,(%esp)
    1435:	e8 10 24 00 00       	call   384a <close>

  fd = open("unlinkread", O_RDWR);
    143a:	58                   	pop    %eax
    143b:	5a                   	pop    %edx
    143c:	6a 02                	push   $0x2
    143e:	68 8d 41 00 00       	push   $0x418d
    1443:	e8 1a 24 00 00       	call   3862 <open>
  if(fd < 0){
    1448:	83 c4 10             	add    $0x10,%esp
    144b:	85 c0                	test   %eax,%eax
    exit();
  }
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
    144d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    144f:	0f 88 10 01 00 00    	js     1565 <unlinkread+0x175>
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    1455:	83 ec 0c             	sub    $0xc,%esp
    1458:	68 8d 41 00 00       	push   $0x418d
    145d:	e8 10 24 00 00       	call   3872 <unlink>
    1462:	83 c4 10             	add    $0x10,%esp
    1465:	85 c0                	test   %eax,%eax
    1467:	0f 85 e5 00 00 00    	jne    1552 <unlinkread+0x162>
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    146d:	83 ec 08             	sub    $0x8,%esp
    1470:	68 02 02 00 00       	push   $0x202
    1475:	68 8d 41 00 00       	push   $0x418d
    147a:	e8 e3 23 00 00       	call   3862 <open>
  write(fd1, "yyy", 3);
    147f:	83 c4 0c             	add    $0xc,%esp
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1482:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    1484:	6a 03                	push   $0x3
    1486:	68 ea 41 00 00       	push   $0x41ea
    148b:	50                   	push   %eax
    148c:	e8 b1 23 00 00       	call   3842 <write>
  close(fd1);
    1491:	89 34 24             	mov    %esi,(%esp)
    1494:	e8 b1 23 00 00       	call   384a <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    1499:	83 c4 0c             	add    $0xc,%esp
    149c:	68 00 20 00 00       	push   $0x2000
    14a1:	68 c0 84 00 00       	push   $0x84c0
    14a6:	53                   	push   %ebx
    14a7:	e8 8e 23 00 00       	call   383a <read>
    14ac:	83 c4 10             	add    $0x10,%esp
    14af:	83 f8 05             	cmp    $0x5,%eax
    14b2:	0f 85 87 00 00 00    	jne    153f <unlinkread+0x14f>
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    14b8:	80 3d c0 84 00 00 68 	cmpb   $0x68,0x84c0
    14bf:	75 6b                	jne    152c <unlinkread+0x13c>
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    14c1:	83 ec 04             	sub    $0x4,%esp
    14c4:	6a 0a                	push   $0xa
    14c6:	68 c0 84 00 00       	push   $0x84c0
    14cb:	53                   	push   %ebx
    14cc:	e8 71 23 00 00       	call   3842 <write>
    14d1:	83 c4 10             	add    $0x10,%esp
    14d4:	83 f8 0a             	cmp    $0xa,%eax
    14d7:	75 40                	jne    1519 <unlinkread+0x129>
    printf(1, "unlinkread write failed\n");
    exit();
  }
  close(fd);
    14d9:	83 ec 0c             	sub    $0xc,%esp
    14dc:	53                   	push   %ebx
    14dd:	e8 68 23 00 00       	call   384a <close>
  unlink("unlinkread");
    14e2:	c7 04 24 8d 41 00 00 	movl   $0x418d,(%esp)
    14e9:	e8 84 23 00 00       	call   3872 <unlink>
  printf(1, "unlinkread ok\n");
    14ee:	58                   	pop    %eax
    14ef:	5a                   	pop    %edx
    14f0:	68 35 42 00 00       	push   $0x4235
    14f5:	6a 01                	push   $0x1
    14f7:	e8 84 24 00 00       	call   3980 <printf>
}
    14fc:	83 c4 10             	add    $0x10,%esp
    14ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1502:	5b                   	pop    %ebx
    1503:	5e                   	pop    %esi
    1504:	5d                   	pop    %ebp
    1505:	c3                   	ret    
  int fd, fd1;

  printf(1, "unlinkread test\n");
  fd = open("unlinkread", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create unlinkread failed\n");
    1506:	51                   	push   %ecx
    1507:	51                   	push   %ecx
    1508:	68 98 41 00 00       	push   $0x4198
    150d:	6a 01                	push   $0x1
    150f:	e8 6c 24 00 00       	call   3980 <printf>
    exit();
    1514:	e8 09 23 00 00       	call   3822 <exit>
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    printf(1, "unlinkread write failed\n");
    1519:	51                   	push   %ecx
    151a:	51                   	push   %ecx
    151b:	68 1c 42 00 00       	push   $0x421c
    1520:	6a 01                	push   $0x1
    1522:	e8 59 24 00 00       	call   3980 <printf>
    exit();
    1527:	e8 f6 22 00 00       	call   3822 <exit>
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    152c:	53                   	push   %ebx
    152d:	53                   	push   %ebx
    152e:	68 05 42 00 00       	push   $0x4205
    1533:	6a 01                	push   $0x1
    1535:	e8 46 24 00 00       	call   3980 <printf>
    exit();
    153a:	e8 e3 22 00 00       	call   3822 <exit>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
  write(fd1, "yyy", 3);
  close(fd1);

  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    153f:	56                   	push   %esi
    1540:	56                   	push   %esi
    1541:	68 ee 41 00 00       	push   $0x41ee
    1546:	6a 01                	push   $0x1
    1548:	e8 33 24 00 00       	call   3980 <printf>
    exit();
    154d:	e8 d0 22 00 00       	call   3822 <exit>
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    1552:	50                   	push   %eax
    1553:	50                   	push   %eax
    1554:	68 d0 41 00 00       	push   $0x41d0
    1559:	6a 01                	push   $0x1
    155b:	e8 20 24 00 00       	call   3980 <printf>
    exit();
    1560:	e8 bd 22 00 00       	call   3822 <exit>
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    1565:	50                   	push   %eax
    1566:	50                   	push   %eax
    1567:	68 b8 41 00 00       	push   $0x41b8
    156c:	6a 01                	push   $0x1
    156e:	e8 0d 24 00 00       	call   3980 <printf>
    exit();
    1573:	e8 aa 22 00 00       	call   3822 <exit>
    1578:	90                   	nop
    1579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001580 <linktest>:
  printf(1, "unlinkread ok\n");
}

void
linktest(void)
{
    1580:	55                   	push   %ebp
    1581:	89 e5                	mov    %esp,%ebp
    1583:	53                   	push   %ebx
    1584:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "linktest\n");
    1587:	68 44 42 00 00       	push   $0x4244
    158c:	6a 01                	push   $0x1
    158e:	e8 ed 23 00 00       	call   3980 <printf>

  unlink("lf1");
    1593:	c7 04 24 4e 42 00 00 	movl   $0x424e,(%esp)
    159a:	e8 d3 22 00 00       	call   3872 <unlink>
  unlink("lf2");
    159f:	c7 04 24 52 42 00 00 	movl   $0x4252,(%esp)
    15a6:	e8 c7 22 00 00       	call   3872 <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    15ab:	58                   	pop    %eax
    15ac:	5a                   	pop    %edx
    15ad:	68 02 02 00 00       	push   $0x202
    15b2:	68 4e 42 00 00       	push   $0x424e
    15b7:	e8 a6 22 00 00       	call   3862 <open>
  if(fd < 0){
    15bc:	83 c4 10             	add    $0x10,%esp
    15bf:	85 c0                	test   %eax,%eax
    15c1:	0f 88 1e 01 00 00    	js     16e5 <linktest+0x165>
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    15c7:	83 ec 04             	sub    $0x4,%esp
    15ca:	89 c3                	mov    %eax,%ebx
    15cc:	6a 05                	push   $0x5
    15ce:	68 b2 41 00 00       	push   $0x41b2
    15d3:	50                   	push   %eax
    15d4:	e8 69 22 00 00       	call   3842 <write>
    15d9:	83 c4 10             	add    $0x10,%esp
    15dc:	83 f8 05             	cmp    $0x5,%eax
    15df:	0f 85 98 01 00 00    	jne    177d <linktest+0x1fd>
    printf(1, "write lf1 failed\n");
    exit();
  }
  close(fd);
    15e5:	83 ec 0c             	sub    $0xc,%esp
    15e8:	53                   	push   %ebx
    15e9:	e8 5c 22 00 00       	call   384a <close>

  if(link("lf1", "lf2") < 0){
    15ee:	5b                   	pop    %ebx
    15ef:	58                   	pop    %eax
    15f0:	68 52 42 00 00       	push   $0x4252
    15f5:	68 4e 42 00 00       	push   $0x424e
    15fa:	e8 83 22 00 00       	call   3882 <link>
    15ff:	83 c4 10             	add    $0x10,%esp
    1602:	85 c0                	test   %eax,%eax
    1604:	0f 88 60 01 00 00    	js     176a <linktest+0x1ea>
    printf(1, "link lf1 lf2 failed\n");
    exit();
  }
  unlink("lf1");
    160a:	83 ec 0c             	sub    $0xc,%esp
    160d:	68 4e 42 00 00       	push   $0x424e
    1612:	e8 5b 22 00 00       	call   3872 <unlink>

  if(open("lf1", 0) >= 0){
    1617:	58                   	pop    %eax
    1618:	5a                   	pop    %edx
    1619:	6a 00                	push   $0x0
    161b:	68 4e 42 00 00       	push   $0x424e
    1620:	e8 3d 22 00 00       	call   3862 <open>
    1625:	83 c4 10             	add    $0x10,%esp
    1628:	85 c0                	test   %eax,%eax
    162a:	0f 89 27 01 00 00    	jns    1757 <linktest+0x1d7>
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    1630:	83 ec 08             	sub    $0x8,%esp
    1633:	6a 00                	push   $0x0
    1635:	68 52 42 00 00       	push   $0x4252
    163a:	e8 23 22 00 00       	call   3862 <open>
  if(fd < 0){
    163f:	83 c4 10             	add    $0x10,%esp
    1642:	85 c0                	test   %eax,%eax
  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    1644:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1646:	0f 88 f8 00 00 00    	js     1744 <linktest+0x1c4>
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    164c:	83 ec 04             	sub    $0x4,%esp
    164f:	68 00 20 00 00       	push   $0x2000
    1654:	68 c0 84 00 00       	push   $0x84c0
    1659:	50                   	push   %eax
    165a:	e8 db 21 00 00       	call   383a <read>
    165f:	83 c4 10             	add    $0x10,%esp
    1662:	83 f8 05             	cmp    $0x5,%eax
    1665:	0f 85 c6 00 00 00    	jne    1731 <linktest+0x1b1>
    printf(1, "read lf2 failed\n");
    exit();
  }
  close(fd);
    166b:	83 ec 0c             	sub    $0xc,%esp
    166e:	53                   	push   %ebx
    166f:	e8 d6 21 00 00       	call   384a <close>

  if(link("lf2", "lf2") >= 0){
    1674:	58                   	pop    %eax
    1675:	5a                   	pop    %edx
    1676:	68 52 42 00 00       	push   $0x4252
    167b:	68 52 42 00 00       	push   $0x4252
    1680:	e8 fd 21 00 00       	call   3882 <link>
    1685:	83 c4 10             	add    $0x10,%esp
    1688:	85 c0                	test   %eax,%eax
    168a:	0f 89 8e 00 00 00    	jns    171e <linktest+0x19e>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    exit();
  }

  unlink("lf2");
    1690:	83 ec 0c             	sub    $0xc,%esp
    1693:	68 52 42 00 00       	push   $0x4252
    1698:	e8 d5 21 00 00       	call   3872 <unlink>
  if(link("lf2", "lf1") >= 0){
    169d:	59                   	pop    %ecx
    169e:	5b                   	pop    %ebx
    169f:	68 4e 42 00 00       	push   $0x424e
    16a4:	68 52 42 00 00       	push   $0x4252
    16a9:	e8 d4 21 00 00       	call   3882 <link>
    16ae:	83 c4 10             	add    $0x10,%esp
    16b1:	85 c0                	test   %eax,%eax
    16b3:	79 56                	jns    170b <linktest+0x18b>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    16b5:	83 ec 08             	sub    $0x8,%esp
    16b8:	68 4e 42 00 00       	push   $0x424e
    16bd:	68 16 45 00 00       	push   $0x4516
    16c2:	e8 bb 21 00 00       	call   3882 <link>
    16c7:	83 c4 10             	add    $0x10,%esp
    16ca:	85 c0                	test   %eax,%eax
    16cc:	79 2a                	jns    16f8 <linktest+0x178>
    printf(1, "link . lf1 succeeded! oops\n");
    exit();
  }

  printf(1, "linktest ok\n");
    16ce:	83 ec 08             	sub    $0x8,%esp
    16d1:	68 ec 42 00 00       	push   $0x42ec
    16d6:	6a 01                	push   $0x1
    16d8:	e8 a3 22 00 00       	call   3980 <printf>
}
    16dd:	83 c4 10             	add    $0x10,%esp
    16e0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    16e3:	c9                   	leave  
    16e4:	c3                   	ret    
  unlink("lf1");
  unlink("lf2");

  fd = open("lf1", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    16e5:	50                   	push   %eax
    16e6:	50                   	push   %eax
    16e7:	68 56 42 00 00       	push   $0x4256
    16ec:	6a 01                	push   $0x1
    16ee:	e8 8d 22 00 00       	call   3980 <printf>
    exit();
    16f3:	e8 2a 21 00 00       	call   3822 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    printf(1, "link . lf1 succeeded! oops\n");
    16f8:	50                   	push   %eax
    16f9:	50                   	push   %eax
    16fa:	68 d0 42 00 00       	push   $0x42d0
    16ff:	6a 01                	push   $0x1
    1701:	e8 7a 22 00 00       	call   3980 <printf>
    exit();
    1706:	e8 17 21 00 00       	call   3822 <exit>
    exit();
  }

  unlink("lf2");
  if(link("lf2", "lf1") >= 0){
    printf(1, "link non-existant succeeded! oops\n");
    170b:	52                   	push   %edx
    170c:	52                   	push   %edx
    170d:	68 60 4e 00 00       	push   $0x4e60
    1712:	6a 01                	push   $0x1
    1714:	e8 67 22 00 00       	call   3980 <printf>
    exit();
    1719:	e8 04 21 00 00       	call   3822 <exit>
    exit();
  }
  close(fd);

  if(link("lf2", "lf2") >= 0){
    printf(1, "link lf2 lf2 succeeded! oops\n");
    171e:	50                   	push   %eax
    171f:	50                   	push   %eax
    1720:	68 b2 42 00 00       	push   $0x42b2
    1725:	6a 01                	push   $0x1
    1727:	e8 54 22 00 00       	call   3980 <printf>
    exit();
    172c:	e8 f1 20 00 00       	call   3822 <exit>
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "read lf2 failed\n");
    1731:	51                   	push   %ecx
    1732:	51                   	push   %ecx
    1733:	68 a1 42 00 00       	push   $0x42a1
    1738:	6a 01                	push   $0x1
    173a:	e8 41 22 00 00       	call   3980 <printf>
    exit();
    173f:	e8 de 20 00 00       	call   3822 <exit>
    exit();
  }

  fd = open("lf2", 0);
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    1744:	53                   	push   %ebx
    1745:	53                   	push   %ebx
    1746:	68 90 42 00 00       	push   $0x4290
    174b:	6a 01                	push   $0x1
    174d:	e8 2e 22 00 00       	call   3980 <printf>
    exit();
    1752:	e8 cb 20 00 00       	call   3822 <exit>
    exit();
  }
  unlink("lf1");

  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    1757:	50                   	push   %eax
    1758:	50                   	push   %eax
    1759:	68 38 4e 00 00       	push   $0x4e38
    175e:	6a 01                	push   $0x1
    1760:	e8 1b 22 00 00       	call   3980 <printf>
    exit();
    1765:	e8 b8 20 00 00       	call   3822 <exit>
    exit();
  }
  close(fd);

  if(link("lf1", "lf2") < 0){
    printf(1, "link lf1 lf2 failed\n");
    176a:	51                   	push   %ecx
    176b:	51                   	push   %ecx
    176c:	68 7b 42 00 00       	push   $0x427b
    1771:	6a 01                	push   $0x1
    1773:	e8 08 22 00 00       	call   3980 <printf>
    exit();
    1778:	e8 a5 20 00 00       	call   3822 <exit>
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    printf(1, "write lf1 failed\n");
    177d:	50                   	push   %eax
    177e:	50                   	push   %eax
    177f:	68 69 42 00 00       	push   $0x4269
    1784:	6a 01                	push   $0x1
    1786:	e8 f5 21 00 00       	call   3980 <printf>
    exit();
    178b:	e8 92 20 00 00       	call   3822 <exit>

00001790 <concreate>:
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    1790:	55                   	push   %ebp
    1791:	89 e5                	mov    %esp,%ebp
    1793:	57                   	push   %edi
    1794:	56                   	push   %esi
    1795:	53                   	push   %ebx
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1796:	31 f6                	xor    %esi,%esi
    1798:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    179b:	bf 56 55 55 55       	mov    $0x55555556,%edi
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    17a0:	83 ec 64             	sub    $0x64,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    17a3:	68 f9 42 00 00       	push   $0x42f9
    17a8:	6a 01                	push   $0x1
    17aa:	e8 d1 21 00 00       	call   3980 <printf>
  file[0] = 'C';
    17af:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    17b3:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    17b7:	83 c4 10             	add    $0x10,%esp
    17ba:	eb 51                	jmp    180d <concreate+0x7d>
    17bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    17c0:	89 f0                	mov    %esi,%eax
    17c2:	89 f1                	mov    %esi,%ecx
    17c4:	f7 ef                	imul   %edi
    17c6:	89 f0                	mov    %esi,%eax
    17c8:	c1 f8 1f             	sar    $0x1f,%eax
    17cb:	29 c2                	sub    %eax,%edx
    17cd:	8d 04 52             	lea    (%edx,%edx,2),%eax
    17d0:	29 c1                	sub    %eax,%ecx
    17d2:	83 f9 01             	cmp    $0x1,%ecx
    17d5:	0f 84 b5 00 00 00    	je     1890 <concreate+0x100>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    17db:	83 ec 08             	sub    $0x8,%esp
    17de:	68 02 02 00 00       	push   $0x202
    17e3:	53                   	push   %ebx
    17e4:	e8 79 20 00 00       	call   3862 <open>
      if(fd < 0){
    17e9:	83 c4 10             	add    $0x10,%esp
    17ec:	85 c0                	test   %eax,%eax
    17ee:	78 6d                	js     185d <concreate+0xcd>
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    17f0:	83 ec 0c             	sub    $0xc,%esp
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    17f3:	83 c6 01             	add    $0x1,%esi
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    17f6:	50                   	push   %eax
    17f7:	e8 4e 20 00 00       	call   384a <close>
    17fc:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
      exit();
    else
      wait();
    17ff:	e8 26 20 00 00       	call   382a <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1804:	83 fe 28             	cmp    $0x28,%esi
    1807:	0f 84 ab 00 00 00    	je     18b8 <concreate+0x128>
    file[1] = '0' + i;
    unlink(file);
    180d:	83 ec 0c             	sub    $0xc,%esp

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    1810:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    1813:	53                   	push   %ebx

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    1814:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    1817:	e8 56 20 00 00       	call   3872 <unlink>
    pid = fork();
    181c:	e8 f9 1f 00 00       	call   381a <fork>
    if(pid && (i % 3) == 1){
    1821:	83 c4 10             	add    $0x10,%esp
    1824:	85 c0                	test   %eax,%eax
    1826:	75 98                	jne    17c0 <concreate+0x30>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    1828:	89 f0                	mov    %esi,%eax
    182a:	ba 67 66 66 66       	mov    $0x66666667,%edx
    182f:	f7 ea                	imul   %edx
    1831:	89 f0                	mov    %esi,%eax
    1833:	c1 f8 1f             	sar    $0x1f,%eax
    1836:	d1 fa                	sar    %edx
    1838:	29 c2                	sub    %eax,%edx
    183a:	8d 04 92             	lea    (%edx,%edx,4),%eax
    183d:	29 c6                	sub    %eax,%esi
    183f:	83 fe 01             	cmp    $0x1,%esi
    1842:	74 34                	je     1878 <concreate+0xe8>
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    1844:	83 ec 08             	sub    $0x8,%esp
    1847:	68 02 02 00 00       	push   $0x202
    184c:	53                   	push   %ebx
    184d:	e8 10 20 00 00       	call   3862 <open>
      if(fd < 0){
    1852:	83 c4 10             	add    $0x10,%esp
    1855:	85 c0                	test   %eax,%eax
    1857:	0f 89 32 02 00 00    	jns    1a8f <concreate+0x2ff>
        printf(1, "concreate create %s failed\n", file);
    185d:	83 ec 04             	sub    $0x4,%esp
    1860:	53                   	push   %ebx
    1861:	68 0c 43 00 00       	push   $0x430c
    1866:	6a 01                	push   $0x1
    1868:	e8 13 21 00 00       	call   3980 <printf>
        exit();
    186d:	e8 b0 1f 00 00       	call   3822 <exit>
    1872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    1878:	83 ec 08             	sub    $0x8,%esp
    187b:	53                   	push   %ebx
    187c:	68 09 43 00 00       	push   $0x4309
    1881:	e8 fc 1f 00 00       	call   3882 <link>
    1886:	83 c4 10             	add    $0x10,%esp
        exit();
      }
      close(fd);
    }
    if(pid == 0)
      exit();
    1889:	e8 94 1f 00 00       	call   3822 <exit>
    188e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    1890:	83 ec 08             	sub    $0x8,%esp
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1893:	83 c6 01             	add    $0x1,%esi
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    1896:	53                   	push   %ebx
    1897:	68 09 43 00 00       	push   $0x4309
    189c:	e8 e1 1f 00 00       	call   3882 <link>
    18a1:	83 c4 10             	add    $0x10,%esp
      close(fd);
    }
    if(pid == 0)
      exit();
    else
      wait();
    18a4:	e8 81 1f 00 00       	call   382a <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    18a9:	83 fe 28             	cmp    $0x28,%esi
    18ac:	0f 85 5b ff ff ff    	jne    180d <concreate+0x7d>
    18b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit();
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    18b8:	8d 45 c0             	lea    -0x40(%ebp),%eax
    18bb:	83 ec 04             	sub    $0x4,%esp
    18be:	8d 7d b0             	lea    -0x50(%ebp),%edi
    18c1:	6a 28                	push   $0x28
    18c3:	6a 00                	push   $0x0
    18c5:	50                   	push   %eax
    18c6:	e8 c5 1d 00 00       	call   3690 <memset>
  fd = open(".", 0);
    18cb:	59                   	pop    %ecx
    18cc:	5e                   	pop    %esi
    18cd:	6a 00                	push   $0x0
    18cf:	68 16 45 00 00       	push   $0x4516
    18d4:	e8 89 1f 00 00       	call   3862 <open>
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    18d9:	83 c4 10             	add    $0x10,%esp
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
    18dc:	89 c6                	mov    %eax,%esi
  n = 0;
    18de:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    18e5:	8d 76 00             	lea    0x0(%esi),%esi
  while(read(fd, &de, sizeof(de)) > 0){
    18e8:	83 ec 04             	sub    $0x4,%esp
    18eb:	6a 10                	push   $0x10
    18ed:	57                   	push   %edi
    18ee:	56                   	push   %esi
    18ef:	e8 46 1f 00 00       	call   383a <read>
    18f4:	83 c4 10             	add    $0x10,%esp
    18f7:	85 c0                	test   %eax,%eax
    18f9:	7e 3d                	jle    1938 <concreate+0x1a8>
    if(de.inum == 0)
    18fb:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1900:	74 e6                	je     18e8 <concreate+0x158>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1902:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    1906:	75 e0                	jne    18e8 <concreate+0x158>
    1908:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    190c:	75 da                	jne    18e8 <concreate+0x158>
      i = de.name[1] - '0';
    190e:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    1912:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    1915:	83 f8 27             	cmp    $0x27,%eax
    1918:	0f 87 59 01 00 00    	ja     1a77 <concreate+0x2e7>
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
    191e:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    1923:	0f 85 36 01 00 00    	jne    1a5f <concreate+0x2cf>
        printf(1, "concreate duplicate file %s\n", de.name);
        exit();
      }
      fa[i] = 1;
    1929:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    192e:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    1932:	eb b4                	jmp    18e8 <concreate+0x158>
    1934:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
  close(fd);
    1938:	83 ec 0c             	sub    $0xc,%esp
    193b:	56                   	push   %esi
    193c:	e8 09 1f 00 00       	call   384a <close>

  if(n != 40){
    1941:	83 c4 10             	add    $0x10,%esp
    1944:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    1948:	0f 85 fd 00 00 00    	jne    1a4b <concreate+0x2bb>
    194e:	31 f6                	xor    %esi,%esi
    1950:	eb 70                	jmp    19c2 <concreate+0x232>
    1952:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pid < 0){
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
       ((i % 3) == 1 && pid != 0)){
    1958:	83 fa 01             	cmp    $0x1,%edx
    195b:	0f 85 99 00 00 00    	jne    19fa <concreate+0x26a>
      close(open(file, 0));
    1961:	83 ec 08             	sub    $0x8,%esp
    1964:	6a 00                	push   $0x0
    1966:	53                   	push   %ebx
    1967:	e8 f6 1e 00 00       	call   3862 <open>
    196c:	89 04 24             	mov    %eax,(%esp)
    196f:	e8 d6 1e 00 00       	call   384a <close>
      close(open(file, 0));
    1974:	58                   	pop    %eax
    1975:	5a                   	pop    %edx
    1976:	6a 00                	push   $0x0
    1978:	53                   	push   %ebx
    1979:	e8 e4 1e 00 00       	call   3862 <open>
    197e:	89 04 24             	mov    %eax,(%esp)
    1981:	e8 c4 1e 00 00       	call   384a <close>
      close(open(file, 0));
    1986:	59                   	pop    %ecx
    1987:	58                   	pop    %eax
    1988:	6a 00                	push   $0x0
    198a:	53                   	push   %ebx
    198b:	e8 d2 1e 00 00       	call   3862 <open>
    1990:	89 04 24             	mov    %eax,(%esp)
    1993:	e8 b2 1e 00 00       	call   384a <close>
      close(open(file, 0));
    1998:	58                   	pop    %eax
    1999:	5a                   	pop    %edx
    199a:	6a 00                	push   $0x0
    199c:	53                   	push   %ebx
    199d:	e8 c0 1e 00 00       	call   3862 <open>
    19a2:	89 04 24             	mov    %eax,(%esp)
    19a5:	e8 a0 1e 00 00       	call   384a <close>
    19aa:	83 c4 10             	add    $0x10,%esp
      unlink(file);
      unlink(file);
      unlink(file);
      unlink(file);
    }
    if(pid == 0)
    19ad:	85 ff                	test   %edi,%edi
    19af:	0f 84 d4 fe ff ff    	je     1889 <concreate+0xf9>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    19b5:	83 c6 01             	add    $0x1,%esi
      unlink(file);
    }
    if(pid == 0)
      exit();
    else
      wait();
    19b8:	e8 6d 1e 00 00       	call   382a <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    19bd:	83 fe 28             	cmp    $0x28,%esi
    19c0:	74 5e                	je     1a20 <concreate+0x290>
    file[1] = '0' + i;
    19c2:	8d 46 30             	lea    0x30(%esi),%eax
    19c5:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    19c8:	e8 4d 1e 00 00       	call   381a <fork>
    if(pid < 0){
    19cd:	85 c0                	test   %eax,%eax
    exit();
  }

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    19cf:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    19d1:	78 64                	js     1a37 <concreate+0x2a7>
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    19d3:	b8 56 55 55 55       	mov    $0x55555556,%eax
    19d8:	f7 ee                	imul   %esi
    19da:	89 f0                	mov    %esi,%eax
    19dc:	c1 f8 1f             	sar    $0x1f,%eax
    19df:	29 c2                	sub    %eax,%edx
    19e1:	8d 04 52             	lea    (%edx,%edx,2),%eax
    19e4:	89 f2                	mov    %esi,%edx
    19e6:	29 c2                	sub    %eax,%edx
    19e8:	89 f8                	mov    %edi,%eax
    19ea:	09 d0                	or     %edx,%eax
    19ec:	0f 84 6f ff ff ff    	je     1961 <concreate+0x1d1>
       ((i % 3) == 1 && pid != 0)){
    19f2:	85 ff                	test   %edi,%edi
    19f4:	0f 85 5e ff ff ff    	jne    1958 <concreate+0x1c8>
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
    } else {
      unlink(file);
    19fa:	83 ec 0c             	sub    $0xc,%esp
    19fd:	53                   	push   %ebx
    19fe:	e8 6f 1e 00 00       	call   3872 <unlink>
      unlink(file);
    1a03:	89 1c 24             	mov    %ebx,(%esp)
    1a06:	e8 67 1e 00 00       	call   3872 <unlink>
      unlink(file);
    1a0b:	89 1c 24             	mov    %ebx,(%esp)
    1a0e:	e8 5f 1e 00 00       	call   3872 <unlink>
      unlink(file);
    1a13:	89 1c 24             	mov    %ebx,(%esp)
    1a16:	e8 57 1e 00 00       	call   3872 <unlink>
    1a1b:	83 c4 10             	add    $0x10,%esp
    1a1e:	eb 8d                	jmp    19ad <concreate+0x21d>
      exit();
    else
      wait();
  }

  printf(1, "concreate ok\n");
    1a20:	83 ec 08             	sub    $0x8,%esp
    1a23:	68 5e 43 00 00       	push   $0x435e
    1a28:	6a 01                	push   $0x1
    1a2a:	e8 51 1f 00 00       	call   3980 <printf>
}
    1a2f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1a32:	5b                   	pop    %ebx
    1a33:	5e                   	pop    %esi
    1a34:	5f                   	pop    %edi
    1a35:	5d                   	pop    %ebp
    1a36:	c3                   	ret    

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    1a37:	83 ec 08             	sub    $0x8,%esp
    1a3a:	68 e1 4b 00 00       	push   $0x4be1
    1a3f:	6a 01                	push   $0x1
    1a41:	e8 3a 1f 00 00       	call   3980 <printf>
      exit();
    1a46:	e8 d7 1d 00 00       	call   3822 <exit>
    }
  }
  close(fd);

  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    1a4b:	83 ec 08             	sub    $0x8,%esp
    1a4e:	68 84 4e 00 00       	push   $0x4e84
    1a53:	6a 01                	push   $0x1
    1a55:	e8 26 1f 00 00       	call   3980 <printf>
    exit();
    1a5a:	e8 c3 1d 00 00       	call   3822 <exit>
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
        printf(1, "concreate duplicate file %s\n", de.name);
    1a5f:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1a62:	83 ec 04             	sub    $0x4,%esp
    1a65:	50                   	push   %eax
    1a66:	68 41 43 00 00       	push   $0x4341
    1a6b:	6a 01                	push   $0x1
    1a6d:	e8 0e 1f 00 00       	call   3980 <printf>
        exit();
    1a72:	e8 ab 1d 00 00       	call   3822 <exit>
    if(de.inum == 0)
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
      i = de.name[1] - '0';
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
    1a77:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1a7a:	83 ec 04             	sub    $0x4,%esp
    1a7d:	50                   	push   %eax
    1a7e:	68 28 43 00 00       	push   $0x4328
    1a83:	6a 01                	push   $0x1
    1a85:	e8 f6 1e 00 00       	call   3980 <printf>
        exit();
    1a8a:	e8 93 1d 00 00       	call   3822 <exit>
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    1a8f:	83 ec 0c             	sub    $0xc,%esp
    1a92:	50                   	push   %eax
    1a93:	e8 b2 1d 00 00       	call   384a <close>
    1a98:	83 c4 10             	add    $0x10,%esp
    1a9b:	e9 e9 fd ff ff       	jmp    1889 <concreate+0xf9>

00001aa0 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1aa0:	55                   	push   %ebp
    1aa1:	89 e5                	mov    %esp,%ebp
    1aa3:	57                   	push   %edi
    1aa4:	56                   	push   %esi
    1aa5:	53                   	push   %ebx
    1aa6:	83 ec 24             	sub    $0x24,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    1aa9:	68 6c 43 00 00       	push   $0x436c
    1aae:	6a 01                	push   $0x1
    1ab0:	e8 cb 1e 00 00       	call   3980 <printf>

  unlink("x");
    1ab5:	c7 04 24 f9 45 00 00 	movl   $0x45f9,(%esp)
    1abc:	e8 b1 1d 00 00       	call   3872 <unlink>
  pid = fork();
    1ac1:	e8 54 1d 00 00       	call   381a <fork>
  if(pid < 0){
    1ac6:	83 c4 10             	add    $0x10,%esp
    1ac9:	85 c0                	test   %eax,%eax
  int pid, i;

  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
    1acb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1ace:	0f 88 b6 00 00 00    	js     1b8a <linkunlink+0xea>
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    1ad4:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1ad8:	bb 64 00 00 00       	mov    $0x64,%ebx
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
    1add:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  if(pid < 0){
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    1ae2:	19 ff                	sbb    %edi,%edi
    1ae4:	83 e7 60             	and    $0x60,%edi
    1ae7:	83 c7 01             	add    $0x1,%edi
    1aea:	eb 1e                	jmp    1b0a <linkunlink+0x6a>
    1aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
    1af0:	83 fa 01             	cmp    $0x1,%edx
    1af3:	74 7b                	je     1b70 <linkunlink+0xd0>
      link("cat", "x");
    } else {
      unlink("x");
    1af5:	83 ec 0c             	sub    $0xc,%esp
    1af8:	68 f9 45 00 00       	push   $0x45f9
    1afd:	e8 70 1d 00 00       	call   3872 <unlink>
    1b02:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1b05:	83 eb 01             	sub    $0x1,%ebx
    1b08:	74 3d                	je     1b47 <linkunlink+0xa7>
    x = x * 1103515245 + 12345;
    1b0a:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1b10:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    1b16:	89 f8                	mov    %edi,%eax
    1b18:	f7 e6                	mul    %esi
    1b1a:	d1 ea                	shr    %edx
    1b1c:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1b1f:	89 fa                	mov    %edi,%edx
    1b21:	29 c2                	sub    %eax,%edx
    1b23:	75 cb                	jne    1af0 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    1b25:	83 ec 08             	sub    $0x8,%esp
    1b28:	68 02 02 00 00       	push   $0x202
    1b2d:	68 f9 45 00 00       	push   $0x45f9
    1b32:	e8 2b 1d 00 00       	call   3862 <open>
    1b37:	89 04 24             	mov    %eax,(%esp)
    1b3a:	e8 0b 1d 00 00       	call   384a <close>
    1b3f:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1b42:	83 eb 01             	sub    $0x1,%ebx
    1b45:	75 c3                	jne    1b0a <linkunlink+0x6a>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1b47:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b4a:	85 c0                	test   %eax,%eax
    1b4c:	74 50                	je     1b9e <linkunlink+0xfe>
    wait();
    1b4e:	e8 d7 1c 00 00       	call   382a <wait>
  else
    exit();

  printf(1, "linkunlink ok\n");
    1b53:	83 ec 08             	sub    $0x8,%esp
    1b56:	68 81 43 00 00       	push   $0x4381
    1b5b:	6a 01                	push   $0x1
    1b5d:	e8 1e 1e 00 00       	call   3980 <printf>
}
    1b62:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1b65:	5b                   	pop    %ebx
    1b66:	5e                   	pop    %esi
    1b67:	5f                   	pop    %edi
    1b68:	5d                   	pop    %ebp
    1b69:	c3                   	ret    
    1b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
      link("cat", "x");
    1b70:	83 ec 08             	sub    $0x8,%esp
    1b73:	68 f9 45 00 00       	push   $0x45f9
    1b78:	68 7d 43 00 00       	push   $0x437d
    1b7d:	e8 00 1d 00 00       	call   3882 <link>
    1b82:	83 c4 10             	add    $0x10,%esp
    1b85:	e9 7b ff ff ff       	jmp    1b05 <linkunlink+0x65>
  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
  if(pid < 0){
    printf(1, "fork failed\n");
    1b8a:	83 ec 08             	sub    $0x8,%esp
    1b8d:	68 e1 4b 00 00       	push   $0x4be1
    1b92:	6a 01                	push   $0x1
    1b94:	e8 e7 1d 00 00       	call   3980 <printf>
    exit();
    1b99:	e8 84 1c 00 00       	call   3822 <exit>
  }

  if(pid)
    wait();
  else
    exit();
    1b9e:	e8 7f 1c 00 00       	call   3822 <exit>
    1ba3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001bb0 <bigdir>:
}

// directory that uses indirect blocks
void
bigdir(void)
{
    1bb0:	55                   	push   %ebp
    1bb1:	89 e5                	mov    %esp,%ebp
    1bb3:	56                   	push   %esi
    1bb4:	53                   	push   %ebx
    1bb5:	83 ec 18             	sub    $0x18,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1bb8:	68 90 43 00 00       	push   $0x4390
    1bbd:	6a 01                	push   $0x1
    1bbf:	e8 bc 1d 00 00       	call   3980 <printf>
  unlink("bd");
    1bc4:	c7 04 24 9d 43 00 00 	movl   $0x439d,(%esp)
    1bcb:	e8 a2 1c 00 00       	call   3872 <unlink>

  fd = open("bd", O_CREATE);
    1bd0:	58                   	pop    %eax
    1bd1:	5a                   	pop    %edx
    1bd2:	68 00 02 00 00       	push   $0x200
    1bd7:	68 9d 43 00 00       	push   $0x439d
    1bdc:	e8 81 1c 00 00       	call   3862 <open>
  if(fd < 0){
    1be1:	83 c4 10             	add    $0x10,%esp
    1be4:	85 c0                	test   %eax,%eax
    1be6:	0f 88 de 00 00 00    	js     1cca <bigdir+0x11a>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    1bec:	83 ec 0c             	sub    $0xc,%esp
    1bef:	8d 75 ee             	lea    -0x12(%ebp),%esi

  for(i = 0; i < 500; i++){
    1bf2:	31 db                	xor    %ebx,%ebx
  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    1bf4:	50                   	push   %eax
    1bf5:	e8 50 1c 00 00       	call   384a <close>
    1bfa:	83 c4 10             	add    $0x10,%esp
    1bfd:	8d 76 00             	lea    0x0(%esi),%esi

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c00:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c02:	83 ec 08             	sub    $0x8,%esp
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1c05:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1c09:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c0c:	56                   	push   %esi
    1c0d:	68 9d 43 00 00       	push   $0x439d
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c12:	83 c0 30             	add    $0x30,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1c15:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c19:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1c1c:	89 d8                	mov    %ebx,%eax
    1c1e:	83 e0 3f             	and    $0x3f,%eax
    1c21:	83 c0 30             	add    $0x30,%eax
    1c24:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c27:	e8 56 1c 00 00       	call   3882 <link>
    1c2c:	83 c4 10             	add    $0x10,%esp
    1c2f:	85 c0                	test   %eax,%eax
    1c31:	75 6f                	jne    1ca2 <bigdir+0xf2>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    1c33:	83 c3 01             	add    $0x1,%ebx
    1c36:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1c3c:	75 c2                	jne    1c00 <bigdir+0x50>
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1c3e:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 500; i++){
    1c41:	31 db                	xor    %ebx,%ebx
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1c43:	68 9d 43 00 00       	push   $0x439d
    1c48:	e8 25 1c 00 00       	call   3872 <unlink>
    1c4d:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c50:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    1c52:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1c55:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1c59:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    1c5c:	56                   	push   %esi
  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1c5d:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c61:	83 c0 30             	add    $0x30,%eax
    1c64:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1c67:	89 d8                	mov    %ebx,%eax
    1c69:	83 e0 3f             	and    $0x3f,%eax
    1c6c:	83 c0 30             	add    $0x30,%eax
    1c6f:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    if(unlink(name) != 0){
    1c72:	e8 fb 1b 00 00       	call   3872 <unlink>
    1c77:	83 c4 10             	add    $0x10,%esp
    1c7a:	85 c0                	test   %eax,%eax
    1c7c:	75 38                	jne    1cb6 <bigdir+0x106>
      exit();
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    1c7e:	83 c3 01             	add    $0x1,%ebx
    1c81:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1c87:	75 c7                	jne    1c50 <bigdir+0xa0>
      printf(1, "bigdir unlink failed");
      exit();
    }
  }

  printf(1, "bigdir ok\n");
    1c89:	83 ec 08             	sub    $0x8,%esp
    1c8c:	68 df 43 00 00       	push   $0x43df
    1c91:	6a 01                	push   $0x1
    1c93:	e8 e8 1c 00 00       	call   3980 <printf>
}
    1c98:	83 c4 10             	add    $0x10,%esp
    1c9b:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1c9e:	5b                   	pop    %ebx
    1c9f:	5e                   	pop    %esi
    1ca0:	5d                   	pop    %ebp
    1ca1:	c3                   	ret    
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
      printf(1, "bigdir link failed\n");
    1ca2:	83 ec 08             	sub    $0x8,%esp
    1ca5:	68 b6 43 00 00       	push   $0x43b6
    1caa:	6a 01                	push   $0x1
    1cac:	e8 cf 1c 00 00       	call   3980 <printf>
      exit();
    1cb1:	e8 6c 1b 00 00       	call   3822 <exit>
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
      printf(1, "bigdir unlink failed");
    1cb6:	83 ec 08             	sub    $0x8,%esp
    1cb9:	68 ca 43 00 00       	push   $0x43ca
    1cbe:	6a 01                	push   $0x1
    1cc0:	e8 bb 1c 00 00       	call   3980 <printf>
      exit();
    1cc5:	e8 58 1b 00 00       	call   3822 <exit>
  printf(1, "bigdir test\n");
  unlink("bd");

  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    1cca:	83 ec 08             	sub    $0x8,%esp
    1ccd:	68 a0 43 00 00       	push   $0x43a0
    1cd2:	6a 01                	push   $0x1
    1cd4:	e8 a7 1c 00 00       	call   3980 <printf>
    exit();
    1cd9:	e8 44 1b 00 00       	call   3822 <exit>
    1cde:	66 90                	xchg   %ax,%ax

00001ce0 <subdir>:
  printf(1, "bigdir ok\n");
}

void
subdir(void)
{
    1ce0:	55                   	push   %ebp
    1ce1:	89 e5                	mov    %esp,%ebp
    1ce3:	53                   	push   %ebx
    1ce4:	83 ec 0c             	sub    $0xc,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1ce7:	68 ea 43 00 00       	push   $0x43ea
    1cec:	6a 01                	push   $0x1
    1cee:	e8 8d 1c 00 00       	call   3980 <printf>

  unlink("ff");
    1cf3:	c7 04 24 73 44 00 00 	movl   $0x4473,(%esp)
    1cfa:	e8 73 1b 00 00       	call   3872 <unlink>
  if(mkdir("dd") != 0){
    1cff:	c7 04 24 10 45 00 00 	movl   $0x4510,(%esp)
    1d06:	e8 7f 1b 00 00       	call   388a <mkdir>
    1d0b:	83 c4 10             	add    $0x10,%esp
    1d0e:	85 c0                	test   %eax,%eax
    1d10:	0f 85 b3 05 00 00    	jne    22c9 <subdir+0x5e9>
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d16:	83 ec 08             	sub    $0x8,%esp
    1d19:	68 02 02 00 00       	push   $0x202
    1d1e:	68 49 44 00 00       	push   $0x4449
    1d23:	e8 3a 1b 00 00       	call   3862 <open>
  if(fd < 0){
    1d28:	83 c4 10             	add    $0x10,%esp
    1d2b:	85 c0                	test   %eax,%eax
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d2d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1d2f:	0f 88 81 05 00 00    	js     22b6 <subdir+0x5d6>
    printf(1, "create dd/ff failed\n");
    exit();
  }
  write(fd, "ff", 2);
    1d35:	83 ec 04             	sub    $0x4,%esp
    1d38:	6a 02                	push   $0x2
    1d3a:	68 73 44 00 00       	push   $0x4473
    1d3f:	50                   	push   %eax
    1d40:	e8 fd 1a 00 00       	call   3842 <write>
  close(fd);
    1d45:	89 1c 24             	mov    %ebx,(%esp)
    1d48:	e8 fd 1a 00 00       	call   384a <close>

  if(unlink("dd") >= 0){
    1d4d:	c7 04 24 10 45 00 00 	movl   $0x4510,(%esp)
    1d54:	e8 19 1b 00 00       	call   3872 <unlink>
    1d59:	83 c4 10             	add    $0x10,%esp
    1d5c:	85 c0                	test   %eax,%eax
    1d5e:	0f 89 3f 05 00 00    	jns    22a3 <subdir+0x5c3>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    1d64:	83 ec 0c             	sub    $0xc,%esp
    1d67:	68 24 44 00 00       	push   $0x4424
    1d6c:	e8 19 1b 00 00       	call   388a <mkdir>
    1d71:	83 c4 10             	add    $0x10,%esp
    1d74:	85 c0                	test   %eax,%eax
    1d76:	0f 85 14 05 00 00    	jne    2290 <subdir+0x5b0>
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1d7c:	83 ec 08             	sub    $0x8,%esp
    1d7f:	68 02 02 00 00       	push   $0x202
    1d84:	68 46 44 00 00       	push   $0x4446
    1d89:	e8 d4 1a 00 00       	call   3862 <open>
  if(fd < 0){
    1d8e:	83 c4 10             	add    $0x10,%esp
    1d91:	85 c0                	test   %eax,%eax
  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1d93:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1d95:	0f 88 24 04 00 00    	js     21bf <subdir+0x4df>
    printf(1, "create dd/dd/ff failed\n");
    exit();
  }
  write(fd, "FF", 2);
    1d9b:	83 ec 04             	sub    $0x4,%esp
    1d9e:	6a 02                	push   $0x2
    1da0:	68 67 44 00 00       	push   $0x4467
    1da5:	50                   	push   %eax
    1da6:	e8 97 1a 00 00       	call   3842 <write>
  close(fd);
    1dab:	89 1c 24             	mov    %ebx,(%esp)
    1dae:	e8 97 1a 00 00       	call   384a <close>

  fd = open("dd/dd/../ff", 0);
    1db3:	58                   	pop    %eax
    1db4:	5a                   	pop    %edx
    1db5:	6a 00                	push   $0x0
    1db7:	68 6a 44 00 00       	push   $0x446a
    1dbc:	e8 a1 1a 00 00       	call   3862 <open>
  if(fd < 0){
    1dc1:	83 c4 10             	add    $0x10,%esp
    1dc4:	85 c0                	test   %eax,%eax
    exit();
  }
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
    1dc6:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1dc8:	0f 88 de 03 00 00    	js     21ac <subdir+0x4cc>
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
    1dce:	83 ec 04             	sub    $0x4,%esp
    1dd1:	68 00 20 00 00       	push   $0x2000
    1dd6:	68 c0 84 00 00       	push   $0x84c0
    1ddb:	50                   	push   %eax
    1ddc:	e8 59 1a 00 00       	call   383a <read>
  if(cc != 2 || buf[0] != 'f'){
    1de1:	83 c4 10             	add    $0x10,%esp
    1de4:	83 f8 02             	cmp    $0x2,%eax
    1de7:	0f 85 3a 03 00 00    	jne    2127 <subdir+0x447>
    1ded:	80 3d c0 84 00 00 66 	cmpb   $0x66,0x84c0
    1df4:	0f 85 2d 03 00 00    	jne    2127 <subdir+0x447>
    printf(1, "dd/dd/../ff wrong content\n");
    exit();
  }
  close(fd);
    1dfa:	83 ec 0c             	sub    $0xc,%esp
    1dfd:	53                   	push   %ebx
    1dfe:	e8 47 1a 00 00       	call   384a <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1e03:	5b                   	pop    %ebx
    1e04:	58                   	pop    %eax
    1e05:	68 aa 44 00 00       	push   $0x44aa
    1e0a:	68 46 44 00 00       	push   $0x4446
    1e0f:	e8 6e 1a 00 00       	call   3882 <link>
    1e14:	83 c4 10             	add    $0x10,%esp
    1e17:	85 c0                	test   %eax,%eax
    1e19:	0f 85 c6 03 00 00    	jne    21e5 <subdir+0x505>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    1e1f:	83 ec 0c             	sub    $0xc,%esp
    1e22:	68 46 44 00 00       	push   $0x4446
    1e27:	e8 46 1a 00 00       	call   3872 <unlink>
    1e2c:	83 c4 10             	add    $0x10,%esp
    1e2f:	85 c0                	test   %eax,%eax
    1e31:	0f 85 16 03 00 00    	jne    214d <subdir+0x46d>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1e37:	83 ec 08             	sub    $0x8,%esp
    1e3a:	6a 00                	push   $0x0
    1e3c:	68 46 44 00 00       	push   $0x4446
    1e41:	e8 1c 1a 00 00       	call   3862 <open>
    1e46:	83 c4 10             	add    $0x10,%esp
    1e49:	85 c0                	test   %eax,%eax
    1e4b:	0f 89 2c 04 00 00    	jns    227d <subdir+0x59d>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    1e51:	83 ec 0c             	sub    $0xc,%esp
    1e54:	68 10 45 00 00       	push   $0x4510
    1e59:	e8 34 1a 00 00       	call   3892 <chdir>
    1e5e:	83 c4 10             	add    $0x10,%esp
    1e61:	85 c0                	test   %eax,%eax
    1e63:	0f 85 01 04 00 00    	jne    226a <subdir+0x58a>
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    1e69:	83 ec 0c             	sub    $0xc,%esp
    1e6c:	68 de 44 00 00       	push   $0x44de
    1e71:	e8 1c 1a 00 00       	call   3892 <chdir>
    1e76:	83 c4 10             	add    $0x10,%esp
    1e79:	85 c0                	test   %eax,%eax
    1e7b:	0f 85 b9 02 00 00    	jne    213a <subdir+0x45a>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("dd/../../../dd") != 0){
    1e81:	83 ec 0c             	sub    $0xc,%esp
    1e84:	68 04 45 00 00       	push   $0x4504
    1e89:	e8 04 1a 00 00       	call   3892 <chdir>
    1e8e:	83 c4 10             	add    $0x10,%esp
    1e91:	85 c0                	test   %eax,%eax
    1e93:	0f 85 a1 02 00 00    	jne    213a <subdir+0x45a>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    1e99:	83 ec 0c             	sub    $0xc,%esp
    1e9c:	68 13 45 00 00       	push   $0x4513
    1ea1:	e8 ec 19 00 00       	call   3892 <chdir>
    1ea6:	83 c4 10             	add    $0x10,%esp
    1ea9:	85 c0                	test   %eax,%eax
    1eab:	0f 85 21 03 00 00    	jne    21d2 <subdir+0x4f2>
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    1eb1:	83 ec 08             	sub    $0x8,%esp
    1eb4:	6a 00                	push   $0x0
    1eb6:	68 aa 44 00 00       	push   $0x44aa
    1ebb:	e8 a2 19 00 00       	call   3862 <open>
  if(fd < 0){
    1ec0:	83 c4 10             	add    $0x10,%esp
    1ec3:	85 c0                	test   %eax,%eax
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    1ec5:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1ec7:	0f 88 e0 04 00 00    	js     23ad <subdir+0x6cd>
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    1ecd:	83 ec 04             	sub    $0x4,%esp
    1ed0:	68 00 20 00 00       	push   $0x2000
    1ed5:	68 c0 84 00 00       	push   $0x84c0
    1eda:	50                   	push   %eax
    1edb:	e8 5a 19 00 00       	call   383a <read>
    1ee0:	83 c4 10             	add    $0x10,%esp
    1ee3:	83 f8 02             	cmp    $0x2,%eax
    1ee6:	0f 85 ae 04 00 00    	jne    239a <subdir+0x6ba>
    printf(1, "read dd/dd/ffff wrong len\n");
    exit();
  }
  close(fd);
    1eec:	83 ec 0c             	sub    $0xc,%esp
    1eef:	53                   	push   %ebx
    1ef0:	e8 55 19 00 00       	call   384a <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1ef5:	59                   	pop    %ecx
    1ef6:	5b                   	pop    %ebx
    1ef7:	6a 00                	push   $0x0
    1ef9:	68 46 44 00 00       	push   $0x4446
    1efe:	e8 5f 19 00 00       	call   3862 <open>
    1f03:	83 c4 10             	add    $0x10,%esp
    1f06:	85 c0                	test   %eax,%eax
    1f08:	0f 89 65 02 00 00    	jns    2173 <subdir+0x493>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1f0e:	83 ec 08             	sub    $0x8,%esp
    1f11:	68 02 02 00 00       	push   $0x202
    1f16:	68 5e 45 00 00       	push   $0x455e
    1f1b:	e8 42 19 00 00       	call   3862 <open>
    1f20:	83 c4 10             	add    $0x10,%esp
    1f23:	85 c0                	test   %eax,%eax
    1f25:	0f 89 35 02 00 00    	jns    2160 <subdir+0x480>
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1f2b:	83 ec 08             	sub    $0x8,%esp
    1f2e:	68 02 02 00 00       	push   $0x202
    1f33:	68 83 45 00 00       	push   $0x4583
    1f38:	e8 25 19 00 00       	call   3862 <open>
    1f3d:	83 c4 10             	add    $0x10,%esp
    1f40:	85 c0                	test   %eax,%eax
    1f42:	0f 89 0f 03 00 00    	jns    2257 <subdir+0x577>
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    1f48:	83 ec 08             	sub    $0x8,%esp
    1f4b:	68 00 02 00 00       	push   $0x200
    1f50:	68 10 45 00 00       	push   $0x4510
    1f55:	e8 08 19 00 00       	call   3862 <open>
    1f5a:	83 c4 10             	add    $0x10,%esp
    1f5d:	85 c0                	test   %eax,%eax
    1f5f:	0f 89 df 02 00 00    	jns    2244 <subdir+0x564>
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    1f65:	83 ec 08             	sub    $0x8,%esp
    1f68:	6a 02                	push   $0x2
    1f6a:	68 10 45 00 00       	push   $0x4510
    1f6f:	e8 ee 18 00 00       	call   3862 <open>
    1f74:	83 c4 10             	add    $0x10,%esp
    1f77:	85 c0                	test   %eax,%eax
    1f79:	0f 89 b2 02 00 00    	jns    2231 <subdir+0x551>
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    1f7f:	83 ec 08             	sub    $0x8,%esp
    1f82:	6a 01                	push   $0x1
    1f84:	68 10 45 00 00       	push   $0x4510
    1f89:	e8 d4 18 00 00       	call   3862 <open>
    1f8e:	83 c4 10             	add    $0x10,%esp
    1f91:	85 c0                	test   %eax,%eax
    1f93:	0f 89 85 02 00 00    	jns    221e <subdir+0x53e>
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1f99:	83 ec 08             	sub    $0x8,%esp
    1f9c:	68 f2 45 00 00       	push   $0x45f2
    1fa1:	68 5e 45 00 00       	push   $0x455e
    1fa6:	e8 d7 18 00 00       	call   3882 <link>
    1fab:	83 c4 10             	add    $0x10,%esp
    1fae:	85 c0                	test   %eax,%eax
    1fb0:	0f 84 55 02 00 00    	je     220b <subdir+0x52b>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    1fb6:	83 ec 08             	sub    $0x8,%esp
    1fb9:	68 f2 45 00 00       	push   $0x45f2
    1fbe:	68 83 45 00 00       	push   $0x4583
    1fc3:	e8 ba 18 00 00       	call   3882 <link>
    1fc8:	83 c4 10             	add    $0x10,%esp
    1fcb:	85 c0                	test   %eax,%eax
    1fcd:	0f 84 25 02 00 00    	je     21f8 <subdir+0x518>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    1fd3:	83 ec 08             	sub    $0x8,%esp
    1fd6:	68 aa 44 00 00       	push   $0x44aa
    1fdb:	68 49 44 00 00       	push   $0x4449
    1fe0:	e8 9d 18 00 00       	call   3882 <link>
    1fe5:	83 c4 10             	add    $0x10,%esp
    1fe8:	85 c0                	test   %eax,%eax
    1fea:	0f 84 a9 01 00 00    	je     2199 <subdir+0x4b9>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    1ff0:	83 ec 0c             	sub    $0xc,%esp
    1ff3:	68 5e 45 00 00       	push   $0x455e
    1ff8:	e8 8d 18 00 00       	call   388a <mkdir>
    1ffd:	83 c4 10             	add    $0x10,%esp
    2000:	85 c0                	test   %eax,%eax
    2002:	0f 84 7e 01 00 00    	je     2186 <subdir+0x4a6>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    2008:	83 ec 0c             	sub    $0xc,%esp
    200b:	68 83 45 00 00       	push   $0x4583
    2010:	e8 75 18 00 00       	call   388a <mkdir>
    2015:	83 c4 10             	add    $0x10,%esp
    2018:	85 c0                	test   %eax,%eax
    201a:	0f 84 67 03 00 00    	je     2387 <subdir+0x6a7>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    2020:	83 ec 0c             	sub    $0xc,%esp
    2023:	68 aa 44 00 00       	push   $0x44aa
    2028:	e8 5d 18 00 00       	call   388a <mkdir>
    202d:	83 c4 10             	add    $0x10,%esp
    2030:	85 c0                	test   %eax,%eax
    2032:	0f 84 3c 03 00 00    	je     2374 <subdir+0x694>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    2038:	83 ec 0c             	sub    $0xc,%esp
    203b:	68 83 45 00 00       	push   $0x4583
    2040:	e8 2d 18 00 00       	call   3872 <unlink>
    2045:	83 c4 10             	add    $0x10,%esp
    2048:	85 c0                	test   %eax,%eax
    204a:	0f 84 11 03 00 00    	je     2361 <subdir+0x681>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    2050:	83 ec 0c             	sub    $0xc,%esp
    2053:	68 5e 45 00 00       	push   $0x455e
    2058:	e8 15 18 00 00       	call   3872 <unlink>
    205d:	83 c4 10             	add    $0x10,%esp
    2060:	85 c0                	test   %eax,%eax
    2062:	0f 84 e6 02 00 00    	je     234e <subdir+0x66e>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    2068:	83 ec 0c             	sub    $0xc,%esp
    206b:	68 49 44 00 00       	push   $0x4449
    2070:	e8 1d 18 00 00       	call   3892 <chdir>
    2075:	83 c4 10             	add    $0x10,%esp
    2078:	85 c0                	test   %eax,%eax
    207a:	0f 84 bb 02 00 00    	je     233b <subdir+0x65b>
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    2080:	83 ec 0c             	sub    $0xc,%esp
    2083:	68 f5 45 00 00       	push   $0x45f5
    2088:	e8 05 18 00 00       	call   3892 <chdir>
    208d:	83 c4 10             	add    $0x10,%esp
    2090:	85 c0                	test   %eax,%eax
    2092:	0f 84 90 02 00 00    	je     2328 <subdir+0x648>
    printf(1, "chdir dd/xx succeeded!\n");
    exit();
  }

  if(unlink("dd/dd/ffff") != 0){
    2098:	83 ec 0c             	sub    $0xc,%esp
    209b:	68 aa 44 00 00       	push   $0x44aa
    20a0:	e8 cd 17 00 00       	call   3872 <unlink>
    20a5:	83 c4 10             	add    $0x10,%esp
    20a8:	85 c0                	test   %eax,%eax
    20aa:	0f 85 9d 00 00 00    	jne    214d <subdir+0x46d>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    20b0:	83 ec 0c             	sub    $0xc,%esp
    20b3:	68 49 44 00 00       	push   $0x4449
    20b8:	e8 b5 17 00 00       	call   3872 <unlink>
    20bd:	83 c4 10             	add    $0x10,%esp
    20c0:	85 c0                	test   %eax,%eax
    20c2:	0f 85 4d 02 00 00    	jne    2315 <subdir+0x635>
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    20c8:	83 ec 0c             	sub    $0xc,%esp
    20cb:	68 10 45 00 00       	push   $0x4510
    20d0:	e8 9d 17 00 00       	call   3872 <unlink>
    20d5:	83 c4 10             	add    $0x10,%esp
    20d8:	85 c0                	test   %eax,%eax
    20da:	0f 84 22 02 00 00    	je     2302 <subdir+0x622>
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    20e0:	83 ec 0c             	sub    $0xc,%esp
    20e3:	68 25 44 00 00       	push   $0x4425
    20e8:	e8 85 17 00 00       	call   3872 <unlink>
    20ed:	83 c4 10             	add    $0x10,%esp
    20f0:	85 c0                	test   %eax,%eax
    20f2:	0f 88 f7 01 00 00    	js     22ef <subdir+0x60f>
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    20f8:	83 ec 0c             	sub    $0xc,%esp
    20fb:	68 10 45 00 00       	push   $0x4510
    2100:	e8 6d 17 00 00       	call   3872 <unlink>
    2105:	83 c4 10             	add    $0x10,%esp
    2108:	85 c0                	test   %eax,%eax
    210a:	0f 88 cc 01 00 00    	js     22dc <subdir+0x5fc>
    printf(1, "unlink dd failed\n");
    exit();
  }

  printf(1, "subdir ok\n");
    2110:	83 ec 08             	sub    $0x8,%esp
    2113:	68 f2 46 00 00       	push   $0x46f2
    2118:	6a 01                	push   $0x1
    211a:	e8 61 18 00 00       	call   3980 <printf>
}
    211f:	83 c4 10             	add    $0x10,%esp
    2122:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2125:	c9                   	leave  
    2126:	c3                   	ret    
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
  if(cc != 2 || buf[0] != 'f'){
    printf(1, "dd/dd/../ff wrong content\n");
    2127:	50                   	push   %eax
    2128:	50                   	push   %eax
    2129:	68 8f 44 00 00       	push   $0x448f
    212e:	6a 01                	push   $0x1
    2130:	e8 4b 18 00 00       	call   3980 <printf>
    exit();
    2135:	e8 e8 16 00 00       	call   3822 <exit>
  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    213a:	50                   	push   %eax
    213b:	50                   	push   %eax
    213c:	68 ea 44 00 00       	push   $0x44ea
    2141:	6a 01                	push   $0x1
    2143:	e8 38 18 00 00       	call   3980 <printf>
    exit();
    2148:	e8 d5 16 00 00       	call   3822 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    214d:	52                   	push   %edx
    214e:	52                   	push   %edx
    214f:	68 b5 44 00 00       	push   $0x44b5
    2154:	6a 01                	push   $0x1
    2156:	e8 25 18 00 00       	call   3980 <printf>
    exit();
    215b:	e8 c2 16 00 00       	call   3822 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    2160:	50                   	push   %eax
    2161:	50                   	push   %eax
    2162:	68 67 45 00 00       	push   $0x4567
    2167:	6a 01                	push   $0x1
    2169:	e8 12 18 00 00       	call   3980 <printf>
    exit();
    216e:	e8 af 16 00 00       	call   3822 <exit>
    exit();
  }
  close(fd);

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    2173:	52                   	push   %edx
    2174:	52                   	push   %edx
    2175:	68 28 4f 00 00       	push   $0x4f28
    217a:	6a 01                	push   $0x1
    217c:	e8 ff 17 00 00       	call   3980 <printf>
    exit();
    2181:	e8 9c 16 00 00       	call   3822 <exit>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    2186:	52                   	push   %edx
    2187:	52                   	push   %edx
    2188:	68 fb 45 00 00       	push   $0x45fb
    218d:	6a 01                	push   $0x1
    218f:	e8 ec 17 00 00       	call   3980 <printf>
    exit();
    2194:	e8 89 16 00 00       	call   3822 <exit>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    2199:	51                   	push   %ecx
    219a:	51                   	push   %ecx
    219b:	68 98 4f 00 00       	push   $0x4f98
    21a0:	6a 01                	push   $0x1
    21a2:	e8 d9 17 00 00       	call   3980 <printf>
    exit();
    21a7:	e8 76 16 00 00       	call   3822 <exit>
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/../ff failed\n");
    21ac:	50                   	push   %eax
    21ad:	50                   	push   %eax
    21ae:	68 76 44 00 00       	push   $0x4476
    21b3:	6a 01                	push   $0x1
    21b5:	e8 c6 17 00 00       	call   3980 <printf>
    exit();
    21ba:	e8 63 16 00 00       	call   3822 <exit>
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/dd/ff failed\n");
    21bf:	51                   	push   %ecx
    21c0:	51                   	push   %ecx
    21c1:	68 4f 44 00 00       	push   $0x444f
    21c6:	6a 01                	push   $0x1
    21c8:	e8 b3 17 00 00       	call   3980 <printf>
    exit();
    21cd:	e8 50 16 00 00       	call   3822 <exit>
  if(chdir("dd/../../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    21d2:	50                   	push   %eax
    21d3:	50                   	push   %eax
    21d4:	68 18 45 00 00       	push   $0x4518
    21d9:	6a 01                	push   $0x1
    21db:	e8 a0 17 00 00       	call   3980 <printf>
    exit();
    21e0:	e8 3d 16 00 00       	call   3822 <exit>
    exit();
  }
  close(fd);

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    21e5:	51                   	push   %ecx
    21e6:	51                   	push   %ecx
    21e7:	68 e0 4e 00 00       	push   $0x4ee0
    21ec:	6a 01                	push   $0x1
    21ee:	e8 8d 17 00 00       	call   3980 <printf>
    exit();
    21f3:	e8 2a 16 00 00       	call   3822 <exit>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    21f8:	53                   	push   %ebx
    21f9:	53                   	push   %ebx
    21fa:	68 74 4f 00 00       	push   $0x4f74
    21ff:	6a 01                	push   $0x1
    2201:	e8 7a 17 00 00       	call   3980 <printf>
    exit();
    2206:	e8 17 16 00 00       	call   3822 <exit>
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    220b:	50                   	push   %eax
    220c:	50                   	push   %eax
    220d:	68 50 4f 00 00       	push   $0x4f50
    2212:	6a 01                	push   $0x1
    2214:	e8 67 17 00 00       	call   3980 <printf>
    exit();
    2219:	e8 04 16 00 00       	call   3822 <exit>
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    221e:	50                   	push   %eax
    221f:	50                   	push   %eax
    2220:	68 d7 45 00 00       	push   $0x45d7
    2225:	6a 01                	push   $0x1
    2227:	e8 54 17 00 00       	call   3980 <printf>
    exit();
    222c:	e8 f1 15 00 00       	call   3822 <exit>
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    2231:	50                   	push   %eax
    2232:	50                   	push   %eax
    2233:	68 be 45 00 00       	push   $0x45be
    2238:	6a 01                	push   $0x1
    223a:	e8 41 17 00 00       	call   3980 <printf>
    exit();
    223f:	e8 de 15 00 00       	call   3822 <exit>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    2244:	50                   	push   %eax
    2245:	50                   	push   %eax
    2246:	68 a8 45 00 00       	push   $0x45a8
    224b:	6a 01                	push   $0x1
    224d:	e8 2e 17 00 00       	call   3980 <printf>
    exit();
    2252:	e8 cb 15 00 00       	call   3822 <exit>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    2257:	50                   	push   %eax
    2258:	50                   	push   %eax
    2259:	68 8c 45 00 00       	push   $0x458c
    225e:	6a 01                	push   $0x1
    2260:	e8 1b 17 00 00       	call   3980 <printf>
    exit();
    2265:	e8 b8 15 00 00       	call   3822 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    226a:	50                   	push   %eax
    226b:	50                   	push   %eax
    226c:	68 cd 44 00 00       	push   $0x44cd
    2271:	6a 01                	push   $0x1
    2273:	e8 08 17 00 00       	call   3980 <printf>
    exit();
    2278:	e8 a5 15 00 00       	call   3822 <exit>
  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    227d:	50                   	push   %eax
    227e:	50                   	push   %eax
    227f:	68 04 4f 00 00       	push   $0x4f04
    2284:	6a 01                	push   $0x1
    2286:	e8 f5 16 00 00       	call   3980 <printf>
    exit();
    228b:	e8 92 15 00 00       	call   3822 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    2290:	53                   	push   %ebx
    2291:	53                   	push   %ebx
    2292:	68 2b 44 00 00       	push   $0x442b
    2297:	6a 01                	push   $0x1
    2299:	e8 e2 16 00 00       	call   3980 <printf>
    exit();
    229e:	e8 7f 15 00 00       	call   3822 <exit>
  }
  write(fd, "ff", 2);
  close(fd);

  if(unlink("dd") >= 0){
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    22a3:	50                   	push   %eax
    22a4:	50                   	push   %eax
    22a5:	68 b8 4e 00 00       	push   $0x4eb8
    22aa:	6a 01                	push   $0x1
    22ac:	e8 cf 16 00 00       	call   3980 <printf>
    exit();
    22b1:	e8 6c 15 00 00       	call   3822 <exit>
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/ff failed\n");
    22b6:	50                   	push   %eax
    22b7:	50                   	push   %eax
    22b8:	68 0f 44 00 00       	push   $0x440f
    22bd:	6a 01                	push   $0x1
    22bf:	e8 bc 16 00 00       	call   3980 <printf>
    exit();
    22c4:	e8 59 15 00 00       	call   3822 <exit>

  printf(1, "subdir test\n");

  unlink("ff");
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    22c9:	50                   	push   %eax
    22ca:	50                   	push   %eax
    22cb:	68 f7 43 00 00       	push   $0x43f7
    22d0:	6a 01                	push   $0x1
    22d2:	e8 a9 16 00 00       	call   3980 <printf>
    exit();
    22d7:	e8 46 15 00 00       	call   3822 <exit>
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    printf(1, "unlink dd failed\n");
    22dc:	50                   	push   %eax
    22dd:	50                   	push   %eax
    22de:	68 e0 46 00 00       	push   $0x46e0
    22e3:	6a 01                	push   $0x1
    22e5:	e8 96 16 00 00       	call   3980 <printf>
    exit();
    22ea:	e8 33 15 00 00       	call   3822 <exit>
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    22ef:	52                   	push   %edx
    22f0:	52                   	push   %edx
    22f1:	68 cb 46 00 00       	push   $0x46cb
    22f6:	6a 01                	push   $0x1
    22f8:	e8 83 16 00 00       	call   3980 <printf>
    exit();
    22fd:	e8 20 15 00 00       	call   3822 <exit>
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    2302:	51                   	push   %ecx
    2303:	51                   	push   %ecx
    2304:	68 bc 4f 00 00       	push   $0x4fbc
    2309:	6a 01                	push   $0x1
    230b:	e8 70 16 00 00       	call   3980 <printf>
    exit();
    2310:	e8 0d 15 00 00       	call   3822 <exit>
  if(unlink("dd/dd/ffff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    2315:	53                   	push   %ebx
    2316:	53                   	push   %ebx
    2317:	68 b6 46 00 00       	push   $0x46b6
    231c:	6a 01                	push   $0x1
    231e:	e8 5d 16 00 00       	call   3980 <printf>
    exit();
    2323:	e8 fa 14 00 00       	call   3822 <exit>
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    printf(1, "chdir dd/xx succeeded!\n");
    2328:	50                   	push   %eax
    2329:	50                   	push   %eax
    232a:	68 9e 46 00 00       	push   $0x469e
    232f:	6a 01                	push   $0x1
    2331:	e8 4a 16 00 00       	call   3980 <printf>
    exit();
    2336:	e8 e7 14 00 00       	call   3822 <exit>
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    233b:	50                   	push   %eax
    233c:	50                   	push   %eax
    233d:	68 86 46 00 00       	push   $0x4686
    2342:	6a 01                	push   $0x1
    2344:	e8 37 16 00 00       	call   3980 <printf>
    exit();
    2349:	e8 d4 14 00 00       	call   3822 <exit>
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    234e:	50                   	push   %eax
    234f:	50                   	push   %eax
    2350:	68 6a 46 00 00       	push   $0x466a
    2355:	6a 01                	push   $0x1
    2357:	e8 24 16 00 00       	call   3980 <printf>
    exit();
    235c:	e8 c1 14 00 00       	call   3822 <exit>
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    2361:	50                   	push   %eax
    2362:	50                   	push   %eax
    2363:	68 4e 46 00 00       	push   $0x464e
    2368:	6a 01                	push   $0x1
    236a:	e8 11 16 00 00       	call   3980 <printf>
    exit();
    236f:	e8 ae 14 00 00       	call   3822 <exit>
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    2374:	50                   	push   %eax
    2375:	50                   	push   %eax
    2376:	68 31 46 00 00       	push   $0x4631
    237b:	6a 01                	push   $0x1
    237d:	e8 fe 15 00 00       	call   3980 <printf>
    exit();
    2382:	e8 9b 14 00 00       	call   3822 <exit>
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    2387:	50                   	push   %eax
    2388:	50                   	push   %eax
    2389:	68 16 46 00 00       	push   $0x4616
    238e:	6a 01                	push   $0x1
    2390:	e8 eb 15 00 00       	call   3980 <printf>
    exit();
    2395:	e8 88 14 00 00       	call   3822 <exit>
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    printf(1, "read dd/dd/ffff wrong len\n");
    239a:	50                   	push   %eax
    239b:	50                   	push   %eax
    239c:	68 43 45 00 00       	push   $0x4543
    23a1:	6a 01                	push   $0x1
    23a3:	e8 d8 15 00 00       	call   3980 <printf>
    exit();
    23a8:	e8 75 14 00 00       	call   3822 <exit>
    exit();
  }

  fd = open("dd/dd/ffff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    23ad:	50                   	push   %eax
    23ae:	50                   	push   %eax
    23af:	68 2b 45 00 00       	push   $0x452b
    23b4:	6a 01                	push   $0x1
    23b6:	e8 c5 15 00 00       	call   3980 <printf>
    exit();
    23bb:	e8 62 14 00 00       	call   3822 <exit>

000023c0 <bigwrite>:
}

// test writes that are larger than the log.
void
bigwrite(void)
{
    23c0:	55                   	push   %ebp
    23c1:	89 e5                	mov    %esp,%ebp
    23c3:	56                   	push   %esi
    23c4:	53                   	push   %ebx
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    23c5:	bb f3 01 00 00       	mov    $0x1f3,%ebx
void
bigwrite(void)
{
  int fd, sz;

  printf(1, "bigwrite test\n");
    23ca:	83 ec 08             	sub    $0x8,%esp
    23cd:	68 fd 46 00 00       	push   $0x46fd
    23d2:	6a 01                	push   $0x1
    23d4:	e8 a7 15 00 00       	call   3980 <printf>

  unlink("bigwrite");
    23d9:	c7 04 24 0c 47 00 00 	movl   $0x470c,(%esp)
    23e0:	e8 8d 14 00 00       	call   3872 <unlink>
    23e5:	83 c4 10             	add    $0x10,%esp
    23e8:	90                   	nop
    23e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    23f0:	83 ec 08             	sub    $0x8,%esp
    23f3:	68 02 02 00 00       	push   $0x202
    23f8:	68 0c 47 00 00       	push   $0x470c
    23fd:	e8 60 14 00 00       	call   3862 <open>
    if(fd < 0){
    2402:	83 c4 10             	add    $0x10,%esp
    2405:	85 c0                	test   %eax,%eax

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2407:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    2409:	78 7e                	js     2489 <bigwrite+0xc9>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    240b:	83 ec 04             	sub    $0x4,%esp
    240e:	53                   	push   %ebx
    240f:	68 c0 84 00 00       	push   $0x84c0
    2414:	50                   	push   %eax
    2415:	e8 28 14 00 00       	call   3842 <write>
      if(cc != sz){
    241a:	83 c4 10             	add    $0x10,%esp
    241d:	39 c3                	cmp    %eax,%ebx
    241f:	75 55                	jne    2476 <bigwrite+0xb6>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    2421:	83 ec 04             	sub    $0x4,%esp
    2424:	53                   	push   %ebx
    2425:	68 c0 84 00 00       	push   $0x84c0
    242a:	56                   	push   %esi
    242b:	e8 12 14 00 00       	call   3842 <write>
      if(cc != sz){
    2430:	83 c4 10             	add    $0x10,%esp
    2433:	39 c3                	cmp    %eax,%ebx
    2435:	75 3f                	jne    2476 <bigwrite+0xb6>
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    2437:	83 ec 0c             	sub    $0xc,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    243a:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    2440:	56                   	push   %esi
    2441:	e8 04 14 00 00       	call   384a <close>
    unlink("bigwrite");
    2446:	c7 04 24 0c 47 00 00 	movl   $0x470c,(%esp)
    244d:	e8 20 14 00 00       	call   3872 <unlink>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    2452:	83 c4 10             	add    $0x10,%esp
    2455:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    245b:	75 93                	jne    23f0 <bigwrite+0x30>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    245d:	83 ec 08             	sub    $0x8,%esp
    2460:	68 3f 47 00 00       	push   $0x473f
    2465:	6a 01                	push   $0x1
    2467:	e8 14 15 00 00       	call   3980 <printf>
}
    246c:	83 c4 10             	add    $0x10,%esp
    246f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    2472:	5b                   	pop    %ebx
    2473:	5e                   	pop    %esi
    2474:	5d                   	pop    %ebp
    2475:	c3                   	ret    
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
    2476:	50                   	push   %eax
    2477:	53                   	push   %ebx
    2478:	68 2d 47 00 00       	push   $0x472d
    247d:	6a 01                	push   $0x1
    247f:	e8 fc 14 00 00       	call   3980 <printf>
        exit();
    2484:	e8 99 13 00 00       	call   3822 <exit>

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
    2489:	83 ec 08             	sub    $0x8,%esp
    248c:	68 15 47 00 00       	push   $0x4715
    2491:	6a 01                	push   $0x1
    2493:	e8 e8 14 00 00       	call   3980 <printf>
      exit();
    2498:	e8 85 13 00 00       	call   3822 <exit>
    249d:	8d 76 00             	lea    0x0(%esi),%esi

000024a0 <bigfile>:
  printf(1, "bigwrite ok\n");
}

void
bigfile(void)
{
    24a0:	55                   	push   %ebp
    24a1:	89 e5                	mov    %esp,%ebp
    24a3:	57                   	push   %edi
    24a4:	56                   	push   %esi
    24a5:	53                   	push   %ebx
    24a6:	83 ec 14             	sub    $0x14,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    24a9:	68 4c 47 00 00       	push   $0x474c
    24ae:	6a 01                	push   $0x1
    24b0:	e8 cb 14 00 00       	call   3980 <printf>

  unlink("bigfile");
    24b5:	c7 04 24 68 47 00 00 	movl   $0x4768,(%esp)
    24bc:	e8 b1 13 00 00       	call   3872 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    24c1:	5e                   	pop    %esi
    24c2:	5f                   	pop    %edi
    24c3:	68 02 02 00 00       	push   $0x202
    24c8:	68 68 47 00 00       	push   $0x4768
    24cd:	e8 90 13 00 00       	call   3862 <open>
  if(fd < 0){
    24d2:	83 c4 10             	add    $0x10,%esp
    24d5:	85 c0                	test   %eax,%eax
    24d7:	0f 88 5f 01 00 00    	js     263c <bigfile+0x19c>
    24dd:	89 c6                	mov    %eax,%esi
    24df:	31 db                	xor    %ebx,%ebx
    24e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    24e8:	83 ec 04             	sub    $0x4,%esp
    24eb:	68 58 02 00 00       	push   $0x258
    24f0:	53                   	push   %ebx
    24f1:	68 c0 84 00 00       	push   $0x84c0
    24f6:	e8 95 11 00 00       	call   3690 <memset>
    if(write(fd, buf, 600) != 600){
    24fb:	83 c4 0c             	add    $0xc,%esp
    24fe:	68 58 02 00 00       	push   $0x258
    2503:	68 c0 84 00 00       	push   $0x84c0
    2508:	56                   	push   %esi
    2509:	e8 34 13 00 00       	call   3842 <write>
    250e:	83 c4 10             	add    $0x10,%esp
    2511:	3d 58 02 00 00       	cmp    $0x258,%eax
    2516:	0f 85 f8 00 00 00    	jne    2614 <bigfile+0x174>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    251c:	83 c3 01             	add    $0x1,%ebx
    251f:	83 fb 14             	cmp    $0x14,%ebx
    2522:	75 c4                	jne    24e8 <bigfile+0x48>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit();
    }
  }
  close(fd);
    2524:	83 ec 0c             	sub    $0xc,%esp
    2527:	56                   	push   %esi
    2528:	e8 1d 13 00 00       	call   384a <close>

  fd = open("bigfile", 0);
    252d:	59                   	pop    %ecx
    252e:	5b                   	pop    %ebx
    252f:	6a 00                	push   $0x0
    2531:	68 68 47 00 00       	push   $0x4768
    2536:	e8 27 13 00 00       	call   3862 <open>
  if(fd < 0){
    253b:	83 c4 10             	add    $0x10,%esp
    253e:	85 c0                	test   %eax,%eax
      exit();
    }
  }
  close(fd);

  fd = open("bigfile", 0);
    2540:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    2542:	0f 88 e0 00 00 00    	js     2628 <bigfile+0x188>
    2548:	31 db                	xor    %ebx,%ebx
    254a:	31 ff                	xor    %edi,%edi
    254c:	eb 30                	jmp    257e <bigfile+0xde>
    254e:	66 90                	xchg   %ax,%ax
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
    2550:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    2555:	0f 85 91 00 00 00    	jne    25ec <bigfile+0x14c>
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    255b:	0f be 05 c0 84 00 00 	movsbl 0x84c0,%eax
    2562:	89 fa                	mov    %edi,%edx
    2564:	d1 fa                	sar    %edx
    2566:	39 d0                	cmp    %edx,%eax
    2568:	75 6e                	jne    25d8 <bigfile+0x138>
    256a:	0f be 15 eb 85 00 00 	movsbl 0x85eb,%edx
    2571:	39 d0                	cmp    %edx,%eax
    2573:	75 63                	jne    25d8 <bigfile+0x138>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
    2575:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    257b:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    257e:	83 ec 04             	sub    $0x4,%esp
    2581:	68 2c 01 00 00       	push   $0x12c
    2586:	68 c0 84 00 00       	push   $0x84c0
    258b:	56                   	push   %esi
    258c:	e8 a9 12 00 00       	call   383a <read>
    if(cc < 0){
    2591:	83 c4 10             	add    $0x10,%esp
    2594:	85 c0                	test   %eax,%eax
    2596:	78 68                	js     2600 <bigfile+0x160>
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
    2598:	75 b6                	jne    2550 <bigfile+0xb0>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
  close(fd);
    259a:	83 ec 0c             	sub    $0xc,%esp
    259d:	56                   	push   %esi
    259e:	e8 a7 12 00 00       	call   384a <close>
  if(total != 20*600){
    25a3:	83 c4 10             	add    $0x10,%esp
    25a6:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    25ac:	0f 85 9e 00 00 00    	jne    2650 <bigfile+0x1b0>
    printf(1, "read bigfile wrong total\n");
    exit();
  }
  unlink("bigfile");
    25b2:	83 ec 0c             	sub    $0xc,%esp
    25b5:	68 68 47 00 00       	push   $0x4768
    25ba:	e8 b3 12 00 00       	call   3872 <unlink>

  printf(1, "bigfile test ok\n");
    25bf:	58                   	pop    %eax
    25c0:	5a                   	pop    %edx
    25c1:	68 f7 47 00 00       	push   $0x47f7
    25c6:	6a 01                	push   $0x1
    25c8:	e8 b3 13 00 00       	call   3980 <printf>
}
    25cd:	83 c4 10             	add    $0x10,%esp
    25d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    25d3:	5b                   	pop    %ebx
    25d4:	5e                   	pop    %esi
    25d5:	5f                   	pop    %edi
    25d6:	5d                   	pop    %ebp
    25d7:	c3                   	ret    
    if(cc != 300){
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
    25d8:	83 ec 08             	sub    $0x8,%esp
    25db:	68 c4 47 00 00       	push   $0x47c4
    25e0:	6a 01                	push   $0x1
    25e2:	e8 99 13 00 00       	call   3980 <printf>
      exit();
    25e7:	e8 36 12 00 00       	call   3822 <exit>
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
      printf(1, "short read bigfile\n");
    25ec:	83 ec 08             	sub    $0x8,%esp
    25ef:	68 b0 47 00 00       	push   $0x47b0
    25f4:	6a 01                	push   $0x1
    25f6:	e8 85 13 00 00       	call   3980 <printf>
      exit();
    25fb:	e8 22 12 00 00       	call   3822 <exit>
  }
  total = 0;
  for(i = 0; ; i++){
    cc = read(fd, buf, 300);
    if(cc < 0){
      printf(1, "read bigfile failed\n");
    2600:	83 ec 08             	sub    $0x8,%esp
    2603:	68 9b 47 00 00       	push   $0x479b
    2608:	6a 01                	push   $0x1
    260a:	e8 71 13 00 00       	call   3980 <printf>
      exit();
    260f:	e8 0e 12 00 00       	call   3822 <exit>
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
    2614:	83 ec 08             	sub    $0x8,%esp
    2617:	68 70 47 00 00       	push   $0x4770
    261c:	6a 01                	push   $0x1
    261e:	e8 5d 13 00 00       	call   3980 <printf>
      exit();
    2623:	e8 fa 11 00 00       	call   3822 <exit>
  }
  close(fd);

  fd = open("bigfile", 0);
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    2628:	83 ec 08             	sub    $0x8,%esp
    262b:	68 86 47 00 00       	push   $0x4786
    2630:	6a 01                	push   $0x1
    2632:	e8 49 13 00 00       	call   3980 <printf>
    exit();
    2637:	e8 e6 11 00 00       	call   3822 <exit>
  printf(1, "bigfile test\n");

  unlink("bigfile");
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    263c:	83 ec 08             	sub    $0x8,%esp
    263f:	68 5a 47 00 00       	push   $0x475a
    2644:	6a 01                	push   $0x1
    2646:	e8 35 13 00 00       	call   3980 <printf>
    exit();
    264b:	e8 d2 11 00 00       	call   3822 <exit>
    }
    total += cc;
  }
  close(fd);
  if(total != 20*600){
    printf(1, "read bigfile wrong total\n");
    2650:	83 ec 08             	sub    $0x8,%esp
    2653:	68 dd 47 00 00       	push   $0x47dd
    2658:	6a 01                	push   $0x1
    265a:	e8 21 13 00 00       	call   3980 <printf>
    exit();
    265f:	e8 be 11 00 00       	call   3822 <exit>
    2664:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    266a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00002670 <fourteen>:
  printf(1, "bigfile test ok\n");
}

void
fourteen(void)
{
    2670:	55                   	push   %ebp
    2671:	89 e5                	mov    %esp,%ebp
    2673:	83 ec 10             	sub    $0x10,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    2676:	68 08 48 00 00       	push   $0x4808
    267b:	6a 01                	push   $0x1
    267d:	e8 fe 12 00 00       	call   3980 <printf>

  if(mkdir("12345678901234") != 0){
    2682:	c7 04 24 43 48 00 00 	movl   $0x4843,(%esp)
    2689:	e8 fc 11 00 00       	call   388a <mkdir>
    268e:	83 c4 10             	add    $0x10,%esp
    2691:	85 c0                	test   %eax,%eax
    2693:	0f 85 97 00 00 00    	jne    2730 <fourteen+0xc0>
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    2699:	83 ec 0c             	sub    $0xc,%esp
    269c:	68 dc 4f 00 00       	push   $0x4fdc
    26a1:	e8 e4 11 00 00       	call   388a <mkdir>
    26a6:	83 c4 10             	add    $0x10,%esp
    26a9:	85 c0                	test   %eax,%eax
    26ab:	0f 85 de 00 00 00    	jne    278f <fourteen+0x11f>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    26b1:	83 ec 08             	sub    $0x8,%esp
    26b4:	68 00 02 00 00       	push   $0x200
    26b9:	68 2c 50 00 00       	push   $0x502c
    26be:	e8 9f 11 00 00       	call   3862 <open>
  if(fd < 0){
    26c3:	83 c4 10             	add    $0x10,%esp
    26c6:	85 c0                	test   %eax,%eax
    26c8:	0f 88 ae 00 00 00    	js     277c <fourteen+0x10c>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    exit();
  }
  close(fd);
    26ce:	83 ec 0c             	sub    $0xc,%esp
    26d1:	50                   	push   %eax
    26d2:	e8 73 11 00 00       	call   384a <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    26d7:	58                   	pop    %eax
    26d8:	5a                   	pop    %edx
    26d9:	6a 00                	push   $0x0
    26db:	68 9c 50 00 00       	push   $0x509c
    26e0:	e8 7d 11 00 00       	call   3862 <open>
  if(fd < 0){
    26e5:	83 c4 10             	add    $0x10,%esp
    26e8:	85 c0                	test   %eax,%eax
    26ea:	78 7d                	js     2769 <fourteen+0xf9>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    exit();
  }
  close(fd);
    26ec:	83 ec 0c             	sub    $0xc,%esp
    26ef:	50                   	push   %eax
    26f0:	e8 55 11 00 00       	call   384a <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    26f5:	c7 04 24 34 48 00 00 	movl   $0x4834,(%esp)
    26fc:	e8 89 11 00 00       	call   388a <mkdir>
    2701:	83 c4 10             	add    $0x10,%esp
    2704:	85 c0                	test   %eax,%eax
    2706:	74 4e                	je     2756 <fourteen+0xe6>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    2708:	83 ec 0c             	sub    $0xc,%esp
    270b:	68 38 51 00 00       	push   $0x5138
    2710:	e8 75 11 00 00       	call   388a <mkdir>
    2715:	83 c4 10             	add    $0x10,%esp
    2718:	85 c0                	test   %eax,%eax
    271a:	74 27                	je     2743 <fourteen+0xd3>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    exit();
  }

  printf(1, "fourteen ok\n");
    271c:	83 ec 08             	sub    $0x8,%esp
    271f:	68 52 48 00 00       	push   $0x4852
    2724:	6a 01                	push   $0x1
    2726:	e8 55 12 00 00       	call   3980 <printf>
}
    272b:	83 c4 10             	add    $0x10,%esp
    272e:	c9                   	leave  
    272f:	c3                   	ret    

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");

  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    2730:	50                   	push   %eax
    2731:	50                   	push   %eax
    2732:	68 17 48 00 00       	push   $0x4817
    2737:	6a 01                	push   $0x1
    2739:	e8 42 12 00 00       	call   3980 <printf>
    exit();
    273e:	e8 df 10 00 00       	call   3822 <exit>
  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2743:	50                   	push   %eax
    2744:	50                   	push   %eax
    2745:	68 58 51 00 00       	push   $0x5158
    274a:	6a 01                	push   $0x1
    274c:	e8 2f 12 00 00       	call   3980 <printf>
    exit();
    2751:	e8 cc 10 00 00       	call   3822 <exit>
    exit();
  }
  close(fd);

  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2756:	52                   	push   %edx
    2757:	52                   	push   %edx
    2758:	68 08 51 00 00       	push   $0x5108
    275d:	6a 01                	push   $0x1
    275f:	e8 1c 12 00 00       	call   3980 <printf>
    exit();
    2764:	e8 b9 10 00 00       	call   3822 <exit>
    exit();
  }
  close(fd);
  fd = open("12345678901234/12345678901234/12345678901234", 0);
  if(fd < 0){
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2769:	51                   	push   %ecx
    276a:	51                   	push   %ecx
    276b:	68 cc 50 00 00       	push   $0x50cc
    2770:	6a 01                	push   $0x1
    2772:	e8 09 12 00 00       	call   3980 <printf>
    exit();
    2777:	e8 a6 10 00 00       	call   3822 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
  if(fd < 0){
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    277c:	51                   	push   %ecx
    277d:	51                   	push   %ecx
    277e:	68 5c 50 00 00       	push   $0x505c
    2783:	6a 01                	push   $0x1
    2785:	e8 f6 11 00 00       	call   3980 <printf>
    exit();
    278a:	e8 93 10 00 00       	call   3822 <exit>
  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    278f:	50                   	push   %eax
    2790:	50                   	push   %eax
    2791:	68 fc 4f 00 00       	push   $0x4ffc
    2796:	6a 01                	push   $0x1
    2798:	e8 e3 11 00 00       	call   3980 <printf>
    exit();
    279d:	e8 80 10 00 00       	call   3822 <exit>
    27a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    27a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000027b0 <rmdot>:
  printf(1, "fourteen ok\n");
}

void
rmdot(void)
{
    27b0:	55                   	push   %ebp
    27b1:	89 e5                	mov    %esp,%ebp
    27b3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    27b6:	68 5f 48 00 00       	push   $0x485f
    27bb:	6a 01                	push   $0x1
    27bd:	e8 be 11 00 00       	call   3980 <printf>
  if(mkdir("dots") != 0){
    27c2:	c7 04 24 6b 48 00 00 	movl   $0x486b,(%esp)
    27c9:	e8 bc 10 00 00       	call   388a <mkdir>
    27ce:	83 c4 10             	add    $0x10,%esp
    27d1:	85 c0                	test   %eax,%eax
    27d3:	0f 85 b0 00 00 00    	jne    2889 <rmdot+0xd9>
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    27d9:	83 ec 0c             	sub    $0xc,%esp
    27dc:	68 6b 48 00 00       	push   $0x486b
    27e1:	e8 ac 10 00 00       	call   3892 <chdir>
    27e6:	83 c4 10             	add    $0x10,%esp
    27e9:	85 c0                	test   %eax,%eax
    27eb:	0f 85 1d 01 00 00    	jne    290e <rmdot+0x15e>
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    27f1:	83 ec 0c             	sub    $0xc,%esp
    27f4:	68 16 45 00 00       	push   $0x4516
    27f9:	e8 74 10 00 00       	call   3872 <unlink>
    27fe:	83 c4 10             	add    $0x10,%esp
    2801:	85 c0                	test   %eax,%eax
    2803:	0f 84 f2 00 00 00    	je     28fb <rmdot+0x14b>
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    2809:	83 ec 0c             	sub    $0xc,%esp
    280c:	68 15 45 00 00       	push   $0x4515
    2811:	e8 5c 10 00 00       	call   3872 <unlink>
    2816:	83 c4 10             	add    $0x10,%esp
    2819:	85 c0                	test   %eax,%eax
    281b:	0f 84 c7 00 00 00    	je     28e8 <rmdot+0x138>
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    2821:	83 ec 0c             	sub    $0xc,%esp
    2824:	68 e9 3c 00 00       	push   $0x3ce9
    2829:	e8 64 10 00 00       	call   3892 <chdir>
    282e:	83 c4 10             	add    $0x10,%esp
    2831:	85 c0                	test   %eax,%eax
    2833:	0f 85 9c 00 00 00    	jne    28d5 <rmdot+0x125>
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    2839:	83 ec 0c             	sub    $0xc,%esp
    283c:	68 b3 48 00 00       	push   $0x48b3
    2841:	e8 2c 10 00 00       	call   3872 <unlink>
    2846:	83 c4 10             	add    $0x10,%esp
    2849:	85 c0                	test   %eax,%eax
    284b:	74 75                	je     28c2 <rmdot+0x112>
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    284d:	83 ec 0c             	sub    $0xc,%esp
    2850:	68 d1 48 00 00       	push   $0x48d1
    2855:	e8 18 10 00 00       	call   3872 <unlink>
    285a:	83 c4 10             	add    $0x10,%esp
    285d:	85 c0                	test   %eax,%eax
    285f:	74 4e                	je     28af <rmdot+0xff>
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    2861:	83 ec 0c             	sub    $0xc,%esp
    2864:	68 6b 48 00 00       	push   $0x486b
    2869:	e8 04 10 00 00       	call   3872 <unlink>
    286e:	83 c4 10             	add    $0x10,%esp
    2871:	85 c0                	test   %eax,%eax
    2873:	75 27                	jne    289c <rmdot+0xec>
    printf(1, "unlink dots failed!\n");
    exit();
  }
  printf(1, "rmdot ok\n");
    2875:	83 ec 08             	sub    $0x8,%esp
    2878:	68 06 49 00 00       	push   $0x4906
    287d:	6a 01                	push   $0x1
    287f:	e8 fc 10 00 00       	call   3980 <printf>
}
    2884:	83 c4 10             	add    $0x10,%esp
    2887:	c9                   	leave  
    2888:	c3                   	ret    
void
rmdot(void)
{
  printf(1, "rmdot test\n");
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    2889:	50                   	push   %eax
    288a:	50                   	push   %eax
    288b:	68 70 48 00 00       	push   $0x4870
    2890:	6a 01                	push   $0x1
    2892:	e8 e9 10 00 00       	call   3980 <printf>
    exit();
    2897:	e8 86 0f 00 00       	call   3822 <exit>
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    printf(1, "unlink dots failed!\n");
    289c:	50                   	push   %eax
    289d:	50                   	push   %eax
    289e:	68 f1 48 00 00       	push   $0x48f1
    28a3:	6a 01                	push   $0x1
    28a5:	e8 d6 10 00 00       	call   3980 <printf>
    exit();
    28aa:	e8 73 0f 00 00       	call   3822 <exit>
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    28af:	52                   	push   %edx
    28b0:	52                   	push   %edx
    28b1:	68 d9 48 00 00       	push   $0x48d9
    28b6:	6a 01                	push   $0x1
    28b8:	e8 c3 10 00 00       	call   3980 <printf>
    exit();
    28bd:	e8 60 0f 00 00       	call   3822 <exit>
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    28c2:	51                   	push   %ecx
    28c3:	51                   	push   %ecx
    28c4:	68 ba 48 00 00       	push   $0x48ba
    28c9:	6a 01                	push   $0x1
    28cb:	e8 b0 10 00 00       	call   3980 <printf>
    exit();
    28d0:	e8 4d 0f 00 00       	call   3822 <exit>
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    28d5:	50                   	push   %eax
    28d6:	50                   	push   %eax
    28d7:	68 eb 3c 00 00       	push   $0x3ceb
    28dc:	6a 01                	push   $0x1
    28de:	e8 9d 10 00 00       	call   3980 <printf>
    exit();
    28e3:	e8 3a 0f 00 00       	call   3822 <exit>
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    28e8:	50                   	push   %eax
    28e9:	50                   	push   %eax
    28ea:	68 a4 48 00 00       	push   $0x48a4
    28ef:	6a 01                	push   $0x1
    28f1:	e8 8a 10 00 00       	call   3980 <printf>
    exit();
    28f6:	e8 27 0f 00 00       	call   3822 <exit>
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    28fb:	50                   	push   %eax
    28fc:	50                   	push   %eax
    28fd:	68 96 48 00 00       	push   $0x4896
    2902:	6a 01                	push   $0x1
    2904:	e8 77 10 00 00       	call   3980 <printf>
    exit();
    2909:	e8 14 0f 00 00       	call   3822 <exit>
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    290e:	50                   	push   %eax
    290f:	50                   	push   %eax
    2910:	68 83 48 00 00       	push   $0x4883
    2915:	6a 01                	push   $0x1
    2917:	e8 64 10 00 00       	call   3980 <printf>
    exit();
    291c:	e8 01 0f 00 00       	call   3822 <exit>
    2921:	eb 0d                	jmp    2930 <dirfile>
    2923:	90                   	nop
    2924:	90                   	nop
    2925:	90                   	nop
    2926:	90                   	nop
    2927:	90                   	nop
    2928:	90                   	nop
    2929:	90                   	nop
    292a:	90                   	nop
    292b:	90                   	nop
    292c:	90                   	nop
    292d:	90                   	nop
    292e:	90                   	nop
    292f:	90                   	nop

00002930 <dirfile>:
  printf(1, "rmdot ok\n");
}

void
dirfile(void)
{
    2930:	55                   	push   %ebp
    2931:	89 e5                	mov    %esp,%ebp
    2933:	53                   	push   %ebx
    2934:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "dir vs file\n");
    2937:	68 10 49 00 00       	push   $0x4910
    293c:	6a 01                	push   $0x1
    293e:	e8 3d 10 00 00       	call   3980 <printf>

  fd = open("dirfile", O_CREATE);
    2943:	59                   	pop    %ecx
    2944:	5b                   	pop    %ebx
    2945:	68 00 02 00 00       	push   $0x200
    294a:	68 1d 49 00 00       	push   $0x491d
    294f:	e8 0e 0f 00 00       	call   3862 <open>
  if(fd < 0){
    2954:	83 c4 10             	add    $0x10,%esp
    2957:	85 c0                	test   %eax,%eax
    2959:	0f 88 43 01 00 00    	js     2aa2 <dirfile+0x172>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
    295f:	83 ec 0c             	sub    $0xc,%esp
    2962:	50                   	push   %eax
    2963:	e8 e2 0e 00 00       	call   384a <close>
  if(chdir("dirfile") == 0){
    2968:	c7 04 24 1d 49 00 00 	movl   $0x491d,(%esp)
    296f:	e8 1e 0f 00 00       	call   3892 <chdir>
    2974:	83 c4 10             	add    $0x10,%esp
    2977:	85 c0                	test   %eax,%eax
    2979:	0f 84 10 01 00 00    	je     2a8f <dirfile+0x15f>
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
    297f:	83 ec 08             	sub    $0x8,%esp
    2982:	6a 00                	push   $0x0
    2984:	68 56 49 00 00       	push   $0x4956
    2989:	e8 d4 0e 00 00       	call   3862 <open>
  if(fd >= 0){
    298e:	83 c4 10             	add    $0x10,%esp
    2991:	85 c0                	test   %eax,%eax
    2993:	0f 89 e3 00 00 00    	jns    2a7c <dirfile+0x14c>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", O_CREATE);
    2999:	83 ec 08             	sub    $0x8,%esp
    299c:	68 00 02 00 00       	push   $0x200
    29a1:	68 56 49 00 00       	push   $0x4956
    29a6:	e8 b7 0e 00 00       	call   3862 <open>
  if(fd >= 0){
    29ab:	83 c4 10             	add    $0x10,%esp
    29ae:	85 c0                	test   %eax,%eax
    29b0:	0f 89 c6 00 00 00    	jns    2a7c <dirfile+0x14c>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    29b6:	83 ec 0c             	sub    $0xc,%esp
    29b9:	68 56 49 00 00       	push   $0x4956
    29be:	e8 c7 0e 00 00       	call   388a <mkdir>
    29c3:	83 c4 10             	add    $0x10,%esp
    29c6:	85 c0                	test   %eax,%eax
    29c8:	0f 84 46 01 00 00    	je     2b14 <dirfile+0x1e4>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    29ce:	83 ec 0c             	sub    $0xc,%esp
    29d1:	68 56 49 00 00       	push   $0x4956
    29d6:	e8 97 0e 00 00       	call   3872 <unlink>
    29db:	83 c4 10             	add    $0x10,%esp
    29de:	85 c0                	test   %eax,%eax
    29e0:	0f 84 1b 01 00 00    	je     2b01 <dirfile+0x1d1>
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    29e6:	83 ec 08             	sub    $0x8,%esp
    29e9:	68 56 49 00 00       	push   $0x4956
    29ee:	68 ba 49 00 00       	push   $0x49ba
    29f3:	e8 8a 0e 00 00       	call   3882 <link>
    29f8:	83 c4 10             	add    $0x10,%esp
    29fb:	85 c0                	test   %eax,%eax
    29fd:	0f 84 eb 00 00 00    	je     2aee <dirfile+0x1be>
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    2a03:	83 ec 0c             	sub    $0xc,%esp
    2a06:	68 1d 49 00 00       	push   $0x491d
    2a0b:	e8 62 0e 00 00       	call   3872 <unlink>
    2a10:	83 c4 10             	add    $0x10,%esp
    2a13:	85 c0                	test   %eax,%eax
    2a15:	0f 85 c0 00 00 00    	jne    2adb <dirfile+0x1ab>
    printf(1, "unlink dirfile failed!\n");
    exit();
  }

  fd = open(".", O_RDWR);
    2a1b:	83 ec 08             	sub    $0x8,%esp
    2a1e:	6a 02                	push   $0x2
    2a20:	68 16 45 00 00       	push   $0x4516
    2a25:	e8 38 0e 00 00       	call   3862 <open>
  if(fd >= 0){
    2a2a:	83 c4 10             	add    $0x10,%esp
    2a2d:	85 c0                	test   %eax,%eax
    2a2f:	0f 89 93 00 00 00    	jns    2ac8 <dirfile+0x198>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    2a35:	83 ec 08             	sub    $0x8,%esp
    2a38:	6a 00                	push   $0x0
    2a3a:	68 16 45 00 00       	push   $0x4516
    2a3f:	e8 1e 0e 00 00       	call   3862 <open>
  if(write(fd, "x", 1) > 0){
    2a44:	83 c4 0c             	add    $0xc,%esp
  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    2a47:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2a49:	6a 01                	push   $0x1
    2a4b:	68 f9 45 00 00       	push   $0x45f9
    2a50:	50                   	push   %eax
    2a51:	e8 ec 0d 00 00       	call   3842 <write>
    2a56:	83 c4 10             	add    $0x10,%esp
    2a59:	85 c0                	test   %eax,%eax
    2a5b:	7f 58                	jg     2ab5 <dirfile+0x185>
    printf(1, "write . succeeded!\n");
    exit();
  }
  close(fd);
    2a5d:	83 ec 0c             	sub    $0xc,%esp
    2a60:	53                   	push   %ebx
    2a61:	e8 e4 0d 00 00       	call   384a <close>

  printf(1, "dir vs file OK\n");
    2a66:	58                   	pop    %eax
    2a67:	5a                   	pop    %edx
    2a68:	68 ed 49 00 00       	push   $0x49ed
    2a6d:	6a 01                	push   $0x1
    2a6f:	e8 0c 0f 00 00       	call   3980 <printf>
}
    2a74:	83 c4 10             	add    $0x10,%esp
    2a77:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2a7a:	c9                   	leave  
    2a7b:	c3                   	ret    
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    2a7c:	50                   	push   %eax
    2a7d:	50                   	push   %eax
    2a7e:	68 61 49 00 00       	push   $0x4961
    2a83:	6a 01                	push   $0x1
    2a85:	e8 f6 0e 00 00       	call   3980 <printf>
    exit();
    2a8a:	e8 93 0d 00 00       	call   3822 <exit>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
  if(chdir("dirfile") == 0){
    printf(1, "chdir dirfile succeeded!\n");
    2a8f:	50                   	push   %eax
    2a90:	50                   	push   %eax
    2a91:	68 3c 49 00 00       	push   $0x493c
    2a96:	6a 01                	push   $0x1
    2a98:	e8 e3 0e 00 00       	call   3980 <printf>
    exit();
    2a9d:	e8 80 0d 00 00       	call   3822 <exit>

  printf(1, "dir vs file\n");

  fd = open("dirfile", O_CREATE);
  if(fd < 0){
    printf(1, "create dirfile failed\n");
    2aa2:	52                   	push   %edx
    2aa3:	52                   	push   %edx
    2aa4:	68 25 49 00 00       	push   $0x4925
    2aa9:	6a 01                	push   $0x1
    2aab:	e8 d0 0e 00 00       	call   3980 <printf>
    exit();
    2ab0:	e8 6d 0d 00 00       	call   3822 <exit>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
  if(write(fd, "x", 1) > 0){
    printf(1, "write . succeeded!\n");
    2ab5:	51                   	push   %ecx
    2ab6:	51                   	push   %ecx
    2ab7:	68 d9 49 00 00       	push   $0x49d9
    2abc:	6a 01                	push   $0x1
    2abe:	e8 bd 0e 00 00       	call   3980 <printf>
    exit();
    2ac3:	e8 5a 0d 00 00       	call   3822 <exit>
    exit();
  }

  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    2ac8:	53                   	push   %ebx
    2ac9:	53                   	push   %ebx
    2aca:	68 ac 51 00 00       	push   $0x51ac
    2acf:	6a 01                	push   $0x1
    2ad1:	e8 aa 0e 00 00       	call   3980 <printf>
    exit();
    2ad6:	e8 47 0d 00 00       	call   3822 <exit>
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    printf(1, "unlink dirfile failed!\n");
    2adb:	50                   	push   %eax
    2adc:	50                   	push   %eax
    2add:	68 c1 49 00 00       	push   $0x49c1
    2ae2:	6a 01                	push   $0x1
    2ae4:	e8 97 0e 00 00       	call   3980 <printf>
    exit();
    2ae9:	e8 34 0d 00 00       	call   3822 <exit>
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    2aee:	50                   	push   %eax
    2aef:	50                   	push   %eax
    2af0:	68 8c 51 00 00       	push   $0x518c
    2af5:	6a 01                	push   $0x1
    2af7:	e8 84 0e 00 00       	call   3980 <printf>
    exit();
    2afc:	e8 21 0d 00 00       	call   3822 <exit>
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    2b01:	50                   	push   %eax
    2b02:	50                   	push   %eax
    2b03:	68 9c 49 00 00       	push   $0x499c
    2b08:	6a 01                	push   $0x1
    2b0a:	e8 71 0e 00 00       	call   3980 <printf>
    exit();
    2b0f:	e8 0e 0d 00 00       	call   3822 <exit>
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2b14:	50                   	push   %eax
    2b15:	50                   	push   %eax
    2b16:	68 7f 49 00 00       	push   $0x497f
    2b1b:	6a 01                	push   $0x1
    2b1d:	e8 5e 0e 00 00       	call   3980 <printf>
    exit();
    2b22:	e8 fb 0c 00 00       	call   3822 <exit>
    2b27:	89 f6                	mov    %esi,%esi
    2b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002b30 <iref>:
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2b30:	55                   	push   %ebp
    2b31:	89 e5                	mov    %esp,%ebp
    2b33:	53                   	push   %ebx
  int i, fd;

  printf(1, "empty file name\n");
    2b34:	bb 33 00 00 00       	mov    $0x33,%ebx
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2b39:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(1, "empty file name\n");
    2b3c:	68 fd 49 00 00       	push   $0x49fd
    2b41:	6a 01                	push   $0x1
    2b43:	e8 38 0e 00 00       	call   3980 <printf>
    2b48:	83 c4 10             	add    $0x10,%esp
    2b4b:	90                   	nop
    2b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
    2b50:	83 ec 0c             	sub    $0xc,%esp
    2b53:	68 0e 4a 00 00       	push   $0x4a0e
    2b58:	e8 2d 0d 00 00       	call   388a <mkdir>
    2b5d:	83 c4 10             	add    $0x10,%esp
    2b60:	85 c0                	test   %eax,%eax
    2b62:	0f 85 bb 00 00 00    	jne    2c23 <iref+0xf3>
      printf(1, "mkdir irefd failed\n");
      exit();
    }
    if(chdir("irefd") != 0){
    2b68:	83 ec 0c             	sub    $0xc,%esp
    2b6b:	68 0e 4a 00 00       	push   $0x4a0e
    2b70:	e8 1d 0d 00 00       	call   3892 <chdir>
    2b75:	83 c4 10             	add    $0x10,%esp
    2b78:	85 c0                	test   %eax,%eax
    2b7a:	0f 85 b7 00 00 00    	jne    2c37 <iref+0x107>
      printf(1, "chdir irefd failed\n");
      exit();
    }

    mkdir("");
    2b80:	83 ec 0c             	sub    $0xc,%esp
    2b83:	68 c3 40 00 00       	push   $0x40c3
    2b88:	e8 fd 0c 00 00       	call   388a <mkdir>
    link("README", "");
    2b8d:	59                   	pop    %ecx
    2b8e:	58                   	pop    %eax
    2b8f:	68 c3 40 00 00       	push   $0x40c3
    2b94:	68 ba 49 00 00       	push   $0x49ba
    2b99:	e8 e4 0c 00 00       	call   3882 <link>
    fd = open("", O_CREATE);
    2b9e:	58                   	pop    %eax
    2b9f:	5a                   	pop    %edx
    2ba0:	68 00 02 00 00       	push   $0x200
    2ba5:	68 c3 40 00 00       	push   $0x40c3
    2baa:	e8 b3 0c 00 00       	call   3862 <open>
    if(fd >= 0)
    2baf:	83 c4 10             	add    $0x10,%esp
    2bb2:	85 c0                	test   %eax,%eax
    2bb4:	78 0c                	js     2bc2 <iref+0x92>
      close(fd);
    2bb6:	83 ec 0c             	sub    $0xc,%esp
    2bb9:	50                   	push   %eax
    2bba:	e8 8b 0c 00 00       	call   384a <close>
    2bbf:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    2bc2:	83 ec 08             	sub    $0x8,%esp
    2bc5:	68 00 02 00 00       	push   $0x200
    2bca:	68 f8 45 00 00       	push   $0x45f8
    2bcf:	e8 8e 0c 00 00       	call   3862 <open>
    if(fd >= 0)
    2bd4:	83 c4 10             	add    $0x10,%esp
    2bd7:	85 c0                	test   %eax,%eax
    2bd9:	78 0c                	js     2be7 <iref+0xb7>
      close(fd);
    2bdb:	83 ec 0c             	sub    $0xc,%esp
    2bde:	50                   	push   %eax
    2bdf:	e8 66 0c 00 00       	call   384a <close>
    2be4:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    2be7:	83 ec 0c             	sub    $0xc,%esp
    2bea:	68 f8 45 00 00       	push   $0x45f8
    2bef:	e8 7e 0c 00 00       	call   3872 <unlink>
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2bf4:	83 c4 10             	add    $0x10,%esp
    2bf7:	83 eb 01             	sub    $0x1,%ebx
    2bfa:	0f 85 50 ff ff ff    	jne    2b50 <iref+0x20>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    2c00:	83 ec 0c             	sub    $0xc,%esp
    2c03:	68 e9 3c 00 00       	push   $0x3ce9
    2c08:	e8 85 0c 00 00       	call   3892 <chdir>
  printf(1, "empty file name OK\n");
    2c0d:	58                   	pop    %eax
    2c0e:	5a                   	pop    %edx
    2c0f:	68 3c 4a 00 00       	push   $0x4a3c
    2c14:	6a 01                	push   $0x1
    2c16:	e8 65 0d 00 00       	call   3980 <printf>
}
    2c1b:	83 c4 10             	add    $0x10,%esp
    2c1e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2c21:	c9                   	leave  
    2c22:	c3                   	ret    
  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
      printf(1, "mkdir irefd failed\n");
    2c23:	83 ec 08             	sub    $0x8,%esp
    2c26:	68 14 4a 00 00       	push   $0x4a14
    2c2b:	6a 01                	push   $0x1
    2c2d:	e8 4e 0d 00 00       	call   3980 <printf>
      exit();
    2c32:	e8 eb 0b 00 00       	call   3822 <exit>
    }
    if(chdir("irefd") != 0){
      printf(1, "chdir irefd failed\n");
    2c37:	83 ec 08             	sub    $0x8,%esp
    2c3a:	68 28 4a 00 00       	push   $0x4a28
    2c3f:	6a 01                	push   $0x1
    2c41:	e8 3a 0d 00 00       	call   3980 <printf>
      exit();
    2c46:	e8 d7 0b 00 00       	call   3822 <exit>
    2c4b:	90                   	nop
    2c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002c50 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2c50:	55                   	push   %ebp
    2c51:	89 e5                	mov    %esp,%ebp
    2c53:	53                   	push   %ebx
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2c54:	31 db                	xor    %ebx,%ebx
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2c56:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
    2c59:	68 50 4a 00 00       	push   $0x4a50
    2c5e:	6a 01                	push   $0x1
    2c60:	e8 1b 0d 00 00       	call   3980 <printf>
    2c65:	83 c4 10             	add    $0x10,%esp
    2c68:	eb 13                	jmp    2c7d <forktest+0x2d>
    2c6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
    2c70:	74 62                	je     2cd4 <forktest+0x84>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2c72:	83 c3 01             	add    $0x1,%ebx
    2c75:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2c7b:	74 43                	je     2cc0 <forktest+0x70>
    pid = fork();
    2c7d:	e8 98 0b 00 00       	call   381a <fork>
    if(pid < 0)
    2c82:	85 c0                	test   %eax,%eax
    2c84:	79 ea                	jns    2c70 <forktest+0x20>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    2c86:	85 db                	test   %ebx,%ebx
    2c88:	74 14                	je     2c9e <forktest+0x4e>
    2c8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    2c90:	e8 95 0b 00 00       	call   382a <wait>
    2c95:	85 c0                	test   %eax,%eax
    2c97:	78 40                	js     2cd9 <forktest+0x89>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    2c99:	83 eb 01             	sub    $0x1,%ebx
    2c9c:	75 f2                	jne    2c90 <forktest+0x40>
      printf(1, "wait stopped early\n");
      exit();
    }
  }

  if(wait() != -1){
    2c9e:	e8 87 0b 00 00       	call   382a <wait>
    2ca3:	83 f8 ff             	cmp    $0xffffffff,%eax
    2ca6:	75 45                	jne    2ced <forktest+0x9d>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
    2ca8:	83 ec 08             	sub    $0x8,%esp
    2cab:	68 82 4a 00 00       	push   $0x4a82
    2cb0:	6a 01                	push   $0x1
    2cb2:	e8 c9 0c 00 00       	call   3980 <printf>
}
    2cb7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2cba:	c9                   	leave  
    2cbb:	c3                   	ret    
    2cbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0)
      exit();
  }

  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    2cc0:	83 ec 08             	sub    $0x8,%esp
    2cc3:	68 cc 51 00 00       	push   $0x51cc
    2cc8:	6a 01                	push   $0x1
    2cca:	e8 b1 0c 00 00       	call   3980 <printf>
    exit();
    2ccf:	e8 4e 0b 00 00       	call   3822 <exit>
  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
      exit();
    2cd4:	e8 49 0b 00 00       	call   3822 <exit>
    exit();
  }

  for(; n > 0; n--){
    if(wait() < 0){
      printf(1, "wait stopped early\n");
    2cd9:	83 ec 08             	sub    $0x8,%esp
    2cdc:	68 5b 4a 00 00       	push   $0x4a5b
    2ce1:	6a 01                	push   $0x1
    2ce3:	e8 98 0c 00 00       	call   3980 <printf>
      exit();
    2ce8:	e8 35 0b 00 00       	call   3822 <exit>
    }
  }

  if(wait() != -1){
    printf(1, "wait got too many\n");
    2ced:	83 ec 08             	sub    $0x8,%esp
    2cf0:	68 6f 4a 00 00       	push   $0x4a6f
    2cf5:	6a 01                	push   $0x1
    2cf7:	e8 84 0c 00 00       	call   3980 <printf>
    exit();
    2cfc:	e8 21 0b 00 00       	call   3822 <exit>
    2d01:	eb 0d                	jmp    2d10 <sbrktest>
    2d03:	90                   	nop
    2d04:	90                   	nop
    2d05:	90                   	nop
    2d06:	90                   	nop
    2d07:	90                   	nop
    2d08:	90                   	nop
    2d09:	90                   	nop
    2d0a:	90                   	nop
    2d0b:	90                   	nop
    2d0c:	90                   	nop
    2d0d:	90                   	nop
    2d0e:	90                   	nop
    2d0f:	90                   	nop

00002d10 <sbrktest>:
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    2d10:	55                   	push   %ebp
    2d11:	89 e5                	mov    %esp,%ebp
    2d13:	57                   	push   %edi
    2d14:	56                   	push   %esi
    2d15:	53                   	push   %ebx
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    2d16:	31 ff                	xor    %edi,%edi
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    2d18:	83 ec 64             	sub    $0x64,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    2d1b:	68 90 4a 00 00       	push   $0x4a90
    2d20:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    2d26:	e8 55 0c 00 00       	call   3980 <printf>
  oldbrk = sbrk(0);
    2d2b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d32:	e8 73 0b 00 00       	call   38aa <sbrk>

  // can one sbrk() less than a page?
  a = sbrk(0);
    2d37:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
  oldbrk = sbrk(0);
    2d3e:	89 45 a4             	mov    %eax,-0x5c(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    2d41:	e8 64 0b 00 00       	call   38aa <sbrk>
    2d46:	83 c4 10             	add    $0x10,%esp
    2d49:	89 c3                	mov    %eax,%ebx
    2d4b:	90                   	nop
    2d4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    2d50:	83 ec 0c             	sub    $0xc,%esp
    2d53:	6a 01                	push   $0x1
    2d55:	e8 50 0b 00 00       	call   38aa <sbrk>
    if(b != a){
    2d5a:	83 c4 10             	add    $0x10,%esp
    2d5d:	39 d8                	cmp    %ebx,%eax
    2d5f:	0f 85 85 02 00 00    	jne    2fea <sbrktest+0x2da>
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    2d65:	83 c7 01             	add    $0x1,%edi
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
      exit();
    }
    *b = 1;
    2d68:	c6 03 01             	movb   $0x1,(%ebx)
    a = b + 1;
    2d6b:	83 c3 01             	add    $0x1,%ebx
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    2d6e:	81 ff 88 13 00 00    	cmp    $0x1388,%edi
    2d74:	75 da                	jne    2d50 <sbrktest+0x40>
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    2d76:	e8 9f 0a 00 00       	call   381a <fork>
  if(pid < 0){
    2d7b:	85 c0                	test   %eax,%eax
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    2d7d:	89 c7                	mov    %eax,%edi
  if(pid < 0){
    2d7f:	0f 88 93 03 00 00    	js     3118 <sbrktest+0x408>
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    2d85:	83 ec 0c             	sub    $0xc,%esp
  c = sbrk(1);
  if(c != a + 1){
    2d88:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    2d8b:	6a 01                	push   $0x1
    2d8d:	e8 18 0b 00 00       	call   38aa <sbrk>
  c = sbrk(1);
    2d92:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d99:	e8 0c 0b 00 00       	call   38aa <sbrk>
  if(c != a + 1){
    2d9e:	83 c4 10             	add    $0x10,%esp
    2da1:	39 d8                	cmp    %ebx,%eax
    2da3:	0f 85 57 03 00 00    	jne    3100 <sbrktest+0x3f0>
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    2da9:	85 ff                	test   %edi,%edi
    2dab:	0f 84 4a 03 00 00    	je     30fb <sbrktest+0x3eb>
    exit();
  wait();
    2db1:	e8 74 0a 00 00       	call   382a <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    2db6:	83 ec 0c             	sub    $0xc,%esp
    2db9:	6a 00                	push   $0x0
    2dbb:	e8 ea 0a 00 00       	call   38aa <sbrk>
    2dc0:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
    2dc2:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2dc7:	29 d8                	sub    %ebx,%eax
    2dc9:	89 04 24             	mov    %eax,(%esp)
    2dcc:	e8 d9 0a 00 00       	call   38aa <sbrk>
  if (p != a) {
    2dd1:	83 c4 10             	add    $0x10,%esp
    2dd4:	39 c3                	cmp    %eax,%ebx
    2dd6:	0f 85 07 03 00 00    	jne    30e3 <sbrktest+0x3d3>
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    2ddc:	83 ec 0c             	sub    $0xc,%esp
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    exit();
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;
    2ddf:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff

  // can one de-allocate?
  a = sbrk(0);
    2de6:	6a 00                	push   $0x0
    2de8:	e8 bd 0a 00 00       	call   38aa <sbrk>
  c = sbrk(-4096);
    2ded:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    2df4:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    2df6:	e8 af 0a 00 00       	call   38aa <sbrk>
  if(c == (char*)0xffffffff){
    2dfb:	83 c4 10             	add    $0x10,%esp
    2dfe:	83 f8 ff             	cmp    $0xffffffff,%eax
    2e01:	0f 84 c4 02 00 00    	je     30cb <sbrktest+0x3bb>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
    2e07:	83 ec 0c             	sub    $0xc,%esp
    2e0a:	6a 00                	push   $0x0
    2e0c:	e8 99 0a 00 00       	call   38aa <sbrk>
  if(c != a - 4096){
    2e11:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    2e17:	83 c4 10             	add    $0x10,%esp
    2e1a:	39 d0                	cmp    %edx,%eax
    2e1c:	0f 85 92 02 00 00    	jne    30b4 <sbrktest+0x3a4>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
    2e22:	83 ec 0c             	sub    $0xc,%esp
    2e25:	6a 00                	push   $0x0
    2e27:	e8 7e 0a 00 00       	call   38aa <sbrk>
    2e2c:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    2e2e:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2e35:	e8 70 0a 00 00       	call   38aa <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2e3a:	83 c4 10             	add    $0x10,%esp
    2e3d:	39 c3                	cmp    %eax,%ebx
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
    2e3f:	89 c7                	mov    %eax,%edi
  if(c != a || sbrk(0) != a + 4096){
    2e41:	0f 85 56 02 00 00    	jne    309d <sbrktest+0x38d>
    2e47:	83 ec 0c             	sub    $0xc,%esp
    2e4a:	6a 00                	push   $0x0
    2e4c:	e8 59 0a 00 00       	call   38aa <sbrk>
    2e51:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    2e57:	83 c4 10             	add    $0x10,%esp
    2e5a:	39 d0                	cmp    %edx,%eax
    2e5c:	0f 85 3b 02 00 00    	jne    309d <sbrktest+0x38d>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    2e62:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2e69:	0f 84 16 02 00 00    	je     3085 <sbrktest+0x375>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    2e6f:	83 ec 0c             	sub    $0xc,%esp
    2e72:	6a 00                	push   $0x0
    2e74:	e8 31 0a 00 00       	call   38aa <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    2e79:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    2e80:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    2e82:	e8 23 0a 00 00       	call   38aa <sbrk>
    2e87:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
    2e8a:	29 c1                	sub    %eax,%ecx
    2e8c:	89 0c 24             	mov    %ecx,(%esp)
    2e8f:	e8 16 0a 00 00       	call   38aa <sbrk>
  if(c != a){
    2e94:	83 c4 10             	add    $0x10,%esp
    2e97:	39 c3                	cmp    %eax,%ebx
    2e99:	0f 85 cf 01 00 00    	jne    306e <sbrktest+0x35e>
    2e9f:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    2ea4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    2ea8:	e8 f5 09 00 00       	call   38a2 <getpid>
    2ead:	89 c7                	mov    %eax,%edi
    pid = fork();
    2eaf:	e8 66 09 00 00       	call   381a <fork>
    if(pid < 0){
    2eb4:	85 c0                	test   %eax,%eax
    2eb6:	0f 88 9a 01 00 00    	js     3056 <sbrktest+0x346>
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
    2ebc:	0f 84 72 01 00 00    	je     3034 <sbrktest+0x324>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2ec2:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
      kill(ppid);
      exit();
    }
    wait();
    2ec8:	e8 5d 09 00 00       	call   382a <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2ecd:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    2ed3:	75 d3                	jne    2ea8 <sbrktest+0x198>
    wait();
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    2ed5:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2ed8:	83 ec 0c             	sub    $0xc,%esp
    2edb:	50                   	push   %eax
    2edc:	e8 51 09 00 00       	call   3832 <pipe>
    2ee1:	83 c4 10             	add    $0x10,%esp
    2ee4:	85 c0                	test   %eax,%eax
    2ee6:	0f 85 34 01 00 00    	jne    3020 <sbrktest+0x310>
    2eec:	8d 5d c0             	lea    -0x40(%ebp),%ebx
    2eef:	8d 7d e8             	lea    -0x18(%ebp),%edi
    2ef2:	89 de                	mov    %ebx,%esi
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
    2ef4:	e8 21 09 00 00       	call   381a <fork>
    2ef9:	85 c0                	test   %eax,%eax
    2efb:	89 06                	mov    %eax,(%esi)
    2efd:	0f 84 a1 00 00 00    	je     2fa4 <sbrktest+0x294>
      sbrk(BIG - (uint)sbrk(0));
      write(fds[1], "x", 1);
      // sit around until killed
      for(;;) sleep(1000);
    }
    if(pids[i] != -1)
    2f03:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f06:	74 14                	je     2f1c <sbrktest+0x20c>
      read(fds[0], &scratch, 1);
    2f08:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2f0b:	83 ec 04             	sub    $0x4,%esp
    2f0e:	6a 01                	push   $0x1
    2f10:	50                   	push   %eax
    2f11:	ff 75 b8             	pushl  -0x48(%ebp)
    2f14:	e8 21 09 00 00       	call   383a <read>
    2f19:	83 c4 10             	add    $0x10,%esp
    2f1c:	83 c6 04             	add    $0x4,%esi
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2f1f:	39 f7                	cmp    %esi,%edi
    2f21:	75 d1                	jne    2ef4 <sbrktest+0x1e4>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    2f23:	83 ec 0c             	sub    $0xc,%esp
    2f26:	68 00 10 00 00       	push   $0x1000
    2f2b:	e8 7a 09 00 00       	call   38aa <sbrk>
    2f30:	83 c4 10             	add    $0x10,%esp
    2f33:	89 c6                	mov    %eax,%esi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if(pids[i] == -1)
    2f35:	8b 03                	mov    (%ebx),%eax
    2f37:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f3a:	74 11                	je     2f4d <sbrktest+0x23d>
      continue;
    kill(pids[i]);
    2f3c:	83 ec 0c             	sub    $0xc,%esp
    2f3f:	50                   	push   %eax
    2f40:	e8 0d 09 00 00       	call   3852 <kill>
    wait();
    2f45:	e8 e0 08 00 00       	call   382a <wait>
    2f4a:	83 c4 10             	add    $0x10,%esp
    2f4d:	83 c3 04             	add    $0x4,%ebx
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2f50:	39 fb                	cmp    %edi,%ebx
    2f52:	75 e1                	jne    2f35 <sbrktest+0x225>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    2f54:	83 fe ff             	cmp    $0xffffffff,%esi
    2f57:	0f 84 ab 00 00 00    	je     3008 <sbrktest+0x2f8>
    printf(stdout, "failed sbrk leaked memory\n");
    exit();
  }

  if(sbrk(0) > oldbrk)
    2f5d:	83 ec 0c             	sub    $0xc,%esp
    2f60:	6a 00                	push   $0x0
    2f62:	e8 43 09 00 00       	call   38aa <sbrk>
    2f67:	83 c4 10             	add    $0x10,%esp
    2f6a:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    2f6d:	73 1a                	jae    2f89 <sbrktest+0x279>
    sbrk(-(sbrk(0) - oldbrk));
    2f6f:	83 ec 0c             	sub    $0xc,%esp
    2f72:	6a 00                	push   $0x0
    2f74:	e8 31 09 00 00       	call   38aa <sbrk>
    2f79:	8b 75 a4             	mov    -0x5c(%ebp),%esi
    2f7c:	29 c6                	sub    %eax,%esi
    2f7e:	89 34 24             	mov    %esi,(%esp)
    2f81:	e8 24 09 00 00       	call   38aa <sbrk>
    2f86:	83 c4 10             	add    $0x10,%esp

  printf(stdout, "sbrk test OK\n");
    2f89:	83 ec 08             	sub    $0x8,%esp
    2f8c:	68 38 4b 00 00       	push   $0x4b38
    2f91:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    2f97:	e8 e4 09 00 00       	call   3980 <printf>
}
    2f9c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2f9f:	5b                   	pop    %ebx
    2fa0:	5e                   	pop    %esi
    2fa1:	5f                   	pop    %edi
    2fa2:	5d                   	pop    %ebp
    2fa3:	c3                   	ret    
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    2fa4:	83 ec 0c             	sub    $0xc,%esp
    2fa7:	6a 00                	push   $0x0
    2fa9:	e8 fc 08 00 00       	call   38aa <sbrk>
    2fae:	ba 00 00 40 06       	mov    $0x6400000,%edx
    2fb3:	29 c2                	sub    %eax,%edx
    2fb5:	89 14 24             	mov    %edx,(%esp)
    2fb8:	e8 ed 08 00 00       	call   38aa <sbrk>
      write(fds[1], "x", 1);
    2fbd:	83 c4 0c             	add    $0xc,%esp
    2fc0:	6a 01                	push   $0x1
    2fc2:	68 f9 45 00 00       	push   $0x45f9
    2fc7:	ff 75 bc             	pushl  -0x44(%ebp)
    2fca:	e8 73 08 00 00       	call   3842 <write>
    2fcf:	83 c4 10             	add    $0x10,%esp
    2fd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      // sit around until killed
      for(;;) sleep(1000);
    2fd8:	83 ec 0c             	sub    $0xc,%esp
    2fdb:	68 e8 03 00 00       	push   $0x3e8
    2fe0:	e8 cd 08 00 00       	call   38b2 <sleep>
    2fe5:	83 c4 10             	add    $0x10,%esp
    2fe8:	eb ee                	jmp    2fd8 <sbrktest+0x2c8>
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    2fea:	83 ec 0c             	sub    $0xc,%esp
    2fed:	50                   	push   %eax
    2fee:	53                   	push   %ebx
    2fef:	57                   	push   %edi
    2ff0:	68 9b 4a 00 00       	push   $0x4a9b
    2ff5:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    2ffb:	e8 80 09 00 00       	call   3980 <printf>
      exit();
    3000:	83 c4 20             	add    $0x20,%esp
    3003:	e8 1a 08 00 00       	call   3822 <exit>
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    printf(stdout, "failed sbrk leaked memory\n");
    3008:	83 ec 08             	sub    $0x8,%esp
    300b:	68 1d 4b 00 00       	push   $0x4b1d
    3010:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    3016:	e8 65 09 00 00       	call   3980 <printf>
    exit();
    301b:	e8 02 08 00 00       	call   3822 <exit>
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    3020:	83 ec 08             	sub    $0x8,%esp
    3023:	68 d9 3f 00 00       	push   $0x3fd9
    3028:	6a 01                	push   $0x1
    302a:	e8 51 09 00 00       	call   3980 <printf>
    exit();
    302f:	e8 ee 07 00 00       	call   3822 <exit>
    if(pid < 0){
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
    3034:	0f be 03             	movsbl (%ebx),%eax
    3037:	50                   	push   %eax
    3038:	53                   	push   %ebx
    3039:	68 04 4b 00 00       	push   $0x4b04
    303e:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    3044:	e8 37 09 00 00       	call   3980 <printf>
      kill(ppid);
    3049:	89 3c 24             	mov    %edi,(%esp)
    304c:	e8 01 08 00 00       	call   3852 <kill>
      exit();
    3051:	e8 cc 07 00 00       	call   3822 <exit>
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    pid = fork();
    if(pid < 0){
      printf(stdout, "fork failed\n");
    3056:	83 ec 08             	sub    $0x8,%esp
    3059:	68 e1 4b 00 00       	push   $0x4be1
    305e:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    3064:	e8 17 09 00 00       	call   3980 <printf>
      exit();
    3069:	e8 b4 07 00 00       	call   3822 <exit>
  }

  a = sbrk(0);
  c = sbrk(-(sbrk(0) - oldbrk));
  if(c != a){
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    306e:	50                   	push   %eax
    306f:	53                   	push   %ebx
    3070:	68 c0 52 00 00       	push   $0x52c0
    3075:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    307b:	e8 00 09 00 00       	call   3980 <printf>
    exit();
    3080:	e8 9d 07 00 00       	call   3822 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    3085:	83 ec 08             	sub    $0x8,%esp
    3088:	68 90 52 00 00       	push   $0x5290
    308d:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    3093:	e8 e8 08 00 00       	call   3980 <printf>
    exit();
    3098:	e8 85 07 00 00       	call   3822 <exit>

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
  if(c != a || sbrk(0) != a + 4096){
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    309d:	57                   	push   %edi
    309e:	53                   	push   %ebx
    309f:	68 68 52 00 00       	push   $0x5268
    30a4:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    30aa:	e8 d1 08 00 00       	call   3980 <printf>
    exit();
    30af:	e8 6e 07 00 00       	call   3822 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
  if(c != a - 4096){
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    30b4:	50                   	push   %eax
    30b5:	53                   	push   %ebx
    30b6:	68 30 52 00 00       	push   $0x5230
    30bb:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    30c1:	e8 ba 08 00 00       	call   3980 <printf>
    exit();
    30c6:	e8 57 07 00 00       	call   3822 <exit>

  // can one de-allocate?
  a = sbrk(0);
  c = sbrk(-4096);
  if(c == (char*)0xffffffff){
    printf(stdout, "sbrk could not deallocate\n");
    30cb:	83 ec 08             	sub    $0x8,%esp
    30ce:	68 e9 4a 00 00       	push   $0x4ae9
    30d3:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    30d9:	e8 a2 08 00 00       	call   3980 <printf>
    exit();
    30de:	e8 3f 07 00 00       	call   3822 <exit>
#define BIG (100*1024*1024)
  a = sbrk(0);
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    30e3:	83 ec 08             	sub    $0x8,%esp
    30e6:	68 f0 51 00 00       	push   $0x51f0
    30eb:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    30f1:	e8 8a 08 00 00       	call   3980 <printf>
    exit();
    30f6:	e8 27 07 00 00       	call   3822 <exit>
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    exit();
    30fb:	e8 22 07 00 00       	call   3822 <exit>
    exit();
  }
  c = sbrk(1);
  c = sbrk(1);
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    3100:	83 ec 08             	sub    $0x8,%esp
    3103:	68 cd 4a 00 00       	push   $0x4acd
    3108:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    310e:	e8 6d 08 00 00       	call   3980 <printf>
    exit();
    3113:	e8 0a 07 00 00       	call   3822 <exit>
    *b = 1;
    a = b + 1;
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    3118:	83 ec 08             	sub    $0x8,%esp
    311b:	68 b6 4a 00 00       	push   $0x4ab6
    3120:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    3126:	e8 55 08 00 00       	call   3980 <printf>
    exit();
    312b:	e8 f2 06 00 00       	call   3822 <exit>

00003130 <validateint>:
  printf(stdout, "sbrk test OK\n");
}

void
validateint(int *p)
{
    3130:	55                   	push   %ebp
    3131:	89 e5                	mov    %esp,%ebp
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    3133:	5d                   	pop    %ebp
    3134:	c3                   	ret    
    3135:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003140 <validatetest>:

void
validatetest(void)
{
    3140:	55                   	push   %ebp
    3141:	89 e5                	mov    %esp,%ebp
    3143:	56                   	push   %esi
    3144:	53                   	push   %ebx
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    3145:	31 db                	xor    %ebx,%ebx
validatetest(void)
{
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    3147:	83 ec 08             	sub    $0x8,%esp
    314a:	68 46 4b 00 00       	push   $0x4b46
    314f:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    3155:	e8 26 08 00 00       	call   3980 <printf>
    315a:	83 c4 10             	add    $0x10,%esp
    315d:	8d 76 00             	lea    0x0(%esi),%esi
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
    3160:	e8 b5 06 00 00       	call   381a <fork>
    3165:	85 c0                	test   %eax,%eax
    3167:	89 c6                	mov    %eax,%esi
    3169:	74 63                	je     31ce <validatetest+0x8e>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    }
    sleep(0);
    316b:	83 ec 0c             	sub    $0xc,%esp
    316e:	6a 00                	push   $0x0
    3170:	e8 3d 07 00 00       	call   38b2 <sleep>
    sleep(0);
    3175:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    317c:	e8 31 07 00 00       	call   38b2 <sleep>
    kill(pid);
    3181:	89 34 24             	mov    %esi,(%esp)
    3184:	e8 c9 06 00 00       	call   3852 <kill>
    wait();
    3189:	e8 9c 06 00 00       	call   382a <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    318e:	58                   	pop    %eax
    318f:	5a                   	pop    %edx
    3190:	53                   	push   %ebx
    3191:	68 55 4b 00 00       	push   $0x4b55
    3196:	e8 e7 06 00 00       	call   3882 <link>
    319b:	83 c4 10             	add    $0x10,%esp
    319e:	83 f8 ff             	cmp    $0xffffffff,%eax
    31a1:	75 30                	jne    31d3 <validatetest+0x93>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    31a3:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    31a9:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    31af:	75 af                	jne    3160 <validatetest+0x20>
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    31b1:	83 ec 08             	sub    $0x8,%esp
    31b4:	68 79 4b 00 00       	push   $0x4b79
    31b9:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    31bf:	e8 bc 07 00 00       	call   3980 <printf>
}
    31c4:	83 c4 10             	add    $0x10,%esp
    31c7:	8d 65 f8             	lea    -0x8(%ebp),%esp
    31ca:	5b                   	pop    %ebx
    31cb:	5e                   	pop    %esi
    31cc:	5d                   	pop    %ebp
    31cd:	c3                   	ret    

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    31ce:	e8 4f 06 00 00       	call   3822 <exit>
    kill(pid);
    wait();

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
      printf(stdout, "link should not succeed\n");
    31d3:	83 ec 08             	sub    $0x8,%esp
    31d6:	68 60 4b 00 00       	push   $0x4b60
    31db:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    31e1:	e8 9a 07 00 00       	call   3980 <printf>
      exit();
    31e6:	e8 37 06 00 00       	call   3822 <exit>
    31eb:	90                   	nop
    31ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000031f0 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    31f0:	55                   	push   %ebp
    31f1:	89 e5                	mov    %esp,%ebp
    31f3:	83 ec 10             	sub    $0x10,%esp
  int i;

  printf(stdout, "bss test\n");
    31f6:	68 86 4b 00 00       	push   $0x4b86
    31fb:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    3201:	e8 7a 07 00 00       	call   3980 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
    3206:	83 c4 10             	add    $0x10,%esp
    3209:	80 3d a0 5d 00 00 00 	cmpb   $0x0,0x5da0
    3210:	75 35                	jne    3247 <bsstest+0x57>
    3212:	b8 a1 5d 00 00       	mov    $0x5da1,%eax
    3217:	89 f6                	mov    %esi,%esi
    3219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3220:	80 38 00             	cmpb   $0x0,(%eax)
    3223:	75 22                	jne    3247 <bsstest+0x57>
    3225:	83 c0 01             	add    $0x1,%eax
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    3228:	3d b0 84 00 00       	cmp    $0x84b0,%eax
    322d:	75 f1                	jne    3220 <bsstest+0x30>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    322f:	83 ec 08             	sub    $0x8,%esp
    3232:	68 a1 4b 00 00       	push   $0x4ba1
    3237:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    323d:	e8 3e 07 00 00       	call   3980 <printf>
}
    3242:	83 c4 10             	add    $0x10,%esp
    3245:	c9                   	leave  
    3246:	c3                   	ret    
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
    3247:	83 ec 08             	sub    $0x8,%esp
    324a:	68 90 4b 00 00       	push   $0x4b90
    324f:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    3255:	e8 26 07 00 00       	call   3980 <printf>
      exit();
    325a:	e8 c3 05 00 00       	call   3822 <exit>
    325f:	90                   	nop

00003260 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    3260:	55                   	push   %ebp
    3261:	89 e5                	mov    %esp,%ebp
    3263:	83 ec 14             	sub    $0x14,%esp
  int pid, fd;

  unlink("bigarg-ok");
    3266:	68 ae 4b 00 00       	push   $0x4bae
    326b:	e8 02 06 00 00       	call   3872 <unlink>
  pid = fork();
    3270:	e8 a5 05 00 00       	call   381a <fork>
  if(pid == 0){
    3275:	83 c4 10             	add    $0x10,%esp
    3278:	85 c0                	test   %eax,%eax
    327a:	74 3f                	je     32bb <bigargtest+0x5b>
    exec("echo", args);
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    327c:	0f 88 c2 00 00 00    	js     3344 <bigargtest+0xe4>
    printf(stdout, "bigargtest: fork failed\n");
    exit();
  }
  wait();
    3282:	e8 a3 05 00 00       	call   382a <wait>
  fd = open("bigarg-ok", 0);
    3287:	83 ec 08             	sub    $0x8,%esp
    328a:	6a 00                	push   $0x0
    328c:	68 ae 4b 00 00       	push   $0x4bae
    3291:	e8 cc 05 00 00       	call   3862 <open>
  if(fd < 0){
    3296:	83 c4 10             	add    $0x10,%esp
    3299:	85 c0                	test   %eax,%eax
    329b:	0f 88 8c 00 00 00    	js     332d <bigargtest+0xcd>
    printf(stdout, "bigarg test failed!\n");
    exit();
  }
  close(fd);
    32a1:	83 ec 0c             	sub    $0xc,%esp
    32a4:	50                   	push   %eax
    32a5:	e8 a0 05 00 00       	call   384a <close>
  unlink("bigarg-ok");
    32aa:	c7 04 24 ae 4b 00 00 	movl   $0x4bae,(%esp)
    32b1:	e8 bc 05 00 00       	call   3872 <unlink>
}
    32b6:	83 c4 10             	add    $0x10,%esp
    32b9:	c9                   	leave  
    32ba:	c3                   	ret    
    32bb:	b8 00 5d 00 00       	mov    $0x5d00,%eax
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    32c0:	c7 00 e4 52 00 00    	movl   $0x52e4,(%eax)
    32c6:	83 c0 04             	add    $0x4,%eax
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    32c9:	3d 7c 5d 00 00       	cmp    $0x5d7c,%eax
    32ce:	75 f0                	jne    32c0 <bigargtest+0x60>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    printf(stdout, "bigarg test\n");
    32d0:	51                   	push   %ecx
    32d1:	51                   	push   %ecx
    32d2:	68 b8 4b 00 00       	push   $0x4bb8
    32d7:	ff 35 e8 5c 00 00    	pushl  0x5ce8
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    32dd:	c7 05 7c 5d 00 00 00 	movl   $0x0,0x5d7c
    32e4:	00 00 00 
    printf(stdout, "bigarg test\n");
    32e7:	e8 94 06 00 00       	call   3980 <printf>
    exec("echo", args);
    32ec:	58                   	pop    %eax
    32ed:	5a                   	pop    %edx
    32ee:	68 00 5d 00 00       	push   $0x5d00
    32f3:	68 85 3d 00 00       	push   $0x3d85
    32f8:	e8 5d 05 00 00       	call   385a <exec>
    printf(stdout, "bigarg test ok\n");
    32fd:	59                   	pop    %ecx
    32fe:	58                   	pop    %eax
    32ff:	68 c5 4b 00 00       	push   $0x4bc5
    3304:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    330a:	e8 71 06 00 00       	call   3980 <printf>
    fd = open("bigarg-ok", O_CREATE);
    330f:	58                   	pop    %eax
    3310:	5a                   	pop    %edx
    3311:	68 00 02 00 00       	push   $0x200
    3316:	68 ae 4b 00 00       	push   $0x4bae
    331b:	e8 42 05 00 00       	call   3862 <open>
    close(fd);
    3320:	89 04 24             	mov    %eax,(%esp)
    3323:	e8 22 05 00 00       	call   384a <close>
    exit();
    3328:	e8 f5 04 00 00       	call   3822 <exit>
    exit();
  }
  wait();
  fd = open("bigarg-ok", 0);
  if(fd < 0){
    printf(stdout, "bigarg test failed!\n");
    332d:	50                   	push   %eax
    332e:	50                   	push   %eax
    332f:	68 ee 4b 00 00       	push   $0x4bee
    3334:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    333a:	e8 41 06 00 00       	call   3980 <printf>
    exit();
    333f:	e8 de 04 00 00       	call   3822 <exit>
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    printf(stdout, "bigargtest: fork failed\n");
    3344:	52                   	push   %edx
    3345:	52                   	push   %edx
    3346:	68 d5 4b 00 00       	push   $0x4bd5
    334b:	ff 35 e8 5c 00 00    	pushl  0x5ce8
    3351:	e8 2a 06 00 00       	call   3980 <printf>
    exit();
    3356:	e8 c7 04 00 00       	call   3822 <exit>
    335b:	90                   	nop
    335c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003360 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3360:	55                   	push   %ebp
    3361:	89 e5                	mov    %esp,%ebp
    3363:	57                   	push   %edi
    3364:	56                   	push   %esi
    3365:	53                   	push   %ebx
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3366:	31 db                	xor    %ebx,%ebx

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3368:	83 ec 54             	sub    $0x54,%esp
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");
    336b:	68 03 4c 00 00       	push   $0x4c03
    3370:	6a 01                	push   $0x1
    3372:	e8 09 06 00 00       	call   3980 <printf>
    3377:	83 c4 10             	add    $0x10,%esp
    337a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3380:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    3385:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    3387:	89 d9                	mov    %ebx,%ecx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3389:	f7 eb                	imul   %ebx
    338b:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    338e:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    3390:	83 ec 04             	sub    $0x4,%esp

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    3393:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    3397:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    339b:	c1 fa 06             	sar    $0x6,%edx
    339e:	29 f2                	sub    %esi,%edx
    33a0:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    33a3:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    33a9:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    33ac:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    33b1:	29 d1                	sub    %edx,%ecx
    33b3:	f7 e9                	imul   %ecx
    33b5:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    33b8:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    33bd:	c1 fa 05             	sar    $0x5,%edx
    33c0:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    33c2:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    33c7:	83 c2 30             	add    $0x30,%edx
    33ca:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    33cd:	f7 eb                	imul   %ebx
    33cf:	c1 fa 05             	sar    $0x5,%edx
    33d2:	29 f2                	sub    %esi,%edx
    33d4:	6b d2 64             	imul   $0x64,%edx,%edx
    33d7:	29 d7                	sub    %edx,%edi
    33d9:	89 f8                	mov    %edi,%eax
    33db:	c1 ff 1f             	sar    $0x1f,%edi
    33de:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    33e0:	89 d8                	mov    %ebx,%eax
  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    33e2:	c1 fa 02             	sar    $0x2,%edx
    33e5:	29 fa                	sub    %edi,%edx
    33e7:	83 c2 30             	add    $0x30,%edx
    33ea:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    33ed:	f7 e9                	imul   %ecx
    33ef:	89 d9                	mov    %ebx,%ecx
    33f1:	c1 fa 02             	sar    $0x2,%edx
    33f4:	29 f2                	sub    %esi,%edx
    33f6:	8d 04 92             	lea    (%edx,%edx,4),%eax
    33f9:	01 c0                	add    %eax,%eax
    33fb:	29 c1                	sub    %eax,%ecx
    33fd:	89 c8                	mov    %ecx,%eax
    33ff:	83 c0 30             	add    $0x30,%eax
    3402:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    3405:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3408:	50                   	push   %eax
    3409:	68 10 4c 00 00       	push   $0x4c10
    340e:	6a 01                	push   $0x1
    3410:	e8 6b 05 00 00       	call   3980 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    3415:	58                   	pop    %eax
    3416:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3419:	5a                   	pop    %edx
    341a:	68 02 02 00 00       	push   $0x202
    341f:	50                   	push   %eax
    3420:	e8 3d 04 00 00       	call   3862 <open>
    if(fd < 0){
    3425:	83 c4 10             	add    $0x10,%esp
    3428:	85 c0                	test   %eax,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    342a:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    342c:	78 50                	js     347e <fsfull+0x11e>
    342e:	31 f6                	xor    %esi,%esi
    3430:	eb 08                	jmp    343a <fsfull+0xda>
    3432:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
      total += cc;
    3438:	01 c6                	add    %eax,%esi
      printf(1, "open %s failed\n", name);
      break;
    }
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
    343a:	83 ec 04             	sub    $0x4,%esp
    343d:	68 00 02 00 00       	push   $0x200
    3442:	68 c0 84 00 00       	push   $0x84c0
    3447:	57                   	push   %edi
    3448:	e8 f5 03 00 00       	call   3842 <write>
      if(cc < 512)
    344d:	83 c4 10             	add    $0x10,%esp
    3450:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    3455:	7f e1                	jg     3438 <fsfull+0xd8>
        break;
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    3457:	83 ec 04             	sub    $0x4,%esp
    345a:	56                   	push   %esi
    345b:	68 2c 4c 00 00       	push   $0x4c2c
    3460:	6a 01                	push   $0x1
    3462:	e8 19 05 00 00       	call   3980 <printf>
    close(fd);
    3467:	89 3c 24             	mov    %edi,(%esp)
    346a:	e8 db 03 00 00       	call   384a <close>
    if(total == 0)
    346f:	83 c4 10             	add    $0x10,%esp
    3472:	85 f6                	test   %esi,%esi
    3474:	74 22                	je     3498 <fsfull+0x138>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3476:	83 c3 01             	add    $0x1,%ebx
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    3479:	e9 02 ff ff ff       	jmp    3380 <fsfull+0x20>
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    if(fd < 0){
      printf(1, "open %s failed\n", name);
    347e:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3481:	83 ec 04             	sub    $0x4,%esp
    3484:	50                   	push   %eax
    3485:	68 1c 4c 00 00       	push   $0x4c1c
    348a:	6a 01                	push   $0x1
    348c:	e8 ef 04 00 00       	call   3980 <printf>
      break;
    3491:	83 c4 10             	add    $0x10,%esp
    3494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3498:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    349d:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    349f:	89 d9                	mov    %ebx,%ecx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    34a1:	f7 eb                	imul   %ebx
    34a3:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    34a6:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    unlink(name);
    34a8:	83 ec 0c             	sub    $0xc,%esp
      break;
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    34ab:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    34af:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    34b3:	c1 fa 06             	sar    $0x6,%edx
    34b6:	29 f2                	sub    %esi,%edx
    34b8:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    34bb:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    34c1:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    34c4:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    34c9:	29 d1                	sub    %edx,%ecx
    34cb:	f7 e9                	imul   %ecx
    34cd:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    34d0:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    34d5:	c1 fa 05             	sar    $0x5,%edx
    34d8:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    34da:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    34df:	83 c2 30             	add    $0x30,%edx
    34e2:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    34e5:	f7 eb                	imul   %ebx
    34e7:	c1 fa 05             	sar    $0x5,%edx
    34ea:	29 f2                	sub    %esi,%edx
    34ec:	6b d2 64             	imul   $0x64,%edx,%edx
    34ef:	29 d7                	sub    %edx,%edi
    34f1:	89 f8                	mov    %edi,%eax
    34f3:	c1 ff 1f             	sar    $0x1f,%edi
    34f6:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    34f8:	89 d8                	mov    %ebx,%eax
  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    34fa:	c1 fa 02             	sar    $0x2,%edx
    34fd:	29 fa                	sub    %edi,%edx
    34ff:	83 c2 30             	add    $0x30,%edx
    3502:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    3505:	f7 e9                	imul   %ecx
    3507:	89 d9                	mov    %ebx,%ecx
    name[5] = '\0';
    unlink(name);
    nfiles--;
    3509:	83 eb 01             	sub    $0x1,%ebx
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    350c:	c1 fa 02             	sar    $0x2,%edx
    350f:	29 f2                	sub    %esi,%edx
    3511:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3514:	01 c0                	add    %eax,%eax
    3516:	29 c1                	sub    %eax,%ecx
    3518:	89 c8                	mov    %ecx,%eax
    351a:	83 c0 30             	add    $0x30,%eax
    351d:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    unlink(name);
    3520:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3523:	50                   	push   %eax
    3524:	e8 49 03 00 00       	call   3872 <unlink>
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    3529:	83 c4 10             	add    $0x10,%esp
    352c:	83 fb ff             	cmp    $0xffffffff,%ebx
    352f:	0f 85 63 ff ff ff    	jne    3498 <fsfull+0x138>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    3535:	83 ec 08             	sub    $0x8,%esp
    3538:	68 3c 4c 00 00       	push   $0x4c3c
    353d:	6a 01                	push   $0x1
    353f:	e8 3c 04 00 00       	call   3980 <printf>
}
    3544:	83 c4 10             	add    $0x10,%esp
    3547:	8d 65 f4             	lea    -0xc(%ebp),%esp
    354a:	5b                   	pop    %ebx
    354b:	5e                   	pop    %esi
    354c:	5f                   	pop    %edi
    354d:	5d                   	pop    %ebp
    354e:	c3                   	ret    
    354f:	90                   	nop

00003550 <uio>:

void
uio()
{
    3550:	55                   	push   %ebp
    3551:	89 e5                	mov    %esp,%ebp
    3553:	83 ec 10             	sub    $0x10,%esp

  ushort port = 0;
  uchar val = 0;
  int pid;

  printf(1, "uio test\n");
    3556:	68 52 4c 00 00       	push   $0x4c52
    355b:	6a 01                	push   $0x1
    355d:	e8 1e 04 00 00       	call   3980 <printf>
  pid = fork();
    3562:	e8 b3 02 00 00       	call   381a <fork>
  if(pid == 0){
    3567:	83 c4 10             	add    $0x10,%esp
    356a:	85 c0                	test   %eax,%eax
    356c:	74 1b                	je     3589 <uio+0x39>
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    printf(1, "uio: uio succeeded; test FAILED\n");
    exit();
  } else if(pid < 0){
    356e:	78 3d                	js     35ad <uio+0x5d>
    printf (1, "fork failed\n");
    exit();
  }
  wait();
    3570:	e8 b5 02 00 00       	call   382a <wait>
  printf(1, "uio test done\n");
    3575:	83 ec 08             	sub    $0x8,%esp
    3578:	68 5c 4c 00 00       	push   $0x4c5c
    357d:	6a 01                	push   $0x1
    357f:	e8 fc 03 00 00       	call   3980 <printf>
}
    3584:	83 c4 10             	add    $0x10,%esp
    3587:	c9                   	leave  
    3588:	c3                   	ret    
  pid = fork();
  if(pid == 0){
    port = RTC_ADDR;
    val = 0x09;  /* year */
    /* http://wiki.osdev.org/Inline_Assembly/Examples */
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    3589:	ba 70 00 00 00       	mov    $0x70,%edx
    358e:	b8 09 00 00 00       	mov    $0x9,%eax
    3593:	ee                   	out    %al,(%dx)
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    3594:	ba 71 00 00 00       	mov    $0x71,%edx
    3599:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    359a:	52                   	push   %edx
    359b:	52                   	push   %edx
    359c:	68 c4 53 00 00       	push   $0x53c4
    35a1:	6a 01                	push   $0x1
    35a3:	e8 d8 03 00 00       	call   3980 <printf>
    exit();
    35a8:	e8 75 02 00 00       	call   3822 <exit>
  } else if(pid < 0){
    printf (1, "fork failed\n");
    35ad:	50                   	push   %eax
    35ae:	50                   	push   %eax
    35af:	68 e1 4b 00 00       	push   $0x4be1
    35b4:	6a 01                	push   $0x1
    35b6:	e8 c5 03 00 00       	call   3980 <printf>
    exit();
    35bb:	e8 62 02 00 00       	call   3822 <exit>

000035c0 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    35c0:	69 05 e4 5c 00 00 0d 	imul   $0x19660d,0x5ce4,%eax
    35c7:	66 19 00 
}

unsigned long randstate = 1;
unsigned int
rand()
{
    35ca:	55                   	push   %ebp
    35cb:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
  return randstate;
}
    35cd:	5d                   	pop    %ebp

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    35ce:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    35d3:	a3 e4 5c 00 00       	mov    %eax,0x5ce4
  return randstate;
}
    35d8:	c3                   	ret    
    35d9:	66 90                	xchg   %ax,%ax
    35db:	66 90                	xchg   %ax,%ax
    35dd:	66 90                	xchg   %ax,%ax
    35df:	90                   	nop

000035e0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    35e0:	55                   	push   %ebp
    35e1:	89 e5                	mov    %esp,%ebp
    35e3:	53                   	push   %ebx
    35e4:	8b 45 08             	mov    0x8(%ebp),%eax
    35e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    35ea:	89 c2                	mov    %eax,%edx
    35ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    35f0:	83 c1 01             	add    $0x1,%ecx
    35f3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    35f7:	83 c2 01             	add    $0x1,%edx
    35fa:	84 db                	test   %bl,%bl
    35fc:	88 5a ff             	mov    %bl,-0x1(%edx)
    35ff:	75 ef                	jne    35f0 <strcpy+0x10>
    ;
  return os;
}
    3601:	5b                   	pop    %ebx
    3602:	5d                   	pop    %ebp
    3603:	c3                   	ret    
    3604:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    360a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00003610 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3610:	55                   	push   %ebp
    3611:	89 e5                	mov    %esp,%ebp
    3613:	56                   	push   %esi
    3614:	53                   	push   %ebx
    3615:	8b 55 08             	mov    0x8(%ebp),%edx
    3618:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    361b:	0f b6 02             	movzbl (%edx),%eax
    361e:	0f b6 19             	movzbl (%ecx),%ebx
    3621:	84 c0                	test   %al,%al
    3623:	75 1e                	jne    3643 <strcmp+0x33>
    3625:	eb 29                	jmp    3650 <strcmp+0x40>
    3627:	89 f6                	mov    %esi,%esi
    3629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    3630:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3633:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    3636:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3639:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    363d:	84 c0                	test   %al,%al
    363f:	74 0f                	je     3650 <strcmp+0x40>
    3641:	89 f1                	mov    %esi,%ecx
    3643:	38 d8                	cmp    %bl,%al
    3645:	74 e9                	je     3630 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3647:	29 d8                	sub    %ebx,%eax
}
    3649:	5b                   	pop    %ebx
    364a:	5e                   	pop    %esi
    364b:	5d                   	pop    %ebp
    364c:	c3                   	ret    
    364d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3650:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3652:	29 d8                	sub    %ebx,%eax
}
    3654:	5b                   	pop    %ebx
    3655:	5e                   	pop    %esi
    3656:	5d                   	pop    %ebp
    3657:	c3                   	ret    
    3658:	90                   	nop
    3659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003660 <strlen>:

uint
strlen(char *s)
{
    3660:	55                   	push   %ebp
    3661:	89 e5                	mov    %esp,%ebp
    3663:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    3666:	80 39 00             	cmpb   $0x0,(%ecx)
    3669:	74 12                	je     367d <strlen+0x1d>
    366b:	31 d2                	xor    %edx,%edx
    366d:	8d 76 00             	lea    0x0(%esi),%esi
    3670:	83 c2 01             	add    $0x1,%edx
    3673:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    3677:	89 d0                	mov    %edx,%eax
    3679:	75 f5                	jne    3670 <strlen+0x10>
    ;
  return n;
}
    367b:	5d                   	pop    %ebp
    367c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    367d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    367f:	5d                   	pop    %ebp
    3680:	c3                   	ret    
    3681:	eb 0d                	jmp    3690 <memset>
    3683:	90                   	nop
    3684:	90                   	nop
    3685:	90                   	nop
    3686:	90                   	nop
    3687:	90                   	nop
    3688:	90                   	nop
    3689:	90                   	nop
    368a:	90                   	nop
    368b:	90                   	nop
    368c:	90                   	nop
    368d:	90                   	nop
    368e:	90                   	nop
    368f:	90                   	nop

00003690 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3690:	55                   	push   %ebp
    3691:	89 e5                	mov    %esp,%ebp
    3693:	57                   	push   %edi
    3694:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    3697:	8b 4d 10             	mov    0x10(%ebp),%ecx
    369a:	8b 45 0c             	mov    0xc(%ebp),%eax
    369d:	89 d7                	mov    %edx,%edi
    369f:	fc                   	cld    
    36a0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    36a2:	89 d0                	mov    %edx,%eax
    36a4:	5f                   	pop    %edi
    36a5:	5d                   	pop    %ebp
    36a6:	c3                   	ret    
    36a7:	89 f6                	mov    %esi,%esi
    36a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000036b0 <strchr>:

char*
strchr(const char *s, char c)
{
    36b0:	55                   	push   %ebp
    36b1:	89 e5                	mov    %esp,%ebp
    36b3:	53                   	push   %ebx
    36b4:	8b 45 08             	mov    0x8(%ebp),%eax
    36b7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    36ba:	0f b6 10             	movzbl (%eax),%edx
    36bd:	84 d2                	test   %dl,%dl
    36bf:	74 1d                	je     36de <strchr+0x2e>
    if(*s == c)
    36c1:	38 d3                	cmp    %dl,%bl
    36c3:	89 d9                	mov    %ebx,%ecx
    36c5:	75 0d                	jne    36d4 <strchr+0x24>
    36c7:	eb 17                	jmp    36e0 <strchr+0x30>
    36c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    36d0:	38 ca                	cmp    %cl,%dl
    36d2:	74 0c                	je     36e0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    36d4:	83 c0 01             	add    $0x1,%eax
    36d7:	0f b6 10             	movzbl (%eax),%edx
    36da:	84 d2                	test   %dl,%dl
    36dc:	75 f2                	jne    36d0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    36de:	31 c0                	xor    %eax,%eax
}
    36e0:	5b                   	pop    %ebx
    36e1:	5d                   	pop    %ebp
    36e2:	c3                   	ret    
    36e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    36e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000036f0 <gets>:

char*
gets(char *buf, int max)
{
    36f0:	55                   	push   %ebp
    36f1:	89 e5                	mov    %esp,%ebp
    36f3:	57                   	push   %edi
    36f4:	56                   	push   %esi
    36f5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    36f6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    36f8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    36fb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    36fe:	eb 29                	jmp    3729 <gets+0x39>
    cc = read(0, &c, 1);
    3700:	83 ec 04             	sub    $0x4,%esp
    3703:	6a 01                	push   $0x1
    3705:	57                   	push   %edi
    3706:	6a 00                	push   $0x0
    3708:	e8 2d 01 00 00       	call   383a <read>
    if(cc < 1)
    370d:	83 c4 10             	add    $0x10,%esp
    3710:	85 c0                	test   %eax,%eax
    3712:	7e 1d                	jle    3731 <gets+0x41>
      break;
    buf[i++] = c;
    3714:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    3718:	8b 55 08             	mov    0x8(%ebp),%edx
    371b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    371d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    371f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    3723:	74 1b                	je     3740 <gets+0x50>
    3725:	3c 0d                	cmp    $0xd,%al
    3727:	74 17                	je     3740 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3729:	8d 5e 01             	lea    0x1(%esi),%ebx
    372c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    372f:	7c cf                	jl     3700 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3731:	8b 45 08             	mov    0x8(%ebp),%eax
    3734:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    3738:	8d 65 f4             	lea    -0xc(%ebp),%esp
    373b:	5b                   	pop    %ebx
    373c:	5e                   	pop    %esi
    373d:	5f                   	pop    %edi
    373e:	5d                   	pop    %ebp
    373f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3740:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3743:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3745:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    3749:	8d 65 f4             	lea    -0xc(%ebp),%esp
    374c:	5b                   	pop    %ebx
    374d:	5e                   	pop    %esi
    374e:	5f                   	pop    %edi
    374f:	5d                   	pop    %ebp
    3750:	c3                   	ret    
    3751:	eb 0d                	jmp    3760 <stat>
    3753:	90                   	nop
    3754:	90                   	nop
    3755:	90                   	nop
    3756:	90                   	nop
    3757:	90                   	nop
    3758:	90                   	nop
    3759:	90                   	nop
    375a:	90                   	nop
    375b:	90                   	nop
    375c:	90                   	nop
    375d:	90                   	nop
    375e:	90                   	nop
    375f:	90                   	nop

00003760 <stat>:

int
stat(char *n, struct stat *st)
{
    3760:	55                   	push   %ebp
    3761:	89 e5                	mov    %esp,%ebp
    3763:	56                   	push   %esi
    3764:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3765:	83 ec 08             	sub    $0x8,%esp
    3768:	6a 00                	push   $0x0
    376a:	ff 75 08             	pushl  0x8(%ebp)
    376d:	e8 f0 00 00 00       	call   3862 <open>
  if(fd < 0)
    3772:	83 c4 10             	add    $0x10,%esp
    3775:	85 c0                	test   %eax,%eax
    3777:	78 27                	js     37a0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    3779:	83 ec 08             	sub    $0x8,%esp
    377c:	ff 75 0c             	pushl  0xc(%ebp)
    377f:	89 c3                	mov    %eax,%ebx
    3781:	50                   	push   %eax
    3782:	e8 f3 00 00 00       	call   387a <fstat>
    3787:	89 c6                	mov    %eax,%esi
  close(fd);
    3789:	89 1c 24             	mov    %ebx,(%esp)
    378c:	e8 b9 00 00 00       	call   384a <close>
  return r;
    3791:	83 c4 10             	add    $0x10,%esp
    3794:	89 f0                	mov    %esi,%eax
}
    3796:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3799:	5b                   	pop    %ebx
    379a:	5e                   	pop    %esi
    379b:	5d                   	pop    %ebp
    379c:	c3                   	ret    
    379d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    37a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    37a5:	eb ef                	jmp    3796 <stat+0x36>
    37a7:	89 f6                	mov    %esi,%esi
    37a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000037b0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    37b0:	55                   	push   %ebp
    37b1:	89 e5                	mov    %esp,%ebp
    37b3:	53                   	push   %ebx
    37b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    37b7:	0f be 11             	movsbl (%ecx),%edx
    37ba:	8d 42 d0             	lea    -0x30(%edx),%eax
    37bd:	3c 09                	cmp    $0x9,%al
    37bf:	b8 00 00 00 00       	mov    $0x0,%eax
    37c4:	77 1f                	ja     37e5 <atoi+0x35>
    37c6:	8d 76 00             	lea    0x0(%esi),%esi
    37c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    37d0:	8d 04 80             	lea    (%eax,%eax,4),%eax
    37d3:	83 c1 01             	add    $0x1,%ecx
    37d6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    37da:	0f be 11             	movsbl (%ecx),%edx
    37dd:	8d 5a d0             	lea    -0x30(%edx),%ebx
    37e0:	80 fb 09             	cmp    $0x9,%bl
    37e3:	76 eb                	jbe    37d0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    37e5:	5b                   	pop    %ebx
    37e6:	5d                   	pop    %ebp
    37e7:	c3                   	ret    
    37e8:	90                   	nop
    37e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000037f0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    37f0:	55                   	push   %ebp
    37f1:	89 e5                	mov    %esp,%ebp
    37f3:	56                   	push   %esi
    37f4:	53                   	push   %ebx
    37f5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    37f8:	8b 45 08             	mov    0x8(%ebp),%eax
    37fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    37fe:	85 db                	test   %ebx,%ebx
    3800:	7e 14                	jle    3816 <memmove+0x26>
    3802:	31 d2                	xor    %edx,%edx
    3804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    3808:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    380c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    380f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3812:	39 da                	cmp    %ebx,%edx
    3814:	75 f2                	jne    3808 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    3816:	5b                   	pop    %ebx
    3817:	5e                   	pop    %esi
    3818:	5d                   	pop    %ebp
    3819:	c3                   	ret    

0000381a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    381a:	b8 01 00 00 00       	mov    $0x1,%eax
    381f:	cd 40                	int    $0x40
    3821:	c3                   	ret    

00003822 <exit>:
SYSCALL(exit)
    3822:	b8 02 00 00 00       	mov    $0x2,%eax
    3827:	cd 40                	int    $0x40
    3829:	c3                   	ret    

0000382a <wait>:
SYSCALL(wait)
    382a:	b8 03 00 00 00       	mov    $0x3,%eax
    382f:	cd 40                	int    $0x40
    3831:	c3                   	ret    

00003832 <pipe>:
SYSCALL(pipe)
    3832:	b8 04 00 00 00       	mov    $0x4,%eax
    3837:	cd 40                	int    $0x40
    3839:	c3                   	ret    

0000383a <read>:
SYSCALL(read)
    383a:	b8 05 00 00 00       	mov    $0x5,%eax
    383f:	cd 40                	int    $0x40
    3841:	c3                   	ret    

00003842 <write>:
SYSCALL(write)
    3842:	b8 10 00 00 00       	mov    $0x10,%eax
    3847:	cd 40                	int    $0x40
    3849:	c3                   	ret    

0000384a <close>:
SYSCALL(close)
    384a:	b8 15 00 00 00       	mov    $0x15,%eax
    384f:	cd 40                	int    $0x40
    3851:	c3                   	ret    

00003852 <kill>:
SYSCALL(kill)
    3852:	b8 06 00 00 00       	mov    $0x6,%eax
    3857:	cd 40                	int    $0x40
    3859:	c3                   	ret    

0000385a <exec>:
SYSCALL(exec)
    385a:	b8 07 00 00 00       	mov    $0x7,%eax
    385f:	cd 40                	int    $0x40
    3861:	c3                   	ret    

00003862 <open>:
SYSCALL(open)
    3862:	b8 0f 00 00 00       	mov    $0xf,%eax
    3867:	cd 40                	int    $0x40
    3869:	c3                   	ret    

0000386a <mknod>:
SYSCALL(mknod)
    386a:	b8 11 00 00 00       	mov    $0x11,%eax
    386f:	cd 40                	int    $0x40
    3871:	c3                   	ret    

00003872 <unlink>:
SYSCALL(unlink)
    3872:	b8 12 00 00 00       	mov    $0x12,%eax
    3877:	cd 40                	int    $0x40
    3879:	c3                   	ret    

0000387a <fstat>:
SYSCALL(fstat)
    387a:	b8 08 00 00 00       	mov    $0x8,%eax
    387f:	cd 40                	int    $0x40
    3881:	c3                   	ret    

00003882 <link>:
SYSCALL(link)
    3882:	b8 13 00 00 00       	mov    $0x13,%eax
    3887:	cd 40                	int    $0x40
    3889:	c3                   	ret    

0000388a <mkdir>:
SYSCALL(mkdir)
    388a:	b8 14 00 00 00       	mov    $0x14,%eax
    388f:	cd 40                	int    $0x40
    3891:	c3                   	ret    

00003892 <chdir>:
SYSCALL(chdir)
    3892:	b8 09 00 00 00       	mov    $0x9,%eax
    3897:	cd 40                	int    $0x40
    3899:	c3                   	ret    

0000389a <dup>:
SYSCALL(dup)
    389a:	b8 0a 00 00 00       	mov    $0xa,%eax
    389f:	cd 40                	int    $0x40
    38a1:	c3                   	ret    

000038a2 <getpid>:
SYSCALL(getpid)
    38a2:	b8 0b 00 00 00       	mov    $0xb,%eax
    38a7:	cd 40                	int    $0x40
    38a9:	c3                   	ret    

000038aa <sbrk>:
SYSCALL(sbrk)
    38aa:	b8 0c 00 00 00       	mov    $0xc,%eax
    38af:	cd 40                	int    $0x40
    38b1:	c3                   	ret    

000038b2 <sleep>:
SYSCALL(sleep)
    38b2:	b8 0d 00 00 00       	mov    $0xd,%eax
    38b7:	cd 40                	int    $0x40
    38b9:	c3                   	ret    

000038ba <uptime>:
SYSCALL(uptime)
    38ba:	b8 0e 00 00 00       	mov    $0xe,%eax
    38bf:	cd 40                	int    $0x40
    38c1:	c3                   	ret    

000038c2 <halt>:
SYSCALL(halt)
    38c2:	b8 16 00 00 00       	mov    $0x16,%eax
    38c7:	cd 40                	int    $0x40
    38c9:	c3                   	ret    

000038ca <shmget>:
    38ca:	b8 17 00 00 00       	mov    $0x17,%eax
    38cf:	cd 40                	int    $0x40
    38d1:	c3                   	ret    
    38d2:	66 90                	xchg   %ax,%ax
    38d4:	66 90                	xchg   %ax,%ax
    38d6:	66 90                	xchg   %ax,%ax
    38d8:	66 90                	xchg   %ax,%ax
    38da:	66 90                	xchg   %ax,%ax
    38dc:	66 90                	xchg   %ax,%ax
    38de:	66 90                	xchg   %ax,%ax

000038e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    38e0:	55                   	push   %ebp
    38e1:	89 e5                	mov    %esp,%ebp
    38e3:	57                   	push   %edi
    38e4:	56                   	push   %esi
    38e5:	53                   	push   %ebx
    38e6:	89 c6                	mov    %eax,%esi
    38e8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    38eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    38ee:	85 db                	test   %ebx,%ebx
    38f0:	74 7e                	je     3970 <printint+0x90>
    38f2:	89 d0                	mov    %edx,%eax
    38f4:	c1 e8 1f             	shr    $0x1f,%eax
    38f7:	84 c0                	test   %al,%al
    38f9:	74 75                	je     3970 <printint+0x90>
    neg = 1;
    x = -xx;
    38fb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    38fd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    3904:	f7 d8                	neg    %eax
    3906:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    3909:	31 ff                	xor    %edi,%edi
    390b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    390e:	89 ce                	mov    %ecx,%esi
    3910:	eb 08                	jmp    391a <printint+0x3a>
    3912:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    3918:	89 cf                	mov    %ecx,%edi
    391a:	31 d2                	xor    %edx,%edx
    391c:	8d 4f 01             	lea    0x1(%edi),%ecx
    391f:	f7 f6                	div    %esi
    3921:	0f b6 92 1c 54 00 00 	movzbl 0x541c(%edx),%edx
  }while((x /= base) != 0);
    3928:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    392a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    392d:	75 e9                	jne    3918 <printint+0x38>
  if(neg)
    392f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3932:	8b 75 c0             	mov    -0x40(%ebp),%esi
    3935:	85 c0                	test   %eax,%eax
    3937:	74 08                	je     3941 <printint+0x61>
    buf[i++] = '-';
    3939:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    393e:	8d 4f 02             	lea    0x2(%edi),%ecx
    3941:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    3945:	8d 76 00             	lea    0x0(%esi),%esi
    3948:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    394b:	83 ec 04             	sub    $0x4,%esp
    394e:	83 ef 01             	sub    $0x1,%edi
    3951:	6a 01                	push   $0x1
    3953:	53                   	push   %ebx
    3954:	56                   	push   %esi
    3955:	88 45 d7             	mov    %al,-0x29(%ebp)
    3958:	e8 e5 fe ff ff       	call   3842 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    395d:	83 c4 10             	add    $0x10,%esp
    3960:	39 df                	cmp    %ebx,%edi
    3962:	75 e4                	jne    3948 <printint+0x68>
    putc(fd, buf[i]);
}
    3964:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3967:	5b                   	pop    %ebx
    3968:	5e                   	pop    %esi
    3969:	5f                   	pop    %edi
    396a:	5d                   	pop    %ebp
    396b:	c3                   	ret    
    396c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    3970:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3972:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    3979:	eb 8b                	jmp    3906 <printint+0x26>
    397b:	90                   	nop
    397c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003980 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3980:	55                   	push   %ebp
    3981:	89 e5                	mov    %esp,%ebp
    3983:	57                   	push   %edi
    3984:	56                   	push   %esi
    3985:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3986:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3989:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    398c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    398f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3992:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3995:	0f b6 1e             	movzbl (%esi),%ebx
    3998:	83 c6 01             	add    $0x1,%esi
    399b:	84 db                	test   %bl,%bl
    399d:	0f 84 b0 00 00 00    	je     3a53 <printf+0xd3>
    39a3:	31 d2                	xor    %edx,%edx
    39a5:	eb 39                	jmp    39e0 <printf+0x60>
    39a7:	89 f6                	mov    %esi,%esi
    39a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    39b0:	83 f8 25             	cmp    $0x25,%eax
    39b3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    39b6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    39bb:	74 18                	je     39d5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    39bd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    39c0:	83 ec 04             	sub    $0x4,%esp
    39c3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    39c6:	6a 01                	push   $0x1
    39c8:	50                   	push   %eax
    39c9:	57                   	push   %edi
    39ca:	e8 73 fe ff ff       	call   3842 <write>
    39cf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    39d2:	83 c4 10             	add    $0x10,%esp
    39d5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    39d8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    39dc:	84 db                	test   %bl,%bl
    39de:	74 73                	je     3a53 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    39e0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    39e2:	0f be cb             	movsbl %bl,%ecx
    39e5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    39e8:	74 c6                	je     39b0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    39ea:	83 fa 25             	cmp    $0x25,%edx
    39ed:	75 e6                	jne    39d5 <printf+0x55>
      if(c == 'd'){
    39ef:	83 f8 64             	cmp    $0x64,%eax
    39f2:	0f 84 f8 00 00 00    	je     3af0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    39f8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    39fe:	83 f9 70             	cmp    $0x70,%ecx
    3a01:	74 5d                	je     3a60 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3a03:	83 f8 73             	cmp    $0x73,%eax
    3a06:	0f 84 84 00 00 00    	je     3a90 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3a0c:	83 f8 63             	cmp    $0x63,%eax
    3a0f:	0f 84 ea 00 00 00    	je     3aff <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3a15:	83 f8 25             	cmp    $0x25,%eax
    3a18:	0f 84 c2 00 00 00    	je     3ae0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3a1e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    3a21:	83 ec 04             	sub    $0x4,%esp
    3a24:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    3a28:	6a 01                	push   $0x1
    3a2a:	50                   	push   %eax
    3a2b:	57                   	push   %edi
    3a2c:	e8 11 fe ff ff       	call   3842 <write>
    3a31:	83 c4 0c             	add    $0xc,%esp
    3a34:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    3a37:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    3a3a:	6a 01                	push   $0x1
    3a3c:	50                   	push   %eax
    3a3d:	57                   	push   %edi
    3a3e:	83 c6 01             	add    $0x1,%esi
    3a41:	e8 fc fd ff ff       	call   3842 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a46:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3a4a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3a4d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a4f:	84 db                	test   %bl,%bl
    3a51:	75 8d                	jne    39e0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    3a53:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3a56:	5b                   	pop    %ebx
    3a57:	5e                   	pop    %esi
    3a58:	5f                   	pop    %edi
    3a59:	5d                   	pop    %ebp
    3a5a:	c3                   	ret    
    3a5b:	90                   	nop
    3a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    3a60:	83 ec 0c             	sub    $0xc,%esp
    3a63:	b9 10 00 00 00       	mov    $0x10,%ecx
    3a68:	6a 00                	push   $0x0
    3a6a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    3a6d:	89 f8                	mov    %edi,%eax
    3a6f:	8b 13                	mov    (%ebx),%edx
    3a71:	e8 6a fe ff ff       	call   38e0 <printint>
        ap++;
    3a76:	89 d8                	mov    %ebx,%eax
    3a78:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3a7b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    3a7d:	83 c0 04             	add    $0x4,%eax
    3a80:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3a83:	e9 4d ff ff ff       	jmp    39d5 <printf+0x55>
    3a88:	90                   	nop
    3a89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    3a90:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3a93:	8b 18                	mov    (%eax),%ebx
        ap++;
    3a95:	83 c0 04             	add    $0x4,%eax
    3a98:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    3a9b:	b8 14 54 00 00       	mov    $0x5414,%eax
    3aa0:	85 db                	test   %ebx,%ebx
    3aa2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    3aa5:	0f b6 03             	movzbl (%ebx),%eax
    3aa8:	84 c0                	test   %al,%al
    3aaa:	74 23                	je     3acf <printf+0x14f>
    3aac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3ab0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3ab3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    3ab6:	83 ec 04             	sub    $0x4,%esp
    3ab9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    3abb:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3abe:	50                   	push   %eax
    3abf:	57                   	push   %edi
    3ac0:	e8 7d fd ff ff       	call   3842 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3ac5:	0f b6 03             	movzbl (%ebx),%eax
    3ac8:	83 c4 10             	add    $0x10,%esp
    3acb:	84 c0                	test   %al,%al
    3acd:	75 e1                	jne    3ab0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3acf:	31 d2                	xor    %edx,%edx
    3ad1:	e9 ff fe ff ff       	jmp    39d5 <printf+0x55>
    3ad6:	8d 76 00             	lea    0x0(%esi),%esi
    3ad9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3ae0:	83 ec 04             	sub    $0x4,%esp
    3ae3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    3ae6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    3ae9:	6a 01                	push   $0x1
    3aeb:	e9 4c ff ff ff       	jmp    3a3c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    3af0:	83 ec 0c             	sub    $0xc,%esp
    3af3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    3af8:	6a 01                	push   $0x1
    3afa:	e9 6b ff ff ff       	jmp    3a6a <printf+0xea>
    3aff:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b02:	83 ec 04             	sub    $0x4,%esp
    3b05:	8b 03                	mov    (%ebx),%eax
    3b07:	6a 01                	push   $0x1
    3b09:	88 45 e4             	mov    %al,-0x1c(%ebp)
    3b0c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3b0f:	50                   	push   %eax
    3b10:	57                   	push   %edi
    3b11:	e8 2c fd ff ff       	call   3842 <write>
    3b16:	e9 5b ff ff ff       	jmp    3a76 <printf+0xf6>
    3b1b:	66 90                	xchg   %ax,%ax
    3b1d:	66 90                	xchg   %ax,%ax
    3b1f:	90                   	nop

00003b20 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3b20:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3b21:	a1 80 5d 00 00       	mov    0x5d80,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    3b26:	89 e5                	mov    %esp,%ebp
    3b28:	57                   	push   %edi
    3b29:	56                   	push   %esi
    3b2a:	53                   	push   %ebx
    3b2b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3b2e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    3b30:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3b33:	39 c8                	cmp    %ecx,%eax
    3b35:	73 19                	jae    3b50 <free+0x30>
    3b37:	89 f6                	mov    %esi,%esi
    3b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3b40:	39 d1                	cmp    %edx,%ecx
    3b42:	72 1c                	jb     3b60 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3b44:	39 d0                	cmp    %edx,%eax
    3b46:	73 18                	jae    3b60 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    3b48:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3b4a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3b4c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3b4e:	72 f0                	jb     3b40 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3b50:	39 d0                	cmp    %edx,%eax
    3b52:	72 f4                	jb     3b48 <free+0x28>
    3b54:	39 d1                	cmp    %edx,%ecx
    3b56:	73 f0                	jae    3b48 <free+0x28>
    3b58:	90                   	nop
    3b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    3b60:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3b63:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3b66:	39 d7                	cmp    %edx,%edi
    3b68:	74 19                	je     3b83 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    3b6a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3b6d:	8b 50 04             	mov    0x4(%eax),%edx
    3b70:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3b73:	39 f1                	cmp    %esi,%ecx
    3b75:	74 23                	je     3b9a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    3b77:	89 08                	mov    %ecx,(%eax)
  freep = p;
    3b79:	a3 80 5d 00 00       	mov    %eax,0x5d80
}
    3b7e:	5b                   	pop    %ebx
    3b7f:	5e                   	pop    %esi
    3b80:	5f                   	pop    %edi
    3b81:	5d                   	pop    %ebp
    3b82:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    3b83:	03 72 04             	add    0x4(%edx),%esi
    3b86:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    3b89:	8b 10                	mov    (%eax),%edx
    3b8b:	8b 12                	mov    (%edx),%edx
    3b8d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    3b90:	8b 50 04             	mov    0x4(%eax),%edx
    3b93:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3b96:	39 f1                	cmp    %esi,%ecx
    3b98:	75 dd                	jne    3b77 <free+0x57>
    p->s.size += bp->s.size;
    3b9a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    3b9d:	a3 80 5d 00 00       	mov    %eax,0x5d80
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    3ba2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3ba5:	8b 53 f8             	mov    -0x8(%ebx),%edx
    3ba8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    3baa:	5b                   	pop    %ebx
    3bab:	5e                   	pop    %esi
    3bac:	5f                   	pop    %edi
    3bad:	5d                   	pop    %ebp
    3bae:	c3                   	ret    
    3baf:	90                   	nop

00003bb0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3bb0:	55                   	push   %ebp
    3bb1:	89 e5                	mov    %esp,%ebp
    3bb3:	57                   	push   %edi
    3bb4:	56                   	push   %esi
    3bb5:	53                   	push   %ebx
    3bb6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3bb9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    3bbc:	8b 15 80 5d 00 00    	mov    0x5d80,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3bc2:	8d 78 07             	lea    0x7(%eax),%edi
    3bc5:	c1 ef 03             	shr    $0x3,%edi
    3bc8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    3bcb:	85 d2                	test   %edx,%edx
    3bcd:	0f 84 a3 00 00 00    	je     3c76 <malloc+0xc6>
    3bd3:	8b 02                	mov    (%edx),%eax
    3bd5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    3bd8:	39 cf                	cmp    %ecx,%edi
    3bda:	76 74                	jbe    3c50 <malloc+0xa0>
    3bdc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    3be2:	be 00 10 00 00       	mov    $0x1000,%esi
    3be7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    3bee:	0f 43 f7             	cmovae %edi,%esi
    3bf1:	ba 00 80 00 00       	mov    $0x8000,%edx
    3bf6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    3bfc:	0f 46 da             	cmovbe %edx,%ebx
    3bff:	eb 10                	jmp    3c11 <malloc+0x61>
    3c01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3c08:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    3c0a:	8b 48 04             	mov    0x4(%eax),%ecx
    3c0d:	39 cf                	cmp    %ecx,%edi
    3c0f:	76 3f                	jbe    3c50 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3c11:	39 05 80 5d 00 00    	cmp    %eax,0x5d80
    3c17:	89 c2                	mov    %eax,%edx
    3c19:	75 ed                	jne    3c08 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    3c1b:	83 ec 0c             	sub    $0xc,%esp
    3c1e:	53                   	push   %ebx
    3c1f:	e8 86 fc ff ff       	call   38aa <sbrk>
  if(p == (char*)-1)
    3c24:	83 c4 10             	add    $0x10,%esp
    3c27:	83 f8 ff             	cmp    $0xffffffff,%eax
    3c2a:	74 1c                	je     3c48 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    3c2c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    3c2f:	83 ec 0c             	sub    $0xc,%esp
    3c32:	83 c0 08             	add    $0x8,%eax
    3c35:	50                   	push   %eax
    3c36:	e8 e5 fe ff ff       	call   3b20 <free>
  return freep;
    3c3b:	8b 15 80 5d 00 00    	mov    0x5d80,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    3c41:	83 c4 10             	add    $0x10,%esp
    3c44:	85 d2                	test   %edx,%edx
    3c46:	75 c0                	jne    3c08 <malloc+0x58>
        return 0;
    3c48:	31 c0                	xor    %eax,%eax
    3c4a:	eb 1c                	jmp    3c68 <malloc+0xb8>
    3c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    3c50:	39 cf                	cmp    %ecx,%edi
    3c52:	74 1c                	je     3c70 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    3c54:	29 f9                	sub    %edi,%ecx
    3c56:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    3c59:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    3c5c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    3c5f:	89 15 80 5d 00 00    	mov    %edx,0x5d80
      return (void*)(p + 1);
    3c65:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    3c68:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3c6b:	5b                   	pop    %ebx
    3c6c:	5e                   	pop    %esi
    3c6d:	5f                   	pop    %edi
    3c6e:	5d                   	pop    %ebp
    3c6f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    3c70:	8b 08                	mov    (%eax),%ecx
    3c72:	89 0a                	mov    %ecx,(%edx)
    3c74:	eb e9                	jmp    3c5f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    3c76:	c7 05 80 5d 00 00 84 	movl   $0x5d84,0x5d80
    3c7d:	5d 00 00 
    3c80:	c7 05 84 5d 00 00 84 	movl   $0x5d84,0x5d84
    3c87:	5d 00 00 
    base.s.size = 0;
    3c8a:	b8 84 5d 00 00       	mov    $0x5d84,%eax
    3c8f:	c7 05 88 5d 00 00 00 	movl   $0x0,0x5d88
    3c96:	00 00 00 
    3c99:	e9 3e ff ff ff       	jmp    3bdc <malloc+0x2c>
