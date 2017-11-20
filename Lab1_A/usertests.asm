
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
      11:	68 7b 4c 00 00       	push   $0x4c7b
      16:	6a 01                	push   $0x1
      18:	e8 73 39 00 00       	call   3990 <printf>

  if(open("usertests.ran", 0) >= 0){
      1d:	5a                   	pop    %edx
      1e:	59                   	pop    %ecx
      1f:	6a 00                	push   $0x0
      21:	68 8f 4c 00 00       	push   $0x4c8f
      26:	e8 57 38 00 00       	call   3882 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 14                	js     46 <main+0x46>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      32:	83 ec 08             	sub    $0x8,%esp
      35:	68 f8 53 00 00       	push   $0x53f8
      3a:	6a 01                	push   $0x1
      3c:	e8 4f 39 00 00       	call   3990 <printf>
    exit();
      41:	e8 fc 37 00 00       	call   3842 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      46:	50                   	push   %eax
      47:	50                   	push   %eax
      48:	68 00 02 00 00       	push   $0x200
      4d:	68 8f 4c 00 00       	push   $0x4c8f
      52:	e8 2b 38 00 00       	call   3882 <open>
      57:	89 04 24             	mov    %eax,(%esp)
      5a:	e8 0b 38 00 00       	call   386a <close>

  createdelete();
      5f:	e8 8c 11 00 00       	call   11f0 <createdelete>
  linkunlink();
      64:	e8 47 1a 00 00       	call   1ab0 <linkunlink>
  concreate();
      69:	e8 32 17 00 00       	call   17a0 <concreate>
  fourfiles();
      6e:	e8 8d 0f 00 00       	call   1000 <fourfiles>
  sharedfd();
      73:	e8 c8 0d 00 00       	call   e40 <sharedfd>

  bigargtest();
      78:	e8 03 32 00 00       	call   3280 <bigargtest>
  bigwrite();
      7d:	e8 4e 23 00 00       	call   23d0 <bigwrite>
  bigargtest();
      82:	e8 f9 31 00 00       	call   3280 <bigargtest>
  bsstest();
      87:	e8 74 31 00 00       	call   3200 <bsstest>
  sbrktest();
      8c:	e8 8f 2c 00 00       	call   2d20 <sbrktest>
  validatetest();
      91:	e8 ba 30 00 00       	call   3150 <validatetest>

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
      b9:	e8 b2 0c 00 00       	call   d70 <mem>
  pipe1();
      be:	e8 3d 09 00 00       	call   a00 <pipe1>
  preempt();
      c3:	e8 d8 0a 00 00       	call   ba0 <preempt>
  exitwait();
      c8:	e8 13 0c 00 00       	call   ce0 <exitwait>

  rmdot();
      cd:	e8 ee 26 00 00       	call   27c0 <rmdot>
  fourteen();
      d2:	e8 a9 25 00 00       	call   2680 <fourteen>
  bigfile();
      d7:	e8 d4 23 00 00       	call   24b0 <bigfile>
  subdir();
      dc:	e8 0f 1c 00 00       	call   1cf0 <subdir>
  linktest();
      e1:	e8 aa 14 00 00       	call   1590 <linktest>
  unlinkread();
      e6:	e8 15 13 00 00       	call   1400 <unlinkread>
  dirfile();
      eb:	e8 50 28 00 00       	call   2940 <dirfile>
  iref();
      f0:	e8 4b 2a 00 00       	call   2b40 <iref>
  forktest();
      f5:	e8 66 2b 00 00       	call   2c60 <forktest>
  bigdir(); // slow
      fa:	e8 c1 1a 00 00       	call   1bc0 <bigdir>

  uio();
      ff:	e8 6c 34 00 00       	call   3570 <uio>

  exectest();
     104:	e8 a7 08 00 00       	call   9b0 <exectest>

  exit();
     109:	e8 34 37 00 00       	call   3842 <exit>
     10e:	66 90                	xchg   %ax,%ax

00000110 <iputtest>:
{
     110:	55                   	push   %ebp
     111:	89 e5                	mov    %esp,%ebp
     113:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
     116:	68 44 3d 00 00       	push   $0x3d44
     11b:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     121:	e8 6a 38 00 00       	call   3990 <printf>
  if(mkdir("iputdir") < 0){
     126:	c7 04 24 d7 3c 00 00 	movl   $0x3cd7,(%esp)
     12d:	e8 78 37 00 00       	call   38aa <mkdir>
     132:	83 c4 10             	add    $0x10,%esp
     135:	85 c0                	test   %eax,%eax
     137:	78 58                	js     191 <iputtest+0x81>
  if(chdir("iputdir") < 0){
     139:	83 ec 0c             	sub    $0xc,%esp
     13c:	68 d7 3c 00 00       	push   $0x3cd7
     141:	e8 6c 37 00 00       	call   38b2 <chdir>
     146:	83 c4 10             	add    $0x10,%esp
     149:	85 c0                	test   %eax,%eax
     14b:	0f 88 85 00 00 00    	js     1d6 <iputtest+0xc6>
  if(unlink("../iputdir") < 0){
     151:	83 ec 0c             	sub    $0xc,%esp
     154:	68 d4 3c 00 00       	push   $0x3cd4
     159:	e8 34 37 00 00       	call   3892 <unlink>
     15e:	83 c4 10             	add    $0x10,%esp
     161:	85 c0                	test   %eax,%eax
     163:	78 5a                	js     1bf <iputtest+0xaf>
  if(chdir("/") < 0){
     165:	83 ec 0c             	sub    $0xc,%esp
     168:	68 f9 3c 00 00       	push   $0x3cf9
     16d:	e8 40 37 00 00       	call   38b2 <chdir>
     172:	83 c4 10             	add    $0x10,%esp
     175:	85 c0                	test   %eax,%eax
     177:	78 2f                	js     1a8 <iputtest+0x98>
  printf(stdout, "iput test ok\n");
     179:	83 ec 08             	sub    $0x8,%esp
     17c:	68 7c 3d 00 00       	push   $0x3d7c
     181:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     187:	e8 04 38 00 00       	call   3990 <printf>
}
     18c:	83 c4 10             	add    $0x10,%esp
     18f:	c9                   	leave  
     190:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
     191:	50                   	push   %eax
     192:	50                   	push   %eax
     193:	68 b0 3c 00 00       	push   $0x3cb0
     198:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     19e:	e8 ed 37 00 00       	call   3990 <printf>
    exit();
     1a3:	e8 9a 36 00 00       	call   3842 <exit>
    printf(stdout, "chdir / failed\n");
     1a8:	50                   	push   %eax
     1a9:	50                   	push   %eax
     1aa:	68 fb 3c 00 00       	push   $0x3cfb
     1af:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     1b5:	e8 d6 37 00 00       	call   3990 <printf>
    exit();
     1ba:	e8 83 36 00 00       	call   3842 <exit>
    printf(stdout, "unlink ../iputdir failed\n");
     1bf:	52                   	push   %edx
     1c0:	52                   	push   %edx
     1c1:	68 df 3c 00 00       	push   $0x3cdf
     1c6:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     1cc:	e8 bf 37 00 00       	call   3990 <printf>
    exit();
     1d1:	e8 6c 36 00 00       	call   3842 <exit>
    printf(stdout, "chdir iputdir failed\n");
     1d6:	51                   	push   %ecx
     1d7:	51                   	push   %ecx
     1d8:	68 be 3c 00 00       	push   $0x3cbe
     1dd:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     1e3:	e8 a8 37 00 00       	call   3990 <printf>
    exit();
     1e8:	e8 55 36 00 00       	call   3842 <exit>
     1ed:	8d 76 00             	lea    0x0(%esi),%esi

000001f0 <exitiputtest>:
{
     1f0:	55                   	push   %ebp
     1f1:	89 e5                	mov    %esp,%ebp
     1f3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exitiput test\n");
     1f6:	68 0b 3d 00 00       	push   $0x3d0b
     1fb:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     201:	e8 8a 37 00 00       	call   3990 <printf>
  pid = fork();
     206:	e8 2f 36 00 00       	call   383a <fork>
  if(pid < 0){
     20b:	83 c4 10             	add    $0x10,%esp
     20e:	85 c0                	test   %eax,%eax
     210:	0f 88 82 00 00 00    	js     298 <exitiputtest+0xa8>
  if(pid == 0){
     216:	75 48                	jne    260 <exitiputtest+0x70>
    if(mkdir("iputdir") < 0){
     218:	83 ec 0c             	sub    $0xc,%esp
     21b:	68 d7 3c 00 00       	push   $0x3cd7
     220:	e8 85 36 00 00       	call   38aa <mkdir>
     225:	83 c4 10             	add    $0x10,%esp
     228:	85 c0                	test   %eax,%eax
     22a:	0f 88 96 00 00 00    	js     2c6 <exitiputtest+0xd6>
    if(chdir("iputdir") < 0){
     230:	83 ec 0c             	sub    $0xc,%esp
     233:	68 d7 3c 00 00       	push   $0x3cd7
     238:	e8 75 36 00 00       	call   38b2 <chdir>
     23d:	83 c4 10             	add    $0x10,%esp
     240:	85 c0                	test   %eax,%eax
     242:	78 6b                	js     2af <exitiputtest+0xbf>
    if(unlink("../iputdir") < 0){
     244:	83 ec 0c             	sub    $0xc,%esp
     247:	68 d4 3c 00 00       	push   $0x3cd4
     24c:	e8 41 36 00 00       	call   3892 <unlink>
     251:	83 c4 10             	add    $0x10,%esp
     254:	85 c0                	test   %eax,%eax
     256:	78 28                	js     280 <exitiputtest+0x90>
    exit();
     258:	e8 e5 35 00 00       	call   3842 <exit>
     25d:	8d 76 00             	lea    0x0(%esi),%esi
  wait();
     260:	e8 e5 35 00 00       	call   384a <wait>
  printf(stdout, "exitiput test ok\n");
     265:	83 ec 08             	sub    $0x8,%esp
     268:	68 2e 3d 00 00       	push   $0x3d2e
     26d:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     273:	e8 18 37 00 00       	call   3990 <printf>
}
     278:	83 c4 10             	add    $0x10,%esp
     27b:	c9                   	leave  
     27c:	c3                   	ret    
     27d:	8d 76 00             	lea    0x0(%esi),%esi
      printf(stdout, "unlink ../iputdir failed\n");
     280:	83 ec 08             	sub    $0x8,%esp
     283:	68 df 3c 00 00       	push   $0x3cdf
     288:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     28e:	e8 fd 36 00 00       	call   3990 <printf>
      exit();
     293:	e8 aa 35 00 00       	call   3842 <exit>
    printf(stdout, "fork failed\n");
     298:	51                   	push   %ecx
     299:	51                   	push   %ecx
     29a:	68 f1 4b 00 00       	push   $0x4bf1
     29f:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     2a5:	e8 e6 36 00 00       	call   3990 <printf>
    exit();
     2aa:	e8 93 35 00 00       	call   3842 <exit>
      printf(stdout, "child chdir failed\n");
     2af:	50                   	push   %eax
     2b0:	50                   	push   %eax
     2b1:	68 1a 3d 00 00       	push   $0x3d1a
     2b6:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     2bc:	e8 cf 36 00 00       	call   3990 <printf>
      exit();
     2c1:	e8 7c 35 00 00       	call   3842 <exit>
      printf(stdout, "mkdir failed\n");
     2c6:	52                   	push   %edx
     2c7:	52                   	push   %edx
     2c8:	68 b0 3c 00 00       	push   $0x3cb0
     2cd:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     2d3:	e8 b8 36 00 00       	call   3990 <printf>
      exit();
     2d8:	e8 65 35 00 00       	call   3842 <exit>
     2dd:	8d 76 00             	lea    0x0(%esi),%esi

000002e0 <openiputtest>:
{
     2e0:	55                   	push   %ebp
     2e1:	89 e5                	mov    %esp,%ebp
     2e3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "openiput test\n");
     2e6:	68 40 3d 00 00       	push   $0x3d40
     2eb:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     2f1:	e8 9a 36 00 00       	call   3990 <printf>
  if(mkdir("oidir") < 0){
     2f6:	c7 04 24 4f 3d 00 00 	movl   $0x3d4f,(%esp)
     2fd:	e8 a8 35 00 00       	call   38aa <mkdir>
     302:	83 c4 10             	add    $0x10,%esp
     305:	85 c0                	test   %eax,%eax
     307:	0f 88 88 00 00 00    	js     395 <openiputtest+0xb5>
  pid = fork();
     30d:	e8 28 35 00 00       	call   383a <fork>
  if(pid < 0){
     312:	85 c0                	test   %eax,%eax
     314:	0f 88 92 00 00 00    	js     3ac <openiputtest+0xcc>
  if(pid == 0){
     31a:	75 34                	jne    350 <openiputtest+0x70>
    int fd = open("oidir", O_RDWR);
     31c:	83 ec 08             	sub    $0x8,%esp
     31f:	6a 02                	push   $0x2
     321:	68 4f 3d 00 00       	push   $0x3d4f
     326:	e8 57 35 00 00       	call   3882 <open>
    if(fd >= 0){
     32b:	83 c4 10             	add    $0x10,%esp
     32e:	85 c0                	test   %eax,%eax
     330:	78 5e                	js     390 <openiputtest+0xb0>
      printf(stdout, "open directory for write succeeded\n");
     332:	83 ec 08             	sub    $0x8,%esp
     335:	68 b0 4c 00 00       	push   $0x4cb0
     33a:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     340:	e8 4b 36 00 00       	call   3990 <printf>
      exit();
     345:	e8 f8 34 00 00       	call   3842 <exit>
     34a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  sleep(1);
     350:	83 ec 0c             	sub    $0xc,%esp
     353:	6a 01                	push   $0x1
     355:	e8 78 35 00 00       	call   38d2 <sleep>
  if(unlink("oidir") != 0){
     35a:	c7 04 24 4f 3d 00 00 	movl   $0x3d4f,(%esp)
     361:	e8 2c 35 00 00       	call   3892 <unlink>
     366:	83 c4 10             	add    $0x10,%esp
     369:	85 c0                	test   %eax,%eax
     36b:	75 56                	jne    3c3 <openiputtest+0xe3>
  wait();
     36d:	e8 d8 34 00 00       	call   384a <wait>
  printf(stdout, "openiput test ok\n");
     372:	83 ec 08             	sub    $0x8,%esp
     375:	68 78 3d 00 00       	push   $0x3d78
     37a:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     380:	e8 0b 36 00 00       	call   3990 <printf>
     385:	83 c4 10             	add    $0x10,%esp
}
     388:	c9                   	leave  
     389:	c3                   	ret    
     38a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    exit();
     390:	e8 ad 34 00 00       	call   3842 <exit>
    printf(stdout, "mkdir oidir failed\n");
     395:	51                   	push   %ecx
     396:	51                   	push   %ecx
     397:	68 55 3d 00 00       	push   $0x3d55
     39c:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     3a2:	e8 e9 35 00 00       	call   3990 <printf>
    exit();
     3a7:	e8 96 34 00 00       	call   3842 <exit>
    printf(stdout, "fork failed\n");
     3ac:	52                   	push   %edx
     3ad:	52                   	push   %edx
     3ae:	68 f1 4b 00 00       	push   $0x4bf1
     3b3:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     3b9:	e8 d2 35 00 00       	call   3990 <printf>
    exit();
     3be:	e8 7f 34 00 00       	call   3842 <exit>
    printf(stdout, "unlink failed\n");
     3c3:	50                   	push   %eax
     3c4:	50                   	push   %eax
     3c5:	68 69 3d 00 00       	push   $0x3d69
     3ca:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     3d0:	e8 bb 35 00 00       	call   3990 <printf>
    exit();
     3d5:	e8 68 34 00 00       	call   3842 <exit>
     3da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003e0 <opentest>:
{
     3e0:	55                   	push   %ebp
     3e1:	89 e5                	mov    %esp,%ebp
     3e3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "open test\n");
     3e6:	68 8a 3d 00 00       	push   $0x3d8a
     3eb:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     3f1:	e8 9a 35 00 00       	call   3990 <printf>
  fd = open("echo", 0);
     3f6:	58                   	pop    %eax
     3f7:	5a                   	pop    %edx
     3f8:	6a 00                	push   $0x0
     3fa:	68 95 3d 00 00       	push   $0x3d95
     3ff:	e8 7e 34 00 00       	call   3882 <open>
  if(fd < 0){
     404:	83 c4 10             	add    $0x10,%esp
     407:	85 c0                	test   %eax,%eax
     409:	78 36                	js     441 <opentest+0x61>
  close(fd);
     40b:	83 ec 0c             	sub    $0xc,%esp
     40e:	50                   	push   %eax
     40f:	e8 56 34 00 00       	call   386a <close>
  fd = open("doesnotexist", 0);
     414:	5a                   	pop    %edx
     415:	59                   	pop    %ecx
     416:	6a 00                	push   $0x0
     418:	68 ad 3d 00 00       	push   $0x3dad
     41d:	e8 60 34 00 00       	call   3882 <open>
  if(fd >= 0){
     422:	83 c4 10             	add    $0x10,%esp
     425:	85 c0                	test   %eax,%eax
     427:	79 2f                	jns    458 <opentest+0x78>
  printf(stdout, "open test ok\n");
     429:	83 ec 08             	sub    $0x8,%esp
     42c:	68 d8 3d 00 00       	push   $0x3dd8
     431:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     437:	e8 54 35 00 00       	call   3990 <printf>
}
     43c:	83 c4 10             	add    $0x10,%esp
     43f:	c9                   	leave  
     440:	c3                   	ret    
    printf(stdout, "open echo failed!\n");
     441:	50                   	push   %eax
     442:	50                   	push   %eax
     443:	68 9a 3d 00 00       	push   $0x3d9a
     448:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     44e:	e8 3d 35 00 00       	call   3990 <printf>
    exit();
     453:	e8 ea 33 00 00       	call   3842 <exit>
    printf(stdout, "open doesnotexist succeeded!\n");
     458:	50                   	push   %eax
     459:	50                   	push   %eax
     45a:	68 ba 3d 00 00       	push   $0x3dba
     45f:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     465:	e8 26 35 00 00       	call   3990 <printf>
    exit();
     46a:	e8 d3 33 00 00       	call   3842 <exit>
     46f:	90                   	nop

00000470 <writetest>:
{
     470:	55                   	push   %ebp
     471:	89 e5                	mov    %esp,%ebp
     473:	56                   	push   %esi
     474:	53                   	push   %ebx
  printf(stdout, "small file test\n");
     475:	83 ec 08             	sub    $0x8,%esp
     478:	68 e6 3d 00 00       	push   $0x3de6
     47d:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     483:	e8 08 35 00 00       	call   3990 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     488:	59                   	pop    %ecx
     489:	5b                   	pop    %ebx
     48a:	68 02 02 00 00       	push   $0x202
     48f:	68 f7 3d 00 00       	push   $0x3df7
     494:	e8 e9 33 00 00       	call   3882 <open>
  if(fd >= 0){
     499:	83 c4 10             	add    $0x10,%esp
     49c:	85 c0                	test   %eax,%eax
     49e:	0f 88 8b 01 00 00    	js     62f <writetest+0x1bf>
    printf(stdout, "creat small succeeded; ok\n");
     4a4:	83 ec 08             	sub    $0x8,%esp
     4a7:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 100; i++){
     4a9:	31 db                	xor    %ebx,%ebx
    printf(stdout, "creat small succeeded; ok\n");
     4ab:	68 fd 3d 00 00       	push   $0x3dfd
     4b0:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     4b6:	e8 d5 34 00 00       	call   3990 <printf>
     4bb:	83 c4 10             	add    $0x10,%esp
     4be:	66 90                	xchg   %ax,%ax
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     4c0:	83 ec 04             	sub    $0x4,%esp
     4c3:	6a 0a                	push   $0xa
     4c5:	68 34 3e 00 00       	push   $0x3e34
     4ca:	56                   	push   %esi
     4cb:	e8 92 33 00 00       	call   3862 <write>
     4d0:	83 c4 10             	add    $0x10,%esp
     4d3:	83 f8 0a             	cmp    $0xa,%eax
     4d6:	0f 85 d9 00 00 00    	jne    5b5 <writetest+0x145>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     4dc:	83 ec 04             	sub    $0x4,%esp
     4df:	6a 0a                	push   $0xa
     4e1:	68 3f 3e 00 00       	push   $0x3e3f
     4e6:	56                   	push   %esi
     4e7:	e8 76 33 00 00       	call   3862 <write>
     4ec:	83 c4 10             	add    $0x10,%esp
     4ef:	83 f8 0a             	cmp    $0xa,%eax
     4f2:	0f 85 d6 00 00 00    	jne    5ce <writetest+0x15e>
  for(i = 0; i < 100; i++){
     4f8:	83 c3 01             	add    $0x1,%ebx
     4fb:	83 fb 64             	cmp    $0x64,%ebx
     4fe:	75 c0                	jne    4c0 <writetest+0x50>
  printf(stdout, "writes ok\n");
     500:	83 ec 08             	sub    $0x8,%esp
     503:	68 4a 3e 00 00       	push   $0x3e4a
     508:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     50e:	e8 7d 34 00 00       	call   3990 <printf>
  close(fd);
     513:	89 34 24             	mov    %esi,(%esp)
     516:	e8 4f 33 00 00       	call   386a <close>
  fd = open("small", O_RDONLY);
     51b:	58                   	pop    %eax
     51c:	5a                   	pop    %edx
     51d:	6a 00                	push   $0x0
     51f:	68 f7 3d 00 00       	push   $0x3df7
     524:	e8 59 33 00 00       	call   3882 <open>
  if(fd >= 0){
     529:	83 c4 10             	add    $0x10,%esp
     52c:	85 c0                	test   %eax,%eax
  fd = open("small", O_RDONLY);
     52e:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     530:	0f 88 b1 00 00 00    	js     5e7 <writetest+0x177>
    printf(stdout, "open small succeeded ok\n");
     536:	83 ec 08             	sub    $0x8,%esp
     539:	68 55 3e 00 00       	push   $0x3e55
     53e:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     544:	e8 47 34 00 00       	call   3990 <printf>
  i = read(fd, buf, 2000);
     549:	83 c4 0c             	add    $0xc,%esp
     54c:	68 d0 07 00 00       	push   $0x7d0
     551:	68 e0 84 00 00       	push   $0x84e0
     556:	53                   	push   %ebx
     557:	e8 fe 32 00 00       	call   385a <read>
  if(i == 2000){
     55c:	83 c4 10             	add    $0x10,%esp
     55f:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     564:	0f 85 95 00 00 00    	jne    5ff <writetest+0x18f>
    printf(stdout, "read succeeded ok\n");
     56a:	83 ec 08             	sub    $0x8,%esp
     56d:	68 89 3e 00 00       	push   $0x3e89
     572:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     578:	e8 13 34 00 00       	call   3990 <printf>
  close(fd);
     57d:	89 1c 24             	mov    %ebx,(%esp)
     580:	e8 e5 32 00 00       	call   386a <close>
  if(unlink("small") < 0){
     585:	c7 04 24 f7 3d 00 00 	movl   $0x3df7,(%esp)
     58c:	e8 01 33 00 00       	call   3892 <unlink>
     591:	83 c4 10             	add    $0x10,%esp
     594:	85 c0                	test   %eax,%eax
     596:	78 7f                	js     617 <writetest+0x1a7>
  printf(stdout, "small file test ok\n");
     598:	83 ec 08             	sub    $0x8,%esp
     59b:	68 b1 3e 00 00       	push   $0x3eb1
     5a0:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     5a6:	e8 e5 33 00 00       	call   3990 <printf>
}
     5ab:	83 c4 10             	add    $0x10,%esp
     5ae:	8d 65 f8             	lea    -0x8(%ebp),%esp
     5b1:	5b                   	pop    %ebx
     5b2:	5e                   	pop    %esi
     5b3:	5d                   	pop    %ebp
     5b4:	c3                   	ret    
      printf(stdout, "error: write aa %d new file failed\n", i);
     5b5:	83 ec 04             	sub    $0x4,%esp
     5b8:	53                   	push   %ebx
     5b9:	68 d4 4c 00 00       	push   $0x4cd4
     5be:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     5c4:	e8 c7 33 00 00       	call   3990 <printf>
      exit();
     5c9:	e8 74 32 00 00       	call   3842 <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
     5ce:	83 ec 04             	sub    $0x4,%esp
     5d1:	53                   	push   %ebx
     5d2:	68 f8 4c 00 00       	push   $0x4cf8
     5d7:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     5dd:	e8 ae 33 00 00       	call   3990 <printf>
      exit();
     5e2:	e8 5b 32 00 00       	call   3842 <exit>
    printf(stdout, "error: open small failed!\n");
     5e7:	83 ec 08             	sub    $0x8,%esp
     5ea:	68 6e 3e 00 00       	push   $0x3e6e
     5ef:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     5f5:	e8 96 33 00 00       	call   3990 <printf>
    exit();
     5fa:	e8 43 32 00 00       	call   3842 <exit>
    printf(stdout, "read failed\n");
     5ff:	83 ec 08             	sub    $0x8,%esp
     602:	68 b5 41 00 00       	push   $0x41b5
     607:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     60d:	e8 7e 33 00 00       	call   3990 <printf>
    exit();
     612:	e8 2b 32 00 00       	call   3842 <exit>
    printf(stdout, "unlink small failed\n");
     617:	83 ec 08             	sub    $0x8,%esp
     61a:	68 9c 3e 00 00       	push   $0x3e9c
     61f:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     625:	e8 66 33 00 00       	call   3990 <printf>
    exit();
     62a:	e8 13 32 00 00       	call   3842 <exit>
    printf(stdout, "error: creat small failed!\n");
     62f:	83 ec 08             	sub    $0x8,%esp
     632:	68 18 3e 00 00       	push   $0x3e18
     637:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     63d:	e8 4e 33 00 00       	call   3990 <printf>
    exit();
     642:	e8 fb 31 00 00       	call   3842 <exit>
     647:	89 f6                	mov    %esi,%esi
     649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000650 <writetest1>:
{
     650:	55                   	push   %ebp
     651:	89 e5                	mov    %esp,%ebp
     653:	56                   	push   %esi
     654:	53                   	push   %ebx
  printf(stdout, "big files test\n");
     655:	83 ec 08             	sub    $0x8,%esp
     658:	68 c5 3e 00 00       	push   $0x3ec5
     65d:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     663:	e8 28 33 00 00       	call   3990 <printf>
  fd = open("big", O_CREATE|O_RDWR);
     668:	59                   	pop    %ecx
     669:	5b                   	pop    %ebx
     66a:	68 02 02 00 00       	push   $0x202
     66f:	68 3f 3f 00 00       	push   $0x3f3f
     674:	e8 09 32 00 00       	call   3882 <open>
  if(fd < 0){
     679:	83 c4 10             	add    $0x10,%esp
     67c:	85 c0                	test   %eax,%eax
     67e:	0f 88 64 01 00 00    	js     7e8 <writetest1+0x198>
     684:	89 c6                	mov    %eax,%esi
     686:	31 db                	xor    %ebx,%ebx
     688:	90                   	nop
     689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(write(fd, buf, 512) != 512){
     690:	83 ec 04             	sub    $0x4,%esp
    ((int*)buf)[0] = i;
     693:	89 1d e0 84 00 00    	mov    %ebx,0x84e0
    if(write(fd, buf, 512) != 512){
     699:	68 00 02 00 00       	push   $0x200
     69e:	68 e0 84 00 00       	push   $0x84e0
     6a3:	56                   	push   %esi
     6a4:	e8 b9 31 00 00       	call   3862 <write>
     6a9:	83 c4 10             	add    $0x10,%esp
     6ac:	3d 00 02 00 00       	cmp    $0x200,%eax
     6b1:	0f 85 b3 00 00 00    	jne    76a <writetest1+0x11a>
  for(i = 0; i < MAXFILE; i++){
     6b7:	83 c3 01             	add    $0x1,%ebx
     6ba:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     6c0:	75 ce                	jne    690 <writetest1+0x40>
  close(fd);
     6c2:	83 ec 0c             	sub    $0xc,%esp
     6c5:	56                   	push   %esi
     6c6:	e8 9f 31 00 00       	call   386a <close>
  fd = open("big", O_RDONLY);
     6cb:	58                   	pop    %eax
     6cc:	5a                   	pop    %edx
     6cd:	6a 00                	push   $0x0
     6cf:	68 3f 3f 00 00       	push   $0x3f3f
     6d4:	e8 a9 31 00 00       	call   3882 <open>
  if(fd < 0){
     6d9:	83 c4 10             	add    $0x10,%esp
     6dc:	85 c0                	test   %eax,%eax
  fd = open("big", O_RDONLY);
     6de:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     6e0:	0f 88 ea 00 00 00    	js     7d0 <writetest1+0x180>
     6e6:	31 db                	xor    %ebx,%ebx
     6e8:	eb 1d                	jmp    707 <writetest1+0xb7>
     6ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(i != 512){
     6f0:	3d 00 02 00 00       	cmp    $0x200,%eax
     6f5:	0f 85 9f 00 00 00    	jne    79a <writetest1+0x14a>
    if(((int*)buf)[0] != n){
     6fb:	a1 e0 84 00 00       	mov    0x84e0,%eax
     700:	39 c3                	cmp    %eax,%ebx
     702:	75 7f                	jne    783 <writetest1+0x133>
    n++;
     704:	83 c3 01             	add    $0x1,%ebx
    i = read(fd, buf, 512);
     707:	83 ec 04             	sub    $0x4,%esp
     70a:	68 00 02 00 00       	push   $0x200
     70f:	68 e0 84 00 00       	push   $0x84e0
     714:	56                   	push   %esi
     715:	e8 40 31 00 00       	call   385a <read>
    if(i == 0){
     71a:	83 c4 10             	add    $0x10,%esp
     71d:	85 c0                	test   %eax,%eax
     71f:	75 cf                	jne    6f0 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     721:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     727:	0f 84 86 00 00 00    	je     7b3 <writetest1+0x163>
  close(fd);
     72d:	83 ec 0c             	sub    $0xc,%esp
     730:	56                   	push   %esi
     731:	e8 34 31 00 00       	call   386a <close>
  if(unlink("big") < 0){
     736:	c7 04 24 3f 3f 00 00 	movl   $0x3f3f,(%esp)
     73d:	e8 50 31 00 00       	call   3892 <unlink>
     742:	83 c4 10             	add    $0x10,%esp
     745:	85 c0                	test   %eax,%eax
     747:	0f 88 b3 00 00 00    	js     800 <writetest1+0x1b0>
  printf(stdout, "big files ok\n");
     74d:	83 ec 08             	sub    $0x8,%esp
     750:	68 66 3f 00 00       	push   $0x3f66
     755:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     75b:	e8 30 32 00 00       	call   3990 <printf>
}
     760:	83 c4 10             	add    $0x10,%esp
     763:	8d 65 f8             	lea    -0x8(%ebp),%esp
     766:	5b                   	pop    %ebx
     767:	5e                   	pop    %esi
     768:	5d                   	pop    %ebp
     769:	c3                   	ret    
      printf(stdout, "error: write big file failed\n", i);
     76a:	83 ec 04             	sub    $0x4,%esp
     76d:	53                   	push   %ebx
     76e:	68 ef 3e 00 00       	push   $0x3eef
     773:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     779:	e8 12 32 00 00       	call   3990 <printf>
      exit();
     77e:	e8 bf 30 00 00       	call   3842 <exit>
      printf(stdout, "read content of block %d is %d\n",
     783:	50                   	push   %eax
     784:	53                   	push   %ebx
     785:	68 1c 4d 00 00       	push   $0x4d1c
     78a:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     790:	e8 fb 31 00 00       	call   3990 <printf>
      exit();
     795:	e8 a8 30 00 00       	call   3842 <exit>
      printf(stdout, "read failed %d\n", i);
     79a:	83 ec 04             	sub    $0x4,%esp
     79d:	50                   	push   %eax
     79e:	68 43 3f 00 00       	push   $0x3f43
     7a3:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     7a9:	e8 e2 31 00 00       	call   3990 <printf>
      exit();
     7ae:	e8 8f 30 00 00       	call   3842 <exit>
        printf(stdout, "read only %d blocks from big", n);
     7b3:	83 ec 04             	sub    $0x4,%esp
     7b6:	68 8b 00 00 00       	push   $0x8b
     7bb:	68 26 3f 00 00       	push   $0x3f26
     7c0:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     7c6:	e8 c5 31 00 00       	call   3990 <printf>
        exit();
     7cb:	e8 72 30 00 00       	call   3842 <exit>
    printf(stdout, "error: open big failed!\n");
     7d0:	83 ec 08             	sub    $0x8,%esp
     7d3:	68 0d 3f 00 00       	push   $0x3f0d
     7d8:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     7de:	e8 ad 31 00 00       	call   3990 <printf>
    exit();
     7e3:	e8 5a 30 00 00       	call   3842 <exit>
    printf(stdout, "error: creat big failed!\n");
     7e8:	83 ec 08             	sub    $0x8,%esp
     7eb:	68 d5 3e 00 00       	push   $0x3ed5
     7f0:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     7f6:	e8 95 31 00 00       	call   3990 <printf>
    exit();
     7fb:	e8 42 30 00 00       	call   3842 <exit>
    printf(stdout, "unlink big failed\n");
     800:	83 ec 08             	sub    $0x8,%esp
     803:	68 53 3f 00 00       	push   $0x3f53
     808:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     80e:	e8 7d 31 00 00       	call   3990 <printf>
    exit();
     813:	e8 2a 30 00 00       	call   3842 <exit>
     818:	90                   	nop
     819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000820 <createtest>:
{
     820:	55                   	push   %ebp
     821:	89 e5                	mov    %esp,%ebp
     823:	53                   	push   %ebx
  name[2] = '\0';
     824:	bb 30 00 00 00       	mov    $0x30,%ebx
{
     829:	83 ec 0c             	sub    $0xc,%esp
  printf(stdout, "many creates, followed by unlink test\n");
     82c:	68 3c 4d 00 00       	push   $0x4d3c
     831:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     837:	e8 54 31 00 00       	call   3990 <printf>
  name[0] = 'a';
     83c:	c6 05 e0 a4 00 00 61 	movb   $0x61,0xa4e0
  name[2] = '\0';
     843:	c6 05 e2 a4 00 00 00 	movb   $0x0,0xa4e2
     84a:	83 c4 10             	add    $0x10,%esp
     84d:	8d 76 00             	lea    0x0(%esi),%esi
    fd = open(name, O_CREATE|O_RDWR);
     850:	83 ec 08             	sub    $0x8,%esp
    name[1] = '0' + i;
     853:	88 1d e1 a4 00 00    	mov    %bl,0xa4e1
     859:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     85c:	68 02 02 00 00       	push   $0x202
     861:	68 e0 a4 00 00       	push   $0xa4e0
     866:	e8 17 30 00 00       	call   3882 <open>
    close(fd);
     86b:	89 04 24             	mov    %eax,(%esp)
     86e:	e8 f7 2f 00 00       	call   386a <close>
  for(i = 0; i < 52; i++){
     873:	83 c4 10             	add    $0x10,%esp
     876:	80 fb 64             	cmp    $0x64,%bl
     879:	75 d5                	jne    850 <createtest+0x30>
  name[0] = 'a';
     87b:	c6 05 e0 a4 00 00 61 	movb   $0x61,0xa4e0
  name[2] = '\0';
     882:	c6 05 e2 a4 00 00 00 	movb   $0x0,0xa4e2
     889:	bb 30 00 00 00       	mov    $0x30,%ebx
     88e:	66 90                	xchg   %ax,%ax
    unlink(name);
     890:	83 ec 0c             	sub    $0xc,%esp
    name[1] = '0' + i;
     893:	88 1d e1 a4 00 00    	mov    %bl,0xa4e1
     899:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
     89c:	68 e0 a4 00 00       	push   $0xa4e0
     8a1:	e8 ec 2f 00 00       	call   3892 <unlink>
  for(i = 0; i < 52; i++){
     8a6:	83 c4 10             	add    $0x10,%esp
     8a9:	80 fb 64             	cmp    $0x64,%bl
     8ac:	75 e2                	jne    890 <createtest+0x70>
  printf(stdout, "many creates, followed by unlink; ok\n");
     8ae:	83 ec 08             	sub    $0x8,%esp
     8b1:	68 64 4d 00 00       	push   $0x4d64
     8b6:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     8bc:	e8 cf 30 00 00       	call   3990 <printf>
}
     8c1:	83 c4 10             	add    $0x10,%esp
     8c4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8c7:	c9                   	leave  
     8c8:	c3                   	ret    
     8c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008d0 <dirtest>:
{
     8d0:	55                   	push   %ebp
     8d1:	89 e5                	mov    %esp,%ebp
     8d3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     8d6:	68 74 3f 00 00       	push   $0x3f74
     8db:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     8e1:	e8 aa 30 00 00       	call   3990 <printf>
  if(mkdir("dir0") < 0){
     8e6:	c7 04 24 80 3f 00 00 	movl   $0x3f80,(%esp)
     8ed:	e8 b8 2f 00 00       	call   38aa <mkdir>
     8f2:	83 c4 10             	add    $0x10,%esp
     8f5:	85 c0                	test   %eax,%eax
     8f7:	78 58                	js     951 <dirtest+0x81>
  if(chdir("dir0") < 0){
     8f9:	83 ec 0c             	sub    $0xc,%esp
     8fc:	68 80 3f 00 00       	push   $0x3f80
     901:	e8 ac 2f 00 00       	call   38b2 <chdir>
     906:	83 c4 10             	add    $0x10,%esp
     909:	85 c0                	test   %eax,%eax
     90b:	0f 88 85 00 00 00    	js     996 <dirtest+0xc6>
  if(chdir("..") < 0){
     911:	83 ec 0c             	sub    $0xc,%esp
     914:	68 25 45 00 00       	push   $0x4525
     919:	e8 94 2f 00 00       	call   38b2 <chdir>
     91e:	83 c4 10             	add    $0x10,%esp
     921:	85 c0                	test   %eax,%eax
     923:	78 5a                	js     97f <dirtest+0xaf>
  if(unlink("dir0") < 0){
     925:	83 ec 0c             	sub    $0xc,%esp
     928:	68 80 3f 00 00       	push   $0x3f80
     92d:	e8 60 2f 00 00       	call   3892 <unlink>
     932:	83 c4 10             	add    $0x10,%esp
     935:	85 c0                	test   %eax,%eax
     937:	78 2f                	js     968 <dirtest+0x98>
  printf(stdout, "mkdir test ok\n");
     939:	83 ec 08             	sub    $0x8,%esp
     93c:	68 bd 3f 00 00       	push   $0x3fbd
     941:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     947:	e8 44 30 00 00       	call   3990 <printf>
}
     94c:	83 c4 10             	add    $0x10,%esp
     94f:	c9                   	leave  
     950:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
     951:	50                   	push   %eax
     952:	50                   	push   %eax
     953:	68 b0 3c 00 00       	push   $0x3cb0
     958:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     95e:	e8 2d 30 00 00       	call   3990 <printf>
    exit();
     963:	e8 da 2e 00 00       	call   3842 <exit>
    printf(stdout, "unlink dir0 failed\n");
     968:	50                   	push   %eax
     969:	50                   	push   %eax
     96a:	68 a9 3f 00 00       	push   $0x3fa9
     96f:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     975:	e8 16 30 00 00       	call   3990 <printf>
    exit();
     97a:	e8 c3 2e 00 00       	call   3842 <exit>
    printf(stdout, "chdir .. failed\n");
     97f:	52                   	push   %edx
     980:	52                   	push   %edx
     981:	68 98 3f 00 00       	push   $0x3f98
     986:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     98c:	e8 ff 2f 00 00       	call   3990 <printf>
    exit();
     991:	e8 ac 2e 00 00       	call   3842 <exit>
    printf(stdout, "chdir dir0 failed\n");
     996:	51                   	push   %ecx
     997:	51                   	push   %ecx
     998:	68 85 3f 00 00       	push   $0x3f85
     99d:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     9a3:	e8 e8 2f 00 00       	call   3990 <printf>
    exit();
     9a8:	e8 95 2e 00 00       	call   3842 <exit>
     9ad:	8d 76 00             	lea    0x0(%esi),%esi

000009b0 <exectest>:
{
     9b0:	55                   	push   %ebp
     9b1:	89 e5                	mov    %esp,%ebp
     9b3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     9b6:	68 cc 3f 00 00       	push   $0x3fcc
     9bb:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     9c1:	e8 ca 2f 00 00       	call   3990 <printf>
  if(exec("echo", echoargv) < 0){
     9c6:	5a                   	pop    %edx
     9c7:	59                   	pop    %ecx
     9c8:	68 00 5d 00 00       	push   $0x5d00
     9cd:	68 95 3d 00 00       	push   $0x3d95
     9d2:	e8 a3 2e 00 00       	call   387a <exec>
     9d7:	83 c4 10             	add    $0x10,%esp
     9da:	85 c0                	test   %eax,%eax
     9dc:	78 02                	js     9e0 <exectest+0x30>
}
     9de:	c9                   	leave  
     9df:	c3                   	ret    
    printf(stdout, "exec echo failed\n");
     9e0:	50                   	push   %eax
     9e1:	50                   	push   %eax
     9e2:	68 d7 3f 00 00       	push   $0x3fd7
     9e7:	ff 35 fc 5c 00 00    	pushl  0x5cfc
     9ed:	e8 9e 2f 00 00       	call   3990 <printf>
    exit();
     9f2:	e8 4b 2e 00 00       	call   3842 <exit>
     9f7:	89 f6                	mov    %esi,%esi
     9f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a00 <pipe1>:
{
     a00:	55                   	push   %ebp
     a01:	89 e5                	mov    %esp,%ebp
     a03:	57                   	push   %edi
     a04:	56                   	push   %esi
     a05:	53                   	push   %ebx
  if(pipe(fds) != 0){
     a06:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
     a09:	83 ec 38             	sub    $0x38,%esp
  if(pipe(fds) != 0){
     a0c:	50                   	push   %eax
     a0d:	e8 40 2e 00 00       	call   3852 <pipe>
     a12:	83 c4 10             	add    $0x10,%esp
     a15:	85 c0                	test   %eax,%eax
     a17:	0f 85 3d 01 00 00    	jne    b5a <pipe1+0x15a>
     a1d:	89 c3                	mov    %eax,%ebx
  pid = fork();
     a1f:	e8 16 2e 00 00       	call   383a <fork>
  if(pid == 0){
     a24:	83 f8 00             	cmp    $0x0,%eax
  pid = fork();
     a27:	89 c6                	mov    %eax,%esi
  if(pid == 0){
     a29:	0f 84 8a 00 00 00    	je     ab9 <pipe1+0xb9>
  } else if(pid > 0){
     a2f:	0f 8e 39 01 00 00    	jle    b6e <pipe1+0x16e>
    close(fds[1]);
     a35:	83 ec 0c             	sub    $0xc,%esp
     a38:	ff 75 e4             	pushl  -0x1c(%ebp)
    cc = 1;
     a3b:	bf 01 00 00 00       	mov    $0x1,%edi
    close(fds[1]);
     a40:	e8 25 2e 00 00       	call   386a <close>
    while((n = read(fds[0], buf, cc)) > 0){
     a45:	83 c4 10             	add    $0x10,%esp
    total = 0;
     a48:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     a4f:	83 ec 04             	sub    $0x4,%esp
     a52:	57                   	push   %edi
     a53:	68 e0 84 00 00       	push   $0x84e0
     a58:	ff 75 e0             	pushl  -0x20(%ebp)
     a5b:	e8 fa 2d 00 00       	call   385a <read>
     a60:	83 c4 10             	add    $0x10,%esp
     a63:	85 c0                	test   %eax,%eax
     a65:	0f 8e a9 00 00 00    	jle    b14 <pipe1+0x114>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     a6b:	89 d9                	mov    %ebx,%ecx
     a6d:	8d 34 18             	lea    (%eax,%ebx,1),%esi
     a70:	f7 d9                	neg    %ecx
     a72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     a78:	38 9c 0b e0 84 00 00 	cmp    %bl,0x84e0(%ebx,%ecx,1)
     a7f:	8d 53 01             	lea    0x1(%ebx),%edx
     a82:	75 1b                	jne    a9f <pipe1+0x9f>
      for(i = 0; i < n; i++){
     a84:	39 f2                	cmp    %esi,%edx
     a86:	89 d3                	mov    %edx,%ebx
     a88:	75 ee                	jne    a78 <pipe1+0x78>
      cc = cc * 2;
     a8a:	01 ff                	add    %edi,%edi
      total += n;
     a8c:	01 45 d4             	add    %eax,-0x2c(%ebp)
     a8f:	b8 00 20 00 00       	mov    $0x2000,%eax
     a94:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
     a9a:	0f 4f f8             	cmovg  %eax,%edi
     a9d:	eb b0                	jmp    a4f <pipe1+0x4f>
          printf(1, "pipe1 oops 2\n");
     a9f:	83 ec 08             	sub    $0x8,%esp
     aa2:	68 06 40 00 00       	push   $0x4006
     aa7:	6a 01                	push   $0x1
     aa9:	e8 e2 2e 00 00       	call   3990 <printf>
          return;
     aae:	83 c4 10             	add    $0x10,%esp
}
     ab1:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ab4:	5b                   	pop    %ebx
     ab5:	5e                   	pop    %esi
     ab6:	5f                   	pop    %edi
     ab7:	5d                   	pop    %ebp
     ab8:	c3                   	ret    
    close(fds[0]);
     ab9:	83 ec 0c             	sub    $0xc,%esp
     abc:	ff 75 e0             	pushl  -0x20(%ebp)
     abf:	e8 a6 2d 00 00       	call   386a <close>
     ac4:	83 c4 10             	add    $0x10,%esp
        buf[i] = seq++;
     ac7:	89 f0                	mov    %esi,%eax
     ac9:	8d 96 09 04 00 00    	lea    0x409(%esi),%edx
{
     acf:	89 f3                	mov    %esi,%ebx
        buf[i] = seq++;
     ad1:	f7 d8                	neg    %eax
     ad3:	90                   	nop
     ad4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ad8:	88 9c 18 e0 84 00 00 	mov    %bl,0x84e0(%eax,%ebx,1)
     adf:	83 c3 01             	add    $0x1,%ebx
      for(i = 0; i < 1033; i++)
     ae2:	39 d3                	cmp    %edx,%ebx
     ae4:	75 f2                	jne    ad8 <pipe1+0xd8>
      if(write(fds[1], buf, 1033) != 1033){
     ae6:	83 ec 04             	sub    $0x4,%esp
     ae9:	89 de                	mov    %ebx,%esi
     aeb:	68 09 04 00 00       	push   $0x409
     af0:	68 e0 84 00 00       	push   $0x84e0
     af5:	ff 75 e4             	pushl  -0x1c(%ebp)
     af8:	e8 65 2d 00 00       	call   3862 <write>
     afd:	83 c4 10             	add    $0x10,%esp
     b00:	3d 09 04 00 00       	cmp    $0x409,%eax
     b05:	75 7b                	jne    b82 <pipe1+0x182>
    for(n = 0; n < 5; n++){
     b07:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     b0d:	75 b8                	jne    ac7 <pipe1+0xc7>
    exit();
     b0f:	e8 2e 2d 00 00       	call   3842 <exit>
    if(total != 5 * 1033){
     b14:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     b1b:	75 26                	jne    b43 <pipe1+0x143>
    close(fds[0]);
     b1d:	83 ec 0c             	sub    $0xc,%esp
     b20:	ff 75 e0             	pushl  -0x20(%ebp)
     b23:	e8 42 2d 00 00       	call   386a <close>
    wait();
     b28:	e8 1d 2d 00 00       	call   384a <wait>
  printf(1, "pipe1 ok\n");
     b2d:	58                   	pop    %eax
     b2e:	5a                   	pop    %edx
     b2f:	68 2b 40 00 00       	push   $0x402b
     b34:	6a 01                	push   $0x1
     b36:	e8 55 2e 00 00       	call   3990 <printf>
     b3b:	83 c4 10             	add    $0x10,%esp
     b3e:	e9 6e ff ff ff       	jmp    ab1 <pipe1+0xb1>
      printf(1, "pipe1 oops 3 total %d\n", total);
     b43:	83 ec 04             	sub    $0x4,%esp
     b46:	ff 75 d4             	pushl  -0x2c(%ebp)
     b49:	68 14 40 00 00       	push   $0x4014
     b4e:	6a 01                	push   $0x1
     b50:	e8 3b 2e 00 00       	call   3990 <printf>
      exit();
     b55:	e8 e8 2c 00 00       	call   3842 <exit>
    printf(1, "pipe() failed\n");
     b5a:	83 ec 08             	sub    $0x8,%esp
     b5d:	68 e9 3f 00 00       	push   $0x3fe9
     b62:	6a 01                	push   $0x1
     b64:	e8 27 2e 00 00       	call   3990 <printf>
    exit();
     b69:	e8 d4 2c 00 00       	call   3842 <exit>
    printf(1, "fork() failed\n");
     b6e:	83 ec 08             	sub    $0x8,%esp
     b71:	68 35 40 00 00       	push   $0x4035
     b76:	6a 01                	push   $0x1
     b78:	e8 13 2e 00 00       	call   3990 <printf>
    exit();
     b7d:	e8 c0 2c 00 00       	call   3842 <exit>
        printf(1, "pipe1 oops 1\n");
     b82:	83 ec 08             	sub    $0x8,%esp
     b85:	68 f8 3f 00 00       	push   $0x3ff8
     b8a:	6a 01                	push   $0x1
     b8c:	e8 ff 2d 00 00       	call   3990 <printf>
        exit();
     b91:	e8 ac 2c 00 00       	call   3842 <exit>
     b96:	8d 76 00             	lea    0x0(%esi),%esi
     b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ba0 <preempt>:
{
     ba0:	55                   	push   %ebp
     ba1:	89 e5                	mov    %esp,%ebp
     ba3:	57                   	push   %edi
     ba4:	56                   	push   %esi
     ba5:	53                   	push   %ebx
     ba6:	83 ec 24             	sub    $0x24,%esp
  printf(1, "preempt: ");
     ba9:	68 44 40 00 00       	push   $0x4044
     bae:	6a 01                	push   $0x1
     bb0:	e8 db 2d 00 00       	call   3990 <printf>
  pid1 = fork();
     bb5:	e8 80 2c 00 00       	call   383a <fork>
  if(pid1 == 0)
     bba:	83 c4 10             	add    $0x10,%esp
     bbd:	85 c0                	test   %eax,%eax
     bbf:	75 02                	jne    bc3 <preempt+0x23>
     bc1:	eb fe                	jmp    bc1 <preempt+0x21>
     bc3:	89 c7                	mov    %eax,%edi
  pid2 = fork();
     bc5:	e8 70 2c 00 00       	call   383a <fork>
  if(pid2 == 0)
     bca:	85 c0                	test   %eax,%eax
  pid2 = fork();
     bcc:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     bce:	75 02                	jne    bd2 <preempt+0x32>
     bd0:	eb fe                	jmp    bd0 <preempt+0x30>
  pipe(pfds);
     bd2:	8d 45 e0             	lea    -0x20(%ebp),%eax
     bd5:	83 ec 0c             	sub    $0xc,%esp
     bd8:	50                   	push   %eax
     bd9:	e8 74 2c 00 00       	call   3852 <pipe>
  pid3 = fork();
     bde:	e8 57 2c 00 00       	call   383a <fork>
  if(pid3 == 0){
     be3:	83 c4 10             	add    $0x10,%esp
     be6:	85 c0                	test   %eax,%eax
  pid3 = fork();
     be8:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
     bea:	75 47                	jne    c33 <preempt+0x93>
    close(pfds[0]);
     bec:	83 ec 0c             	sub    $0xc,%esp
     bef:	ff 75 e0             	pushl  -0x20(%ebp)
     bf2:	e8 73 2c 00 00       	call   386a <close>
    if(write(pfds[1], "x", 1) != 1)
     bf7:	83 c4 0c             	add    $0xc,%esp
     bfa:	6a 01                	push   $0x1
     bfc:	68 09 46 00 00       	push   $0x4609
     c01:	ff 75 e4             	pushl  -0x1c(%ebp)
     c04:	e8 59 2c 00 00       	call   3862 <write>
     c09:	83 c4 10             	add    $0x10,%esp
     c0c:	83 f8 01             	cmp    $0x1,%eax
     c0f:	74 12                	je     c23 <preempt+0x83>
      printf(1, "preempt write error");
     c11:	83 ec 08             	sub    $0x8,%esp
     c14:	68 4e 40 00 00       	push   $0x404e
     c19:	6a 01                	push   $0x1
     c1b:	e8 70 2d 00 00       	call   3990 <printf>
     c20:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     c23:	83 ec 0c             	sub    $0xc,%esp
     c26:	ff 75 e4             	pushl  -0x1c(%ebp)
     c29:	e8 3c 2c 00 00       	call   386a <close>
     c2e:	83 c4 10             	add    $0x10,%esp
     c31:	eb fe                	jmp    c31 <preempt+0x91>
  close(pfds[1]);
     c33:	83 ec 0c             	sub    $0xc,%esp
     c36:	ff 75 e4             	pushl  -0x1c(%ebp)
     c39:	e8 2c 2c 00 00       	call   386a <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     c3e:	83 c4 0c             	add    $0xc,%esp
     c41:	68 00 20 00 00       	push   $0x2000
     c46:	68 e0 84 00 00       	push   $0x84e0
     c4b:	ff 75 e0             	pushl  -0x20(%ebp)
     c4e:	e8 07 2c 00 00       	call   385a <read>
     c53:	83 c4 10             	add    $0x10,%esp
     c56:	83 f8 01             	cmp    $0x1,%eax
     c59:	74 1a                	je     c75 <preempt+0xd5>
    printf(1, "preempt read error");
     c5b:	83 ec 08             	sub    $0x8,%esp
     c5e:	68 62 40 00 00       	push   $0x4062
     c63:	6a 01                	push   $0x1
     c65:	e8 26 2d 00 00       	call   3990 <printf>
    return;
     c6a:	83 c4 10             	add    $0x10,%esp
}
     c6d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c70:	5b                   	pop    %ebx
     c71:	5e                   	pop    %esi
     c72:	5f                   	pop    %edi
     c73:	5d                   	pop    %ebp
     c74:	c3                   	ret    
  close(pfds[0]);
     c75:	83 ec 0c             	sub    $0xc,%esp
     c78:	ff 75 e0             	pushl  -0x20(%ebp)
     c7b:	e8 ea 2b 00 00       	call   386a <close>
  printf(1, "kill... ");
     c80:	58                   	pop    %eax
     c81:	5a                   	pop    %edx
     c82:	68 75 40 00 00       	push   $0x4075
     c87:	6a 01                	push   $0x1
     c89:	e8 02 2d 00 00       	call   3990 <printf>
  kill(pid1);
     c8e:	89 3c 24             	mov    %edi,(%esp)
     c91:	e8 dc 2b 00 00       	call   3872 <kill>
  kill(pid2);
     c96:	89 34 24             	mov    %esi,(%esp)
     c99:	e8 d4 2b 00 00       	call   3872 <kill>
  kill(pid3);
     c9e:	89 1c 24             	mov    %ebx,(%esp)
     ca1:	e8 cc 2b 00 00       	call   3872 <kill>
  printf(1, "wait... ");
     ca6:	59                   	pop    %ecx
     ca7:	5b                   	pop    %ebx
     ca8:	68 7e 40 00 00       	push   $0x407e
     cad:	6a 01                	push   $0x1
     caf:	e8 dc 2c 00 00       	call   3990 <printf>
  wait();
     cb4:	e8 91 2b 00 00       	call   384a <wait>
  wait();
     cb9:	e8 8c 2b 00 00       	call   384a <wait>
  wait();
     cbe:	e8 87 2b 00 00       	call   384a <wait>
  printf(1, "preempt ok\n");
     cc3:	5e                   	pop    %esi
     cc4:	5f                   	pop    %edi
     cc5:	68 87 40 00 00       	push   $0x4087
     cca:	6a 01                	push   $0x1
     ccc:	e8 bf 2c 00 00       	call   3990 <printf>
     cd1:	83 c4 10             	add    $0x10,%esp
     cd4:	eb 97                	jmp    c6d <preempt+0xcd>
     cd6:	8d 76 00             	lea    0x0(%esi),%esi
     cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ce0 <exitwait>:
{
     ce0:	55                   	push   %ebp
     ce1:	89 e5                	mov    %esp,%ebp
     ce3:	56                   	push   %esi
     ce4:	be 64 00 00 00       	mov    $0x64,%esi
     ce9:	53                   	push   %ebx
     cea:	eb 14                	jmp    d00 <exitwait+0x20>
     cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid){
     cf0:	74 6f                	je     d61 <exitwait+0x81>
      if(wait() != pid){
     cf2:	e8 53 2b 00 00       	call   384a <wait>
     cf7:	39 c3                	cmp    %eax,%ebx
     cf9:	75 2d                	jne    d28 <exitwait+0x48>
  for(i = 0; i < 100; i++){
     cfb:	83 ee 01             	sub    $0x1,%esi
     cfe:	74 48                	je     d48 <exitwait+0x68>
    pid = fork();
     d00:	e8 35 2b 00 00       	call   383a <fork>
    if(pid < 0){
     d05:	85 c0                	test   %eax,%eax
    pid = fork();
     d07:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     d09:	79 e5                	jns    cf0 <exitwait+0x10>
      printf(1, "fork failed\n");
     d0b:	83 ec 08             	sub    $0x8,%esp
     d0e:	68 f1 4b 00 00       	push   $0x4bf1
     d13:	6a 01                	push   $0x1
     d15:	e8 76 2c 00 00       	call   3990 <printf>
      return;
     d1a:	83 c4 10             	add    $0x10,%esp
}
     d1d:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d20:	5b                   	pop    %ebx
     d21:	5e                   	pop    %esi
     d22:	5d                   	pop    %ebp
     d23:	c3                   	ret    
     d24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, "wait wrong pid\n");
     d28:	83 ec 08             	sub    $0x8,%esp
     d2b:	68 93 40 00 00       	push   $0x4093
     d30:	6a 01                	push   $0x1
     d32:	e8 59 2c 00 00       	call   3990 <printf>
        return;
     d37:	83 c4 10             	add    $0x10,%esp
}
     d3a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d3d:	5b                   	pop    %ebx
     d3e:	5e                   	pop    %esi
     d3f:	5d                   	pop    %ebp
     d40:	c3                   	ret    
     d41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  printf(1, "exitwait ok\n");
     d48:	83 ec 08             	sub    $0x8,%esp
     d4b:	68 a3 40 00 00       	push   $0x40a3
     d50:	6a 01                	push   $0x1
     d52:	e8 39 2c 00 00       	call   3990 <printf>
     d57:	83 c4 10             	add    $0x10,%esp
}
     d5a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d5d:	5b                   	pop    %ebx
     d5e:	5e                   	pop    %esi
     d5f:	5d                   	pop    %ebp
     d60:	c3                   	ret    
      exit();
     d61:	e8 dc 2a 00 00       	call   3842 <exit>
     d66:	8d 76 00             	lea    0x0(%esi),%esi
     d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d70 <mem>:
{
     d70:	55                   	push   %ebp
     d71:	89 e5                	mov    %esp,%ebp
     d73:	57                   	push   %edi
     d74:	56                   	push   %esi
     d75:	53                   	push   %ebx
     d76:	83 ec 14             	sub    $0x14,%esp
  printf(1, "mem test\n");
     d79:	68 b0 40 00 00       	push   $0x40b0
     d7e:	6a 01                	push   $0x1
     d80:	e8 0b 2c 00 00       	call   3990 <printf>
  ppid = getpid();
     d85:	e8 38 2b 00 00       	call   38c2 <getpid>
     d8a:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
     d8c:	e8 a9 2a 00 00       	call   383a <fork>
     d91:	83 c4 10             	add    $0x10,%esp
     d94:	85 c0                	test   %eax,%eax
     d96:	75 70                	jne    e08 <mem+0x98>
     d98:	31 db                	xor    %ebx,%ebx
     d9a:	eb 08                	jmp    da4 <mem+0x34>
     d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      *(char**)m2 = m1;
     da0:	89 18                	mov    %ebx,(%eax)
     da2:	89 c3                	mov    %eax,%ebx
    while((m2 = malloc(10001)) != 0){
     da4:	83 ec 0c             	sub    $0xc,%esp
     da7:	68 11 27 00 00       	push   $0x2711
     dac:	e8 1f 2e 00 00       	call   3bd0 <malloc>
     db1:	83 c4 10             	add    $0x10,%esp
     db4:	85 c0                	test   %eax,%eax
     db6:	75 e8                	jne    da0 <mem+0x30>
    while(m1){
     db8:	85 db                	test   %ebx,%ebx
     dba:	74 18                	je     dd4 <mem+0x64>
     dbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m2 = *(char**)m1;
     dc0:	8b 3b                	mov    (%ebx),%edi
      free(m1);
     dc2:	83 ec 0c             	sub    $0xc,%esp
     dc5:	53                   	push   %ebx
     dc6:	89 fb                	mov    %edi,%ebx
     dc8:	e8 73 2d 00 00       	call   3b40 <free>
    while(m1){
     dcd:	83 c4 10             	add    $0x10,%esp
     dd0:	85 db                	test   %ebx,%ebx
     dd2:	75 ec                	jne    dc0 <mem+0x50>
    m1 = malloc(1024*20);
     dd4:	83 ec 0c             	sub    $0xc,%esp
     dd7:	68 00 50 00 00       	push   $0x5000
     ddc:	e8 ef 2d 00 00       	call   3bd0 <malloc>
    if(m1 == 0){
     de1:	83 c4 10             	add    $0x10,%esp
     de4:	85 c0                	test   %eax,%eax
     de6:	74 30                	je     e18 <mem+0xa8>
    free(m1);
     de8:	83 ec 0c             	sub    $0xc,%esp
     deb:	50                   	push   %eax
     dec:	e8 4f 2d 00 00       	call   3b40 <free>
    printf(1, "mem ok\n");
     df1:	58                   	pop    %eax
     df2:	5a                   	pop    %edx
     df3:	68 d4 40 00 00       	push   $0x40d4
     df8:	6a 01                	push   $0x1
     dfa:	e8 91 2b 00 00       	call   3990 <printf>
    exit();
     dff:	e8 3e 2a 00 00       	call   3842 <exit>
     e04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
     e08:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e0b:	5b                   	pop    %ebx
     e0c:	5e                   	pop    %esi
     e0d:	5f                   	pop    %edi
     e0e:	5d                   	pop    %ebp
    wait();
     e0f:	e9 36 2a 00 00       	jmp    384a <wait>
     e14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "couldn't allocate mem?!!\n");
     e18:	83 ec 08             	sub    $0x8,%esp
     e1b:	68 ba 40 00 00       	push   $0x40ba
     e20:	6a 01                	push   $0x1
     e22:	e8 69 2b 00 00       	call   3990 <printf>
      kill(ppid);
     e27:	89 34 24             	mov    %esi,(%esp)
     e2a:	e8 43 2a 00 00       	call   3872 <kill>
      exit();
     e2f:	e8 0e 2a 00 00       	call   3842 <exit>
     e34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     e3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000e40 <sharedfd>:
{
     e40:	55                   	push   %ebp
     e41:	89 e5                	mov    %esp,%ebp
     e43:	57                   	push   %edi
     e44:	56                   	push   %esi
     e45:	53                   	push   %ebx
     e46:	83 ec 34             	sub    $0x34,%esp
  printf(1, "sharedfd test\n");
     e49:	68 dc 40 00 00       	push   $0x40dc
     e4e:	6a 01                	push   $0x1
     e50:	e8 3b 2b 00 00       	call   3990 <printf>
  unlink("sharedfd");
     e55:	c7 04 24 eb 40 00 00 	movl   $0x40eb,(%esp)
     e5c:	e8 31 2a 00 00       	call   3892 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     e61:	5b                   	pop    %ebx
     e62:	5e                   	pop    %esi
     e63:	68 02 02 00 00       	push   $0x202
     e68:	68 eb 40 00 00       	push   $0x40eb
     e6d:	e8 10 2a 00 00       	call   3882 <open>
  if(fd < 0){
     e72:	83 c4 10             	add    $0x10,%esp
     e75:	85 c0                	test   %eax,%eax
     e77:	0f 88 29 01 00 00    	js     fa6 <sharedfd+0x166>
     e7d:	89 c7                	mov    %eax,%edi
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e7f:	8d 75 de             	lea    -0x22(%ebp),%esi
     e82:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  pid = fork();
     e87:	e8 ae 29 00 00       	call   383a <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e8c:	83 f8 01             	cmp    $0x1,%eax
  pid = fork();
     e8f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e92:	19 c0                	sbb    %eax,%eax
     e94:	83 ec 04             	sub    $0x4,%esp
     e97:	83 e0 f3             	and    $0xfffffff3,%eax
     e9a:	6a 0a                	push   $0xa
     e9c:	83 c0 70             	add    $0x70,%eax
     e9f:	50                   	push   %eax
     ea0:	56                   	push   %esi
     ea1:	e8 0a 28 00 00       	call   36b0 <memset>
     ea6:	83 c4 10             	add    $0x10,%esp
     ea9:	eb 0a                	jmp    eb5 <sharedfd+0x75>
     eab:	90                   	nop
     eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 1000; i++){
     eb0:	83 eb 01             	sub    $0x1,%ebx
     eb3:	74 26                	je     edb <sharedfd+0x9b>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     eb5:	83 ec 04             	sub    $0x4,%esp
     eb8:	6a 0a                	push   $0xa
     eba:	56                   	push   %esi
     ebb:	57                   	push   %edi
     ebc:	e8 a1 29 00 00       	call   3862 <write>
     ec1:	83 c4 10             	add    $0x10,%esp
     ec4:	83 f8 0a             	cmp    $0xa,%eax
     ec7:	74 e7                	je     eb0 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
     ec9:	83 ec 08             	sub    $0x8,%esp
     ecc:	68 b8 4d 00 00       	push   $0x4db8
     ed1:	6a 01                	push   $0x1
     ed3:	e8 b8 2a 00 00       	call   3990 <printf>
      break;
     ed8:	83 c4 10             	add    $0x10,%esp
  if(pid == 0)
     edb:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     ede:	85 c9                	test   %ecx,%ecx
     ee0:	0f 84 f4 00 00 00    	je     fda <sharedfd+0x19a>
    wait();
     ee6:	e8 5f 29 00 00       	call   384a <wait>
  close(fd);
     eeb:	83 ec 0c             	sub    $0xc,%esp
     eee:	31 db                	xor    %ebx,%ebx
     ef0:	57                   	push   %edi
     ef1:	8d 7d e8             	lea    -0x18(%ebp),%edi
     ef4:	e8 71 29 00 00       	call   386a <close>
  fd = open("sharedfd", 0);
     ef9:	58                   	pop    %eax
     efa:	5a                   	pop    %edx
     efb:	6a 00                	push   $0x0
     efd:	68 eb 40 00 00       	push   $0x40eb
     f02:	e8 7b 29 00 00       	call   3882 <open>
  if(fd < 0){
     f07:	83 c4 10             	add    $0x10,%esp
     f0a:	31 d2                	xor    %edx,%edx
     f0c:	85 c0                	test   %eax,%eax
  fd = open("sharedfd", 0);
     f0e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(fd < 0){
     f11:	0f 88 a9 00 00 00    	js     fc0 <sharedfd+0x180>
     f17:	89 f6                	mov    %esi,%esi
     f19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  while((n = read(fd, buf, sizeof(buf))) > 0){
     f20:	83 ec 04             	sub    $0x4,%esp
     f23:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     f26:	6a 0a                	push   $0xa
     f28:	56                   	push   %esi
     f29:	ff 75 d0             	pushl  -0x30(%ebp)
     f2c:	e8 29 29 00 00       	call   385a <read>
     f31:	83 c4 10             	add    $0x10,%esp
     f34:	85 c0                	test   %eax,%eax
     f36:	7e 27                	jle    f5f <sharedfd+0x11f>
     f38:	89 f0                	mov    %esi,%eax
     f3a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     f3d:	eb 13                	jmp    f52 <sharedfd+0x112>
     f3f:	90                   	nop
        np++;
     f40:	80 f9 70             	cmp    $0x70,%cl
     f43:	0f 94 c1             	sete   %cl
     f46:	0f b6 c9             	movzbl %cl,%ecx
     f49:	01 cb                	add    %ecx,%ebx
     f4b:	83 c0 01             	add    $0x1,%eax
    for(i = 0; i < sizeof(buf); i++){
     f4e:	39 c7                	cmp    %eax,%edi
     f50:	74 ce                	je     f20 <sharedfd+0xe0>
      if(buf[i] == 'c')
     f52:	0f b6 08             	movzbl (%eax),%ecx
     f55:	80 f9 63             	cmp    $0x63,%cl
     f58:	75 e6                	jne    f40 <sharedfd+0x100>
        nc++;
     f5a:	83 c2 01             	add    $0x1,%edx
     f5d:	eb ec                	jmp    f4b <sharedfd+0x10b>
  close(fd);
     f5f:	83 ec 0c             	sub    $0xc,%esp
     f62:	ff 75 d0             	pushl  -0x30(%ebp)
     f65:	e8 00 29 00 00       	call   386a <close>
  unlink("sharedfd");
     f6a:	c7 04 24 eb 40 00 00 	movl   $0x40eb,(%esp)
     f71:	e8 1c 29 00 00       	call   3892 <unlink>
  if(nc == 10000 && np == 10000){
     f76:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     f79:	83 c4 10             	add    $0x10,%esp
     f7c:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
     f82:	75 5b                	jne    fdf <sharedfd+0x19f>
     f84:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     f8a:	75 53                	jne    fdf <sharedfd+0x19f>
    printf(1, "sharedfd ok\n");
     f8c:	83 ec 08             	sub    $0x8,%esp
     f8f:	68 f4 40 00 00       	push   $0x40f4
     f94:	6a 01                	push   $0x1
     f96:	e8 f5 29 00 00       	call   3990 <printf>
     f9b:	83 c4 10             	add    $0x10,%esp
}
     f9e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fa1:	5b                   	pop    %ebx
     fa2:	5e                   	pop    %esi
     fa3:	5f                   	pop    %edi
     fa4:	5d                   	pop    %ebp
     fa5:	c3                   	ret    
    printf(1, "fstests: cannot open sharedfd for writing");
     fa6:	83 ec 08             	sub    $0x8,%esp
     fa9:	68 8c 4d 00 00       	push   $0x4d8c
     fae:	6a 01                	push   $0x1
     fb0:	e8 db 29 00 00       	call   3990 <printf>
    return;
     fb5:	83 c4 10             	add    $0x10,%esp
}
     fb8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fbb:	5b                   	pop    %ebx
     fbc:	5e                   	pop    %esi
     fbd:	5f                   	pop    %edi
     fbe:	5d                   	pop    %ebp
     fbf:	c3                   	ret    
    printf(1, "fstests: cannot open sharedfd for reading\n");
     fc0:	83 ec 08             	sub    $0x8,%esp
     fc3:	68 d8 4d 00 00       	push   $0x4dd8
     fc8:	6a 01                	push   $0x1
     fca:	e8 c1 29 00 00       	call   3990 <printf>
    return;
     fcf:	83 c4 10             	add    $0x10,%esp
}
     fd2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fd5:	5b                   	pop    %ebx
     fd6:	5e                   	pop    %esi
     fd7:	5f                   	pop    %edi
     fd8:	5d                   	pop    %ebp
     fd9:	c3                   	ret    
    exit();
     fda:	e8 63 28 00 00       	call   3842 <exit>
    printf(1, "sharedfd oops %d %d\n", nc, np);
     fdf:	53                   	push   %ebx
     fe0:	52                   	push   %edx
     fe1:	68 01 41 00 00       	push   $0x4101
     fe6:	6a 01                	push   $0x1
     fe8:	e8 a3 29 00 00       	call   3990 <printf>
    exit();
     fed:	e8 50 28 00 00       	call   3842 <exit>
     ff2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001000 <fourfiles>:
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	57                   	push   %edi
    1004:	56                   	push   %esi
    1005:	53                   	push   %ebx
  printf(1, "fourfiles test\n");
    1006:	be 16 41 00 00       	mov    $0x4116,%esi
  for(pi = 0; pi < 4; pi++){
    100b:	31 db                	xor    %ebx,%ebx
{
    100d:	83 ec 34             	sub    $0x34,%esp
  char *names[] = { "f0", "f1", "f2", "f3" };
    1010:	c7 45 d8 16 41 00 00 	movl   $0x4116,-0x28(%ebp)
    1017:	c7 45 dc 5f 42 00 00 	movl   $0x425f,-0x24(%ebp)
  printf(1, "fourfiles test\n");
    101e:	68 1c 41 00 00       	push   $0x411c
    1023:	6a 01                	push   $0x1
  char *names[] = { "f0", "f1", "f2", "f3" };
    1025:	c7 45 e0 63 42 00 00 	movl   $0x4263,-0x20(%ebp)
    102c:	c7 45 e4 19 41 00 00 	movl   $0x4119,-0x1c(%ebp)
  printf(1, "fourfiles test\n");
    1033:	e8 58 29 00 00       	call   3990 <printf>
    1038:	83 c4 10             	add    $0x10,%esp
    unlink(fname);
    103b:	83 ec 0c             	sub    $0xc,%esp
    103e:	56                   	push   %esi
    103f:	e8 4e 28 00 00       	call   3892 <unlink>
    pid = fork();
    1044:	e8 f1 27 00 00       	call   383a <fork>
    if(pid < 0){
    1049:	83 c4 10             	add    $0x10,%esp
    104c:	85 c0                	test   %eax,%eax
    104e:	0f 88 83 01 00 00    	js     11d7 <fourfiles+0x1d7>
    if(pid == 0){
    1054:	0f 84 e3 00 00 00    	je     113d <fourfiles+0x13d>
  for(pi = 0; pi < 4; pi++){
    105a:	83 c3 01             	add    $0x1,%ebx
    105d:	83 fb 04             	cmp    $0x4,%ebx
    1060:	74 06                	je     1068 <fourfiles+0x68>
    1062:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    1066:	eb d3                	jmp    103b <fourfiles+0x3b>
    wait();
    1068:	e8 dd 27 00 00       	call   384a <wait>
    106d:	bf 30 00 00 00       	mov    $0x30,%edi
    1072:	e8 d3 27 00 00       	call   384a <wait>
    1077:	e8 ce 27 00 00       	call   384a <wait>
    107c:	e8 c9 27 00 00       	call   384a <wait>
    1081:	c7 45 d4 16 41 00 00 	movl   $0x4116,-0x2c(%ebp)
    fd = open(fname, 0);
    1088:	83 ec 08             	sub    $0x8,%esp
    total = 0;
    108b:	31 db                	xor    %ebx,%ebx
    fd = open(fname, 0);
    108d:	6a 00                	push   $0x0
    108f:	ff 75 d4             	pushl  -0x2c(%ebp)
    1092:	e8 eb 27 00 00       	call   3882 <open>
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1097:	83 c4 10             	add    $0x10,%esp
    fd = open(fname, 0);
    109a:	89 c6                	mov    %eax,%esi
    109c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while((n = read(fd, buf, sizeof(buf))) > 0){
    10a0:	83 ec 04             	sub    $0x4,%esp
    10a3:	68 00 20 00 00       	push   $0x2000
    10a8:	68 e0 84 00 00       	push   $0x84e0
    10ad:	56                   	push   %esi
    10ae:	e8 a7 27 00 00       	call   385a <read>
    10b3:	83 c4 10             	add    $0x10,%esp
    10b6:	85 c0                	test   %eax,%eax
    10b8:	7e 1c                	jle    10d6 <fourfiles+0xd6>
    10ba:	31 d2                	xor    %edx,%edx
    10bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if(buf[j] != '0'+i){
    10c0:	0f be 8a e0 84 00 00 	movsbl 0x84e0(%edx),%ecx
    10c7:	39 cf                	cmp    %ecx,%edi
    10c9:	75 5e                	jne    1129 <fourfiles+0x129>
      for(j = 0; j < n; j++){
    10cb:	83 c2 01             	add    $0x1,%edx
    10ce:	39 d0                	cmp    %edx,%eax
    10d0:	75 ee                	jne    10c0 <fourfiles+0xc0>
      total += n;
    10d2:	01 c3                	add    %eax,%ebx
    10d4:	eb ca                	jmp    10a0 <fourfiles+0xa0>
    close(fd);
    10d6:	83 ec 0c             	sub    $0xc,%esp
    10d9:	56                   	push   %esi
    10da:	e8 8b 27 00 00       	call   386a <close>
    if(total != 12*500){
    10df:	83 c4 10             	add    $0x10,%esp
    10e2:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    10e8:	0f 85 d4 00 00 00    	jne    11c2 <fourfiles+0x1c2>
    unlink(fname);
    10ee:	83 ec 0c             	sub    $0xc,%esp
    10f1:	ff 75 d4             	pushl  -0x2c(%ebp)
    10f4:	83 c7 01             	add    $0x1,%edi
    10f7:	e8 96 27 00 00       	call   3892 <unlink>
  for(i = 0; i < 2; i++){
    10fc:	83 c4 10             	add    $0x10,%esp
    10ff:	83 ff 32             	cmp    $0x32,%edi
    1102:	75 1a                	jne    111e <fourfiles+0x11e>
  printf(1, "fourfiles ok\n");
    1104:	83 ec 08             	sub    $0x8,%esp
    1107:	68 5a 41 00 00       	push   $0x415a
    110c:	6a 01                	push   $0x1
    110e:	e8 7d 28 00 00       	call   3990 <printf>
}
    1113:	83 c4 10             	add    $0x10,%esp
    1116:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1119:	5b                   	pop    %ebx
    111a:	5e                   	pop    %esi
    111b:	5f                   	pop    %edi
    111c:	5d                   	pop    %ebp
    111d:	c3                   	ret    
    111e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1121:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1124:	e9 5f ff ff ff       	jmp    1088 <fourfiles+0x88>
          printf(1, "wrong char\n");
    1129:	83 ec 08             	sub    $0x8,%esp
    112c:	68 3d 41 00 00       	push   $0x413d
    1131:	6a 01                	push   $0x1
    1133:	e8 58 28 00 00       	call   3990 <printf>
          exit();
    1138:	e8 05 27 00 00       	call   3842 <exit>
      fd = open(fname, O_CREATE | O_RDWR);
    113d:	83 ec 08             	sub    $0x8,%esp
    1140:	68 02 02 00 00       	push   $0x202
    1145:	56                   	push   %esi
    1146:	e8 37 27 00 00       	call   3882 <open>
      if(fd < 0){
    114b:	83 c4 10             	add    $0x10,%esp
    114e:	85 c0                	test   %eax,%eax
      fd = open(fname, O_CREATE | O_RDWR);
    1150:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    1152:	78 5a                	js     11ae <fourfiles+0x1ae>
      memset(buf, '0'+pi, 512);
    1154:	83 ec 04             	sub    $0x4,%esp
    1157:	83 c3 30             	add    $0x30,%ebx
    115a:	68 00 02 00 00       	push   $0x200
    115f:	53                   	push   %ebx
    1160:	bb 0c 00 00 00       	mov    $0xc,%ebx
    1165:	68 e0 84 00 00       	push   $0x84e0
    116a:	e8 41 25 00 00       	call   36b0 <memset>
    116f:	83 c4 10             	add    $0x10,%esp
        if((n = write(fd, buf, 500)) != 500){
    1172:	83 ec 04             	sub    $0x4,%esp
    1175:	68 f4 01 00 00       	push   $0x1f4
    117a:	68 e0 84 00 00       	push   $0x84e0
    117f:	56                   	push   %esi
    1180:	e8 dd 26 00 00       	call   3862 <write>
    1185:	83 c4 10             	add    $0x10,%esp
    1188:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    118d:	75 0a                	jne    1199 <fourfiles+0x199>
      for(i = 0; i < 12; i++){
    118f:	83 eb 01             	sub    $0x1,%ebx
    1192:	75 de                	jne    1172 <fourfiles+0x172>
      exit();
    1194:	e8 a9 26 00 00       	call   3842 <exit>
          printf(1, "write failed %d\n", n);
    1199:	83 ec 04             	sub    $0x4,%esp
    119c:	50                   	push   %eax
    119d:	68 2c 41 00 00       	push   $0x412c
    11a2:	6a 01                	push   $0x1
    11a4:	e8 e7 27 00 00       	call   3990 <printf>
          exit();
    11a9:	e8 94 26 00 00       	call   3842 <exit>
        printf(1, "create failed\n");
    11ae:	83 ec 08             	sub    $0x8,%esp
    11b1:	68 b7 43 00 00       	push   $0x43b7
    11b6:	6a 01                	push   $0x1
    11b8:	e8 d3 27 00 00       	call   3990 <printf>
        exit();
    11bd:	e8 80 26 00 00       	call   3842 <exit>
      printf(1, "wrong length %d\n", total);
    11c2:	83 ec 04             	sub    $0x4,%esp
    11c5:	53                   	push   %ebx
    11c6:	68 49 41 00 00       	push   $0x4149
    11cb:	6a 01                	push   $0x1
    11cd:	e8 be 27 00 00       	call   3990 <printf>
      exit();
    11d2:	e8 6b 26 00 00       	call   3842 <exit>
      printf(1, "fork failed\n");
    11d7:	83 ec 08             	sub    $0x8,%esp
    11da:	68 f1 4b 00 00       	push   $0x4bf1
    11df:	6a 01                	push   $0x1
    11e1:	e8 aa 27 00 00       	call   3990 <printf>
      exit();
    11e6:	e8 57 26 00 00       	call   3842 <exit>
    11eb:	90                   	nop
    11ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000011f0 <createdelete>:
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	57                   	push   %edi
    11f4:	56                   	push   %esi
    11f5:	53                   	push   %ebx
  for(pi = 0; pi < 4; pi++){
    11f6:	31 db                	xor    %ebx,%ebx
{
    11f8:	83 ec 44             	sub    $0x44,%esp
  printf(1, "createdelete test\n");
    11fb:	68 68 41 00 00       	push   $0x4168
    1200:	6a 01                	push   $0x1
    1202:	e8 89 27 00 00       	call   3990 <printf>
    1207:	83 c4 10             	add    $0x10,%esp
    pid = fork();
    120a:	e8 2b 26 00 00       	call   383a <fork>
    if(pid < 0){
    120f:	85 c0                	test   %eax,%eax
    1211:	0f 88 b7 01 00 00    	js     13ce <createdelete+0x1de>
    if(pid == 0){
    1217:	0f 84 f6 00 00 00    	je     1313 <createdelete+0x123>
  for(pi = 0; pi < 4; pi++){
    121d:	83 c3 01             	add    $0x1,%ebx
    1220:	83 fb 04             	cmp    $0x4,%ebx
    1223:	75 e5                	jne    120a <createdelete+0x1a>
    1225:	8d 7d c8             	lea    -0x38(%ebp),%edi
  for(i = 0; i < N; i++){
    1228:	31 f6                	xor    %esi,%esi
    wait();
    122a:	e8 1b 26 00 00       	call   384a <wait>
    122f:	e8 16 26 00 00       	call   384a <wait>
    1234:	e8 11 26 00 00       	call   384a <wait>
    1239:	e8 0c 26 00 00       	call   384a <wait>
  name[0] = name[1] = name[2] = 0;
    123e:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1242:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1248:	8d 46 30             	lea    0x30(%esi),%eax
    124b:	83 fe 09             	cmp    $0x9,%esi
      name[2] = '\0';
    124e:	bb 70 00 00 00       	mov    $0x70,%ebx
    1253:	0f 9f c2             	setg   %dl
    1256:	85 f6                	test   %esi,%esi
    1258:	88 45 c7             	mov    %al,-0x39(%ebp)
    125b:	0f 94 c0             	sete   %al
    125e:	09 c2                	or     %eax,%edx
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1260:	8d 46 ff             	lea    -0x1(%esi),%eax
    1263:	88 55 c6             	mov    %dl,-0x3a(%ebp)
    1266:	89 45 c0             	mov    %eax,-0x40(%ebp)
      name[1] = '0' + i;
    1269:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      fd = open(name, 0);
    126d:	83 ec 08             	sub    $0x8,%esp
      name[0] = 'p' + pi;
    1270:	88 5d c8             	mov    %bl,-0x38(%ebp)
      fd = open(name, 0);
    1273:	6a 00                	push   $0x0
    1275:	57                   	push   %edi
      name[1] = '0' + i;
    1276:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    1279:	e8 04 26 00 00       	call   3882 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    127e:	89 c1                	mov    %eax,%ecx
    1280:	83 c4 10             	add    $0x10,%esp
    1283:	c1 e9 1f             	shr    $0x1f,%ecx
    1286:	84 c9                	test   %cl,%cl
    1288:	74 0a                	je     1294 <createdelete+0xa4>
    128a:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    128e:	0f 85 11 01 00 00    	jne    13a5 <createdelete+0x1b5>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1294:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
    1298:	0f 86 44 01 00 00    	jbe    13e2 <createdelete+0x1f2>
      if(fd >= 0)
    129e:	85 c0                	test   %eax,%eax
    12a0:	78 0c                	js     12ae <createdelete+0xbe>
        close(fd);
    12a2:	83 ec 0c             	sub    $0xc,%esp
    12a5:	50                   	push   %eax
    12a6:	e8 bf 25 00 00       	call   386a <close>
    12ab:	83 c4 10             	add    $0x10,%esp
    12ae:	83 c3 01             	add    $0x1,%ebx
    for(pi = 0; pi < 4; pi++){
    12b1:	80 fb 74             	cmp    $0x74,%bl
    12b4:	75 b3                	jne    1269 <createdelete+0x79>
  for(i = 0; i < N; i++){
    12b6:	83 c6 01             	add    $0x1,%esi
    12b9:	83 fe 14             	cmp    $0x14,%esi
    12bc:	75 8a                	jne    1248 <createdelete+0x58>
    12be:	be 70 00 00 00       	mov    $0x70,%esi
    12c3:	90                   	nop
    12c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12c8:	8d 46 c0             	lea    -0x40(%esi),%eax
    12cb:	bb 04 00 00 00       	mov    $0x4,%ebx
    12d0:	88 45 c7             	mov    %al,-0x39(%ebp)
      name[0] = 'p' + i;
    12d3:	89 f0                	mov    %esi,%eax
      unlink(name);
    12d5:	83 ec 0c             	sub    $0xc,%esp
      name[0] = 'p' + i;
    12d8:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    12db:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      unlink(name);
    12df:	57                   	push   %edi
      name[1] = '0' + i;
    12e0:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    12e3:	e8 aa 25 00 00       	call   3892 <unlink>
    for(pi = 0; pi < 4; pi++){
    12e8:	83 c4 10             	add    $0x10,%esp
    12eb:	83 eb 01             	sub    $0x1,%ebx
    12ee:	75 e3                	jne    12d3 <createdelete+0xe3>
    12f0:	83 c6 01             	add    $0x1,%esi
  for(i = 0; i < N; i++){
    12f3:	89 f0                	mov    %esi,%eax
    12f5:	3c 84                	cmp    $0x84,%al
    12f7:	75 cf                	jne    12c8 <createdelete+0xd8>
  printf(1, "createdelete ok\n");
    12f9:	83 ec 08             	sub    $0x8,%esp
    12fc:	68 7b 41 00 00       	push   $0x417b
    1301:	6a 01                	push   $0x1
    1303:	e8 88 26 00 00       	call   3990 <printf>
}
    1308:	83 c4 10             	add    $0x10,%esp
    130b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    130e:	5b                   	pop    %ebx
    130f:	5e                   	pop    %esi
    1310:	5f                   	pop    %edi
    1311:	5d                   	pop    %ebp
    1312:	c3                   	ret    
      name[0] = 'p' + pi;
    1313:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    1316:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    131a:	be 01 00 00 00       	mov    $0x1,%esi
      name[0] = 'p' + pi;
    131f:	88 5d c8             	mov    %bl,-0x38(%ebp)
    1322:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[2] = '\0';
    1325:	31 db                	xor    %ebx,%ebx
    1327:	eb 12                	jmp    133b <createdelete+0x14b>
    1329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < N; i++){
    1330:	83 fe 14             	cmp    $0x14,%esi
    1333:	74 6b                	je     13a0 <createdelete+0x1b0>
    1335:	83 c3 01             	add    $0x1,%ebx
    1338:	83 c6 01             	add    $0x1,%esi
        fd = open(name, O_CREATE | O_RDWR);
    133b:	83 ec 08             	sub    $0x8,%esp
        name[1] = '0' + i;
    133e:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    1341:	68 02 02 00 00       	push   $0x202
    1346:	57                   	push   %edi
        name[1] = '0' + i;
    1347:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    134a:	e8 33 25 00 00       	call   3882 <open>
        if(fd < 0){
    134f:	83 c4 10             	add    $0x10,%esp
    1352:	85 c0                	test   %eax,%eax
    1354:	78 64                	js     13ba <createdelete+0x1ca>
        close(fd);
    1356:	83 ec 0c             	sub    $0xc,%esp
    1359:	50                   	push   %eax
    135a:	e8 0b 25 00 00       	call   386a <close>
        if(i > 0 && (i % 2 ) == 0){
    135f:	83 c4 10             	add    $0x10,%esp
    1362:	85 db                	test   %ebx,%ebx
    1364:	74 cf                	je     1335 <createdelete+0x145>
    1366:	f6 c3 01             	test   $0x1,%bl
    1369:	75 c5                	jne    1330 <createdelete+0x140>
          if(unlink(name) < 0){
    136b:	83 ec 0c             	sub    $0xc,%esp
          name[1] = '0' + (i / 2);
    136e:	89 d8                	mov    %ebx,%eax
    1370:	d1 f8                	sar    %eax
          if(unlink(name) < 0){
    1372:	57                   	push   %edi
          name[1] = '0' + (i / 2);
    1373:	83 c0 30             	add    $0x30,%eax
    1376:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    1379:	e8 14 25 00 00       	call   3892 <unlink>
    137e:	83 c4 10             	add    $0x10,%esp
    1381:	85 c0                	test   %eax,%eax
    1383:	79 ab                	jns    1330 <createdelete+0x140>
            printf(1, "unlink failed\n");
    1385:	83 ec 08             	sub    $0x8,%esp
    1388:	68 69 3d 00 00       	push   $0x3d69
    138d:	6a 01                	push   $0x1
    138f:	e8 fc 25 00 00       	call   3990 <printf>
            exit();
    1394:	e8 a9 24 00 00       	call   3842 <exit>
    1399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      exit();
    13a0:	e8 9d 24 00 00       	call   3842 <exit>
        printf(1, "oops createdelete %s didn't exist\n", name);
    13a5:	83 ec 04             	sub    $0x4,%esp
    13a8:	57                   	push   %edi
    13a9:	68 04 4e 00 00       	push   $0x4e04
    13ae:	6a 01                	push   $0x1
    13b0:	e8 db 25 00 00       	call   3990 <printf>
        exit();
    13b5:	e8 88 24 00 00       	call   3842 <exit>
          printf(1, "create failed\n");
    13ba:	83 ec 08             	sub    $0x8,%esp
    13bd:	68 b7 43 00 00       	push   $0x43b7
    13c2:	6a 01                	push   $0x1
    13c4:	e8 c7 25 00 00       	call   3990 <printf>
          exit();
    13c9:	e8 74 24 00 00       	call   3842 <exit>
      printf(1, "fork failed\n");
    13ce:	83 ec 08             	sub    $0x8,%esp
    13d1:	68 f1 4b 00 00       	push   $0x4bf1
    13d6:	6a 01                	push   $0x1
    13d8:	e8 b3 25 00 00       	call   3990 <printf>
      exit();
    13dd:	e8 60 24 00 00       	call   3842 <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    13e2:	85 c0                	test   %eax,%eax
    13e4:	0f 88 c4 fe ff ff    	js     12ae <createdelete+0xbe>
        printf(1, "oops createdelete %s did exist\n", name);
    13ea:	83 ec 04             	sub    $0x4,%esp
    13ed:	57                   	push   %edi
    13ee:	68 28 4e 00 00       	push   $0x4e28
    13f3:	6a 01                	push   $0x1
    13f5:	e8 96 25 00 00       	call   3990 <printf>
        exit();
    13fa:	e8 43 24 00 00       	call   3842 <exit>
    13ff:	90                   	nop

00001400 <unlinkread>:
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	56                   	push   %esi
    1404:	53                   	push   %ebx
  printf(1, "unlinkread test\n");
    1405:	83 ec 08             	sub    $0x8,%esp
    1408:	68 8c 41 00 00       	push   $0x418c
    140d:	6a 01                	push   $0x1
    140f:	e8 7c 25 00 00       	call   3990 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1414:	5b                   	pop    %ebx
    1415:	5e                   	pop    %esi
    1416:	68 02 02 00 00       	push   $0x202
    141b:	68 9d 41 00 00       	push   $0x419d
    1420:	e8 5d 24 00 00       	call   3882 <open>
  if(fd < 0){
    1425:	83 c4 10             	add    $0x10,%esp
    1428:	85 c0                	test   %eax,%eax
    142a:	0f 88 e6 00 00 00    	js     1516 <unlinkread+0x116>
  write(fd, "hello", 5);
    1430:	83 ec 04             	sub    $0x4,%esp
    1433:	89 c3                	mov    %eax,%ebx
    1435:	6a 05                	push   $0x5
    1437:	68 c2 41 00 00       	push   $0x41c2
    143c:	50                   	push   %eax
    143d:	e8 20 24 00 00       	call   3862 <write>
  close(fd);
    1442:	89 1c 24             	mov    %ebx,(%esp)
    1445:	e8 20 24 00 00       	call   386a <close>
  fd = open("unlinkread", O_RDWR);
    144a:	58                   	pop    %eax
    144b:	5a                   	pop    %edx
    144c:	6a 02                	push   $0x2
    144e:	68 9d 41 00 00       	push   $0x419d
    1453:	e8 2a 24 00 00       	call   3882 <open>
  if(fd < 0){
    1458:	83 c4 10             	add    $0x10,%esp
    145b:	85 c0                	test   %eax,%eax
  fd = open("unlinkread", O_RDWR);
    145d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    145f:	0f 88 10 01 00 00    	js     1575 <unlinkread+0x175>
  if(unlink("unlinkread") != 0){
    1465:	83 ec 0c             	sub    $0xc,%esp
    1468:	68 9d 41 00 00       	push   $0x419d
    146d:	e8 20 24 00 00       	call   3892 <unlink>
    1472:	83 c4 10             	add    $0x10,%esp
    1475:	85 c0                	test   %eax,%eax
    1477:	0f 85 e5 00 00 00    	jne    1562 <unlinkread+0x162>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    147d:	83 ec 08             	sub    $0x8,%esp
    1480:	68 02 02 00 00       	push   $0x202
    1485:	68 9d 41 00 00       	push   $0x419d
    148a:	e8 f3 23 00 00       	call   3882 <open>
  write(fd1, "yyy", 3);
    148f:	83 c4 0c             	add    $0xc,%esp
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1492:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    1494:	6a 03                	push   $0x3
    1496:	68 fa 41 00 00       	push   $0x41fa
    149b:	50                   	push   %eax
    149c:	e8 c1 23 00 00       	call   3862 <write>
  close(fd1);
    14a1:	89 34 24             	mov    %esi,(%esp)
    14a4:	e8 c1 23 00 00       	call   386a <close>
  if(read(fd, buf, sizeof(buf)) != 5){
    14a9:	83 c4 0c             	add    $0xc,%esp
    14ac:	68 00 20 00 00       	push   $0x2000
    14b1:	68 e0 84 00 00       	push   $0x84e0
    14b6:	53                   	push   %ebx
    14b7:	e8 9e 23 00 00       	call   385a <read>
    14bc:	83 c4 10             	add    $0x10,%esp
    14bf:	83 f8 05             	cmp    $0x5,%eax
    14c2:	0f 85 87 00 00 00    	jne    154f <unlinkread+0x14f>
  if(buf[0] != 'h'){
    14c8:	80 3d e0 84 00 00 68 	cmpb   $0x68,0x84e0
    14cf:	75 6b                	jne    153c <unlinkread+0x13c>
  if(write(fd, buf, 10) != 10){
    14d1:	83 ec 04             	sub    $0x4,%esp
    14d4:	6a 0a                	push   $0xa
    14d6:	68 e0 84 00 00       	push   $0x84e0
    14db:	53                   	push   %ebx
    14dc:	e8 81 23 00 00       	call   3862 <write>
    14e1:	83 c4 10             	add    $0x10,%esp
    14e4:	83 f8 0a             	cmp    $0xa,%eax
    14e7:	75 40                	jne    1529 <unlinkread+0x129>
  close(fd);
    14e9:	83 ec 0c             	sub    $0xc,%esp
    14ec:	53                   	push   %ebx
    14ed:	e8 78 23 00 00       	call   386a <close>
  unlink("unlinkread");
    14f2:	c7 04 24 9d 41 00 00 	movl   $0x419d,(%esp)
    14f9:	e8 94 23 00 00       	call   3892 <unlink>
  printf(1, "unlinkread ok\n");
    14fe:	58                   	pop    %eax
    14ff:	5a                   	pop    %edx
    1500:	68 45 42 00 00       	push   $0x4245
    1505:	6a 01                	push   $0x1
    1507:	e8 84 24 00 00       	call   3990 <printf>
}
    150c:	83 c4 10             	add    $0x10,%esp
    150f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1512:	5b                   	pop    %ebx
    1513:	5e                   	pop    %esi
    1514:	5d                   	pop    %ebp
    1515:	c3                   	ret    
    printf(1, "create unlinkread failed\n");
    1516:	51                   	push   %ecx
    1517:	51                   	push   %ecx
    1518:	68 a8 41 00 00       	push   $0x41a8
    151d:	6a 01                	push   $0x1
    151f:	e8 6c 24 00 00       	call   3990 <printf>
    exit();
    1524:	e8 19 23 00 00       	call   3842 <exit>
    printf(1, "unlinkread write failed\n");
    1529:	51                   	push   %ecx
    152a:	51                   	push   %ecx
    152b:	68 2c 42 00 00       	push   $0x422c
    1530:	6a 01                	push   $0x1
    1532:	e8 59 24 00 00       	call   3990 <printf>
    exit();
    1537:	e8 06 23 00 00       	call   3842 <exit>
    printf(1, "unlinkread wrong data\n");
    153c:	53                   	push   %ebx
    153d:	53                   	push   %ebx
    153e:	68 15 42 00 00       	push   $0x4215
    1543:	6a 01                	push   $0x1
    1545:	e8 46 24 00 00       	call   3990 <printf>
    exit();
    154a:	e8 f3 22 00 00       	call   3842 <exit>
    printf(1, "unlinkread read failed");
    154f:	56                   	push   %esi
    1550:	56                   	push   %esi
    1551:	68 fe 41 00 00       	push   $0x41fe
    1556:	6a 01                	push   $0x1
    1558:	e8 33 24 00 00       	call   3990 <printf>
    exit();
    155d:	e8 e0 22 00 00       	call   3842 <exit>
    printf(1, "unlink unlinkread failed\n");
    1562:	50                   	push   %eax
    1563:	50                   	push   %eax
    1564:	68 e0 41 00 00       	push   $0x41e0
    1569:	6a 01                	push   $0x1
    156b:	e8 20 24 00 00       	call   3990 <printf>
    exit();
    1570:	e8 cd 22 00 00       	call   3842 <exit>
    printf(1, "open unlinkread failed\n");
    1575:	50                   	push   %eax
    1576:	50                   	push   %eax
    1577:	68 c8 41 00 00       	push   $0x41c8
    157c:	6a 01                	push   $0x1
    157e:	e8 0d 24 00 00       	call   3990 <printf>
    exit();
    1583:	e8 ba 22 00 00       	call   3842 <exit>
    1588:	90                   	nop
    1589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001590 <linktest>:
{
    1590:	55                   	push   %ebp
    1591:	89 e5                	mov    %esp,%ebp
    1593:	53                   	push   %ebx
    1594:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "linktest\n");
    1597:	68 54 42 00 00       	push   $0x4254
    159c:	6a 01                	push   $0x1
    159e:	e8 ed 23 00 00       	call   3990 <printf>
  unlink("lf1");
    15a3:	c7 04 24 5e 42 00 00 	movl   $0x425e,(%esp)
    15aa:	e8 e3 22 00 00       	call   3892 <unlink>
  unlink("lf2");
    15af:	c7 04 24 62 42 00 00 	movl   $0x4262,(%esp)
    15b6:	e8 d7 22 00 00       	call   3892 <unlink>
  fd = open("lf1", O_CREATE|O_RDWR);
    15bb:	58                   	pop    %eax
    15bc:	5a                   	pop    %edx
    15bd:	68 02 02 00 00       	push   $0x202
    15c2:	68 5e 42 00 00       	push   $0x425e
    15c7:	e8 b6 22 00 00       	call   3882 <open>
  if(fd < 0){
    15cc:	83 c4 10             	add    $0x10,%esp
    15cf:	85 c0                	test   %eax,%eax
    15d1:	0f 88 1e 01 00 00    	js     16f5 <linktest+0x165>
  if(write(fd, "hello", 5) != 5){
    15d7:	83 ec 04             	sub    $0x4,%esp
    15da:	89 c3                	mov    %eax,%ebx
    15dc:	6a 05                	push   $0x5
    15de:	68 c2 41 00 00       	push   $0x41c2
    15e3:	50                   	push   %eax
    15e4:	e8 79 22 00 00       	call   3862 <write>
    15e9:	83 c4 10             	add    $0x10,%esp
    15ec:	83 f8 05             	cmp    $0x5,%eax
    15ef:	0f 85 98 01 00 00    	jne    178d <linktest+0x1fd>
  close(fd);
    15f5:	83 ec 0c             	sub    $0xc,%esp
    15f8:	53                   	push   %ebx
    15f9:	e8 6c 22 00 00       	call   386a <close>
  if(link("lf1", "lf2") < 0){
    15fe:	5b                   	pop    %ebx
    15ff:	58                   	pop    %eax
    1600:	68 62 42 00 00       	push   $0x4262
    1605:	68 5e 42 00 00       	push   $0x425e
    160a:	e8 93 22 00 00       	call   38a2 <link>
    160f:	83 c4 10             	add    $0x10,%esp
    1612:	85 c0                	test   %eax,%eax
    1614:	0f 88 60 01 00 00    	js     177a <linktest+0x1ea>
  unlink("lf1");
    161a:	83 ec 0c             	sub    $0xc,%esp
    161d:	68 5e 42 00 00       	push   $0x425e
    1622:	e8 6b 22 00 00       	call   3892 <unlink>
  if(open("lf1", 0) >= 0){
    1627:	58                   	pop    %eax
    1628:	5a                   	pop    %edx
    1629:	6a 00                	push   $0x0
    162b:	68 5e 42 00 00       	push   $0x425e
    1630:	e8 4d 22 00 00       	call   3882 <open>
    1635:	83 c4 10             	add    $0x10,%esp
    1638:	85 c0                	test   %eax,%eax
    163a:	0f 89 27 01 00 00    	jns    1767 <linktest+0x1d7>
  fd = open("lf2", 0);
    1640:	83 ec 08             	sub    $0x8,%esp
    1643:	6a 00                	push   $0x0
    1645:	68 62 42 00 00       	push   $0x4262
    164a:	e8 33 22 00 00       	call   3882 <open>
  if(fd < 0){
    164f:	83 c4 10             	add    $0x10,%esp
    1652:	85 c0                	test   %eax,%eax
  fd = open("lf2", 0);
    1654:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1656:	0f 88 f8 00 00 00    	js     1754 <linktest+0x1c4>
  if(read(fd, buf, sizeof(buf)) != 5){
    165c:	83 ec 04             	sub    $0x4,%esp
    165f:	68 00 20 00 00       	push   $0x2000
    1664:	68 e0 84 00 00       	push   $0x84e0
    1669:	50                   	push   %eax
    166a:	e8 eb 21 00 00       	call   385a <read>
    166f:	83 c4 10             	add    $0x10,%esp
    1672:	83 f8 05             	cmp    $0x5,%eax
    1675:	0f 85 c6 00 00 00    	jne    1741 <linktest+0x1b1>
  close(fd);
    167b:	83 ec 0c             	sub    $0xc,%esp
    167e:	53                   	push   %ebx
    167f:	e8 e6 21 00 00       	call   386a <close>
  if(link("lf2", "lf2") >= 0){
    1684:	58                   	pop    %eax
    1685:	5a                   	pop    %edx
    1686:	68 62 42 00 00       	push   $0x4262
    168b:	68 62 42 00 00       	push   $0x4262
    1690:	e8 0d 22 00 00       	call   38a2 <link>
    1695:	83 c4 10             	add    $0x10,%esp
    1698:	85 c0                	test   %eax,%eax
    169a:	0f 89 8e 00 00 00    	jns    172e <linktest+0x19e>
  unlink("lf2");
    16a0:	83 ec 0c             	sub    $0xc,%esp
    16a3:	68 62 42 00 00       	push   $0x4262
    16a8:	e8 e5 21 00 00       	call   3892 <unlink>
  if(link("lf2", "lf1") >= 0){
    16ad:	59                   	pop    %ecx
    16ae:	5b                   	pop    %ebx
    16af:	68 5e 42 00 00       	push   $0x425e
    16b4:	68 62 42 00 00       	push   $0x4262
    16b9:	e8 e4 21 00 00       	call   38a2 <link>
    16be:	83 c4 10             	add    $0x10,%esp
    16c1:	85 c0                	test   %eax,%eax
    16c3:	79 56                	jns    171b <linktest+0x18b>
  if(link(".", "lf1") >= 0){
    16c5:	83 ec 08             	sub    $0x8,%esp
    16c8:	68 5e 42 00 00       	push   $0x425e
    16cd:	68 26 45 00 00       	push   $0x4526
    16d2:	e8 cb 21 00 00       	call   38a2 <link>
    16d7:	83 c4 10             	add    $0x10,%esp
    16da:	85 c0                	test   %eax,%eax
    16dc:	79 2a                	jns    1708 <linktest+0x178>
  printf(1, "linktest ok\n");
    16de:	83 ec 08             	sub    $0x8,%esp
    16e1:	68 fc 42 00 00       	push   $0x42fc
    16e6:	6a 01                	push   $0x1
    16e8:	e8 a3 22 00 00       	call   3990 <printf>
}
    16ed:	83 c4 10             	add    $0x10,%esp
    16f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    16f3:	c9                   	leave  
    16f4:	c3                   	ret    
    printf(1, "create lf1 failed\n");
    16f5:	50                   	push   %eax
    16f6:	50                   	push   %eax
    16f7:	68 66 42 00 00       	push   $0x4266
    16fc:	6a 01                	push   $0x1
    16fe:	e8 8d 22 00 00       	call   3990 <printf>
    exit();
    1703:	e8 3a 21 00 00       	call   3842 <exit>
    printf(1, "link . lf1 succeeded! oops\n");
    1708:	50                   	push   %eax
    1709:	50                   	push   %eax
    170a:	68 e0 42 00 00       	push   $0x42e0
    170f:	6a 01                	push   $0x1
    1711:	e8 7a 22 00 00       	call   3990 <printf>
    exit();
    1716:	e8 27 21 00 00       	call   3842 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    171b:	52                   	push   %edx
    171c:	52                   	push   %edx
    171d:	68 70 4e 00 00       	push   $0x4e70
    1722:	6a 01                	push   $0x1
    1724:	e8 67 22 00 00       	call   3990 <printf>
    exit();
    1729:	e8 14 21 00 00       	call   3842 <exit>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    172e:	50                   	push   %eax
    172f:	50                   	push   %eax
    1730:	68 c2 42 00 00       	push   $0x42c2
    1735:	6a 01                	push   $0x1
    1737:	e8 54 22 00 00       	call   3990 <printf>
    exit();
    173c:	e8 01 21 00 00       	call   3842 <exit>
    printf(1, "read lf2 failed\n");
    1741:	51                   	push   %ecx
    1742:	51                   	push   %ecx
    1743:	68 b1 42 00 00       	push   $0x42b1
    1748:	6a 01                	push   $0x1
    174a:	e8 41 22 00 00       	call   3990 <printf>
    exit();
    174f:	e8 ee 20 00 00       	call   3842 <exit>
    printf(1, "open lf2 failed\n");
    1754:	53                   	push   %ebx
    1755:	53                   	push   %ebx
    1756:	68 a0 42 00 00       	push   $0x42a0
    175b:	6a 01                	push   $0x1
    175d:	e8 2e 22 00 00       	call   3990 <printf>
    exit();
    1762:	e8 db 20 00 00       	call   3842 <exit>
    printf(1, "unlinked lf1 but it is still there!\n");
    1767:	50                   	push   %eax
    1768:	50                   	push   %eax
    1769:	68 48 4e 00 00       	push   $0x4e48
    176e:	6a 01                	push   $0x1
    1770:	e8 1b 22 00 00       	call   3990 <printf>
    exit();
    1775:	e8 c8 20 00 00       	call   3842 <exit>
    printf(1, "link lf1 lf2 failed\n");
    177a:	51                   	push   %ecx
    177b:	51                   	push   %ecx
    177c:	68 8b 42 00 00       	push   $0x428b
    1781:	6a 01                	push   $0x1
    1783:	e8 08 22 00 00       	call   3990 <printf>
    exit();
    1788:	e8 b5 20 00 00       	call   3842 <exit>
    printf(1, "write lf1 failed\n");
    178d:	50                   	push   %eax
    178e:	50                   	push   %eax
    178f:	68 79 42 00 00       	push   $0x4279
    1794:	6a 01                	push   $0x1
    1796:	e8 f5 21 00 00       	call   3990 <printf>
    exit();
    179b:	e8 a2 20 00 00       	call   3842 <exit>

000017a0 <concreate>:
{
    17a0:	55                   	push   %ebp
    17a1:	89 e5                	mov    %esp,%ebp
    17a3:	57                   	push   %edi
    17a4:	56                   	push   %esi
    17a5:	53                   	push   %ebx
  for(i = 0; i < 40; i++){
    17a6:	31 f6                	xor    %esi,%esi
    17a8:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    if(pid && (i % 3) == 1){
    17ab:	bf 56 55 55 55       	mov    $0x55555556,%edi
{
    17b0:	83 ec 64             	sub    $0x64,%esp
  printf(1, "concreate test\n");
    17b3:	68 09 43 00 00       	push   $0x4309
    17b8:	6a 01                	push   $0x1
    17ba:	e8 d1 21 00 00       	call   3990 <printf>
  file[0] = 'C';
    17bf:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    17c3:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    17c7:	83 c4 10             	add    $0x10,%esp
    17ca:	eb 51                	jmp    181d <concreate+0x7d>
    17cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid && (i % 3) == 1){
    17d0:	89 f0                	mov    %esi,%eax
    17d2:	89 f1                	mov    %esi,%ecx
    17d4:	f7 ef                	imul   %edi
    17d6:	89 f0                	mov    %esi,%eax
    17d8:	c1 f8 1f             	sar    $0x1f,%eax
    17db:	29 c2                	sub    %eax,%edx
    17dd:	8d 04 52             	lea    (%edx,%edx,2),%eax
    17e0:	29 c1                	sub    %eax,%ecx
    17e2:	83 f9 01             	cmp    $0x1,%ecx
    17e5:	0f 84 b5 00 00 00    	je     18a0 <concreate+0x100>
      fd = open(file, O_CREATE | O_RDWR);
    17eb:	83 ec 08             	sub    $0x8,%esp
    17ee:	68 02 02 00 00       	push   $0x202
    17f3:	53                   	push   %ebx
    17f4:	e8 89 20 00 00       	call   3882 <open>
      if(fd < 0){
    17f9:	83 c4 10             	add    $0x10,%esp
    17fc:	85 c0                	test   %eax,%eax
    17fe:	78 6d                	js     186d <concreate+0xcd>
      close(fd);
    1800:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 40; i++){
    1803:	83 c6 01             	add    $0x1,%esi
      close(fd);
    1806:	50                   	push   %eax
    1807:	e8 5e 20 00 00       	call   386a <close>
    180c:	83 c4 10             	add    $0x10,%esp
      wait();
    180f:	e8 36 20 00 00       	call   384a <wait>
  for(i = 0; i < 40; i++){
    1814:	83 fe 28             	cmp    $0x28,%esi
    1817:	0f 84 ab 00 00 00    	je     18c8 <concreate+0x128>
    unlink(file);
    181d:	83 ec 0c             	sub    $0xc,%esp
    file[1] = '0' + i;
    1820:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    1823:	53                   	push   %ebx
    file[1] = '0' + i;
    1824:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    1827:	e8 66 20 00 00       	call   3892 <unlink>
    pid = fork();
    182c:	e8 09 20 00 00       	call   383a <fork>
    if(pid && (i % 3) == 1){
    1831:	83 c4 10             	add    $0x10,%esp
    1834:	85 c0                	test   %eax,%eax
    1836:	75 98                	jne    17d0 <concreate+0x30>
    } else if(pid == 0 && (i % 5) == 1){
    1838:	89 f0                	mov    %esi,%eax
    183a:	ba 67 66 66 66       	mov    $0x66666667,%edx
    183f:	f7 ea                	imul   %edx
    1841:	89 f0                	mov    %esi,%eax
    1843:	c1 f8 1f             	sar    $0x1f,%eax
    1846:	d1 fa                	sar    %edx
    1848:	29 c2                	sub    %eax,%edx
    184a:	8d 04 92             	lea    (%edx,%edx,4),%eax
    184d:	29 c6                	sub    %eax,%esi
    184f:	83 fe 01             	cmp    $0x1,%esi
    1852:	74 34                	je     1888 <concreate+0xe8>
      fd = open(file, O_CREATE | O_RDWR);
    1854:	83 ec 08             	sub    $0x8,%esp
    1857:	68 02 02 00 00       	push   $0x202
    185c:	53                   	push   %ebx
    185d:	e8 20 20 00 00       	call   3882 <open>
      if(fd < 0){
    1862:	83 c4 10             	add    $0x10,%esp
    1865:	85 c0                	test   %eax,%eax
    1867:	0f 89 32 02 00 00    	jns    1a9f <concreate+0x2ff>
        printf(1, "concreate create %s failed\n", file);
    186d:	83 ec 04             	sub    $0x4,%esp
    1870:	53                   	push   %ebx
    1871:	68 1c 43 00 00       	push   $0x431c
    1876:	6a 01                	push   $0x1
    1878:	e8 13 21 00 00       	call   3990 <printf>
        exit();
    187d:	e8 c0 1f 00 00       	call   3842 <exit>
    1882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      link("C0", file);
    1888:	83 ec 08             	sub    $0x8,%esp
    188b:	53                   	push   %ebx
    188c:	68 19 43 00 00       	push   $0x4319
    1891:	e8 0c 20 00 00       	call   38a2 <link>
    1896:	83 c4 10             	add    $0x10,%esp
      exit();
    1899:	e8 a4 1f 00 00       	call   3842 <exit>
    189e:	66 90                	xchg   %ax,%ax
      link("C0", file);
    18a0:	83 ec 08             	sub    $0x8,%esp
  for(i = 0; i < 40; i++){
    18a3:	83 c6 01             	add    $0x1,%esi
      link("C0", file);
    18a6:	53                   	push   %ebx
    18a7:	68 19 43 00 00       	push   $0x4319
    18ac:	e8 f1 1f 00 00       	call   38a2 <link>
    18b1:	83 c4 10             	add    $0x10,%esp
      wait();
    18b4:	e8 91 1f 00 00       	call   384a <wait>
  for(i = 0; i < 40; i++){
    18b9:	83 fe 28             	cmp    $0x28,%esi
    18bc:	0f 85 5b ff ff ff    	jne    181d <concreate+0x7d>
    18c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  memset(fa, 0, sizeof(fa));
    18c8:	8d 45 c0             	lea    -0x40(%ebp),%eax
    18cb:	83 ec 04             	sub    $0x4,%esp
    18ce:	8d 7d b0             	lea    -0x50(%ebp),%edi
    18d1:	6a 28                	push   $0x28
    18d3:	6a 00                	push   $0x0
    18d5:	50                   	push   %eax
    18d6:	e8 d5 1d 00 00       	call   36b0 <memset>
  fd = open(".", 0);
    18db:	59                   	pop    %ecx
    18dc:	5e                   	pop    %esi
    18dd:	6a 00                	push   $0x0
    18df:	68 26 45 00 00       	push   $0x4526
    18e4:	e8 99 1f 00 00       	call   3882 <open>
  while(read(fd, &de, sizeof(de)) > 0){
    18e9:	83 c4 10             	add    $0x10,%esp
  fd = open(".", 0);
    18ec:	89 c6                	mov    %eax,%esi
  n = 0;
    18ee:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    18f5:	8d 76 00             	lea    0x0(%esi),%esi
  while(read(fd, &de, sizeof(de)) > 0){
    18f8:	83 ec 04             	sub    $0x4,%esp
    18fb:	6a 10                	push   $0x10
    18fd:	57                   	push   %edi
    18fe:	56                   	push   %esi
    18ff:	e8 56 1f 00 00       	call   385a <read>
    1904:	83 c4 10             	add    $0x10,%esp
    1907:	85 c0                	test   %eax,%eax
    1909:	7e 3d                	jle    1948 <concreate+0x1a8>
    if(de.inum == 0)
    190b:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1910:	74 e6                	je     18f8 <concreate+0x158>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1912:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    1916:	75 e0                	jne    18f8 <concreate+0x158>
    1918:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    191c:	75 da                	jne    18f8 <concreate+0x158>
      i = de.name[1] - '0';
    191e:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    1922:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    1925:	83 f8 27             	cmp    $0x27,%eax
    1928:	0f 87 59 01 00 00    	ja     1a87 <concreate+0x2e7>
      if(fa[i]){
    192e:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    1933:	0f 85 36 01 00 00    	jne    1a6f <concreate+0x2cf>
      fa[i] = 1;
    1939:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    193e:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    1942:	eb b4                	jmp    18f8 <concreate+0x158>
    1944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  close(fd);
    1948:	83 ec 0c             	sub    $0xc,%esp
    194b:	56                   	push   %esi
    194c:	e8 19 1f 00 00       	call   386a <close>
  if(n != 40){
    1951:	83 c4 10             	add    $0x10,%esp
    1954:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    1958:	0f 85 fd 00 00 00    	jne    1a5b <concreate+0x2bb>
    195e:	31 f6                	xor    %esi,%esi
    1960:	eb 70                	jmp    19d2 <concreate+0x232>
    1962:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
       ((i % 3) == 1 && pid != 0)){
    1968:	83 fa 01             	cmp    $0x1,%edx
    196b:	0f 85 99 00 00 00    	jne    1a0a <concreate+0x26a>
      close(open(file, 0));
    1971:	83 ec 08             	sub    $0x8,%esp
    1974:	6a 00                	push   $0x0
    1976:	53                   	push   %ebx
    1977:	e8 06 1f 00 00       	call   3882 <open>
    197c:	89 04 24             	mov    %eax,(%esp)
    197f:	e8 e6 1e 00 00       	call   386a <close>
      close(open(file, 0));
    1984:	58                   	pop    %eax
    1985:	5a                   	pop    %edx
    1986:	6a 00                	push   $0x0
    1988:	53                   	push   %ebx
    1989:	e8 f4 1e 00 00       	call   3882 <open>
    198e:	89 04 24             	mov    %eax,(%esp)
    1991:	e8 d4 1e 00 00       	call   386a <close>
      close(open(file, 0));
    1996:	59                   	pop    %ecx
    1997:	58                   	pop    %eax
    1998:	6a 00                	push   $0x0
    199a:	53                   	push   %ebx
    199b:	e8 e2 1e 00 00       	call   3882 <open>
    19a0:	89 04 24             	mov    %eax,(%esp)
    19a3:	e8 c2 1e 00 00       	call   386a <close>
      close(open(file, 0));
    19a8:	58                   	pop    %eax
    19a9:	5a                   	pop    %edx
    19aa:	6a 00                	push   $0x0
    19ac:	53                   	push   %ebx
    19ad:	e8 d0 1e 00 00       	call   3882 <open>
    19b2:	89 04 24             	mov    %eax,(%esp)
    19b5:	e8 b0 1e 00 00       	call   386a <close>
    19ba:	83 c4 10             	add    $0x10,%esp
    if(pid == 0)
    19bd:	85 ff                	test   %edi,%edi
    19bf:	0f 84 d4 fe ff ff    	je     1899 <concreate+0xf9>
  for(i = 0; i < 40; i++){
    19c5:	83 c6 01             	add    $0x1,%esi
      wait();
    19c8:	e8 7d 1e 00 00       	call   384a <wait>
  for(i = 0; i < 40; i++){
    19cd:	83 fe 28             	cmp    $0x28,%esi
    19d0:	74 5e                	je     1a30 <concreate+0x290>
    file[1] = '0' + i;
    19d2:	8d 46 30             	lea    0x30(%esi),%eax
    19d5:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    19d8:	e8 5d 1e 00 00       	call   383a <fork>
    if(pid < 0){
    19dd:	85 c0                	test   %eax,%eax
    pid = fork();
    19df:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    19e1:	78 64                	js     1a47 <concreate+0x2a7>
    if(((i % 3) == 0 && pid == 0) ||
    19e3:	b8 56 55 55 55       	mov    $0x55555556,%eax
    19e8:	f7 ee                	imul   %esi
    19ea:	89 f0                	mov    %esi,%eax
    19ec:	c1 f8 1f             	sar    $0x1f,%eax
    19ef:	29 c2                	sub    %eax,%edx
    19f1:	8d 04 52             	lea    (%edx,%edx,2),%eax
    19f4:	89 f2                	mov    %esi,%edx
    19f6:	29 c2                	sub    %eax,%edx
    19f8:	89 f8                	mov    %edi,%eax
    19fa:	09 d0                	or     %edx,%eax
    19fc:	0f 84 6f ff ff ff    	je     1971 <concreate+0x1d1>
       ((i % 3) == 1 && pid != 0)){
    1a02:	85 ff                	test   %edi,%edi
    1a04:	0f 85 5e ff ff ff    	jne    1968 <concreate+0x1c8>
      unlink(file);
    1a0a:	83 ec 0c             	sub    $0xc,%esp
    1a0d:	53                   	push   %ebx
    1a0e:	e8 7f 1e 00 00       	call   3892 <unlink>
      unlink(file);
    1a13:	89 1c 24             	mov    %ebx,(%esp)
    1a16:	e8 77 1e 00 00       	call   3892 <unlink>
      unlink(file);
    1a1b:	89 1c 24             	mov    %ebx,(%esp)
    1a1e:	e8 6f 1e 00 00       	call   3892 <unlink>
      unlink(file);
    1a23:	89 1c 24             	mov    %ebx,(%esp)
    1a26:	e8 67 1e 00 00       	call   3892 <unlink>
    1a2b:	83 c4 10             	add    $0x10,%esp
    1a2e:	eb 8d                	jmp    19bd <concreate+0x21d>
  printf(1, "concreate ok\n");
    1a30:	83 ec 08             	sub    $0x8,%esp
    1a33:	68 6e 43 00 00       	push   $0x436e
    1a38:	6a 01                	push   $0x1
    1a3a:	e8 51 1f 00 00       	call   3990 <printf>
}
    1a3f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1a42:	5b                   	pop    %ebx
    1a43:	5e                   	pop    %esi
    1a44:	5f                   	pop    %edi
    1a45:	5d                   	pop    %ebp
    1a46:	c3                   	ret    
      printf(1, "fork failed\n");
    1a47:	83 ec 08             	sub    $0x8,%esp
    1a4a:	68 f1 4b 00 00       	push   $0x4bf1
    1a4f:	6a 01                	push   $0x1
    1a51:	e8 3a 1f 00 00       	call   3990 <printf>
      exit();
    1a56:	e8 e7 1d 00 00       	call   3842 <exit>
    printf(1, "concreate not enough files in directory listing\n");
    1a5b:	83 ec 08             	sub    $0x8,%esp
    1a5e:	68 94 4e 00 00       	push   $0x4e94
    1a63:	6a 01                	push   $0x1
    1a65:	e8 26 1f 00 00       	call   3990 <printf>
    exit();
    1a6a:	e8 d3 1d 00 00       	call   3842 <exit>
        printf(1, "concreate duplicate file %s\n", de.name);
    1a6f:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1a72:	83 ec 04             	sub    $0x4,%esp
    1a75:	50                   	push   %eax
    1a76:	68 51 43 00 00       	push   $0x4351
    1a7b:	6a 01                	push   $0x1
    1a7d:	e8 0e 1f 00 00       	call   3990 <printf>
        exit();
    1a82:	e8 bb 1d 00 00       	call   3842 <exit>
        printf(1, "concreate weird file %s\n", de.name);
    1a87:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1a8a:	83 ec 04             	sub    $0x4,%esp
    1a8d:	50                   	push   %eax
    1a8e:	68 38 43 00 00       	push   $0x4338
    1a93:	6a 01                	push   $0x1
    1a95:	e8 f6 1e 00 00       	call   3990 <printf>
        exit();
    1a9a:	e8 a3 1d 00 00       	call   3842 <exit>
      close(fd);
    1a9f:	83 ec 0c             	sub    $0xc,%esp
    1aa2:	50                   	push   %eax
    1aa3:	e8 c2 1d 00 00       	call   386a <close>
    1aa8:	83 c4 10             	add    $0x10,%esp
    1aab:	e9 e9 fd ff ff       	jmp    1899 <concreate+0xf9>

00001ab0 <linkunlink>:
{
    1ab0:	55                   	push   %ebp
    1ab1:	89 e5                	mov    %esp,%ebp
    1ab3:	57                   	push   %edi
    1ab4:	56                   	push   %esi
    1ab5:	53                   	push   %ebx
    1ab6:	83 ec 24             	sub    $0x24,%esp
  printf(1, "linkunlink test\n");
    1ab9:	68 7c 43 00 00       	push   $0x437c
    1abe:	6a 01                	push   $0x1
    1ac0:	e8 cb 1e 00 00       	call   3990 <printf>
  unlink("x");
    1ac5:	c7 04 24 09 46 00 00 	movl   $0x4609,(%esp)
    1acc:	e8 c1 1d 00 00       	call   3892 <unlink>
  pid = fork();
    1ad1:	e8 64 1d 00 00       	call   383a <fork>
  if(pid < 0){
    1ad6:	83 c4 10             	add    $0x10,%esp
    1ad9:	85 c0                	test   %eax,%eax
  pid = fork();
    1adb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1ade:	0f 88 b6 00 00 00    	js     1b9a <linkunlink+0xea>
  unsigned int x = (pid ? 1 : 97);
    1ae4:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1ae8:	bb 64 00 00 00       	mov    $0x64,%ebx
    if((x % 3) == 0){
    1aed:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  unsigned int x = (pid ? 1 : 97);
    1af2:	19 ff                	sbb    %edi,%edi
    1af4:	83 e7 60             	and    $0x60,%edi
    1af7:	83 c7 01             	add    $0x1,%edi
    1afa:	eb 1e                	jmp    1b1a <linkunlink+0x6a>
    1afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if((x % 3) == 1){
    1b00:	83 fa 01             	cmp    $0x1,%edx
    1b03:	74 7b                	je     1b80 <linkunlink+0xd0>
      unlink("x");
    1b05:	83 ec 0c             	sub    $0xc,%esp
    1b08:	68 09 46 00 00       	push   $0x4609
    1b0d:	e8 80 1d 00 00       	call   3892 <unlink>
    1b12:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1b15:	83 eb 01             	sub    $0x1,%ebx
    1b18:	74 3d                	je     1b57 <linkunlink+0xa7>
    x = x * 1103515245 + 12345;
    1b1a:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1b20:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    1b26:	89 f8                	mov    %edi,%eax
    1b28:	f7 e6                	mul    %esi
    1b2a:	d1 ea                	shr    %edx
    1b2c:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1b2f:	89 fa                	mov    %edi,%edx
    1b31:	29 c2                	sub    %eax,%edx
    1b33:	75 cb                	jne    1b00 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    1b35:	83 ec 08             	sub    $0x8,%esp
    1b38:	68 02 02 00 00       	push   $0x202
    1b3d:	68 09 46 00 00       	push   $0x4609
    1b42:	e8 3b 1d 00 00       	call   3882 <open>
    1b47:	89 04 24             	mov    %eax,(%esp)
    1b4a:	e8 1b 1d 00 00       	call   386a <close>
    1b4f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1b52:	83 eb 01             	sub    $0x1,%ebx
    1b55:	75 c3                	jne    1b1a <linkunlink+0x6a>
  if(pid)
    1b57:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b5a:	85 c0                	test   %eax,%eax
    1b5c:	74 50                	je     1bae <linkunlink+0xfe>
    wait();
    1b5e:	e8 e7 1c 00 00       	call   384a <wait>
  printf(1, "linkunlink ok\n");
    1b63:	83 ec 08             	sub    $0x8,%esp
    1b66:	68 91 43 00 00       	push   $0x4391
    1b6b:	6a 01                	push   $0x1
    1b6d:	e8 1e 1e 00 00       	call   3990 <printf>
}
    1b72:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1b75:	5b                   	pop    %ebx
    1b76:	5e                   	pop    %esi
    1b77:	5f                   	pop    %edi
    1b78:	5d                   	pop    %ebp
    1b79:	c3                   	ret    
    1b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      link("cat", "x");
    1b80:	83 ec 08             	sub    $0x8,%esp
    1b83:	68 09 46 00 00       	push   $0x4609
    1b88:	68 8d 43 00 00       	push   $0x438d
    1b8d:	e8 10 1d 00 00       	call   38a2 <link>
    1b92:	83 c4 10             	add    $0x10,%esp
    1b95:	e9 7b ff ff ff       	jmp    1b15 <linkunlink+0x65>
    printf(1, "fork failed\n");
    1b9a:	83 ec 08             	sub    $0x8,%esp
    1b9d:	68 f1 4b 00 00       	push   $0x4bf1
    1ba2:	6a 01                	push   $0x1
    1ba4:	e8 e7 1d 00 00       	call   3990 <printf>
    exit();
    1ba9:	e8 94 1c 00 00       	call   3842 <exit>
    exit();
    1bae:	e8 8f 1c 00 00       	call   3842 <exit>
    1bb3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001bc0 <bigdir>:
{
    1bc0:	55                   	push   %ebp
    1bc1:	89 e5                	mov    %esp,%ebp
    1bc3:	57                   	push   %edi
    1bc4:	56                   	push   %esi
    1bc5:	53                   	push   %ebx
    1bc6:	83 ec 24             	sub    $0x24,%esp
  printf(1, "bigdir test\n");
    1bc9:	68 a0 43 00 00       	push   $0x43a0
    1bce:	6a 01                	push   $0x1
    1bd0:	e8 bb 1d 00 00       	call   3990 <printf>
  unlink("bd");
    1bd5:	c7 04 24 ad 43 00 00 	movl   $0x43ad,(%esp)
    1bdc:	e8 b1 1c 00 00       	call   3892 <unlink>
  fd = open("bd", O_CREATE);
    1be1:	58                   	pop    %eax
    1be2:	5a                   	pop    %edx
    1be3:	68 00 02 00 00       	push   $0x200
    1be8:	68 ad 43 00 00       	push   $0x43ad
    1bed:	e8 90 1c 00 00       	call   3882 <open>
  if(fd < 0){
    1bf2:	83 c4 10             	add    $0x10,%esp
    1bf5:	85 c0                	test   %eax,%eax
    1bf7:	0f 88 de 00 00 00    	js     1cdb <bigdir+0x11b>
  close(fd);
    1bfd:	83 ec 0c             	sub    $0xc,%esp
    1c00:	8d 7d de             	lea    -0x22(%ebp),%edi
  for(i = 0; i < 500; i++){
    1c03:	31 f6                	xor    %esi,%esi
  close(fd);
    1c05:	50                   	push   %eax
    1c06:	e8 5f 1c 00 00       	call   386a <close>
    1c0b:	83 c4 10             	add    $0x10,%esp
    1c0e:	66 90                	xchg   %ax,%ax
    name[1] = '0' + (i / 64);
    1c10:	89 f0                	mov    %esi,%eax
    if(link("bd", name) != 0){
    1c12:	83 ec 08             	sub    $0x8,%esp
    name[0] = 'x';
    1c15:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1c19:	c1 f8 06             	sar    $0x6,%eax
    if(link("bd", name) != 0){
    1c1c:	57                   	push   %edi
    1c1d:	68 ad 43 00 00       	push   $0x43ad
    name[1] = '0' + (i / 64);
    1c22:	83 c0 30             	add    $0x30,%eax
    name[3] = '\0';
    1c25:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[1] = '0' + (i / 64);
    1c29:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1c2c:	89 f0                	mov    %esi,%eax
    1c2e:	83 e0 3f             	and    $0x3f,%eax
    1c31:	83 c0 30             	add    $0x30,%eax
    1c34:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(link("bd", name) != 0){
    1c37:	e8 66 1c 00 00       	call   38a2 <link>
    1c3c:	83 c4 10             	add    $0x10,%esp
    1c3f:	85 c0                	test   %eax,%eax
    1c41:	89 c3                	mov    %eax,%ebx
    1c43:	75 6e                	jne    1cb3 <bigdir+0xf3>
  for(i = 0; i < 500; i++){
    1c45:	83 c6 01             	add    $0x1,%esi
    1c48:	81 fe f4 01 00 00    	cmp    $0x1f4,%esi
    1c4e:	75 c0                	jne    1c10 <bigdir+0x50>
  unlink("bd");
    1c50:	83 ec 0c             	sub    $0xc,%esp
    1c53:	68 ad 43 00 00       	push   $0x43ad
    1c58:	e8 35 1c 00 00       	call   3892 <unlink>
    1c5d:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + (i / 64);
    1c60:	89 d8                	mov    %ebx,%eax
    if(unlink(name) != 0){
    1c62:	83 ec 0c             	sub    $0xc,%esp
    name[0] = 'x';
    1c65:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1c69:	c1 f8 06             	sar    $0x6,%eax
    if(unlink(name) != 0){
    1c6c:	57                   	push   %edi
    name[3] = '\0';
    1c6d:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[1] = '0' + (i / 64);
    1c71:	83 c0 30             	add    $0x30,%eax
    1c74:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1c77:	89 d8                	mov    %ebx,%eax
    1c79:	83 e0 3f             	and    $0x3f,%eax
    1c7c:	83 c0 30             	add    $0x30,%eax
    1c7f:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(unlink(name) != 0){
    1c82:	e8 0b 1c 00 00       	call   3892 <unlink>
    1c87:	83 c4 10             	add    $0x10,%esp
    1c8a:	85 c0                	test   %eax,%eax
    1c8c:	75 39                	jne    1cc7 <bigdir+0x107>
  for(i = 0; i < 500; i++){
    1c8e:	83 c3 01             	add    $0x1,%ebx
    1c91:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1c97:	75 c7                	jne    1c60 <bigdir+0xa0>
  printf(1, "bigdir ok\n");
    1c99:	83 ec 08             	sub    $0x8,%esp
    1c9c:	68 ef 43 00 00       	push   $0x43ef
    1ca1:	6a 01                	push   $0x1
    1ca3:	e8 e8 1c 00 00       	call   3990 <printf>
}
    1ca8:	83 c4 10             	add    $0x10,%esp
    1cab:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1cae:	5b                   	pop    %ebx
    1caf:	5e                   	pop    %esi
    1cb0:	5f                   	pop    %edi
    1cb1:	5d                   	pop    %ebp
    1cb2:	c3                   	ret    
      printf(1, "bigdir link failed\n");
    1cb3:	83 ec 08             	sub    $0x8,%esp
    1cb6:	68 c6 43 00 00       	push   $0x43c6
    1cbb:	6a 01                	push   $0x1
    1cbd:	e8 ce 1c 00 00       	call   3990 <printf>
      exit();
    1cc2:	e8 7b 1b 00 00       	call   3842 <exit>
      printf(1, "bigdir unlink failed");
    1cc7:	83 ec 08             	sub    $0x8,%esp
    1cca:	68 da 43 00 00       	push   $0x43da
    1ccf:	6a 01                	push   $0x1
    1cd1:	e8 ba 1c 00 00       	call   3990 <printf>
      exit();
    1cd6:	e8 67 1b 00 00       	call   3842 <exit>
    printf(1, "bigdir create failed\n");
    1cdb:	83 ec 08             	sub    $0x8,%esp
    1cde:	68 b0 43 00 00       	push   $0x43b0
    1ce3:	6a 01                	push   $0x1
    1ce5:	e8 a6 1c 00 00       	call   3990 <printf>
    exit();
    1cea:	e8 53 1b 00 00       	call   3842 <exit>
    1cef:	90                   	nop

00001cf0 <subdir>:
{
    1cf0:	55                   	push   %ebp
    1cf1:	89 e5                	mov    %esp,%ebp
    1cf3:	53                   	push   %ebx
    1cf4:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "subdir test\n");
    1cf7:	68 fa 43 00 00       	push   $0x43fa
    1cfc:	6a 01                	push   $0x1
    1cfe:	e8 8d 1c 00 00       	call   3990 <printf>
  unlink("ff");
    1d03:	c7 04 24 83 44 00 00 	movl   $0x4483,(%esp)
    1d0a:	e8 83 1b 00 00       	call   3892 <unlink>
  if(mkdir("dd") != 0){
    1d0f:	c7 04 24 20 45 00 00 	movl   $0x4520,(%esp)
    1d16:	e8 8f 1b 00 00       	call   38aa <mkdir>
    1d1b:	83 c4 10             	add    $0x10,%esp
    1d1e:	85 c0                	test   %eax,%eax
    1d20:	0f 85 b3 05 00 00    	jne    22d9 <subdir+0x5e9>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d26:	83 ec 08             	sub    $0x8,%esp
    1d29:	68 02 02 00 00       	push   $0x202
    1d2e:	68 59 44 00 00       	push   $0x4459
    1d33:	e8 4a 1b 00 00       	call   3882 <open>
  if(fd < 0){
    1d38:	83 c4 10             	add    $0x10,%esp
    1d3b:	85 c0                	test   %eax,%eax
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d3d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1d3f:	0f 88 81 05 00 00    	js     22c6 <subdir+0x5d6>
  write(fd, "ff", 2);
    1d45:	83 ec 04             	sub    $0x4,%esp
    1d48:	6a 02                	push   $0x2
    1d4a:	68 83 44 00 00       	push   $0x4483
    1d4f:	50                   	push   %eax
    1d50:	e8 0d 1b 00 00       	call   3862 <write>
  close(fd);
    1d55:	89 1c 24             	mov    %ebx,(%esp)
    1d58:	e8 0d 1b 00 00       	call   386a <close>
  if(unlink("dd") >= 0){
    1d5d:	c7 04 24 20 45 00 00 	movl   $0x4520,(%esp)
    1d64:	e8 29 1b 00 00       	call   3892 <unlink>
    1d69:	83 c4 10             	add    $0x10,%esp
    1d6c:	85 c0                	test   %eax,%eax
    1d6e:	0f 89 3f 05 00 00    	jns    22b3 <subdir+0x5c3>
  if(mkdir("/dd/dd") != 0){
    1d74:	83 ec 0c             	sub    $0xc,%esp
    1d77:	68 34 44 00 00       	push   $0x4434
    1d7c:	e8 29 1b 00 00       	call   38aa <mkdir>
    1d81:	83 c4 10             	add    $0x10,%esp
    1d84:	85 c0                	test   %eax,%eax
    1d86:	0f 85 14 05 00 00    	jne    22a0 <subdir+0x5b0>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1d8c:	83 ec 08             	sub    $0x8,%esp
    1d8f:	68 02 02 00 00       	push   $0x202
    1d94:	68 56 44 00 00       	push   $0x4456
    1d99:	e8 e4 1a 00 00       	call   3882 <open>
  if(fd < 0){
    1d9e:	83 c4 10             	add    $0x10,%esp
    1da1:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1da3:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1da5:	0f 88 24 04 00 00    	js     21cf <subdir+0x4df>
  write(fd, "FF", 2);
    1dab:	83 ec 04             	sub    $0x4,%esp
    1dae:	6a 02                	push   $0x2
    1db0:	68 77 44 00 00       	push   $0x4477
    1db5:	50                   	push   %eax
    1db6:	e8 a7 1a 00 00       	call   3862 <write>
  close(fd);
    1dbb:	89 1c 24             	mov    %ebx,(%esp)
    1dbe:	e8 a7 1a 00 00       	call   386a <close>
  fd = open("dd/dd/../ff", 0);
    1dc3:	58                   	pop    %eax
    1dc4:	5a                   	pop    %edx
    1dc5:	6a 00                	push   $0x0
    1dc7:	68 7a 44 00 00       	push   $0x447a
    1dcc:	e8 b1 1a 00 00       	call   3882 <open>
  if(fd < 0){
    1dd1:	83 c4 10             	add    $0x10,%esp
    1dd4:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/../ff", 0);
    1dd6:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1dd8:	0f 88 de 03 00 00    	js     21bc <subdir+0x4cc>
  cc = read(fd, buf, sizeof(buf));
    1dde:	83 ec 04             	sub    $0x4,%esp
    1de1:	68 00 20 00 00       	push   $0x2000
    1de6:	68 e0 84 00 00       	push   $0x84e0
    1deb:	50                   	push   %eax
    1dec:	e8 69 1a 00 00       	call   385a <read>
  if(cc != 2 || buf[0] != 'f'){
    1df1:	83 c4 10             	add    $0x10,%esp
    1df4:	83 f8 02             	cmp    $0x2,%eax
    1df7:	0f 85 3a 03 00 00    	jne    2137 <subdir+0x447>
    1dfd:	80 3d e0 84 00 00 66 	cmpb   $0x66,0x84e0
    1e04:	0f 85 2d 03 00 00    	jne    2137 <subdir+0x447>
  close(fd);
    1e0a:	83 ec 0c             	sub    $0xc,%esp
    1e0d:	53                   	push   %ebx
    1e0e:	e8 57 1a 00 00       	call   386a <close>
  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1e13:	5b                   	pop    %ebx
    1e14:	58                   	pop    %eax
    1e15:	68 ba 44 00 00       	push   $0x44ba
    1e1a:	68 56 44 00 00       	push   $0x4456
    1e1f:	e8 7e 1a 00 00       	call   38a2 <link>
    1e24:	83 c4 10             	add    $0x10,%esp
    1e27:	85 c0                	test   %eax,%eax
    1e29:	0f 85 c6 03 00 00    	jne    21f5 <subdir+0x505>
  if(unlink("dd/dd/ff") != 0){
    1e2f:	83 ec 0c             	sub    $0xc,%esp
    1e32:	68 56 44 00 00       	push   $0x4456
    1e37:	e8 56 1a 00 00       	call   3892 <unlink>
    1e3c:	83 c4 10             	add    $0x10,%esp
    1e3f:	85 c0                	test   %eax,%eax
    1e41:	0f 85 16 03 00 00    	jne    215d <subdir+0x46d>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1e47:	83 ec 08             	sub    $0x8,%esp
    1e4a:	6a 00                	push   $0x0
    1e4c:	68 56 44 00 00       	push   $0x4456
    1e51:	e8 2c 1a 00 00       	call   3882 <open>
    1e56:	83 c4 10             	add    $0x10,%esp
    1e59:	85 c0                	test   %eax,%eax
    1e5b:	0f 89 2c 04 00 00    	jns    228d <subdir+0x59d>
  if(chdir("dd") != 0){
    1e61:	83 ec 0c             	sub    $0xc,%esp
    1e64:	68 20 45 00 00       	push   $0x4520
    1e69:	e8 44 1a 00 00       	call   38b2 <chdir>
    1e6e:	83 c4 10             	add    $0x10,%esp
    1e71:	85 c0                	test   %eax,%eax
    1e73:	0f 85 01 04 00 00    	jne    227a <subdir+0x58a>
  if(chdir("dd/../../dd") != 0){
    1e79:	83 ec 0c             	sub    $0xc,%esp
    1e7c:	68 ee 44 00 00       	push   $0x44ee
    1e81:	e8 2c 1a 00 00       	call   38b2 <chdir>
    1e86:	83 c4 10             	add    $0x10,%esp
    1e89:	85 c0                	test   %eax,%eax
    1e8b:	0f 85 b9 02 00 00    	jne    214a <subdir+0x45a>
  if(chdir("dd/../../../dd") != 0){
    1e91:	83 ec 0c             	sub    $0xc,%esp
    1e94:	68 14 45 00 00       	push   $0x4514
    1e99:	e8 14 1a 00 00       	call   38b2 <chdir>
    1e9e:	83 c4 10             	add    $0x10,%esp
    1ea1:	85 c0                	test   %eax,%eax
    1ea3:	0f 85 a1 02 00 00    	jne    214a <subdir+0x45a>
  if(chdir("./..") != 0){
    1ea9:	83 ec 0c             	sub    $0xc,%esp
    1eac:	68 23 45 00 00       	push   $0x4523
    1eb1:	e8 fc 19 00 00       	call   38b2 <chdir>
    1eb6:	83 c4 10             	add    $0x10,%esp
    1eb9:	85 c0                	test   %eax,%eax
    1ebb:	0f 85 21 03 00 00    	jne    21e2 <subdir+0x4f2>
  fd = open("dd/dd/ffff", 0);
    1ec1:	83 ec 08             	sub    $0x8,%esp
    1ec4:	6a 00                	push   $0x0
    1ec6:	68 ba 44 00 00       	push   $0x44ba
    1ecb:	e8 b2 19 00 00       	call   3882 <open>
  if(fd < 0){
    1ed0:	83 c4 10             	add    $0x10,%esp
    1ed3:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/ffff", 0);
    1ed5:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1ed7:	0f 88 e0 04 00 00    	js     23bd <subdir+0x6cd>
  if(read(fd, buf, sizeof(buf)) != 2){
    1edd:	83 ec 04             	sub    $0x4,%esp
    1ee0:	68 00 20 00 00       	push   $0x2000
    1ee5:	68 e0 84 00 00       	push   $0x84e0
    1eea:	50                   	push   %eax
    1eeb:	e8 6a 19 00 00       	call   385a <read>
    1ef0:	83 c4 10             	add    $0x10,%esp
    1ef3:	83 f8 02             	cmp    $0x2,%eax
    1ef6:	0f 85 ae 04 00 00    	jne    23aa <subdir+0x6ba>
  close(fd);
    1efc:	83 ec 0c             	sub    $0xc,%esp
    1eff:	53                   	push   %ebx
    1f00:	e8 65 19 00 00       	call   386a <close>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1f05:	59                   	pop    %ecx
    1f06:	5b                   	pop    %ebx
    1f07:	6a 00                	push   $0x0
    1f09:	68 56 44 00 00       	push   $0x4456
    1f0e:	e8 6f 19 00 00       	call   3882 <open>
    1f13:	83 c4 10             	add    $0x10,%esp
    1f16:	85 c0                	test   %eax,%eax
    1f18:	0f 89 65 02 00 00    	jns    2183 <subdir+0x493>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1f1e:	83 ec 08             	sub    $0x8,%esp
    1f21:	68 02 02 00 00       	push   $0x202
    1f26:	68 6e 45 00 00       	push   $0x456e
    1f2b:	e8 52 19 00 00       	call   3882 <open>
    1f30:	83 c4 10             	add    $0x10,%esp
    1f33:	85 c0                	test   %eax,%eax
    1f35:	0f 89 35 02 00 00    	jns    2170 <subdir+0x480>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1f3b:	83 ec 08             	sub    $0x8,%esp
    1f3e:	68 02 02 00 00       	push   $0x202
    1f43:	68 93 45 00 00       	push   $0x4593
    1f48:	e8 35 19 00 00       	call   3882 <open>
    1f4d:	83 c4 10             	add    $0x10,%esp
    1f50:	85 c0                	test   %eax,%eax
    1f52:	0f 89 0f 03 00 00    	jns    2267 <subdir+0x577>
  if(open("dd", O_CREATE) >= 0){
    1f58:	83 ec 08             	sub    $0x8,%esp
    1f5b:	68 00 02 00 00       	push   $0x200
    1f60:	68 20 45 00 00       	push   $0x4520
    1f65:	e8 18 19 00 00       	call   3882 <open>
    1f6a:	83 c4 10             	add    $0x10,%esp
    1f6d:	85 c0                	test   %eax,%eax
    1f6f:	0f 89 df 02 00 00    	jns    2254 <subdir+0x564>
  if(open("dd", O_RDWR) >= 0){
    1f75:	83 ec 08             	sub    $0x8,%esp
    1f78:	6a 02                	push   $0x2
    1f7a:	68 20 45 00 00       	push   $0x4520
    1f7f:	e8 fe 18 00 00       	call   3882 <open>
    1f84:	83 c4 10             	add    $0x10,%esp
    1f87:	85 c0                	test   %eax,%eax
    1f89:	0f 89 b2 02 00 00    	jns    2241 <subdir+0x551>
  if(open("dd", O_WRONLY) >= 0){
    1f8f:	83 ec 08             	sub    $0x8,%esp
    1f92:	6a 01                	push   $0x1
    1f94:	68 20 45 00 00       	push   $0x4520
    1f99:	e8 e4 18 00 00       	call   3882 <open>
    1f9e:	83 c4 10             	add    $0x10,%esp
    1fa1:	85 c0                	test   %eax,%eax
    1fa3:	0f 89 85 02 00 00    	jns    222e <subdir+0x53e>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1fa9:	83 ec 08             	sub    $0x8,%esp
    1fac:	68 02 46 00 00       	push   $0x4602
    1fb1:	68 6e 45 00 00       	push   $0x456e
    1fb6:	e8 e7 18 00 00       	call   38a2 <link>
    1fbb:	83 c4 10             	add    $0x10,%esp
    1fbe:	85 c0                	test   %eax,%eax
    1fc0:	0f 84 55 02 00 00    	je     221b <subdir+0x52b>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    1fc6:	83 ec 08             	sub    $0x8,%esp
    1fc9:	68 02 46 00 00       	push   $0x4602
    1fce:	68 93 45 00 00       	push   $0x4593
    1fd3:	e8 ca 18 00 00       	call   38a2 <link>
    1fd8:	83 c4 10             	add    $0x10,%esp
    1fdb:	85 c0                	test   %eax,%eax
    1fdd:	0f 84 25 02 00 00    	je     2208 <subdir+0x518>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    1fe3:	83 ec 08             	sub    $0x8,%esp
    1fe6:	68 ba 44 00 00       	push   $0x44ba
    1feb:	68 59 44 00 00       	push   $0x4459
    1ff0:	e8 ad 18 00 00       	call   38a2 <link>
    1ff5:	83 c4 10             	add    $0x10,%esp
    1ff8:	85 c0                	test   %eax,%eax
    1ffa:	0f 84 a9 01 00 00    	je     21a9 <subdir+0x4b9>
  if(mkdir("dd/ff/ff") == 0){
    2000:	83 ec 0c             	sub    $0xc,%esp
    2003:	68 6e 45 00 00       	push   $0x456e
    2008:	e8 9d 18 00 00       	call   38aa <mkdir>
    200d:	83 c4 10             	add    $0x10,%esp
    2010:	85 c0                	test   %eax,%eax
    2012:	0f 84 7e 01 00 00    	je     2196 <subdir+0x4a6>
  if(mkdir("dd/xx/ff") == 0){
    2018:	83 ec 0c             	sub    $0xc,%esp
    201b:	68 93 45 00 00       	push   $0x4593
    2020:	e8 85 18 00 00       	call   38aa <mkdir>
    2025:	83 c4 10             	add    $0x10,%esp
    2028:	85 c0                	test   %eax,%eax
    202a:	0f 84 67 03 00 00    	je     2397 <subdir+0x6a7>
  if(mkdir("dd/dd/ffff") == 0){
    2030:	83 ec 0c             	sub    $0xc,%esp
    2033:	68 ba 44 00 00       	push   $0x44ba
    2038:	e8 6d 18 00 00       	call   38aa <mkdir>
    203d:	83 c4 10             	add    $0x10,%esp
    2040:	85 c0                	test   %eax,%eax
    2042:	0f 84 3c 03 00 00    	je     2384 <subdir+0x694>
  if(unlink("dd/xx/ff") == 0){
    2048:	83 ec 0c             	sub    $0xc,%esp
    204b:	68 93 45 00 00       	push   $0x4593
    2050:	e8 3d 18 00 00       	call   3892 <unlink>
    2055:	83 c4 10             	add    $0x10,%esp
    2058:	85 c0                	test   %eax,%eax
    205a:	0f 84 11 03 00 00    	je     2371 <subdir+0x681>
  if(unlink("dd/ff/ff") == 0){
    2060:	83 ec 0c             	sub    $0xc,%esp
    2063:	68 6e 45 00 00       	push   $0x456e
    2068:	e8 25 18 00 00       	call   3892 <unlink>
    206d:	83 c4 10             	add    $0x10,%esp
    2070:	85 c0                	test   %eax,%eax
    2072:	0f 84 e6 02 00 00    	je     235e <subdir+0x66e>
  if(chdir("dd/ff") == 0){
    2078:	83 ec 0c             	sub    $0xc,%esp
    207b:	68 59 44 00 00       	push   $0x4459
    2080:	e8 2d 18 00 00       	call   38b2 <chdir>
    2085:	83 c4 10             	add    $0x10,%esp
    2088:	85 c0                	test   %eax,%eax
    208a:	0f 84 bb 02 00 00    	je     234b <subdir+0x65b>
  if(chdir("dd/xx") == 0){
    2090:	83 ec 0c             	sub    $0xc,%esp
    2093:	68 05 46 00 00       	push   $0x4605
    2098:	e8 15 18 00 00       	call   38b2 <chdir>
    209d:	83 c4 10             	add    $0x10,%esp
    20a0:	85 c0                	test   %eax,%eax
    20a2:	0f 84 90 02 00 00    	je     2338 <subdir+0x648>
  if(unlink("dd/dd/ffff") != 0){
    20a8:	83 ec 0c             	sub    $0xc,%esp
    20ab:	68 ba 44 00 00       	push   $0x44ba
    20b0:	e8 dd 17 00 00       	call   3892 <unlink>
    20b5:	83 c4 10             	add    $0x10,%esp
    20b8:	85 c0                	test   %eax,%eax
    20ba:	0f 85 9d 00 00 00    	jne    215d <subdir+0x46d>
  if(unlink("dd/ff") != 0){
    20c0:	83 ec 0c             	sub    $0xc,%esp
    20c3:	68 59 44 00 00       	push   $0x4459
    20c8:	e8 c5 17 00 00       	call   3892 <unlink>
    20cd:	83 c4 10             	add    $0x10,%esp
    20d0:	85 c0                	test   %eax,%eax
    20d2:	0f 85 4d 02 00 00    	jne    2325 <subdir+0x635>
  if(unlink("dd") == 0){
    20d8:	83 ec 0c             	sub    $0xc,%esp
    20db:	68 20 45 00 00       	push   $0x4520
    20e0:	e8 ad 17 00 00       	call   3892 <unlink>
    20e5:	83 c4 10             	add    $0x10,%esp
    20e8:	85 c0                	test   %eax,%eax
    20ea:	0f 84 22 02 00 00    	je     2312 <subdir+0x622>
  if(unlink("dd/dd") < 0){
    20f0:	83 ec 0c             	sub    $0xc,%esp
    20f3:	68 35 44 00 00       	push   $0x4435
    20f8:	e8 95 17 00 00       	call   3892 <unlink>
    20fd:	83 c4 10             	add    $0x10,%esp
    2100:	85 c0                	test   %eax,%eax
    2102:	0f 88 f7 01 00 00    	js     22ff <subdir+0x60f>
  if(unlink("dd") < 0){
    2108:	83 ec 0c             	sub    $0xc,%esp
    210b:	68 20 45 00 00       	push   $0x4520
    2110:	e8 7d 17 00 00       	call   3892 <unlink>
    2115:	83 c4 10             	add    $0x10,%esp
    2118:	85 c0                	test   %eax,%eax
    211a:	0f 88 cc 01 00 00    	js     22ec <subdir+0x5fc>
  printf(1, "subdir ok\n");
    2120:	83 ec 08             	sub    $0x8,%esp
    2123:	68 02 47 00 00       	push   $0x4702
    2128:	6a 01                	push   $0x1
    212a:	e8 61 18 00 00       	call   3990 <printf>
}
    212f:	83 c4 10             	add    $0x10,%esp
    2132:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2135:	c9                   	leave  
    2136:	c3                   	ret    
    printf(1, "dd/dd/../ff wrong content\n");
    2137:	50                   	push   %eax
    2138:	50                   	push   %eax
    2139:	68 9f 44 00 00       	push   $0x449f
    213e:	6a 01                	push   $0x1
    2140:	e8 4b 18 00 00       	call   3990 <printf>
    exit();
    2145:	e8 f8 16 00 00       	call   3842 <exit>
    printf(1, "chdir dd/../../dd failed\n");
    214a:	50                   	push   %eax
    214b:	50                   	push   %eax
    214c:	68 fa 44 00 00       	push   $0x44fa
    2151:	6a 01                	push   $0x1
    2153:	e8 38 18 00 00       	call   3990 <printf>
    exit();
    2158:	e8 e5 16 00 00       	call   3842 <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    215d:	52                   	push   %edx
    215e:	52                   	push   %edx
    215f:	68 c5 44 00 00       	push   $0x44c5
    2164:	6a 01                	push   $0x1
    2166:	e8 25 18 00 00       	call   3990 <printf>
    exit();
    216b:	e8 d2 16 00 00       	call   3842 <exit>
    printf(1, "create dd/ff/ff succeeded!\n");
    2170:	50                   	push   %eax
    2171:	50                   	push   %eax
    2172:	68 77 45 00 00       	push   $0x4577
    2177:	6a 01                	push   $0x1
    2179:	e8 12 18 00 00       	call   3990 <printf>
    exit();
    217e:	e8 bf 16 00 00       	call   3842 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    2183:	52                   	push   %edx
    2184:	52                   	push   %edx
    2185:	68 38 4f 00 00       	push   $0x4f38
    218a:	6a 01                	push   $0x1
    218c:	e8 ff 17 00 00       	call   3990 <printf>
    exit();
    2191:	e8 ac 16 00 00       	call   3842 <exit>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    2196:	52                   	push   %edx
    2197:	52                   	push   %edx
    2198:	68 0b 46 00 00       	push   $0x460b
    219d:	6a 01                	push   $0x1
    219f:	e8 ec 17 00 00       	call   3990 <printf>
    exit();
    21a4:	e8 99 16 00 00       	call   3842 <exit>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    21a9:	51                   	push   %ecx
    21aa:	51                   	push   %ecx
    21ab:	68 a8 4f 00 00       	push   $0x4fa8
    21b0:	6a 01                	push   $0x1
    21b2:	e8 d9 17 00 00       	call   3990 <printf>
    exit();
    21b7:	e8 86 16 00 00       	call   3842 <exit>
    printf(1, "open dd/dd/../ff failed\n");
    21bc:	50                   	push   %eax
    21bd:	50                   	push   %eax
    21be:	68 86 44 00 00       	push   $0x4486
    21c3:	6a 01                	push   $0x1
    21c5:	e8 c6 17 00 00       	call   3990 <printf>
    exit();
    21ca:	e8 73 16 00 00       	call   3842 <exit>
    printf(1, "create dd/dd/ff failed\n");
    21cf:	51                   	push   %ecx
    21d0:	51                   	push   %ecx
    21d1:	68 5f 44 00 00       	push   $0x445f
    21d6:	6a 01                	push   $0x1
    21d8:	e8 b3 17 00 00       	call   3990 <printf>
    exit();
    21dd:	e8 60 16 00 00       	call   3842 <exit>
    printf(1, "chdir ./.. failed\n");
    21e2:	50                   	push   %eax
    21e3:	50                   	push   %eax
    21e4:	68 28 45 00 00       	push   $0x4528
    21e9:	6a 01                	push   $0x1
    21eb:	e8 a0 17 00 00       	call   3990 <printf>
    exit();
    21f0:	e8 4d 16 00 00       	call   3842 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    21f5:	51                   	push   %ecx
    21f6:	51                   	push   %ecx
    21f7:	68 f0 4e 00 00       	push   $0x4ef0
    21fc:	6a 01                	push   $0x1
    21fe:	e8 8d 17 00 00       	call   3990 <printf>
    exit();
    2203:	e8 3a 16 00 00       	call   3842 <exit>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2208:	53                   	push   %ebx
    2209:	53                   	push   %ebx
    220a:	68 84 4f 00 00       	push   $0x4f84
    220f:	6a 01                	push   $0x1
    2211:	e8 7a 17 00 00       	call   3990 <printf>
    exit();
    2216:	e8 27 16 00 00       	call   3842 <exit>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    221b:	50                   	push   %eax
    221c:	50                   	push   %eax
    221d:	68 60 4f 00 00       	push   $0x4f60
    2222:	6a 01                	push   $0x1
    2224:	e8 67 17 00 00       	call   3990 <printf>
    exit();
    2229:	e8 14 16 00 00       	call   3842 <exit>
    printf(1, "open dd wronly succeeded!\n");
    222e:	50                   	push   %eax
    222f:	50                   	push   %eax
    2230:	68 e7 45 00 00       	push   $0x45e7
    2235:	6a 01                	push   $0x1
    2237:	e8 54 17 00 00       	call   3990 <printf>
    exit();
    223c:	e8 01 16 00 00       	call   3842 <exit>
    printf(1, "open dd rdwr succeeded!\n");
    2241:	50                   	push   %eax
    2242:	50                   	push   %eax
    2243:	68 ce 45 00 00       	push   $0x45ce
    2248:	6a 01                	push   $0x1
    224a:	e8 41 17 00 00       	call   3990 <printf>
    exit();
    224f:	e8 ee 15 00 00       	call   3842 <exit>
    printf(1, "create dd succeeded!\n");
    2254:	50                   	push   %eax
    2255:	50                   	push   %eax
    2256:	68 b8 45 00 00       	push   $0x45b8
    225b:	6a 01                	push   $0x1
    225d:	e8 2e 17 00 00       	call   3990 <printf>
    exit();
    2262:	e8 db 15 00 00       	call   3842 <exit>
    printf(1, "create dd/xx/ff succeeded!\n");
    2267:	50                   	push   %eax
    2268:	50                   	push   %eax
    2269:	68 9c 45 00 00       	push   $0x459c
    226e:	6a 01                	push   $0x1
    2270:	e8 1b 17 00 00       	call   3990 <printf>
    exit();
    2275:	e8 c8 15 00 00       	call   3842 <exit>
    printf(1, "chdir dd failed\n");
    227a:	50                   	push   %eax
    227b:	50                   	push   %eax
    227c:	68 dd 44 00 00       	push   $0x44dd
    2281:	6a 01                	push   $0x1
    2283:	e8 08 17 00 00       	call   3990 <printf>
    exit();
    2288:	e8 b5 15 00 00       	call   3842 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    228d:	50                   	push   %eax
    228e:	50                   	push   %eax
    228f:	68 14 4f 00 00       	push   $0x4f14
    2294:	6a 01                	push   $0x1
    2296:	e8 f5 16 00 00       	call   3990 <printf>
    exit();
    229b:	e8 a2 15 00 00       	call   3842 <exit>
    printf(1, "subdir mkdir dd/dd failed\n");
    22a0:	53                   	push   %ebx
    22a1:	53                   	push   %ebx
    22a2:	68 3b 44 00 00       	push   $0x443b
    22a7:	6a 01                	push   $0x1
    22a9:	e8 e2 16 00 00       	call   3990 <printf>
    exit();
    22ae:	e8 8f 15 00 00       	call   3842 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    22b3:	50                   	push   %eax
    22b4:	50                   	push   %eax
    22b5:	68 c8 4e 00 00       	push   $0x4ec8
    22ba:	6a 01                	push   $0x1
    22bc:	e8 cf 16 00 00       	call   3990 <printf>
    exit();
    22c1:	e8 7c 15 00 00       	call   3842 <exit>
    printf(1, "create dd/ff failed\n");
    22c6:	50                   	push   %eax
    22c7:	50                   	push   %eax
    22c8:	68 1f 44 00 00       	push   $0x441f
    22cd:	6a 01                	push   $0x1
    22cf:	e8 bc 16 00 00       	call   3990 <printf>
    exit();
    22d4:	e8 69 15 00 00       	call   3842 <exit>
    printf(1, "subdir mkdir dd failed\n");
    22d9:	50                   	push   %eax
    22da:	50                   	push   %eax
    22db:	68 07 44 00 00       	push   $0x4407
    22e0:	6a 01                	push   $0x1
    22e2:	e8 a9 16 00 00       	call   3990 <printf>
    exit();
    22e7:	e8 56 15 00 00       	call   3842 <exit>
    printf(1, "unlink dd failed\n");
    22ec:	50                   	push   %eax
    22ed:	50                   	push   %eax
    22ee:	68 f0 46 00 00       	push   $0x46f0
    22f3:	6a 01                	push   $0x1
    22f5:	e8 96 16 00 00       	call   3990 <printf>
    exit();
    22fa:	e8 43 15 00 00       	call   3842 <exit>
    printf(1, "unlink dd/dd failed\n");
    22ff:	52                   	push   %edx
    2300:	52                   	push   %edx
    2301:	68 db 46 00 00       	push   $0x46db
    2306:	6a 01                	push   $0x1
    2308:	e8 83 16 00 00       	call   3990 <printf>
    exit();
    230d:	e8 30 15 00 00       	call   3842 <exit>
    printf(1, "unlink non-empty dd succeeded!\n");
    2312:	51                   	push   %ecx
    2313:	51                   	push   %ecx
    2314:	68 cc 4f 00 00       	push   $0x4fcc
    2319:	6a 01                	push   $0x1
    231b:	e8 70 16 00 00       	call   3990 <printf>
    exit();
    2320:	e8 1d 15 00 00       	call   3842 <exit>
    printf(1, "unlink dd/ff failed\n");
    2325:	53                   	push   %ebx
    2326:	53                   	push   %ebx
    2327:	68 c6 46 00 00       	push   $0x46c6
    232c:	6a 01                	push   $0x1
    232e:	e8 5d 16 00 00       	call   3990 <printf>
    exit();
    2333:	e8 0a 15 00 00       	call   3842 <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    2338:	50                   	push   %eax
    2339:	50                   	push   %eax
    233a:	68 ae 46 00 00       	push   $0x46ae
    233f:	6a 01                	push   $0x1
    2341:	e8 4a 16 00 00       	call   3990 <printf>
    exit();
    2346:	e8 f7 14 00 00       	call   3842 <exit>
    printf(1, "chdir dd/ff succeeded!\n");
    234b:	50                   	push   %eax
    234c:	50                   	push   %eax
    234d:	68 96 46 00 00       	push   $0x4696
    2352:	6a 01                	push   $0x1
    2354:	e8 37 16 00 00       	call   3990 <printf>
    exit();
    2359:	e8 e4 14 00 00       	call   3842 <exit>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    235e:	50                   	push   %eax
    235f:	50                   	push   %eax
    2360:	68 7a 46 00 00       	push   $0x467a
    2365:	6a 01                	push   $0x1
    2367:	e8 24 16 00 00       	call   3990 <printf>
    exit();
    236c:	e8 d1 14 00 00       	call   3842 <exit>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    2371:	50                   	push   %eax
    2372:	50                   	push   %eax
    2373:	68 5e 46 00 00       	push   $0x465e
    2378:	6a 01                	push   $0x1
    237a:	e8 11 16 00 00       	call   3990 <printf>
    exit();
    237f:	e8 be 14 00 00       	call   3842 <exit>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    2384:	50                   	push   %eax
    2385:	50                   	push   %eax
    2386:	68 41 46 00 00       	push   $0x4641
    238b:	6a 01                	push   $0x1
    238d:	e8 fe 15 00 00       	call   3990 <printf>
    exit();
    2392:	e8 ab 14 00 00       	call   3842 <exit>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    2397:	50                   	push   %eax
    2398:	50                   	push   %eax
    2399:	68 26 46 00 00       	push   $0x4626
    239e:	6a 01                	push   $0x1
    23a0:	e8 eb 15 00 00       	call   3990 <printf>
    exit();
    23a5:	e8 98 14 00 00       	call   3842 <exit>
    printf(1, "read dd/dd/ffff wrong len\n");
    23aa:	50                   	push   %eax
    23ab:	50                   	push   %eax
    23ac:	68 53 45 00 00       	push   $0x4553
    23b1:	6a 01                	push   $0x1
    23b3:	e8 d8 15 00 00       	call   3990 <printf>
    exit();
    23b8:	e8 85 14 00 00       	call   3842 <exit>
    printf(1, "open dd/dd/ffff failed\n");
    23bd:	50                   	push   %eax
    23be:	50                   	push   %eax
    23bf:	68 3b 45 00 00       	push   $0x453b
    23c4:	6a 01                	push   $0x1
    23c6:	e8 c5 15 00 00       	call   3990 <printf>
    exit();
    23cb:	e8 72 14 00 00       	call   3842 <exit>

000023d0 <bigwrite>:
{
    23d0:	55                   	push   %ebp
    23d1:	89 e5                	mov    %esp,%ebp
    23d3:	56                   	push   %esi
    23d4:	53                   	push   %ebx
  for(sz = 499; sz < 12*512; sz += 471){
    23d5:	bb f3 01 00 00       	mov    $0x1f3,%ebx
  printf(1, "bigwrite test\n");
    23da:	83 ec 08             	sub    $0x8,%esp
    23dd:	68 0d 47 00 00       	push   $0x470d
    23e2:	6a 01                	push   $0x1
    23e4:	e8 a7 15 00 00       	call   3990 <printf>
  unlink("bigwrite");
    23e9:	c7 04 24 1c 47 00 00 	movl   $0x471c,(%esp)
    23f0:	e8 9d 14 00 00       	call   3892 <unlink>
    23f5:	83 c4 10             	add    $0x10,%esp
    23f8:	90                   	nop
    23f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2400:	83 ec 08             	sub    $0x8,%esp
    2403:	68 02 02 00 00       	push   $0x202
    2408:	68 1c 47 00 00       	push   $0x471c
    240d:	e8 70 14 00 00       	call   3882 <open>
    if(fd < 0){
    2412:	83 c4 10             	add    $0x10,%esp
    2415:	85 c0                	test   %eax,%eax
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2417:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    2419:	78 7e                	js     2499 <bigwrite+0xc9>
      int cc = write(fd, buf, sz);
    241b:	83 ec 04             	sub    $0x4,%esp
    241e:	53                   	push   %ebx
    241f:	68 e0 84 00 00       	push   $0x84e0
    2424:	50                   	push   %eax
    2425:	e8 38 14 00 00       	call   3862 <write>
      if(cc != sz){
    242a:	83 c4 10             	add    $0x10,%esp
    242d:	39 d8                	cmp    %ebx,%eax
    242f:	75 55                	jne    2486 <bigwrite+0xb6>
      int cc = write(fd, buf, sz);
    2431:	83 ec 04             	sub    $0x4,%esp
    2434:	53                   	push   %ebx
    2435:	68 e0 84 00 00       	push   $0x84e0
    243a:	56                   	push   %esi
    243b:	e8 22 14 00 00       	call   3862 <write>
      if(cc != sz){
    2440:	83 c4 10             	add    $0x10,%esp
    2443:	39 d8                	cmp    %ebx,%eax
    2445:	75 3f                	jne    2486 <bigwrite+0xb6>
    close(fd);
    2447:	83 ec 0c             	sub    $0xc,%esp
  for(sz = 499; sz < 12*512; sz += 471){
    244a:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
    close(fd);
    2450:	56                   	push   %esi
    2451:	e8 14 14 00 00       	call   386a <close>
    unlink("bigwrite");
    2456:	c7 04 24 1c 47 00 00 	movl   $0x471c,(%esp)
    245d:	e8 30 14 00 00       	call   3892 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    2462:	83 c4 10             	add    $0x10,%esp
    2465:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    246b:	75 93                	jne    2400 <bigwrite+0x30>
  printf(1, "bigwrite ok\n");
    246d:	83 ec 08             	sub    $0x8,%esp
    2470:	68 4f 47 00 00       	push   $0x474f
    2475:	6a 01                	push   $0x1
    2477:	e8 14 15 00 00       	call   3990 <printf>
}
    247c:	83 c4 10             	add    $0x10,%esp
    247f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    2482:	5b                   	pop    %ebx
    2483:	5e                   	pop    %esi
    2484:	5d                   	pop    %ebp
    2485:	c3                   	ret    
        printf(1, "write(%d) ret %d\n", sz, cc);
    2486:	50                   	push   %eax
    2487:	53                   	push   %ebx
    2488:	68 3d 47 00 00       	push   $0x473d
    248d:	6a 01                	push   $0x1
    248f:	e8 fc 14 00 00       	call   3990 <printf>
        exit();
    2494:	e8 a9 13 00 00       	call   3842 <exit>
      printf(1, "cannot create bigwrite\n");
    2499:	83 ec 08             	sub    $0x8,%esp
    249c:	68 25 47 00 00       	push   $0x4725
    24a1:	6a 01                	push   $0x1
    24a3:	e8 e8 14 00 00       	call   3990 <printf>
      exit();
    24a8:	e8 95 13 00 00       	call   3842 <exit>
    24ad:	8d 76 00             	lea    0x0(%esi),%esi

000024b0 <bigfile>:
{
    24b0:	55                   	push   %ebp
    24b1:	89 e5                	mov    %esp,%ebp
    24b3:	57                   	push   %edi
    24b4:	56                   	push   %esi
    24b5:	53                   	push   %ebx
    24b6:	83 ec 14             	sub    $0x14,%esp
  printf(1, "bigfile test\n");
    24b9:	68 5c 47 00 00       	push   $0x475c
    24be:	6a 01                	push   $0x1
    24c0:	e8 cb 14 00 00       	call   3990 <printf>
  unlink("bigfile");
    24c5:	c7 04 24 78 47 00 00 	movl   $0x4778,(%esp)
    24cc:	e8 c1 13 00 00       	call   3892 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    24d1:	5e                   	pop    %esi
    24d2:	5f                   	pop    %edi
    24d3:	68 02 02 00 00       	push   $0x202
    24d8:	68 78 47 00 00       	push   $0x4778
    24dd:	e8 a0 13 00 00       	call   3882 <open>
  if(fd < 0){
    24e2:	83 c4 10             	add    $0x10,%esp
    24e5:	85 c0                	test   %eax,%eax
    24e7:	0f 88 5f 01 00 00    	js     264c <bigfile+0x19c>
    24ed:	89 c6                	mov    %eax,%esi
    24ef:	31 db                	xor    %ebx,%ebx
    24f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    memset(buf, i, 600);
    24f8:	83 ec 04             	sub    $0x4,%esp
    24fb:	68 58 02 00 00       	push   $0x258
    2500:	53                   	push   %ebx
    2501:	68 e0 84 00 00       	push   $0x84e0
    2506:	e8 a5 11 00 00       	call   36b0 <memset>
    if(write(fd, buf, 600) != 600){
    250b:	83 c4 0c             	add    $0xc,%esp
    250e:	68 58 02 00 00       	push   $0x258
    2513:	68 e0 84 00 00       	push   $0x84e0
    2518:	56                   	push   %esi
    2519:	e8 44 13 00 00       	call   3862 <write>
    251e:	83 c4 10             	add    $0x10,%esp
    2521:	3d 58 02 00 00       	cmp    $0x258,%eax
    2526:	0f 85 f8 00 00 00    	jne    2624 <bigfile+0x174>
  for(i = 0; i < 20; i++){
    252c:	83 c3 01             	add    $0x1,%ebx
    252f:	83 fb 14             	cmp    $0x14,%ebx
    2532:	75 c4                	jne    24f8 <bigfile+0x48>
  close(fd);
    2534:	83 ec 0c             	sub    $0xc,%esp
    2537:	56                   	push   %esi
    2538:	e8 2d 13 00 00       	call   386a <close>
  fd = open("bigfile", 0);
    253d:	59                   	pop    %ecx
    253e:	5b                   	pop    %ebx
    253f:	6a 00                	push   $0x0
    2541:	68 78 47 00 00       	push   $0x4778
    2546:	e8 37 13 00 00       	call   3882 <open>
  if(fd < 0){
    254b:	83 c4 10             	add    $0x10,%esp
    254e:	85 c0                	test   %eax,%eax
  fd = open("bigfile", 0);
    2550:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    2552:	0f 88 e0 00 00 00    	js     2638 <bigfile+0x188>
    2558:	31 db                	xor    %ebx,%ebx
    255a:	31 ff                	xor    %edi,%edi
    255c:	eb 30                	jmp    258e <bigfile+0xde>
    255e:	66 90                	xchg   %ax,%ax
    if(cc != 300){
    2560:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    2565:	0f 85 91 00 00 00    	jne    25fc <bigfile+0x14c>
    if(buf[0] != i/2 || buf[299] != i/2){
    256b:	0f be 05 e0 84 00 00 	movsbl 0x84e0,%eax
    2572:	89 fa                	mov    %edi,%edx
    2574:	d1 fa                	sar    %edx
    2576:	39 d0                	cmp    %edx,%eax
    2578:	75 6e                	jne    25e8 <bigfile+0x138>
    257a:	0f be 15 0b 86 00 00 	movsbl 0x860b,%edx
    2581:	39 d0                	cmp    %edx,%eax
    2583:	75 63                	jne    25e8 <bigfile+0x138>
    total += cc;
    2585:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  for(i = 0; ; i++){
    258b:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    258e:	83 ec 04             	sub    $0x4,%esp
    2591:	68 2c 01 00 00       	push   $0x12c
    2596:	68 e0 84 00 00       	push   $0x84e0
    259b:	56                   	push   %esi
    259c:	e8 b9 12 00 00       	call   385a <read>
    if(cc < 0){
    25a1:	83 c4 10             	add    $0x10,%esp
    25a4:	85 c0                	test   %eax,%eax
    25a6:	78 68                	js     2610 <bigfile+0x160>
    if(cc == 0)
    25a8:	75 b6                	jne    2560 <bigfile+0xb0>
  close(fd);
    25aa:	83 ec 0c             	sub    $0xc,%esp
    25ad:	56                   	push   %esi
    25ae:	e8 b7 12 00 00       	call   386a <close>
  if(total != 20*600){
    25b3:	83 c4 10             	add    $0x10,%esp
    25b6:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    25bc:	0f 85 9e 00 00 00    	jne    2660 <bigfile+0x1b0>
  unlink("bigfile");
    25c2:	83 ec 0c             	sub    $0xc,%esp
    25c5:	68 78 47 00 00       	push   $0x4778
    25ca:	e8 c3 12 00 00       	call   3892 <unlink>
  printf(1, "bigfile test ok\n");
    25cf:	58                   	pop    %eax
    25d0:	5a                   	pop    %edx
    25d1:	68 07 48 00 00       	push   $0x4807
    25d6:	6a 01                	push   $0x1
    25d8:	e8 b3 13 00 00       	call   3990 <printf>
}
    25dd:	83 c4 10             	add    $0x10,%esp
    25e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    25e3:	5b                   	pop    %ebx
    25e4:	5e                   	pop    %esi
    25e5:	5f                   	pop    %edi
    25e6:	5d                   	pop    %ebp
    25e7:	c3                   	ret    
      printf(1, "read bigfile wrong data\n");
    25e8:	83 ec 08             	sub    $0x8,%esp
    25eb:	68 d4 47 00 00       	push   $0x47d4
    25f0:	6a 01                	push   $0x1
    25f2:	e8 99 13 00 00       	call   3990 <printf>
      exit();
    25f7:	e8 46 12 00 00       	call   3842 <exit>
      printf(1, "short read bigfile\n");
    25fc:	83 ec 08             	sub    $0x8,%esp
    25ff:	68 c0 47 00 00       	push   $0x47c0
    2604:	6a 01                	push   $0x1
    2606:	e8 85 13 00 00       	call   3990 <printf>
      exit();
    260b:	e8 32 12 00 00       	call   3842 <exit>
      printf(1, "read bigfile failed\n");
    2610:	83 ec 08             	sub    $0x8,%esp
    2613:	68 ab 47 00 00       	push   $0x47ab
    2618:	6a 01                	push   $0x1
    261a:	e8 71 13 00 00       	call   3990 <printf>
      exit();
    261f:	e8 1e 12 00 00       	call   3842 <exit>
      printf(1, "write bigfile failed\n");
    2624:	83 ec 08             	sub    $0x8,%esp
    2627:	68 80 47 00 00       	push   $0x4780
    262c:	6a 01                	push   $0x1
    262e:	e8 5d 13 00 00       	call   3990 <printf>
      exit();
    2633:	e8 0a 12 00 00       	call   3842 <exit>
    printf(1, "cannot open bigfile\n");
    2638:	83 ec 08             	sub    $0x8,%esp
    263b:	68 96 47 00 00       	push   $0x4796
    2640:	6a 01                	push   $0x1
    2642:	e8 49 13 00 00       	call   3990 <printf>
    exit();
    2647:	e8 f6 11 00 00       	call   3842 <exit>
    printf(1, "cannot create bigfile");
    264c:	83 ec 08             	sub    $0x8,%esp
    264f:	68 6a 47 00 00       	push   $0x476a
    2654:	6a 01                	push   $0x1
    2656:	e8 35 13 00 00       	call   3990 <printf>
    exit();
    265b:	e8 e2 11 00 00       	call   3842 <exit>
    printf(1, "read bigfile wrong total\n");
    2660:	83 ec 08             	sub    $0x8,%esp
    2663:	68 ed 47 00 00       	push   $0x47ed
    2668:	6a 01                	push   $0x1
    266a:	e8 21 13 00 00       	call   3990 <printf>
    exit();
    266f:	e8 ce 11 00 00       	call   3842 <exit>
    2674:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    267a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00002680 <fourteen>:
{
    2680:	55                   	push   %ebp
    2681:	89 e5                	mov    %esp,%ebp
    2683:	83 ec 10             	sub    $0x10,%esp
  printf(1, "fourteen test\n");
    2686:	68 18 48 00 00       	push   $0x4818
    268b:	6a 01                	push   $0x1
    268d:	e8 fe 12 00 00       	call   3990 <printf>
  if(mkdir("12345678901234") != 0){
    2692:	c7 04 24 53 48 00 00 	movl   $0x4853,(%esp)
    2699:	e8 0c 12 00 00       	call   38aa <mkdir>
    269e:	83 c4 10             	add    $0x10,%esp
    26a1:	85 c0                	test   %eax,%eax
    26a3:	0f 85 97 00 00 00    	jne    2740 <fourteen+0xc0>
  if(mkdir("12345678901234/123456789012345") != 0){
    26a9:	83 ec 0c             	sub    $0xc,%esp
    26ac:	68 ec 4f 00 00       	push   $0x4fec
    26b1:	e8 f4 11 00 00       	call   38aa <mkdir>
    26b6:	83 c4 10             	add    $0x10,%esp
    26b9:	85 c0                	test   %eax,%eax
    26bb:	0f 85 de 00 00 00    	jne    279f <fourteen+0x11f>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    26c1:	83 ec 08             	sub    $0x8,%esp
    26c4:	68 00 02 00 00       	push   $0x200
    26c9:	68 3c 50 00 00       	push   $0x503c
    26ce:	e8 af 11 00 00       	call   3882 <open>
  if(fd < 0){
    26d3:	83 c4 10             	add    $0x10,%esp
    26d6:	85 c0                	test   %eax,%eax
    26d8:	0f 88 ae 00 00 00    	js     278c <fourteen+0x10c>
  close(fd);
    26de:	83 ec 0c             	sub    $0xc,%esp
    26e1:	50                   	push   %eax
    26e2:	e8 83 11 00 00       	call   386a <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    26e7:	58                   	pop    %eax
    26e8:	5a                   	pop    %edx
    26e9:	6a 00                	push   $0x0
    26eb:	68 ac 50 00 00       	push   $0x50ac
    26f0:	e8 8d 11 00 00       	call   3882 <open>
  if(fd < 0){
    26f5:	83 c4 10             	add    $0x10,%esp
    26f8:	85 c0                	test   %eax,%eax
    26fa:	78 7d                	js     2779 <fourteen+0xf9>
  close(fd);
    26fc:	83 ec 0c             	sub    $0xc,%esp
    26ff:	50                   	push   %eax
    2700:	e8 65 11 00 00       	call   386a <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    2705:	c7 04 24 44 48 00 00 	movl   $0x4844,(%esp)
    270c:	e8 99 11 00 00       	call   38aa <mkdir>
    2711:	83 c4 10             	add    $0x10,%esp
    2714:	85 c0                	test   %eax,%eax
    2716:	74 4e                	je     2766 <fourteen+0xe6>
  if(mkdir("123456789012345/12345678901234") == 0){
    2718:	83 ec 0c             	sub    $0xc,%esp
    271b:	68 48 51 00 00       	push   $0x5148
    2720:	e8 85 11 00 00       	call   38aa <mkdir>
    2725:	83 c4 10             	add    $0x10,%esp
    2728:	85 c0                	test   %eax,%eax
    272a:	74 27                	je     2753 <fourteen+0xd3>
  printf(1, "fourteen ok\n");
    272c:	83 ec 08             	sub    $0x8,%esp
    272f:	68 62 48 00 00       	push   $0x4862
    2734:	6a 01                	push   $0x1
    2736:	e8 55 12 00 00       	call   3990 <printf>
}
    273b:	83 c4 10             	add    $0x10,%esp
    273e:	c9                   	leave  
    273f:	c3                   	ret    
    printf(1, "mkdir 12345678901234 failed\n");
    2740:	50                   	push   %eax
    2741:	50                   	push   %eax
    2742:	68 27 48 00 00       	push   $0x4827
    2747:	6a 01                	push   $0x1
    2749:	e8 42 12 00 00       	call   3990 <printf>
    exit();
    274e:	e8 ef 10 00 00       	call   3842 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2753:	50                   	push   %eax
    2754:	50                   	push   %eax
    2755:	68 68 51 00 00       	push   $0x5168
    275a:	6a 01                	push   $0x1
    275c:	e8 2f 12 00 00       	call   3990 <printf>
    exit();
    2761:	e8 dc 10 00 00       	call   3842 <exit>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2766:	52                   	push   %edx
    2767:	52                   	push   %edx
    2768:	68 18 51 00 00       	push   $0x5118
    276d:	6a 01                	push   $0x1
    276f:	e8 1c 12 00 00       	call   3990 <printf>
    exit();
    2774:	e8 c9 10 00 00       	call   3842 <exit>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2779:	51                   	push   %ecx
    277a:	51                   	push   %ecx
    277b:	68 dc 50 00 00       	push   $0x50dc
    2780:	6a 01                	push   $0x1
    2782:	e8 09 12 00 00       	call   3990 <printf>
    exit();
    2787:	e8 b6 10 00 00       	call   3842 <exit>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    278c:	51                   	push   %ecx
    278d:	51                   	push   %ecx
    278e:	68 6c 50 00 00       	push   $0x506c
    2793:	6a 01                	push   $0x1
    2795:	e8 f6 11 00 00       	call   3990 <printf>
    exit();
    279a:	e8 a3 10 00 00       	call   3842 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    279f:	50                   	push   %eax
    27a0:	50                   	push   %eax
    27a1:	68 0c 50 00 00       	push   $0x500c
    27a6:	6a 01                	push   $0x1
    27a8:	e8 e3 11 00 00       	call   3990 <printf>
    exit();
    27ad:	e8 90 10 00 00       	call   3842 <exit>
    27b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    27b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000027c0 <rmdot>:
{
    27c0:	55                   	push   %ebp
    27c1:	89 e5                	mov    %esp,%ebp
    27c3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    27c6:	68 6f 48 00 00       	push   $0x486f
    27cb:	6a 01                	push   $0x1
    27cd:	e8 be 11 00 00       	call   3990 <printf>
  if(mkdir("dots") != 0){
    27d2:	c7 04 24 7b 48 00 00 	movl   $0x487b,(%esp)
    27d9:	e8 cc 10 00 00       	call   38aa <mkdir>
    27de:	83 c4 10             	add    $0x10,%esp
    27e1:	85 c0                	test   %eax,%eax
    27e3:	0f 85 b0 00 00 00    	jne    2899 <rmdot+0xd9>
  if(chdir("dots") != 0){
    27e9:	83 ec 0c             	sub    $0xc,%esp
    27ec:	68 7b 48 00 00       	push   $0x487b
    27f1:	e8 bc 10 00 00       	call   38b2 <chdir>
    27f6:	83 c4 10             	add    $0x10,%esp
    27f9:	85 c0                	test   %eax,%eax
    27fb:	0f 85 1d 01 00 00    	jne    291e <rmdot+0x15e>
  if(unlink(".") == 0){
    2801:	83 ec 0c             	sub    $0xc,%esp
    2804:	68 26 45 00 00       	push   $0x4526
    2809:	e8 84 10 00 00       	call   3892 <unlink>
    280e:	83 c4 10             	add    $0x10,%esp
    2811:	85 c0                	test   %eax,%eax
    2813:	0f 84 f2 00 00 00    	je     290b <rmdot+0x14b>
  if(unlink("..") == 0){
    2819:	83 ec 0c             	sub    $0xc,%esp
    281c:	68 25 45 00 00       	push   $0x4525
    2821:	e8 6c 10 00 00       	call   3892 <unlink>
    2826:	83 c4 10             	add    $0x10,%esp
    2829:	85 c0                	test   %eax,%eax
    282b:	0f 84 c7 00 00 00    	je     28f8 <rmdot+0x138>
  if(chdir("/") != 0){
    2831:	83 ec 0c             	sub    $0xc,%esp
    2834:	68 f9 3c 00 00       	push   $0x3cf9
    2839:	e8 74 10 00 00       	call   38b2 <chdir>
    283e:	83 c4 10             	add    $0x10,%esp
    2841:	85 c0                	test   %eax,%eax
    2843:	0f 85 9c 00 00 00    	jne    28e5 <rmdot+0x125>
  if(unlink("dots/.") == 0){
    2849:	83 ec 0c             	sub    $0xc,%esp
    284c:	68 c3 48 00 00       	push   $0x48c3
    2851:	e8 3c 10 00 00       	call   3892 <unlink>
    2856:	83 c4 10             	add    $0x10,%esp
    2859:	85 c0                	test   %eax,%eax
    285b:	74 75                	je     28d2 <rmdot+0x112>
  if(unlink("dots/..") == 0){
    285d:	83 ec 0c             	sub    $0xc,%esp
    2860:	68 e1 48 00 00       	push   $0x48e1
    2865:	e8 28 10 00 00       	call   3892 <unlink>
    286a:	83 c4 10             	add    $0x10,%esp
    286d:	85 c0                	test   %eax,%eax
    286f:	74 4e                	je     28bf <rmdot+0xff>
  if(unlink("dots") != 0){
    2871:	83 ec 0c             	sub    $0xc,%esp
    2874:	68 7b 48 00 00       	push   $0x487b
    2879:	e8 14 10 00 00       	call   3892 <unlink>
    287e:	83 c4 10             	add    $0x10,%esp
    2881:	85 c0                	test   %eax,%eax
    2883:	75 27                	jne    28ac <rmdot+0xec>
  printf(1, "rmdot ok\n");
    2885:	83 ec 08             	sub    $0x8,%esp
    2888:	68 16 49 00 00       	push   $0x4916
    288d:	6a 01                	push   $0x1
    288f:	e8 fc 10 00 00       	call   3990 <printf>
}
    2894:	83 c4 10             	add    $0x10,%esp
    2897:	c9                   	leave  
    2898:	c3                   	ret    
    printf(1, "mkdir dots failed\n");
    2899:	50                   	push   %eax
    289a:	50                   	push   %eax
    289b:	68 80 48 00 00       	push   $0x4880
    28a0:	6a 01                	push   $0x1
    28a2:	e8 e9 10 00 00       	call   3990 <printf>
    exit();
    28a7:	e8 96 0f 00 00       	call   3842 <exit>
    printf(1, "unlink dots failed!\n");
    28ac:	50                   	push   %eax
    28ad:	50                   	push   %eax
    28ae:	68 01 49 00 00       	push   $0x4901
    28b3:	6a 01                	push   $0x1
    28b5:	e8 d6 10 00 00       	call   3990 <printf>
    exit();
    28ba:	e8 83 0f 00 00       	call   3842 <exit>
    printf(1, "unlink dots/.. worked!\n");
    28bf:	52                   	push   %edx
    28c0:	52                   	push   %edx
    28c1:	68 e9 48 00 00       	push   $0x48e9
    28c6:	6a 01                	push   $0x1
    28c8:	e8 c3 10 00 00       	call   3990 <printf>
    exit();
    28cd:	e8 70 0f 00 00       	call   3842 <exit>
    printf(1, "unlink dots/. worked!\n");
    28d2:	51                   	push   %ecx
    28d3:	51                   	push   %ecx
    28d4:	68 ca 48 00 00       	push   $0x48ca
    28d9:	6a 01                	push   $0x1
    28db:	e8 b0 10 00 00       	call   3990 <printf>
    exit();
    28e0:	e8 5d 0f 00 00       	call   3842 <exit>
    printf(1, "chdir / failed\n");
    28e5:	50                   	push   %eax
    28e6:	50                   	push   %eax
    28e7:	68 fb 3c 00 00       	push   $0x3cfb
    28ec:	6a 01                	push   $0x1
    28ee:	e8 9d 10 00 00       	call   3990 <printf>
    exit();
    28f3:	e8 4a 0f 00 00       	call   3842 <exit>
    printf(1, "rm .. worked!\n");
    28f8:	50                   	push   %eax
    28f9:	50                   	push   %eax
    28fa:	68 b4 48 00 00       	push   $0x48b4
    28ff:	6a 01                	push   $0x1
    2901:	e8 8a 10 00 00       	call   3990 <printf>
    exit();
    2906:	e8 37 0f 00 00       	call   3842 <exit>
    printf(1, "rm . worked!\n");
    290b:	50                   	push   %eax
    290c:	50                   	push   %eax
    290d:	68 a6 48 00 00       	push   $0x48a6
    2912:	6a 01                	push   $0x1
    2914:	e8 77 10 00 00       	call   3990 <printf>
    exit();
    2919:	e8 24 0f 00 00       	call   3842 <exit>
    printf(1, "chdir dots failed\n");
    291e:	50                   	push   %eax
    291f:	50                   	push   %eax
    2920:	68 93 48 00 00       	push   $0x4893
    2925:	6a 01                	push   $0x1
    2927:	e8 64 10 00 00       	call   3990 <printf>
    exit();
    292c:	e8 11 0f 00 00       	call   3842 <exit>
    2931:	eb 0d                	jmp    2940 <dirfile>
    2933:	90                   	nop
    2934:	90                   	nop
    2935:	90                   	nop
    2936:	90                   	nop
    2937:	90                   	nop
    2938:	90                   	nop
    2939:	90                   	nop
    293a:	90                   	nop
    293b:	90                   	nop
    293c:	90                   	nop
    293d:	90                   	nop
    293e:	90                   	nop
    293f:	90                   	nop

00002940 <dirfile>:
{
    2940:	55                   	push   %ebp
    2941:	89 e5                	mov    %esp,%ebp
    2943:	53                   	push   %ebx
    2944:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "dir vs file\n");
    2947:	68 20 49 00 00       	push   $0x4920
    294c:	6a 01                	push   $0x1
    294e:	e8 3d 10 00 00       	call   3990 <printf>
  fd = open("dirfile", O_CREATE);
    2953:	59                   	pop    %ecx
    2954:	5b                   	pop    %ebx
    2955:	68 00 02 00 00       	push   $0x200
    295a:	68 2d 49 00 00       	push   $0x492d
    295f:	e8 1e 0f 00 00       	call   3882 <open>
  if(fd < 0){
    2964:	83 c4 10             	add    $0x10,%esp
    2967:	85 c0                	test   %eax,%eax
    2969:	0f 88 43 01 00 00    	js     2ab2 <dirfile+0x172>
  close(fd);
    296f:	83 ec 0c             	sub    $0xc,%esp
    2972:	50                   	push   %eax
    2973:	e8 f2 0e 00 00       	call   386a <close>
  if(chdir("dirfile") == 0){
    2978:	c7 04 24 2d 49 00 00 	movl   $0x492d,(%esp)
    297f:	e8 2e 0f 00 00       	call   38b2 <chdir>
    2984:	83 c4 10             	add    $0x10,%esp
    2987:	85 c0                	test   %eax,%eax
    2989:	0f 84 10 01 00 00    	je     2a9f <dirfile+0x15f>
  fd = open("dirfile/xx", 0);
    298f:	83 ec 08             	sub    $0x8,%esp
    2992:	6a 00                	push   $0x0
    2994:	68 66 49 00 00       	push   $0x4966
    2999:	e8 e4 0e 00 00       	call   3882 <open>
  if(fd >= 0){
    299e:	83 c4 10             	add    $0x10,%esp
    29a1:	85 c0                	test   %eax,%eax
    29a3:	0f 89 e3 00 00 00    	jns    2a8c <dirfile+0x14c>
  fd = open("dirfile/xx", O_CREATE);
    29a9:	83 ec 08             	sub    $0x8,%esp
    29ac:	68 00 02 00 00       	push   $0x200
    29b1:	68 66 49 00 00       	push   $0x4966
    29b6:	e8 c7 0e 00 00       	call   3882 <open>
  if(fd >= 0){
    29bb:	83 c4 10             	add    $0x10,%esp
    29be:	85 c0                	test   %eax,%eax
    29c0:	0f 89 c6 00 00 00    	jns    2a8c <dirfile+0x14c>
  if(mkdir("dirfile/xx") == 0){
    29c6:	83 ec 0c             	sub    $0xc,%esp
    29c9:	68 66 49 00 00       	push   $0x4966
    29ce:	e8 d7 0e 00 00       	call   38aa <mkdir>
    29d3:	83 c4 10             	add    $0x10,%esp
    29d6:	85 c0                	test   %eax,%eax
    29d8:	0f 84 46 01 00 00    	je     2b24 <dirfile+0x1e4>
  if(unlink("dirfile/xx") == 0){
    29de:	83 ec 0c             	sub    $0xc,%esp
    29e1:	68 66 49 00 00       	push   $0x4966
    29e6:	e8 a7 0e 00 00       	call   3892 <unlink>
    29eb:	83 c4 10             	add    $0x10,%esp
    29ee:	85 c0                	test   %eax,%eax
    29f0:	0f 84 1b 01 00 00    	je     2b11 <dirfile+0x1d1>
  if(link("README", "dirfile/xx") == 0){
    29f6:	83 ec 08             	sub    $0x8,%esp
    29f9:	68 66 49 00 00       	push   $0x4966
    29fe:	68 ca 49 00 00       	push   $0x49ca
    2a03:	e8 9a 0e 00 00       	call   38a2 <link>
    2a08:	83 c4 10             	add    $0x10,%esp
    2a0b:	85 c0                	test   %eax,%eax
    2a0d:	0f 84 eb 00 00 00    	je     2afe <dirfile+0x1be>
  if(unlink("dirfile") != 0){
    2a13:	83 ec 0c             	sub    $0xc,%esp
    2a16:	68 2d 49 00 00       	push   $0x492d
    2a1b:	e8 72 0e 00 00       	call   3892 <unlink>
    2a20:	83 c4 10             	add    $0x10,%esp
    2a23:	85 c0                	test   %eax,%eax
    2a25:	0f 85 c0 00 00 00    	jne    2aeb <dirfile+0x1ab>
  fd = open(".", O_RDWR);
    2a2b:	83 ec 08             	sub    $0x8,%esp
    2a2e:	6a 02                	push   $0x2
    2a30:	68 26 45 00 00       	push   $0x4526
    2a35:	e8 48 0e 00 00       	call   3882 <open>
  if(fd >= 0){
    2a3a:	83 c4 10             	add    $0x10,%esp
    2a3d:	85 c0                	test   %eax,%eax
    2a3f:	0f 89 93 00 00 00    	jns    2ad8 <dirfile+0x198>
  fd = open(".", 0);
    2a45:	83 ec 08             	sub    $0x8,%esp
    2a48:	6a 00                	push   $0x0
    2a4a:	68 26 45 00 00       	push   $0x4526
    2a4f:	e8 2e 0e 00 00       	call   3882 <open>
  if(write(fd, "x", 1) > 0){
    2a54:	83 c4 0c             	add    $0xc,%esp
  fd = open(".", 0);
    2a57:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2a59:	6a 01                	push   $0x1
    2a5b:	68 09 46 00 00       	push   $0x4609
    2a60:	50                   	push   %eax
    2a61:	e8 fc 0d 00 00       	call   3862 <write>
    2a66:	83 c4 10             	add    $0x10,%esp
    2a69:	85 c0                	test   %eax,%eax
    2a6b:	7f 58                	jg     2ac5 <dirfile+0x185>
  close(fd);
    2a6d:	83 ec 0c             	sub    $0xc,%esp
    2a70:	53                   	push   %ebx
    2a71:	e8 f4 0d 00 00       	call   386a <close>
  printf(1, "dir vs file OK\n");
    2a76:	58                   	pop    %eax
    2a77:	5a                   	pop    %edx
    2a78:	68 fd 49 00 00       	push   $0x49fd
    2a7d:	6a 01                	push   $0x1
    2a7f:	e8 0c 0f 00 00       	call   3990 <printf>
}
    2a84:	83 c4 10             	add    $0x10,%esp
    2a87:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2a8a:	c9                   	leave  
    2a8b:	c3                   	ret    
    printf(1, "create dirfile/xx succeeded!\n");
    2a8c:	50                   	push   %eax
    2a8d:	50                   	push   %eax
    2a8e:	68 71 49 00 00       	push   $0x4971
    2a93:	6a 01                	push   $0x1
    2a95:	e8 f6 0e 00 00       	call   3990 <printf>
    exit();
    2a9a:	e8 a3 0d 00 00       	call   3842 <exit>
    printf(1, "chdir dirfile succeeded!\n");
    2a9f:	50                   	push   %eax
    2aa0:	50                   	push   %eax
    2aa1:	68 4c 49 00 00       	push   $0x494c
    2aa6:	6a 01                	push   $0x1
    2aa8:	e8 e3 0e 00 00       	call   3990 <printf>
    exit();
    2aad:	e8 90 0d 00 00       	call   3842 <exit>
    printf(1, "create dirfile failed\n");
    2ab2:	52                   	push   %edx
    2ab3:	52                   	push   %edx
    2ab4:	68 35 49 00 00       	push   $0x4935
    2ab9:	6a 01                	push   $0x1
    2abb:	e8 d0 0e 00 00       	call   3990 <printf>
    exit();
    2ac0:	e8 7d 0d 00 00       	call   3842 <exit>
    printf(1, "write . succeeded!\n");
    2ac5:	51                   	push   %ecx
    2ac6:	51                   	push   %ecx
    2ac7:	68 e9 49 00 00       	push   $0x49e9
    2acc:	6a 01                	push   $0x1
    2ace:	e8 bd 0e 00 00       	call   3990 <printf>
    exit();
    2ad3:	e8 6a 0d 00 00       	call   3842 <exit>
    printf(1, "open . for writing succeeded!\n");
    2ad8:	53                   	push   %ebx
    2ad9:	53                   	push   %ebx
    2ada:	68 bc 51 00 00       	push   $0x51bc
    2adf:	6a 01                	push   $0x1
    2ae1:	e8 aa 0e 00 00       	call   3990 <printf>
    exit();
    2ae6:	e8 57 0d 00 00       	call   3842 <exit>
    printf(1, "unlink dirfile failed!\n");
    2aeb:	50                   	push   %eax
    2aec:	50                   	push   %eax
    2aed:	68 d1 49 00 00       	push   $0x49d1
    2af2:	6a 01                	push   $0x1
    2af4:	e8 97 0e 00 00       	call   3990 <printf>
    exit();
    2af9:	e8 44 0d 00 00       	call   3842 <exit>
    printf(1, "link to dirfile/xx succeeded!\n");
    2afe:	50                   	push   %eax
    2aff:	50                   	push   %eax
    2b00:	68 9c 51 00 00       	push   $0x519c
    2b05:	6a 01                	push   $0x1
    2b07:	e8 84 0e 00 00       	call   3990 <printf>
    exit();
    2b0c:	e8 31 0d 00 00       	call   3842 <exit>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2b11:	50                   	push   %eax
    2b12:	50                   	push   %eax
    2b13:	68 ac 49 00 00       	push   $0x49ac
    2b18:	6a 01                	push   $0x1
    2b1a:	e8 71 0e 00 00       	call   3990 <printf>
    exit();
    2b1f:	e8 1e 0d 00 00       	call   3842 <exit>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2b24:	50                   	push   %eax
    2b25:	50                   	push   %eax
    2b26:	68 8f 49 00 00       	push   $0x498f
    2b2b:	6a 01                	push   $0x1
    2b2d:	e8 5e 0e 00 00       	call   3990 <printf>
    exit();
    2b32:	e8 0b 0d 00 00       	call   3842 <exit>
    2b37:	89 f6                	mov    %esi,%esi
    2b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002b40 <iref>:
{
    2b40:	55                   	push   %ebp
    2b41:	89 e5                	mov    %esp,%ebp
    2b43:	53                   	push   %ebx
  printf(1, "empty file name\n");
    2b44:	bb 33 00 00 00       	mov    $0x33,%ebx
{
    2b49:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "empty file name\n");
    2b4c:	68 0d 4a 00 00       	push   $0x4a0d
    2b51:	6a 01                	push   $0x1
    2b53:	e8 38 0e 00 00       	call   3990 <printf>
    2b58:	83 c4 10             	add    $0x10,%esp
    2b5b:	90                   	nop
    2b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(mkdir("irefd") != 0){
    2b60:	83 ec 0c             	sub    $0xc,%esp
    2b63:	68 1e 4a 00 00       	push   $0x4a1e
    2b68:	e8 3d 0d 00 00       	call   38aa <mkdir>
    2b6d:	83 c4 10             	add    $0x10,%esp
    2b70:	85 c0                	test   %eax,%eax
    2b72:	0f 85 bb 00 00 00    	jne    2c33 <iref+0xf3>
    if(chdir("irefd") != 0){
    2b78:	83 ec 0c             	sub    $0xc,%esp
    2b7b:	68 1e 4a 00 00       	push   $0x4a1e
    2b80:	e8 2d 0d 00 00       	call   38b2 <chdir>
    2b85:	83 c4 10             	add    $0x10,%esp
    2b88:	85 c0                	test   %eax,%eax
    2b8a:	0f 85 b7 00 00 00    	jne    2c47 <iref+0x107>
    mkdir("");
    2b90:	83 ec 0c             	sub    $0xc,%esp
    2b93:	68 d3 40 00 00       	push   $0x40d3
    2b98:	e8 0d 0d 00 00       	call   38aa <mkdir>
    link("README", "");
    2b9d:	59                   	pop    %ecx
    2b9e:	58                   	pop    %eax
    2b9f:	68 d3 40 00 00       	push   $0x40d3
    2ba4:	68 ca 49 00 00       	push   $0x49ca
    2ba9:	e8 f4 0c 00 00       	call   38a2 <link>
    fd = open("", O_CREATE);
    2bae:	58                   	pop    %eax
    2baf:	5a                   	pop    %edx
    2bb0:	68 00 02 00 00       	push   $0x200
    2bb5:	68 d3 40 00 00       	push   $0x40d3
    2bba:	e8 c3 0c 00 00       	call   3882 <open>
    if(fd >= 0)
    2bbf:	83 c4 10             	add    $0x10,%esp
    2bc2:	85 c0                	test   %eax,%eax
    2bc4:	78 0c                	js     2bd2 <iref+0x92>
      close(fd);
    2bc6:	83 ec 0c             	sub    $0xc,%esp
    2bc9:	50                   	push   %eax
    2bca:	e8 9b 0c 00 00       	call   386a <close>
    2bcf:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    2bd2:	83 ec 08             	sub    $0x8,%esp
    2bd5:	68 00 02 00 00       	push   $0x200
    2bda:	68 08 46 00 00       	push   $0x4608
    2bdf:	e8 9e 0c 00 00       	call   3882 <open>
    if(fd >= 0)
    2be4:	83 c4 10             	add    $0x10,%esp
    2be7:	85 c0                	test   %eax,%eax
    2be9:	78 0c                	js     2bf7 <iref+0xb7>
      close(fd);
    2beb:	83 ec 0c             	sub    $0xc,%esp
    2bee:	50                   	push   %eax
    2bef:	e8 76 0c 00 00       	call   386a <close>
    2bf4:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    2bf7:	83 ec 0c             	sub    $0xc,%esp
    2bfa:	68 08 46 00 00       	push   $0x4608
    2bff:	e8 8e 0c 00 00       	call   3892 <unlink>
  for(i = 0; i < 50 + 1; i++){
    2c04:	83 c4 10             	add    $0x10,%esp
    2c07:	83 eb 01             	sub    $0x1,%ebx
    2c0a:	0f 85 50 ff ff ff    	jne    2b60 <iref+0x20>
  chdir("/");
    2c10:	83 ec 0c             	sub    $0xc,%esp
    2c13:	68 f9 3c 00 00       	push   $0x3cf9
    2c18:	e8 95 0c 00 00       	call   38b2 <chdir>
  printf(1, "empty file name OK\n");
    2c1d:	58                   	pop    %eax
    2c1e:	5a                   	pop    %edx
    2c1f:	68 4c 4a 00 00       	push   $0x4a4c
    2c24:	6a 01                	push   $0x1
    2c26:	e8 65 0d 00 00       	call   3990 <printf>
}
    2c2b:	83 c4 10             	add    $0x10,%esp
    2c2e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2c31:	c9                   	leave  
    2c32:	c3                   	ret    
      printf(1, "mkdir irefd failed\n");
    2c33:	83 ec 08             	sub    $0x8,%esp
    2c36:	68 24 4a 00 00       	push   $0x4a24
    2c3b:	6a 01                	push   $0x1
    2c3d:	e8 4e 0d 00 00       	call   3990 <printf>
      exit();
    2c42:	e8 fb 0b 00 00       	call   3842 <exit>
      printf(1, "chdir irefd failed\n");
    2c47:	83 ec 08             	sub    $0x8,%esp
    2c4a:	68 38 4a 00 00       	push   $0x4a38
    2c4f:	6a 01                	push   $0x1
    2c51:	e8 3a 0d 00 00       	call   3990 <printf>
      exit();
    2c56:	e8 e7 0b 00 00       	call   3842 <exit>
    2c5b:	90                   	nop
    2c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002c60 <forktest>:
{
    2c60:	55                   	push   %ebp
    2c61:	89 e5                	mov    %esp,%ebp
    2c63:	53                   	push   %ebx
  for(n=0; n<1000; n++){
    2c64:	31 db                	xor    %ebx,%ebx
{
    2c66:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "fork test\n");
    2c69:	68 60 4a 00 00       	push   $0x4a60
    2c6e:	6a 01                	push   $0x1
    2c70:	e8 1b 0d 00 00       	call   3990 <printf>
    2c75:	83 c4 10             	add    $0x10,%esp
    2c78:	eb 13                	jmp    2c8d <forktest+0x2d>
    2c7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pid == 0)
    2c80:	74 62                	je     2ce4 <forktest+0x84>
  for(n=0; n<1000; n++){
    2c82:	83 c3 01             	add    $0x1,%ebx
    2c85:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2c8b:	74 43                	je     2cd0 <forktest+0x70>
    pid = fork();
    2c8d:	e8 a8 0b 00 00       	call   383a <fork>
    if(pid < 0)
    2c92:	85 c0                	test   %eax,%eax
    2c94:	79 ea                	jns    2c80 <forktest+0x20>
  for(; n > 0; n--){
    2c96:	85 db                	test   %ebx,%ebx
    2c98:	74 14                	je     2cae <forktest+0x4e>
    2c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    2ca0:	e8 a5 0b 00 00       	call   384a <wait>
    2ca5:	85 c0                	test   %eax,%eax
    2ca7:	78 40                	js     2ce9 <forktest+0x89>
  for(; n > 0; n--){
    2ca9:	83 eb 01             	sub    $0x1,%ebx
    2cac:	75 f2                	jne    2ca0 <forktest+0x40>
  if(wait() != -1){
    2cae:	e8 97 0b 00 00       	call   384a <wait>
    2cb3:	83 f8 ff             	cmp    $0xffffffff,%eax
    2cb6:	75 45                	jne    2cfd <forktest+0x9d>
  printf(1, "fork test OK\n");
    2cb8:	83 ec 08             	sub    $0x8,%esp
    2cbb:	68 92 4a 00 00       	push   $0x4a92
    2cc0:	6a 01                	push   $0x1
    2cc2:	e8 c9 0c 00 00       	call   3990 <printf>
}
    2cc7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2cca:	c9                   	leave  
    2ccb:	c3                   	ret    
    2ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "fork claimed to work 1000 times!\n");
    2cd0:	83 ec 08             	sub    $0x8,%esp
    2cd3:	68 dc 51 00 00       	push   $0x51dc
    2cd8:	6a 01                	push   $0x1
    2cda:	e8 b1 0c 00 00       	call   3990 <printf>
    exit();
    2cdf:	e8 5e 0b 00 00       	call   3842 <exit>
      exit();
    2ce4:	e8 59 0b 00 00       	call   3842 <exit>
      printf(1, "wait stopped early\n");
    2ce9:	83 ec 08             	sub    $0x8,%esp
    2cec:	68 6b 4a 00 00       	push   $0x4a6b
    2cf1:	6a 01                	push   $0x1
    2cf3:	e8 98 0c 00 00       	call   3990 <printf>
      exit();
    2cf8:	e8 45 0b 00 00       	call   3842 <exit>
    printf(1, "wait got too many\n");
    2cfd:	83 ec 08             	sub    $0x8,%esp
    2d00:	68 7f 4a 00 00       	push   $0x4a7f
    2d05:	6a 01                	push   $0x1
    2d07:	e8 84 0c 00 00       	call   3990 <printf>
    exit();
    2d0c:	e8 31 0b 00 00       	call   3842 <exit>
    2d11:	eb 0d                	jmp    2d20 <sbrktest>
    2d13:	90                   	nop
    2d14:	90                   	nop
    2d15:	90                   	nop
    2d16:	90                   	nop
    2d17:	90                   	nop
    2d18:	90                   	nop
    2d19:	90                   	nop
    2d1a:	90                   	nop
    2d1b:	90                   	nop
    2d1c:	90                   	nop
    2d1d:	90                   	nop
    2d1e:	90                   	nop
    2d1f:	90                   	nop

00002d20 <sbrktest>:
{
    2d20:	55                   	push   %ebp
    2d21:	89 e5                	mov    %esp,%ebp
    2d23:	57                   	push   %edi
    2d24:	56                   	push   %esi
    2d25:	53                   	push   %ebx
  for(i = 0; i < 5000; i++){
    2d26:	31 f6                	xor    %esi,%esi
{
    2d28:	83 ec 64             	sub    $0x64,%esp
  printf(stdout, "sbrk test\n");
    2d2b:	68 a0 4a 00 00       	push   $0x4aa0
    2d30:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    2d36:	e8 55 0c 00 00       	call   3990 <printf>
  oldbrk = sbrk(0);
    2d3b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d42:	e8 83 0b 00 00       	call   38ca <sbrk>
  a = sbrk(0);
    2d47:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  oldbrk = sbrk(0);
    2d4e:	89 c7                	mov    %eax,%edi
  a = sbrk(0);
    2d50:	e8 75 0b 00 00       	call   38ca <sbrk>
    2d55:	83 c4 10             	add    $0x10,%esp
    2d58:	89 c3                	mov    %eax,%ebx
    2d5a:	eb 06                	jmp    2d62 <sbrktest+0x42>
    2d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    a = b + 1;
    2d60:	89 c3                	mov    %eax,%ebx
    b = sbrk(1);
    2d62:	83 ec 0c             	sub    $0xc,%esp
    2d65:	6a 01                	push   $0x1
    2d67:	e8 5e 0b 00 00       	call   38ca <sbrk>
    if(b != a){
    2d6c:	83 c4 10             	add    $0x10,%esp
    2d6f:	39 d8                	cmp    %ebx,%eax
    2d71:	0f 85 83 02 00 00    	jne    2ffa <sbrktest+0x2da>
  for(i = 0; i < 5000; i++){
    2d77:	83 c6 01             	add    $0x1,%esi
    *b = 1;
    2d7a:	c6 03 01             	movb   $0x1,(%ebx)
    a = b + 1;
    2d7d:	8d 43 01             	lea    0x1(%ebx),%eax
  for(i = 0; i < 5000; i++){
    2d80:	81 fe 88 13 00 00    	cmp    $0x1388,%esi
    2d86:	75 d8                	jne    2d60 <sbrktest+0x40>
  pid = fork();
    2d88:	e8 ad 0a 00 00       	call   383a <fork>
  if(pid < 0){
    2d8d:	85 c0                	test   %eax,%eax
  pid = fork();
    2d8f:	89 c6                	mov    %eax,%esi
  if(pid < 0){
    2d91:	0f 88 91 03 00 00    	js     3128 <sbrktest+0x408>
  c = sbrk(1);
    2d97:	83 ec 0c             	sub    $0xc,%esp
  if(c != a + 1){
    2d9a:	83 c3 02             	add    $0x2,%ebx
  c = sbrk(1);
    2d9d:	6a 01                	push   $0x1
    2d9f:	e8 26 0b 00 00       	call   38ca <sbrk>
  c = sbrk(1);
    2da4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2dab:	e8 1a 0b 00 00       	call   38ca <sbrk>
  if(c != a + 1){
    2db0:	83 c4 10             	add    $0x10,%esp
    2db3:	39 d8                	cmp    %ebx,%eax
    2db5:	0f 85 55 03 00 00    	jne    3110 <sbrktest+0x3f0>
  if(pid == 0)
    2dbb:	85 f6                	test   %esi,%esi
    2dbd:	0f 84 48 03 00 00    	je     310b <sbrktest+0x3eb>
  wait();
    2dc3:	e8 82 0a 00 00       	call   384a <wait>
  a = sbrk(0);
    2dc8:	83 ec 0c             	sub    $0xc,%esp
    2dcb:	6a 00                	push   $0x0
    2dcd:	e8 f8 0a 00 00       	call   38ca <sbrk>
    2dd2:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
    2dd4:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2dd9:	29 d8                	sub    %ebx,%eax
  p = sbrk(amt);
    2ddb:	89 04 24             	mov    %eax,(%esp)
    2dde:	e8 e7 0a 00 00       	call   38ca <sbrk>
  if (p != a) {
    2de3:	83 c4 10             	add    $0x10,%esp
    2de6:	39 c3                	cmp    %eax,%ebx
    2de8:	0f 85 05 03 00 00    	jne    30f3 <sbrktest+0x3d3>
  a = sbrk(0);
    2dee:	83 ec 0c             	sub    $0xc,%esp
  *lastaddr = 99;
    2df1:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff
  a = sbrk(0);
    2df8:	6a 00                	push   $0x0
    2dfa:	e8 cb 0a 00 00       	call   38ca <sbrk>
  c = sbrk(-4096);
    2dff:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  a = sbrk(0);
    2e06:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    2e08:	e8 bd 0a 00 00       	call   38ca <sbrk>
  if(c == (char*)0xffffffff){
    2e0d:	83 c4 10             	add    $0x10,%esp
    2e10:	83 f8 ff             	cmp    $0xffffffff,%eax
    2e13:	0f 84 c2 02 00 00    	je     30db <sbrktest+0x3bb>
  c = sbrk(0);
    2e19:	83 ec 0c             	sub    $0xc,%esp
    2e1c:	6a 00                	push   $0x0
    2e1e:	e8 a7 0a 00 00       	call   38ca <sbrk>
  if(c != a - 4096){
    2e23:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    2e29:	83 c4 10             	add    $0x10,%esp
    2e2c:	39 d0                	cmp    %edx,%eax
    2e2e:	0f 85 90 02 00 00    	jne    30c4 <sbrktest+0x3a4>
  a = sbrk(0);
    2e34:	83 ec 0c             	sub    $0xc,%esp
    2e37:	6a 00                	push   $0x0
    2e39:	e8 8c 0a 00 00       	call   38ca <sbrk>
    2e3e:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    2e40:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2e47:	e8 7e 0a 00 00       	call   38ca <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2e4c:	83 c4 10             	add    $0x10,%esp
    2e4f:	39 c3                	cmp    %eax,%ebx
  c = sbrk(4096);
    2e51:	89 c6                	mov    %eax,%esi
  if(c != a || sbrk(0) != a + 4096){
    2e53:	0f 85 54 02 00 00    	jne    30ad <sbrktest+0x38d>
    2e59:	83 ec 0c             	sub    $0xc,%esp
    2e5c:	6a 00                	push   $0x0
    2e5e:	e8 67 0a 00 00       	call   38ca <sbrk>
    2e63:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    2e69:	83 c4 10             	add    $0x10,%esp
    2e6c:	39 d0                	cmp    %edx,%eax
    2e6e:	0f 85 39 02 00 00    	jne    30ad <sbrktest+0x38d>
  if(*lastaddr == 99){
    2e74:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2e7b:	0f 84 14 02 00 00    	je     3095 <sbrktest+0x375>
  a = sbrk(0);
    2e81:	83 ec 0c             	sub    $0xc,%esp
    2e84:	6a 00                	push   $0x0
    2e86:	e8 3f 0a 00 00       	call   38ca <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    2e8b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  a = sbrk(0);
    2e92:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    2e94:	e8 31 0a 00 00       	call   38ca <sbrk>
    2e99:	89 f9                	mov    %edi,%ecx
    2e9b:	29 c1                	sub    %eax,%ecx
    2e9d:	89 0c 24             	mov    %ecx,(%esp)
    2ea0:	e8 25 0a 00 00       	call   38ca <sbrk>
  if(c != a){
    2ea5:	83 c4 10             	add    $0x10,%esp
    2ea8:	39 c3                	cmp    %eax,%ebx
    2eaa:	0f 85 ce 01 00 00    	jne    307e <sbrktest+0x35e>
    2eb0:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    2eb5:	8d 76 00             	lea    0x0(%esi),%esi
    ppid = getpid();
    2eb8:	e8 05 0a 00 00       	call   38c2 <getpid>
    2ebd:	89 c6                	mov    %eax,%esi
    pid = fork();
    2ebf:	e8 76 09 00 00       	call   383a <fork>
    if(pid < 0){
    2ec4:	85 c0                	test   %eax,%eax
    2ec6:	0f 88 9a 01 00 00    	js     3066 <sbrktest+0x346>
    if(pid == 0){
    2ecc:	0f 84 72 01 00 00    	je     3044 <sbrktest+0x324>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2ed2:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    wait();
    2ed8:	e8 6d 09 00 00       	call   384a <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2edd:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    2ee3:	75 d3                	jne    2eb8 <sbrktest+0x198>
  if(pipe(fds) != 0){
    2ee5:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2ee8:	83 ec 0c             	sub    $0xc,%esp
    2eeb:	50                   	push   %eax
    2eec:	e8 61 09 00 00       	call   3852 <pipe>
    2ef1:	83 c4 10             	add    $0x10,%esp
    2ef4:	85 c0                	test   %eax,%eax
    2ef6:	0f 85 34 01 00 00    	jne    3030 <sbrktest+0x310>
    2efc:	8d 75 c0             	lea    -0x40(%ebp),%esi
    2eff:	89 f3                	mov    %esi,%ebx
    if((pids[i] = fork()) == 0){
    2f01:	e8 34 09 00 00       	call   383a <fork>
    2f06:	85 c0                	test   %eax,%eax
    2f08:	89 03                	mov    %eax,(%ebx)
    2f0a:	0f 84 a5 00 00 00    	je     2fb5 <sbrktest+0x295>
    if(pids[i] != -1)
    2f10:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f13:	74 14                	je     2f29 <sbrktest+0x209>
      read(fds[0], &scratch, 1);
    2f15:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2f18:	83 ec 04             	sub    $0x4,%esp
    2f1b:	6a 01                	push   $0x1
    2f1d:	50                   	push   %eax
    2f1e:	ff 75 b8             	pushl  -0x48(%ebp)
    2f21:	e8 34 09 00 00       	call   385a <read>
    2f26:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2f29:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2f2c:	83 c3 04             	add    $0x4,%ebx
    2f2f:	39 c3                	cmp    %eax,%ebx
    2f31:	75 ce                	jne    2f01 <sbrktest+0x1e1>
  c = sbrk(4096);
    2f33:	83 ec 0c             	sub    $0xc,%esp
    2f36:	68 00 10 00 00       	push   $0x1000
    2f3b:	e8 8a 09 00 00       	call   38ca <sbrk>
    2f40:	83 c4 10             	add    $0x10,%esp
    2f43:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    if(pids[i] == -1)
    2f46:	8b 06                	mov    (%esi),%eax
    2f48:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f4b:	74 11                	je     2f5e <sbrktest+0x23e>
    kill(pids[i]);
    2f4d:	83 ec 0c             	sub    $0xc,%esp
    2f50:	50                   	push   %eax
    2f51:	e8 1c 09 00 00       	call   3872 <kill>
    wait();
    2f56:	e8 ef 08 00 00       	call   384a <wait>
    2f5b:	83 c4 10             	add    $0x10,%esp
    2f5e:	83 c6 04             	add    $0x4,%esi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2f61:	39 f3                	cmp    %esi,%ebx
    2f63:	75 e1                	jne    2f46 <sbrktest+0x226>
  if(c == (char*)0xffffffff){
    2f65:	83 7d a4 ff          	cmpl   $0xffffffff,-0x5c(%ebp)
    2f69:	0f 84 a9 00 00 00    	je     3018 <sbrktest+0x2f8>
  if(sbrk(0) > oldbrk)
    2f6f:	83 ec 0c             	sub    $0xc,%esp
    2f72:	6a 00                	push   $0x0
    2f74:	e8 51 09 00 00       	call   38ca <sbrk>
    2f79:	83 c4 10             	add    $0x10,%esp
    2f7c:	39 c7                	cmp    %eax,%edi
    2f7e:	73 17                	jae    2f97 <sbrktest+0x277>
    sbrk(-(sbrk(0) - oldbrk));
    2f80:	83 ec 0c             	sub    $0xc,%esp
    2f83:	6a 00                	push   $0x0
    2f85:	e8 40 09 00 00       	call   38ca <sbrk>
    2f8a:	29 c7                	sub    %eax,%edi
    2f8c:	89 3c 24             	mov    %edi,(%esp)
    2f8f:	e8 36 09 00 00       	call   38ca <sbrk>
    2f94:	83 c4 10             	add    $0x10,%esp
  printf(stdout, "sbrk test OK\n");
    2f97:	83 ec 08             	sub    $0x8,%esp
    2f9a:	68 48 4b 00 00       	push   $0x4b48
    2f9f:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    2fa5:	e8 e6 09 00 00       	call   3990 <printf>
}
    2faa:	83 c4 10             	add    $0x10,%esp
    2fad:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2fb0:	5b                   	pop    %ebx
    2fb1:	5e                   	pop    %esi
    2fb2:	5f                   	pop    %edi
    2fb3:	5d                   	pop    %ebp
    2fb4:	c3                   	ret    
      sbrk(BIG - (uint)sbrk(0));
    2fb5:	83 ec 0c             	sub    $0xc,%esp
    2fb8:	6a 00                	push   $0x0
    2fba:	e8 0b 09 00 00       	call   38ca <sbrk>
    2fbf:	ba 00 00 40 06       	mov    $0x6400000,%edx
    2fc4:	29 c2                	sub    %eax,%edx
    2fc6:	89 14 24             	mov    %edx,(%esp)
    2fc9:	e8 fc 08 00 00       	call   38ca <sbrk>
      write(fds[1], "x", 1);
    2fce:	83 c4 0c             	add    $0xc,%esp
    2fd1:	6a 01                	push   $0x1
    2fd3:	68 09 46 00 00       	push   $0x4609
    2fd8:	ff 75 bc             	pushl  -0x44(%ebp)
    2fdb:	e8 82 08 00 00       	call   3862 <write>
    2fe0:	83 c4 10             	add    $0x10,%esp
    2fe3:	90                   	nop
    2fe4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(;;) sleep(1000);
    2fe8:	83 ec 0c             	sub    $0xc,%esp
    2feb:	68 e8 03 00 00       	push   $0x3e8
    2ff0:	e8 dd 08 00 00       	call   38d2 <sleep>
    2ff5:	83 c4 10             	add    $0x10,%esp
    2ff8:	eb ee                	jmp    2fe8 <sbrktest+0x2c8>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    2ffa:	83 ec 0c             	sub    $0xc,%esp
    2ffd:	50                   	push   %eax
    2ffe:	53                   	push   %ebx
    2fff:	56                   	push   %esi
    3000:	68 ab 4a 00 00       	push   $0x4aab
    3005:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    300b:	e8 80 09 00 00       	call   3990 <printf>
      exit();
    3010:	83 c4 20             	add    $0x20,%esp
    3013:	e8 2a 08 00 00       	call   3842 <exit>
    printf(stdout, "failed sbrk leaked memory\n");
    3018:	83 ec 08             	sub    $0x8,%esp
    301b:	68 2d 4b 00 00       	push   $0x4b2d
    3020:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    3026:	e8 65 09 00 00       	call   3990 <printf>
    exit();
    302b:	e8 12 08 00 00       	call   3842 <exit>
    printf(1, "pipe() failed\n");
    3030:	83 ec 08             	sub    $0x8,%esp
    3033:	68 e9 3f 00 00       	push   $0x3fe9
    3038:	6a 01                	push   $0x1
    303a:	e8 51 09 00 00       	call   3990 <printf>
    exit();
    303f:	e8 fe 07 00 00       	call   3842 <exit>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    3044:	0f be 03             	movsbl (%ebx),%eax
    3047:	50                   	push   %eax
    3048:	53                   	push   %ebx
    3049:	68 14 4b 00 00       	push   $0x4b14
    304e:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    3054:	e8 37 09 00 00       	call   3990 <printf>
      kill(ppid);
    3059:	89 34 24             	mov    %esi,(%esp)
    305c:	e8 11 08 00 00       	call   3872 <kill>
      exit();
    3061:	e8 dc 07 00 00       	call   3842 <exit>
      printf(stdout, "fork failed\n");
    3066:	83 ec 08             	sub    $0x8,%esp
    3069:	68 f1 4b 00 00       	push   $0x4bf1
    306e:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    3074:	e8 17 09 00 00       	call   3990 <printf>
      exit();
    3079:	e8 c4 07 00 00       	call   3842 <exit>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    307e:	50                   	push   %eax
    307f:	53                   	push   %ebx
    3080:	68 d0 52 00 00       	push   $0x52d0
    3085:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    308b:	e8 00 09 00 00       	call   3990 <printf>
    exit();
    3090:	e8 ad 07 00 00       	call   3842 <exit>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    3095:	83 ec 08             	sub    $0x8,%esp
    3098:	68 a0 52 00 00       	push   $0x52a0
    309d:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    30a3:	e8 e8 08 00 00       	call   3990 <printf>
    exit();
    30a8:	e8 95 07 00 00       	call   3842 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    30ad:	56                   	push   %esi
    30ae:	53                   	push   %ebx
    30af:	68 78 52 00 00       	push   $0x5278
    30b4:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    30ba:	e8 d1 08 00 00       	call   3990 <printf>
    exit();
    30bf:	e8 7e 07 00 00       	call   3842 <exit>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    30c4:	50                   	push   %eax
    30c5:	53                   	push   %ebx
    30c6:	68 40 52 00 00       	push   $0x5240
    30cb:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    30d1:	e8 ba 08 00 00       	call   3990 <printf>
    exit();
    30d6:	e8 67 07 00 00       	call   3842 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    30db:	83 ec 08             	sub    $0x8,%esp
    30de:	68 f9 4a 00 00       	push   $0x4af9
    30e3:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    30e9:	e8 a2 08 00 00       	call   3990 <printf>
    exit();
    30ee:	e8 4f 07 00 00       	call   3842 <exit>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    30f3:	83 ec 08             	sub    $0x8,%esp
    30f6:	68 00 52 00 00       	push   $0x5200
    30fb:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    3101:	e8 8a 08 00 00       	call   3990 <printf>
    exit();
    3106:	e8 37 07 00 00       	call   3842 <exit>
    exit();
    310b:	e8 32 07 00 00       	call   3842 <exit>
    printf(stdout, "sbrk test failed post-fork\n");
    3110:	83 ec 08             	sub    $0x8,%esp
    3113:	68 dd 4a 00 00       	push   $0x4add
    3118:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    311e:	e8 6d 08 00 00       	call   3990 <printf>
    exit();
    3123:	e8 1a 07 00 00       	call   3842 <exit>
    printf(stdout, "sbrk test fork failed\n");
    3128:	83 ec 08             	sub    $0x8,%esp
    312b:	68 c6 4a 00 00       	push   $0x4ac6
    3130:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    3136:	e8 55 08 00 00       	call   3990 <printf>
    exit();
    313b:	e8 02 07 00 00       	call   3842 <exit>

00003140 <validateint>:
{
    3140:	55                   	push   %ebp
    3141:	89 e5                	mov    %esp,%ebp
}
    3143:	5d                   	pop    %ebp
    3144:	c3                   	ret    
    3145:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003150 <validatetest>:
{
    3150:	55                   	push   %ebp
    3151:	89 e5                	mov    %esp,%ebp
    3153:	56                   	push   %esi
    3154:	53                   	push   %ebx
  for(p = 0; p <= (uint)hi; p += 4096){
    3155:	31 db                	xor    %ebx,%ebx
  printf(stdout, "validate test\n");
    3157:	83 ec 08             	sub    $0x8,%esp
    315a:	68 56 4b 00 00       	push   $0x4b56
    315f:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    3165:	e8 26 08 00 00       	call   3990 <printf>
    316a:	83 c4 10             	add    $0x10,%esp
    316d:	8d 76 00             	lea    0x0(%esi),%esi
    if((pid = fork()) == 0){
    3170:	e8 c5 06 00 00       	call   383a <fork>
    3175:	85 c0                	test   %eax,%eax
    3177:	89 c6                	mov    %eax,%esi
    3179:	74 63                	je     31de <validatetest+0x8e>
    sleep(0);
    317b:	83 ec 0c             	sub    $0xc,%esp
    317e:	6a 00                	push   $0x0
    3180:	e8 4d 07 00 00       	call   38d2 <sleep>
    sleep(0);
    3185:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    318c:	e8 41 07 00 00       	call   38d2 <sleep>
    kill(pid);
    3191:	89 34 24             	mov    %esi,(%esp)
    3194:	e8 d9 06 00 00       	call   3872 <kill>
    wait();
    3199:	e8 ac 06 00 00       	call   384a <wait>
    if(link("nosuchfile", (char*)p) != -1){
    319e:	58                   	pop    %eax
    319f:	5a                   	pop    %edx
    31a0:	53                   	push   %ebx
    31a1:	68 65 4b 00 00       	push   $0x4b65
    31a6:	e8 f7 06 00 00       	call   38a2 <link>
    31ab:	83 c4 10             	add    $0x10,%esp
    31ae:	83 f8 ff             	cmp    $0xffffffff,%eax
    31b1:	75 30                	jne    31e3 <validatetest+0x93>
  for(p = 0; p <= (uint)hi; p += 4096){
    31b3:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    31b9:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    31bf:	75 af                	jne    3170 <validatetest+0x20>
  printf(stdout, "validate ok\n");
    31c1:	83 ec 08             	sub    $0x8,%esp
    31c4:	68 89 4b 00 00       	push   $0x4b89
    31c9:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    31cf:	e8 bc 07 00 00       	call   3990 <printf>
}
    31d4:	83 c4 10             	add    $0x10,%esp
    31d7:	8d 65 f8             	lea    -0x8(%ebp),%esp
    31da:	5b                   	pop    %ebx
    31db:	5e                   	pop    %esi
    31dc:	5d                   	pop    %ebp
    31dd:	c3                   	ret    
      exit();
    31de:	e8 5f 06 00 00       	call   3842 <exit>
      printf(stdout, "link should not succeed\n");
    31e3:	83 ec 08             	sub    $0x8,%esp
    31e6:	68 70 4b 00 00       	push   $0x4b70
    31eb:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    31f1:	e8 9a 07 00 00       	call   3990 <printf>
      exit();
    31f6:	e8 47 06 00 00       	call   3842 <exit>
    31fb:	90                   	nop
    31fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003200 <bsstest>:
{
    3200:	55                   	push   %ebp
    3201:	89 e5                	mov    %esp,%ebp
    3203:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "bss test\n");
    3206:	68 96 4b 00 00       	push   $0x4b96
    320b:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    3211:	e8 7a 07 00 00       	call   3990 <printf>
    if(uninit[i] != '\0'){
    3216:	83 c4 10             	add    $0x10,%esp
    3219:	80 3d c0 5d 00 00 00 	cmpb   $0x0,0x5dc0
    3220:	75 39                	jne    325b <bsstest+0x5b>
    3222:	b8 01 00 00 00       	mov    $0x1,%eax
    3227:	89 f6                	mov    %esi,%esi
    3229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3230:	80 b8 c0 5d 00 00 00 	cmpb   $0x0,0x5dc0(%eax)
    3237:	75 22                	jne    325b <bsstest+0x5b>
  for(i = 0; i < sizeof(uninit); i++){
    3239:	83 c0 01             	add    $0x1,%eax
    323c:	3d 10 27 00 00       	cmp    $0x2710,%eax
    3241:	75 ed                	jne    3230 <bsstest+0x30>
  printf(stdout, "bss test ok\n");
    3243:	83 ec 08             	sub    $0x8,%esp
    3246:	68 b1 4b 00 00       	push   $0x4bb1
    324b:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    3251:	e8 3a 07 00 00       	call   3990 <printf>
}
    3256:	83 c4 10             	add    $0x10,%esp
    3259:	c9                   	leave  
    325a:	c3                   	ret    
      printf(stdout, "bss test failed\n");
    325b:	83 ec 08             	sub    $0x8,%esp
    325e:	68 a0 4b 00 00       	push   $0x4ba0
    3263:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    3269:	e8 22 07 00 00       	call   3990 <printf>
      exit();
    326e:	e8 cf 05 00 00       	call   3842 <exit>
    3273:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003280 <bigargtest>:
{
    3280:	55                   	push   %ebp
    3281:	89 e5                	mov    %esp,%ebp
    3283:	83 ec 14             	sub    $0x14,%esp
  unlink("bigarg-ok");
    3286:	68 be 4b 00 00       	push   $0x4bbe
    328b:	e8 02 06 00 00       	call   3892 <unlink>
  pid = fork();
    3290:	e8 a5 05 00 00       	call   383a <fork>
  if(pid == 0){
    3295:	83 c4 10             	add    $0x10,%esp
    3298:	85 c0                	test   %eax,%eax
    329a:	74 3f                	je     32db <bigargtest+0x5b>
  } else if(pid < 0){
    329c:	0f 88 c2 00 00 00    	js     3364 <bigargtest+0xe4>
  wait();
    32a2:	e8 a3 05 00 00       	call   384a <wait>
  fd = open("bigarg-ok", 0);
    32a7:	83 ec 08             	sub    $0x8,%esp
    32aa:	6a 00                	push   $0x0
    32ac:	68 be 4b 00 00       	push   $0x4bbe
    32b1:	e8 cc 05 00 00       	call   3882 <open>
  if(fd < 0){
    32b6:	83 c4 10             	add    $0x10,%esp
    32b9:	85 c0                	test   %eax,%eax
    32bb:	0f 88 8c 00 00 00    	js     334d <bigargtest+0xcd>
  close(fd);
    32c1:	83 ec 0c             	sub    $0xc,%esp
    32c4:	50                   	push   %eax
    32c5:	e8 a0 05 00 00       	call   386a <close>
  unlink("bigarg-ok");
    32ca:	c7 04 24 be 4b 00 00 	movl   $0x4bbe,(%esp)
    32d1:	e8 bc 05 00 00       	call   3892 <unlink>
}
    32d6:	83 c4 10             	add    $0x10,%esp
    32d9:	c9                   	leave  
    32da:	c3                   	ret    
    32db:	b8 20 5d 00 00       	mov    $0x5d20,%eax
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    32e0:	c7 00 f4 52 00 00    	movl   $0x52f4,(%eax)
    32e6:	83 c0 04             	add    $0x4,%eax
    for(i = 0; i < MAXARG-1; i++)
    32e9:	3d 9c 5d 00 00       	cmp    $0x5d9c,%eax
    32ee:	75 f0                	jne    32e0 <bigargtest+0x60>
    printf(stdout, "bigarg test\n");
    32f0:	51                   	push   %ecx
    32f1:	51                   	push   %ecx
    32f2:	68 c8 4b 00 00       	push   $0x4bc8
    32f7:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    args[MAXARG-1] = 0;
    32fd:	c7 05 9c 5d 00 00 00 	movl   $0x0,0x5d9c
    3304:	00 00 00 
    printf(stdout, "bigarg test\n");
    3307:	e8 84 06 00 00       	call   3990 <printf>
    exec("echo", args);
    330c:	58                   	pop    %eax
    330d:	5a                   	pop    %edx
    330e:	68 20 5d 00 00       	push   $0x5d20
    3313:	68 95 3d 00 00       	push   $0x3d95
    3318:	e8 5d 05 00 00       	call   387a <exec>
    printf(stdout, "bigarg test ok\n");
    331d:	59                   	pop    %ecx
    331e:	58                   	pop    %eax
    331f:	68 d5 4b 00 00       	push   $0x4bd5
    3324:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    332a:	e8 61 06 00 00       	call   3990 <printf>
    fd = open("bigarg-ok", O_CREATE);
    332f:	58                   	pop    %eax
    3330:	5a                   	pop    %edx
    3331:	68 00 02 00 00       	push   $0x200
    3336:	68 be 4b 00 00       	push   $0x4bbe
    333b:	e8 42 05 00 00       	call   3882 <open>
    close(fd);
    3340:	89 04 24             	mov    %eax,(%esp)
    3343:	e8 22 05 00 00       	call   386a <close>
    exit();
    3348:	e8 f5 04 00 00       	call   3842 <exit>
    printf(stdout, "bigarg test failed!\n");
    334d:	50                   	push   %eax
    334e:	50                   	push   %eax
    334f:	68 fe 4b 00 00       	push   $0x4bfe
    3354:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    335a:	e8 31 06 00 00       	call   3990 <printf>
    exit();
    335f:	e8 de 04 00 00       	call   3842 <exit>
    printf(stdout, "bigargtest: fork failed\n");
    3364:	52                   	push   %edx
    3365:	52                   	push   %edx
    3366:	68 e5 4b 00 00       	push   $0x4be5
    336b:	ff 35 fc 5c 00 00    	pushl  0x5cfc
    3371:	e8 1a 06 00 00       	call   3990 <printf>
    exit();
    3376:	e8 c7 04 00 00       	call   3842 <exit>
    337b:	90                   	nop
    337c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003380 <fsfull>:
{
    3380:	55                   	push   %ebp
    3381:	89 e5                	mov    %esp,%ebp
    3383:	57                   	push   %edi
    3384:	56                   	push   %esi
    3385:	53                   	push   %ebx
  for(nfiles = 0; ; nfiles++){
    3386:	31 db                	xor    %ebx,%ebx
{
    3388:	83 ec 54             	sub    $0x54,%esp
  printf(1, "fsfull test\n");
    338b:	68 13 4c 00 00       	push   $0x4c13
    3390:	6a 01                	push   $0x1
    3392:	e8 f9 05 00 00       	call   3990 <printf>
    3397:	83 c4 10             	add    $0x10,%esp
    339a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    name[1] = '0' + nfiles / 1000;
    33a0:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    33a5:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    33a7:	89 d9                	mov    %ebx,%ecx
    name[1] = '0' + nfiles / 1000;
    33a9:	f7 eb                	imul   %ebx
    33ab:	c1 fe 1f             	sar    $0x1f,%esi
    name[3] = '0' + (nfiles % 100) / 10;
    33ae:	89 df                	mov    %ebx,%edi
    printf(1, "writing %s\n", name);
    33b0:	83 ec 04             	sub    $0x4,%esp
    name[0] = 'f';
    33b3:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[5] = '\0';
    33b7:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    33bb:	c1 fa 06             	sar    $0x6,%edx
    33be:	29 f2                	sub    %esi,%edx
    33c0:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    33c3:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    name[1] = '0' + nfiles / 1000;
    33c9:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    33cc:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    33d1:	29 d1                	sub    %edx,%ecx
    33d3:	f7 e9                	imul   %ecx
    33d5:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    33d8:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    33dd:	c1 fa 05             	sar    $0x5,%edx
    33e0:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    33e2:	b9 67 66 66 66       	mov    $0x66666667,%ecx
    name[2] = '0' + (nfiles % 1000) / 100;
    33e7:	83 c2 30             	add    $0x30,%edx
    33ea:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    33ed:	f7 eb                	imul   %ebx
    33ef:	c1 fa 05             	sar    $0x5,%edx
    33f2:	29 f2                	sub    %esi,%edx
    33f4:	6b d2 64             	imul   $0x64,%edx,%edx
    33f7:	29 d7                	sub    %edx,%edi
    33f9:	89 f8                	mov    %edi,%eax
    33fb:	c1 ff 1f             	sar    $0x1f,%edi
    33fe:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    3400:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    3402:	c1 fa 02             	sar    $0x2,%edx
    3405:	29 fa                	sub    %edi,%edx
    3407:	83 c2 30             	add    $0x30,%edx
    340a:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    340d:	f7 e9                	imul   %ecx
    340f:	89 d9                	mov    %ebx,%ecx
    3411:	c1 fa 02             	sar    $0x2,%edx
    3414:	29 f2                	sub    %esi,%edx
    3416:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3419:	01 c0                	add    %eax,%eax
    341b:	29 c1                	sub    %eax,%ecx
    341d:	89 c8                	mov    %ecx,%eax
    341f:	83 c0 30             	add    $0x30,%eax
    3422:	88 45 ac             	mov    %al,-0x54(%ebp)
    printf(1, "writing %s\n", name);
    3425:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3428:	50                   	push   %eax
    3429:	68 20 4c 00 00       	push   $0x4c20
    342e:	6a 01                	push   $0x1
    3430:	e8 5b 05 00 00       	call   3990 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    3435:	58                   	pop    %eax
    3436:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3439:	5a                   	pop    %edx
    343a:	68 02 02 00 00       	push   $0x202
    343f:	50                   	push   %eax
    3440:	e8 3d 04 00 00       	call   3882 <open>
    if(fd < 0){
    3445:	83 c4 10             	add    $0x10,%esp
    3448:	85 c0                	test   %eax,%eax
    int fd = open(name, O_CREATE|O_RDWR);
    344a:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    344c:	78 50                	js     349e <fsfull+0x11e>
    344e:	31 f6                	xor    %esi,%esi
    3450:	eb 08                	jmp    345a <fsfull+0xda>
    3452:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      total += cc;
    3458:	01 c6                	add    %eax,%esi
      int cc = write(fd, buf, 512);
    345a:	83 ec 04             	sub    $0x4,%esp
    345d:	68 00 02 00 00       	push   $0x200
    3462:	68 e0 84 00 00       	push   $0x84e0
    3467:	57                   	push   %edi
    3468:	e8 f5 03 00 00       	call   3862 <write>
      if(cc < 512)
    346d:	83 c4 10             	add    $0x10,%esp
    3470:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    3475:	7f e1                	jg     3458 <fsfull+0xd8>
    printf(1, "wrote %d bytes\n", total);
    3477:	83 ec 04             	sub    $0x4,%esp
    347a:	56                   	push   %esi
    347b:	68 3c 4c 00 00       	push   $0x4c3c
    3480:	6a 01                	push   $0x1
    3482:	e8 09 05 00 00       	call   3990 <printf>
    close(fd);
    3487:	89 3c 24             	mov    %edi,(%esp)
    348a:	e8 db 03 00 00       	call   386a <close>
    if(total == 0)
    348f:	83 c4 10             	add    $0x10,%esp
    3492:	85 f6                	test   %esi,%esi
    3494:	74 22                	je     34b8 <fsfull+0x138>
  for(nfiles = 0; ; nfiles++){
    3496:	83 c3 01             	add    $0x1,%ebx
    3499:	e9 02 ff ff ff       	jmp    33a0 <fsfull+0x20>
      printf(1, "open %s failed\n", name);
    349e:	8d 45 a8             	lea    -0x58(%ebp),%eax
    34a1:	83 ec 04             	sub    $0x4,%esp
    34a4:	50                   	push   %eax
    34a5:	68 2c 4c 00 00       	push   $0x4c2c
    34aa:	6a 01                	push   $0x1
    34ac:	e8 df 04 00 00       	call   3990 <printf>
      break;
    34b1:	83 c4 10             	add    $0x10,%esp
    34b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    name[1] = '0' + nfiles / 1000;
    34b8:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    34bd:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    34bf:	89 d9                	mov    %ebx,%ecx
    name[1] = '0' + nfiles / 1000;
    34c1:	f7 eb                	imul   %ebx
    34c3:	c1 fe 1f             	sar    $0x1f,%esi
    name[3] = '0' + (nfiles % 100) / 10;
    34c6:	89 df                	mov    %ebx,%edi
    unlink(name);
    34c8:	83 ec 0c             	sub    $0xc,%esp
    name[0] = 'f';
    34cb:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[5] = '\0';
    34cf:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    34d3:	c1 fa 06             	sar    $0x6,%edx
    34d6:	29 f2                	sub    %esi,%edx
    34d8:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    34db:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    name[1] = '0' + nfiles / 1000;
    34e1:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    34e4:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    34e9:	29 d1                	sub    %edx,%ecx
    34eb:	f7 e9                	imul   %ecx
    34ed:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    34f0:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    34f5:	c1 fa 05             	sar    $0x5,%edx
    34f8:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    34fa:	b9 67 66 66 66       	mov    $0x66666667,%ecx
    name[2] = '0' + (nfiles % 1000) / 100;
    34ff:	83 c2 30             	add    $0x30,%edx
    3502:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3505:	f7 eb                	imul   %ebx
    3507:	c1 fa 05             	sar    $0x5,%edx
    350a:	29 f2                	sub    %esi,%edx
    350c:	6b d2 64             	imul   $0x64,%edx,%edx
    350f:	29 d7                	sub    %edx,%edi
    3511:	89 f8                	mov    %edi,%eax
    3513:	c1 ff 1f             	sar    $0x1f,%edi
    3516:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    3518:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    351a:	c1 fa 02             	sar    $0x2,%edx
    351d:	29 fa                	sub    %edi,%edx
    351f:	83 c2 30             	add    $0x30,%edx
    3522:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    3525:	f7 e9                	imul   %ecx
    3527:	89 d9                	mov    %ebx,%ecx
    nfiles--;
    3529:	83 eb 01             	sub    $0x1,%ebx
    name[4] = '0' + (nfiles % 10);
    352c:	c1 fa 02             	sar    $0x2,%edx
    352f:	29 f2                	sub    %esi,%edx
    3531:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3534:	01 c0                	add    %eax,%eax
    3536:	29 c1                	sub    %eax,%ecx
    3538:	89 c8                	mov    %ecx,%eax
    353a:	83 c0 30             	add    $0x30,%eax
    353d:	88 45 ac             	mov    %al,-0x54(%ebp)
    unlink(name);
    3540:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3543:	50                   	push   %eax
    3544:	e8 49 03 00 00       	call   3892 <unlink>
  while(nfiles >= 0){
    3549:	83 c4 10             	add    $0x10,%esp
    354c:	83 fb ff             	cmp    $0xffffffff,%ebx
    354f:	0f 85 63 ff ff ff    	jne    34b8 <fsfull+0x138>
  printf(1, "fsfull test finished\n");
    3555:	83 ec 08             	sub    $0x8,%esp
    3558:	68 4c 4c 00 00       	push   $0x4c4c
    355d:	6a 01                	push   $0x1
    355f:	e8 2c 04 00 00       	call   3990 <printf>
}
    3564:	83 c4 10             	add    $0x10,%esp
    3567:	8d 65 f4             	lea    -0xc(%ebp),%esp
    356a:	5b                   	pop    %ebx
    356b:	5e                   	pop    %esi
    356c:	5f                   	pop    %edi
    356d:	5d                   	pop    %ebp
    356e:	c3                   	ret    
    356f:	90                   	nop

00003570 <uio>:
{
    3570:	55                   	push   %ebp
    3571:	89 e5                	mov    %esp,%ebp
    3573:	83 ec 10             	sub    $0x10,%esp
  printf(1, "uio test\n");
    3576:	68 62 4c 00 00       	push   $0x4c62
    357b:	6a 01                	push   $0x1
    357d:	e8 0e 04 00 00       	call   3990 <printf>
  pid = fork();
    3582:	e8 b3 02 00 00       	call   383a <fork>
  if(pid == 0){
    3587:	83 c4 10             	add    $0x10,%esp
    358a:	85 c0                	test   %eax,%eax
    358c:	74 1b                	je     35a9 <uio+0x39>
  } else if(pid < 0){
    358e:	78 3d                	js     35cd <uio+0x5d>
  wait();
    3590:	e8 b5 02 00 00       	call   384a <wait>
  printf(1, "uio test done\n");
    3595:	83 ec 08             	sub    $0x8,%esp
    3598:	68 6c 4c 00 00       	push   $0x4c6c
    359d:	6a 01                	push   $0x1
    359f:	e8 ec 03 00 00       	call   3990 <printf>
}
    35a4:	83 c4 10             	add    $0x10,%esp
    35a7:	c9                   	leave  
    35a8:	c3                   	ret    
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    35a9:	ba 70 00 00 00       	mov    $0x70,%edx
    35ae:	b8 09 00 00 00       	mov    $0x9,%eax
    35b3:	ee                   	out    %al,(%dx)
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    35b4:	ba 71 00 00 00       	mov    $0x71,%edx
    35b9:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    35ba:	52                   	push   %edx
    35bb:	52                   	push   %edx
    35bc:	68 d4 53 00 00       	push   $0x53d4
    35c1:	6a 01                	push   $0x1
    35c3:	e8 c8 03 00 00       	call   3990 <printf>
    exit();
    35c8:	e8 75 02 00 00       	call   3842 <exit>
    printf (1, "fork failed\n");
    35cd:	50                   	push   %eax
    35ce:	50                   	push   %eax
    35cf:	68 f1 4b 00 00       	push   $0x4bf1
    35d4:	6a 01                	push   $0x1
    35d6:	e8 b5 03 00 00       	call   3990 <printf>
    exit();
    35db:	e8 62 02 00 00       	call   3842 <exit>

000035e0 <rand>:
  randstate = randstate * 1664525 + 1013904223;
    35e0:	69 05 f8 5c 00 00 0d 	imul   $0x19660d,0x5cf8,%eax
    35e7:	66 19 00 
{
    35ea:	55                   	push   %ebp
    35eb:	89 e5                	mov    %esp,%ebp
}
    35ed:	5d                   	pop    %ebp
  randstate = randstate * 1664525 + 1013904223;
    35ee:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    35f3:	a3 f8 5c 00 00       	mov    %eax,0x5cf8
}
    35f8:	c3                   	ret    
    35f9:	66 90                	xchg   %ax,%ax
    35fb:	66 90                	xchg   %ax,%ax
    35fd:	66 90                	xchg   %ax,%ax
    35ff:	90                   	nop

00003600 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3600:	55                   	push   %ebp
    3601:	89 e5                	mov    %esp,%ebp
    3603:	53                   	push   %ebx
    3604:	8b 45 08             	mov    0x8(%ebp),%eax
    3607:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    360a:	89 c2                	mov    %eax,%edx
    360c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3610:	83 c1 01             	add    $0x1,%ecx
    3613:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    3617:	83 c2 01             	add    $0x1,%edx
    361a:	84 db                	test   %bl,%bl
    361c:	88 5a ff             	mov    %bl,-0x1(%edx)
    361f:	75 ef                	jne    3610 <strcpy+0x10>
    ;
  return os;
}
    3621:	5b                   	pop    %ebx
    3622:	5d                   	pop    %ebp
    3623:	c3                   	ret    
    3624:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    362a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00003630 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3630:	55                   	push   %ebp
    3631:	89 e5                	mov    %esp,%ebp
    3633:	56                   	push   %esi
    3634:	53                   	push   %ebx
    3635:	8b 55 08             	mov    0x8(%ebp),%edx
    3638:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    363b:	0f b6 02             	movzbl (%edx),%eax
    363e:	0f b6 19             	movzbl (%ecx),%ebx
    3641:	84 c0                	test   %al,%al
    3643:	75 1e                	jne    3663 <strcmp+0x33>
    3645:	eb 29                	jmp    3670 <strcmp+0x40>
    3647:	89 f6                	mov    %esi,%esi
    3649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    3650:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    3653:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    3656:	8d 71 01             	lea    0x1(%ecx),%esi
  while(*p && *p == *q)
    3659:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    365d:	84 c0                	test   %al,%al
    365f:	74 0f                	je     3670 <strcmp+0x40>
    3661:	89 f1                	mov    %esi,%ecx
    3663:	38 d8                	cmp    %bl,%al
    3665:	74 e9                	je     3650 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    3667:	29 d8                	sub    %ebx,%eax
}
    3669:	5b                   	pop    %ebx
    366a:	5e                   	pop    %esi
    366b:	5d                   	pop    %ebp
    366c:	c3                   	ret    
    366d:	8d 76 00             	lea    0x0(%esi),%esi
  while(*p && *p == *q)
    3670:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    3672:	29 d8                	sub    %ebx,%eax
}
    3674:	5b                   	pop    %ebx
    3675:	5e                   	pop    %esi
    3676:	5d                   	pop    %ebp
    3677:	c3                   	ret    
    3678:	90                   	nop
    3679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003680 <strlen>:

uint
strlen(char *s)
{
    3680:	55                   	push   %ebp
    3681:	89 e5                	mov    %esp,%ebp
    3683:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    3686:	80 39 00             	cmpb   $0x0,(%ecx)
    3689:	74 12                	je     369d <strlen+0x1d>
    368b:	31 d2                	xor    %edx,%edx
    368d:	8d 76 00             	lea    0x0(%esi),%esi
    3690:	83 c2 01             	add    $0x1,%edx
    3693:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    3697:	89 d0                	mov    %edx,%eax
    3699:	75 f5                	jne    3690 <strlen+0x10>
    ;
  return n;
}
    369b:	5d                   	pop    %ebp
    369c:	c3                   	ret    
  for(n = 0; s[n]; n++)
    369d:	31 c0                	xor    %eax,%eax
}
    369f:	5d                   	pop    %ebp
    36a0:	c3                   	ret    
    36a1:	eb 0d                	jmp    36b0 <memset>
    36a3:	90                   	nop
    36a4:	90                   	nop
    36a5:	90                   	nop
    36a6:	90                   	nop
    36a7:	90                   	nop
    36a8:	90                   	nop
    36a9:	90                   	nop
    36aa:	90                   	nop
    36ab:	90                   	nop
    36ac:	90                   	nop
    36ad:	90                   	nop
    36ae:	90                   	nop
    36af:	90                   	nop

000036b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    36b0:	55                   	push   %ebp
    36b1:	89 e5                	mov    %esp,%ebp
    36b3:	57                   	push   %edi
    36b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    36b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    36ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    36bd:	89 d7                	mov    %edx,%edi
    36bf:	fc                   	cld    
    36c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    36c2:	89 d0                	mov    %edx,%eax
    36c4:	5f                   	pop    %edi
    36c5:	5d                   	pop    %ebp
    36c6:	c3                   	ret    
    36c7:	89 f6                	mov    %esi,%esi
    36c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000036d0 <strchr>:

char*
strchr(const char *s, char c)
{
    36d0:	55                   	push   %ebp
    36d1:	89 e5                	mov    %esp,%ebp
    36d3:	53                   	push   %ebx
    36d4:	8b 45 08             	mov    0x8(%ebp),%eax
    36d7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    36da:	0f b6 10             	movzbl (%eax),%edx
    36dd:	84 d2                	test   %dl,%dl
    36df:	74 1d                	je     36fe <strchr+0x2e>
    if(*s == c)
    36e1:	38 d3                	cmp    %dl,%bl
    36e3:	89 d9                	mov    %ebx,%ecx
    36e5:	75 0d                	jne    36f4 <strchr+0x24>
    36e7:	eb 17                	jmp    3700 <strchr+0x30>
    36e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    36f0:	38 ca                	cmp    %cl,%dl
    36f2:	74 0c                	je     3700 <strchr+0x30>
  for(; *s; s++)
    36f4:	83 c0 01             	add    $0x1,%eax
    36f7:	0f b6 10             	movzbl (%eax),%edx
    36fa:	84 d2                	test   %dl,%dl
    36fc:	75 f2                	jne    36f0 <strchr+0x20>
      return (char*)s;
  return 0;
    36fe:	31 c0                	xor    %eax,%eax
}
    3700:	5b                   	pop    %ebx
    3701:	5d                   	pop    %ebp
    3702:	c3                   	ret    
    3703:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003710 <gets>:

char*
gets(char *buf, int max)
{
    3710:	55                   	push   %ebp
    3711:	89 e5                	mov    %esp,%ebp
    3713:	57                   	push   %edi
    3714:	56                   	push   %esi
    3715:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3716:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    3718:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
    371b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
    371e:	eb 29                	jmp    3749 <gets+0x39>
    cc = read(0, &c, 1);
    3720:	83 ec 04             	sub    $0x4,%esp
    3723:	6a 01                	push   $0x1
    3725:	57                   	push   %edi
    3726:	6a 00                	push   $0x0
    3728:	e8 2d 01 00 00       	call   385a <read>
    if(cc < 1)
    372d:	83 c4 10             	add    $0x10,%esp
    3730:	85 c0                	test   %eax,%eax
    3732:	7e 1d                	jle    3751 <gets+0x41>
      break;
    buf[i++] = c;
    3734:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    3738:	8b 55 08             	mov    0x8(%ebp),%edx
    373b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    373d:	3c 0a                	cmp    $0xa,%al
    buf[i++] = c;
    373f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    3743:	74 1b                	je     3760 <gets+0x50>
    3745:	3c 0d                	cmp    $0xd,%al
    3747:	74 17                	je     3760 <gets+0x50>
  for(i=0; i+1 < max; ){
    3749:	8d 5e 01             	lea    0x1(%esi),%ebx
    374c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    374f:	7c cf                	jl     3720 <gets+0x10>
      break;
  }
  buf[i] = '\0';
    3751:	8b 45 08             	mov    0x8(%ebp),%eax
    3754:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    3758:	8d 65 f4             	lea    -0xc(%ebp),%esp
    375b:	5b                   	pop    %ebx
    375c:	5e                   	pop    %esi
    375d:	5f                   	pop    %edi
    375e:	5d                   	pop    %ebp
    375f:	c3                   	ret    
  buf[i] = '\0';
    3760:	8b 45 08             	mov    0x8(%ebp),%eax
  for(i=0; i+1 < max; ){
    3763:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
    3765:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
    3769:	8d 65 f4             	lea    -0xc(%ebp),%esp
    376c:	5b                   	pop    %ebx
    376d:	5e                   	pop    %esi
    376e:	5f                   	pop    %edi
    376f:	5d                   	pop    %ebp
    3770:	c3                   	ret    
    3771:	eb 0d                	jmp    3780 <stat>
    3773:	90                   	nop
    3774:	90                   	nop
    3775:	90                   	nop
    3776:	90                   	nop
    3777:	90                   	nop
    3778:	90                   	nop
    3779:	90                   	nop
    377a:	90                   	nop
    377b:	90                   	nop
    377c:	90                   	nop
    377d:	90                   	nop
    377e:	90                   	nop
    377f:	90                   	nop

00003780 <stat>:

int
stat(char *n, struct stat *st)
{
    3780:	55                   	push   %ebp
    3781:	89 e5                	mov    %esp,%ebp
    3783:	56                   	push   %esi
    3784:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3785:	83 ec 08             	sub    $0x8,%esp
    3788:	6a 00                	push   $0x0
    378a:	ff 75 08             	pushl  0x8(%ebp)
    378d:	e8 f0 00 00 00       	call   3882 <open>
  if(fd < 0)
    3792:	83 c4 10             	add    $0x10,%esp
    3795:	85 c0                	test   %eax,%eax
    3797:	78 27                	js     37c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    3799:	83 ec 08             	sub    $0x8,%esp
    379c:	ff 75 0c             	pushl  0xc(%ebp)
    379f:	89 c3                	mov    %eax,%ebx
    37a1:	50                   	push   %eax
    37a2:	e8 f3 00 00 00       	call   389a <fstat>
  close(fd);
    37a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    37aa:	89 c6                	mov    %eax,%esi
  close(fd);
    37ac:	e8 b9 00 00 00       	call   386a <close>
  return r;
    37b1:	83 c4 10             	add    $0x10,%esp
}
    37b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    37b7:	89 f0                	mov    %esi,%eax
    37b9:	5b                   	pop    %ebx
    37ba:	5e                   	pop    %esi
    37bb:	5d                   	pop    %ebp
    37bc:	c3                   	ret    
    37bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    37c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
    37c5:	eb ed                	jmp    37b4 <stat+0x34>
    37c7:	89 f6                	mov    %esi,%esi
    37c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000037d0 <atoi>:

int
atoi(const char *s)
{
    37d0:	55                   	push   %ebp
    37d1:	89 e5                	mov    %esp,%ebp
    37d3:	53                   	push   %ebx
    37d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    37d7:	0f be 11             	movsbl (%ecx),%edx
    37da:	8d 42 d0             	lea    -0x30(%edx),%eax
    37dd:	3c 09                	cmp    $0x9,%al
    37df:	b8 00 00 00 00       	mov    $0x0,%eax
    37e4:	77 1f                	ja     3805 <atoi+0x35>
    37e6:	8d 76 00             	lea    0x0(%esi),%esi
    37e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    37f0:	8d 04 80             	lea    (%eax,%eax,4),%eax
    37f3:	83 c1 01             	add    $0x1,%ecx
    37f6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    37fa:	0f be 11             	movsbl (%ecx),%edx
    37fd:	8d 5a d0             	lea    -0x30(%edx),%ebx
    3800:	80 fb 09             	cmp    $0x9,%bl
    3803:	76 eb                	jbe    37f0 <atoi+0x20>
  return n;
}
    3805:	5b                   	pop    %ebx
    3806:	5d                   	pop    %ebp
    3807:	c3                   	ret    
    3808:	90                   	nop
    3809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003810 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    3810:	55                   	push   %ebp
    3811:	89 e5                	mov    %esp,%ebp
    3813:	56                   	push   %esi
    3814:	53                   	push   %ebx
    3815:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3818:	8b 45 08             	mov    0x8(%ebp),%eax
    381b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    381e:	85 db                	test   %ebx,%ebx
    3820:	7e 14                	jle    3836 <memmove+0x26>
    3822:	31 d2                	xor    %edx,%edx
    3824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    3828:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    382c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    382f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    3832:	39 da                	cmp    %ebx,%edx
    3834:	75 f2                	jne    3828 <memmove+0x18>
  return vdst;
}
    3836:	5b                   	pop    %ebx
    3837:	5e                   	pop    %esi
    3838:	5d                   	pop    %ebp
    3839:	c3                   	ret    

0000383a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    383a:	b8 01 00 00 00       	mov    $0x1,%eax
    383f:	cd 40                	int    $0x40
    3841:	c3                   	ret    

00003842 <exit>:
SYSCALL(exit)
    3842:	b8 02 00 00 00       	mov    $0x2,%eax
    3847:	cd 40                	int    $0x40
    3849:	c3                   	ret    

0000384a <wait>:
SYSCALL(wait)
    384a:	b8 03 00 00 00       	mov    $0x3,%eax
    384f:	cd 40                	int    $0x40
    3851:	c3                   	ret    

00003852 <pipe>:
SYSCALL(pipe)
    3852:	b8 04 00 00 00       	mov    $0x4,%eax
    3857:	cd 40                	int    $0x40
    3859:	c3                   	ret    

0000385a <read>:
SYSCALL(read)
    385a:	b8 05 00 00 00       	mov    $0x5,%eax
    385f:	cd 40                	int    $0x40
    3861:	c3                   	ret    

00003862 <write>:
SYSCALL(write)
    3862:	b8 10 00 00 00       	mov    $0x10,%eax
    3867:	cd 40                	int    $0x40
    3869:	c3                   	ret    

0000386a <close>:
SYSCALL(close)
    386a:	b8 15 00 00 00       	mov    $0x15,%eax
    386f:	cd 40                	int    $0x40
    3871:	c3                   	ret    

00003872 <kill>:
SYSCALL(kill)
    3872:	b8 06 00 00 00       	mov    $0x6,%eax
    3877:	cd 40                	int    $0x40
    3879:	c3                   	ret    

0000387a <exec>:
SYSCALL(exec)
    387a:	b8 07 00 00 00       	mov    $0x7,%eax
    387f:	cd 40                	int    $0x40
    3881:	c3                   	ret    

00003882 <open>:
SYSCALL(open)
    3882:	b8 0f 00 00 00       	mov    $0xf,%eax
    3887:	cd 40                	int    $0x40
    3889:	c3                   	ret    

0000388a <mknod>:
SYSCALL(mknod)
    388a:	b8 11 00 00 00       	mov    $0x11,%eax
    388f:	cd 40                	int    $0x40
    3891:	c3                   	ret    

00003892 <unlink>:
SYSCALL(unlink)
    3892:	b8 12 00 00 00       	mov    $0x12,%eax
    3897:	cd 40                	int    $0x40
    3899:	c3                   	ret    

0000389a <fstat>:
SYSCALL(fstat)
    389a:	b8 08 00 00 00       	mov    $0x8,%eax
    389f:	cd 40                	int    $0x40
    38a1:	c3                   	ret    

000038a2 <link>:
SYSCALL(link)
    38a2:	b8 13 00 00 00       	mov    $0x13,%eax
    38a7:	cd 40                	int    $0x40
    38a9:	c3                   	ret    

000038aa <mkdir>:
SYSCALL(mkdir)
    38aa:	b8 14 00 00 00       	mov    $0x14,%eax
    38af:	cd 40                	int    $0x40
    38b1:	c3                   	ret    

000038b2 <chdir>:
SYSCALL(chdir)
    38b2:	b8 09 00 00 00       	mov    $0x9,%eax
    38b7:	cd 40                	int    $0x40
    38b9:	c3                   	ret    

000038ba <dup>:
SYSCALL(dup)
    38ba:	b8 0a 00 00 00       	mov    $0xa,%eax
    38bf:	cd 40                	int    $0x40
    38c1:	c3                   	ret    

000038c2 <getpid>:
SYSCALL(getpid)
    38c2:	b8 0b 00 00 00       	mov    $0xb,%eax
    38c7:	cd 40                	int    $0x40
    38c9:	c3                   	ret    

000038ca <sbrk>:
SYSCALL(sbrk)
    38ca:	b8 0c 00 00 00       	mov    $0xc,%eax
    38cf:	cd 40                	int    $0x40
    38d1:	c3                   	ret    

000038d2 <sleep>:
SYSCALL(sleep)
    38d2:	b8 0d 00 00 00       	mov    $0xd,%eax
    38d7:	cd 40                	int    $0x40
    38d9:	c3                   	ret    

000038da <uptime>:
SYSCALL(uptime)
    38da:	b8 0e 00 00 00       	mov    $0xe,%eax
    38df:	cd 40                	int    $0x40
    38e1:	c3                   	ret    

000038e2 <halt>:
SYSCALL(halt)
    38e2:	b8 16 00 00 00       	mov    $0x16,%eax
    38e7:	cd 40                	int    $0x40
    38e9:	c3                   	ret    
    38ea:	66 90                	xchg   %ax,%ax
    38ec:	66 90                	xchg   %ax,%ax
    38ee:	66 90                	xchg   %ax,%ax

000038f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    38f0:	55                   	push   %ebp
    38f1:	89 e5                	mov    %esp,%ebp
    38f3:	57                   	push   %edi
    38f4:	56                   	push   %esi
    38f5:	53                   	push   %ebx
    38f6:	89 c6                	mov    %eax,%esi
    38f8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    38fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    38fe:	85 db                	test   %ebx,%ebx
    3900:	74 7e                	je     3980 <printint+0x90>
    3902:	89 d0                	mov    %edx,%eax
    3904:	c1 e8 1f             	shr    $0x1f,%eax
    3907:	84 c0                	test   %al,%al
    3909:	74 75                	je     3980 <printint+0x90>
    neg = 1;
    x = -xx;
    390b:	89 d0                	mov    %edx,%eax
    neg = 1;
    390d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    3914:	f7 d8                	neg    %eax
    3916:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    3919:	31 ff                	xor    %edi,%edi
    391b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    391e:	89 ce                	mov    %ecx,%esi
    3920:	eb 08                	jmp    392a <printint+0x3a>
    3922:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    3928:	89 cf                	mov    %ecx,%edi
    392a:	31 d2                	xor    %edx,%edx
    392c:	8d 4f 01             	lea    0x1(%edi),%ecx
    392f:	f7 f6                	div    %esi
    3931:	0f b6 92 2c 54 00 00 	movzbl 0x542c(%edx),%edx
  }while((x /= base) != 0);
    3938:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    393a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    393d:	75 e9                	jne    3928 <printint+0x38>
  if(neg)
    393f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3942:	8b 75 c0             	mov    -0x40(%ebp),%esi
    3945:	85 c0                	test   %eax,%eax
    3947:	74 08                	je     3951 <printint+0x61>
    buf[i++] = '-';
    3949:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    394e:	8d 4f 02             	lea    0x2(%edi),%ecx

  while(--i >= 0)
    3951:	8d 79 ff             	lea    -0x1(%ecx),%edi
    3954:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3958:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
  write(fd, &c, 1);
    395d:	83 ec 04             	sub    $0x4,%esp
  while(--i >= 0)
    3960:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
    3963:	6a 01                	push   $0x1
    3965:	53                   	push   %ebx
    3966:	56                   	push   %esi
    3967:	88 45 d7             	mov    %al,-0x29(%ebp)
    396a:	e8 f3 fe ff ff       	call   3862 <write>
  while(--i >= 0)
    396f:	83 c4 10             	add    $0x10,%esp
    3972:	83 ff ff             	cmp    $0xffffffff,%edi
    3975:	75 e1                	jne    3958 <printint+0x68>
    putc(fd, buf[i]);
}
    3977:	8d 65 f4             	lea    -0xc(%ebp),%esp
    397a:	5b                   	pop    %ebx
    397b:	5e                   	pop    %esi
    397c:	5f                   	pop    %edi
    397d:	5d                   	pop    %ebp
    397e:	c3                   	ret    
    397f:	90                   	nop
    x = xx;
    3980:	89 d0                	mov    %edx,%eax
  neg = 0;
    3982:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    3989:	eb 8b                	jmp    3916 <printint+0x26>
    398b:	90                   	nop
    398c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003990 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3990:	55                   	push   %ebp
    3991:	89 e5                	mov    %esp,%ebp
    3993:	57                   	push   %edi
    3994:	56                   	push   %esi
    3995:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3996:	8d 45 10             	lea    0x10(%ebp),%eax
{
    3999:	83 ec 2c             	sub    $0x2c,%esp
  for(i = 0; fmt[i]; i++){
    399c:	8b 75 0c             	mov    0xc(%ebp),%esi
{
    399f:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
    39a2:	89 45 d0             	mov    %eax,-0x30(%ebp)
    39a5:	0f b6 1e             	movzbl (%esi),%ebx
    39a8:	83 c6 01             	add    $0x1,%esi
    39ab:	84 db                	test   %bl,%bl
    39ad:	0f 84 b0 00 00 00    	je     3a63 <printf+0xd3>
    39b3:	31 d2                	xor    %edx,%edx
    39b5:	eb 39                	jmp    39f0 <printf+0x60>
    39b7:	89 f6                	mov    %esi,%esi
    39b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    39c0:	83 f8 25             	cmp    $0x25,%eax
    39c3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    39c6:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    39cb:	74 18                	je     39e5 <printf+0x55>
  write(fd, &c, 1);
    39cd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    39d0:	83 ec 04             	sub    $0x4,%esp
    39d3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    39d6:	6a 01                	push   $0x1
    39d8:	50                   	push   %eax
    39d9:	57                   	push   %edi
    39da:	e8 83 fe ff ff       	call   3862 <write>
    39df:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    39e2:	83 c4 10             	add    $0x10,%esp
    39e5:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    39e8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    39ec:	84 db                	test   %bl,%bl
    39ee:	74 73                	je     3a63 <printf+0xd3>
    if(state == 0){
    39f0:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    39f2:	0f be cb             	movsbl %bl,%ecx
    39f5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    39f8:	74 c6                	je     39c0 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    39fa:	83 fa 25             	cmp    $0x25,%edx
    39fd:	75 e6                	jne    39e5 <printf+0x55>
      if(c == 'd'){
    39ff:	83 f8 64             	cmp    $0x64,%eax
    3a02:	0f 84 f8 00 00 00    	je     3b00 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    3a08:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    3a0e:	83 f9 70             	cmp    $0x70,%ecx
    3a11:	74 5d                	je     3a70 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3a13:	83 f8 73             	cmp    $0x73,%eax
    3a16:	0f 84 84 00 00 00    	je     3aa0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3a1c:	83 f8 63             	cmp    $0x63,%eax
    3a1f:	0f 84 ea 00 00 00    	je     3b0f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3a25:	83 f8 25             	cmp    $0x25,%eax
    3a28:	0f 84 c2 00 00 00    	je     3af0 <printf+0x160>
  write(fd, &c, 1);
    3a2e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    3a31:	83 ec 04             	sub    $0x4,%esp
    3a34:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    3a38:	6a 01                	push   $0x1
    3a3a:	50                   	push   %eax
    3a3b:	57                   	push   %edi
    3a3c:	e8 21 fe ff ff       	call   3862 <write>
    3a41:	83 c4 0c             	add    $0xc,%esp
    3a44:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    3a47:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    3a4a:	6a 01                	push   $0x1
    3a4c:	50                   	push   %eax
    3a4d:	57                   	push   %edi
    3a4e:	83 c6 01             	add    $0x1,%esi
    3a51:	e8 0c fe ff ff       	call   3862 <write>
  for(i = 0; fmt[i]; i++){
    3a56:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    3a5a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3a5d:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    3a5f:	84 db                	test   %bl,%bl
    3a61:	75 8d                	jne    39f0 <printf+0x60>
    }
  }
}
    3a63:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3a66:	5b                   	pop    %ebx
    3a67:	5e                   	pop    %esi
    3a68:	5f                   	pop    %edi
    3a69:	5d                   	pop    %ebp
    3a6a:	c3                   	ret    
    3a6b:	90                   	nop
    3a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 16, 0);
    3a70:	83 ec 0c             	sub    $0xc,%esp
    3a73:	b9 10 00 00 00       	mov    $0x10,%ecx
    3a78:	6a 00                	push   $0x0
    3a7a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    3a7d:	89 f8                	mov    %edi,%eax
    3a7f:	8b 13                	mov    (%ebx),%edx
    3a81:	e8 6a fe ff ff       	call   38f0 <printint>
        ap++;
    3a86:	89 d8                	mov    %ebx,%eax
    3a88:	83 c4 10             	add    $0x10,%esp
      state = 0;
    3a8b:	31 d2                	xor    %edx,%edx
        ap++;
    3a8d:	83 c0 04             	add    $0x4,%eax
    3a90:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3a93:	e9 4d ff ff ff       	jmp    39e5 <printf+0x55>
    3a98:	90                   	nop
    3a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    3aa0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3aa3:	8b 18                	mov    (%eax),%ebx
        ap++;
    3aa5:	83 c0 04             	add    $0x4,%eax
    3aa8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    3aab:	85 db                	test   %ebx,%ebx
    3aad:	74 7c                	je     3b2b <printf+0x19b>
        while(*s != 0){
    3aaf:	0f b6 03             	movzbl (%ebx),%eax
    3ab2:	84 c0                	test   %al,%al
    3ab4:	74 29                	je     3adf <printf+0x14f>
    3ab6:	8d 76 00             	lea    0x0(%esi),%esi
    3ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3ac0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    3ac3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    3ac6:	83 ec 04             	sub    $0x4,%esp
    3ac9:	6a 01                	push   $0x1
          s++;
    3acb:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    3ace:	50                   	push   %eax
    3acf:	57                   	push   %edi
    3ad0:	e8 8d fd ff ff       	call   3862 <write>
        while(*s != 0){
    3ad5:	0f b6 03             	movzbl (%ebx),%eax
    3ad8:	83 c4 10             	add    $0x10,%esp
    3adb:	84 c0                	test   %al,%al
    3add:	75 e1                	jne    3ac0 <printf+0x130>
      state = 0;
    3adf:	31 d2                	xor    %edx,%edx
    3ae1:	e9 ff fe ff ff       	jmp    39e5 <printf+0x55>
    3ae6:	8d 76 00             	lea    0x0(%esi),%esi
    3ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  write(fd, &c, 1);
    3af0:	83 ec 04             	sub    $0x4,%esp
    3af3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    3af6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    3af9:	6a 01                	push   $0x1
    3afb:	e9 4c ff ff ff       	jmp    3a4c <printf+0xbc>
        printint(fd, *ap, 10, 1);
    3b00:	83 ec 0c             	sub    $0xc,%esp
    3b03:	b9 0a 00 00 00       	mov    $0xa,%ecx
    3b08:	6a 01                	push   $0x1
    3b0a:	e9 6b ff ff ff       	jmp    3a7a <printf+0xea>
        putc(fd, *ap);
    3b0f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    3b12:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    3b15:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    3b17:	6a 01                	push   $0x1
        putc(fd, *ap);
    3b19:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    3b1c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3b1f:	50                   	push   %eax
    3b20:	57                   	push   %edi
    3b21:	e8 3c fd ff ff       	call   3862 <write>
    3b26:	e9 5b ff ff ff       	jmp    3a86 <printf+0xf6>
        while(*s != 0){
    3b2b:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
    3b30:	bb 24 54 00 00       	mov    $0x5424,%ebx
    3b35:	eb 89                	jmp    3ac0 <printf+0x130>
    3b37:	66 90                	xchg   %ax,%ax
    3b39:	66 90                	xchg   %ax,%ax
    3b3b:	66 90                	xchg   %ax,%ax
    3b3d:	66 90                	xchg   %ax,%ax
    3b3f:	90                   	nop

00003b40 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3b40:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3b41:	a1 a0 5d 00 00       	mov    0x5da0,%eax
{
    3b46:	89 e5                	mov    %esp,%ebp
    3b48:	57                   	push   %edi
    3b49:	56                   	push   %esi
    3b4a:	53                   	push   %ebx
    3b4b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3b4e:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    3b50:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3b53:	39 c8                	cmp    %ecx,%eax
    3b55:	73 19                	jae    3b70 <free+0x30>
    3b57:	89 f6                	mov    %esi,%esi
    3b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3b60:	39 d1                	cmp    %edx,%ecx
    3b62:	72 1c                	jb     3b80 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3b64:	39 d0                	cmp    %edx,%eax
    3b66:	73 18                	jae    3b80 <free+0x40>
{
    3b68:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3b6a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3b6c:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3b6e:	72 f0                	jb     3b60 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3b70:	39 d0                	cmp    %edx,%eax
    3b72:	72 f4                	jb     3b68 <free+0x28>
    3b74:	39 d1                	cmp    %edx,%ecx
    3b76:	73 f0                	jae    3b68 <free+0x28>
    3b78:	90                   	nop
    3b79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    3b80:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3b83:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3b86:	39 fa                	cmp    %edi,%edx
    3b88:	74 19                	je     3ba3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    3b8a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3b8d:	8b 50 04             	mov    0x4(%eax),%edx
    3b90:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3b93:	39 f1                	cmp    %esi,%ecx
    3b95:	74 23                	je     3bba <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    3b97:	89 08                	mov    %ecx,(%eax)
  freep = p;
    3b99:	a3 a0 5d 00 00       	mov    %eax,0x5da0
}
    3b9e:	5b                   	pop    %ebx
    3b9f:	5e                   	pop    %esi
    3ba0:	5f                   	pop    %edi
    3ba1:	5d                   	pop    %ebp
    3ba2:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
    3ba3:	03 72 04             	add    0x4(%edx),%esi
    3ba6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    3ba9:	8b 10                	mov    (%eax),%edx
    3bab:	8b 12                	mov    (%edx),%edx
    3bad:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3bb0:	8b 50 04             	mov    0x4(%eax),%edx
    3bb3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3bb6:	39 f1                	cmp    %esi,%ecx
    3bb8:	75 dd                	jne    3b97 <free+0x57>
    p->s.size += bp->s.size;
    3bba:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    3bbd:	a3 a0 5d 00 00       	mov    %eax,0x5da0
    p->s.size += bp->s.size;
    3bc2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3bc5:	8b 53 f8             	mov    -0x8(%ebx),%edx
    3bc8:	89 10                	mov    %edx,(%eax)
}
    3bca:	5b                   	pop    %ebx
    3bcb:	5e                   	pop    %esi
    3bcc:	5f                   	pop    %edi
    3bcd:	5d                   	pop    %ebp
    3bce:	c3                   	ret    
    3bcf:	90                   	nop

00003bd0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3bd0:	55                   	push   %ebp
    3bd1:	89 e5                	mov    %esp,%ebp
    3bd3:	57                   	push   %edi
    3bd4:	56                   	push   %esi
    3bd5:	53                   	push   %ebx
    3bd6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3bd9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    3bdc:	8b 15 a0 5d 00 00    	mov    0x5da0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3be2:	8d 78 07             	lea    0x7(%eax),%edi
    3be5:	c1 ef 03             	shr    $0x3,%edi
    3be8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    3beb:	85 d2                	test   %edx,%edx
    3bed:	0f 84 93 00 00 00    	je     3c86 <malloc+0xb6>
    3bf3:	8b 02                	mov    (%edx),%eax
    3bf5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    3bf8:	39 cf                	cmp    %ecx,%edi
    3bfa:	76 64                	jbe    3c60 <malloc+0x90>
    3bfc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    3c02:	bb 00 10 00 00       	mov    $0x1000,%ebx
    3c07:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    3c0a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    3c11:	eb 0e                	jmp    3c21 <malloc+0x51>
    3c13:	90                   	nop
    3c14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3c18:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    3c1a:	8b 48 04             	mov    0x4(%eax),%ecx
    3c1d:	39 cf                	cmp    %ecx,%edi
    3c1f:	76 3f                	jbe    3c60 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3c21:	39 05 a0 5d 00 00    	cmp    %eax,0x5da0
    3c27:	89 c2                	mov    %eax,%edx
    3c29:	75 ed                	jne    3c18 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    3c2b:	83 ec 0c             	sub    $0xc,%esp
    3c2e:	56                   	push   %esi
    3c2f:	e8 96 fc ff ff       	call   38ca <sbrk>
  if(p == (char*)-1)
    3c34:	83 c4 10             	add    $0x10,%esp
    3c37:	83 f8 ff             	cmp    $0xffffffff,%eax
    3c3a:	74 1c                	je     3c58 <malloc+0x88>
  hp->s.size = nu;
    3c3c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    3c3f:	83 ec 0c             	sub    $0xc,%esp
    3c42:	83 c0 08             	add    $0x8,%eax
    3c45:	50                   	push   %eax
    3c46:	e8 f5 fe ff ff       	call   3b40 <free>
  return freep;
    3c4b:	8b 15 a0 5d 00 00    	mov    0x5da0,%edx
      if((p = morecore(nunits)) == 0)
    3c51:	83 c4 10             	add    $0x10,%esp
    3c54:	85 d2                	test   %edx,%edx
    3c56:	75 c0                	jne    3c18 <malloc+0x48>
        return 0;
    3c58:	31 c0                	xor    %eax,%eax
    3c5a:	eb 1c                	jmp    3c78 <malloc+0xa8>
    3c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    3c60:	39 cf                	cmp    %ecx,%edi
    3c62:	74 1c                	je     3c80 <malloc+0xb0>
        p->s.size -= nunits;
    3c64:	29 f9                	sub    %edi,%ecx
    3c66:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    3c69:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    3c6c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    3c6f:	89 15 a0 5d 00 00    	mov    %edx,0x5da0
      return (void*)(p + 1);
    3c75:	83 c0 08             	add    $0x8,%eax
  }
}
    3c78:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3c7b:	5b                   	pop    %ebx
    3c7c:	5e                   	pop    %esi
    3c7d:	5f                   	pop    %edi
    3c7e:	5d                   	pop    %ebp
    3c7f:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    3c80:	8b 08                	mov    (%eax),%ecx
    3c82:	89 0a                	mov    %ecx,(%edx)
    3c84:	eb e9                	jmp    3c6f <malloc+0x9f>
    base.s.ptr = freep = prevp = &base;
    3c86:	c7 05 a0 5d 00 00 a4 	movl   $0x5da4,0x5da0
    3c8d:	5d 00 00 
    3c90:	c7 05 a4 5d 00 00 a4 	movl   $0x5da4,0x5da4
    3c97:	5d 00 00 
    base.s.size = 0;
    3c9a:	b8 a4 5d 00 00       	mov    $0x5da4,%eax
    3c9f:	c7 05 a8 5d 00 00 00 	movl   $0x0,0x5da8
    3ca6:	00 00 00 
    3ca9:	e9 4e ff ff ff       	jmp    3bfc <malloc+0x2c>
