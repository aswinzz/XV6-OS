
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc d0 b5 10 80       	mov    $0x8010b5d0,%esp
8010002d:	b8 f0 2e 10 80       	mov    $0x80102ef0,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb 14 b6 10 80       	mov    $0x8010b614,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 60 6f 10 80       	push   $0x80106f60
80100051:	68 e0 b5 10 80       	push   $0x8010b5e0
80100056:	e8 05 42 00 00       	call   80104260 <initlock>
8010005b:	c7 05 2c fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd2c
80100062:	fc 10 80 
80100065:	c7 05 30 fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd30
8010006c:	fc 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba dc fc 10 80       	mov    $0x8010fcdc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
8010008b:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
80100092:	68 67 6f 10 80       	push   $0x80106f67
80100097:	50                   	push   %eax
80100098:	e8 b3 40 00 00       	call   80104150 <initsleeplock>
8010009d:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000b0:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30
801000b6:	3d dc fc 10 80       	cmp    $0x8010fcdc,%eax
801000bb:	72 c3                	jb     80100080 <binit+0x40>
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000df:	68 e0 b5 10 80       	push   $0x8010b5e0
801000e4:	e8 97 41 00 00       	call   80104280 <acquire>
801000e9:	8b 1d 30 fd 10 80    	mov    0x8010fd30,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100120:	8b 1d 2c fd 10 80    	mov    0x8010fd2c,%ebx
80100126:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 e0 b5 10 80       	push   $0x8010b5e0
80100162:	e8 f9 42 00 00       	call   80104460 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 1e 40 00 00       	call   80104190 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 4d 1f 00 00       	call   801020d0 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 6e 6f 10 80       	push   $0x80106f6e
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 7d 40 00 00       	call   80104230 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
801001c4:	e9 07 1f 00 00       	jmp    801020d0 <iderw>
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 7f 6f 10 80       	push   $0x80106f7f
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 3c 40 00 00       	call   80104230 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 ec 3f 00 00       	call   801041f0 <releasesleep>
80100204:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
8010020b:	e8 70 40 00 00       	call   80104280 <acquire>
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100213:	83 c4 10             	add    $0x10,%esp
80100216:	83 e8 01             	sub    $0x1,%eax
80100219:	85 c0                	test   %eax,%eax
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
80100232:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
80100237:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
80100241:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
80100249:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30
8010024f:	c7 45 08 e0 b5 10 80 	movl   $0x8010b5e0,0x8(%ebp)
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
8010025c:	e9 ff 41 00 00       	jmp    80104460 <release>
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 86 6f 10 80       	push   $0x80106f86
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010027f:	57                   	push   %edi
80100280:	e8 bb 14 00 00       	call   80101740 <iunlock>
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 ef 3f 00 00       	call   80104280 <acquire>
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
801002a1:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801002a6:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 20 a5 10 80       	push   $0x8010a520
801002b8:	68 c0 ff 10 80       	push   $0x8010ffc0
801002bd:	e8 2e 3b 00 00       	call   80103df0 <sleep>
801002c2:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
801002d2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801002d8:	8b 40 24             	mov    0x24(%eax),%eax
801002db:	85 c0                	test   %eax,%eax
801002dd:	74 d1                	je     801002b0 <consoleread+0x40>
801002df:	83 ec 0c             	sub    $0xc,%esp
801002e2:	68 20 a5 10 80       	push   $0x8010a520
801002e7:	e8 74 41 00 00       	call   80104460 <release>
801002ec:	89 3c 24             	mov    %edi,(%esp)
801002ef:	e8 6c 13 00 00       	call   80101660 <ilock>
801002f4:	83 c4 10             	add    $0x10,%esp
801002f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801002fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002ff:	5b                   	pop    %ebx
80100300:	5e                   	pop    %esi
80100301:	5f                   	pop    %edi
80100302:	5d                   	pop    %ebp
80100303:	c3                   	ret    
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 c0 ff 10 80    	mov    %edx,0x8010ffc0
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 40 ff 10 80 	movsbl -0x7fef00c0(%edx),%edx
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
80100322:	83 c6 01             	add    $0x1,%esi
80100325:	83 eb 01             	sub    $0x1,%ebx
80100328:	83 fa 0a             	cmp    $0xa,%edx
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 20 a5 10 80       	push   $0x8010a520
80100346:	e8 15 41 00 00       	call   80104460 <release>
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 0d 13 00 00       	call   80101660 <ilock>
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a1                	jmp    801002fc <consoleread+0x8c>
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
80100360:	a3 c0 ff 10 80       	mov    %eax,0x8010ffc0
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 38             	sub    $0x38,%esp
80100378:	fa                   	cli    
80100379:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010037f:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
80100386:	00 00 00 
80100389:	8d 5d d0             	lea    -0x30(%ebp),%ebx
8010038c:	8d 75 f8             	lea    -0x8(%ebp),%esi
8010038f:	0f b6 00             	movzbl (%eax),%eax
80100392:	50                   	push   %eax
80100393:	68 8d 6f 10 80       	push   $0x80106f8d
80100398:	e8 c3 02 00 00       	call   80100660 <cprintf>
8010039d:	58                   	pop    %eax
8010039e:	ff 75 08             	pushl  0x8(%ebp)
801003a1:	e8 ba 02 00 00       	call   80100660 <cprintf>
801003a6:	c7 04 24 86 74 10 80 	movl   $0x80107486,(%esp)
801003ad:	e8 ae 02 00 00       	call   80100660 <cprintf>
801003b2:	5a                   	pop    %edx
801003b3:	8d 45 08             	lea    0x8(%ebp),%eax
801003b6:	59                   	pop    %ecx
801003b7:	53                   	push   %ebx
801003b8:	50                   	push   %eax
801003b9:	e8 92 3f 00 00       	call   80104350 <getcallerpcs>
801003be:	83 c4 10             	add    $0x10,%esp
801003c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801003c8:	83 ec 08             	sub    $0x8,%esp
801003cb:	ff 33                	pushl  (%ebx)
801003cd:	83 c3 04             	add    $0x4,%ebx
801003d0:	68 a9 6f 10 80       	push   $0x80106fa9
801003d5:	e8 86 02 00 00       	call   80100660 <cprintf>
801003da:	83 c4 10             	add    $0x10,%esp
801003dd:	39 f3                	cmp    %esi,%ebx
801003df:	75 e7                	jne    801003c8 <panic+0x58>
801003e1:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003e8:	00 00 00 
801003eb:	eb fe                	jmp    801003eb <panic+0x7b>
801003ed:	8d 76 00             	lea    0x0(%esi),%esi

801003f0 <consputc>:
801003f0:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 61 57 00 00       	call   80105b80 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
8010042f:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100434:	89 ca                	mov    %ecx,%edx
80100436:	ec                   	in     (%dx),%al
80100437:	0f b6 c0             	movzbl %al,%eax
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c6                	mov    %eax,%esi
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
80100447:	89 ca                	mov    %ecx,%edx
80100449:	ec                   	in     (%dx),%al
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 f0                	or     %esi,%eax
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 9c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ebx
80100492:	89 f9                	mov    %edi,%ecx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
80100499:	bf d4 03 00 00       	mov    $0x3d4,%edi
8010049e:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a3:	89 fa                	mov    %edi,%edx
801004a5:	ee                   	out    %al,(%dx)
801004a6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004ab:	89 f0                	mov    %esi,%eax
801004ad:	ee                   	out    %al,(%dx)
801004ae:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b3:	89 fa                	mov    %edi,%edx
801004b5:	ee                   	out    %al,(%dx)
801004b6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004bb:	89 c8                	mov    %ecx,%eax
801004bd:	ee                   	out    %al,(%dx)
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 03             	mov    %ax,(%ebx)
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 a8 56 00 00       	call   80105b80 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 9c 56 00 00       	call   80105b80 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 90 56 00 00       	call   80105b80 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>
801004f8:	83 ec 04             	sub    $0x4,%esp
801004fb:	83 ef 50             	sub    $0x50,%edi
801004fe:	be 07 00 00 00       	mov    $0x7,%esi
80100503:	68 60 0e 00 00       	push   $0xe60
80100508:	68 a0 80 0b 80       	push   $0x800b80a0
8010050d:	8d 9c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ebx
80100514:	68 00 80 0b 80       	push   $0x800b8000
80100519:	e8 42 40 00 00       	call   80104560 <memmove>
8010051e:	b8 80 07 00 00       	mov    $0x780,%eax
80100523:	83 c4 0c             	add    $0xc,%esp
80100526:	29 f8                	sub    %edi,%eax
80100528:	01 c0                	add    %eax,%eax
8010052a:	50                   	push   %eax
8010052b:	6a 00                	push   $0x0
8010052d:	53                   	push   %ebx
8010052e:	e8 7d 3f 00 00       	call   801044b0 <memset>
80100533:	89 f9                	mov    %edi,%ecx
80100535:	83 c4 10             	add    $0x10,%esp
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 ad 6f 10 80       	push   $0x80106fad
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	bb 00 80 0b 80       	mov    $0x800b8000,%ebx
8010055a:	31 c9                	xor    %ecx,%ecx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
80100563:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100568:	f7 ea                	imul   %edx
8010056a:	89 d0                	mov    %edx,%eax
8010056c:	c1 e8 05             	shr    $0x5,%eax
8010056f:	8d 04 80             	lea    (%eax,%eax,4),%eax
80100572:	c1 e0 04             	shl    $0x4,%eax
80100575:	8d 78 50             	lea    0x50(%eax),%edi
80100578:	e9 f8 fe ff ff       	jmp    80100475 <consputc+0x85>
8010057d:	8d 76 00             	lea    0x0(%esi),%esi

80100580 <printint>:
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 1c             	sub    $0x1c,%esp
8010058b:	85 c9                	test   %ecx,%ecx
8010058d:	74 04                	je     80100593 <printint+0x13>
8010058f:	85 c0                	test   %eax,%eax
80100591:	78 57                	js     801005ea <printint+0x6a>
80100593:	31 ff                	xor    %edi,%edi
80100595:	31 c9                	xor    %ecx,%ecx
80100597:	eb 09                	jmp    801005a2 <printint+0x22>
80100599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801005a0:	89 d9                	mov    %ebx,%ecx
801005a2:	31 d2                	xor    %edx,%edx
801005a4:	8d 59 01             	lea    0x1(%ecx),%ebx
801005a7:	f7 f6                	div    %esi
801005a9:	0f b6 92 d8 6f 10 80 	movzbl -0x7fef9028(%edx),%edx
801005b0:	85 c0                	test   %eax,%eax
801005b2:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
801005b6:	75 e8                	jne    801005a0 <printint+0x20>
801005b8:	85 ff                	test   %edi,%edi
801005ba:	74 08                	je     801005c4 <printint+0x44>
801005bc:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
801005c1:	8d 59 02             	lea    0x2(%ecx),%ebx
801005c4:	83 eb 01             	sub    $0x1,%ebx
801005c7:	89 f6                	mov    %esi,%esi
801005c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801005d0:	0f be 44 1d d8       	movsbl -0x28(%ebp,%ebx,1),%eax
801005d5:	83 eb 01             	sub    $0x1,%ebx
801005d8:	e8 13 fe ff ff       	call   801003f0 <consputc>
801005dd:	83 fb ff             	cmp    $0xffffffff,%ebx
801005e0:	75 ee                	jne    801005d0 <printint+0x50>
801005e2:	83 c4 1c             	add    $0x1c,%esp
801005e5:	5b                   	pop    %ebx
801005e6:	5e                   	pop    %esi
801005e7:	5f                   	pop    %edi
801005e8:	5d                   	pop    %ebp
801005e9:	c3                   	ret    
801005ea:	f7 d8                	neg    %eax
801005ec:	bf 01 00 00 00       	mov    $0x1,%edi
801005f1:	eb a2                	jmp    80100595 <printint+0x15>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
80100609:	ff 75 08             	pushl  0x8(%ebp)
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
8010060f:	e8 2c 11 00 00       	call   80101740 <iunlock>
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 60 3c 00 00       	call   80104280 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
8010063b:	39 fb                	cmp    %edi,%ebx
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 14 3e 00 00       	call   80104460 <release>
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 0b 10 00 00       	call   80101660 <ilock>
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
8010066e:	85 c0                	test   %eax,%eax
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100673:	0f 85 27 01 00 00    	jne    801007a0 <cprintf+0x140>
80100679:	8b 75 08             	mov    0x8(%ebp),%esi
8010067c:	85 f6                	test   %esi,%esi
8010067e:	0f 84 40 01 00 00    	je     801007c4 <cprintf+0x164>
80100684:	0f b6 06             	movzbl (%esi),%eax
80100687:	31 db                	xor    %ebx,%ebx
80100689:	8d 7d 0c             	lea    0xc(%ebp),%edi
8010068c:	85 c0                	test   %eax,%eax
8010068e:	75 51                	jne    801006e1 <cprintf+0x81>
80100690:	eb 64                	jmp    801006f6 <cprintf+0x96>
80100692:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100698:	83 c3 01             	add    $0x1,%ebx
8010069b:	0f b6 14 1e          	movzbl (%esi,%ebx,1),%edx
8010069f:	85 d2                	test   %edx,%edx
801006a1:	74 53                	je     801006f6 <cprintf+0x96>
801006a3:	83 fa 70             	cmp    $0x70,%edx
801006a6:	74 7a                	je     80100722 <cprintf+0xc2>
801006a8:	7f 6e                	jg     80100718 <cprintf+0xb8>
801006aa:	83 fa 25             	cmp    $0x25,%edx
801006ad:	0f 84 ad 00 00 00    	je     80100760 <cprintf+0x100>
801006b3:	83 fa 64             	cmp    $0x64,%edx
801006b6:	0f 85 84 00 00 00    	jne    80100740 <cprintf+0xe0>
801006bc:	8d 47 04             	lea    0x4(%edi),%eax
801006bf:	b9 01 00 00 00       	mov    $0x1,%ecx
801006c4:	ba 0a 00 00 00       	mov    $0xa,%edx
801006c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006cc:	8b 07                	mov    (%edi),%eax
801006ce:	e8 ad fe ff ff       	call   80100580 <printint>
801006d3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801006d6:	83 c3 01             	add    $0x1,%ebx
801006d9:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
801006dd:	85 c0                	test   %eax,%eax
801006df:	74 15                	je     801006f6 <cprintf+0x96>
801006e1:	83 f8 25             	cmp    $0x25,%eax
801006e4:	74 b2                	je     80100698 <cprintf+0x38>
801006e6:	e8 05 fd ff ff       	call   801003f0 <consputc>
801006eb:	83 c3 01             	add    $0x1,%ebx
801006ee:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
801006f2:	85 c0                	test   %eax,%eax
801006f4:	75 eb                	jne    801006e1 <cprintf+0x81>
801006f6:	8b 45 e0             	mov    -0x20(%ebp),%eax
801006f9:	85 c0                	test   %eax,%eax
801006fb:	74 10                	je     8010070d <cprintf+0xad>
801006fd:	83 ec 0c             	sub    $0xc,%esp
80100700:	68 20 a5 10 80       	push   $0x8010a520
80100705:	e8 56 3d 00 00       	call   80104460 <release>
8010070a:	83 c4 10             	add    $0x10,%esp
8010070d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100710:	5b                   	pop    %ebx
80100711:	5e                   	pop    %esi
80100712:	5f                   	pop    %edi
80100713:	5d                   	pop    %ebp
80100714:	c3                   	ret    
80100715:	8d 76 00             	lea    0x0(%esi),%esi
80100718:	83 fa 73             	cmp    $0x73,%edx
8010071b:	74 53                	je     80100770 <cprintf+0x110>
8010071d:	83 fa 78             	cmp    $0x78,%edx
80100720:	75 1e                	jne    80100740 <cprintf+0xe0>
80100722:	8d 47 04             	lea    0x4(%edi),%eax
80100725:	31 c9                	xor    %ecx,%ecx
80100727:	ba 10 00 00 00       	mov    $0x10,%edx
8010072c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010072f:	8b 07                	mov    (%edi),%eax
80100731:	e8 4a fe ff ff       	call   80100580 <printint>
80100736:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80100739:	eb 9b                	jmp    801006d6 <cprintf+0x76>
8010073b:	90                   	nop
8010073c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100740:	b8 25 00 00 00       	mov    $0x25,%eax
80100745:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100748:	e8 a3 fc ff ff       	call   801003f0 <consputc>
8010074d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100750:	89 d0                	mov    %edx,%eax
80100752:	e8 99 fc ff ff       	call   801003f0 <consputc>
80100757:	e9 7a ff ff ff       	jmp    801006d6 <cprintf+0x76>
8010075c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100760:	b8 25 00 00 00       	mov    $0x25,%eax
80100765:	e8 86 fc ff ff       	call   801003f0 <consputc>
8010076a:	e9 7c ff ff ff       	jmp    801006eb <cprintf+0x8b>
8010076f:	90                   	nop
80100770:	8d 47 04             	lea    0x4(%edi),%eax
80100773:	8b 3f                	mov    (%edi),%edi
80100775:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100778:	85 ff                	test   %edi,%edi
8010077a:	75 0c                	jne    80100788 <cprintf+0x128>
8010077c:	eb 3a                	jmp    801007b8 <cprintf+0x158>
8010077e:	66 90                	xchg   %ax,%ax
80100780:	83 c7 01             	add    $0x1,%edi
80100783:	e8 68 fc ff ff       	call   801003f0 <consputc>
80100788:	0f be 07             	movsbl (%edi),%eax
8010078b:	84 c0                	test   %al,%al
8010078d:	75 f1                	jne    80100780 <cprintf+0x120>
8010078f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80100792:	e9 3f ff ff ff       	jmp    801006d6 <cprintf+0x76>
80100797:	89 f6                	mov    %esi,%esi
80100799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801007a0:	83 ec 0c             	sub    $0xc,%esp
801007a3:	68 20 a5 10 80       	push   $0x8010a520
801007a8:	e8 d3 3a 00 00       	call   80104280 <acquire>
801007ad:	83 c4 10             	add    $0x10,%esp
801007b0:	e9 c4 fe ff ff       	jmp    80100679 <cprintf+0x19>
801007b5:	8d 76 00             	lea    0x0(%esi),%esi
801007b8:	b8 28 00 00 00       	mov    $0x28,%eax
801007bd:	bf c0 6f 10 80       	mov    $0x80106fc0,%edi
801007c2:	eb bc                	jmp    80100780 <cprintf+0x120>
801007c4:	83 ec 0c             	sub    $0xc,%esp
801007c7:	68 c7 6f 10 80       	push   $0x80106fc7
801007cc:	e8 9f fb ff ff       	call   80100370 <panic>
801007d1:	eb 0d                	jmp    801007e0 <consoleintr>
801007d3:	90                   	nop
801007d4:	90                   	nop
801007d5:	90                   	nop
801007d6:	90                   	nop
801007d7:	90                   	nop
801007d8:	90                   	nop
801007d9:	90                   	nop
801007da:	90                   	nop
801007db:	90                   	nop
801007dc:	90                   	nop
801007dd:	90                   	nop
801007de:	90                   	nop
801007df:	90                   	nop

801007e0 <consoleintr>:
801007e0:	55                   	push   %ebp
801007e1:	89 e5                	mov    %esp,%ebp
801007e3:	57                   	push   %edi
801007e4:	56                   	push   %esi
801007e5:	53                   	push   %ebx
801007e6:	31 f6                	xor    %esi,%esi
801007e8:	83 ec 18             	sub    $0x18,%esp
801007eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
801007ee:	68 20 a5 10 80       	push   $0x8010a520
801007f3:	e8 88 3a 00 00       	call   80104280 <acquire>
801007f8:	83 c4 10             	add    $0x10,%esp
801007fb:	90                   	nop
801007fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100800:	ff d3                	call   *%ebx
80100802:	85 c0                	test   %eax,%eax
80100804:	89 c7                	mov    %eax,%edi
80100806:	78 48                	js     80100850 <consoleintr+0x70>
80100808:	83 ff 10             	cmp    $0x10,%edi
8010080b:	0f 84 3f 01 00 00    	je     80100950 <consoleintr+0x170>
80100811:	7e 5d                	jle    80100870 <consoleintr+0x90>
80100813:	83 ff 15             	cmp    $0x15,%edi
80100816:	0f 84 dc 00 00 00    	je     801008f8 <consoleintr+0x118>
8010081c:	83 ff 7f             	cmp    $0x7f,%edi
8010081f:	75 54                	jne    80100875 <consoleintr+0x95>
80100821:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100826:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
8010082c:	74 d2                	je     80100800 <consoleintr+0x20>
8010082e:	83 e8 01             	sub    $0x1,%eax
80100831:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
80100836:	b8 00 01 00 00       	mov    $0x100,%eax
8010083b:	e8 b0 fb ff ff       	call   801003f0 <consputc>
80100840:	ff d3                	call   *%ebx
80100842:	85 c0                	test   %eax,%eax
80100844:	89 c7                	mov    %eax,%edi
80100846:	79 c0                	jns    80100808 <consoleintr+0x28>
80100848:	90                   	nop
80100849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100850:	83 ec 0c             	sub    $0xc,%esp
80100853:	68 20 a5 10 80       	push   $0x8010a520
80100858:	e8 03 3c 00 00       	call   80104460 <release>
8010085d:	83 c4 10             	add    $0x10,%esp
80100860:	85 f6                	test   %esi,%esi
80100862:	0f 85 f8 00 00 00    	jne    80100960 <consoleintr+0x180>
80100868:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010086b:	5b                   	pop    %ebx
8010086c:	5e                   	pop    %esi
8010086d:	5f                   	pop    %edi
8010086e:	5d                   	pop    %ebp
8010086f:	c3                   	ret    
80100870:	83 ff 08             	cmp    $0x8,%edi
80100873:	74 ac                	je     80100821 <consoleintr+0x41>
80100875:	85 ff                	test   %edi,%edi
80100877:	74 87                	je     80100800 <consoleintr+0x20>
80100879:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010087e:	89 c2                	mov    %eax,%edx
80100880:	2b 15 c0 ff 10 80    	sub    0x8010ffc0,%edx
80100886:	83 fa 7f             	cmp    $0x7f,%edx
80100889:	0f 87 71 ff ff ff    	ja     80100800 <consoleintr+0x20>
8010088f:	8d 50 01             	lea    0x1(%eax),%edx
80100892:	83 e0 7f             	and    $0x7f,%eax
80100895:	83 ff 0d             	cmp    $0xd,%edi
80100898:	89 15 c8 ff 10 80    	mov    %edx,0x8010ffc8
8010089e:	0f 84 c8 00 00 00    	je     8010096c <consoleintr+0x18c>
801008a4:	89 f9                	mov    %edi,%ecx
801008a6:	88 88 40 ff 10 80    	mov    %cl,-0x7fef00c0(%eax)
801008ac:	89 f8                	mov    %edi,%eax
801008ae:	e8 3d fb ff ff       	call   801003f0 <consputc>
801008b3:	83 ff 0a             	cmp    $0xa,%edi
801008b6:	0f 84 c1 00 00 00    	je     8010097d <consoleintr+0x19d>
801008bc:	83 ff 04             	cmp    $0x4,%edi
801008bf:	0f 84 b8 00 00 00    	je     8010097d <consoleintr+0x19d>
801008c5:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801008ca:	83 e8 80             	sub    $0xffffff80,%eax
801008cd:	39 05 c8 ff 10 80    	cmp    %eax,0x8010ffc8
801008d3:	0f 85 27 ff ff ff    	jne    80100800 <consoleintr+0x20>
801008d9:	83 ec 0c             	sub    $0xc,%esp
801008dc:	a3 c4 ff 10 80       	mov    %eax,0x8010ffc4
801008e1:	68 c0 ff 10 80       	push   $0x8010ffc0
801008e6:	e8 b5 36 00 00       	call   80103fa0 <wakeup>
801008eb:	83 c4 10             	add    $0x10,%esp
801008ee:	e9 0d ff ff ff       	jmp    80100800 <consoleintr+0x20>
801008f3:	90                   	nop
801008f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801008f8:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
801008fd:	39 05 c4 ff 10 80    	cmp    %eax,0x8010ffc4
80100903:	75 2b                	jne    80100930 <consoleintr+0x150>
80100905:	e9 f6 fe ff ff       	jmp    80100800 <consoleintr+0x20>
8010090a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100910:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
80100915:	b8 00 01 00 00       	mov    $0x100,%eax
8010091a:	e8 d1 fa ff ff       	call   801003f0 <consputc>
8010091f:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100924:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
8010092a:	0f 84 d0 fe ff ff    	je     80100800 <consoleintr+0x20>
80100930:	83 e8 01             	sub    $0x1,%eax
80100933:	89 c2                	mov    %eax,%edx
80100935:	83 e2 7f             	and    $0x7f,%edx
80100938:	80 ba 40 ff 10 80 0a 	cmpb   $0xa,-0x7fef00c0(%edx)
8010093f:	75 cf                	jne    80100910 <consoleintr+0x130>
80100941:	e9 ba fe ff ff       	jmp    80100800 <consoleintr+0x20>
80100946:	8d 76 00             	lea    0x0(%esi),%esi
80100949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100950:	be 01 00 00 00       	mov    $0x1,%esi
80100955:	e9 a6 fe ff ff       	jmp    80100800 <consoleintr+0x20>
8010095a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100960:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100963:	5b                   	pop    %ebx
80100964:	5e                   	pop    %esi
80100965:	5f                   	pop    %edi
80100966:	5d                   	pop    %ebp
80100967:	e9 24 37 00 00       	jmp    80104090 <procdump>
8010096c:	c6 80 40 ff 10 80 0a 	movb   $0xa,-0x7fef00c0(%eax)
80100973:	b8 0a 00 00 00       	mov    $0xa,%eax
80100978:	e8 73 fa ff ff       	call   801003f0 <consputc>
8010097d:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100982:	e9 52 ff ff ff       	jmp    801008d9 <consoleintr+0xf9>
80100987:	89 f6                	mov    %esi,%esi
80100989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100990 <consoleinit>:
80100990:	55                   	push   %ebp
80100991:	89 e5                	mov    %esp,%ebp
80100993:	83 ec 10             	sub    $0x10,%esp
80100996:	68 d0 6f 10 80       	push   $0x80106fd0
8010099b:	68 20 a5 10 80       	push   $0x8010a520
801009a0:	e8 bb 38 00 00       	call   80104260 <initlock>
801009a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801009ac:	c7 05 8c 09 11 80 00 	movl   $0x80100600,0x8011098c
801009b3:	06 10 80 
801009b6:	c7 05 88 09 11 80 70 	movl   $0x80100270,0x80110988
801009bd:	02 10 80 
801009c0:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009c7:	00 00 00 
801009ca:	e8 d1 28 00 00       	call   801032a0 <picenable>
801009cf:	58                   	pop    %eax
801009d0:	5a                   	pop    %edx
801009d1:	6a 00                	push   $0x0
801009d3:	6a 01                	push   $0x1
801009d5:	e8 b6 18 00 00       	call   80102290 <ioapicenable>
801009da:	83 c4 10             	add    $0x10,%esp
801009dd:	c9                   	leave  
801009de:	c3                   	ret    
801009df:	90                   	nop

801009e0 <exec>:
801009e0:	55                   	push   %ebp
801009e1:	89 e5                	mov    %esp,%ebp
801009e3:	57                   	push   %edi
801009e4:	56                   	push   %esi
801009e5:	53                   	push   %ebx
801009e6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
801009ec:	e8 ef 21 00 00       	call   80102be0 <begin_op>
801009f1:	83 ec 0c             	sub    $0xc,%esp
801009f4:	ff 75 08             	pushl  0x8(%ebp)
801009f7:	e8 94 14 00 00       	call   80101e90 <namei>
801009fc:	83 c4 10             	add    $0x10,%esp
801009ff:	85 c0                	test   %eax,%eax
80100a01:	0f 84 a3 01 00 00    	je     80100baa <exec+0x1ca>
80100a07:	83 ec 0c             	sub    $0xc,%esp
80100a0a:	89 c3                	mov    %eax,%ebx
80100a0c:	50                   	push   %eax
80100a0d:	e8 4e 0c 00 00       	call   80101660 <ilock>
80100a12:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a18:	6a 34                	push   $0x34
80100a1a:	6a 00                	push   $0x0
80100a1c:	50                   	push   %eax
80100a1d:	53                   	push   %ebx
80100a1e:	e8 fd 0e 00 00       	call   80101920 <readi>
80100a23:	83 c4 20             	add    $0x20,%esp
80100a26:	83 f8 33             	cmp    $0x33,%eax
80100a29:	77 25                	ja     80100a50 <exec+0x70>
80100a2b:	83 ec 0c             	sub    $0xc,%esp
80100a2e:	53                   	push   %ebx
80100a2f:	e8 9c 0e 00 00       	call   801018d0 <iunlockput>
80100a34:	e8 17 22 00 00       	call   80102c50 <end_op>
80100a39:	83 c4 10             	add    $0x10,%esp
80100a3c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100a41:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a44:	5b                   	pop    %ebx
80100a45:	5e                   	pop    %esi
80100a46:	5f                   	pop    %edi
80100a47:	5d                   	pop    %ebp
80100a48:	c3                   	ret    
80100a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100a50:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a57:	45 4c 46 
80100a5a:	75 cf                	jne    80100a2b <exec+0x4b>
80100a5c:	e8 df 5e 00 00       	call   80106940 <setupkvm>
80100a61:	85 c0                	test   %eax,%eax
80100a63:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a69:	74 c0                	je     80100a2b <exec+0x4b>
80100a6b:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a72:	00 
80100a73:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100a79:	0f 84 a1 02 00 00    	je     80100d20 <exec+0x340>
80100a7f:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100a86:	00 00 00 
80100a89:	31 ff                	xor    %edi,%edi
80100a8b:	eb 18                	jmp    80100aa5 <exec+0xc5>
80100a8d:	8d 76 00             	lea    0x0(%esi),%esi
80100a90:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100a97:	83 c7 01             	add    $0x1,%edi
80100a9a:	83 c6 20             	add    $0x20,%esi
80100a9d:	39 f8                	cmp    %edi,%eax
80100a9f:	0f 8e ab 00 00 00    	jle    80100b50 <exec+0x170>
80100aa5:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100aab:	6a 20                	push   $0x20
80100aad:	56                   	push   %esi
80100aae:	50                   	push   %eax
80100aaf:	53                   	push   %ebx
80100ab0:	e8 6b 0e 00 00       	call   80101920 <readi>
80100ab5:	83 c4 10             	add    $0x10,%esp
80100ab8:	83 f8 20             	cmp    $0x20,%eax
80100abb:	75 7b                	jne    80100b38 <exec+0x158>
80100abd:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100ac4:	75 ca                	jne    80100a90 <exec+0xb0>
80100ac6:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100acc:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100ad2:	72 64                	jb     80100b38 <exec+0x158>
80100ad4:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100ada:	72 5c                	jb     80100b38 <exec+0x158>
80100adc:	83 ec 04             	sub    $0x4,%esp
80100adf:	50                   	push   %eax
80100ae0:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100ae6:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100aec:	e8 df 60 00 00       	call   80106bd0 <allocuvm>
80100af1:	83 c4 10             	add    $0x10,%esp
80100af4:	85 c0                	test   %eax,%eax
80100af6:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100afc:	74 3a                	je     80100b38 <exec+0x158>
80100afe:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b04:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b09:	75 2d                	jne    80100b38 <exec+0x158>
80100b0b:	83 ec 0c             	sub    $0xc,%esp
80100b0e:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b14:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b1a:	53                   	push   %ebx
80100b1b:	50                   	push   %eax
80100b1c:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b22:	e8 e9 5f 00 00       	call   80106b10 <loaduvm>
80100b27:	83 c4 20             	add    $0x20,%esp
80100b2a:	85 c0                	test   %eax,%eax
80100b2c:	0f 89 5e ff ff ff    	jns    80100a90 <exec+0xb0>
80100b32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100b38:	83 ec 0c             	sub    $0xc,%esp
80100b3b:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b41:	e8 aa 61 00 00       	call   80106cf0 <freevm>
80100b46:	83 c4 10             	add    $0x10,%esp
80100b49:	e9 dd fe ff ff       	jmp    80100a2b <exec+0x4b>
80100b4e:	66 90                	xchg   %ax,%ax
80100b50:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100b56:	81 c6 ff 0f 00 00    	add    $0xfff,%esi
80100b5c:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80100b62:	8d be 00 20 00 00    	lea    0x2000(%esi),%edi
80100b68:	83 ec 0c             	sub    $0xc,%esp
80100b6b:	53                   	push   %ebx
80100b6c:	e8 5f 0d 00 00       	call   801018d0 <iunlockput>
80100b71:	e8 da 20 00 00       	call   80102c50 <end_op>
80100b76:	83 c4 0c             	add    $0xc,%esp
80100b79:	57                   	push   %edi
80100b7a:	56                   	push   %esi
80100b7b:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b81:	e8 4a 60 00 00       	call   80106bd0 <allocuvm>
80100b86:	83 c4 10             	add    $0x10,%esp
80100b89:	85 c0                	test   %eax,%eax
80100b8b:	89 c6                	mov    %eax,%esi
80100b8d:	75 2a                	jne    80100bb9 <exec+0x1d9>
80100b8f:	83 ec 0c             	sub    $0xc,%esp
80100b92:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b98:	e8 53 61 00 00       	call   80106cf0 <freevm>
80100b9d:	83 c4 10             	add    $0x10,%esp
80100ba0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100ba5:	e9 97 fe ff ff       	jmp    80100a41 <exec+0x61>
80100baa:	e8 a1 20 00 00       	call   80102c50 <end_op>
80100baf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bb4:	e9 88 fe ff ff       	jmp    80100a41 <exec+0x61>
80100bb9:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100bbf:	83 ec 08             	sub    $0x8,%esp
80100bc2:	31 ff                	xor    %edi,%edi
80100bc4:	89 f3                	mov    %esi,%ebx
80100bc6:	50                   	push   %eax
80100bc7:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100bcd:	e8 9e 61 00 00       	call   80106d70 <clearpteu>
80100bd2:	8b 45 0c             	mov    0xc(%ebp),%eax
80100bd5:	83 c4 10             	add    $0x10,%esp
80100bd8:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100bde:	8b 00                	mov    (%eax),%eax
80100be0:	85 c0                	test   %eax,%eax
80100be2:	74 71                	je     80100c55 <exec+0x275>
80100be4:	89 b5 f0 fe ff ff    	mov    %esi,-0x110(%ebp)
80100bea:	8b b5 f4 fe ff ff    	mov    -0x10c(%ebp),%esi
80100bf0:	eb 0b                	jmp    80100bfd <exec+0x21d>
80100bf2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100bf8:	83 ff 20             	cmp    $0x20,%edi
80100bfb:	74 92                	je     80100b8f <exec+0x1af>
80100bfd:	83 ec 0c             	sub    $0xc,%esp
80100c00:	50                   	push   %eax
80100c01:	e8 ca 3a 00 00       	call   801046d0 <strlen>
80100c06:	f7 d0                	not    %eax
80100c08:	01 c3                	add    %eax,%ebx
80100c0a:	58                   	pop    %eax
80100c0b:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c0e:	83 e3 fc             	and    $0xfffffffc,%ebx
80100c11:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c14:	e8 b7 3a 00 00       	call   801046d0 <strlen>
80100c19:	83 c0 01             	add    $0x1,%eax
80100c1c:	50                   	push   %eax
80100c1d:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c20:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c23:	53                   	push   %ebx
80100c24:	56                   	push   %esi
80100c25:	e8 96 62 00 00       	call   80106ec0 <copyout>
80100c2a:	83 c4 20             	add    $0x20,%esp
80100c2d:	85 c0                	test   %eax,%eax
80100c2f:	0f 88 5a ff ff ff    	js     80100b8f <exec+0x1af>
80100c35:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c38:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
80100c3f:	83 c7 01             	add    $0x1,%edi
80100c42:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c48:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c4b:	85 c0                	test   %eax,%eax
80100c4d:	75 a9                	jne    80100bf8 <exec+0x218>
80100c4f:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c55:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c5c:	89 d9                	mov    %ebx,%ecx
80100c5e:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c65:	00 00 00 00 
80100c69:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c70:	ff ff ff 
80100c73:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
80100c79:	29 c1                	sub    %eax,%ecx
80100c7b:	83 c0 0c             	add    $0xc,%eax
80100c7e:	29 c3                	sub    %eax,%ebx
80100c80:	50                   	push   %eax
80100c81:	52                   	push   %edx
80100c82:	53                   	push   %ebx
80100c83:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100c89:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
80100c8f:	e8 2c 62 00 00       	call   80106ec0 <copyout>
80100c94:	83 c4 10             	add    $0x10,%esp
80100c97:	85 c0                	test   %eax,%eax
80100c99:	0f 88 f0 fe ff ff    	js     80100b8f <exec+0x1af>
80100c9f:	8b 45 08             	mov    0x8(%ebp),%eax
80100ca2:	0f b6 10             	movzbl (%eax),%edx
80100ca5:	84 d2                	test   %dl,%dl
80100ca7:	74 1a                	je     80100cc3 <exec+0x2e3>
80100ca9:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100cac:	83 c0 01             	add    $0x1,%eax
80100caf:	90                   	nop
80100cb0:	80 fa 2f             	cmp    $0x2f,%dl
80100cb3:	0f b6 10             	movzbl (%eax),%edx
80100cb6:	0f 44 c8             	cmove  %eax,%ecx
80100cb9:	83 c0 01             	add    $0x1,%eax
80100cbc:	84 d2                	test   %dl,%dl
80100cbe:	75 f0                	jne    80100cb0 <exec+0x2d0>
80100cc0:	89 4d 08             	mov    %ecx,0x8(%ebp)
80100cc3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100cc9:	83 ec 04             	sub    $0x4,%esp
80100ccc:	6a 10                	push   $0x10
80100cce:	ff 75 08             	pushl  0x8(%ebp)
80100cd1:	83 c0 6c             	add    $0x6c,%eax
80100cd4:	50                   	push   %eax
80100cd5:	e8 b6 39 00 00       	call   80104690 <safestrcpy>
80100cda:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100ce0:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
80100ce6:	8b 78 04             	mov    0x4(%eax),%edi
80100ce9:	89 30                	mov    %esi,(%eax)
80100ceb:	89 48 04             	mov    %ecx,0x4(%eax)
80100cee:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100cf4:	8b 8d 3c ff ff ff    	mov    -0xc4(%ebp),%ecx
80100cfa:	8b 50 18             	mov    0x18(%eax),%edx
80100cfd:	89 4a 38             	mov    %ecx,0x38(%edx)
80100d00:	8b 50 18             	mov    0x18(%eax),%edx
80100d03:	89 5a 44             	mov    %ebx,0x44(%edx)
80100d06:	89 04 24             	mov    %eax,(%esp)
80100d09:	e8 e2 5c 00 00       	call   801069f0 <switchuvm>
80100d0e:	89 3c 24             	mov    %edi,(%esp)
80100d11:	e8 da 5f 00 00       	call   80106cf0 <freevm>
80100d16:	83 c4 10             	add    $0x10,%esp
80100d19:	31 c0                	xor    %eax,%eax
80100d1b:	e9 21 fd ff ff       	jmp    80100a41 <exec+0x61>
80100d20:	bf 00 20 00 00       	mov    $0x2000,%edi
80100d25:	31 f6                	xor    %esi,%esi
80100d27:	e9 3c fe ff ff       	jmp    80100b68 <exec+0x188>
80100d2c:	66 90                	xchg   %ax,%ax
80100d2e:	66 90                	xchg   %ax,%ax

80100d30 <fileinit>:
80100d30:	55                   	push   %ebp
80100d31:	89 e5                	mov    %esp,%ebp
80100d33:	83 ec 10             	sub    $0x10,%esp
80100d36:	68 e9 6f 10 80       	push   $0x80106fe9
80100d3b:	68 e0 ff 10 80       	push   $0x8010ffe0
80100d40:	e8 1b 35 00 00       	call   80104260 <initlock>
80100d45:	83 c4 10             	add    $0x10,%esp
80100d48:	c9                   	leave  
80100d49:	c3                   	ret    
80100d4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d50 <filealloc>:
80100d50:	55                   	push   %ebp
80100d51:	89 e5                	mov    %esp,%ebp
80100d53:	53                   	push   %ebx
80100d54:	bb 14 00 11 80       	mov    $0x80110014,%ebx
80100d59:	83 ec 10             	sub    $0x10,%esp
80100d5c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100d61:	e8 1a 35 00 00       	call   80104280 <acquire>
80100d66:	83 c4 10             	add    $0x10,%esp
80100d69:	eb 10                	jmp    80100d7b <filealloc+0x2b>
80100d6b:	90                   	nop
80100d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100d70:	83 c3 18             	add    $0x18,%ebx
80100d73:	81 fb 74 09 11 80    	cmp    $0x80110974,%ebx
80100d79:	73 25                	jae    80100da0 <filealloc+0x50>
80100d7b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d7e:	85 c0                	test   %eax,%eax
80100d80:	75 ee                	jne    80100d70 <filealloc+0x20>
80100d82:	83 ec 0c             	sub    $0xc,%esp
80100d85:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100d8c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100d91:	e8 ca 36 00 00       	call   80104460 <release>
80100d96:	89 d8                	mov    %ebx,%eax
80100d98:	83 c4 10             	add    $0x10,%esp
80100d9b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100d9e:	c9                   	leave  
80100d9f:	c3                   	ret    
80100da0:	83 ec 0c             	sub    $0xc,%esp
80100da3:	31 db                	xor    %ebx,%ebx
80100da5:	68 e0 ff 10 80       	push   $0x8010ffe0
80100daa:	e8 b1 36 00 00       	call   80104460 <release>
80100daf:	89 d8                	mov    %ebx,%eax
80100db1:	83 c4 10             	add    $0x10,%esp
80100db4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100db7:	c9                   	leave  
80100db8:	c3                   	ret    
80100db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100dc0 <filedup>:
80100dc0:	55                   	push   %ebp
80100dc1:	89 e5                	mov    %esp,%ebp
80100dc3:	53                   	push   %ebx
80100dc4:	83 ec 10             	sub    $0x10,%esp
80100dc7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100dca:	68 e0 ff 10 80       	push   $0x8010ffe0
80100dcf:	e8 ac 34 00 00       	call   80104280 <acquire>
80100dd4:	8b 43 04             	mov    0x4(%ebx),%eax
80100dd7:	83 c4 10             	add    $0x10,%esp
80100dda:	85 c0                	test   %eax,%eax
80100ddc:	7e 1a                	jle    80100df8 <filedup+0x38>
80100dde:	83 c0 01             	add    $0x1,%eax
80100de1:	83 ec 0c             	sub    $0xc,%esp
80100de4:	89 43 04             	mov    %eax,0x4(%ebx)
80100de7:	68 e0 ff 10 80       	push   $0x8010ffe0
80100dec:	e8 6f 36 00 00       	call   80104460 <release>
80100df1:	89 d8                	mov    %ebx,%eax
80100df3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100df6:	c9                   	leave  
80100df7:	c3                   	ret    
80100df8:	83 ec 0c             	sub    $0xc,%esp
80100dfb:	68 f0 6f 10 80       	push   $0x80106ff0
80100e00:	e8 6b f5 ff ff       	call   80100370 <panic>
80100e05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e10 <fileclose>:
80100e10:	55                   	push   %ebp
80100e11:	89 e5                	mov    %esp,%ebp
80100e13:	57                   	push   %edi
80100e14:	56                   	push   %esi
80100e15:	53                   	push   %ebx
80100e16:	83 ec 28             	sub    $0x28,%esp
80100e19:	8b 7d 08             	mov    0x8(%ebp),%edi
80100e1c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100e21:	e8 5a 34 00 00       	call   80104280 <acquire>
80100e26:	8b 47 04             	mov    0x4(%edi),%eax
80100e29:	83 c4 10             	add    $0x10,%esp
80100e2c:	85 c0                	test   %eax,%eax
80100e2e:	0f 8e 9b 00 00 00    	jle    80100ecf <fileclose+0xbf>
80100e34:	83 e8 01             	sub    $0x1,%eax
80100e37:	85 c0                	test   %eax,%eax
80100e39:	89 47 04             	mov    %eax,0x4(%edi)
80100e3c:	74 1a                	je     80100e58 <fileclose+0x48>
80100e3e:	c7 45 08 e0 ff 10 80 	movl   $0x8010ffe0,0x8(%ebp)
80100e45:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e48:	5b                   	pop    %ebx
80100e49:	5e                   	pop    %esi
80100e4a:	5f                   	pop    %edi
80100e4b:	5d                   	pop    %ebp
80100e4c:	e9 0f 36 00 00       	jmp    80104460 <release>
80100e51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100e58:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e5c:	8b 1f                	mov    (%edi),%ebx
80100e5e:	83 ec 0c             	sub    $0xc,%esp
80100e61:	8b 77 0c             	mov    0xc(%edi),%esi
80100e64:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
80100e6a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e6d:	8b 47 10             	mov    0x10(%edi),%eax
80100e70:	68 e0 ff 10 80       	push   $0x8010ffe0
80100e75:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100e78:	e8 e3 35 00 00       	call   80104460 <release>
80100e7d:	83 c4 10             	add    $0x10,%esp
80100e80:	83 fb 01             	cmp    $0x1,%ebx
80100e83:	74 13                	je     80100e98 <fileclose+0x88>
80100e85:	83 fb 02             	cmp    $0x2,%ebx
80100e88:	74 26                	je     80100eb0 <fileclose+0xa0>
80100e8a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e8d:	5b                   	pop    %ebx
80100e8e:	5e                   	pop    %esi
80100e8f:	5f                   	pop    %edi
80100e90:	5d                   	pop    %ebp
80100e91:	c3                   	ret    
80100e92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100e98:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100e9c:	83 ec 08             	sub    $0x8,%esp
80100e9f:	53                   	push   %ebx
80100ea0:	56                   	push   %esi
80100ea1:	e8 ca 25 00 00       	call   80103470 <pipeclose>
80100ea6:	83 c4 10             	add    $0x10,%esp
80100ea9:	eb df                	jmp    80100e8a <fileclose+0x7a>
80100eab:	90                   	nop
80100eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100eb0:	e8 2b 1d 00 00       	call   80102be0 <begin_op>
80100eb5:	83 ec 0c             	sub    $0xc,%esp
80100eb8:	ff 75 e0             	pushl  -0x20(%ebp)
80100ebb:	e8 d0 08 00 00       	call   80101790 <iput>
80100ec0:	83 c4 10             	add    $0x10,%esp
80100ec3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ec6:	5b                   	pop    %ebx
80100ec7:	5e                   	pop    %esi
80100ec8:	5f                   	pop    %edi
80100ec9:	5d                   	pop    %ebp
80100eca:	e9 81 1d 00 00       	jmp    80102c50 <end_op>
80100ecf:	83 ec 0c             	sub    $0xc,%esp
80100ed2:	68 f8 6f 10 80       	push   $0x80106ff8
80100ed7:	e8 94 f4 ff ff       	call   80100370 <panic>
80100edc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ee0 <filestat>:
80100ee0:	55                   	push   %ebp
80100ee1:	89 e5                	mov    %esp,%ebp
80100ee3:	53                   	push   %ebx
80100ee4:	83 ec 04             	sub    $0x4,%esp
80100ee7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100eea:	83 3b 02             	cmpl   $0x2,(%ebx)
80100eed:	75 31                	jne    80100f20 <filestat+0x40>
80100eef:	83 ec 0c             	sub    $0xc,%esp
80100ef2:	ff 73 10             	pushl  0x10(%ebx)
80100ef5:	e8 66 07 00 00       	call   80101660 <ilock>
80100efa:	58                   	pop    %eax
80100efb:	5a                   	pop    %edx
80100efc:	ff 75 0c             	pushl  0xc(%ebp)
80100eff:	ff 73 10             	pushl  0x10(%ebx)
80100f02:	e8 e9 09 00 00       	call   801018f0 <stati>
80100f07:	59                   	pop    %ecx
80100f08:	ff 73 10             	pushl  0x10(%ebx)
80100f0b:	e8 30 08 00 00       	call   80101740 <iunlock>
80100f10:	83 c4 10             	add    $0x10,%esp
80100f13:	31 c0                	xor    %eax,%eax
80100f15:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f18:	c9                   	leave  
80100f19:	c3                   	ret    
80100f1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f25:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f28:	c9                   	leave  
80100f29:	c3                   	ret    
80100f2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f30 <fileread>:
80100f30:	55                   	push   %ebp
80100f31:	89 e5                	mov    %esp,%ebp
80100f33:	57                   	push   %edi
80100f34:	56                   	push   %esi
80100f35:	53                   	push   %ebx
80100f36:	83 ec 0c             	sub    $0xc,%esp
80100f39:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f3c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f3f:	8b 7d 10             	mov    0x10(%ebp),%edi
80100f42:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f46:	74 60                	je     80100fa8 <fileread+0x78>
80100f48:	8b 03                	mov    (%ebx),%eax
80100f4a:	83 f8 01             	cmp    $0x1,%eax
80100f4d:	74 41                	je     80100f90 <fileread+0x60>
80100f4f:	83 f8 02             	cmp    $0x2,%eax
80100f52:	75 5b                	jne    80100faf <fileread+0x7f>
80100f54:	83 ec 0c             	sub    $0xc,%esp
80100f57:	ff 73 10             	pushl  0x10(%ebx)
80100f5a:	e8 01 07 00 00       	call   80101660 <ilock>
80100f5f:	57                   	push   %edi
80100f60:	ff 73 14             	pushl  0x14(%ebx)
80100f63:	56                   	push   %esi
80100f64:	ff 73 10             	pushl  0x10(%ebx)
80100f67:	e8 b4 09 00 00       	call   80101920 <readi>
80100f6c:	83 c4 20             	add    $0x20,%esp
80100f6f:	85 c0                	test   %eax,%eax
80100f71:	89 c6                	mov    %eax,%esi
80100f73:	7e 03                	jle    80100f78 <fileread+0x48>
80100f75:	01 43 14             	add    %eax,0x14(%ebx)
80100f78:	83 ec 0c             	sub    $0xc,%esp
80100f7b:	ff 73 10             	pushl  0x10(%ebx)
80100f7e:	e8 bd 07 00 00       	call   80101740 <iunlock>
80100f83:	83 c4 10             	add    $0x10,%esp
80100f86:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f89:	89 f0                	mov    %esi,%eax
80100f8b:	5b                   	pop    %ebx
80100f8c:	5e                   	pop    %esi
80100f8d:	5f                   	pop    %edi
80100f8e:	5d                   	pop    %ebp
80100f8f:	c3                   	ret    
80100f90:	8b 43 0c             	mov    0xc(%ebx),%eax
80100f93:	89 45 08             	mov    %eax,0x8(%ebp)
80100f96:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f99:	5b                   	pop    %ebx
80100f9a:	5e                   	pop    %esi
80100f9b:	5f                   	pop    %edi
80100f9c:	5d                   	pop    %ebp
80100f9d:	e9 9e 26 00 00       	jmp    80103640 <piperead>
80100fa2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fa8:	be ff ff ff ff       	mov    $0xffffffff,%esi
80100fad:	eb d7                	jmp    80100f86 <fileread+0x56>
80100faf:	83 ec 0c             	sub    $0xc,%esp
80100fb2:	68 02 70 10 80       	push   $0x80107002
80100fb7:	e8 b4 f3 ff ff       	call   80100370 <panic>
80100fbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100fc0 <filewrite>:
80100fc0:	55                   	push   %ebp
80100fc1:	89 e5                	mov    %esp,%ebp
80100fc3:	57                   	push   %edi
80100fc4:	56                   	push   %esi
80100fc5:	53                   	push   %ebx
80100fc6:	83 ec 1c             	sub    $0x1c,%esp
80100fc9:	8b 75 08             	mov    0x8(%ebp),%esi
80100fcc:	8b 45 0c             	mov    0xc(%ebp),%eax
80100fcf:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80100fd3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100fd6:	8b 45 10             	mov    0x10(%ebp),%eax
80100fd9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100fdc:	0f 84 aa 00 00 00    	je     8010108c <filewrite+0xcc>
80100fe2:	8b 06                	mov    (%esi),%eax
80100fe4:	83 f8 01             	cmp    $0x1,%eax
80100fe7:	0f 84 c2 00 00 00    	je     801010af <filewrite+0xef>
80100fed:	83 f8 02             	cmp    $0x2,%eax
80100ff0:	0f 85 e4 00 00 00    	jne    801010da <filewrite+0x11a>
80100ff6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100ff9:	31 ff                	xor    %edi,%edi
80100ffb:	85 c0                	test   %eax,%eax
80100ffd:	7f 34                	jg     80101033 <filewrite+0x73>
80100fff:	e9 9c 00 00 00       	jmp    801010a0 <filewrite+0xe0>
80101004:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101008:	01 46 14             	add    %eax,0x14(%esi)
8010100b:	83 ec 0c             	sub    $0xc,%esp
8010100e:	ff 76 10             	pushl  0x10(%esi)
80101011:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101014:	e8 27 07 00 00       	call   80101740 <iunlock>
80101019:	e8 32 1c 00 00       	call   80102c50 <end_op>
8010101e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101021:	83 c4 10             	add    $0x10,%esp
80101024:	39 d8                	cmp    %ebx,%eax
80101026:	0f 85 a1 00 00 00    	jne    801010cd <filewrite+0x10d>
8010102c:	01 c7                	add    %eax,%edi
8010102e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101031:	7e 6d                	jle    801010a0 <filewrite+0xe0>
80101033:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101036:	b8 00 1a 00 00       	mov    $0x1a00,%eax
8010103b:	29 fb                	sub    %edi,%ebx
8010103d:	81 fb 00 1a 00 00    	cmp    $0x1a00,%ebx
80101043:	0f 4f d8             	cmovg  %eax,%ebx
80101046:	e8 95 1b 00 00       	call   80102be0 <begin_op>
8010104b:	83 ec 0c             	sub    $0xc,%esp
8010104e:	ff 76 10             	pushl  0x10(%esi)
80101051:	e8 0a 06 00 00       	call   80101660 <ilock>
80101056:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101059:	53                   	push   %ebx
8010105a:	ff 76 14             	pushl  0x14(%esi)
8010105d:	01 f8                	add    %edi,%eax
8010105f:	50                   	push   %eax
80101060:	ff 76 10             	pushl  0x10(%esi)
80101063:	e8 b8 09 00 00       	call   80101a20 <writei>
80101068:	83 c4 20             	add    $0x20,%esp
8010106b:	85 c0                	test   %eax,%eax
8010106d:	7f 99                	jg     80101008 <filewrite+0x48>
8010106f:	83 ec 0c             	sub    $0xc,%esp
80101072:	ff 76 10             	pushl  0x10(%esi)
80101075:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101078:	e8 c3 06 00 00       	call   80101740 <iunlock>
8010107d:	e8 ce 1b 00 00       	call   80102c50 <end_op>
80101082:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101085:	83 c4 10             	add    $0x10,%esp
80101088:	85 c0                	test   %eax,%eax
8010108a:	74 98                	je     80101024 <filewrite+0x64>
8010108c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010108f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101094:	5b                   	pop    %ebx
80101095:	5e                   	pop    %esi
80101096:	5f                   	pop    %edi
80101097:	5d                   	pop    %ebp
80101098:	c3                   	ret    
80101099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801010a0:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
801010a3:	75 e7                	jne    8010108c <filewrite+0xcc>
801010a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010a8:	89 f8                	mov    %edi,%eax
801010aa:	5b                   	pop    %ebx
801010ab:	5e                   	pop    %esi
801010ac:	5f                   	pop    %edi
801010ad:	5d                   	pop    %ebp
801010ae:	c3                   	ret    
801010af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801010b2:	89 45 10             	mov    %eax,0x10(%ebp)
801010b5:	8b 45 dc             	mov    -0x24(%ebp),%eax
801010b8:	89 45 0c             	mov    %eax,0xc(%ebp)
801010bb:	8b 46 0c             	mov    0xc(%esi),%eax
801010be:	89 45 08             	mov    %eax,0x8(%ebp)
801010c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010c4:	5b                   	pop    %ebx
801010c5:	5e                   	pop    %esi
801010c6:	5f                   	pop    %edi
801010c7:	5d                   	pop    %ebp
801010c8:	e9 43 24 00 00       	jmp    80103510 <pipewrite>
801010cd:	83 ec 0c             	sub    $0xc,%esp
801010d0:	68 0b 70 10 80       	push   $0x8010700b
801010d5:	e8 96 f2 ff ff       	call   80100370 <panic>
801010da:	83 ec 0c             	sub    $0xc,%esp
801010dd:	68 11 70 10 80       	push   $0x80107011
801010e2:	e8 89 f2 ff ff       	call   80100370 <panic>
801010e7:	66 90                	xchg   %ax,%ax
801010e9:	66 90                	xchg   %ax,%ax
801010eb:	66 90                	xchg   %ax,%ax
801010ed:	66 90                	xchg   %ax,%ax
801010ef:	90                   	nop

801010f0 <balloc>:
801010f0:	55                   	push   %ebp
801010f1:	89 e5                	mov    %esp,%ebp
801010f3:	57                   	push   %edi
801010f4:	56                   	push   %esi
801010f5:	53                   	push   %ebx
801010f6:	83 ec 1c             	sub    $0x1c,%esp
801010f9:	8b 0d e0 09 11 80    	mov    0x801109e0,%ecx
801010ff:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101102:	85 c9                	test   %ecx,%ecx
80101104:	0f 84 87 00 00 00    	je     80101191 <balloc+0xa1>
8010110a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80101111:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101114:	83 ec 08             	sub    $0x8,%esp
80101117:	89 f0                	mov    %esi,%eax
80101119:	c1 f8 0c             	sar    $0xc,%eax
8010111c:	03 05 f8 09 11 80    	add    0x801109f8,%eax
80101122:	50                   	push   %eax
80101123:	ff 75 d8             	pushl  -0x28(%ebp)
80101126:	e8 a5 ef ff ff       	call   801000d0 <bread>
8010112b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010112e:	a1 e0 09 11 80       	mov    0x801109e0,%eax
80101133:	83 c4 10             	add    $0x10,%esp
80101136:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101139:	31 c0                	xor    %eax,%eax
8010113b:	eb 2f                	jmp    8010116c <balloc+0x7c>
8010113d:	8d 76 00             	lea    0x0(%esi),%esi
80101140:	89 c1                	mov    %eax,%ecx
80101142:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101145:	bb 01 00 00 00       	mov    $0x1,%ebx
8010114a:	83 e1 07             	and    $0x7,%ecx
8010114d:	d3 e3                	shl    %cl,%ebx
8010114f:	89 c1                	mov    %eax,%ecx
80101151:	c1 f9 03             	sar    $0x3,%ecx
80101154:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
80101159:	85 df                	test   %ebx,%edi
8010115b:	89 fa                	mov    %edi,%edx
8010115d:	74 41                	je     801011a0 <balloc+0xb0>
8010115f:	83 c0 01             	add    $0x1,%eax
80101162:	83 c6 01             	add    $0x1,%esi
80101165:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010116a:	74 05                	je     80101171 <balloc+0x81>
8010116c:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010116f:	72 cf                	jb     80101140 <balloc+0x50>
80101171:	83 ec 0c             	sub    $0xc,%esp
80101174:	ff 75 e4             	pushl  -0x1c(%ebp)
80101177:	e8 64 f0 ff ff       	call   801001e0 <brelse>
8010117c:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101183:	83 c4 10             	add    $0x10,%esp
80101186:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101189:	39 05 e0 09 11 80    	cmp    %eax,0x801109e0
8010118f:	77 80                	ja     80101111 <balloc+0x21>
80101191:	83 ec 0c             	sub    $0xc,%esp
80101194:	68 1b 70 10 80       	push   $0x8010701b
80101199:	e8 d2 f1 ff ff       	call   80100370 <panic>
8010119e:	66 90                	xchg   %ax,%ax
801011a0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801011a3:	83 ec 0c             	sub    $0xc,%esp
801011a6:	09 da                	or     %ebx,%edx
801011a8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
801011ac:	57                   	push   %edi
801011ad:	e8 0e 1c 00 00       	call   80102dc0 <log_write>
801011b2:	89 3c 24             	mov    %edi,(%esp)
801011b5:	e8 26 f0 ff ff       	call   801001e0 <brelse>
801011ba:	58                   	pop    %eax
801011bb:	5a                   	pop    %edx
801011bc:	56                   	push   %esi
801011bd:	ff 75 d8             	pushl  -0x28(%ebp)
801011c0:	e8 0b ef ff ff       	call   801000d0 <bread>
801011c5:	89 c3                	mov    %eax,%ebx
801011c7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011ca:	83 c4 0c             	add    $0xc,%esp
801011cd:	68 00 02 00 00       	push   $0x200
801011d2:	6a 00                	push   $0x0
801011d4:	50                   	push   %eax
801011d5:	e8 d6 32 00 00       	call   801044b0 <memset>
801011da:	89 1c 24             	mov    %ebx,(%esp)
801011dd:	e8 de 1b 00 00       	call   80102dc0 <log_write>
801011e2:	89 1c 24             	mov    %ebx,(%esp)
801011e5:	e8 f6 ef ff ff       	call   801001e0 <brelse>
801011ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011ed:	89 f0                	mov    %esi,%eax
801011ef:	5b                   	pop    %ebx
801011f0:	5e                   	pop    %esi
801011f1:	5f                   	pop    %edi
801011f2:	5d                   	pop    %ebp
801011f3:	c3                   	ret    
801011f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801011fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101200 <iget>:
80101200:	55                   	push   %ebp
80101201:	89 e5                	mov    %esp,%ebp
80101203:	57                   	push   %edi
80101204:	56                   	push   %esi
80101205:	53                   	push   %ebx
80101206:	89 c7                	mov    %eax,%edi
80101208:	31 f6                	xor    %esi,%esi
8010120a:	bb 34 0a 11 80       	mov    $0x80110a34,%ebx
8010120f:	83 ec 28             	sub    $0x28,%esp
80101212:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101215:	68 00 0a 11 80       	push   $0x80110a00
8010121a:	e8 61 30 00 00       	call   80104280 <acquire>
8010121f:	83 c4 10             	add    $0x10,%esp
80101222:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101225:	eb 1b                	jmp    80101242 <iget+0x42>
80101227:	89 f6                	mov    %esi,%esi
80101229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101230:	85 f6                	test   %esi,%esi
80101232:	74 44                	je     80101278 <iget+0x78>
80101234:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010123a:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
80101240:	73 4e                	jae    80101290 <iget+0x90>
80101242:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101245:	85 c9                	test   %ecx,%ecx
80101247:	7e e7                	jle    80101230 <iget+0x30>
80101249:	39 3b                	cmp    %edi,(%ebx)
8010124b:	75 e3                	jne    80101230 <iget+0x30>
8010124d:	39 53 04             	cmp    %edx,0x4(%ebx)
80101250:	75 de                	jne    80101230 <iget+0x30>
80101252:	83 ec 0c             	sub    $0xc,%esp
80101255:	83 c1 01             	add    $0x1,%ecx
80101258:	89 de                	mov    %ebx,%esi
8010125a:	68 00 0a 11 80       	push   $0x80110a00
8010125f:	89 4b 08             	mov    %ecx,0x8(%ebx)
80101262:	e8 f9 31 00 00       	call   80104460 <release>
80101267:	83 c4 10             	add    $0x10,%esp
8010126a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010126d:	89 f0                	mov    %esi,%eax
8010126f:	5b                   	pop    %ebx
80101270:	5e                   	pop    %esi
80101271:	5f                   	pop    %edi
80101272:	5d                   	pop    %ebp
80101273:	c3                   	ret    
80101274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101278:	85 c9                	test   %ecx,%ecx
8010127a:	0f 44 f3             	cmove  %ebx,%esi
8010127d:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101283:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
80101289:	72 b7                	jb     80101242 <iget+0x42>
8010128b:	90                   	nop
8010128c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101290:	85 f6                	test   %esi,%esi
80101292:	74 2d                	je     801012c1 <iget+0xc1>
80101294:	83 ec 0c             	sub    $0xc,%esp
80101297:	89 3e                	mov    %edi,(%esi)
80101299:	89 56 04             	mov    %edx,0x4(%esi)
8010129c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
801012a3:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
801012aa:	68 00 0a 11 80       	push   $0x80110a00
801012af:	e8 ac 31 00 00       	call   80104460 <release>
801012b4:	83 c4 10             	add    $0x10,%esp
801012b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012ba:	89 f0                	mov    %esi,%eax
801012bc:	5b                   	pop    %ebx
801012bd:	5e                   	pop    %esi
801012be:	5f                   	pop    %edi
801012bf:	5d                   	pop    %ebp
801012c0:	c3                   	ret    
801012c1:	83 ec 0c             	sub    $0xc,%esp
801012c4:	68 31 70 10 80       	push   $0x80107031
801012c9:	e8 a2 f0 ff ff       	call   80100370 <panic>
801012ce:	66 90                	xchg   %ax,%ax

801012d0 <bmap>:
801012d0:	55                   	push   %ebp
801012d1:	89 e5                	mov    %esp,%ebp
801012d3:	57                   	push   %edi
801012d4:	56                   	push   %esi
801012d5:	53                   	push   %ebx
801012d6:	89 c6                	mov    %eax,%esi
801012d8:	83 ec 1c             	sub    $0x1c,%esp
801012db:	83 fa 0b             	cmp    $0xb,%edx
801012de:	77 18                	ja     801012f8 <bmap+0x28>
801012e0:	8d 3c 90             	lea    (%eax,%edx,4),%edi
801012e3:	8b 5f 5c             	mov    0x5c(%edi),%ebx
801012e6:	85 db                	test   %ebx,%ebx
801012e8:	74 76                	je     80101360 <bmap+0x90>
801012ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012ed:	89 d8                	mov    %ebx,%eax
801012ef:	5b                   	pop    %ebx
801012f0:	5e                   	pop    %esi
801012f1:	5f                   	pop    %edi
801012f2:	5d                   	pop    %ebp
801012f3:	c3                   	ret    
801012f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801012f8:	8d 5a f4             	lea    -0xc(%edx),%ebx
801012fb:	83 fb 7f             	cmp    $0x7f,%ebx
801012fe:	0f 87 8e 00 00 00    	ja     80101392 <bmap+0xc2>
80101304:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
8010130a:	85 c0                	test   %eax,%eax
8010130c:	74 72                	je     80101380 <bmap+0xb0>
8010130e:	83 ec 08             	sub    $0x8,%esp
80101311:	50                   	push   %eax
80101312:	ff 36                	pushl  (%esi)
80101314:	e8 b7 ed ff ff       	call   801000d0 <bread>
80101319:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010131d:	83 c4 10             	add    $0x10,%esp
80101320:	89 c7                	mov    %eax,%edi
80101322:	8b 1a                	mov    (%edx),%ebx
80101324:	85 db                	test   %ebx,%ebx
80101326:	75 1d                	jne    80101345 <bmap+0x75>
80101328:	8b 06                	mov    (%esi),%eax
8010132a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010132d:	e8 be fd ff ff       	call   801010f0 <balloc>
80101332:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101335:	83 ec 0c             	sub    $0xc,%esp
80101338:	89 c3                	mov    %eax,%ebx
8010133a:	89 02                	mov    %eax,(%edx)
8010133c:	57                   	push   %edi
8010133d:	e8 7e 1a 00 00       	call   80102dc0 <log_write>
80101342:	83 c4 10             	add    $0x10,%esp
80101345:	83 ec 0c             	sub    $0xc,%esp
80101348:	57                   	push   %edi
80101349:	e8 92 ee ff ff       	call   801001e0 <brelse>
8010134e:	83 c4 10             	add    $0x10,%esp
80101351:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101354:	89 d8                	mov    %ebx,%eax
80101356:	5b                   	pop    %ebx
80101357:	5e                   	pop    %esi
80101358:	5f                   	pop    %edi
80101359:	5d                   	pop    %ebp
8010135a:	c3                   	ret    
8010135b:	90                   	nop
8010135c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101360:	8b 00                	mov    (%eax),%eax
80101362:	e8 89 fd ff ff       	call   801010f0 <balloc>
80101367:	89 47 5c             	mov    %eax,0x5c(%edi)
8010136a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010136d:	89 c3                	mov    %eax,%ebx
8010136f:	89 d8                	mov    %ebx,%eax
80101371:	5b                   	pop    %ebx
80101372:	5e                   	pop    %esi
80101373:	5f                   	pop    %edi
80101374:	5d                   	pop    %ebp
80101375:	c3                   	ret    
80101376:	8d 76 00             	lea    0x0(%esi),%esi
80101379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101380:	8b 06                	mov    (%esi),%eax
80101382:	e8 69 fd ff ff       	call   801010f0 <balloc>
80101387:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
8010138d:	e9 7c ff ff ff       	jmp    8010130e <bmap+0x3e>
80101392:	83 ec 0c             	sub    $0xc,%esp
80101395:	68 41 70 10 80       	push   $0x80107041
8010139a:	e8 d1 ef ff ff       	call   80100370 <panic>
8010139f:	90                   	nop

801013a0 <readsb>:
801013a0:	55                   	push   %ebp
801013a1:	89 e5                	mov    %esp,%ebp
801013a3:	56                   	push   %esi
801013a4:	53                   	push   %ebx
801013a5:	8b 75 0c             	mov    0xc(%ebp),%esi
801013a8:	83 ec 08             	sub    $0x8,%esp
801013ab:	6a 01                	push   $0x1
801013ad:	ff 75 08             	pushl  0x8(%ebp)
801013b0:	e8 1b ed ff ff       	call   801000d0 <bread>
801013b5:	89 c3                	mov    %eax,%ebx
801013b7:	8d 40 5c             	lea    0x5c(%eax),%eax
801013ba:	83 c4 0c             	add    $0xc,%esp
801013bd:	6a 1c                	push   $0x1c
801013bf:	50                   	push   %eax
801013c0:	56                   	push   %esi
801013c1:	e8 9a 31 00 00       	call   80104560 <memmove>
801013c6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013c9:	83 c4 10             	add    $0x10,%esp
801013cc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801013cf:	5b                   	pop    %ebx
801013d0:	5e                   	pop    %esi
801013d1:	5d                   	pop    %ebp
801013d2:	e9 09 ee ff ff       	jmp    801001e0 <brelse>
801013d7:	89 f6                	mov    %esi,%esi
801013d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801013e0 <bfree>:
801013e0:	55                   	push   %ebp
801013e1:	89 e5                	mov    %esp,%ebp
801013e3:	56                   	push   %esi
801013e4:	53                   	push   %ebx
801013e5:	89 d3                	mov    %edx,%ebx
801013e7:	89 c6                	mov    %eax,%esi
801013e9:	83 ec 08             	sub    $0x8,%esp
801013ec:	68 e0 09 11 80       	push   $0x801109e0
801013f1:	50                   	push   %eax
801013f2:	e8 a9 ff ff ff       	call   801013a0 <readsb>
801013f7:	58                   	pop    %eax
801013f8:	5a                   	pop    %edx
801013f9:	89 da                	mov    %ebx,%edx
801013fb:	c1 ea 0c             	shr    $0xc,%edx
801013fe:	03 15 f8 09 11 80    	add    0x801109f8,%edx
80101404:	52                   	push   %edx
80101405:	56                   	push   %esi
80101406:	e8 c5 ec ff ff       	call   801000d0 <bread>
8010140b:	89 d9                	mov    %ebx,%ecx
8010140d:	c1 fb 03             	sar    $0x3,%ebx
80101410:	ba 01 00 00 00       	mov    $0x1,%edx
80101415:	83 e1 07             	and    $0x7,%ecx
80101418:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
8010141e:	83 c4 10             	add    $0x10,%esp
80101421:	d3 e2                	shl    %cl,%edx
80101423:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101428:	85 d1                	test   %edx,%ecx
8010142a:	74 25                	je     80101451 <bfree+0x71>
8010142c:	f7 d2                	not    %edx
8010142e:	89 c6                	mov    %eax,%esi
80101430:	83 ec 0c             	sub    $0xc,%esp
80101433:	21 ca                	and    %ecx,%edx
80101435:	88 54 1e 5c          	mov    %dl,0x5c(%esi,%ebx,1)
80101439:	56                   	push   %esi
8010143a:	e8 81 19 00 00       	call   80102dc0 <log_write>
8010143f:	89 34 24             	mov    %esi,(%esp)
80101442:	e8 99 ed ff ff       	call   801001e0 <brelse>
80101447:	83 c4 10             	add    $0x10,%esp
8010144a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010144d:	5b                   	pop    %ebx
8010144e:	5e                   	pop    %esi
8010144f:	5d                   	pop    %ebp
80101450:	c3                   	ret    
80101451:	83 ec 0c             	sub    $0xc,%esp
80101454:	68 54 70 10 80       	push   $0x80107054
80101459:	e8 12 ef ff ff       	call   80100370 <panic>
8010145e:	66 90                	xchg   %ax,%ax

80101460 <iinit>:
80101460:	55                   	push   %ebp
80101461:	89 e5                	mov    %esp,%ebp
80101463:	53                   	push   %ebx
80101464:	bb 40 0a 11 80       	mov    $0x80110a40,%ebx
80101469:	83 ec 0c             	sub    $0xc,%esp
8010146c:	68 67 70 10 80       	push   $0x80107067
80101471:	68 00 0a 11 80       	push   $0x80110a00
80101476:	e8 e5 2d 00 00       	call   80104260 <initlock>
8010147b:	83 c4 10             	add    $0x10,%esp
8010147e:	66 90                	xchg   %ax,%ax
80101480:	83 ec 08             	sub    $0x8,%esp
80101483:	68 6e 70 10 80       	push   $0x8010706e
80101488:	53                   	push   %ebx
80101489:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010148f:	e8 bc 2c 00 00       	call   80104150 <initsleeplock>
80101494:	83 c4 10             	add    $0x10,%esp
80101497:	81 fb 60 26 11 80    	cmp    $0x80112660,%ebx
8010149d:	75 e1                	jne    80101480 <iinit+0x20>
8010149f:	83 ec 08             	sub    $0x8,%esp
801014a2:	68 e0 09 11 80       	push   $0x801109e0
801014a7:	ff 75 08             	pushl  0x8(%ebp)
801014aa:	e8 f1 fe ff ff       	call   801013a0 <readsb>
801014af:	ff 35 f8 09 11 80    	pushl  0x801109f8
801014b5:	ff 35 f4 09 11 80    	pushl  0x801109f4
801014bb:	ff 35 f0 09 11 80    	pushl  0x801109f0
801014c1:	ff 35 ec 09 11 80    	pushl  0x801109ec
801014c7:	ff 35 e8 09 11 80    	pushl  0x801109e8
801014cd:	ff 35 e4 09 11 80    	pushl  0x801109e4
801014d3:	ff 35 e0 09 11 80    	pushl  0x801109e0
801014d9:	68 c4 70 10 80       	push   $0x801070c4
801014de:	e8 7d f1 ff ff       	call   80100660 <cprintf>
801014e3:	83 c4 30             	add    $0x30,%esp
801014e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801014e9:	c9                   	leave  
801014ea:	c3                   	ret    
801014eb:	90                   	nop
801014ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801014f0 <ialloc>:
801014f0:	55                   	push   %ebp
801014f1:	89 e5                	mov    %esp,%ebp
801014f3:	57                   	push   %edi
801014f4:	56                   	push   %esi
801014f5:	53                   	push   %ebx
801014f6:	83 ec 1c             	sub    $0x1c,%esp
801014f9:	83 3d e8 09 11 80 01 	cmpl   $0x1,0x801109e8
80101500:	8b 45 0c             	mov    0xc(%ebp),%eax
80101503:	8b 75 08             	mov    0x8(%ebp),%esi
80101506:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101509:	0f 86 91 00 00 00    	jbe    801015a0 <ialloc+0xb0>
8010150f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101514:	eb 21                	jmp    80101537 <ialloc+0x47>
80101516:	8d 76 00             	lea    0x0(%esi),%esi
80101519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101520:	83 ec 0c             	sub    $0xc,%esp
80101523:	83 c3 01             	add    $0x1,%ebx
80101526:	57                   	push   %edi
80101527:	e8 b4 ec ff ff       	call   801001e0 <brelse>
8010152c:	83 c4 10             	add    $0x10,%esp
8010152f:	39 1d e8 09 11 80    	cmp    %ebx,0x801109e8
80101535:	76 69                	jbe    801015a0 <ialloc+0xb0>
80101537:	89 d8                	mov    %ebx,%eax
80101539:	83 ec 08             	sub    $0x8,%esp
8010153c:	c1 e8 03             	shr    $0x3,%eax
8010153f:	03 05 f4 09 11 80    	add    0x801109f4,%eax
80101545:	50                   	push   %eax
80101546:	56                   	push   %esi
80101547:	e8 84 eb ff ff       	call   801000d0 <bread>
8010154c:	89 c7                	mov    %eax,%edi
8010154e:	89 d8                	mov    %ebx,%eax
80101550:	83 c4 10             	add    $0x10,%esp
80101553:	83 e0 07             	and    $0x7,%eax
80101556:	c1 e0 06             	shl    $0x6,%eax
80101559:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
8010155d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101561:	75 bd                	jne    80101520 <ialloc+0x30>
80101563:	83 ec 04             	sub    $0x4,%esp
80101566:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101569:	6a 40                	push   $0x40
8010156b:	6a 00                	push   $0x0
8010156d:	51                   	push   %ecx
8010156e:	e8 3d 2f 00 00       	call   801044b0 <memset>
80101573:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101577:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010157a:	66 89 01             	mov    %ax,(%ecx)
8010157d:	89 3c 24             	mov    %edi,(%esp)
80101580:	e8 3b 18 00 00       	call   80102dc0 <log_write>
80101585:	89 3c 24             	mov    %edi,(%esp)
80101588:	e8 53 ec ff ff       	call   801001e0 <brelse>
8010158d:	83 c4 10             	add    $0x10,%esp
80101590:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101593:	89 da                	mov    %ebx,%edx
80101595:	89 f0                	mov    %esi,%eax
80101597:	5b                   	pop    %ebx
80101598:	5e                   	pop    %esi
80101599:	5f                   	pop    %edi
8010159a:	5d                   	pop    %ebp
8010159b:	e9 60 fc ff ff       	jmp    80101200 <iget>
801015a0:	83 ec 0c             	sub    $0xc,%esp
801015a3:	68 74 70 10 80       	push   $0x80107074
801015a8:	e8 c3 ed ff ff       	call   80100370 <panic>
801015ad:	8d 76 00             	lea    0x0(%esi),%esi

801015b0 <iupdate>:
801015b0:	55                   	push   %ebp
801015b1:	89 e5                	mov    %esp,%ebp
801015b3:	56                   	push   %esi
801015b4:	53                   	push   %ebx
801015b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801015b8:	83 ec 08             	sub    $0x8,%esp
801015bb:	8b 43 04             	mov    0x4(%ebx),%eax
801015be:	83 c3 5c             	add    $0x5c,%ebx
801015c1:	c1 e8 03             	shr    $0x3,%eax
801015c4:	03 05 f4 09 11 80    	add    0x801109f4,%eax
801015ca:	50                   	push   %eax
801015cb:	ff 73 a4             	pushl  -0x5c(%ebx)
801015ce:	e8 fd ea ff ff       	call   801000d0 <bread>
801015d3:	89 c6                	mov    %eax,%esi
801015d5:	8b 43 a8             	mov    -0x58(%ebx),%eax
801015d8:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
801015dc:	83 c4 0c             	add    $0xc,%esp
801015df:	83 e0 07             	and    $0x7,%eax
801015e2:	c1 e0 06             	shl    $0x6,%eax
801015e5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801015e9:	66 89 10             	mov    %dx,(%eax)
801015ec:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
801015f0:	83 c0 0c             	add    $0xc,%eax
801015f3:	66 89 50 f6          	mov    %dx,-0xa(%eax)
801015f7:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
801015fb:	66 89 50 f8          	mov    %dx,-0x8(%eax)
801015ff:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101603:	66 89 50 fa          	mov    %dx,-0x6(%eax)
80101607:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010160a:	89 50 fc             	mov    %edx,-0x4(%eax)
8010160d:	6a 34                	push   $0x34
8010160f:	53                   	push   %ebx
80101610:	50                   	push   %eax
80101611:	e8 4a 2f 00 00       	call   80104560 <memmove>
80101616:	89 34 24             	mov    %esi,(%esp)
80101619:	e8 a2 17 00 00       	call   80102dc0 <log_write>
8010161e:	89 75 08             	mov    %esi,0x8(%ebp)
80101621:	83 c4 10             	add    $0x10,%esp
80101624:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101627:	5b                   	pop    %ebx
80101628:	5e                   	pop    %esi
80101629:	5d                   	pop    %ebp
8010162a:	e9 b1 eb ff ff       	jmp    801001e0 <brelse>
8010162f:	90                   	nop

80101630 <idup>:
80101630:	55                   	push   %ebp
80101631:	89 e5                	mov    %esp,%ebp
80101633:	53                   	push   %ebx
80101634:	83 ec 10             	sub    $0x10,%esp
80101637:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010163a:	68 00 0a 11 80       	push   $0x80110a00
8010163f:	e8 3c 2c 00 00       	call   80104280 <acquire>
80101644:	83 43 08 01          	addl   $0x1,0x8(%ebx)
80101648:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010164f:	e8 0c 2e 00 00       	call   80104460 <release>
80101654:	89 d8                	mov    %ebx,%eax
80101656:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101659:	c9                   	leave  
8010165a:	c3                   	ret    
8010165b:	90                   	nop
8010165c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101660 <ilock>:
80101660:	55                   	push   %ebp
80101661:	89 e5                	mov    %esp,%ebp
80101663:	56                   	push   %esi
80101664:	53                   	push   %ebx
80101665:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101668:	85 db                	test   %ebx,%ebx
8010166a:	0f 84 b4 00 00 00    	je     80101724 <ilock+0xc4>
80101670:	8b 43 08             	mov    0x8(%ebx),%eax
80101673:	85 c0                	test   %eax,%eax
80101675:	0f 8e a9 00 00 00    	jle    80101724 <ilock+0xc4>
8010167b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010167e:	83 ec 0c             	sub    $0xc,%esp
80101681:	50                   	push   %eax
80101682:	e8 09 2b 00 00       	call   80104190 <acquiresleep>
80101687:	83 c4 10             	add    $0x10,%esp
8010168a:	f6 43 4c 02          	testb  $0x2,0x4c(%ebx)
8010168e:	74 10                	je     801016a0 <ilock+0x40>
80101690:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101693:	5b                   	pop    %ebx
80101694:	5e                   	pop    %esi
80101695:	5d                   	pop    %ebp
80101696:	c3                   	ret    
80101697:	89 f6                	mov    %esi,%esi
80101699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801016a0:	8b 43 04             	mov    0x4(%ebx),%eax
801016a3:	83 ec 08             	sub    $0x8,%esp
801016a6:	c1 e8 03             	shr    $0x3,%eax
801016a9:	03 05 f4 09 11 80    	add    0x801109f4,%eax
801016af:	50                   	push   %eax
801016b0:	ff 33                	pushl  (%ebx)
801016b2:	e8 19 ea ff ff       	call   801000d0 <bread>
801016b7:	89 c6                	mov    %eax,%esi
801016b9:	8b 43 04             	mov    0x4(%ebx),%eax
801016bc:	83 c4 0c             	add    $0xc,%esp
801016bf:	83 e0 07             	and    $0x7,%eax
801016c2:	c1 e0 06             	shl    $0x6,%eax
801016c5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801016c9:	0f b7 10             	movzwl (%eax),%edx
801016cc:	83 c0 0c             	add    $0xc,%eax
801016cf:	66 89 53 50          	mov    %dx,0x50(%ebx)
801016d3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801016d7:	66 89 53 52          	mov    %dx,0x52(%ebx)
801016db:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801016df:	66 89 53 54          	mov    %dx,0x54(%ebx)
801016e3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801016e7:	66 89 53 56          	mov    %dx,0x56(%ebx)
801016eb:	8b 50 fc             	mov    -0x4(%eax),%edx
801016ee:	89 53 58             	mov    %edx,0x58(%ebx)
801016f1:	6a 34                	push   $0x34
801016f3:	50                   	push   %eax
801016f4:	8d 43 5c             	lea    0x5c(%ebx),%eax
801016f7:	50                   	push   %eax
801016f8:	e8 63 2e 00 00       	call   80104560 <memmove>
801016fd:	89 34 24             	mov    %esi,(%esp)
80101700:	e8 db ea ff ff       	call   801001e0 <brelse>
80101705:	83 4b 4c 02          	orl    $0x2,0x4c(%ebx)
80101709:	83 c4 10             	add    $0x10,%esp
8010170c:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
80101711:	0f 85 79 ff ff ff    	jne    80101690 <ilock+0x30>
80101717:	83 ec 0c             	sub    $0xc,%esp
8010171a:	68 8c 70 10 80       	push   $0x8010708c
8010171f:	e8 4c ec ff ff       	call   80100370 <panic>
80101724:	83 ec 0c             	sub    $0xc,%esp
80101727:	68 86 70 10 80       	push   $0x80107086
8010172c:	e8 3f ec ff ff       	call   80100370 <panic>
80101731:	eb 0d                	jmp    80101740 <iunlock>
80101733:	90                   	nop
80101734:	90                   	nop
80101735:	90                   	nop
80101736:	90                   	nop
80101737:	90                   	nop
80101738:	90                   	nop
80101739:	90                   	nop
8010173a:	90                   	nop
8010173b:	90                   	nop
8010173c:	90                   	nop
8010173d:	90                   	nop
8010173e:	90                   	nop
8010173f:	90                   	nop

80101740 <iunlock>:
80101740:	55                   	push   %ebp
80101741:	89 e5                	mov    %esp,%ebp
80101743:	56                   	push   %esi
80101744:	53                   	push   %ebx
80101745:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101748:	85 db                	test   %ebx,%ebx
8010174a:	74 28                	je     80101774 <iunlock+0x34>
8010174c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010174f:	83 ec 0c             	sub    $0xc,%esp
80101752:	56                   	push   %esi
80101753:	e8 d8 2a 00 00       	call   80104230 <holdingsleep>
80101758:	83 c4 10             	add    $0x10,%esp
8010175b:	85 c0                	test   %eax,%eax
8010175d:	74 15                	je     80101774 <iunlock+0x34>
8010175f:	8b 43 08             	mov    0x8(%ebx),%eax
80101762:	85 c0                	test   %eax,%eax
80101764:	7e 0e                	jle    80101774 <iunlock+0x34>
80101766:	89 75 08             	mov    %esi,0x8(%ebp)
80101769:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010176c:	5b                   	pop    %ebx
8010176d:	5e                   	pop    %esi
8010176e:	5d                   	pop    %ebp
8010176f:	e9 7c 2a 00 00       	jmp    801041f0 <releasesleep>
80101774:	83 ec 0c             	sub    $0xc,%esp
80101777:	68 9b 70 10 80       	push   $0x8010709b
8010177c:	e8 ef eb ff ff       	call   80100370 <panic>
80101781:	eb 0d                	jmp    80101790 <iput>
80101783:	90                   	nop
80101784:	90                   	nop
80101785:	90                   	nop
80101786:	90                   	nop
80101787:	90                   	nop
80101788:	90                   	nop
80101789:	90                   	nop
8010178a:	90                   	nop
8010178b:	90                   	nop
8010178c:	90                   	nop
8010178d:	90                   	nop
8010178e:	90                   	nop
8010178f:	90                   	nop

80101790 <iput>:
80101790:	55                   	push   %ebp
80101791:	89 e5                	mov    %esp,%ebp
80101793:	57                   	push   %edi
80101794:	56                   	push   %esi
80101795:	53                   	push   %ebx
80101796:	83 ec 28             	sub    $0x28,%esp
80101799:	8b 75 08             	mov    0x8(%ebp),%esi
8010179c:	68 00 0a 11 80       	push   $0x80110a00
801017a1:	e8 da 2a 00 00       	call   80104280 <acquire>
801017a6:	8b 46 08             	mov    0x8(%esi),%eax
801017a9:	83 c4 10             	add    $0x10,%esp
801017ac:	83 f8 01             	cmp    $0x1,%eax
801017af:	74 1f                	je     801017d0 <iput+0x40>
801017b1:	83 e8 01             	sub    $0x1,%eax
801017b4:	89 46 08             	mov    %eax,0x8(%esi)
801017b7:	c7 45 08 00 0a 11 80 	movl   $0x80110a00,0x8(%ebp)
801017be:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017c1:	5b                   	pop    %ebx
801017c2:	5e                   	pop    %esi
801017c3:	5f                   	pop    %edi
801017c4:	5d                   	pop    %ebp
801017c5:	e9 96 2c 00 00       	jmp    80104460 <release>
801017ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801017d0:	f6 46 4c 02          	testb  $0x2,0x4c(%esi)
801017d4:	74 db                	je     801017b1 <iput+0x21>
801017d6:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
801017db:	75 d4                	jne    801017b1 <iput+0x21>
801017dd:	83 ec 0c             	sub    $0xc,%esp
801017e0:	8d 5e 5c             	lea    0x5c(%esi),%ebx
801017e3:	8d be 8c 00 00 00    	lea    0x8c(%esi),%edi
801017e9:	68 00 0a 11 80       	push   $0x80110a00
801017ee:	e8 6d 2c 00 00       	call   80104460 <release>
801017f3:	83 c4 10             	add    $0x10,%esp
801017f6:	eb 0f                	jmp    80101807 <iput+0x77>
801017f8:	90                   	nop
801017f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101800:	83 c3 04             	add    $0x4,%ebx
80101803:	39 fb                	cmp    %edi,%ebx
80101805:	74 19                	je     80101820 <iput+0x90>
80101807:	8b 13                	mov    (%ebx),%edx
80101809:	85 d2                	test   %edx,%edx
8010180b:	74 f3                	je     80101800 <iput+0x70>
8010180d:	8b 06                	mov    (%esi),%eax
8010180f:	e8 cc fb ff ff       	call   801013e0 <bfree>
80101814:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010181a:	eb e4                	jmp    80101800 <iput+0x70>
8010181c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101820:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101826:	85 c0                	test   %eax,%eax
80101828:	75 46                	jne    80101870 <iput+0xe0>
8010182a:	83 ec 0c             	sub    $0xc,%esp
8010182d:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
80101834:	56                   	push   %esi
80101835:	e8 76 fd ff ff       	call   801015b0 <iupdate>
8010183a:	31 c0                	xor    %eax,%eax
8010183c:	66 89 46 50          	mov    %ax,0x50(%esi)
80101840:	89 34 24             	mov    %esi,(%esp)
80101843:	e8 68 fd ff ff       	call   801015b0 <iupdate>
80101848:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010184f:	e8 2c 2a 00 00       	call   80104280 <acquire>
80101854:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
8010185b:	8b 46 08             	mov    0x8(%esi),%eax
8010185e:	83 c4 10             	add    $0x10,%esp
80101861:	e9 4b ff ff ff       	jmp    801017b1 <iput+0x21>
80101866:	8d 76 00             	lea    0x0(%esi),%esi
80101869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101870:	83 ec 08             	sub    $0x8,%esp
80101873:	50                   	push   %eax
80101874:	ff 36                	pushl  (%esi)
80101876:	e8 55 e8 ff ff       	call   801000d0 <bread>
8010187b:	83 c4 10             	add    $0x10,%esp
8010187e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101881:	8d 58 5c             	lea    0x5c(%eax),%ebx
80101884:	8d b8 5c 02 00 00    	lea    0x25c(%eax),%edi
8010188a:	eb 0b                	jmp    80101897 <iput+0x107>
8010188c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101890:	83 c3 04             	add    $0x4,%ebx
80101893:	39 df                	cmp    %ebx,%edi
80101895:	74 0f                	je     801018a6 <iput+0x116>
80101897:	8b 13                	mov    (%ebx),%edx
80101899:	85 d2                	test   %edx,%edx
8010189b:	74 f3                	je     80101890 <iput+0x100>
8010189d:	8b 06                	mov    (%esi),%eax
8010189f:	e8 3c fb ff ff       	call   801013e0 <bfree>
801018a4:	eb ea                	jmp    80101890 <iput+0x100>
801018a6:	83 ec 0c             	sub    $0xc,%esp
801018a9:	ff 75 e4             	pushl  -0x1c(%ebp)
801018ac:	e8 2f e9 ff ff       	call   801001e0 <brelse>
801018b1:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018b7:	8b 06                	mov    (%esi),%eax
801018b9:	e8 22 fb ff ff       	call   801013e0 <bfree>
801018be:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
801018c5:	00 00 00 
801018c8:	83 c4 10             	add    $0x10,%esp
801018cb:	e9 5a ff ff ff       	jmp    8010182a <iput+0x9a>

801018d0 <iunlockput>:
801018d0:	55                   	push   %ebp
801018d1:	89 e5                	mov    %esp,%ebp
801018d3:	53                   	push   %ebx
801018d4:	83 ec 10             	sub    $0x10,%esp
801018d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801018da:	53                   	push   %ebx
801018db:	e8 60 fe ff ff       	call   80101740 <iunlock>
801018e0:	89 5d 08             	mov    %ebx,0x8(%ebp)
801018e3:	83 c4 10             	add    $0x10,%esp
801018e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801018e9:	c9                   	leave  
801018ea:	e9 a1 fe ff ff       	jmp    80101790 <iput>
801018ef:	90                   	nop

801018f0 <stati>:
801018f0:	55                   	push   %ebp
801018f1:	89 e5                	mov    %esp,%ebp
801018f3:	8b 55 08             	mov    0x8(%ebp),%edx
801018f6:	8b 45 0c             	mov    0xc(%ebp),%eax
801018f9:	8b 0a                	mov    (%edx),%ecx
801018fb:	89 48 04             	mov    %ecx,0x4(%eax)
801018fe:	8b 4a 04             	mov    0x4(%edx),%ecx
80101901:	89 48 08             	mov    %ecx,0x8(%eax)
80101904:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101908:	66 89 08             	mov    %cx,(%eax)
8010190b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010190f:	66 89 48 0c          	mov    %cx,0xc(%eax)
80101913:	8b 52 58             	mov    0x58(%edx),%edx
80101916:	89 50 10             	mov    %edx,0x10(%eax)
80101919:	5d                   	pop    %ebp
8010191a:	c3                   	ret    
8010191b:	90                   	nop
8010191c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101920 <readi>:
80101920:	55                   	push   %ebp
80101921:	89 e5                	mov    %esp,%ebp
80101923:	57                   	push   %edi
80101924:	56                   	push   %esi
80101925:	53                   	push   %ebx
80101926:	83 ec 1c             	sub    $0x1c,%esp
80101929:	8b 45 08             	mov    0x8(%ebp),%eax
8010192c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010192f:	8b 75 10             	mov    0x10(%ebp),%esi
80101932:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101937:	89 7d e0             	mov    %edi,-0x20(%ebp)
8010193a:	8b 7d 14             	mov    0x14(%ebp),%edi
8010193d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101940:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101943:	0f 84 a7 00 00 00    	je     801019f0 <readi+0xd0>
80101949:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010194c:	8b 40 58             	mov    0x58(%eax),%eax
8010194f:	39 f0                	cmp    %esi,%eax
80101951:	0f 82 ba 00 00 00    	jb     80101a11 <readi+0xf1>
80101957:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010195a:	89 f9                	mov    %edi,%ecx
8010195c:	01 f1                	add    %esi,%ecx
8010195e:	0f 82 ad 00 00 00    	jb     80101a11 <readi+0xf1>
80101964:	89 c2                	mov    %eax,%edx
80101966:	29 f2                	sub    %esi,%edx
80101968:	39 c8                	cmp    %ecx,%eax
8010196a:	0f 43 d7             	cmovae %edi,%edx
8010196d:	31 ff                	xor    %edi,%edi
8010196f:	85 d2                	test   %edx,%edx
80101971:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101974:	74 6c                	je     801019e2 <readi+0xc2>
80101976:	8d 76 00             	lea    0x0(%esi),%esi
80101979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101980:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101983:	89 f2                	mov    %esi,%edx
80101985:	c1 ea 09             	shr    $0x9,%edx
80101988:	89 d8                	mov    %ebx,%eax
8010198a:	e8 41 f9 ff ff       	call   801012d0 <bmap>
8010198f:	83 ec 08             	sub    $0x8,%esp
80101992:	50                   	push   %eax
80101993:	ff 33                	pushl  (%ebx)
80101995:	e8 36 e7 ff ff       	call   801000d0 <bread>
8010199a:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
8010199d:	89 c2                	mov    %eax,%edx
8010199f:	89 f0                	mov    %esi,%eax
801019a1:	25 ff 01 00 00       	and    $0x1ff,%eax
801019a6:	b9 00 02 00 00       	mov    $0x200,%ecx
801019ab:	83 c4 0c             	add    $0xc,%esp
801019ae:	29 c1                	sub    %eax,%ecx
801019b0:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
801019b4:	89 55 dc             	mov    %edx,-0x24(%ebp)
801019b7:	29 fb                	sub    %edi,%ebx
801019b9:	39 d9                	cmp    %ebx,%ecx
801019bb:	0f 46 d9             	cmovbe %ecx,%ebx
801019be:	53                   	push   %ebx
801019bf:	50                   	push   %eax
801019c0:	01 df                	add    %ebx,%edi
801019c2:	ff 75 e0             	pushl  -0x20(%ebp)
801019c5:	01 de                	add    %ebx,%esi
801019c7:	e8 94 2b 00 00       	call   80104560 <memmove>
801019cc:	8b 55 dc             	mov    -0x24(%ebp),%edx
801019cf:	89 14 24             	mov    %edx,(%esp)
801019d2:	e8 09 e8 ff ff       	call   801001e0 <brelse>
801019d7:	01 5d e0             	add    %ebx,-0x20(%ebp)
801019da:	83 c4 10             	add    $0x10,%esp
801019dd:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801019e0:	77 9e                	ja     80101980 <readi+0x60>
801019e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801019e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801019e8:	5b                   	pop    %ebx
801019e9:	5e                   	pop    %esi
801019ea:	5f                   	pop    %edi
801019eb:	5d                   	pop    %ebp
801019ec:	c3                   	ret    
801019ed:	8d 76 00             	lea    0x0(%esi),%esi
801019f0:	0f bf 40 52          	movswl 0x52(%eax),%eax
801019f4:	66 83 f8 09          	cmp    $0x9,%ax
801019f8:	77 17                	ja     80101a11 <readi+0xf1>
801019fa:	8b 04 c5 80 09 11 80 	mov    -0x7feef680(,%eax,8),%eax
80101a01:	85 c0                	test   %eax,%eax
80101a03:	74 0c                	je     80101a11 <readi+0xf1>
80101a05:	89 7d 10             	mov    %edi,0x10(%ebp)
80101a08:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a0b:	5b                   	pop    %ebx
80101a0c:	5e                   	pop    %esi
80101a0d:	5f                   	pop    %edi
80101a0e:	5d                   	pop    %ebp
80101a0f:	ff e0                	jmp    *%eax
80101a11:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a16:	eb cd                	jmp    801019e5 <readi+0xc5>
80101a18:	90                   	nop
80101a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101a20 <writei>:
80101a20:	55                   	push   %ebp
80101a21:	89 e5                	mov    %esp,%ebp
80101a23:	57                   	push   %edi
80101a24:	56                   	push   %esi
80101a25:	53                   	push   %ebx
80101a26:	83 ec 1c             	sub    $0x1c,%esp
80101a29:	8b 45 08             	mov    0x8(%ebp),%eax
80101a2c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a2f:	8b 4d 14             	mov    0x14(%ebp),%ecx
80101a32:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101a37:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a3a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a3d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a40:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101a43:	0f 84 b7 00 00 00    	je     80101b00 <writei+0xe0>
80101a49:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a4c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a4f:	0f 82 eb 00 00 00    	jb     80101b40 <writei+0x120>
80101a55:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101a58:	89 c8                	mov    %ecx,%eax
80101a5a:	01 f0                	add    %esi,%eax
80101a5c:	0f 82 de 00 00 00    	jb     80101b40 <writei+0x120>
80101a62:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101a67:	0f 87 d3 00 00 00    	ja     80101b40 <writei+0x120>
80101a6d:	85 c9                	test   %ecx,%ecx
80101a6f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101a76:	74 79                	je     80101af1 <writei+0xd1>
80101a78:	90                   	nop
80101a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101a80:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101a83:	89 f2                	mov    %esi,%edx
80101a85:	c1 ea 09             	shr    $0x9,%edx
80101a88:	89 f8                	mov    %edi,%eax
80101a8a:	e8 41 f8 ff ff       	call   801012d0 <bmap>
80101a8f:	83 ec 08             	sub    $0x8,%esp
80101a92:	50                   	push   %eax
80101a93:	ff 37                	pushl  (%edi)
80101a95:	e8 36 e6 ff ff       	call   801000d0 <bread>
80101a9a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101a9d:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
80101aa0:	89 c7                	mov    %eax,%edi
80101aa2:	89 f0                	mov    %esi,%eax
80101aa4:	b9 00 02 00 00       	mov    $0x200,%ecx
80101aa9:	83 c4 0c             	add    $0xc,%esp
80101aac:	25 ff 01 00 00       	and    $0x1ff,%eax
80101ab1:	29 c1                	sub    %eax,%ecx
80101ab3:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
80101ab7:	39 d9                	cmp    %ebx,%ecx
80101ab9:	0f 46 d9             	cmovbe %ecx,%ebx
80101abc:	53                   	push   %ebx
80101abd:	ff 75 dc             	pushl  -0x24(%ebp)
80101ac0:	01 de                	add    %ebx,%esi
80101ac2:	50                   	push   %eax
80101ac3:	e8 98 2a 00 00       	call   80104560 <memmove>
80101ac8:	89 3c 24             	mov    %edi,(%esp)
80101acb:	e8 f0 12 00 00       	call   80102dc0 <log_write>
80101ad0:	89 3c 24             	mov    %edi,(%esp)
80101ad3:	e8 08 e7 ff ff       	call   801001e0 <brelse>
80101ad8:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101adb:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101ade:	83 c4 10             	add    $0x10,%esp
80101ae1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101ae4:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101ae7:	77 97                	ja     80101a80 <writei+0x60>
80101ae9:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101aec:	3b 70 58             	cmp    0x58(%eax),%esi
80101aef:	77 37                	ja     80101b28 <writei+0x108>
80101af1:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101af4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101af7:	5b                   	pop    %ebx
80101af8:	5e                   	pop    %esi
80101af9:	5f                   	pop    %edi
80101afa:	5d                   	pop    %ebp
80101afb:	c3                   	ret    
80101afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b00:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b04:	66 83 f8 09          	cmp    $0x9,%ax
80101b08:	77 36                	ja     80101b40 <writei+0x120>
80101b0a:	8b 04 c5 84 09 11 80 	mov    -0x7feef67c(,%eax,8),%eax
80101b11:	85 c0                	test   %eax,%eax
80101b13:	74 2b                	je     80101b40 <writei+0x120>
80101b15:	89 4d 10             	mov    %ecx,0x10(%ebp)
80101b18:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b1b:	5b                   	pop    %ebx
80101b1c:	5e                   	pop    %esi
80101b1d:	5f                   	pop    %edi
80101b1e:	5d                   	pop    %ebp
80101b1f:	ff e0                	jmp    *%eax
80101b21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101b28:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b2b:	83 ec 0c             	sub    $0xc,%esp
80101b2e:	89 70 58             	mov    %esi,0x58(%eax)
80101b31:	50                   	push   %eax
80101b32:	e8 79 fa ff ff       	call   801015b0 <iupdate>
80101b37:	83 c4 10             	add    $0x10,%esp
80101b3a:	eb b5                	jmp    80101af1 <writei+0xd1>
80101b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b45:	eb ad                	jmp    80101af4 <writei+0xd4>
80101b47:	89 f6                	mov    %esi,%esi
80101b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b50 <namecmp>:
80101b50:	55                   	push   %ebp
80101b51:	89 e5                	mov    %esp,%ebp
80101b53:	83 ec 0c             	sub    $0xc,%esp
80101b56:	6a 0e                	push   $0xe
80101b58:	ff 75 0c             	pushl  0xc(%ebp)
80101b5b:	ff 75 08             	pushl  0x8(%ebp)
80101b5e:	e8 6d 2a 00 00       	call   801045d0 <strncmp>
80101b63:	c9                   	leave  
80101b64:	c3                   	ret    
80101b65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b70 <dirlookup>:
80101b70:	55                   	push   %ebp
80101b71:	89 e5                	mov    %esp,%ebp
80101b73:	57                   	push   %edi
80101b74:	56                   	push   %esi
80101b75:	53                   	push   %ebx
80101b76:	83 ec 1c             	sub    $0x1c,%esp
80101b79:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101b7c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101b81:	0f 85 80 00 00 00    	jne    80101c07 <dirlookup+0x97>
80101b87:	8b 53 58             	mov    0x58(%ebx),%edx
80101b8a:	31 ff                	xor    %edi,%edi
80101b8c:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101b8f:	85 d2                	test   %edx,%edx
80101b91:	75 0d                	jne    80101ba0 <dirlookup+0x30>
80101b93:	eb 5b                	jmp    80101bf0 <dirlookup+0x80>
80101b95:	8d 76 00             	lea    0x0(%esi),%esi
80101b98:	83 c7 10             	add    $0x10,%edi
80101b9b:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101b9e:	76 50                	jbe    80101bf0 <dirlookup+0x80>
80101ba0:	6a 10                	push   $0x10
80101ba2:	57                   	push   %edi
80101ba3:	56                   	push   %esi
80101ba4:	53                   	push   %ebx
80101ba5:	e8 76 fd ff ff       	call   80101920 <readi>
80101baa:	83 c4 10             	add    $0x10,%esp
80101bad:	83 f8 10             	cmp    $0x10,%eax
80101bb0:	75 48                	jne    80101bfa <dirlookup+0x8a>
80101bb2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101bb7:	74 df                	je     80101b98 <dirlookup+0x28>
80101bb9:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bbc:	83 ec 04             	sub    $0x4,%esp
80101bbf:	6a 0e                	push   $0xe
80101bc1:	50                   	push   %eax
80101bc2:	ff 75 0c             	pushl  0xc(%ebp)
80101bc5:	e8 06 2a 00 00       	call   801045d0 <strncmp>
80101bca:	83 c4 10             	add    $0x10,%esp
80101bcd:	85 c0                	test   %eax,%eax
80101bcf:	75 c7                	jne    80101b98 <dirlookup+0x28>
80101bd1:	8b 45 10             	mov    0x10(%ebp),%eax
80101bd4:	85 c0                	test   %eax,%eax
80101bd6:	74 05                	je     80101bdd <dirlookup+0x6d>
80101bd8:	8b 45 10             	mov    0x10(%ebp),%eax
80101bdb:	89 38                	mov    %edi,(%eax)
80101bdd:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101be1:	8b 03                	mov    (%ebx),%eax
80101be3:	e8 18 f6 ff ff       	call   80101200 <iget>
80101be8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101beb:	5b                   	pop    %ebx
80101bec:	5e                   	pop    %esi
80101bed:	5f                   	pop    %edi
80101bee:	5d                   	pop    %ebp
80101bef:	c3                   	ret    
80101bf0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101bf3:	31 c0                	xor    %eax,%eax
80101bf5:	5b                   	pop    %ebx
80101bf6:	5e                   	pop    %esi
80101bf7:	5f                   	pop    %edi
80101bf8:	5d                   	pop    %ebp
80101bf9:	c3                   	ret    
80101bfa:	83 ec 0c             	sub    $0xc,%esp
80101bfd:	68 b5 70 10 80       	push   $0x801070b5
80101c02:	e8 69 e7 ff ff       	call   80100370 <panic>
80101c07:	83 ec 0c             	sub    $0xc,%esp
80101c0a:	68 a3 70 10 80       	push   $0x801070a3
80101c0f:	e8 5c e7 ff ff       	call   80100370 <panic>
80101c14:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c1a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c20 <namex>:
80101c20:	55                   	push   %ebp
80101c21:	89 e5                	mov    %esp,%ebp
80101c23:	57                   	push   %edi
80101c24:	56                   	push   %esi
80101c25:	53                   	push   %ebx
80101c26:	89 cf                	mov    %ecx,%edi
80101c28:	89 c3                	mov    %eax,%ebx
80101c2a:	83 ec 1c             	sub    $0x1c,%esp
80101c2d:	80 38 2f             	cmpb   $0x2f,(%eax)
80101c30:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101c33:	0f 84 55 01 00 00    	je     80101d8e <namex+0x16e>
80101c39:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80101c3f:	83 ec 0c             	sub    $0xc,%esp
80101c42:	8b 70 68             	mov    0x68(%eax),%esi
80101c45:	68 00 0a 11 80       	push   $0x80110a00
80101c4a:	e8 31 26 00 00       	call   80104280 <acquire>
80101c4f:	83 46 08 01          	addl   $0x1,0x8(%esi)
80101c53:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101c5a:	e8 01 28 00 00       	call   80104460 <release>
80101c5f:	83 c4 10             	add    $0x10,%esp
80101c62:	eb 07                	jmp    80101c6b <namex+0x4b>
80101c64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101c68:	83 c3 01             	add    $0x1,%ebx
80101c6b:	0f b6 03             	movzbl (%ebx),%eax
80101c6e:	3c 2f                	cmp    $0x2f,%al
80101c70:	74 f6                	je     80101c68 <namex+0x48>
80101c72:	84 c0                	test   %al,%al
80101c74:	0f 84 e3 00 00 00    	je     80101d5d <namex+0x13d>
80101c7a:	0f b6 03             	movzbl (%ebx),%eax
80101c7d:	89 da                	mov    %ebx,%edx
80101c7f:	84 c0                	test   %al,%al
80101c81:	0f 84 ac 00 00 00    	je     80101d33 <namex+0x113>
80101c87:	3c 2f                	cmp    $0x2f,%al
80101c89:	75 09                	jne    80101c94 <namex+0x74>
80101c8b:	e9 a3 00 00 00       	jmp    80101d33 <namex+0x113>
80101c90:	84 c0                	test   %al,%al
80101c92:	74 0a                	je     80101c9e <namex+0x7e>
80101c94:	83 c2 01             	add    $0x1,%edx
80101c97:	0f b6 02             	movzbl (%edx),%eax
80101c9a:	3c 2f                	cmp    $0x2f,%al
80101c9c:	75 f2                	jne    80101c90 <namex+0x70>
80101c9e:	89 d1                	mov    %edx,%ecx
80101ca0:	29 d9                	sub    %ebx,%ecx
80101ca2:	83 f9 0d             	cmp    $0xd,%ecx
80101ca5:	0f 8e 8d 00 00 00    	jle    80101d38 <namex+0x118>
80101cab:	83 ec 04             	sub    $0x4,%esp
80101cae:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101cb1:	6a 0e                	push   $0xe
80101cb3:	53                   	push   %ebx
80101cb4:	57                   	push   %edi
80101cb5:	e8 a6 28 00 00       	call   80104560 <memmove>
80101cba:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101cbd:	83 c4 10             	add    $0x10,%esp
80101cc0:	89 d3                	mov    %edx,%ebx
80101cc2:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101cc5:	75 11                	jne    80101cd8 <namex+0xb8>
80101cc7:	89 f6                	mov    %esi,%esi
80101cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101cd0:	83 c3 01             	add    $0x1,%ebx
80101cd3:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101cd6:	74 f8                	je     80101cd0 <namex+0xb0>
80101cd8:	83 ec 0c             	sub    $0xc,%esp
80101cdb:	56                   	push   %esi
80101cdc:	e8 7f f9 ff ff       	call   80101660 <ilock>
80101ce1:	83 c4 10             	add    $0x10,%esp
80101ce4:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101ce9:	0f 85 7f 00 00 00    	jne    80101d6e <namex+0x14e>
80101cef:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101cf2:	85 d2                	test   %edx,%edx
80101cf4:	74 09                	je     80101cff <namex+0xdf>
80101cf6:	80 3b 00             	cmpb   $0x0,(%ebx)
80101cf9:	0f 84 a5 00 00 00    	je     80101da4 <namex+0x184>
80101cff:	83 ec 04             	sub    $0x4,%esp
80101d02:	6a 00                	push   $0x0
80101d04:	57                   	push   %edi
80101d05:	56                   	push   %esi
80101d06:	e8 65 fe ff ff       	call   80101b70 <dirlookup>
80101d0b:	83 c4 10             	add    $0x10,%esp
80101d0e:	85 c0                	test   %eax,%eax
80101d10:	74 5c                	je     80101d6e <namex+0x14e>
80101d12:	83 ec 0c             	sub    $0xc,%esp
80101d15:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d18:	56                   	push   %esi
80101d19:	e8 22 fa ff ff       	call   80101740 <iunlock>
80101d1e:	89 34 24             	mov    %esi,(%esp)
80101d21:	e8 6a fa ff ff       	call   80101790 <iput>
80101d26:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d29:	83 c4 10             	add    $0x10,%esp
80101d2c:	89 c6                	mov    %eax,%esi
80101d2e:	e9 38 ff ff ff       	jmp    80101c6b <namex+0x4b>
80101d33:	31 c9                	xor    %ecx,%ecx
80101d35:	8d 76 00             	lea    0x0(%esi),%esi
80101d38:	83 ec 04             	sub    $0x4,%esp
80101d3b:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d3e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d41:	51                   	push   %ecx
80101d42:	53                   	push   %ebx
80101d43:	57                   	push   %edi
80101d44:	e8 17 28 00 00       	call   80104560 <memmove>
80101d49:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101d4c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101d4f:	83 c4 10             	add    $0x10,%esp
80101d52:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101d56:	89 d3                	mov    %edx,%ebx
80101d58:	e9 65 ff ff ff       	jmp    80101cc2 <namex+0xa2>
80101d5d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101d60:	85 c0                	test   %eax,%eax
80101d62:	75 56                	jne    80101dba <namex+0x19a>
80101d64:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d67:	89 f0                	mov    %esi,%eax
80101d69:	5b                   	pop    %ebx
80101d6a:	5e                   	pop    %esi
80101d6b:	5f                   	pop    %edi
80101d6c:	5d                   	pop    %ebp
80101d6d:	c3                   	ret    
80101d6e:	83 ec 0c             	sub    $0xc,%esp
80101d71:	56                   	push   %esi
80101d72:	e8 c9 f9 ff ff       	call   80101740 <iunlock>
80101d77:	89 34 24             	mov    %esi,(%esp)
80101d7a:	31 f6                	xor    %esi,%esi
80101d7c:	e8 0f fa ff ff       	call   80101790 <iput>
80101d81:	83 c4 10             	add    $0x10,%esp
80101d84:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d87:	89 f0                	mov    %esi,%eax
80101d89:	5b                   	pop    %ebx
80101d8a:	5e                   	pop    %esi
80101d8b:	5f                   	pop    %edi
80101d8c:	5d                   	pop    %ebp
80101d8d:	c3                   	ret    
80101d8e:	ba 01 00 00 00       	mov    $0x1,%edx
80101d93:	b8 01 00 00 00       	mov    $0x1,%eax
80101d98:	e8 63 f4 ff ff       	call   80101200 <iget>
80101d9d:	89 c6                	mov    %eax,%esi
80101d9f:	e9 c7 fe ff ff       	jmp    80101c6b <namex+0x4b>
80101da4:	83 ec 0c             	sub    $0xc,%esp
80101da7:	56                   	push   %esi
80101da8:	e8 93 f9 ff ff       	call   80101740 <iunlock>
80101dad:	83 c4 10             	add    $0x10,%esp
80101db0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101db3:	89 f0                	mov    %esi,%eax
80101db5:	5b                   	pop    %ebx
80101db6:	5e                   	pop    %esi
80101db7:	5f                   	pop    %edi
80101db8:	5d                   	pop    %ebp
80101db9:	c3                   	ret    
80101dba:	83 ec 0c             	sub    $0xc,%esp
80101dbd:	56                   	push   %esi
80101dbe:	31 f6                	xor    %esi,%esi
80101dc0:	e8 cb f9 ff ff       	call   80101790 <iput>
80101dc5:	83 c4 10             	add    $0x10,%esp
80101dc8:	eb 9a                	jmp    80101d64 <namex+0x144>
80101dca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101dd0 <dirlink>:
80101dd0:	55                   	push   %ebp
80101dd1:	89 e5                	mov    %esp,%ebp
80101dd3:	57                   	push   %edi
80101dd4:	56                   	push   %esi
80101dd5:	53                   	push   %ebx
80101dd6:	83 ec 20             	sub    $0x20,%esp
80101dd9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101ddc:	6a 00                	push   $0x0
80101dde:	ff 75 0c             	pushl  0xc(%ebp)
80101de1:	53                   	push   %ebx
80101de2:	e8 89 fd ff ff       	call   80101b70 <dirlookup>
80101de7:	83 c4 10             	add    $0x10,%esp
80101dea:	85 c0                	test   %eax,%eax
80101dec:	75 67                	jne    80101e55 <dirlink+0x85>
80101dee:	8b 7b 58             	mov    0x58(%ebx),%edi
80101df1:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101df4:	85 ff                	test   %edi,%edi
80101df6:	74 29                	je     80101e21 <dirlink+0x51>
80101df8:	31 ff                	xor    %edi,%edi
80101dfa:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101dfd:	eb 09                	jmp    80101e08 <dirlink+0x38>
80101dff:	90                   	nop
80101e00:	83 c7 10             	add    $0x10,%edi
80101e03:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101e06:	76 19                	jbe    80101e21 <dirlink+0x51>
80101e08:	6a 10                	push   $0x10
80101e0a:	57                   	push   %edi
80101e0b:	56                   	push   %esi
80101e0c:	53                   	push   %ebx
80101e0d:	e8 0e fb ff ff       	call   80101920 <readi>
80101e12:	83 c4 10             	add    $0x10,%esp
80101e15:	83 f8 10             	cmp    $0x10,%eax
80101e18:	75 4e                	jne    80101e68 <dirlink+0x98>
80101e1a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e1f:	75 df                	jne    80101e00 <dirlink+0x30>
80101e21:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e24:	83 ec 04             	sub    $0x4,%esp
80101e27:	6a 0e                	push   $0xe
80101e29:	ff 75 0c             	pushl  0xc(%ebp)
80101e2c:	50                   	push   %eax
80101e2d:	e8 fe 27 00 00       	call   80104630 <strncpy>
80101e32:	8b 45 10             	mov    0x10(%ebp),%eax
80101e35:	6a 10                	push   $0x10
80101e37:	57                   	push   %edi
80101e38:	56                   	push   %esi
80101e39:	53                   	push   %ebx
80101e3a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80101e3e:	e8 dd fb ff ff       	call   80101a20 <writei>
80101e43:	83 c4 20             	add    $0x20,%esp
80101e46:	83 f8 10             	cmp    $0x10,%eax
80101e49:	75 2a                	jne    80101e75 <dirlink+0xa5>
80101e4b:	31 c0                	xor    %eax,%eax
80101e4d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e50:	5b                   	pop    %ebx
80101e51:	5e                   	pop    %esi
80101e52:	5f                   	pop    %edi
80101e53:	5d                   	pop    %ebp
80101e54:	c3                   	ret    
80101e55:	83 ec 0c             	sub    $0xc,%esp
80101e58:	50                   	push   %eax
80101e59:	e8 32 f9 ff ff       	call   80101790 <iput>
80101e5e:	83 c4 10             	add    $0x10,%esp
80101e61:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101e66:	eb e5                	jmp    80101e4d <dirlink+0x7d>
80101e68:	83 ec 0c             	sub    $0xc,%esp
80101e6b:	68 b5 70 10 80       	push   $0x801070b5
80101e70:	e8 fb e4 ff ff       	call   80100370 <panic>
80101e75:	83 ec 0c             	sub    $0xc,%esp
80101e78:	68 82 77 10 80       	push   $0x80107782
80101e7d:	e8 ee e4 ff ff       	call   80100370 <panic>
80101e82:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101e90 <namei>:
80101e90:	55                   	push   %ebp
80101e91:	31 d2                	xor    %edx,%edx
80101e93:	89 e5                	mov    %esp,%ebp
80101e95:	83 ec 18             	sub    $0x18,%esp
80101e98:	8b 45 08             	mov    0x8(%ebp),%eax
80101e9b:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101e9e:	e8 7d fd ff ff       	call   80101c20 <namex>
80101ea3:	c9                   	leave  
80101ea4:	c3                   	ret    
80101ea5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101eb0 <nameiparent>:
80101eb0:	55                   	push   %ebp
80101eb1:	ba 01 00 00 00       	mov    $0x1,%edx
80101eb6:	89 e5                	mov    %esp,%ebp
80101eb8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101ebb:	8b 45 08             	mov    0x8(%ebp),%eax
80101ebe:	5d                   	pop    %ebp
80101ebf:	e9 5c fd ff ff       	jmp    80101c20 <namex>
80101ec4:	66 90                	xchg   %ax,%ax
80101ec6:	66 90                	xchg   %ax,%ax
80101ec8:	66 90                	xchg   %ax,%ax
80101eca:	66 90                	xchg   %ax,%ax
80101ecc:	66 90                	xchg   %ax,%ax
80101ece:	66 90                	xchg   %ax,%ax

80101ed0 <idestart>:
80101ed0:	55                   	push   %ebp
80101ed1:	85 c0                	test   %eax,%eax
80101ed3:	89 e5                	mov    %esp,%ebp
80101ed5:	56                   	push   %esi
80101ed6:	53                   	push   %ebx
80101ed7:	0f 84 ad 00 00 00    	je     80101f8a <idestart+0xba>
80101edd:	8b 58 08             	mov    0x8(%eax),%ebx
80101ee0:	89 c1                	mov    %eax,%ecx
80101ee2:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101ee8:	0f 87 8f 00 00 00    	ja     80101f7d <idestart+0xad>
80101eee:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101ef3:	90                   	nop
80101ef4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ef8:	ec                   	in     (%dx),%al
80101ef9:	83 e0 c0             	and    $0xffffffc0,%eax
80101efc:	3c 40                	cmp    $0x40,%al
80101efe:	75 f8                	jne    80101ef8 <idestart+0x28>
80101f00:	31 f6                	xor    %esi,%esi
80101f02:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f07:	89 f0                	mov    %esi,%eax
80101f09:	ee                   	out    %al,(%dx)
80101f0a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f0f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f14:	ee                   	out    %al,(%dx)
80101f15:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f1a:	89 d8                	mov    %ebx,%eax
80101f1c:	ee                   	out    %al,(%dx)
80101f1d:	89 d8                	mov    %ebx,%eax
80101f1f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f24:	c1 f8 08             	sar    $0x8,%eax
80101f27:	ee                   	out    %al,(%dx)
80101f28:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f2d:	89 f0                	mov    %esi,%eax
80101f2f:	ee                   	out    %al,(%dx)
80101f30:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101f34:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101f39:	c1 e0 04             	shl    $0x4,%eax
80101f3c:	83 e0 10             	and    $0x10,%eax
80101f3f:	83 c8 e0             	or     $0xffffffe0,%eax
80101f42:	ee                   	out    %al,(%dx)
80101f43:	f6 01 04             	testb  $0x4,(%ecx)
80101f46:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f4b:	75 13                	jne    80101f60 <idestart+0x90>
80101f4d:	b8 20 00 00 00       	mov    $0x20,%eax
80101f52:	ee                   	out    %al,(%dx)
80101f53:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f56:	5b                   	pop    %ebx
80101f57:	5e                   	pop    %esi
80101f58:	5d                   	pop    %ebp
80101f59:	c3                   	ret    
80101f5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101f60:	b8 30 00 00 00       	mov    $0x30,%eax
80101f65:	ee                   	out    %al,(%dx)
80101f66:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101f6b:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101f6e:	b9 80 00 00 00       	mov    $0x80,%ecx
80101f73:	fc                   	cld    
80101f74:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80101f76:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f79:	5b                   	pop    %ebx
80101f7a:	5e                   	pop    %esi
80101f7b:	5d                   	pop    %ebp
80101f7c:	c3                   	ret    
80101f7d:	83 ec 0c             	sub    $0xc,%esp
80101f80:	68 20 71 10 80       	push   $0x80107120
80101f85:	e8 e6 e3 ff ff       	call   80100370 <panic>
80101f8a:	83 ec 0c             	sub    $0xc,%esp
80101f8d:	68 17 71 10 80       	push   $0x80107117
80101f92:	e8 d9 e3 ff ff       	call   80100370 <panic>
80101f97:	89 f6                	mov    %esi,%esi
80101f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101fa0 <ideinit>:
80101fa0:	55                   	push   %ebp
80101fa1:	89 e5                	mov    %esp,%ebp
80101fa3:	83 ec 10             	sub    $0x10,%esp
80101fa6:	68 32 71 10 80       	push   $0x80107132
80101fab:	68 80 a5 10 80       	push   $0x8010a580
80101fb0:	e8 ab 22 00 00       	call   80104260 <initlock>
80101fb5:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
80101fbc:	e8 df 12 00 00       	call   801032a0 <picenable>
80101fc1:	58                   	pop    %eax
80101fc2:	a1 80 2d 11 80       	mov    0x80112d80,%eax
80101fc7:	5a                   	pop    %edx
80101fc8:	83 e8 01             	sub    $0x1,%eax
80101fcb:	50                   	push   %eax
80101fcc:	6a 0e                	push   $0xe
80101fce:	e8 bd 02 00 00       	call   80102290 <ioapicenable>
80101fd3:	83 c4 10             	add    $0x10,%esp
80101fd6:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fdb:	90                   	nop
80101fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101fe0:	ec                   	in     (%dx),%al
80101fe1:	83 e0 c0             	and    $0xffffffc0,%eax
80101fe4:	3c 40                	cmp    $0x40,%al
80101fe6:	75 f8                	jne    80101fe0 <ideinit+0x40>
80101fe8:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101fed:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80101ff2:	ee                   	out    %al,(%dx)
80101ff3:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80101ff8:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101ffd:	eb 06                	jmp    80102005 <ideinit+0x65>
80101fff:	90                   	nop
80102000:	83 e9 01             	sub    $0x1,%ecx
80102003:	74 0f                	je     80102014 <ideinit+0x74>
80102005:	ec                   	in     (%dx),%al
80102006:	84 c0                	test   %al,%al
80102008:	74 f6                	je     80102000 <ideinit+0x60>
8010200a:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102011:	00 00 00 
80102014:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102019:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010201e:	ee                   	out    %al,(%dx)
8010201f:	c9                   	leave  
80102020:	c3                   	ret    
80102021:	eb 0d                	jmp    80102030 <ideintr>
80102023:	90                   	nop
80102024:	90                   	nop
80102025:	90                   	nop
80102026:	90                   	nop
80102027:	90                   	nop
80102028:	90                   	nop
80102029:	90                   	nop
8010202a:	90                   	nop
8010202b:	90                   	nop
8010202c:	90                   	nop
8010202d:	90                   	nop
8010202e:	90                   	nop
8010202f:	90                   	nop

80102030 <ideintr>:
80102030:	55                   	push   %ebp
80102031:	89 e5                	mov    %esp,%ebp
80102033:	57                   	push   %edi
80102034:	56                   	push   %esi
80102035:	53                   	push   %ebx
80102036:	83 ec 18             	sub    $0x18,%esp
80102039:	68 80 a5 10 80       	push   $0x8010a580
8010203e:	e8 3d 22 00 00       	call   80104280 <acquire>
80102043:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
80102049:	83 c4 10             	add    $0x10,%esp
8010204c:	85 db                	test   %ebx,%ebx
8010204e:	74 34                	je     80102084 <ideintr+0x54>
80102050:	8b 43 58             	mov    0x58(%ebx),%eax
80102053:	a3 64 a5 10 80       	mov    %eax,0x8010a564
80102058:	8b 33                	mov    (%ebx),%esi
8010205a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102060:	74 3e                	je     801020a0 <ideintr+0x70>
80102062:	83 e6 fb             	and    $0xfffffffb,%esi
80102065:	83 ec 0c             	sub    $0xc,%esp
80102068:	83 ce 02             	or     $0x2,%esi
8010206b:	89 33                	mov    %esi,(%ebx)
8010206d:	53                   	push   %ebx
8010206e:	e8 2d 1f 00 00       	call   80103fa0 <wakeup>
80102073:	a1 64 a5 10 80       	mov    0x8010a564,%eax
80102078:	83 c4 10             	add    $0x10,%esp
8010207b:	85 c0                	test   %eax,%eax
8010207d:	74 05                	je     80102084 <ideintr+0x54>
8010207f:	e8 4c fe ff ff       	call   80101ed0 <idestart>
80102084:	83 ec 0c             	sub    $0xc,%esp
80102087:	68 80 a5 10 80       	push   $0x8010a580
8010208c:	e8 cf 23 00 00       	call   80104460 <release>
80102091:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102094:	5b                   	pop    %ebx
80102095:	5e                   	pop    %esi
80102096:	5f                   	pop    %edi
80102097:	5d                   	pop    %ebp
80102098:	c3                   	ret    
80102099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801020a0:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020a5:	8d 76 00             	lea    0x0(%esi),%esi
801020a8:	ec                   	in     (%dx),%al
801020a9:	89 c1                	mov    %eax,%ecx
801020ab:	83 e1 c0             	and    $0xffffffc0,%ecx
801020ae:	80 f9 40             	cmp    $0x40,%cl
801020b1:	75 f5                	jne    801020a8 <ideintr+0x78>
801020b3:	a8 21                	test   $0x21,%al
801020b5:	75 ab                	jne    80102062 <ideintr+0x32>
801020b7:	8d 7b 5c             	lea    0x5c(%ebx),%edi
801020ba:	b9 80 00 00 00       	mov    $0x80,%ecx
801020bf:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020c4:	fc                   	cld    
801020c5:	f3 6d                	rep insl (%dx),%es:(%edi)
801020c7:	8b 33                	mov    (%ebx),%esi
801020c9:	eb 97                	jmp    80102062 <ideintr+0x32>
801020cb:	90                   	nop
801020cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801020d0 <iderw>:
801020d0:	55                   	push   %ebp
801020d1:	89 e5                	mov    %esp,%ebp
801020d3:	53                   	push   %ebx
801020d4:	83 ec 10             	sub    $0x10,%esp
801020d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801020da:	8d 43 0c             	lea    0xc(%ebx),%eax
801020dd:	50                   	push   %eax
801020de:	e8 4d 21 00 00       	call   80104230 <holdingsleep>
801020e3:	83 c4 10             	add    $0x10,%esp
801020e6:	85 c0                	test   %eax,%eax
801020e8:	0f 84 ad 00 00 00    	je     8010219b <iderw+0xcb>
801020ee:	8b 03                	mov    (%ebx),%eax
801020f0:	83 e0 06             	and    $0x6,%eax
801020f3:	83 f8 02             	cmp    $0x2,%eax
801020f6:	0f 84 b9 00 00 00    	je     801021b5 <iderw+0xe5>
801020fc:	8b 53 04             	mov    0x4(%ebx),%edx
801020ff:	85 d2                	test   %edx,%edx
80102101:	74 0d                	je     80102110 <iderw+0x40>
80102103:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102108:	85 c0                	test   %eax,%eax
8010210a:	0f 84 98 00 00 00    	je     801021a8 <iderw+0xd8>
80102110:	83 ec 0c             	sub    $0xc,%esp
80102113:	68 80 a5 10 80       	push   $0x8010a580
80102118:	e8 63 21 00 00       	call   80104280 <acquire>
8010211d:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
80102123:	83 c4 10             	add    $0x10,%esp
80102126:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
8010212d:	85 d2                	test   %edx,%edx
8010212f:	75 09                	jne    8010213a <iderw+0x6a>
80102131:	eb 58                	jmp    8010218b <iderw+0xbb>
80102133:	90                   	nop
80102134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102138:	89 c2                	mov    %eax,%edx
8010213a:	8b 42 58             	mov    0x58(%edx),%eax
8010213d:	85 c0                	test   %eax,%eax
8010213f:	75 f7                	jne    80102138 <iderw+0x68>
80102141:	83 c2 58             	add    $0x58,%edx
80102144:	89 1a                	mov    %ebx,(%edx)
80102146:	3b 1d 64 a5 10 80    	cmp    0x8010a564,%ebx
8010214c:	74 44                	je     80102192 <iderw+0xc2>
8010214e:	8b 03                	mov    (%ebx),%eax
80102150:	83 e0 06             	and    $0x6,%eax
80102153:	83 f8 02             	cmp    $0x2,%eax
80102156:	74 23                	je     8010217b <iderw+0xab>
80102158:	90                   	nop
80102159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102160:	83 ec 08             	sub    $0x8,%esp
80102163:	68 80 a5 10 80       	push   $0x8010a580
80102168:	53                   	push   %ebx
80102169:	e8 82 1c 00 00       	call   80103df0 <sleep>
8010216e:	8b 03                	mov    (%ebx),%eax
80102170:	83 c4 10             	add    $0x10,%esp
80102173:	83 e0 06             	and    $0x6,%eax
80102176:	83 f8 02             	cmp    $0x2,%eax
80102179:	75 e5                	jne    80102160 <iderw+0x90>
8010217b:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
80102182:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102185:	c9                   	leave  
80102186:	e9 d5 22 00 00       	jmp    80104460 <release>
8010218b:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
80102190:	eb b2                	jmp    80102144 <iderw+0x74>
80102192:	89 d8                	mov    %ebx,%eax
80102194:	e8 37 fd ff ff       	call   80101ed0 <idestart>
80102199:	eb b3                	jmp    8010214e <iderw+0x7e>
8010219b:	83 ec 0c             	sub    $0xc,%esp
8010219e:	68 36 71 10 80       	push   $0x80107136
801021a3:	e8 c8 e1 ff ff       	call   80100370 <panic>
801021a8:	83 ec 0c             	sub    $0xc,%esp
801021ab:	68 61 71 10 80       	push   $0x80107161
801021b0:	e8 bb e1 ff ff       	call   80100370 <panic>
801021b5:	83 ec 0c             	sub    $0xc,%esp
801021b8:	68 4c 71 10 80       	push   $0x8010714c
801021bd:	e8 ae e1 ff ff       	call   80100370 <panic>
801021c2:	66 90                	xchg   %ax,%ax
801021c4:	66 90                	xchg   %ax,%ax
801021c6:	66 90                	xchg   %ax,%ax
801021c8:	66 90                	xchg   %ax,%ax
801021ca:	66 90                	xchg   %ax,%ax
801021cc:	66 90                	xchg   %ax,%ax
801021ce:	66 90                	xchg   %ax,%ax

801021d0 <ioapicinit>:
801021d0:	a1 84 27 11 80       	mov    0x80112784,%eax
801021d5:	85 c0                	test   %eax,%eax
801021d7:	0f 84 a8 00 00 00    	je     80102285 <ioapicinit+0xb5>
801021dd:	55                   	push   %ebp
801021de:	c7 05 54 26 11 80 00 	movl   $0xfec00000,0x80112654
801021e5:	00 c0 fe 
801021e8:	89 e5                	mov    %esp,%ebp
801021ea:	56                   	push   %esi
801021eb:	53                   	push   %ebx
801021ec:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
801021f3:	00 00 00 
801021f6:	8b 15 54 26 11 80    	mov    0x80112654,%edx
801021fc:	8b 72 10             	mov    0x10(%edx),%esi
801021ff:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
80102205:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
8010220b:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx
80102212:	c1 ee 10             	shr    $0x10,%esi
80102215:	89 f0                	mov    %esi,%eax
80102217:	0f b6 f0             	movzbl %al,%esi
8010221a:	8b 41 10             	mov    0x10(%ecx),%eax
8010221d:	c1 e8 18             	shr    $0x18,%eax
80102220:	39 d0                	cmp    %edx,%eax
80102222:	74 16                	je     8010223a <ioapicinit+0x6a>
80102224:	83 ec 0c             	sub    $0xc,%esp
80102227:	68 80 71 10 80       	push   $0x80107180
8010222c:	e8 2f e4 ff ff       	call   80100660 <cprintf>
80102231:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102237:	83 c4 10             	add    $0x10,%esp
8010223a:	83 c6 21             	add    $0x21,%esi
8010223d:	ba 10 00 00 00       	mov    $0x10,%edx
80102242:	b8 20 00 00 00       	mov    $0x20,%eax
80102247:	89 f6                	mov    %esi,%esi
80102249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102250:	89 11                	mov    %edx,(%ecx)
80102252:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102258:	89 c3                	mov    %eax,%ebx
8010225a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102260:	83 c0 01             	add    $0x1,%eax
80102263:	89 59 10             	mov    %ebx,0x10(%ecx)
80102266:	8d 5a 01             	lea    0x1(%edx),%ebx
80102269:	83 c2 02             	add    $0x2,%edx
8010226c:	39 f0                	cmp    %esi,%eax
8010226e:	89 19                	mov    %ebx,(%ecx)
80102270:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102276:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
8010227d:	75 d1                	jne    80102250 <ioapicinit+0x80>
8010227f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102282:	5b                   	pop    %ebx
80102283:	5e                   	pop    %esi
80102284:	5d                   	pop    %ebp
80102285:	f3 c3                	repz ret 
80102287:	89 f6                	mov    %esi,%esi
80102289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102290 <ioapicenable>:
80102290:	8b 15 84 27 11 80    	mov    0x80112784,%edx
80102296:	55                   	push   %ebp
80102297:	89 e5                	mov    %esp,%ebp
80102299:	85 d2                	test   %edx,%edx
8010229b:	8b 45 08             	mov    0x8(%ebp),%eax
8010229e:	74 2b                	je     801022cb <ioapicenable+0x3b>
801022a0:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
801022a6:	8d 50 20             	lea    0x20(%eax),%edx
801022a9:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
801022ad:	89 01                	mov    %eax,(%ecx)
801022af:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
801022b5:	83 c0 01             	add    $0x1,%eax
801022b8:	89 51 10             	mov    %edx,0x10(%ecx)
801022bb:	8b 55 0c             	mov    0xc(%ebp),%edx
801022be:	89 01                	mov    %eax,(%ecx)
801022c0:	a1 54 26 11 80       	mov    0x80112654,%eax
801022c5:	c1 e2 18             	shl    $0x18,%edx
801022c8:	89 50 10             	mov    %edx,0x10(%eax)
801022cb:	5d                   	pop    %ebp
801022cc:	c3                   	ret    
801022cd:	66 90                	xchg   %ax,%ax
801022cf:	90                   	nop

801022d0 <kfree>:
801022d0:	55                   	push   %ebp
801022d1:	89 e5                	mov    %esp,%ebp
801022d3:	53                   	push   %ebx
801022d4:	83 ec 04             	sub    $0x4,%esp
801022d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801022da:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801022e0:	75 70                	jne    80102352 <kfree+0x82>
801022e2:	81 fb 28 55 11 80    	cmp    $0x80115528,%ebx
801022e8:	72 68                	jb     80102352 <kfree+0x82>
801022ea:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801022f0:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801022f5:	77 5b                	ja     80102352 <kfree+0x82>
801022f7:	83 ec 04             	sub    $0x4,%esp
801022fa:	68 00 10 00 00       	push   $0x1000
801022ff:	6a 01                	push   $0x1
80102301:	53                   	push   %ebx
80102302:	e8 a9 21 00 00       	call   801044b0 <memset>
80102307:	8b 15 94 26 11 80    	mov    0x80112694,%edx
8010230d:	83 c4 10             	add    $0x10,%esp
80102310:	85 d2                	test   %edx,%edx
80102312:	75 2c                	jne    80102340 <kfree+0x70>
80102314:	a1 98 26 11 80       	mov    0x80112698,%eax
80102319:	89 03                	mov    %eax,(%ebx)
8010231b:	a1 94 26 11 80       	mov    0x80112694,%eax
80102320:	89 1d 98 26 11 80    	mov    %ebx,0x80112698
80102326:	85 c0                	test   %eax,%eax
80102328:	75 06                	jne    80102330 <kfree+0x60>
8010232a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010232d:	c9                   	leave  
8010232e:	c3                   	ret    
8010232f:	90                   	nop
80102330:	c7 45 08 60 26 11 80 	movl   $0x80112660,0x8(%ebp)
80102337:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010233a:	c9                   	leave  
8010233b:	e9 20 21 00 00       	jmp    80104460 <release>
80102340:	83 ec 0c             	sub    $0xc,%esp
80102343:	68 60 26 11 80       	push   $0x80112660
80102348:	e8 33 1f 00 00       	call   80104280 <acquire>
8010234d:	83 c4 10             	add    $0x10,%esp
80102350:	eb c2                	jmp    80102314 <kfree+0x44>
80102352:	83 ec 0c             	sub    $0xc,%esp
80102355:	68 b2 71 10 80       	push   $0x801071b2
8010235a:	e8 11 e0 ff ff       	call   80100370 <panic>
8010235f:	90                   	nop

80102360 <freerange>:
80102360:	55                   	push   %ebp
80102361:	89 e5                	mov    %esp,%ebp
80102363:	56                   	push   %esi
80102364:	53                   	push   %ebx
80102365:	8b 45 08             	mov    0x8(%ebp),%eax
80102368:	8b 75 0c             	mov    0xc(%ebp),%esi
8010236b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102371:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102377:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010237d:	39 de                	cmp    %ebx,%esi
8010237f:	72 23                	jb     801023a4 <freerange+0x44>
80102381:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102388:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010238e:	83 ec 0c             	sub    $0xc,%esp
80102391:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102397:	50                   	push   %eax
80102398:	e8 33 ff ff ff       	call   801022d0 <kfree>
8010239d:	83 c4 10             	add    $0x10,%esp
801023a0:	39 f3                	cmp    %esi,%ebx
801023a2:	76 e4                	jbe    80102388 <freerange+0x28>
801023a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023a7:	5b                   	pop    %ebx
801023a8:	5e                   	pop    %esi
801023a9:	5d                   	pop    %ebp
801023aa:	c3                   	ret    
801023ab:	90                   	nop
801023ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801023b0 <kinit1>:
801023b0:	55                   	push   %ebp
801023b1:	89 e5                	mov    %esp,%ebp
801023b3:	56                   	push   %esi
801023b4:	53                   	push   %ebx
801023b5:	8b 75 0c             	mov    0xc(%ebp),%esi
801023b8:	83 ec 08             	sub    $0x8,%esp
801023bb:	68 b8 71 10 80       	push   $0x801071b8
801023c0:	68 60 26 11 80       	push   $0x80112660
801023c5:	e8 96 1e 00 00       	call   80104260 <initlock>
801023ca:	8b 45 08             	mov    0x8(%ebp),%eax
801023cd:	83 c4 10             	add    $0x10,%esp
801023d0:	c7 05 94 26 11 80 00 	movl   $0x0,0x80112694
801023d7:	00 00 00 
801023da:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023e0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801023e6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023ec:	39 de                	cmp    %ebx,%esi
801023ee:	72 1c                	jb     8010240c <kinit1+0x5c>
801023f0:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801023f6:	83 ec 0c             	sub    $0xc,%esp
801023f9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023ff:	50                   	push   %eax
80102400:	e8 cb fe ff ff       	call   801022d0 <kfree>
80102405:	83 c4 10             	add    $0x10,%esp
80102408:	39 de                	cmp    %ebx,%esi
8010240a:	73 e4                	jae    801023f0 <kinit1+0x40>
8010240c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010240f:	5b                   	pop    %ebx
80102410:	5e                   	pop    %esi
80102411:	5d                   	pop    %ebp
80102412:	c3                   	ret    
80102413:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102420 <kinit2>:
80102420:	55                   	push   %ebp
80102421:	89 e5                	mov    %esp,%ebp
80102423:	56                   	push   %esi
80102424:	53                   	push   %ebx
80102425:	8b 45 08             	mov    0x8(%ebp),%eax
80102428:	8b 75 0c             	mov    0xc(%ebp),%esi
8010242b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102431:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102437:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010243d:	39 de                	cmp    %ebx,%esi
8010243f:	72 23                	jb     80102464 <kinit2+0x44>
80102441:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102448:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010244e:	83 ec 0c             	sub    $0xc,%esp
80102451:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102457:	50                   	push   %eax
80102458:	e8 73 fe ff ff       	call   801022d0 <kfree>
8010245d:	83 c4 10             	add    $0x10,%esp
80102460:	39 de                	cmp    %ebx,%esi
80102462:	73 e4                	jae    80102448 <kinit2+0x28>
80102464:	c7 05 94 26 11 80 01 	movl   $0x1,0x80112694
8010246b:	00 00 00 
8010246e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102471:	5b                   	pop    %ebx
80102472:	5e                   	pop    %esi
80102473:	5d                   	pop    %ebp
80102474:	c3                   	ret    
80102475:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102480 <kalloc>:
80102480:	55                   	push   %ebp
80102481:	89 e5                	mov    %esp,%ebp
80102483:	53                   	push   %ebx
80102484:	83 ec 04             	sub    $0x4,%esp
80102487:	a1 94 26 11 80       	mov    0x80112694,%eax
8010248c:	85 c0                	test   %eax,%eax
8010248e:	75 30                	jne    801024c0 <kalloc+0x40>
80102490:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
80102496:	85 db                	test   %ebx,%ebx
80102498:	74 1c                	je     801024b6 <kalloc+0x36>
8010249a:	8b 13                	mov    (%ebx),%edx
8010249c:	89 15 98 26 11 80    	mov    %edx,0x80112698
801024a2:	85 c0                	test   %eax,%eax
801024a4:	74 10                	je     801024b6 <kalloc+0x36>
801024a6:	83 ec 0c             	sub    $0xc,%esp
801024a9:	68 60 26 11 80       	push   $0x80112660
801024ae:	e8 ad 1f 00 00       	call   80104460 <release>
801024b3:	83 c4 10             	add    $0x10,%esp
801024b6:	89 d8                	mov    %ebx,%eax
801024b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024bb:	c9                   	leave  
801024bc:	c3                   	ret    
801024bd:	8d 76 00             	lea    0x0(%esi),%esi
801024c0:	83 ec 0c             	sub    $0xc,%esp
801024c3:	68 60 26 11 80       	push   $0x80112660
801024c8:	e8 b3 1d 00 00       	call   80104280 <acquire>
801024cd:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
801024d3:	83 c4 10             	add    $0x10,%esp
801024d6:	a1 94 26 11 80       	mov    0x80112694,%eax
801024db:	85 db                	test   %ebx,%ebx
801024dd:	75 bb                	jne    8010249a <kalloc+0x1a>
801024df:	eb c1                	jmp    801024a2 <kalloc+0x22>
801024e1:	66 90                	xchg   %ax,%ax
801024e3:	66 90                	xchg   %ax,%ax
801024e5:	66 90                	xchg   %ax,%ax
801024e7:	66 90                	xchg   %ax,%ax
801024e9:	66 90                	xchg   %ax,%ax
801024eb:	66 90                	xchg   %ax,%ax
801024ed:	66 90                	xchg   %ax,%ax
801024ef:	90                   	nop

801024f0 <kbdgetc>:
801024f0:	ba 64 00 00 00       	mov    $0x64,%edx
801024f5:	ec                   	in     (%dx),%al
801024f6:	a8 01                	test   $0x1,%al
801024f8:	0f 84 c2 00 00 00    	je     801025c0 <kbdgetc+0xd0>
801024fe:	ba 60 00 00 00       	mov    $0x60,%edx
80102503:	ec                   	in     (%dx),%al
80102504:	0f b6 d0             	movzbl %al,%edx
80102507:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
8010250d:	0f 84 9d 00 00 00    	je     801025b0 <kbdgetc+0xc0>
80102513:	84 c0                	test   %al,%al
80102515:	78 59                	js     80102570 <kbdgetc+0x80>
80102517:	55                   	push   %ebp
80102518:	89 e5                	mov    %esp,%ebp
8010251a:	53                   	push   %ebx
8010251b:	8b 1d b4 a5 10 80    	mov    0x8010a5b4,%ebx
80102521:	f6 c3 40             	test   $0x40,%bl
80102524:	74 09                	je     8010252f <kbdgetc+0x3f>
80102526:	83 c8 80             	or     $0xffffff80,%eax
80102529:	83 e3 bf             	and    $0xffffffbf,%ebx
8010252c:	0f b6 d0             	movzbl %al,%edx
8010252f:	0f b6 8a e0 72 10 80 	movzbl -0x7fef8d20(%edx),%ecx
80102536:	0f b6 82 e0 71 10 80 	movzbl -0x7fef8e20(%edx),%eax
8010253d:	09 d9                	or     %ebx,%ecx
8010253f:	31 c1                	xor    %eax,%ecx
80102541:	89 c8                	mov    %ecx,%eax
80102543:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
80102549:	83 e0 03             	and    $0x3,%eax
8010254c:	83 e1 08             	and    $0x8,%ecx
8010254f:	8b 04 85 c0 71 10 80 	mov    -0x7fef8e40(,%eax,4),%eax
80102556:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
8010255a:	74 0b                	je     80102567 <kbdgetc+0x77>
8010255c:	8d 50 9f             	lea    -0x61(%eax),%edx
8010255f:	83 fa 19             	cmp    $0x19,%edx
80102562:	77 3c                	ja     801025a0 <kbdgetc+0xb0>
80102564:	83 e8 20             	sub    $0x20,%eax
80102567:	5b                   	pop    %ebx
80102568:	5d                   	pop    %ebp
80102569:	c3                   	ret    
8010256a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102570:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
80102576:	83 e0 7f             	and    $0x7f,%eax
80102579:	f6 c1 40             	test   $0x40,%cl
8010257c:	0f 44 d0             	cmove  %eax,%edx
8010257f:	0f b6 82 e0 72 10 80 	movzbl -0x7fef8d20(%edx),%eax
80102586:	83 c8 40             	or     $0x40,%eax
80102589:	0f b6 c0             	movzbl %al,%eax
8010258c:	f7 d0                	not    %eax
8010258e:	21 c8                	and    %ecx,%eax
80102590:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
80102595:	31 c0                	xor    %eax,%eax
80102597:	c3                   	ret    
80102598:	90                   	nop
80102599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801025a0:	8d 48 bf             	lea    -0x41(%eax),%ecx
801025a3:	8d 50 20             	lea    0x20(%eax),%edx
801025a6:	5b                   	pop    %ebx
801025a7:	83 f9 19             	cmp    $0x19,%ecx
801025aa:	0f 46 c2             	cmovbe %edx,%eax
801025ad:	5d                   	pop    %ebp
801025ae:	c3                   	ret    
801025af:	90                   	nop
801025b0:	83 0d b4 a5 10 80 40 	orl    $0x40,0x8010a5b4
801025b7:	31 c0                	xor    %eax,%eax
801025b9:	c3                   	ret    
801025ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801025c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801025c5:	c3                   	ret    
801025c6:	8d 76 00             	lea    0x0(%esi),%esi
801025c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025d0 <kbdintr>:
801025d0:	55                   	push   %ebp
801025d1:	89 e5                	mov    %esp,%ebp
801025d3:	83 ec 14             	sub    $0x14,%esp
801025d6:	68 f0 24 10 80       	push   $0x801024f0
801025db:	e8 00 e2 ff ff       	call   801007e0 <consoleintr>
801025e0:	83 c4 10             	add    $0x10,%esp
801025e3:	c9                   	leave  
801025e4:	c3                   	ret    
801025e5:	66 90                	xchg   %ax,%ax
801025e7:	66 90                	xchg   %ax,%ax
801025e9:	66 90                	xchg   %ax,%ax
801025eb:	66 90                	xchg   %ax,%ax
801025ed:	66 90                	xchg   %ax,%ax
801025ef:	90                   	nop

801025f0 <lapicinit>:
801025f0:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801025f5:	55                   	push   %ebp
801025f6:	89 e5                	mov    %esp,%ebp
801025f8:	85 c0                	test   %eax,%eax
801025fa:	0f 84 c8 00 00 00    	je     801026c8 <lapicinit+0xd8>
80102600:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102607:	01 00 00 
8010260a:	8b 50 20             	mov    0x20(%eax),%edx
8010260d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102614:	00 00 00 
80102617:	8b 50 20             	mov    0x20(%eax),%edx
8010261a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102621:	00 02 00 
80102624:	8b 50 20             	mov    0x20(%eax),%edx
80102627:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010262e:	96 98 00 
80102631:	8b 50 20             	mov    0x20(%eax),%edx
80102634:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010263b:	00 01 00 
8010263e:	8b 50 20             	mov    0x20(%eax),%edx
80102641:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102648:	00 01 00 
8010264b:	8b 50 20             	mov    0x20(%eax),%edx
8010264e:	8b 50 30             	mov    0x30(%eax),%edx
80102651:	c1 ea 10             	shr    $0x10,%edx
80102654:	80 fa 03             	cmp    $0x3,%dl
80102657:	77 77                	ja     801026d0 <lapicinit+0xe0>
80102659:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102660:	00 00 00 
80102663:	8b 50 20             	mov    0x20(%eax),%edx
80102666:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010266d:	00 00 00 
80102670:	8b 50 20             	mov    0x20(%eax),%edx
80102673:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010267a:	00 00 00 
8010267d:	8b 50 20             	mov    0x20(%eax),%edx
80102680:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102687:	00 00 00 
8010268a:	8b 50 20             	mov    0x20(%eax),%edx
8010268d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102694:	00 00 00 
80102697:	8b 50 20             	mov    0x20(%eax),%edx
8010269a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801026a1:	85 08 00 
801026a4:	8b 50 20             	mov    0x20(%eax),%edx
801026a7:	89 f6                	mov    %esi,%esi
801026a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801026b0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801026b6:	80 e6 10             	and    $0x10,%dh
801026b9:	75 f5                	jne    801026b0 <lapicinit+0xc0>
801026bb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801026c2:	00 00 00 
801026c5:	8b 40 20             	mov    0x20(%eax),%eax
801026c8:	5d                   	pop    %ebp
801026c9:	c3                   	ret    
801026ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801026d0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801026d7:	00 01 00 
801026da:	8b 50 20             	mov    0x20(%eax),%edx
801026dd:	e9 77 ff ff ff       	jmp    80102659 <lapicinit+0x69>
801026e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801026e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801026f0 <cpunum>:
801026f0:	55                   	push   %ebp
801026f1:	89 e5                	mov    %esp,%ebp
801026f3:	56                   	push   %esi
801026f4:	53                   	push   %ebx
801026f5:	9c                   	pushf  
801026f6:	58                   	pop    %eax
801026f7:	f6 c4 02             	test   $0x2,%ah
801026fa:	74 12                	je     8010270e <cpunum+0x1e>
801026fc:	a1 b8 a5 10 80       	mov    0x8010a5b8,%eax
80102701:	8d 50 01             	lea    0x1(%eax),%edx
80102704:	85 c0                	test   %eax,%eax
80102706:	89 15 b8 a5 10 80    	mov    %edx,0x8010a5b8
8010270c:	74 4d                	je     8010275b <cpunum+0x6b>
8010270e:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102713:	85 c0                	test   %eax,%eax
80102715:	74 60                	je     80102777 <cpunum+0x87>
80102717:	8b 58 20             	mov    0x20(%eax),%ebx
8010271a:	8b 35 80 2d 11 80    	mov    0x80112d80,%esi
80102720:	c1 eb 18             	shr    $0x18,%ebx
80102723:	85 f6                	test   %esi,%esi
80102725:	7e 59                	jle    80102780 <cpunum+0x90>
80102727:	0f b6 05 a0 27 11 80 	movzbl 0x801127a0,%eax
8010272e:	39 c3                	cmp    %eax,%ebx
80102730:	74 45                	je     80102777 <cpunum+0x87>
80102732:	ba 5c 28 11 80       	mov    $0x8011285c,%edx
80102737:	31 c0                	xor    %eax,%eax
80102739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102740:	83 c0 01             	add    $0x1,%eax
80102743:	39 f0                	cmp    %esi,%eax
80102745:	74 39                	je     80102780 <cpunum+0x90>
80102747:	0f b6 0a             	movzbl (%edx),%ecx
8010274a:	81 c2 bc 00 00 00    	add    $0xbc,%edx
80102750:	39 cb                	cmp    %ecx,%ebx
80102752:	75 ec                	jne    80102740 <cpunum+0x50>
80102754:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102757:	5b                   	pop    %ebx
80102758:	5e                   	pop    %esi
80102759:	5d                   	pop    %ebp
8010275a:	c3                   	ret    
8010275b:	83 ec 08             	sub    $0x8,%esp
8010275e:	ff 75 04             	pushl  0x4(%ebp)
80102761:	68 e0 73 10 80       	push   $0x801073e0
80102766:	e8 f5 de ff ff       	call   80100660 <cprintf>
8010276b:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102770:	83 c4 10             	add    $0x10,%esp
80102773:	85 c0                	test   %eax,%eax
80102775:	75 a0                	jne    80102717 <cpunum+0x27>
80102777:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010277a:	31 c0                	xor    %eax,%eax
8010277c:	5b                   	pop    %ebx
8010277d:	5e                   	pop    %esi
8010277e:	5d                   	pop    %ebp
8010277f:	c3                   	ret    
80102780:	83 ec 0c             	sub    $0xc,%esp
80102783:	68 0c 74 10 80       	push   $0x8010740c
80102788:	e8 e3 db ff ff       	call   80100370 <panic>
8010278d:	8d 76 00             	lea    0x0(%esi),%esi

80102790 <lapiceoi>:
80102790:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102795:	55                   	push   %ebp
80102796:	89 e5                	mov    %esp,%ebp
80102798:	85 c0                	test   %eax,%eax
8010279a:	74 0d                	je     801027a9 <lapiceoi+0x19>
8010279c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801027a3:	00 00 00 
801027a6:	8b 40 20             	mov    0x20(%eax),%eax
801027a9:	5d                   	pop    %ebp
801027aa:	c3                   	ret    
801027ab:	90                   	nop
801027ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801027b0 <microdelay>:
801027b0:	55                   	push   %ebp
801027b1:	89 e5                	mov    %esp,%ebp
801027b3:	5d                   	pop    %ebp
801027b4:	c3                   	ret    
801027b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801027b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801027c0 <lapicstartap>:
801027c0:	55                   	push   %ebp
801027c1:	ba 70 00 00 00       	mov    $0x70,%edx
801027c6:	b8 0f 00 00 00       	mov    $0xf,%eax
801027cb:	89 e5                	mov    %esp,%ebp
801027cd:	53                   	push   %ebx
801027ce:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801027d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801027d4:	ee                   	out    %al,(%dx)
801027d5:	ba 71 00 00 00       	mov    $0x71,%edx
801027da:	b8 0a 00 00 00       	mov    $0xa,%eax
801027df:	ee                   	out    %al,(%dx)
801027e0:	31 c0                	xor    %eax,%eax
801027e2:	c1 e3 18             	shl    $0x18,%ebx
801027e5:	66 a3 67 04 00 80    	mov    %ax,0x80000467
801027eb:	89 c8                	mov    %ecx,%eax
801027ed:	c1 e9 0c             	shr    $0xc,%ecx
801027f0:	c1 e8 04             	shr    $0x4,%eax
801027f3:	89 da                	mov    %ebx,%edx
801027f5:	80 cd 06             	or     $0x6,%ch
801027f8:	66 a3 69 04 00 80    	mov    %ax,0x80000469
801027fe:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102803:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
80102809:	8b 58 20             	mov    0x20(%eax),%ebx
8010280c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102813:	c5 00 00 
80102816:	8b 58 20             	mov    0x20(%eax),%ebx
80102819:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102820:	85 00 00 
80102823:	8b 58 20             	mov    0x20(%eax),%ebx
80102826:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010282c:	8b 58 20             	mov    0x20(%eax),%ebx
8010282f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80102835:	8b 58 20             	mov    0x20(%eax),%ebx
80102838:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010283e:	8b 50 20             	mov    0x20(%eax),%edx
80102841:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80102847:	8b 40 20             	mov    0x20(%eax),%eax
8010284a:	5b                   	pop    %ebx
8010284b:	5d                   	pop    %ebp
8010284c:	c3                   	ret    
8010284d:	8d 76 00             	lea    0x0(%esi),%esi

80102850 <cmostime>:
80102850:	55                   	push   %ebp
80102851:	ba 70 00 00 00       	mov    $0x70,%edx
80102856:	b8 0b 00 00 00       	mov    $0xb,%eax
8010285b:	89 e5                	mov    %esp,%ebp
8010285d:	57                   	push   %edi
8010285e:	56                   	push   %esi
8010285f:	53                   	push   %ebx
80102860:	83 ec 5c             	sub    $0x5c,%esp
80102863:	ee                   	out    %al,(%dx)
80102864:	ba 71 00 00 00       	mov    $0x71,%edx
80102869:	ec                   	in     (%dx),%al
8010286a:	83 e0 04             	and    $0x4,%eax
8010286d:	bb 70 00 00 00       	mov    $0x70,%ebx
80102872:	88 45 a7             	mov    %al,-0x59(%ebp)
80102875:	8d 76 00             	lea    0x0(%esi),%esi
80102878:	31 c0                	xor    %eax,%eax
8010287a:	89 da                	mov    %ebx,%edx
8010287c:	ee                   	out    %al,(%dx)
8010287d:	b9 71 00 00 00       	mov    $0x71,%ecx
80102882:	89 ca                	mov    %ecx,%edx
80102884:	ec                   	in     (%dx),%al
80102885:	0f b6 c0             	movzbl %al,%eax
80102888:	89 da                	mov    %ebx,%edx
8010288a:	89 45 b4             	mov    %eax,-0x4c(%ebp)
8010288d:	b8 02 00 00 00       	mov    $0x2,%eax
80102892:	ee                   	out    %al,(%dx)
80102893:	89 ca                	mov    %ecx,%edx
80102895:	ec                   	in     (%dx),%al
80102896:	0f b6 f0             	movzbl %al,%esi
80102899:	89 da                	mov    %ebx,%edx
8010289b:	b8 04 00 00 00       	mov    $0x4,%eax
801028a0:	89 75 b0             	mov    %esi,-0x50(%ebp)
801028a3:	ee                   	out    %al,(%dx)
801028a4:	89 ca                	mov    %ecx,%edx
801028a6:	ec                   	in     (%dx),%al
801028a7:	0f b6 f8             	movzbl %al,%edi
801028aa:	89 da                	mov    %ebx,%edx
801028ac:	b8 07 00 00 00       	mov    $0x7,%eax
801028b1:	89 7d ac             	mov    %edi,-0x54(%ebp)
801028b4:	ee                   	out    %al,(%dx)
801028b5:	89 ca                	mov    %ecx,%edx
801028b7:	ec                   	in     (%dx),%al
801028b8:	0f b6 d0             	movzbl %al,%edx
801028bb:	b8 08 00 00 00       	mov    $0x8,%eax
801028c0:	89 55 a8             	mov    %edx,-0x58(%ebp)
801028c3:	89 da                	mov    %ebx,%edx
801028c5:	ee                   	out    %al,(%dx)
801028c6:	89 ca                	mov    %ecx,%edx
801028c8:	ec                   	in     (%dx),%al
801028c9:	0f b6 f8             	movzbl %al,%edi
801028cc:	89 da                	mov    %ebx,%edx
801028ce:	b8 09 00 00 00       	mov    $0x9,%eax
801028d3:	ee                   	out    %al,(%dx)
801028d4:	89 ca                	mov    %ecx,%edx
801028d6:	ec                   	in     (%dx),%al
801028d7:	0f b6 f0             	movzbl %al,%esi
801028da:	89 da                	mov    %ebx,%edx
801028dc:	b8 0a 00 00 00       	mov    $0xa,%eax
801028e1:	ee                   	out    %al,(%dx)
801028e2:	89 ca                	mov    %ecx,%edx
801028e4:	ec                   	in     (%dx),%al
801028e5:	84 c0                	test   %al,%al
801028e7:	78 8f                	js     80102878 <cmostime+0x28>
801028e9:	8b 45 b4             	mov    -0x4c(%ebp),%eax
801028ec:	8b 55 a8             	mov    -0x58(%ebp),%edx
801028ef:	89 7d c8             	mov    %edi,-0x38(%ebp)
801028f2:	89 75 cc             	mov    %esi,-0x34(%ebp)
801028f5:	89 45 b8             	mov    %eax,-0x48(%ebp)
801028f8:	8b 45 b0             	mov    -0x50(%ebp),%eax
801028fb:	89 55 c4             	mov    %edx,-0x3c(%ebp)
801028fe:	89 da                	mov    %ebx,%edx
80102900:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102903:	8b 45 ac             	mov    -0x54(%ebp),%eax
80102906:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102909:	31 c0                	xor    %eax,%eax
8010290b:	ee                   	out    %al,(%dx)
8010290c:	89 ca                	mov    %ecx,%edx
8010290e:	ec                   	in     (%dx),%al
8010290f:	0f b6 c0             	movzbl %al,%eax
80102912:	89 da                	mov    %ebx,%edx
80102914:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102917:	b8 02 00 00 00       	mov    $0x2,%eax
8010291c:	ee                   	out    %al,(%dx)
8010291d:	89 ca                	mov    %ecx,%edx
8010291f:	ec                   	in     (%dx),%al
80102920:	0f b6 c0             	movzbl %al,%eax
80102923:	89 da                	mov    %ebx,%edx
80102925:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102928:	b8 04 00 00 00       	mov    $0x4,%eax
8010292d:	ee                   	out    %al,(%dx)
8010292e:	89 ca                	mov    %ecx,%edx
80102930:	ec                   	in     (%dx),%al
80102931:	0f b6 c0             	movzbl %al,%eax
80102934:	89 da                	mov    %ebx,%edx
80102936:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102939:	b8 07 00 00 00       	mov    $0x7,%eax
8010293e:	ee                   	out    %al,(%dx)
8010293f:	89 ca                	mov    %ecx,%edx
80102941:	ec                   	in     (%dx),%al
80102942:	0f b6 c0             	movzbl %al,%eax
80102945:	89 da                	mov    %ebx,%edx
80102947:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010294a:	b8 08 00 00 00       	mov    $0x8,%eax
8010294f:	ee                   	out    %al,(%dx)
80102950:	89 ca                	mov    %ecx,%edx
80102952:	ec                   	in     (%dx),%al
80102953:	0f b6 c0             	movzbl %al,%eax
80102956:	89 da                	mov    %ebx,%edx
80102958:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010295b:	b8 09 00 00 00       	mov    $0x9,%eax
80102960:	ee                   	out    %al,(%dx)
80102961:	89 ca                	mov    %ecx,%edx
80102963:	ec                   	in     (%dx),%al
80102964:	0f b6 c0             	movzbl %al,%eax
80102967:	83 ec 04             	sub    $0x4,%esp
8010296a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010296d:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102970:	6a 18                	push   $0x18
80102972:	50                   	push   %eax
80102973:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102976:	50                   	push   %eax
80102977:	e8 84 1b 00 00       	call   80104500 <memcmp>
8010297c:	83 c4 10             	add    $0x10,%esp
8010297f:	85 c0                	test   %eax,%eax
80102981:	0f 85 f1 fe ff ff    	jne    80102878 <cmostime+0x28>
80102987:	80 7d a7 00          	cmpb   $0x0,-0x59(%ebp)
8010298b:	75 78                	jne    80102a05 <cmostime+0x1b5>
8010298d:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102990:	89 c2                	mov    %eax,%edx
80102992:	83 e0 0f             	and    $0xf,%eax
80102995:	c1 ea 04             	shr    $0x4,%edx
80102998:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010299b:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010299e:	89 45 b8             	mov    %eax,-0x48(%ebp)
801029a1:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029a4:	89 c2                	mov    %eax,%edx
801029a6:	83 e0 0f             	and    $0xf,%eax
801029a9:	c1 ea 04             	shr    $0x4,%edx
801029ac:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029af:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029b2:	89 45 bc             	mov    %eax,-0x44(%ebp)
801029b5:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029b8:	89 c2                	mov    %eax,%edx
801029ba:	83 e0 0f             	and    $0xf,%eax
801029bd:	c1 ea 04             	shr    $0x4,%edx
801029c0:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029c3:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029c6:	89 45 c0             	mov    %eax,-0x40(%ebp)
801029c9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029cc:	89 c2                	mov    %eax,%edx
801029ce:	83 e0 0f             	and    $0xf,%eax
801029d1:	c1 ea 04             	shr    $0x4,%edx
801029d4:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029d7:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029da:	89 45 c4             	mov    %eax,-0x3c(%ebp)
801029dd:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029e0:	89 c2                	mov    %eax,%edx
801029e2:	83 e0 0f             	and    $0xf,%eax
801029e5:	c1 ea 04             	shr    $0x4,%edx
801029e8:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029eb:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029ee:	89 45 c8             	mov    %eax,-0x38(%ebp)
801029f1:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029f4:	89 c2                	mov    %eax,%edx
801029f6:	83 e0 0f             	and    $0xf,%eax
801029f9:	c1 ea 04             	shr    $0x4,%edx
801029fc:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029ff:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a02:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102a05:	8b 75 08             	mov    0x8(%ebp),%esi
80102a08:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102a0b:	89 06                	mov    %eax,(%esi)
80102a0d:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102a10:	89 46 04             	mov    %eax,0x4(%esi)
80102a13:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102a16:	89 46 08             	mov    %eax,0x8(%esi)
80102a19:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102a1c:	89 46 0c             	mov    %eax,0xc(%esi)
80102a1f:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102a22:	89 46 10             	mov    %eax,0x10(%esi)
80102a25:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102a28:	89 46 14             	mov    %eax,0x14(%esi)
80102a2b:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
80102a32:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a35:	5b                   	pop    %ebx
80102a36:	5e                   	pop    %esi
80102a37:	5f                   	pop    %edi
80102a38:	5d                   	pop    %ebp
80102a39:	c3                   	ret    
80102a3a:	66 90                	xchg   %ax,%ax
80102a3c:	66 90                	xchg   %ax,%ax
80102a3e:	66 90                	xchg   %ax,%ax

80102a40 <install_trans>:
80102a40:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102a46:	85 c9                	test   %ecx,%ecx
80102a48:	0f 8e 85 00 00 00    	jle    80102ad3 <install_trans+0x93>
80102a4e:	55                   	push   %ebp
80102a4f:	89 e5                	mov    %esp,%ebp
80102a51:	57                   	push   %edi
80102a52:	56                   	push   %esi
80102a53:	53                   	push   %ebx
80102a54:	31 db                	xor    %ebx,%ebx
80102a56:	83 ec 0c             	sub    $0xc,%esp
80102a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102a60:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102a65:	83 ec 08             	sub    $0x8,%esp
80102a68:	01 d8                	add    %ebx,%eax
80102a6a:	83 c0 01             	add    $0x1,%eax
80102a6d:	50                   	push   %eax
80102a6e:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102a74:	e8 57 d6 ff ff       	call   801000d0 <bread>
80102a79:	89 c7                	mov    %eax,%edi
80102a7b:	58                   	pop    %eax
80102a7c:	5a                   	pop    %edx
80102a7d:	ff 34 9d ec 26 11 80 	pushl  -0x7feed914(,%ebx,4)
80102a84:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102a8a:	83 c3 01             	add    $0x1,%ebx
80102a8d:	e8 3e d6 ff ff       	call   801000d0 <bread>
80102a92:	89 c6                	mov    %eax,%esi
80102a94:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a97:	83 c4 0c             	add    $0xc,%esp
80102a9a:	68 00 02 00 00       	push   $0x200
80102a9f:	50                   	push   %eax
80102aa0:	8d 46 5c             	lea    0x5c(%esi),%eax
80102aa3:	50                   	push   %eax
80102aa4:	e8 b7 1a 00 00       	call   80104560 <memmove>
80102aa9:	89 34 24             	mov    %esi,(%esp)
80102aac:	e8 ef d6 ff ff       	call   801001a0 <bwrite>
80102ab1:	89 3c 24             	mov    %edi,(%esp)
80102ab4:	e8 27 d7 ff ff       	call   801001e0 <brelse>
80102ab9:	89 34 24             	mov    %esi,(%esp)
80102abc:	e8 1f d7 ff ff       	call   801001e0 <brelse>
80102ac1:	83 c4 10             	add    $0x10,%esp
80102ac4:	39 1d e8 26 11 80    	cmp    %ebx,0x801126e8
80102aca:	7f 94                	jg     80102a60 <install_trans+0x20>
80102acc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102acf:	5b                   	pop    %ebx
80102ad0:	5e                   	pop    %esi
80102ad1:	5f                   	pop    %edi
80102ad2:	5d                   	pop    %ebp
80102ad3:	f3 c3                	repz ret 
80102ad5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102ad9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102ae0 <write_head>:
80102ae0:	55                   	push   %ebp
80102ae1:	89 e5                	mov    %esp,%ebp
80102ae3:	53                   	push   %ebx
80102ae4:	83 ec 0c             	sub    $0xc,%esp
80102ae7:	ff 35 d4 26 11 80    	pushl  0x801126d4
80102aed:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102af3:	e8 d8 d5 ff ff       	call   801000d0 <bread>
80102af8:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102afe:	83 c4 10             	add    $0x10,%esp
80102b01:	89 c3                	mov    %eax,%ebx
80102b03:	85 c9                	test   %ecx,%ecx
80102b05:	89 48 5c             	mov    %ecx,0x5c(%eax)
80102b08:	7e 1f                	jle    80102b29 <write_head+0x49>
80102b0a:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102b11:	31 d2                	xor    %edx,%edx
80102b13:	90                   	nop
80102b14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102b18:	8b 8a ec 26 11 80    	mov    -0x7feed914(%edx),%ecx
80102b1e:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102b22:	83 c2 04             	add    $0x4,%edx
80102b25:	39 c2                	cmp    %eax,%edx
80102b27:	75 ef                	jne    80102b18 <write_head+0x38>
80102b29:	83 ec 0c             	sub    $0xc,%esp
80102b2c:	53                   	push   %ebx
80102b2d:	e8 6e d6 ff ff       	call   801001a0 <bwrite>
80102b32:	89 1c 24             	mov    %ebx,(%esp)
80102b35:	e8 a6 d6 ff ff       	call   801001e0 <brelse>
80102b3a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b3d:	c9                   	leave  
80102b3e:	c3                   	ret    
80102b3f:	90                   	nop

80102b40 <initlog>:
80102b40:	55                   	push   %ebp
80102b41:	89 e5                	mov    %esp,%ebp
80102b43:	53                   	push   %ebx
80102b44:	83 ec 2c             	sub    $0x2c,%esp
80102b47:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102b4a:	68 1c 74 10 80       	push   $0x8010741c
80102b4f:	68 a0 26 11 80       	push   $0x801126a0
80102b54:	e8 07 17 00 00       	call   80104260 <initlock>
80102b59:	58                   	pop    %eax
80102b5a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102b5d:	5a                   	pop    %edx
80102b5e:	50                   	push   %eax
80102b5f:	53                   	push   %ebx
80102b60:	e8 3b e8 ff ff       	call   801013a0 <readsb>
80102b65:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102b68:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102b6b:	59                   	pop    %ecx
80102b6c:	89 1d e4 26 11 80    	mov    %ebx,0x801126e4
80102b72:	89 15 d8 26 11 80    	mov    %edx,0x801126d8
80102b78:	a3 d4 26 11 80       	mov    %eax,0x801126d4
80102b7d:	5a                   	pop    %edx
80102b7e:	50                   	push   %eax
80102b7f:	53                   	push   %ebx
80102b80:	e8 4b d5 ff ff       	call   801000d0 <bread>
80102b85:	8b 48 5c             	mov    0x5c(%eax),%ecx
80102b88:	83 c4 10             	add    $0x10,%esp
80102b8b:	85 c9                	test   %ecx,%ecx
80102b8d:	89 0d e8 26 11 80    	mov    %ecx,0x801126e8
80102b93:	7e 1c                	jle    80102bb1 <initlog+0x71>
80102b95:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102b9c:	31 d2                	xor    %edx,%edx
80102b9e:	66 90                	xchg   %ax,%ax
80102ba0:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102ba4:	83 c2 04             	add    $0x4,%edx
80102ba7:	89 8a e8 26 11 80    	mov    %ecx,-0x7feed918(%edx)
80102bad:	39 da                	cmp    %ebx,%edx
80102baf:	75 ef                	jne    80102ba0 <initlog+0x60>
80102bb1:	83 ec 0c             	sub    $0xc,%esp
80102bb4:	50                   	push   %eax
80102bb5:	e8 26 d6 ff ff       	call   801001e0 <brelse>
80102bba:	e8 81 fe ff ff       	call   80102a40 <install_trans>
80102bbf:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102bc6:	00 00 00 
80102bc9:	e8 12 ff ff ff       	call   80102ae0 <write_head>
80102bce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102bd1:	c9                   	leave  
80102bd2:	c3                   	ret    
80102bd3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102be0 <begin_op>:
80102be0:	55                   	push   %ebp
80102be1:	89 e5                	mov    %esp,%ebp
80102be3:	83 ec 14             	sub    $0x14,%esp
80102be6:	68 a0 26 11 80       	push   $0x801126a0
80102beb:	e8 90 16 00 00       	call   80104280 <acquire>
80102bf0:	83 c4 10             	add    $0x10,%esp
80102bf3:	eb 18                	jmp    80102c0d <begin_op+0x2d>
80102bf5:	8d 76 00             	lea    0x0(%esi),%esi
80102bf8:	83 ec 08             	sub    $0x8,%esp
80102bfb:	68 a0 26 11 80       	push   $0x801126a0
80102c00:	68 a0 26 11 80       	push   $0x801126a0
80102c05:	e8 e6 11 00 00       	call   80103df0 <sleep>
80102c0a:	83 c4 10             	add    $0x10,%esp
80102c0d:	a1 e0 26 11 80       	mov    0x801126e0,%eax
80102c12:	85 c0                	test   %eax,%eax
80102c14:	75 e2                	jne    80102bf8 <begin_op+0x18>
80102c16:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102c1b:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102c21:	83 c0 01             	add    $0x1,%eax
80102c24:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102c27:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102c2a:	83 fa 1e             	cmp    $0x1e,%edx
80102c2d:	7f c9                	jg     80102bf8 <begin_op+0x18>
80102c2f:	83 ec 0c             	sub    $0xc,%esp
80102c32:	a3 dc 26 11 80       	mov    %eax,0x801126dc
80102c37:	68 a0 26 11 80       	push   $0x801126a0
80102c3c:	e8 1f 18 00 00       	call   80104460 <release>
80102c41:	83 c4 10             	add    $0x10,%esp
80102c44:	c9                   	leave  
80102c45:	c3                   	ret    
80102c46:	8d 76 00             	lea    0x0(%esi),%esi
80102c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c50 <end_op>:
80102c50:	55                   	push   %ebp
80102c51:	89 e5                	mov    %esp,%ebp
80102c53:	57                   	push   %edi
80102c54:	56                   	push   %esi
80102c55:	53                   	push   %ebx
80102c56:	83 ec 18             	sub    $0x18,%esp
80102c59:	68 a0 26 11 80       	push   $0x801126a0
80102c5e:	e8 1d 16 00 00       	call   80104280 <acquire>
80102c63:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102c68:	8b 35 e0 26 11 80    	mov    0x801126e0,%esi
80102c6e:	83 c4 10             	add    $0x10,%esp
80102c71:	8d 58 ff             	lea    -0x1(%eax),%ebx
80102c74:	85 f6                	test   %esi,%esi
80102c76:	89 1d dc 26 11 80    	mov    %ebx,0x801126dc
80102c7c:	0f 85 22 01 00 00    	jne    80102da4 <end_op+0x154>
80102c82:	85 db                	test   %ebx,%ebx
80102c84:	0f 85 f6 00 00 00    	jne    80102d80 <end_op+0x130>
80102c8a:	83 ec 0c             	sub    $0xc,%esp
80102c8d:	c7 05 e0 26 11 80 01 	movl   $0x1,0x801126e0
80102c94:	00 00 00 
80102c97:	68 a0 26 11 80       	push   $0x801126a0
80102c9c:	e8 bf 17 00 00       	call   80104460 <release>
80102ca1:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102ca7:	83 c4 10             	add    $0x10,%esp
80102caa:	85 c9                	test   %ecx,%ecx
80102cac:	0f 8e 8b 00 00 00    	jle    80102d3d <end_op+0xed>
80102cb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102cb8:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102cbd:	83 ec 08             	sub    $0x8,%esp
80102cc0:	01 d8                	add    %ebx,%eax
80102cc2:	83 c0 01             	add    $0x1,%eax
80102cc5:	50                   	push   %eax
80102cc6:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102ccc:	e8 ff d3 ff ff       	call   801000d0 <bread>
80102cd1:	89 c6                	mov    %eax,%esi
80102cd3:	58                   	pop    %eax
80102cd4:	5a                   	pop    %edx
80102cd5:	ff 34 9d ec 26 11 80 	pushl  -0x7feed914(,%ebx,4)
80102cdc:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102ce2:	83 c3 01             	add    $0x1,%ebx
80102ce5:	e8 e6 d3 ff ff       	call   801000d0 <bread>
80102cea:	89 c7                	mov    %eax,%edi
80102cec:	8d 40 5c             	lea    0x5c(%eax),%eax
80102cef:	83 c4 0c             	add    $0xc,%esp
80102cf2:	68 00 02 00 00       	push   $0x200
80102cf7:	50                   	push   %eax
80102cf8:	8d 46 5c             	lea    0x5c(%esi),%eax
80102cfb:	50                   	push   %eax
80102cfc:	e8 5f 18 00 00       	call   80104560 <memmove>
80102d01:	89 34 24             	mov    %esi,(%esp)
80102d04:	e8 97 d4 ff ff       	call   801001a0 <bwrite>
80102d09:	89 3c 24             	mov    %edi,(%esp)
80102d0c:	e8 cf d4 ff ff       	call   801001e0 <brelse>
80102d11:	89 34 24             	mov    %esi,(%esp)
80102d14:	e8 c7 d4 ff ff       	call   801001e0 <brelse>
80102d19:	83 c4 10             	add    $0x10,%esp
80102d1c:	3b 1d e8 26 11 80    	cmp    0x801126e8,%ebx
80102d22:	7c 94                	jl     80102cb8 <end_op+0x68>
80102d24:	e8 b7 fd ff ff       	call   80102ae0 <write_head>
80102d29:	e8 12 fd ff ff       	call   80102a40 <install_trans>
80102d2e:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102d35:	00 00 00 
80102d38:	e8 a3 fd ff ff       	call   80102ae0 <write_head>
80102d3d:	83 ec 0c             	sub    $0xc,%esp
80102d40:	68 a0 26 11 80       	push   $0x801126a0
80102d45:	e8 36 15 00 00       	call   80104280 <acquire>
80102d4a:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d51:	c7 05 e0 26 11 80 00 	movl   $0x0,0x801126e0
80102d58:	00 00 00 
80102d5b:	e8 40 12 00 00       	call   80103fa0 <wakeup>
80102d60:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d67:	e8 f4 16 00 00       	call   80104460 <release>
80102d6c:	83 c4 10             	add    $0x10,%esp
80102d6f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d72:	5b                   	pop    %ebx
80102d73:	5e                   	pop    %esi
80102d74:	5f                   	pop    %edi
80102d75:	5d                   	pop    %ebp
80102d76:	c3                   	ret    
80102d77:	89 f6                	mov    %esi,%esi
80102d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102d80:	83 ec 0c             	sub    $0xc,%esp
80102d83:	68 a0 26 11 80       	push   $0x801126a0
80102d88:	e8 13 12 00 00       	call   80103fa0 <wakeup>
80102d8d:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d94:	e8 c7 16 00 00       	call   80104460 <release>
80102d99:	83 c4 10             	add    $0x10,%esp
80102d9c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d9f:	5b                   	pop    %ebx
80102da0:	5e                   	pop    %esi
80102da1:	5f                   	pop    %edi
80102da2:	5d                   	pop    %ebp
80102da3:	c3                   	ret    
80102da4:	83 ec 0c             	sub    $0xc,%esp
80102da7:	68 20 74 10 80       	push   $0x80107420
80102dac:	e8 bf d5 ff ff       	call   80100370 <panic>
80102db1:	eb 0d                	jmp    80102dc0 <log_write>
80102db3:	90                   	nop
80102db4:	90                   	nop
80102db5:	90                   	nop
80102db6:	90                   	nop
80102db7:	90                   	nop
80102db8:	90                   	nop
80102db9:	90                   	nop
80102dba:	90                   	nop
80102dbb:	90                   	nop
80102dbc:	90                   	nop
80102dbd:	90                   	nop
80102dbe:	90                   	nop
80102dbf:	90                   	nop

80102dc0 <log_write>:
80102dc0:	55                   	push   %ebp
80102dc1:	89 e5                	mov    %esp,%ebp
80102dc3:	53                   	push   %ebx
80102dc4:	83 ec 04             	sub    $0x4,%esp
80102dc7:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102dcd:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102dd0:	83 fa 1d             	cmp    $0x1d,%edx
80102dd3:	0f 8f 97 00 00 00    	jg     80102e70 <log_write+0xb0>
80102dd9:	a1 d8 26 11 80       	mov    0x801126d8,%eax
80102dde:	83 e8 01             	sub    $0x1,%eax
80102de1:	39 c2                	cmp    %eax,%edx
80102de3:	0f 8d 87 00 00 00    	jge    80102e70 <log_write+0xb0>
80102de9:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102dee:	85 c0                	test   %eax,%eax
80102df0:	0f 8e 87 00 00 00    	jle    80102e7d <log_write+0xbd>
80102df6:	83 ec 0c             	sub    $0xc,%esp
80102df9:	68 a0 26 11 80       	push   $0x801126a0
80102dfe:	e8 7d 14 00 00       	call   80104280 <acquire>
80102e03:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102e09:	83 c4 10             	add    $0x10,%esp
80102e0c:	83 f9 00             	cmp    $0x0,%ecx
80102e0f:	7e 50                	jle    80102e61 <log_write+0xa1>
80102e11:	8b 53 08             	mov    0x8(%ebx),%edx
80102e14:	31 c0                	xor    %eax,%eax
80102e16:	3b 15 ec 26 11 80    	cmp    0x801126ec,%edx
80102e1c:	75 0b                	jne    80102e29 <log_write+0x69>
80102e1e:	eb 38                	jmp    80102e58 <log_write+0x98>
80102e20:	39 14 85 ec 26 11 80 	cmp    %edx,-0x7feed914(,%eax,4)
80102e27:	74 2f                	je     80102e58 <log_write+0x98>
80102e29:	83 c0 01             	add    $0x1,%eax
80102e2c:	39 c8                	cmp    %ecx,%eax
80102e2e:	75 f0                	jne    80102e20 <log_write+0x60>
80102e30:	89 14 85 ec 26 11 80 	mov    %edx,-0x7feed914(,%eax,4)
80102e37:	83 c0 01             	add    $0x1,%eax
80102e3a:	a3 e8 26 11 80       	mov    %eax,0x801126e8
80102e3f:	83 0b 04             	orl    $0x4,(%ebx)
80102e42:	c7 45 08 a0 26 11 80 	movl   $0x801126a0,0x8(%ebp)
80102e49:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102e4c:	c9                   	leave  
80102e4d:	e9 0e 16 00 00       	jmp    80104460 <release>
80102e52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102e58:	89 14 85 ec 26 11 80 	mov    %edx,-0x7feed914(,%eax,4)
80102e5f:	eb de                	jmp    80102e3f <log_write+0x7f>
80102e61:	8b 43 08             	mov    0x8(%ebx),%eax
80102e64:	a3 ec 26 11 80       	mov    %eax,0x801126ec
80102e69:	75 d4                	jne    80102e3f <log_write+0x7f>
80102e6b:	31 c0                	xor    %eax,%eax
80102e6d:	eb c8                	jmp    80102e37 <log_write+0x77>
80102e6f:	90                   	nop
80102e70:	83 ec 0c             	sub    $0xc,%esp
80102e73:	68 2f 74 10 80       	push   $0x8010742f
80102e78:	e8 f3 d4 ff ff       	call   80100370 <panic>
80102e7d:	83 ec 0c             	sub    $0xc,%esp
80102e80:	68 45 74 10 80       	push   $0x80107445
80102e85:	e8 e6 d4 ff ff       	call   80100370 <panic>
80102e8a:	66 90                	xchg   %ax,%ax
80102e8c:	66 90                	xchg   %ax,%ax
80102e8e:	66 90                	xchg   %ax,%ax

80102e90 <mpmain>:
80102e90:	55                   	push   %ebp
80102e91:	89 e5                	mov    %esp,%ebp
80102e93:	83 ec 08             	sub    $0x8,%esp
80102e96:	e8 55 f8 ff ff       	call   801026f0 <cpunum>
80102e9b:	83 ec 08             	sub    $0x8,%esp
80102e9e:	50                   	push   %eax
80102e9f:	68 60 74 10 80       	push   $0x80107460
80102ea4:	e8 b7 d7 ff ff       	call   80100660 <cprintf>
80102ea9:	e8 12 29 00 00       	call   801057c0 <idtinit>
80102eae:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80102eb5:	b8 01 00 00 00       	mov    $0x1,%eax
80102eba:	f0 87 82 a8 00 00 00 	lock xchg %eax,0xa8(%edx)
80102ec1:	e8 4a 0c 00 00       	call   80103b10 <scheduler>
80102ec6:	8d 76 00             	lea    0x0(%esi),%esi
80102ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102ed0 <mpenter>:
80102ed0:	55                   	push   %ebp
80102ed1:	89 e5                	mov    %esp,%ebp
80102ed3:	83 ec 08             	sub    $0x8,%esp
80102ed6:	e8 f5 3a 00 00       	call   801069d0 <switchkvm>
80102edb:	e8 10 39 00 00       	call   801067f0 <seginit>
80102ee0:	e8 0b f7 ff ff       	call   801025f0 <lapicinit>
80102ee5:	e8 a6 ff ff ff       	call   80102e90 <mpmain>
80102eea:	66 90                	xchg   %ax,%ax
80102eec:	66 90                	xchg   %ax,%ax
80102eee:	66 90                	xchg   %ax,%ax

80102ef0 <main>:
80102ef0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102ef4:	83 e4 f0             	and    $0xfffffff0,%esp
80102ef7:	ff 71 fc             	pushl  -0x4(%ecx)
80102efa:	55                   	push   %ebp
80102efb:	89 e5                	mov    %esp,%ebp
80102efd:	53                   	push   %ebx
80102efe:	51                   	push   %ecx
80102eff:	83 ec 08             	sub    $0x8,%esp
80102f02:	68 00 00 40 80       	push   $0x80400000
80102f07:	68 28 55 11 80       	push   $0x80115528
80102f0c:	e8 9f f4 ff ff       	call   801023b0 <kinit1>
80102f11:	e8 9a 3a 00 00       	call   801069b0 <kvmalloc>
80102f16:	e8 a5 01 00 00       	call   801030c0 <mpinit>
80102f1b:	e8 d0 f6 ff ff       	call   801025f0 <lapicinit>
80102f20:	e8 cb 38 00 00       	call   801067f0 <seginit>
80102f25:	e8 c6 f7 ff ff       	call   801026f0 <cpunum>
80102f2a:	5a                   	pop    %edx
80102f2b:	59                   	pop    %ecx
80102f2c:	50                   	push   %eax
80102f2d:	68 71 74 10 80       	push   $0x80107471
80102f32:	e8 29 d7 ff ff       	call   80100660 <cprintf>
80102f37:	e8 94 03 00 00       	call   801032d0 <picinit>
80102f3c:	e8 8f f2 ff ff       	call   801021d0 <ioapicinit>
80102f41:	e8 4a da ff ff       	call   80100990 <consoleinit>
80102f46:	e8 75 2b 00 00       	call   80105ac0 <uartinit>
80102f4b:	e8 20 09 00 00       	call   80103870 <pinit>
80102f50:	e8 cb 27 00 00       	call   80105720 <tvinit>
80102f55:	e8 e6 d0 ff ff       	call   80100040 <binit>
80102f5a:	e8 d1 dd ff ff       	call   80100d30 <fileinit>
80102f5f:	e8 3c f0 ff ff       	call   80101fa0 <ideinit>
80102f64:	8b 1d 84 27 11 80    	mov    0x80112784,%ebx
80102f6a:	83 c4 10             	add    $0x10,%esp
80102f6d:	85 db                	test   %ebx,%ebx
80102f6f:	0f 84 ca 00 00 00    	je     8010303f <main+0x14f>
80102f75:	83 ec 04             	sub    $0x4,%esp
80102f78:	bb a0 27 11 80       	mov    $0x801127a0,%ebx
80102f7d:	68 8a 00 00 00       	push   $0x8a
80102f82:	68 8c a4 10 80       	push   $0x8010a48c
80102f87:	68 00 70 00 80       	push   $0x80007000
80102f8c:	e8 cf 15 00 00       	call   80104560 <memmove>
80102f91:	69 05 80 2d 11 80 bc 	imul   $0xbc,0x80112d80,%eax
80102f98:	00 00 00 
80102f9b:	83 c4 10             	add    $0x10,%esp
80102f9e:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102fa3:	39 d8                	cmp    %ebx,%eax
80102fa5:	76 7c                	jbe    80103023 <main+0x133>
80102fa7:	89 f6                	mov    %esi,%esi
80102fa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102fb0:	e8 3b f7 ff ff       	call   801026f0 <cpunum>
80102fb5:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80102fbb:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102fc0:	39 c3                	cmp    %eax,%ebx
80102fc2:	74 46                	je     8010300a <main+0x11a>
80102fc4:	e8 b7 f4 ff ff       	call   80102480 <kalloc>
80102fc9:	83 ec 08             	sub    $0x8,%esp
80102fcc:	05 00 10 00 00       	add    $0x1000,%eax
80102fd1:	c7 05 f8 6f 00 80 d0 	movl   $0x80102ed0,0x80006ff8
80102fd8:	2e 10 80 
80102fdb:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80102fe0:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102fe7:	90 10 00 
80102fea:	68 00 70 00 00       	push   $0x7000
80102fef:	0f b6 03             	movzbl (%ebx),%eax
80102ff2:	50                   	push   %eax
80102ff3:	e8 c8 f7 ff ff       	call   801027c0 <lapicstartap>
80102ff8:	83 c4 10             	add    $0x10,%esp
80102ffb:	90                   	nop
80102ffc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103000:	8b 83 a8 00 00 00    	mov    0xa8(%ebx),%eax
80103006:	85 c0                	test   %eax,%eax
80103008:	74 f6                	je     80103000 <main+0x110>
8010300a:	69 05 80 2d 11 80 bc 	imul   $0xbc,0x80112d80,%eax
80103011:	00 00 00 
80103014:	81 c3 bc 00 00 00    	add    $0xbc,%ebx
8010301a:	05 a0 27 11 80       	add    $0x801127a0,%eax
8010301f:	39 c3                	cmp    %eax,%ebx
80103021:	72 8d                	jb     80102fb0 <main+0xc0>
80103023:	83 ec 08             	sub    $0x8,%esp
80103026:	68 00 00 00 8e       	push   $0x8e000000
8010302b:	68 00 00 40 80       	push   $0x80400000
80103030:	e8 eb f3 ff ff       	call   80102420 <kinit2>
80103035:	e8 56 08 00 00       	call   80103890 <userinit>
8010303a:	e8 51 fe ff ff       	call   80102e90 <mpmain>
8010303f:	e8 7c 26 00 00       	call   801056c0 <timerinit>
80103044:	e9 2c ff ff ff       	jmp    80102f75 <main+0x85>
80103049:	66 90                	xchg   %ax,%ax
8010304b:	66 90                	xchg   %ax,%ax
8010304d:	66 90                	xchg   %ax,%ax
8010304f:	90                   	nop

80103050 <mpsearch1>:
80103050:	55                   	push   %ebp
80103051:	89 e5                	mov    %esp,%ebp
80103053:	57                   	push   %edi
80103054:	56                   	push   %esi
80103055:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
8010305b:	53                   	push   %ebx
8010305c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
8010305f:	83 ec 0c             	sub    $0xc,%esp
80103062:	39 de                	cmp    %ebx,%esi
80103064:	73 40                	jae    801030a6 <mpsearch1+0x56>
80103066:	8d 76 00             	lea    0x0(%esi),%esi
80103069:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103070:	83 ec 04             	sub    $0x4,%esp
80103073:	8d 7e 10             	lea    0x10(%esi),%edi
80103076:	6a 04                	push   $0x4
80103078:	68 88 74 10 80       	push   $0x80107488
8010307d:	56                   	push   %esi
8010307e:	e8 7d 14 00 00       	call   80104500 <memcmp>
80103083:	83 c4 10             	add    $0x10,%esp
80103086:	85 c0                	test   %eax,%eax
80103088:	75 16                	jne    801030a0 <mpsearch1+0x50>
8010308a:	8d 7e 10             	lea    0x10(%esi),%edi
8010308d:	89 f2                	mov    %esi,%edx
8010308f:	90                   	nop
80103090:	0f b6 0a             	movzbl (%edx),%ecx
80103093:	83 c2 01             	add    $0x1,%edx
80103096:	01 c8                	add    %ecx,%eax
80103098:	39 fa                	cmp    %edi,%edx
8010309a:	75 f4                	jne    80103090 <mpsearch1+0x40>
8010309c:	84 c0                	test   %al,%al
8010309e:	74 10                	je     801030b0 <mpsearch1+0x60>
801030a0:	39 fb                	cmp    %edi,%ebx
801030a2:	89 fe                	mov    %edi,%esi
801030a4:	77 ca                	ja     80103070 <mpsearch1+0x20>
801030a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801030a9:	31 c0                	xor    %eax,%eax
801030ab:	5b                   	pop    %ebx
801030ac:	5e                   	pop    %esi
801030ad:	5f                   	pop    %edi
801030ae:	5d                   	pop    %ebp
801030af:	c3                   	ret    
801030b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801030b3:	89 f0                	mov    %esi,%eax
801030b5:	5b                   	pop    %ebx
801030b6:	5e                   	pop    %esi
801030b7:	5f                   	pop    %edi
801030b8:	5d                   	pop    %ebp
801030b9:	c3                   	ret    
801030ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801030c0 <mpinit>:
801030c0:	55                   	push   %ebp
801030c1:	89 e5                	mov    %esp,%ebp
801030c3:	57                   	push   %edi
801030c4:	56                   	push   %esi
801030c5:	53                   	push   %ebx
801030c6:	83 ec 1c             	sub    $0x1c,%esp
801030c9:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
801030d0:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
801030d7:	c1 e0 08             	shl    $0x8,%eax
801030da:	09 d0                	or     %edx,%eax
801030dc:	c1 e0 04             	shl    $0x4,%eax
801030df:	85 c0                	test   %eax,%eax
801030e1:	75 1b                	jne    801030fe <mpinit+0x3e>
801030e3:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
801030ea:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
801030f1:	c1 e0 08             	shl    $0x8,%eax
801030f4:	09 d0                	or     %edx,%eax
801030f6:	c1 e0 0a             	shl    $0xa,%eax
801030f9:	2d 00 04 00 00       	sub    $0x400,%eax
801030fe:	ba 00 04 00 00       	mov    $0x400,%edx
80103103:	e8 48 ff ff ff       	call   80103050 <mpsearch1>
80103108:	85 c0                	test   %eax,%eax
8010310a:	89 c6                	mov    %eax,%esi
8010310c:	0f 84 66 01 00 00    	je     80103278 <mpinit+0x1b8>
80103112:	8b 5e 04             	mov    0x4(%esi),%ebx
80103115:	85 db                	test   %ebx,%ebx
80103117:	0f 84 d6 00 00 00    	je     801031f3 <mpinit+0x133>
8010311d:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80103123:	83 ec 04             	sub    $0x4,%esp
80103126:	6a 04                	push   $0x4
80103128:	68 8d 74 10 80       	push   $0x8010748d
8010312d:	50                   	push   %eax
8010312e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103131:	e8 ca 13 00 00       	call   80104500 <memcmp>
80103136:	83 c4 10             	add    $0x10,%esp
80103139:	85 c0                	test   %eax,%eax
8010313b:	0f 85 b2 00 00 00    	jne    801031f3 <mpinit+0x133>
80103141:	0f b6 93 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%edx
80103148:	80 fa 01             	cmp    $0x1,%dl
8010314b:	74 09                	je     80103156 <mpinit+0x96>
8010314d:	80 fa 04             	cmp    $0x4,%dl
80103150:	0f 85 9d 00 00 00    	jne    801031f3 <mpinit+0x133>
80103156:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
8010315d:	85 ff                	test   %edi,%edi
8010315f:	74 1c                	je     8010317d <mpinit+0xbd>
80103161:	31 d2                	xor    %edx,%edx
80103163:	90                   	nop
80103164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103168:	0f b6 8c 13 00 00 00 	movzbl -0x80000000(%ebx,%edx,1),%ecx
8010316f:	80 
80103170:	83 c2 01             	add    $0x1,%edx
80103173:	01 c8                	add    %ecx,%eax
80103175:	39 d7                	cmp    %edx,%edi
80103177:	75 ef                	jne    80103168 <mpinit+0xa8>
80103179:	84 c0                	test   %al,%al
8010317b:	75 76                	jne    801031f3 <mpinit+0x133>
8010317d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103180:	85 ff                	test   %edi,%edi
80103182:	74 6f                	je     801031f3 <mpinit+0x133>
80103184:	c7 05 84 27 11 80 01 	movl   $0x1,0x80112784
8010318b:	00 00 00 
8010318e:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
80103194:	a3 9c 26 11 80       	mov    %eax,0x8011269c
80103199:	0f b7 8b 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%ecx
801031a0:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
801031a6:	01 f9                	add    %edi,%ecx
801031a8:	39 c8                	cmp    %ecx,%eax
801031aa:	0f 83 a0 00 00 00    	jae    80103250 <mpinit+0x190>
801031b0:	80 38 04             	cmpb   $0x4,(%eax)
801031b3:	0f 87 87 00 00 00    	ja     80103240 <mpinit+0x180>
801031b9:	0f b6 10             	movzbl (%eax),%edx
801031bc:	ff 24 95 94 74 10 80 	jmp    *-0x7fef8b6c(,%edx,4)
801031c3:	90                   	nop
801031c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801031c8:	83 c0 08             	add    $0x8,%eax
801031cb:	39 c1                	cmp    %eax,%ecx
801031cd:	77 e1                	ja     801031b0 <mpinit+0xf0>
801031cf:	a1 84 27 11 80       	mov    0x80112784,%eax
801031d4:	85 c0                	test   %eax,%eax
801031d6:	75 78                	jne    80103250 <mpinit+0x190>
801031d8:	c7 05 80 2d 11 80 01 	movl   $0x1,0x80112d80
801031df:	00 00 00 
801031e2:	c7 05 9c 26 11 80 00 	movl   $0x0,0x8011269c
801031e9:	00 00 00 
801031ec:	c6 05 80 27 11 80 00 	movb   $0x0,0x80112780
801031f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801031f6:	5b                   	pop    %ebx
801031f7:	5e                   	pop    %esi
801031f8:	5f                   	pop    %edi
801031f9:	5d                   	pop    %ebp
801031fa:	c3                   	ret    
801031fb:	90                   	nop
801031fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103200:	8b 15 80 2d 11 80    	mov    0x80112d80,%edx
80103206:	83 fa 07             	cmp    $0x7,%edx
80103209:	7f 19                	jg     80103224 <mpinit+0x164>
8010320b:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
8010320f:	69 fa bc 00 00 00    	imul   $0xbc,%edx,%edi
80103215:	83 c2 01             	add    $0x1,%edx
80103218:	89 15 80 2d 11 80    	mov    %edx,0x80112d80
8010321e:	88 9f a0 27 11 80    	mov    %bl,-0x7feed860(%edi)
80103224:	83 c0 14             	add    $0x14,%eax
80103227:	eb a2                	jmp    801031cb <mpinit+0x10b>
80103229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103230:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103234:	83 c0 08             	add    $0x8,%eax
80103237:	88 15 80 27 11 80    	mov    %dl,0x80112780
8010323d:	eb 8c                	jmp    801031cb <mpinit+0x10b>
8010323f:	90                   	nop
80103240:	c7 05 84 27 11 80 00 	movl   $0x0,0x80112784
80103247:	00 00 00 
8010324a:	e9 7c ff ff ff       	jmp    801031cb <mpinit+0x10b>
8010324f:	90                   	nop
80103250:	80 7e 0c 00          	cmpb   $0x0,0xc(%esi)
80103254:	74 9d                	je     801031f3 <mpinit+0x133>
80103256:	ba 22 00 00 00       	mov    $0x22,%edx
8010325b:	b8 70 00 00 00       	mov    $0x70,%eax
80103260:	ee                   	out    %al,(%dx)
80103261:	ba 23 00 00 00       	mov    $0x23,%edx
80103266:	ec                   	in     (%dx),%al
80103267:	83 c8 01             	or     $0x1,%eax
8010326a:	ee                   	out    %al,(%dx)
8010326b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010326e:	5b                   	pop    %ebx
8010326f:	5e                   	pop    %esi
80103270:	5f                   	pop    %edi
80103271:	5d                   	pop    %ebp
80103272:	c3                   	ret    
80103273:	90                   	nop
80103274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103278:	ba 00 00 01 00       	mov    $0x10000,%edx
8010327d:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80103282:	e8 c9 fd ff ff       	call   80103050 <mpsearch1>
80103287:	85 c0                	test   %eax,%eax
80103289:	89 c6                	mov    %eax,%esi
8010328b:	0f 85 81 fe ff ff    	jne    80103112 <mpinit+0x52>
80103291:	e9 5d ff ff ff       	jmp    801031f3 <mpinit+0x133>
80103296:	66 90                	xchg   %ax,%ax
80103298:	66 90                	xchg   %ax,%ax
8010329a:	66 90                	xchg   %ax,%ax
8010329c:	66 90                	xchg   %ax,%ax
8010329e:	66 90                	xchg   %ax,%ax

801032a0 <picenable>:
801032a0:	55                   	push   %ebp
801032a1:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
801032a6:	ba 21 00 00 00       	mov    $0x21,%edx
801032ab:	89 e5                	mov    %esp,%ebp
801032ad:	8b 4d 08             	mov    0x8(%ebp),%ecx
801032b0:	d3 c0                	rol    %cl,%eax
801032b2:	66 23 05 00 a0 10 80 	and    0x8010a000,%ax
801032b9:	66 a3 00 a0 10 80    	mov    %ax,0x8010a000
801032bf:	ee                   	out    %al,(%dx)
801032c0:	ba a1 00 00 00       	mov    $0xa1,%edx
801032c5:	66 c1 e8 08          	shr    $0x8,%ax
801032c9:	ee                   	out    %al,(%dx)
801032ca:	5d                   	pop    %ebp
801032cb:	c3                   	ret    
801032cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801032d0 <picinit>:
801032d0:	55                   	push   %ebp
801032d1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801032d6:	89 e5                	mov    %esp,%ebp
801032d8:	57                   	push   %edi
801032d9:	56                   	push   %esi
801032da:	53                   	push   %ebx
801032db:	bb 21 00 00 00       	mov    $0x21,%ebx
801032e0:	89 da                	mov    %ebx,%edx
801032e2:	ee                   	out    %al,(%dx)
801032e3:	b9 a1 00 00 00       	mov    $0xa1,%ecx
801032e8:	89 ca                	mov    %ecx,%edx
801032ea:	ee                   	out    %al,(%dx)
801032eb:	bf 11 00 00 00       	mov    $0x11,%edi
801032f0:	be 20 00 00 00       	mov    $0x20,%esi
801032f5:	89 f8                	mov    %edi,%eax
801032f7:	89 f2                	mov    %esi,%edx
801032f9:	ee                   	out    %al,(%dx)
801032fa:	b8 20 00 00 00       	mov    $0x20,%eax
801032ff:	89 da                	mov    %ebx,%edx
80103301:	ee                   	out    %al,(%dx)
80103302:	b8 04 00 00 00       	mov    $0x4,%eax
80103307:	ee                   	out    %al,(%dx)
80103308:	b8 03 00 00 00       	mov    $0x3,%eax
8010330d:	ee                   	out    %al,(%dx)
8010330e:	bb a0 00 00 00       	mov    $0xa0,%ebx
80103313:	89 f8                	mov    %edi,%eax
80103315:	89 da                	mov    %ebx,%edx
80103317:	ee                   	out    %al,(%dx)
80103318:	b8 28 00 00 00       	mov    $0x28,%eax
8010331d:	89 ca                	mov    %ecx,%edx
8010331f:	ee                   	out    %al,(%dx)
80103320:	b8 02 00 00 00       	mov    $0x2,%eax
80103325:	ee                   	out    %al,(%dx)
80103326:	b8 03 00 00 00       	mov    $0x3,%eax
8010332b:	ee                   	out    %al,(%dx)
8010332c:	bf 68 00 00 00       	mov    $0x68,%edi
80103331:	89 f2                	mov    %esi,%edx
80103333:	89 f8                	mov    %edi,%eax
80103335:	ee                   	out    %al,(%dx)
80103336:	b9 0a 00 00 00       	mov    $0xa,%ecx
8010333b:	89 c8                	mov    %ecx,%eax
8010333d:	ee                   	out    %al,(%dx)
8010333e:	89 f8                	mov    %edi,%eax
80103340:	89 da                	mov    %ebx,%edx
80103342:	ee                   	out    %al,(%dx)
80103343:	89 c8                	mov    %ecx,%eax
80103345:	ee                   	out    %al,(%dx)
80103346:	0f b7 05 00 a0 10 80 	movzwl 0x8010a000,%eax
8010334d:	66 83 f8 ff          	cmp    $0xffff,%ax
80103351:	74 10                	je     80103363 <picinit+0x93>
80103353:	ba 21 00 00 00       	mov    $0x21,%edx
80103358:	ee                   	out    %al,(%dx)
80103359:	ba a1 00 00 00       	mov    $0xa1,%edx
8010335e:	66 c1 e8 08          	shr    $0x8,%ax
80103362:	ee                   	out    %al,(%dx)
80103363:	5b                   	pop    %ebx
80103364:	5e                   	pop    %esi
80103365:	5f                   	pop    %edi
80103366:	5d                   	pop    %ebp
80103367:	c3                   	ret    
80103368:	66 90                	xchg   %ax,%ax
8010336a:	66 90                	xchg   %ax,%ax
8010336c:	66 90                	xchg   %ax,%ax
8010336e:	66 90                	xchg   %ax,%ax

80103370 <pipealloc>:
80103370:	55                   	push   %ebp
80103371:	89 e5                	mov    %esp,%ebp
80103373:	57                   	push   %edi
80103374:	56                   	push   %esi
80103375:	53                   	push   %ebx
80103376:	83 ec 0c             	sub    $0xc,%esp
80103379:	8b 75 08             	mov    0x8(%ebp),%esi
8010337c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010337f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103385:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010338b:	e8 c0 d9 ff ff       	call   80100d50 <filealloc>
80103390:	85 c0                	test   %eax,%eax
80103392:	89 06                	mov    %eax,(%esi)
80103394:	0f 84 a8 00 00 00    	je     80103442 <pipealloc+0xd2>
8010339a:	e8 b1 d9 ff ff       	call   80100d50 <filealloc>
8010339f:	85 c0                	test   %eax,%eax
801033a1:	89 03                	mov    %eax,(%ebx)
801033a3:	0f 84 87 00 00 00    	je     80103430 <pipealloc+0xc0>
801033a9:	e8 d2 f0 ff ff       	call   80102480 <kalloc>
801033ae:	85 c0                	test   %eax,%eax
801033b0:	89 c7                	mov    %eax,%edi
801033b2:	0f 84 b0 00 00 00    	je     80103468 <pipealloc+0xf8>
801033b8:	83 ec 08             	sub    $0x8,%esp
801033bb:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
801033c2:	00 00 00 
801033c5:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
801033cc:	00 00 00 
801033cf:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
801033d6:	00 00 00 
801033d9:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
801033e0:	00 00 00 
801033e3:	68 a8 74 10 80       	push   $0x801074a8
801033e8:	50                   	push   %eax
801033e9:	e8 72 0e 00 00       	call   80104260 <initlock>
801033ee:	8b 06                	mov    (%esi),%eax
801033f0:	83 c4 10             	add    $0x10,%esp
801033f3:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
801033f9:	8b 06                	mov    (%esi),%eax
801033fb:	c6 40 08 01          	movb   $0x1,0x8(%eax)
801033ff:	8b 06                	mov    (%esi),%eax
80103401:	c6 40 09 00          	movb   $0x0,0x9(%eax)
80103405:	8b 06                	mov    (%esi),%eax
80103407:	89 78 0c             	mov    %edi,0xc(%eax)
8010340a:	8b 03                	mov    (%ebx),%eax
8010340c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80103412:	8b 03                	mov    (%ebx),%eax
80103414:	c6 40 08 00          	movb   $0x0,0x8(%eax)
80103418:	8b 03                	mov    (%ebx),%eax
8010341a:	c6 40 09 01          	movb   $0x1,0x9(%eax)
8010341e:	8b 03                	mov    (%ebx),%eax
80103420:	89 78 0c             	mov    %edi,0xc(%eax)
80103423:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103426:	31 c0                	xor    %eax,%eax
80103428:	5b                   	pop    %ebx
80103429:	5e                   	pop    %esi
8010342a:	5f                   	pop    %edi
8010342b:	5d                   	pop    %ebp
8010342c:	c3                   	ret    
8010342d:	8d 76 00             	lea    0x0(%esi),%esi
80103430:	8b 06                	mov    (%esi),%eax
80103432:	85 c0                	test   %eax,%eax
80103434:	74 1e                	je     80103454 <pipealloc+0xe4>
80103436:	83 ec 0c             	sub    $0xc,%esp
80103439:	50                   	push   %eax
8010343a:	e8 d1 d9 ff ff       	call   80100e10 <fileclose>
8010343f:	83 c4 10             	add    $0x10,%esp
80103442:	8b 03                	mov    (%ebx),%eax
80103444:	85 c0                	test   %eax,%eax
80103446:	74 0c                	je     80103454 <pipealloc+0xe4>
80103448:	83 ec 0c             	sub    $0xc,%esp
8010344b:	50                   	push   %eax
8010344c:	e8 bf d9 ff ff       	call   80100e10 <fileclose>
80103451:	83 c4 10             	add    $0x10,%esp
80103454:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103457:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010345c:	5b                   	pop    %ebx
8010345d:	5e                   	pop    %esi
8010345e:	5f                   	pop    %edi
8010345f:	5d                   	pop    %ebp
80103460:	c3                   	ret    
80103461:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103468:	8b 06                	mov    (%esi),%eax
8010346a:	85 c0                	test   %eax,%eax
8010346c:	75 c8                	jne    80103436 <pipealloc+0xc6>
8010346e:	eb d2                	jmp    80103442 <pipealloc+0xd2>

80103470 <pipeclose>:
80103470:	55                   	push   %ebp
80103471:	89 e5                	mov    %esp,%ebp
80103473:	56                   	push   %esi
80103474:	53                   	push   %ebx
80103475:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103478:	8b 75 0c             	mov    0xc(%ebp),%esi
8010347b:	83 ec 0c             	sub    $0xc,%esp
8010347e:	53                   	push   %ebx
8010347f:	e8 fc 0d 00 00       	call   80104280 <acquire>
80103484:	83 c4 10             	add    $0x10,%esp
80103487:	85 f6                	test   %esi,%esi
80103489:	74 45                	je     801034d0 <pipeclose+0x60>
8010348b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103491:	83 ec 0c             	sub    $0xc,%esp
80103494:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010349b:	00 00 00 
8010349e:	50                   	push   %eax
8010349f:	e8 fc 0a 00 00       	call   80103fa0 <wakeup>
801034a4:	83 c4 10             	add    $0x10,%esp
801034a7:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
801034ad:	85 d2                	test   %edx,%edx
801034af:	75 0a                	jne    801034bb <pipeclose+0x4b>
801034b1:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
801034b7:	85 c0                	test   %eax,%eax
801034b9:	74 35                	je     801034f0 <pipeclose+0x80>
801034bb:	89 5d 08             	mov    %ebx,0x8(%ebp)
801034be:	8d 65 f8             	lea    -0x8(%ebp),%esp
801034c1:	5b                   	pop    %ebx
801034c2:	5e                   	pop    %esi
801034c3:	5d                   	pop    %ebp
801034c4:	e9 97 0f 00 00       	jmp    80104460 <release>
801034c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801034d0:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
801034d6:	83 ec 0c             	sub    $0xc,%esp
801034d9:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
801034e0:	00 00 00 
801034e3:	50                   	push   %eax
801034e4:	e8 b7 0a 00 00       	call   80103fa0 <wakeup>
801034e9:	83 c4 10             	add    $0x10,%esp
801034ec:	eb b9                	jmp    801034a7 <pipeclose+0x37>
801034ee:	66 90                	xchg   %ax,%ax
801034f0:	83 ec 0c             	sub    $0xc,%esp
801034f3:	53                   	push   %ebx
801034f4:	e8 67 0f 00 00       	call   80104460 <release>
801034f9:	89 5d 08             	mov    %ebx,0x8(%ebp)
801034fc:	83 c4 10             	add    $0x10,%esp
801034ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103502:	5b                   	pop    %ebx
80103503:	5e                   	pop    %esi
80103504:	5d                   	pop    %ebp
80103505:	e9 c6 ed ff ff       	jmp    801022d0 <kfree>
8010350a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103510 <pipewrite>:
80103510:	55                   	push   %ebp
80103511:	89 e5                	mov    %esp,%ebp
80103513:	57                   	push   %edi
80103514:	56                   	push   %esi
80103515:	53                   	push   %ebx
80103516:	83 ec 28             	sub    $0x28,%esp
80103519:	8b 7d 08             	mov    0x8(%ebp),%edi
8010351c:	57                   	push   %edi
8010351d:	e8 5e 0d 00 00       	call   80104280 <acquire>
80103522:	8b 45 10             	mov    0x10(%ebp),%eax
80103525:	83 c4 10             	add    $0x10,%esp
80103528:	85 c0                	test   %eax,%eax
8010352a:	0f 8e c6 00 00 00    	jle    801035f6 <pipewrite+0xe6>
80103530:	8b 45 0c             	mov    0xc(%ebp),%eax
80103533:	8b 8f 38 02 00 00    	mov    0x238(%edi),%ecx
80103539:	8d b7 34 02 00 00    	lea    0x234(%edi),%esi
8010353f:	8d 9f 38 02 00 00    	lea    0x238(%edi),%ebx
80103545:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103548:	03 45 10             	add    0x10(%ebp),%eax
8010354b:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010354e:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
80103554:	8d 90 00 02 00 00    	lea    0x200(%eax),%edx
8010355a:	39 d1                	cmp    %edx,%ecx
8010355c:	0f 85 cf 00 00 00    	jne    80103631 <pipewrite+0x121>
80103562:	8b 97 3c 02 00 00    	mov    0x23c(%edi),%edx
80103568:	85 d2                	test   %edx,%edx
8010356a:	0f 84 a8 00 00 00    	je     80103618 <pipewrite+0x108>
80103570:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103577:	8b 42 24             	mov    0x24(%edx),%eax
8010357a:	85 c0                	test   %eax,%eax
8010357c:	74 25                	je     801035a3 <pipewrite+0x93>
8010357e:	e9 95 00 00 00       	jmp    80103618 <pipewrite+0x108>
80103583:	90                   	nop
80103584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103588:	8b 87 3c 02 00 00    	mov    0x23c(%edi),%eax
8010358e:	85 c0                	test   %eax,%eax
80103590:	0f 84 82 00 00 00    	je     80103618 <pipewrite+0x108>
80103596:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010359c:	8b 40 24             	mov    0x24(%eax),%eax
8010359f:	85 c0                	test   %eax,%eax
801035a1:	75 75                	jne    80103618 <pipewrite+0x108>
801035a3:	83 ec 0c             	sub    $0xc,%esp
801035a6:	56                   	push   %esi
801035a7:	e8 f4 09 00 00       	call   80103fa0 <wakeup>
801035ac:	59                   	pop    %ecx
801035ad:	58                   	pop    %eax
801035ae:	57                   	push   %edi
801035af:	53                   	push   %ebx
801035b0:	e8 3b 08 00 00       	call   80103df0 <sleep>
801035b5:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
801035bb:	8b 97 38 02 00 00    	mov    0x238(%edi),%edx
801035c1:	83 c4 10             	add    $0x10,%esp
801035c4:	05 00 02 00 00       	add    $0x200,%eax
801035c9:	39 c2                	cmp    %eax,%edx
801035cb:	74 bb                	je     80103588 <pipewrite+0x78>
801035cd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801035d0:	8d 4a 01             	lea    0x1(%edx),%ecx
801035d3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
801035d7:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
801035dd:	89 8f 38 02 00 00    	mov    %ecx,0x238(%edi)
801035e3:	0f b6 00             	movzbl (%eax),%eax
801035e6:	88 44 17 34          	mov    %al,0x34(%edi,%edx,1)
801035ea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801035ed:	39 45 e0             	cmp    %eax,-0x20(%ebp)
801035f0:	0f 85 58 ff ff ff    	jne    8010354e <pipewrite+0x3e>
801035f6:	8d 97 34 02 00 00    	lea    0x234(%edi),%edx
801035fc:	83 ec 0c             	sub    $0xc,%esp
801035ff:	52                   	push   %edx
80103600:	e8 9b 09 00 00       	call   80103fa0 <wakeup>
80103605:	89 3c 24             	mov    %edi,(%esp)
80103608:	e8 53 0e 00 00       	call   80104460 <release>
8010360d:	83 c4 10             	add    $0x10,%esp
80103610:	8b 45 10             	mov    0x10(%ebp),%eax
80103613:	eb 14                	jmp    80103629 <pipewrite+0x119>
80103615:	8d 76 00             	lea    0x0(%esi),%esi
80103618:	83 ec 0c             	sub    $0xc,%esp
8010361b:	57                   	push   %edi
8010361c:	e8 3f 0e 00 00       	call   80104460 <release>
80103621:	83 c4 10             	add    $0x10,%esp
80103624:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103629:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010362c:	5b                   	pop    %ebx
8010362d:	5e                   	pop    %esi
8010362e:	5f                   	pop    %edi
8010362f:	5d                   	pop    %ebp
80103630:	c3                   	ret    
80103631:	89 ca                	mov    %ecx,%edx
80103633:	eb 98                	jmp    801035cd <pipewrite+0xbd>
80103635:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103640 <piperead>:
80103640:	55                   	push   %ebp
80103641:	89 e5                	mov    %esp,%ebp
80103643:	57                   	push   %edi
80103644:	56                   	push   %esi
80103645:	53                   	push   %ebx
80103646:	83 ec 18             	sub    $0x18,%esp
80103649:	8b 75 08             	mov    0x8(%ebp),%esi
8010364c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010364f:	56                   	push   %esi
80103650:	e8 2b 0c 00 00       	call   80104280 <acquire>
80103655:	83 c4 10             	add    $0x10,%esp
80103658:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
8010365e:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103664:	75 72                	jne    801036d8 <piperead+0x98>
80103666:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
8010366c:	85 db                	test   %ebx,%ebx
8010366e:	0f 84 cc 00 00 00    	je     80103740 <piperead+0x100>
80103674:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
8010367a:	eb 2d                	jmp    801036a9 <piperead+0x69>
8010367c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103680:	83 ec 08             	sub    $0x8,%esp
80103683:	56                   	push   %esi
80103684:	53                   	push   %ebx
80103685:	e8 66 07 00 00       	call   80103df0 <sleep>
8010368a:	83 c4 10             	add    $0x10,%esp
8010368d:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80103693:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103699:	75 3d                	jne    801036d8 <piperead+0x98>
8010369b:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
801036a1:	85 d2                	test   %edx,%edx
801036a3:	0f 84 97 00 00 00    	je     80103740 <piperead+0x100>
801036a9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801036af:	8b 48 24             	mov    0x24(%eax),%ecx
801036b2:	85 c9                	test   %ecx,%ecx
801036b4:	74 ca                	je     80103680 <piperead+0x40>
801036b6:	83 ec 0c             	sub    $0xc,%esp
801036b9:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801036be:	56                   	push   %esi
801036bf:	e8 9c 0d 00 00       	call   80104460 <release>
801036c4:	83 c4 10             	add    $0x10,%esp
801036c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801036ca:	89 d8                	mov    %ebx,%eax
801036cc:	5b                   	pop    %ebx
801036cd:	5e                   	pop    %esi
801036ce:	5f                   	pop    %edi
801036cf:	5d                   	pop    %ebp
801036d0:	c3                   	ret    
801036d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801036d8:	8b 45 10             	mov    0x10(%ebp),%eax
801036db:	85 c0                	test   %eax,%eax
801036dd:	7e 61                	jle    80103740 <piperead+0x100>
801036df:	31 db                	xor    %ebx,%ebx
801036e1:	eb 13                	jmp    801036f6 <piperead+0xb6>
801036e3:	90                   	nop
801036e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801036e8:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
801036ee:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
801036f4:	74 1f                	je     80103715 <piperead+0xd5>
801036f6:	8d 41 01             	lea    0x1(%ecx),%eax
801036f9:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801036ff:	89 86 34 02 00 00    	mov    %eax,0x234(%esi)
80103705:	0f b6 44 0e 34       	movzbl 0x34(%esi,%ecx,1),%eax
8010370a:	88 04 1f             	mov    %al,(%edi,%ebx,1)
8010370d:	83 c3 01             	add    $0x1,%ebx
80103710:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80103713:	75 d3                	jne    801036e8 <piperead+0xa8>
80103715:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
8010371b:	83 ec 0c             	sub    $0xc,%esp
8010371e:	50                   	push   %eax
8010371f:	e8 7c 08 00 00       	call   80103fa0 <wakeup>
80103724:	89 34 24             	mov    %esi,(%esp)
80103727:	e8 34 0d 00 00       	call   80104460 <release>
8010372c:	83 c4 10             	add    $0x10,%esp
8010372f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103732:	89 d8                	mov    %ebx,%eax
80103734:	5b                   	pop    %ebx
80103735:	5e                   	pop    %esi
80103736:	5f                   	pop    %edi
80103737:	5d                   	pop    %ebp
80103738:	c3                   	ret    
80103739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103740:	31 db                	xor    %ebx,%ebx
80103742:	eb d1                	jmp    80103715 <piperead+0xd5>
80103744:	66 90                	xchg   %ax,%ax
80103746:	66 90                	xchg   %ax,%ax
80103748:	66 90                	xchg   %ax,%ax
8010374a:	66 90                	xchg   %ax,%ax
8010374c:	66 90                	xchg   %ax,%ax
8010374e:	66 90                	xchg   %ax,%ax

80103750 <allocproc>:
80103750:	55                   	push   %ebp
80103751:	89 e5                	mov    %esp,%ebp
80103753:	53                   	push   %ebx
80103754:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
80103759:	83 ec 10             	sub    $0x10,%esp
8010375c:	68 a0 2d 11 80       	push   $0x80112da0
80103761:	e8 1a 0b 00 00       	call   80104280 <acquire>
80103766:	83 c4 10             	add    $0x10,%esp
80103769:	eb 10                	jmp    8010377b <allocproc+0x2b>
8010376b:	90                   	nop
8010376c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103770:	83 c3 7c             	add    $0x7c,%ebx
80103773:	81 fb d4 4c 11 80    	cmp    $0x80114cd4,%ebx
80103779:	73 75                	jae    801037f0 <allocproc+0xa0>
8010377b:	8b 43 0c             	mov    0xc(%ebx),%eax
8010377e:	85 c0                	test   %eax,%eax
80103780:	75 ee                	jne    80103770 <allocproc+0x20>
80103782:	a1 08 a0 10 80       	mov    0x8010a008,%eax
80103787:	83 ec 0c             	sub    $0xc,%esp
8010378a:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
80103791:	8d 50 01             	lea    0x1(%eax),%edx
80103794:	89 43 10             	mov    %eax,0x10(%ebx)
80103797:	68 a0 2d 11 80       	push   $0x80112da0
8010379c:	89 15 08 a0 10 80    	mov    %edx,0x8010a008
801037a2:	e8 b9 0c 00 00       	call   80104460 <release>
801037a7:	e8 d4 ec ff ff       	call   80102480 <kalloc>
801037ac:	83 c4 10             	add    $0x10,%esp
801037af:	85 c0                	test   %eax,%eax
801037b1:	89 43 08             	mov    %eax,0x8(%ebx)
801037b4:	74 53                	je     80103809 <allocproc+0xb9>
801037b6:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
801037bc:	83 ec 04             	sub    $0x4,%esp
801037bf:	05 9c 0f 00 00       	add    $0xf9c,%eax
801037c4:	89 53 18             	mov    %edx,0x18(%ebx)
801037c7:	c7 40 14 0e 57 10 80 	movl   $0x8010570e,0x14(%eax)
801037ce:	89 43 1c             	mov    %eax,0x1c(%ebx)
801037d1:	6a 14                	push   $0x14
801037d3:	6a 00                	push   $0x0
801037d5:	50                   	push   %eax
801037d6:	e8 d5 0c 00 00       	call   801044b0 <memset>
801037db:	8b 43 1c             	mov    0x1c(%ebx),%eax
801037de:	83 c4 10             	add    $0x10,%esp
801037e1:	c7 40 10 20 38 10 80 	movl   $0x80103820,0x10(%eax)
801037e8:	89 d8                	mov    %ebx,%eax
801037ea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801037ed:	c9                   	leave  
801037ee:	c3                   	ret    
801037ef:	90                   	nop
801037f0:	83 ec 0c             	sub    $0xc,%esp
801037f3:	31 db                	xor    %ebx,%ebx
801037f5:	68 a0 2d 11 80       	push   $0x80112da0
801037fa:	e8 61 0c 00 00       	call   80104460 <release>
801037ff:	89 d8                	mov    %ebx,%eax
80103801:	83 c4 10             	add    $0x10,%esp
80103804:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103807:	c9                   	leave  
80103808:	c3                   	ret    
80103809:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103810:	31 db                	xor    %ebx,%ebx
80103812:	eb d4                	jmp    801037e8 <allocproc+0x98>
80103814:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010381a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103820 <forkret>:
80103820:	55                   	push   %ebp
80103821:	89 e5                	mov    %esp,%ebp
80103823:	83 ec 14             	sub    $0x14,%esp
80103826:	68 a0 2d 11 80       	push   $0x80112da0
8010382b:	e8 30 0c 00 00       	call   80104460 <release>
80103830:	a1 04 a0 10 80       	mov    0x8010a004,%eax
80103835:	83 c4 10             	add    $0x10,%esp
80103838:	85 c0                	test   %eax,%eax
8010383a:	75 04                	jne    80103840 <forkret+0x20>
8010383c:	c9                   	leave  
8010383d:	c3                   	ret    
8010383e:	66 90                	xchg   %ax,%ax
80103840:	83 ec 0c             	sub    $0xc,%esp
80103843:	c7 05 04 a0 10 80 00 	movl   $0x0,0x8010a004
8010384a:	00 00 00 
8010384d:	6a 01                	push   $0x1
8010384f:	e8 0c dc ff ff       	call   80101460 <iinit>
80103854:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010385b:	e8 e0 f2 ff ff       	call   80102b40 <initlog>
80103860:	83 c4 10             	add    $0x10,%esp
80103863:	c9                   	leave  
80103864:	c3                   	ret    
80103865:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103870 <pinit>:
80103870:	55                   	push   %ebp
80103871:	89 e5                	mov    %esp,%ebp
80103873:	83 ec 10             	sub    $0x10,%esp
80103876:	68 ad 74 10 80       	push   $0x801074ad
8010387b:	68 a0 2d 11 80       	push   $0x80112da0
80103880:	e8 db 09 00 00       	call   80104260 <initlock>
80103885:	83 c4 10             	add    $0x10,%esp
80103888:	c9                   	leave  
80103889:	c3                   	ret    
8010388a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103890 <userinit>:
80103890:	55                   	push   %ebp
80103891:	89 e5                	mov    %esp,%ebp
80103893:	53                   	push   %ebx
80103894:	83 ec 04             	sub    $0x4,%esp
80103897:	e8 b4 fe ff ff       	call   80103750 <allocproc>
8010389c:	89 c3                	mov    %eax,%ebx
8010389e:	a3 bc a5 10 80       	mov    %eax,0x8010a5bc
801038a3:	e8 98 30 00 00       	call   80106940 <setupkvm>
801038a8:	85 c0                	test   %eax,%eax
801038aa:	89 43 04             	mov    %eax,0x4(%ebx)
801038ad:	0f 84 bd 00 00 00    	je     80103970 <userinit+0xe0>
801038b3:	83 ec 04             	sub    $0x4,%esp
801038b6:	68 2c 00 00 00       	push   $0x2c
801038bb:	68 60 a4 10 80       	push   $0x8010a460
801038c0:	50                   	push   %eax
801038c1:	e8 ca 31 00 00       	call   80106a90 <inituvm>
801038c6:	83 c4 0c             	add    $0xc,%esp
801038c9:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
801038cf:	6a 4c                	push   $0x4c
801038d1:	6a 00                	push   $0x0
801038d3:	ff 73 18             	pushl  0x18(%ebx)
801038d6:	e8 d5 0b 00 00       	call   801044b0 <memset>
801038db:	8b 43 18             	mov    0x18(%ebx),%eax
801038de:	ba 23 00 00 00       	mov    $0x23,%edx
801038e3:	b9 2b 00 00 00       	mov    $0x2b,%ecx
801038e8:	83 c4 0c             	add    $0xc,%esp
801038eb:	66 89 50 3c          	mov    %dx,0x3c(%eax)
801038ef:	8b 43 18             	mov    0x18(%ebx),%eax
801038f2:	66 89 48 2c          	mov    %cx,0x2c(%eax)
801038f6:	8b 43 18             	mov    0x18(%ebx),%eax
801038f9:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801038fd:	66 89 50 28          	mov    %dx,0x28(%eax)
80103901:	8b 43 18             	mov    0x18(%ebx),%eax
80103904:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103908:	66 89 50 48          	mov    %dx,0x48(%eax)
8010390c:	8b 43 18             	mov    0x18(%ebx),%eax
8010390f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
80103916:	8b 43 18             	mov    0x18(%ebx),%eax
80103919:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
80103920:	8b 43 18             	mov    0x18(%ebx),%eax
80103923:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
8010392a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010392d:	6a 10                	push   $0x10
8010392f:	68 cd 74 10 80       	push   $0x801074cd
80103934:	50                   	push   %eax
80103935:	e8 56 0d 00 00       	call   80104690 <safestrcpy>
8010393a:	c7 04 24 d6 74 10 80 	movl   $0x801074d6,(%esp)
80103941:	e8 4a e5 ff ff       	call   80101e90 <namei>
80103946:	89 43 68             	mov    %eax,0x68(%ebx)
80103949:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103950:	e8 2b 09 00 00       	call   80104280 <acquire>
80103955:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
8010395c:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103963:	e8 f8 0a 00 00       	call   80104460 <release>
80103968:	83 c4 10             	add    $0x10,%esp
8010396b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010396e:	c9                   	leave  
8010396f:	c3                   	ret    
80103970:	83 ec 0c             	sub    $0xc,%esp
80103973:	68 b4 74 10 80       	push   $0x801074b4
80103978:	e8 f3 c9 ff ff       	call   80100370 <panic>
8010397d:	8d 76 00             	lea    0x0(%esi),%esi

80103980 <growproc>:
80103980:	55                   	push   %ebp
80103981:	89 e5                	mov    %esp,%ebp
80103983:	83 ec 08             	sub    $0x8,%esp
80103986:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
8010398d:	8b 4d 08             	mov    0x8(%ebp),%ecx
80103990:	8b 02                	mov    (%edx),%eax
80103992:	83 f9 00             	cmp    $0x0,%ecx
80103995:	7e 39                	jle    801039d0 <growproc+0x50>
80103997:	83 ec 04             	sub    $0x4,%esp
8010399a:	01 c1                	add    %eax,%ecx
8010399c:	51                   	push   %ecx
8010399d:	50                   	push   %eax
8010399e:	ff 72 04             	pushl  0x4(%edx)
801039a1:	e8 2a 32 00 00       	call   80106bd0 <allocuvm>
801039a6:	83 c4 10             	add    $0x10,%esp
801039a9:	85 c0                	test   %eax,%eax
801039ab:	74 3b                	je     801039e8 <growproc+0x68>
801039ad:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801039b4:	89 02                	mov    %eax,(%edx)
801039b6:	83 ec 0c             	sub    $0xc,%esp
801039b9:	65 ff 35 04 00 00 00 	pushl  %gs:0x4
801039c0:	e8 2b 30 00 00       	call   801069f0 <switchuvm>
801039c5:	83 c4 10             	add    $0x10,%esp
801039c8:	31 c0                	xor    %eax,%eax
801039ca:	c9                   	leave  
801039cb:	c3                   	ret    
801039cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801039d0:	74 e2                	je     801039b4 <growproc+0x34>
801039d2:	83 ec 04             	sub    $0x4,%esp
801039d5:	01 c1                	add    %eax,%ecx
801039d7:	51                   	push   %ecx
801039d8:	50                   	push   %eax
801039d9:	ff 72 04             	pushl  0x4(%edx)
801039dc:	e8 df 32 00 00       	call   80106cc0 <deallocuvm>
801039e1:	83 c4 10             	add    $0x10,%esp
801039e4:	85 c0                	test   %eax,%eax
801039e6:	75 c5                	jne    801039ad <growproc+0x2d>
801039e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801039ed:	c9                   	leave  
801039ee:	c3                   	ret    
801039ef:	90                   	nop

801039f0 <fork>:
801039f0:	55                   	push   %ebp
801039f1:	89 e5                	mov    %esp,%ebp
801039f3:	57                   	push   %edi
801039f4:	56                   	push   %esi
801039f5:	53                   	push   %ebx
801039f6:	83 ec 0c             	sub    $0xc,%esp
801039f9:	e8 52 fd ff ff       	call   80103750 <allocproc>
801039fe:	85 c0                	test   %eax,%eax
80103a00:	0f 84 d6 00 00 00    	je     80103adc <fork+0xec>
80103a06:	89 c3                	mov    %eax,%ebx
80103a08:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103a0e:	83 ec 08             	sub    $0x8,%esp
80103a11:	ff 30                	pushl  (%eax)
80103a13:	ff 70 04             	pushl  0x4(%eax)
80103a16:	e8 85 33 00 00       	call   80106da0 <copyuvm>
80103a1b:	83 c4 10             	add    $0x10,%esp
80103a1e:	85 c0                	test   %eax,%eax
80103a20:	89 43 04             	mov    %eax,0x4(%ebx)
80103a23:	0f 84 ba 00 00 00    	je     80103ae3 <fork+0xf3>
80103a29:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103a2f:	8b 7b 18             	mov    0x18(%ebx),%edi
80103a32:	b9 13 00 00 00       	mov    $0x13,%ecx
80103a37:	8b 00                	mov    (%eax),%eax
80103a39:	89 03                	mov    %eax,(%ebx)
80103a3b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103a41:	89 43 14             	mov    %eax,0x14(%ebx)
80103a44:	8b 70 18             	mov    0x18(%eax),%esi
80103a47:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
80103a49:	31 f6                	xor    %esi,%esi
80103a4b:	8b 43 18             	mov    0x18(%ebx),%eax
80103a4e:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103a55:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103a60:	8b 44 b2 28          	mov    0x28(%edx,%esi,4),%eax
80103a64:	85 c0                	test   %eax,%eax
80103a66:	74 17                	je     80103a7f <fork+0x8f>
80103a68:	83 ec 0c             	sub    $0xc,%esp
80103a6b:	50                   	push   %eax
80103a6c:	e8 4f d3 ff ff       	call   80100dc0 <filedup>
80103a71:	89 44 b3 28          	mov    %eax,0x28(%ebx,%esi,4)
80103a75:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103a7c:	83 c4 10             	add    $0x10,%esp
80103a7f:	83 c6 01             	add    $0x1,%esi
80103a82:	83 fe 10             	cmp    $0x10,%esi
80103a85:	75 d9                	jne    80103a60 <fork+0x70>
80103a87:	83 ec 0c             	sub    $0xc,%esp
80103a8a:	ff 72 68             	pushl  0x68(%edx)
80103a8d:	e8 9e db ff ff       	call   80101630 <idup>
80103a92:	89 43 68             	mov    %eax,0x68(%ebx)
80103a95:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103a9b:	83 c4 0c             	add    $0xc,%esp
80103a9e:	6a 10                	push   $0x10
80103aa0:	83 c0 6c             	add    $0x6c,%eax
80103aa3:	50                   	push   %eax
80103aa4:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103aa7:	50                   	push   %eax
80103aa8:	e8 e3 0b 00 00       	call   80104690 <safestrcpy>
80103aad:	8b 73 10             	mov    0x10(%ebx),%esi
80103ab0:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103ab7:	e8 c4 07 00 00       	call   80104280 <acquire>
80103abc:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
80103ac3:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103aca:	e8 91 09 00 00       	call   80104460 <release>
80103acf:	83 c4 10             	add    $0x10,%esp
80103ad2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103ad5:	89 f0                	mov    %esi,%eax
80103ad7:	5b                   	pop    %ebx
80103ad8:	5e                   	pop    %esi
80103ad9:	5f                   	pop    %edi
80103ada:	5d                   	pop    %ebp
80103adb:	c3                   	ret    
80103adc:	be ff ff ff ff       	mov    $0xffffffff,%esi
80103ae1:	eb ef                	jmp    80103ad2 <fork+0xe2>
80103ae3:	83 ec 0c             	sub    $0xc,%esp
80103ae6:	ff 73 08             	pushl  0x8(%ebx)
80103ae9:	be ff ff ff ff       	mov    $0xffffffff,%esi
80103aee:	e8 dd e7 ff ff       	call   801022d0 <kfree>
80103af3:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80103afa:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103b01:	83 c4 10             	add    $0x10,%esp
80103b04:	eb cc                	jmp    80103ad2 <fork+0xe2>
80103b06:	8d 76 00             	lea    0x0(%esi),%esi
80103b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103b10 <scheduler>:
80103b10:	55                   	push   %ebp
80103b11:	89 e5                	mov    %esp,%ebp
80103b13:	53                   	push   %ebx
80103b14:	83 ec 04             	sub    $0x4,%esp
80103b17:	89 f6                	mov    %esi,%esi
80103b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103b20:	fb                   	sti    
80103b21:	83 ec 0c             	sub    $0xc,%esp
80103b24:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
80103b29:	68 a0 2d 11 80       	push   $0x80112da0
80103b2e:	e8 4d 07 00 00       	call   80104280 <acquire>
80103b33:	83 c4 10             	add    $0x10,%esp
80103b36:	eb 13                	jmp    80103b4b <scheduler+0x3b>
80103b38:	90                   	nop
80103b39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103b40:	83 c3 7c             	add    $0x7c,%ebx
80103b43:	81 fb d4 4c 11 80    	cmp    $0x80114cd4,%ebx
80103b49:	73 55                	jae    80103ba0 <scheduler+0x90>
80103b4b:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103b4f:	75 ef                	jne    80103b40 <scheduler+0x30>
80103b51:	83 ec 0c             	sub    $0xc,%esp
80103b54:	65 89 1d 04 00 00 00 	mov    %ebx,%gs:0x4
80103b5b:	53                   	push   %ebx
80103b5c:	83 c3 7c             	add    $0x7c,%ebx
80103b5f:	e8 8c 2e 00 00       	call   801069f0 <switchuvm>
80103b64:	58                   	pop    %eax
80103b65:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80103b6b:	c7 43 90 04 00 00 00 	movl   $0x4,-0x70(%ebx)
80103b72:	5a                   	pop    %edx
80103b73:	ff 73 a0             	pushl  -0x60(%ebx)
80103b76:	83 c0 04             	add    $0x4,%eax
80103b79:	50                   	push   %eax
80103b7a:	e8 6c 0b 00 00       	call   801046eb <swtch>
80103b7f:	e8 4c 2e 00 00       	call   801069d0 <switchkvm>
80103b84:	83 c4 10             	add    $0x10,%esp
80103b87:	81 fb d4 4c 11 80    	cmp    $0x80114cd4,%ebx
80103b8d:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80103b94:	00 00 00 00 
80103b98:	72 b1                	jb     80103b4b <scheduler+0x3b>
80103b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103ba0:	83 ec 0c             	sub    $0xc,%esp
80103ba3:	68 a0 2d 11 80       	push   $0x80112da0
80103ba8:	e8 b3 08 00 00       	call   80104460 <release>
80103bad:	83 c4 10             	add    $0x10,%esp
80103bb0:	e9 6b ff ff ff       	jmp    80103b20 <scheduler+0x10>
80103bb5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103bc0 <sched>:
80103bc0:	55                   	push   %ebp
80103bc1:	89 e5                	mov    %esp,%ebp
80103bc3:	53                   	push   %ebx
80103bc4:	83 ec 10             	sub    $0x10,%esp
80103bc7:	68 a0 2d 11 80       	push   $0x80112da0
80103bcc:	e8 df 07 00 00       	call   801043b0 <holding>
80103bd1:	83 c4 10             	add    $0x10,%esp
80103bd4:	85 c0                	test   %eax,%eax
80103bd6:	74 4c                	je     80103c24 <sched+0x64>
80103bd8:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80103bdf:	83 ba ac 00 00 00 01 	cmpl   $0x1,0xac(%edx)
80103be6:	75 63                	jne    80103c4b <sched+0x8b>
80103be8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103bee:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80103bf2:	74 4a                	je     80103c3e <sched+0x7e>
80103bf4:	9c                   	pushf  
80103bf5:	59                   	pop    %ecx
80103bf6:	80 e5 02             	and    $0x2,%ch
80103bf9:	75 36                	jne    80103c31 <sched+0x71>
80103bfb:	83 ec 08             	sub    $0x8,%esp
80103bfe:	83 c0 1c             	add    $0x1c,%eax
80103c01:	8b 9a b0 00 00 00    	mov    0xb0(%edx),%ebx
80103c07:	ff 72 04             	pushl  0x4(%edx)
80103c0a:	50                   	push   %eax
80103c0b:	e8 db 0a 00 00       	call   801046eb <swtch>
80103c10:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80103c16:	83 c4 10             	add    $0x10,%esp
80103c19:	89 98 b0 00 00 00    	mov    %ebx,0xb0(%eax)
80103c1f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103c22:	c9                   	leave  
80103c23:	c3                   	ret    
80103c24:	83 ec 0c             	sub    $0xc,%esp
80103c27:	68 d8 74 10 80       	push   $0x801074d8
80103c2c:	e8 3f c7 ff ff       	call   80100370 <panic>
80103c31:	83 ec 0c             	sub    $0xc,%esp
80103c34:	68 04 75 10 80       	push   $0x80107504
80103c39:	e8 32 c7 ff ff       	call   80100370 <panic>
80103c3e:	83 ec 0c             	sub    $0xc,%esp
80103c41:	68 f6 74 10 80       	push   $0x801074f6
80103c46:	e8 25 c7 ff ff       	call   80100370 <panic>
80103c4b:	83 ec 0c             	sub    $0xc,%esp
80103c4e:	68 ea 74 10 80       	push   $0x801074ea
80103c53:	e8 18 c7 ff ff       	call   80100370 <panic>
80103c58:	90                   	nop
80103c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103c60 <exit>:
80103c60:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103c67:	3b 15 bc a5 10 80    	cmp    0x8010a5bc,%edx
80103c6d:	55                   	push   %ebp
80103c6e:	89 e5                	mov    %esp,%ebp
80103c70:	56                   	push   %esi
80103c71:	53                   	push   %ebx
80103c72:	0f 84 1f 01 00 00    	je     80103d97 <exit+0x137>
80103c78:	31 db                	xor    %ebx,%ebx
80103c7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103c80:	8d 73 08             	lea    0x8(%ebx),%esi
80103c83:	8b 44 b2 08          	mov    0x8(%edx,%esi,4),%eax
80103c87:	85 c0                	test   %eax,%eax
80103c89:	74 1b                	je     80103ca6 <exit+0x46>
80103c8b:	83 ec 0c             	sub    $0xc,%esp
80103c8e:	50                   	push   %eax
80103c8f:	e8 7c d1 ff ff       	call   80100e10 <fileclose>
80103c94:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103c9b:	83 c4 10             	add    $0x10,%esp
80103c9e:	c7 44 b2 08 00 00 00 	movl   $0x0,0x8(%edx,%esi,4)
80103ca5:	00 
80103ca6:	83 c3 01             	add    $0x1,%ebx
80103ca9:	83 fb 10             	cmp    $0x10,%ebx
80103cac:	75 d2                	jne    80103c80 <exit+0x20>
80103cae:	e8 2d ef ff ff       	call   80102be0 <begin_op>
80103cb3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103cb9:	83 ec 0c             	sub    $0xc,%esp
80103cbc:	ff 70 68             	pushl  0x68(%eax)
80103cbf:	e8 cc da ff ff       	call   80101790 <iput>
80103cc4:	e8 87 ef ff ff       	call   80102c50 <end_op>
80103cc9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103ccf:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)
80103cd6:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103cdd:	e8 9e 05 00 00       	call   80104280 <acquire>
80103ce2:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
80103ce9:	83 c4 10             	add    $0x10,%esp
80103cec:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
80103cf1:	8b 51 14             	mov    0x14(%ecx),%edx
80103cf4:	eb 14                	jmp    80103d0a <exit+0xaa>
80103cf6:	8d 76 00             	lea    0x0(%esi),%esi
80103cf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103d00:	83 c0 7c             	add    $0x7c,%eax
80103d03:	3d d4 4c 11 80       	cmp    $0x80114cd4,%eax
80103d08:	73 1c                	jae    80103d26 <exit+0xc6>
80103d0a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103d0e:	75 f0                	jne    80103d00 <exit+0xa0>
80103d10:	3b 50 20             	cmp    0x20(%eax),%edx
80103d13:	75 eb                	jne    80103d00 <exit+0xa0>
80103d15:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103d1c:	83 c0 7c             	add    $0x7c,%eax
80103d1f:	3d d4 4c 11 80       	cmp    $0x80114cd4,%eax
80103d24:	72 e4                	jb     80103d0a <exit+0xaa>
80103d26:	8b 1d bc a5 10 80    	mov    0x8010a5bc,%ebx
80103d2c:	ba d4 2d 11 80       	mov    $0x80112dd4,%edx
80103d31:	eb 10                	jmp    80103d43 <exit+0xe3>
80103d33:	90                   	nop
80103d34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103d38:	83 c2 7c             	add    $0x7c,%edx
80103d3b:	81 fa d4 4c 11 80    	cmp    $0x80114cd4,%edx
80103d41:	73 3b                	jae    80103d7e <exit+0x11e>
80103d43:	3b 4a 14             	cmp    0x14(%edx),%ecx
80103d46:	75 f0                	jne    80103d38 <exit+0xd8>
80103d48:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
80103d4c:	89 5a 14             	mov    %ebx,0x14(%edx)
80103d4f:	75 e7                	jne    80103d38 <exit+0xd8>
80103d51:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
80103d56:	eb 12                	jmp    80103d6a <exit+0x10a>
80103d58:	90                   	nop
80103d59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103d60:	83 c0 7c             	add    $0x7c,%eax
80103d63:	3d d4 4c 11 80       	cmp    $0x80114cd4,%eax
80103d68:	73 ce                	jae    80103d38 <exit+0xd8>
80103d6a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103d6e:	75 f0                	jne    80103d60 <exit+0x100>
80103d70:	3b 58 20             	cmp    0x20(%eax),%ebx
80103d73:	75 eb                	jne    80103d60 <exit+0x100>
80103d75:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103d7c:	eb e2                	jmp    80103d60 <exit+0x100>
80103d7e:	c7 41 0c 05 00 00 00 	movl   $0x5,0xc(%ecx)
80103d85:	e8 36 fe ff ff       	call   80103bc0 <sched>
80103d8a:	83 ec 0c             	sub    $0xc,%esp
80103d8d:	68 25 75 10 80       	push   $0x80107525
80103d92:	e8 d9 c5 ff ff       	call   80100370 <panic>
80103d97:	83 ec 0c             	sub    $0xc,%esp
80103d9a:	68 18 75 10 80       	push   $0x80107518
80103d9f:	e8 cc c5 ff ff       	call   80100370 <panic>
80103da4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103daa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103db0 <yield>:
80103db0:	55                   	push   %ebp
80103db1:	89 e5                	mov    %esp,%ebp
80103db3:	83 ec 14             	sub    $0x14,%esp
80103db6:	68 a0 2d 11 80       	push   $0x80112da0
80103dbb:	e8 c0 04 00 00       	call   80104280 <acquire>
80103dc0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103dc6:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103dcd:	e8 ee fd ff ff       	call   80103bc0 <sched>
80103dd2:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103dd9:	e8 82 06 00 00       	call   80104460 <release>
80103dde:	83 c4 10             	add    $0x10,%esp
80103de1:	c9                   	leave  
80103de2:	c3                   	ret    
80103de3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103de9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103df0 <sleep>:
80103df0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103df6:	55                   	push   %ebp
80103df7:	89 e5                	mov    %esp,%ebp
80103df9:	56                   	push   %esi
80103dfa:	53                   	push   %ebx
80103dfb:	85 c0                	test   %eax,%eax
80103dfd:	8b 75 08             	mov    0x8(%ebp),%esi
80103e00:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80103e03:	0f 84 97 00 00 00    	je     80103ea0 <sleep+0xb0>
80103e09:	85 db                	test   %ebx,%ebx
80103e0b:	0f 84 82 00 00 00    	je     80103e93 <sleep+0xa3>
80103e11:	81 fb a0 2d 11 80    	cmp    $0x80112da0,%ebx
80103e17:	74 57                	je     80103e70 <sleep+0x80>
80103e19:	83 ec 0c             	sub    $0xc,%esp
80103e1c:	68 a0 2d 11 80       	push   $0x80112da0
80103e21:	e8 5a 04 00 00       	call   80104280 <acquire>
80103e26:	89 1c 24             	mov    %ebx,(%esp)
80103e29:	e8 32 06 00 00       	call   80104460 <release>
80103e2e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e34:	89 70 20             	mov    %esi,0x20(%eax)
80103e37:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
80103e3e:	e8 7d fd ff ff       	call   80103bc0 <sched>
80103e43:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e49:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
80103e50:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103e57:	e8 04 06 00 00       	call   80104460 <release>
80103e5c:	89 5d 08             	mov    %ebx,0x8(%ebp)
80103e5f:	83 c4 10             	add    $0x10,%esp
80103e62:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103e65:	5b                   	pop    %ebx
80103e66:	5e                   	pop    %esi
80103e67:	5d                   	pop    %ebp
80103e68:	e9 13 04 00 00       	jmp    80104280 <acquire>
80103e6d:	8d 76 00             	lea    0x0(%esi),%esi
80103e70:	89 70 20             	mov    %esi,0x20(%eax)
80103e73:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
80103e7a:	e8 41 fd ff ff       	call   80103bc0 <sched>
80103e7f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e85:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
80103e8c:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103e8f:	5b                   	pop    %ebx
80103e90:	5e                   	pop    %esi
80103e91:	5d                   	pop    %ebp
80103e92:	c3                   	ret    
80103e93:	83 ec 0c             	sub    $0xc,%esp
80103e96:	68 37 75 10 80       	push   $0x80107537
80103e9b:	e8 d0 c4 ff ff       	call   80100370 <panic>
80103ea0:	83 ec 0c             	sub    $0xc,%esp
80103ea3:	68 31 75 10 80       	push   $0x80107531
80103ea8:	e8 c3 c4 ff ff       	call   80100370 <panic>
80103ead:	8d 76 00             	lea    0x0(%esi),%esi

80103eb0 <wait>:
80103eb0:	55                   	push   %ebp
80103eb1:	89 e5                	mov    %esp,%ebp
80103eb3:	56                   	push   %esi
80103eb4:	53                   	push   %ebx
80103eb5:	83 ec 0c             	sub    $0xc,%esp
80103eb8:	68 a0 2d 11 80       	push   $0x80112da0
80103ebd:	e8 be 03 00 00       	call   80104280 <acquire>
80103ec2:	83 c4 10             	add    $0x10,%esp
80103ec5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103ecb:	31 d2                	xor    %edx,%edx
80103ecd:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
80103ed2:	eb 0f                	jmp    80103ee3 <wait+0x33>
80103ed4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103ed8:	83 c3 7c             	add    $0x7c,%ebx
80103edb:	81 fb d4 4c 11 80    	cmp    $0x80114cd4,%ebx
80103ee1:	73 1d                	jae    80103f00 <wait+0x50>
80103ee3:	3b 43 14             	cmp    0x14(%ebx),%eax
80103ee6:	75 f0                	jne    80103ed8 <wait+0x28>
80103ee8:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103eec:	74 30                	je     80103f1e <wait+0x6e>
80103eee:	83 c3 7c             	add    $0x7c,%ebx
80103ef1:	ba 01 00 00 00       	mov    $0x1,%edx
80103ef6:	81 fb d4 4c 11 80    	cmp    $0x80114cd4,%ebx
80103efc:	72 e5                	jb     80103ee3 <wait+0x33>
80103efe:	66 90                	xchg   %ax,%ax
80103f00:	85 d2                	test   %edx,%edx
80103f02:	74 70                	je     80103f74 <wait+0xc4>
80103f04:	8b 50 24             	mov    0x24(%eax),%edx
80103f07:	85 d2                	test   %edx,%edx
80103f09:	75 69                	jne    80103f74 <wait+0xc4>
80103f0b:	83 ec 08             	sub    $0x8,%esp
80103f0e:	68 a0 2d 11 80       	push   $0x80112da0
80103f13:	50                   	push   %eax
80103f14:	e8 d7 fe ff ff       	call   80103df0 <sleep>
80103f19:	83 c4 10             	add    $0x10,%esp
80103f1c:	eb a7                	jmp    80103ec5 <wait+0x15>
80103f1e:	83 ec 0c             	sub    $0xc,%esp
80103f21:	ff 73 08             	pushl  0x8(%ebx)
80103f24:	8b 73 10             	mov    0x10(%ebx),%esi
80103f27:	e8 a4 e3 ff ff       	call   801022d0 <kfree>
80103f2c:	59                   	pop    %ecx
80103f2d:	ff 73 04             	pushl  0x4(%ebx)
80103f30:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80103f37:	e8 b4 2d 00 00       	call   80106cf0 <freevm>
80103f3c:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
80103f43:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
80103f4a:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
80103f4e:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
80103f55:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103f5c:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103f63:	e8 f8 04 00 00       	call   80104460 <release>
80103f68:	83 c4 10             	add    $0x10,%esp
80103f6b:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103f6e:	89 f0                	mov    %esi,%eax
80103f70:	5b                   	pop    %ebx
80103f71:	5e                   	pop    %esi
80103f72:	5d                   	pop    %ebp
80103f73:	c3                   	ret    
80103f74:	83 ec 0c             	sub    $0xc,%esp
80103f77:	be ff ff ff ff       	mov    $0xffffffff,%esi
80103f7c:	68 a0 2d 11 80       	push   $0x80112da0
80103f81:	e8 da 04 00 00       	call   80104460 <release>
80103f86:	83 c4 10             	add    $0x10,%esp
80103f89:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103f8c:	89 f0                	mov    %esi,%eax
80103f8e:	5b                   	pop    %ebx
80103f8f:	5e                   	pop    %esi
80103f90:	5d                   	pop    %ebp
80103f91:	c3                   	ret    
80103f92:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103fa0 <wakeup>:
80103fa0:	55                   	push   %ebp
80103fa1:	89 e5                	mov    %esp,%ebp
80103fa3:	53                   	push   %ebx
80103fa4:	83 ec 10             	sub    $0x10,%esp
80103fa7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103faa:	68 a0 2d 11 80       	push   $0x80112da0
80103faf:	e8 cc 02 00 00       	call   80104280 <acquire>
80103fb4:	83 c4 10             	add    $0x10,%esp
80103fb7:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
80103fbc:	eb 0c                	jmp    80103fca <wakeup+0x2a>
80103fbe:	66 90                	xchg   %ax,%ax
80103fc0:	83 c0 7c             	add    $0x7c,%eax
80103fc3:	3d d4 4c 11 80       	cmp    $0x80114cd4,%eax
80103fc8:	73 1c                	jae    80103fe6 <wakeup+0x46>
80103fca:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103fce:	75 f0                	jne    80103fc0 <wakeup+0x20>
80103fd0:	3b 58 20             	cmp    0x20(%eax),%ebx
80103fd3:	75 eb                	jne    80103fc0 <wakeup+0x20>
80103fd5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103fdc:	83 c0 7c             	add    $0x7c,%eax
80103fdf:	3d d4 4c 11 80       	cmp    $0x80114cd4,%eax
80103fe4:	72 e4                	jb     80103fca <wakeup+0x2a>
80103fe6:	c7 45 08 a0 2d 11 80 	movl   $0x80112da0,0x8(%ebp)
80103fed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103ff0:	c9                   	leave  
80103ff1:	e9 6a 04 00 00       	jmp    80104460 <release>
80103ff6:	8d 76 00             	lea    0x0(%esi),%esi
80103ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104000 <kill>:
80104000:	55                   	push   %ebp
80104001:	89 e5                	mov    %esp,%ebp
80104003:	53                   	push   %ebx
80104004:	83 ec 10             	sub    $0x10,%esp
80104007:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010400a:	68 a0 2d 11 80       	push   $0x80112da0
8010400f:	e8 6c 02 00 00       	call   80104280 <acquire>
80104014:	83 c4 10             	add    $0x10,%esp
80104017:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
8010401c:	eb 0c                	jmp    8010402a <kill+0x2a>
8010401e:	66 90                	xchg   %ax,%ax
80104020:	83 c0 7c             	add    $0x7c,%eax
80104023:	3d d4 4c 11 80       	cmp    $0x80114cd4,%eax
80104028:	73 3e                	jae    80104068 <kill+0x68>
8010402a:	39 58 10             	cmp    %ebx,0x10(%eax)
8010402d:	75 f1                	jne    80104020 <kill+0x20>
8010402f:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80104033:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
8010403a:	74 1c                	je     80104058 <kill+0x58>
8010403c:	83 ec 0c             	sub    $0xc,%esp
8010403f:	68 a0 2d 11 80       	push   $0x80112da0
80104044:	e8 17 04 00 00       	call   80104460 <release>
80104049:	83 c4 10             	add    $0x10,%esp
8010404c:	31 c0                	xor    %eax,%eax
8010404e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104051:	c9                   	leave  
80104052:	c3                   	ret    
80104053:	90                   	nop
80104054:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104058:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
8010405f:	eb db                	jmp    8010403c <kill+0x3c>
80104061:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104068:	83 ec 0c             	sub    $0xc,%esp
8010406b:	68 a0 2d 11 80       	push   $0x80112da0
80104070:	e8 eb 03 00 00       	call   80104460 <release>
80104075:	83 c4 10             	add    $0x10,%esp
80104078:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010407d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104080:	c9                   	leave  
80104081:	c3                   	ret    
80104082:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104089:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104090 <procdump>:
80104090:	55                   	push   %ebp
80104091:	89 e5                	mov    %esp,%ebp
80104093:	57                   	push   %edi
80104094:	56                   	push   %esi
80104095:	53                   	push   %ebx
80104096:	8d 75 e8             	lea    -0x18(%ebp),%esi
80104099:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
8010409e:	83 ec 3c             	sub    $0x3c,%esp
801040a1:	eb 24                	jmp    801040c7 <procdump+0x37>
801040a3:	90                   	nop
801040a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801040a8:	83 ec 0c             	sub    $0xc,%esp
801040ab:	68 86 74 10 80       	push   $0x80107486
801040b0:	e8 ab c5 ff ff       	call   80100660 <cprintf>
801040b5:	83 c4 10             	add    $0x10,%esp
801040b8:	83 c3 7c             	add    $0x7c,%ebx
801040bb:	81 fb d4 4c 11 80    	cmp    $0x80114cd4,%ebx
801040c1:	0f 83 81 00 00 00    	jae    80104148 <procdump+0xb8>
801040c7:	8b 43 0c             	mov    0xc(%ebx),%eax
801040ca:	85 c0                	test   %eax,%eax
801040cc:	74 ea                	je     801040b8 <procdump+0x28>
801040ce:	83 f8 05             	cmp    $0x5,%eax
801040d1:	ba 48 75 10 80       	mov    $0x80107548,%edx
801040d6:	77 11                	ja     801040e9 <procdump+0x59>
801040d8:	8b 14 85 80 75 10 80 	mov    -0x7fef8a80(,%eax,4),%edx
801040df:	b8 48 75 10 80       	mov    $0x80107548,%eax
801040e4:	85 d2                	test   %edx,%edx
801040e6:	0f 44 d0             	cmove  %eax,%edx
801040e9:	8d 43 6c             	lea    0x6c(%ebx),%eax
801040ec:	50                   	push   %eax
801040ed:	52                   	push   %edx
801040ee:	ff 73 10             	pushl  0x10(%ebx)
801040f1:	68 4c 75 10 80       	push   $0x8010754c
801040f6:	e8 65 c5 ff ff       	call   80100660 <cprintf>
801040fb:	83 c4 10             	add    $0x10,%esp
801040fe:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
80104102:	75 a4                	jne    801040a8 <procdump+0x18>
80104104:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104107:	83 ec 08             	sub    $0x8,%esp
8010410a:	8d 7d c0             	lea    -0x40(%ebp),%edi
8010410d:	50                   	push   %eax
8010410e:	8b 43 1c             	mov    0x1c(%ebx),%eax
80104111:	8b 40 0c             	mov    0xc(%eax),%eax
80104114:	83 c0 08             	add    $0x8,%eax
80104117:	50                   	push   %eax
80104118:	e8 33 02 00 00       	call   80104350 <getcallerpcs>
8010411d:	83 c4 10             	add    $0x10,%esp
80104120:	8b 17                	mov    (%edi),%edx
80104122:	85 d2                	test   %edx,%edx
80104124:	74 82                	je     801040a8 <procdump+0x18>
80104126:	83 ec 08             	sub    $0x8,%esp
80104129:	83 c7 04             	add    $0x4,%edi
8010412c:	52                   	push   %edx
8010412d:	68 a9 6f 10 80       	push   $0x80106fa9
80104132:	e8 29 c5 ff ff       	call   80100660 <cprintf>
80104137:	83 c4 10             	add    $0x10,%esp
8010413a:	39 fe                	cmp    %edi,%esi
8010413c:	75 e2                	jne    80104120 <procdump+0x90>
8010413e:	e9 65 ff ff ff       	jmp    801040a8 <procdump+0x18>
80104143:	90                   	nop
80104144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104148:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010414b:	5b                   	pop    %ebx
8010414c:	5e                   	pop    %esi
8010414d:	5f                   	pop    %edi
8010414e:	5d                   	pop    %ebp
8010414f:	c3                   	ret    

80104150 <initsleeplock>:
80104150:	55                   	push   %ebp
80104151:	89 e5                	mov    %esp,%ebp
80104153:	53                   	push   %ebx
80104154:	83 ec 0c             	sub    $0xc,%esp
80104157:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010415a:	68 98 75 10 80       	push   $0x80107598
8010415f:	8d 43 04             	lea    0x4(%ebx),%eax
80104162:	50                   	push   %eax
80104163:	e8 f8 00 00 00       	call   80104260 <initlock>
80104168:	8b 45 0c             	mov    0xc(%ebp),%eax
8010416b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104171:	83 c4 10             	add    $0x10,%esp
80104174:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
8010417b:	89 43 38             	mov    %eax,0x38(%ebx)
8010417e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104181:	c9                   	leave  
80104182:	c3                   	ret    
80104183:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104190 <acquiresleep>:
80104190:	55                   	push   %ebp
80104191:	89 e5                	mov    %esp,%ebp
80104193:	56                   	push   %esi
80104194:	53                   	push   %ebx
80104195:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104198:	83 ec 0c             	sub    $0xc,%esp
8010419b:	8d 73 04             	lea    0x4(%ebx),%esi
8010419e:	56                   	push   %esi
8010419f:	e8 dc 00 00 00       	call   80104280 <acquire>
801041a4:	8b 13                	mov    (%ebx),%edx
801041a6:	83 c4 10             	add    $0x10,%esp
801041a9:	85 d2                	test   %edx,%edx
801041ab:	74 16                	je     801041c3 <acquiresleep+0x33>
801041ad:	8d 76 00             	lea    0x0(%esi),%esi
801041b0:	83 ec 08             	sub    $0x8,%esp
801041b3:	56                   	push   %esi
801041b4:	53                   	push   %ebx
801041b5:	e8 36 fc ff ff       	call   80103df0 <sleep>
801041ba:	8b 03                	mov    (%ebx),%eax
801041bc:	83 c4 10             	add    $0x10,%esp
801041bf:	85 c0                	test   %eax,%eax
801041c1:	75 ed                	jne    801041b0 <acquiresleep+0x20>
801041c3:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
801041c9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801041cf:	8b 40 10             	mov    0x10(%eax),%eax
801041d2:	89 43 3c             	mov    %eax,0x3c(%ebx)
801041d5:	89 75 08             	mov    %esi,0x8(%ebp)
801041d8:	8d 65 f8             	lea    -0x8(%ebp),%esp
801041db:	5b                   	pop    %ebx
801041dc:	5e                   	pop    %esi
801041dd:	5d                   	pop    %ebp
801041de:	e9 7d 02 00 00       	jmp    80104460 <release>
801041e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801041e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801041f0 <releasesleep>:
801041f0:	55                   	push   %ebp
801041f1:	89 e5                	mov    %esp,%ebp
801041f3:	56                   	push   %esi
801041f4:	53                   	push   %ebx
801041f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801041f8:	83 ec 0c             	sub    $0xc,%esp
801041fb:	8d 73 04             	lea    0x4(%ebx),%esi
801041fe:	56                   	push   %esi
801041ff:	e8 7c 00 00 00       	call   80104280 <acquire>
80104204:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010420a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
80104211:	89 1c 24             	mov    %ebx,(%esp)
80104214:	e8 87 fd ff ff       	call   80103fa0 <wakeup>
80104219:	89 75 08             	mov    %esi,0x8(%ebp)
8010421c:	83 c4 10             	add    $0x10,%esp
8010421f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104222:	5b                   	pop    %ebx
80104223:	5e                   	pop    %esi
80104224:	5d                   	pop    %ebp
80104225:	e9 36 02 00 00       	jmp    80104460 <release>
8010422a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104230 <holdingsleep>:
80104230:	55                   	push   %ebp
80104231:	89 e5                	mov    %esp,%ebp
80104233:	56                   	push   %esi
80104234:	53                   	push   %ebx
80104235:	8b 75 08             	mov    0x8(%ebp),%esi
80104238:	83 ec 0c             	sub    $0xc,%esp
8010423b:	8d 5e 04             	lea    0x4(%esi),%ebx
8010423e:	53                   	push   %ebx
8010423f:	e8 3c 00 00 00       	call   80104280 <acquire>
80104244:	8b 36                	mov    (%esi),%esi
80104246:	89 1c 24             	mov    %ebx,(%esp)
80104249:	e8 12 02 00 00       	call   80104460 <release>
8010424e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104251:	89 f0                	mov    %esi,%eax
80104253:	5b                   	pop    %ebx
80104254:	5e                   	pop    %esi
80104255:	5d                   	pop    %ebp
80104256:	c3                   	ret    
80104257:	66 90                	xchg   %ax,%ax
80104259:	66 90                	xchg   %ax,%ax
8010425b:	66 90                	xchg   %ax,%ax
8010425d:	66 90                	xchg   %ax,%ax
8010425f:	90                   	nop

80104260 <initlock>:
80104260:	55                   	push   %ebp
80104261:	89 e5                	mov    %esp,%ebp
80104263:	8b 45 08             	mov    0x8(%ebp),%eax
80104266:	8b 55 0c             	mov    0xc(%ebp),%edx
80104269:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010426f:	89 50 04             	mov    %edx,0x4(%eax)
80104272:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80104279:	5d                   	pop    %ebp
8010427a:	c3                   	ret    
8010427b:	90                   	nop
8010427c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104280 <acquire>:
80104280:	55                   	push   %ebp
80104281:	89 e5                	mov    %esp,%ebp
80104283:	53                   	push   %ebx
80104284:	83 ec 04             	sub    $0x4,%esp
80104287:	9c                   	pushf  
80104288:	5a                   	pop    %edx
80104289:	fa                   	cli    
8010428a:	65 8b 0d 00 00 00 00 	mov    %gs:0x0,%ecx
80104291:	8b 81 ac 00 00 00    	mov    0xac(%ecx),%eax
80104297:	85 c0                	test   %eax,%eax
80104299:	75 0c                	jne    801042a7 <acquire+0x27>
8010429b:	81 e2 00 02 00 00    	and    $0x200,%edx
801042a1:	89 91 b0 00 00 00    	mov    %edx,0xb0(%ecx)
801042a7:	8b 55 08             	mov    0x8(%ebp),%edx
801042aa:	83 c0 01             	add    $0x1,%eax
801042ad:	89 81 ac 00 00 00    	mov    %eax,0xac(%ecx)
801042b3:	8b 02                	mov    (%edx),%eax
801042b5:	85 c0                	test   %eax,%eax
801042b7:	74 05                	je     801042be <acquire+0x3e>
801042b9:	39 4a 08             	cmp    %ecx,0x8(%edx)
801042bc:	74 7a                	je     80104338 <acquire+0xb8>
801042be:	b9 01 00 00 00       	mov    $0x1,%ecx
801042c3:	90                   	nop
801042c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801042c8:	89 c8                	mov    %ecx,%eax
801042ca:	f0 87 02             	lock xchg %eax,(%edx)
801042cd:	85 c0                	test   %eax,%eax
801042cf:	75 f7                	jne    801042c8 <acquire+0x48>
801042d1:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801042d6:	8b 4d 08             	mov    0x8(%ebp),%ecx
801042d9:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801042df:	89 ea                	mov    %ebp,%edx
801042e1:	89 41 08             	mov    %eax,0x8(%ecx)
801042e4:	83 c1 0c             	add    $0xc,%ecx
801042e7:	31 c0                	xor    %eax,%eax
801042e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801042f0:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801042f6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801042fc:	77 1a                	ja     80104318 <acquire+0x98>
801042fe:	8b 5a 04             	mov    0x4(%edx),%ebx
80104301:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
80104304:	83 c0 01             	add    $0x1,%eax
80104307:	8b 12                	mov    (%edx),%edx
80104309:	83 f8 0a             	cmp    $0xa,%eax
8010430c:	75 e2                	jne    801042f0 <acquire+0x70>
8010430e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104311:	c9                   	leave  
80104312:	c3                   	ret    
80104313:	90                   	nop
80104314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104318:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
8010431f:	83 c0 01             	add    $0x1,%eax
80104322:	83 f8 0a             	cmp    $0xa,%eax
80104325:	74 e7                	je     8010430e <acquire+0x8e>
80104327:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
8010432e:	83 c0 01             	add    $0x1,%eax
80104331:	83 f8 0a             	cmp    $0xa,%eax
80104334:	75 e2                	jne    80104318 <acquire+0x98>
80104336:	eb d6                	jmp    8010430e <acquire+0x8e>
80104338:	83 ec 0c             	sub    $0xc,%esp
8010433b:	68 a3 75 10 80       	push   $0x801075a3
80104340:	e8 2b c0 ff ff       	call   80100370 <panic>
80104345:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104350 <getcallerpcs>:
80104350:	55                   	push   %ebp
80104351:	89 e5                	mov    %esp,%ebp
80104353:	53                   	push   %ebx
80104354:	8b 45 08             	mov    0x8(%ebp),%eax
80104357:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010435a:	8d 50 f8             	lea    -0x8(%eax),%edx
8010435d:	31 c0                	xor    %eax,%eax
8010435f:	90                   	nop
80104360:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104366:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010436c:	77 1a                	ja     80104388 <getcallerpcs+0x38>
8010436e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104371:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
80104374:	83 c0 01             	add    $0x1,%eax
80104377:	8b 12                	mov    (%edx),%edx
80104379:	83 f8 0a             	cmp    $0xa,%eax
8010437c:	75 e2                	jne    80104360 <getcallerpcs+0x10>
8010437e:	5b                   	pop    %ebx
8010437f:	5d                   	pop    %ebp
80104380:	c3                   	ret    
80104381:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104388:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
8010438f:	83 c0 01             	add    $0x1,%eax
80104392:	83 f8 0a             	cmp    $0xa,%eax
80104395:	74 e7                	je     8010437e <getcallerpcs+0x2e>
80104397:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
8010439e:	83 c0 01             	add    $0x1,%eax
801043a1:	83 f8 0a             	cmp    $0xa,%eax
801043a4:	75 e2                	jne    80104388 <getcallerpcs+0x38>
801043a6:	eb d6                	jmp    8010437e <getcallerpcs+0x2e>
801043a8:	90                   	nop
801043a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801043b0 <holding>:
801043b0:	55                   	push   %ebp
801043b1:	89 e5                	mov    %esp,%ebp
801043b3:	8b 55 08             	mov    0x8(%ebp),%edx
801043b6:	8b 02                	mov    (%edx),%eax
801043b8:	85 c0                	test   %eax,%eax
801043ba:	74 14                	je     801043d0 <holding+0x20>
801043bc:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801043c2:	39 42 08             	cmp    %eax,0x8(%edx)
801043c5:	5d                   	pop    %ebp
801043c6:	0f 94 c0             	sete   %al
801043c9:	0f b6 c0             	movzbl %al,%eax
801043cc:	c3                   	ret    
801043cd:	8d 76 00             	lea    0x0(%esi),%esi
801043d0:	31 c0                	xor    %eax,%eax
801043d2:	0f b6 c0             	movzbl %al,%eax
801043d5:	5d                   	pop    %ebp
801043d6:	c3                   	ret    
801043d7:	89 f6                	mov    %esi,%esi
801043d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801043e0 <pushcli>:
801043e0:	55                   	push   %ebp
801043e1:	89 e5                	mov    %esp,%ebp
801043e3:	9c                   	pushf  
801043e4:	59                   	pop    %ecx
801043e5:	fa                   	cli    
801043e6:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
801043ed:	8b 82 ac 00 00 00    	mov    0xac(%edx),%eax
801043f3:	85 c0                	test   %eax,%eax
801043f5:	75 0c                	jne    80104403 <pushcli+0x23>
801043f7:	81 e1 00 02 00 00    	and    $0x200,%ecx
801043fd:	89 8a b0 00 00 00    	mov    %ecx,0xb0(%edx)
80104403:	83 c0 01             	add    $0x1,%eax
80104406:	89 82 ac 00 00 00    	mov    %eax,0xac(%edx)
8010440c:	5d                   	pop    %ebp
8010440d:	c3                   	ret    
8010440e:	66 90                	xchg   %ax,%ax

80104410 <popcli>:
80104410:	55                   	push   %ebp
80104411:	89 e5                	mov    %esp,%ebp
80104413:	83 ec 08             	sub    $0x8,%esp
80104416:	9c                   	pushf  
80104417:	58                   	pop    %eax
80104418:	f6 c4 02             	test   $0x2,%ah
8010441b:	75 2c                	jne    80104449 <popcli+0x39>
8010441d:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104424:	83 aa ac 00 00 00 01 	subl   $0x1,0xac(%edx)
8010442b:	78 0f                	js     8010443c <popcli+0x2c>
8010442d:	75 0b                	jne    8010443a <popcli+0x2a>
8010442f:	8b 82 b0 00 00 00    	mov    0xb0(%edx),%eax
80104435:	85 c0                	test   %eax,%eax
80104437:	74 01                	je     8010443a <popcli+0x2a>
80104439:	fb                   	sti    
8010443a:	c9                   	leave  
8010443b:	c3                   	ret    
8010443c:	83 ec 0c             	sub    $0xc,%esp
8010443f:	68 c2 75 10 80       	push   $0x801075c2
80104444:	e8 27 bf ff ff       	call   80100370 <panic>
80104449:	83 ec 0c             	sub    $0xc,%esp
8010444c:	68 ab 75 10 80       	push   $0x801075ab
80104451:	e8 1a bf ff ff       	call   80100370 <panic>
80104456:	8d 76 00             	lea    0x0(%esi),%esi
80104459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104460 <release>:
80104460:	55                   	push   %ebp
80104461:	89 e5                	mov    %esp,%ebp
80104463:	83 ec 08             	sub    $0x8,%esp
80104466:	8b 45 08             	mov    0x8(%ebp),%eax
80104469:	8b 10                	mov    (%eax),%edx
8010446b:	85 d2                	test   %edx,%edx
8010446d:	74 0c                	je     8010447b <release+0x1b>
8010446f:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104476:	39 50 08             	cmp    %edx,0x8(%eax)
80104479:	74 15                	je     80104490 <release+0x30>
8010447b:	83 ec 0c             	sub    $0xc,%esp
8010447e:	68 c9 75 10 80       	push   $0x801075c9
80104483:	e8 e8 be ff ff       	call   80100370 <panic>
80104488:	90                   	nop
80104489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104490:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
80104497:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
8010449e:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801044a3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801044a9:	c9                   	leave  
801044aa:	e9 61 ff ff ff       	jmp    80104410 <popcli>
801044af:	90                   	nop

801044b0 <memset>:
801044b0:	55                   	push   %ebp
801044b1:	89 e5                	mov    %esp,%ebp
801044b3:	57                   	push   %edi
801044b4:	53                   	push   %ebx
801044b5:	8b 55 08             	mov    0x8(%ebp),%edx
801044b8:	8b 4d 10             	mov    0x10(%ebp),%ecx
801044bb:	f6 c2 03             	test   $0x3,%dl
801044be:	75 05                	jne    801044c5 <memset+0x15>
801044c0:	f6 c1 03             	test   $0x3,%cl
801044c3:	74 13                	je     801044d8 <memset+0x28>
801044c5:	89 d7                	mov    %edx,%edi
801044c7:	8b 45 0c             	mov    0xc(%ebp),%eax
801044ca:	fc                   	cld    
801044cb:	f3 aa                	rep stos %al,%es:(%edi)
801044cd:	5b                   	pop    %ebx
801044ce:	89 d0                	mov    %edx,%eax
801044d0:	5f                   	pop    %edi
801044d1:	5d                   	pop    %ebp
801044d2:	c3                   	ret    
801044d3:	90                   	nop
801044d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044d8:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
801044dc:	c1 e9 02             	shr    $0x2,%ecx
801044df:	89 f8                	mov    %edi,%eax
801044e1:	89 fb                	mov    %edi,%ebx
801044e3:	c1 e0 18             	shl    $0x18,%eax
801044e6:	c1 e3 10             	shl    $0x10,%ebx
801044e9:	09 d8                	or     %ebx,%eax
801044eb:	09 f8                	or     %edi,%eax
801044ed:	c1 e7 08             	shl    $0x8,%edi
801044f0:	09 f8                	or     %edi,%eax
801044f2:	89 d7                	mov    %edx,%edi
801044f4:	fc                   	cld    
801044f5:	f3 ab                	rep stos %eax,%es:(%edi)
801044f7:	5b                   	pop    %ebx
801044f8:	89 d0                	mov    %edx,%eax
801044fa:	5f                   	pop    %edi
801044fb:	5d                   	pop    %ebp
801044fc:	c3                   	ret    
801044fd:	8d 76 00             	lea    0x0(%esi),%esi

80104500 <memcmp>:
80104500:	55                   	push   %ebp
80104501:	89 e5                	mov    %esp,%ebp
80104503:	57                   	push   %edi
80104504:	56                   	push   %esi
80104505:	53                   	push   %ebx
80104506:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104509:	8b 75 08             	mov    0x8(%ebp),%esi
8010450c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010450f:	85 db                	test   %ebx,%ebx
80104511:	74 29                	je     8010453c <memcmp+0x3c>
80104513:	0f b6 16             	movzbl (%esi),%edx
80104516:	0f b6 0f             	movzbl (%edi),%ecx
80104519:	38 d1                	cmp    %dl,%cl
8010451b:	75 2b                	jne    80104548 <memcmp+0x48>
8010451d:	b8 01 00 00 00       	mov    $0x1,%eax
80104522:	eb 14                	jmp    80104538 <memcmp+0x38>
80104524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104528:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
8010452c:	83 c0 01             	add    $0x1,%eax
8010452f:	0f b6 4c 07 ff       	movzbl -0x1(%edi,%eax,1),%ecx
80104534:	38 ca                	cmp    %cl,%dl
80104536:	75 10                	jne    80104548 <memcmp+0x48>
80104538:	39 d8                	cmp    %ebx,%eax
8010453a:	75 ec                	jne    80104528 <memcmp+0x28>
8010453c:	5b                   	pop    %ebx
8010453d:	31 c0                	xor    %eax,%eax
8010453f:	5e                   	pop    %esi
80104540:	5f                   	pop    %edi
80104541:	5d                   	pop    %ebp
80104542:	c3                   	ret    
80104543:	90                   	nop
80104544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104548:	0f b6 c2             	movzbl %dl,%eax
8010454b:	5b                   	pop    %ebx
8010454c:	29 c8                	sub    %ecx,%eax
8010454e:	5e                   	pop    %esi
8010454f:	5f                   	pop    %edi
80104550:	5d                   	pop    %ebp
80104551:	c3                   	ret    
80104552:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104560 <memmove>:
80104560:	55                   	push   %ebp
80104561:	89 e5                	mov    %esp,%ebp
80104563:	56                   	push   %esi
80104564:	53                   	push   %ebx
80104565:	8b 45 08             	mov    0x8(%ebp),%eax
80104568:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010456b:	8b 75 10             	mov    0x10(%ebp),%esi
8010456e:	39 c3                	cmp    %eax,%ebx
80104570:	73 26                	jae    80104598 <memmove+0x38>
80104572:	8d 14 33             	lea    (%ebx,%esi,1),%edx
80104575:	39 d0                	cmp    %edx,%eax
80104577:	73 1f                	jae    80104598 <memmove+0x38>
80104579:	85 f6                	test   %esi,%esi
8010457b:	8d 56 ff             	lea    -0x1(%esi),%edx
8010457e:	74 0f                	je     8010458f <memmove+0x2f>
80104580:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104584:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104587:	83 ea 01             	sub    $0x1,%edx
8010458a:	83 fa ff             	cmp    $0xffffffff,%edx
8010458d:	75 f1                	jne    80104580 <memmove+0x20>
8010458f:	5b                   	pop    %ebx
80104590:	5e                   	pop    %esi
80104591:	5d                   	pop    %ebp
80104592:	c3                   	ret    
80104593:	90                   	nop
80104594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104598:	31 d2                	xor    %edx,%edx
8010459a:	85 f6                	test   %esi,%esi
8010459c:	74 f1                	je     8010458f <memmove+0x2f>
8010459e:	66 90                	xchg   %ax,%ax
801045a0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801045a4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
801045a7:	83 c2 01             	add    $0x1,%edx
801045aa:	39 f2                	cmp    %esi,%edx
801045ac:	75 f2                	jne    801045a0 <memmove+0x40>
801045ae:	5b                   	pop    %ebx
801045af:	5e                   	pop    %esi
801045b0:	5d                   	pop    %ebp
801045b1:	c3                   	ret    
801045b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045c0 <memcpy>:
801045c0:	55                   	push   %ebp
801045c1:	89 e5                	mov    %esp,%ebp
801045c3:	5d                   	pop    %ebp
801045c4:	eb 9a                	jmp    80104560 <memmove>
801045c6:	8d 76 00             	lea    0x0(%esi),%esi
801045c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045d0 <strncmp>:
801045d0:	55                   	push   %ebp
801045d1:	89 e5                	mov    %esp,%ebp
801045d3:	57                   	push   %edi
801045d4:	56                   	push   %esi
801045d5:	8b 7d 10             	mov    0x10(%ebp),%edi
801045d8:	53                   	push   %ebx
801045d9:	8b 4d 08             	mov    0x8(%ebp),%ecx
801045dc:	8b 75 0c             	mov    0xc(%ebp),%esi
801045df:	85 ff                	test   %edi,%edi
801045e1:	74 2f                	je     80104612 <strncmp+0x42>
801045e3:	0f b6 11             	movzbl (%ecx),%edx
801045e6:	0f b6 1e             	movzbl (%esi),%ebx
801045e9:	84 d2                	test   %dl,%dl
801045eb:	74 37                	je     80104624 <strncmp+0x54>
801045ed:	38 d3                	cmp    %dl,%bl
801045ef:	75 33                	jne    80104624 <strncmp+0x54>
801045f1:	01 f7                	add    %esi,%edi
801045f3:	eb 13                	jmp    80104608 <strncmp+0x38>
801045f5:	8d 76 00             	lea    0x0(%esi),%esi
801045f8:	0f b6 11             	movzbl (%ecx),%edx
801045fb:	84 d2                	test   %dl,%dl
801045fd:	74 21                	je     80104620 <strncmp+0x50>
801045ff:	0f b6 18             	movzbl (%eax),%ebx
80104602:	89 c6                	mov    %eax,%esi
80104604:	38 da                	cmp    %bl,%dl
80104606:	75 1c                	jne    80104624 <strncmp+0x54>
80104608:	8d 46 01             	lea    0x1(%esi),%eax
8010460b:	83 c1 01             	add    $0x1,%ecx
8010460e:	39 f8                	cmp    %edi,%eax
80104610:	75 e6                	jne    801045f8 <strncmp+0x28>
80104612:	5b                   	pop    %ebx
80104613:	31 c0                	xor    %eax,%eax
80104615:	5e                   	pop    %esi
80104616:	5f                   	pop    %edi
80104617:	5d                   	pop    %ebp
80104618:	c3                   	ret    
80104619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104620:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
80104624:	0f b6 c2             	movzbl %dl,%eax
80104627:	29 d8                	sub    %ebx,%eax
80104629:	5b                   	pop    %ebx
8010462a:	5e                   	pop    %esi
8010462b:	5f                   	pop    %edi
8010462c:	5d                   	pop    %ebp
8010462d:	c3                   	ret    
8010462e:	66 90                	xchg   %ax,%ax

80104630 <strncpy>:
80104630:	55                   	push   %ebp
80104631:	89 e5                	mov    %esp,%ebp
80104633:	56                   	push   %esi
80104634:	53                   	push   %ebx
80104635:	8b 45 08             	mov    0x8(%ebp),%eax
80104638:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010463b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010463e:	89 c2                	mov    %eax,%edx
80104640:	eb 19                	jmp    8010465b <strncpy+0x2b>
80104642:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104648:	83 c3 01             	add    $0x1,%ebx
8010464b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010464f:	83 c2 01             	add    $0x1,%edx
80104652:	84 c9                	test   %cl,%cl
80104654:	88 4a ff             	mov    %cl,-0x1(%edx)
80104657:	74 09                	je     80104662 <strncpy+0x32>
80104659:	89 f1                	mov    %esi,%ecx
8010465b:	85 c9                	test   %ecx,%ecx
8010465d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104660:	7f e6                	jg     80104648 <strncpy+0x18>
80104662:	31 c9                	xor    %ecx,%ecx
80104664:	85 f6                	test   %esi,%esi
80104666:	7e 17                	jle    8010467f <strncpy+0x4f>
80104668:	90                   	nop
80104669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104670:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104674:	89 f3                	mov    %esi,%ebx
80104676:	83 c1 01             	add    $0x1,%ecx
80104679:	29 cb                	sub    %ecx,%ebx
8010467b:	85 db                	test   %ebx,%ebx
8010467d:	7f f1                	jg     80104670 <strncpy+0x40>
8010467f:	5b                   	pop    %ebx
80104680:	5e                   	pop    %esi
80104681:	5d                   	pop    %ebp
80104682:	c3                   	ret    
80104683:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104690 <safestrcpy>:
80104690:	55                   	push   %ebp
80104691:	89 e5                	mov    %esp,%ebp
80104693:	56                   	push   %esi
80104694:	53                   	push   %ebx
80104695:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104698:	8b 45 08             	mov    0x8(%ebp),%eax
8010469b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010469e:	85 c9                	test   %ecx,%ecx
801046a0:	7e 26                	jle    801046c8 <safestrcpy+0x38>
801046a2:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
801046a6:	89 c1                	mov    %eax,%ecx
801046a8:	eb 17                	jmp    801046c1 <safestrcpy+0x31>
801046aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801046b0:	83 c2 01             	add    $0x1,%edx
801046b3:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
801046b7:	83 c1 01             	add    $0x1,%ecx
801046ba:	84 db                	test   %bl,%bl
801046bc:	88 59 ff             	mov    %bl,-0x1(%ecx)
801046bf:	74 04                	je     801046c5 <safestrcpy+0x35>
801046c1:	39 f2                	cmp    %esi,%edx
801046c3:	75 eb                	jne    801046b0 <safestrcpy+0x20>
801046c5:	c6 01 00             	movb   $0x0,(%ecx)
801046c8:	5b                   	pop    %ebx
801046c9:	5e                   	pop    %esi
801046ca:	5d                   	pop    %ebp
801046cb:	c3                   	ret    
801046cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801046d0 <strlen>:
801046d0:	55                   	push   %ebp
801046d1:	31 c0                	xor    %eax,%eax
801046d3:	89 e5                	mov    %esp,%ebp
801046d5:	8b 55 08             	mov    0x8(%ebp),%edx
801046d8:	80 3a 00             	cmpb   $0x0,(%edx)
801046db:	74 0c                	je     801046e9 <strlen+0x19>
801046dd:	8d 76 00             	lea    0x0(%esi),%esi
801046e0:	83 c0 01             	add    $0x1,%eax
801046e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801046e7:	75 f7                	jne    801046e0 <strlen+0x10>
801046e9:	5d                   	pop    %ebp
801046ea:	c3                   	ret    

801046eb <swtch>:
801046eb:	8b 44 24 04          	mov    0x4(%esp),%eax
801046ef:	8b 54 24 08          	mov    0x8(%esp),%edx
801046f3:	55                   	push   %ebp
801046f4:	53                   	push   %ebx
801046f5:	56                   	push   %esi
801046f6:	57                   	push   %edi
801046f7:	89 20                	mov    %esp,(%eax)
801046f9:	89 d4                	mov    %edx,%esp
801046fb:	5f                   	pop    %edi
801046fc:	5e                   	pop    %esi
801046fd:	5b                   	pop    %ebx
801046fe:	5d                   	pop    %ebp
801046ff:	c3                   	ret    

80104700 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104700:	55                   	push   %ebp
  if(addr >= proc->sz || addr+4 > proc->sz)
80104701:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104708:	89 e5                	mov    %esp,%ebp
8010470a:	8b 45 08             	mov    0x8(%ebp),%eax
  if(addr >= proc->sz || addr+4 > proc->sz)
8010470d:	8b 12                	mov    (%edx),%edx
8010470f:	39 c2                	cmp    %eax,%edx
80104711:	76 15                	jbe    80104728 <fetchint+0x28>
80104713:	8d 48 04             	lea    0x4(%eax),%ecx
80104716:	39 ca                	cmp    %ecx,%edx
80104718:	72 0e                	jb     80104728 <fetchint+0x28>
    return -1;
  *ip = *(int*)(addr);
8010471a:	8b 10                	mov    (%eax),%edx
8010471c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010471f:	89 10                	mov    %edx,(%eax)
  return 0;
80104721:	31 c0                	xor    %eax,%eax
}
80104723:	5d                   	pop    %ebp
80104724:	c3                   	ret    
80104725:	8d 76 00             	lea    0x0(%esi),%esi
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
80104728:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  *ip = *(int*)(addr);
  return 0;
}
8010472d:	5d                   	pop    %ebp
8010472e:	c3                   	ret    
8010472f:	90                   	nop

80104730 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104730:	55                   	push   %ebp
  char *s, *ep;

  if(addr >= proc->sz)
80104731:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104737:	89 e5                	mov    %esp,%ebp
80104739:	8b 4d 08             	mov    0x8(%ebp),%ecx
  char *s, *ep;

  if(addr >= proc->sz)
8010473c:	39 08                	cmp    %ecx,(%eax)
8010473e:	76 2c                	jbe    8010476c <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
80104740:	8b 55 0c             	mov    0xc(%ebp),%edx
80104743:	89 c8                	mov    %ecx,%eax
80104745:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
80104747:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
8010474e:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
80104750:	39 d1                	cmp    %edx,%ecx
80104752:	73 18                	jae    8010476c <fetchstr+0x3c>
    if(*s == 0)
80104754:	80 39 00             	cmpb   $0x0,(%ecx)
80104757:	75 0c                	jne    80104765 <fetchstr+0x35>
80104759:	eb 1d                	jmp    80104778 <fetchstr+0x48>
8010475b:	90                   	nop
8010475c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104760:	80 38 00             	cmpb   $0x0,(%eax)
80104763:	74 13                	je     80104778 <fetchstr+0x48>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
80104765:	83 c0 01             	add    $0x1,%eax
80104768:	39 c2                	cmp    %eax,%edx
8010476a:	77 f4                	ja     80104760 <fetchstr+0x30>
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
    return -1;
8010476c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
  return -1;
}
80104771:	5d                   	pop    %ebp
80104772:	c3                   	ret    
80104773:	90                   	nop
80104774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
80104778:	29 c8                	sub    %ecx,%eax
  return -1;
}
8010477a:	5d                   	pop    %ebp
8010477b:	c3                   	ret    
8010477c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104780 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104780:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
}

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104787:	55                   	push   %ebp
80104788:	89 e5                	mov    %esp,%ebp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
8010478a:	8b 42 18             	mov    0x18(%edx),%eax
8010478d:	8b 4d 08             	mov    0x8(%ebp),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104790:	8b 12                	mov    (%edx),%edx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104792:	8b 40 44             	mov    0x44(%eax),%eax
80104795:	8d 04 88             	lea    (%eax,%ecx,4),%eax
80104798:	8d 48 04             	lea    0x4(%eax),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
8010479b:	39 d1                	cmp    %edx,%ecx
8010479d:	73 19                	jae    801047b8 <argint+0x38>
8010479f:	8d 48 08             	lea    0x8(%eax),%ecx
801047a2:	39 ca                	cmp    %ecx,%edx
801047a4:	72 12                	jb     801047b8 <argint+0x38>
    return -1;
  *ip = *(int*)(addr);
801047a6:	8b 50 04             	mov    0x4(%eax),%edx
801047a9:	8b 45 0c             	mov    0xc(%ebp),%eax
801047ac:	89 10                	mov    %edx,(%eax)
  return 0;
801047ae:	31 c0                	xor    %eax,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
}
801047b0:	5d                   	pop    %ebp
801047b1:	c3                   	ret    
801047b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
801047b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
}
801047bd:	5d                   	pop    %ebp
801047be:	c3                   	ret    
801047bf:	90                   	nop

801047c0 <argptr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801047c0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
801047c6:	55                   	push   %ebp
801047c7:	89 e5                	mov    %esp,%ebp
801047c9:	53                   	push   %ebx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801047ca:	8b 50 18             	mov    0x18(%eax),%edx
801047cd:	8b 4d 08             	mov    0x8(%ebp),%ecx
801047d0:	8b 52 44             	mov    0x44(%edx),%edx
801047d3:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
801047d6:	8b 10                	mov    (%eax),%edx
argptr(int n, char **pp, int size)
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
801047d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801047dd:	8d 59 04             	lea    0x4(%ecx),%ebx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
801047e0:	39 d3                	cmp    %edx,%ebx
801047e2:	73 1e                	jae    80104802 <argptr+0x42>
801047e4:	8d 59 08             	lea    0x8(%ecx),%ebx
801047e7:	39 da                	cmp    %ebx,%edx
801047e9:	72 17                	jb     80104802 <argptr+0x42>
    return -1;
  *ip = *(int*)(addr);
801047eb:	8b 49 04             	mov    0x4(%ecx),%ecx
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
  if((uint)i >= proc->sz || (uint)i+size > proc->sz)
801047ee:	39 d1                	cmp    %edx,%ecx
801047f0:	73 10                	jae    80104802 <argptr+0x42>
801047f2:	8b 5d 10             	mov    0x10(%ebp),%ebx
801047f5:	01 cb                	add    %ecx,%ebx
801047f7:	39 d3                	cmp    %edx,%ebx
801047f9:	77 07                	ja     80104802 <argptr+0x42>
    return -1;
  *pp = (char*)i;
801047fb:	8b 45 0c             	mov    0xc(%ebp),%eax
801047fe:	89 08                	mov    %ecx,(%eax)
  return 0;
80104800:	31 c0                	xor    %eax,%eax
}
80104802:	5b                   	pop    %ebx
80104803:	5d                   	pop    %ebp
80104804:	c3                   	ret    
80104805:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104810 <argstr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104810:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104816:	55                   	push   %ebp
80104817:	89 e5                	mov    %esp,%ebp

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104819:	8b 50 18             	mov    0x18(%eax),%edx
8010481c:	8b 4d 08             	mov    0x8(%ebp),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
8010481f:	8b 00                	mov    (%eax),%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104821:	8b 52 44             	mov    0x44(%edx),%edx
80104824:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
80104827:	8d 4a 04             	lea    0x4(%edx),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
8010482a:	39 c1                	cmp    %eax,%ecx
8010482c:	73 07                	jae    80104835 <argstr+0x25>
8010482e:	8d 4a 08             	lea    0x8(%edx),%ecx
80104831:	39 c8                	cmp    %ecx,%eax
80104833:	73 0b                	jae    80104840 <argstr+0x30>
int
argstr(int n, char **pp)
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
80104835:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchstr(addr, pp);
}
8010483a:	5d                   	pop    %ebp
8010483b:	c3                   	ret    
8010483c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
  *ip = *(int*)(addr);
80104840:	8b 4a 04             	mov    0x4(%edx),%ecx
int
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
80104843:	39 c1                	cmp    %eax,%ecx
80104845:	73 ee                	jae    80104835 <argstr+0x25>
    return -1;
  *pp = (char*)addr;
80104847:	8b 55 0c             	mov    0xc(%ebp),%edx
8010484a:	89 c8                	mov    %ecx,%eax
8010484c:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
8010484e:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104855:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
80104857:	39 d1                	cmp    %edx,%ecx
80104859:	73 da                	jae    80104835 <argstr+0x25>
    if(*s == 0)
8010485b:	80 39 00             	cmpb   $0x0,(%ecx)
8010485e:	75 0d                	jne    8010486d <argstr+0x5d>
80104860:	eb 1e                	jmp    80104880 <argstr+0x70>
80104862:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104868:	80 38 00             	cmpb   $0x0,(%eax)
8010486b:	74 13                	je     80104880 <argstr+0x70>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
8010486d:	83 c0 01             	add    $0x1,%eax
80104870:	39 c2                	cmp    %eax,%edx
80104872:	77 f4                	ja     80104868 <argstr+0x58>
80104874:	eb bf                	jmp    80104835 <argstr+0x25>
80104876:	8d 76 00             	lea    0x0(%esi),%esi
80104879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(*s == 0)
      return s - *pp;
80104880:	29 c8                	sub    %ecx,%eax
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
  return fetchstr(addr, pp);
}
80104882:	5d                   	pop    %ebp
80104883:	c3                   	ret    
80104884:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010488a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104890 <syscall>:
  [SYS_halt]    "halt()",
  };

void
syscall(void)
{
80104890:	55                   	push   %ebp
80104891:	89 e5                	mov    %esp,%ebp
80104893:	57                   	push   %edi
80104894:	56                   	push   %esi
80104895:	53                   	push   %ebx
80104896:	83 ec 0c             	sub    $0xc,%esp
  int num;

  num = proc->tf->eax;
80104899:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010489f:	8b 70 18             	mov    0x18(%eax),%esi
801048a2:	8b 5e 1c             	mov    0x1c(%esi),%ebx
 
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
801048a5:	8d 53 ff             	lea    -0x1(%ebx),%edx
801048a8:	83 fa 15             	cmp    $0x15,%edx
801048ab:	77 33                	ja     801048e0 <syscall+0x50>
801048ad:	8b 3c 9d 00 77 10 80 	mov    -0x7fef8900(,%ebx,4),%edi
801048b4:	85 ff                	test   %edi,%edi
801048b6:	74 28                	je     801048e0 <syscall+0x50>
    proc->tf->eax = syscalls[num]();
801048b8:	ff d7                	call   *%edi
801048ba:	89 46 1c             	mov    %eax,0x1c(%esi)
    cprintf("%s -> %d\n",syscallname[num],syscalls[num]());/* Printing the required output
801048bd:	ff d7                	call   *%edi
801048bf:	83 ec 04             	sub    $0x4,%esp
801048c2:	50                   	push   %eax
801048c3:	ff 34 9d a0 76 10 80 	pushl  -0x7fef8960(,%ebx,4)
801048ca:	68 d1 75 10 80       	push   $0x801075d1
801048cf:	e8 8c bd ff ff       	call   80100660 <cprintf>
801048d4:	83 c4 10             	add    $0x10,%esp
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
  }
}
801048d7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801048da:	5b                   	pop    %ebx
801048db:	5e                   	pop    %esi
801048dc:	5f                   	pop    %edi
801048dd:	5d                   	pop    %ebp
801048de:	c3                   	ret    
801048df:	90                   	nop
    cprintf("%s -> %d\n",syscallname[num],syscalls[num]());/* Printing the required output
     */
    
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            proc->pid, proc->name, num);
801048e0:	8d 50 6c             	lea    0x6c(%eax),%edx
    proc->tf->eax = syscalls[num]();
    cprintf("%s -> %d\n",syscallname[num],syscalls[num]());/* Printing the required output
     */
    
  } else {
    cprintf("%d %s: unknown sys call %d\n",
801048e3:	53                   	push   %ebx
801048e4:	52                   	push   %edx
801048e5:	ff 70 10             	pushl  0x10(%eax)
801048e8:	68 db 75 10 80       	push   $0x801075db
801048ed:	e8 6e bd ff ff       	call   80100660 <cprintf>
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
801048f2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801048f8:	83 c4 10             	add    $0x10,%esp
801048fb:	8b 40 18             	mov    0x18(%eax),%eax
801048fe:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
80104905:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104908:	5b                   	pop    %ebx
80104909:	5e                   	pop    %esi
8010490a:	5f                   	pop    %edi
8010490b:	5d                   	pop    %ebp
8010490c:	c3                   	ret    
8010490d:	66 90                	xchg   %ax,%ax
8010490f:	90                   	nop

80104910 <create>:
80104910:	55                   	push   %ebp
80104911:	89 e5                	mov    %esp,%ebp
80104913:	57                   	push   %edi
80104914:	56                   	push   %esi
80104915:	53                   	push   %ebx
80104916:	8d 5d da             	lea    -0x26(%ebp),%ebx
80104919:	83 ec 44             	sub    $0x44,%esp
8010491c:	89 4d c0             	mov    %ecx,-0x40(%ebp)
8010491f:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104922:	53                   	push   %ebx
80104923:	50                   	push   %eax
80104924:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104927:	89 4d bc             	mov    %ecx,-0x44(%ebp)
8010492a:	e8 81 d5 ff ff       	call   80101eb0 <nameiparent>
8010492f:	83 c4 10             	add    $0x10,%esp
80104932:	85 c0                	test   %eax,%eax
80104934:	0f 84 f6 00 00 00    	je     80104a30 <create+0x120>
8010493a:	83 ec 0c             	sub    $0xc,%esp
8010493d:	89 c6                	mov    %eax,%esi
8010493f:	50                   	push   %eax
80104940:	e8 1b cd ff ff       	call   80101660 <ilock>
80104945:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104948:	83 c4 0c             	add    $0xc,%esp
8010494b:	50                   	push   %eax
8010494c:	53                   	push   %ebx
8010494d:	56                   	push   %esi
8010494e:	e8 1d d2 ff ff       	call   80101b70 <dirlookup>
80104953:	83 c4 10             	add    $0x10,%esp
80104956:	85 c0                	test   %eax,%eax
80104958:	89 c7                	mov    %eax,%edi
8010495a:	74 54                	je     801049b0 <create+0xa0>
8010495c:	83 ec 0c             	sub    $0xc,%esp
8010495f:	56                   	push   %esi
80104960:	e8 6b cf ff ff       	call   801018d0 <iunlockput>
80104965:	89 3c 24             	mov    %edi,(%esp)
80104968:	e8 f3 cc ff ff       	call   80101660 <ilock>
8010496d:	83 c4 10             	add    $0x10,%esp
80104970:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104975:	75 19                	jne    80104990 <create+0x80>
80104977:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
8010497c:	75 12                	jne    80104990 <create+0x80>
8010497e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104981:	89 f8                	mov    %edi,%eax
80104983:	5b                   	pop    %ebx
80104984:	5e                   	pop    %esi
80104985:	5f                   	pop    %edi
80104986:	5d                   	pop    %ebp
80104987:	c3                   	ret    
80104988:	90                   	nop
80104989:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104990:	83 ec 0c             	sub    $0xc,%esp
80104993:	57                   	push   %edi
80104994:	31 ff                	xor    %edi,%edi
80104996:	e8 35 cf ff ff       	call   801018d0 <iunlockput>
8010499b:	83 c4 10             	add    $0x10,%esp
8010499e:	8d 65 f4             	lea    -0xc(%ebp),%esp
801049a1:	89 f8                	mov    %edi,%eax
801049a3:	5b                   	pop    %ebx
801049a4:	5e                   	pop    %esi
801049a5:	5f                   	pop    %edi
801049a6:	5d                   	pop    %ebp
801049a7:	c3                   	ret    
801049a8:	90                   	nop
801049a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801049b0:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
801049b4:	83 ec 08             	sub    $0x8,%esp
801049b7:	50                   	push   %eax
801049b8:	ff 36                	pushl  (%esi)
801049ba:	e8 31 cb ff ff       	call   801014f0 <ialloc>
801049bf:	83 c4 10             	add    $0x10,%esp
801049c2:	85 c0                	test   %eax,%eax
801049c4:	89 c7                	mov    %eax,%edi
801049c6:	0f 84 cc 00 00 00    	je     80104a98 <create+0x188>
801049cc:	83 ec 0c             	sub    $0xc,%esp
801049cf:	50                   	push   %eax
801049d0:	e8 8b cc ff ff       	call   80101660 <ilock>
801049d5:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
801049d9:	66 89 47 52          	mov    %ax,0x52(%edi)
801049dd:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
801049e1:	66 89 47 54          	mov    %ax,0x54(%edi)
801049e5:	b8 01 00 00 00       	mov    $0x1,%eax
801049ea:	66 89 47 56          	mov    %ax,0x56(%edi)
801049ee:	89 3c 24             	mov    %edi,(%esp)
801049f1:	e8 ba cb ff ff       	call   801015b0 <iupdate>
801049f6:	83 c4 10             	add    $0x10,%esp
801049f9:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
801049fe:	74 40                	je     80104a40 <create+0x130>
80104a00:	83 ec 04             	sub    $0x4,%esp
80104a03:	ff 77 04             	pushl  0x4(%edi)
80104a06:	53                   	push   %ebx
80104a07:	56                   	push   %esi
80104a08:	e8 c3 d3 ff ff       	call   80101dd0 <dirlink>
80104a0d:	83 c4 10             	add    $0x10,%esp
80104a10:	85 c0                	test   %eax,%eax
80104a12:	78 77                	js     80104a8b <create+0x17b>
80104a14:	83 ec 0c             	sub    $0xc,%esp
80104a17:	56                   	push   %esi
80104a18:	e8 b3 ce ff ff       	call   801018d0 <iunlockput>
80104a1d:	83 c4 10             	add    $0x10,%esp
80104a20:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104a23:	89 f8                	mov    %edi,%eax
80104a25:	5b                   	pop    %ebx
80104a26:	5e                   	pop    %esi
80104a27:	5f                   	pop    %edi
80104a28:	5d                   	pop    %ebp
80104a29:	c3                   	ret    
80104a2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104a30:	31 ff                	xor    %edi,%edi
80104a32:	e9 47 ff ff ff       	jmp    8010497e <create+0x6e>
80104a37:	89 f6                	mov    %esi,%esi
80104a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104a40:	66 83 46 56 01       	addw   $0x1,0x56(%esi)
80104a45:	83 ec 0c             	sub    $0xc,%esp
80104a48:	56                   	push   %esi
80104a49:	e8 62 cb ff ff       	call   801015b0 <iupdate>
80104a4e:	83 c4 0c             	add    $0xc,%esp
80104a51:	ff 77 04             	pushl  0x4(%edi)
80104a54:	68 78 77 10 80       	push   $0x80107778
80104a59:	57                   	push   %edi
80104a5a:	e8 71 d3 ff ff       	call   80101dd0 <dirlink>
80104a5f:	83 c4 10             	add    $0x10,%esp
80104a62:	85 c0                	test   %eax,%eax
80104a64:	78 18                	js     80104a7e <create+0x16e>
80104a66:	83 ec 04             	sub    $0x4,%esp
80104a69:	ff 76 04             	pushl  0x4(%esi)
80104a6c:	68 77 77 10 80       	push   $0x80107777
80104a71:	57                   	push   %edi
80104a72:	e8 59 d3 ff ff       	call   80101dd0 <dirlink>
80104a77:	83 c4 10             	add    $0x10,%esp
80104a7a:	85 c0                	test   %eax,%eax
80104a7c:	79 82                	jns    80104a00 <create+0xf0>
80104a7e:	83 ec 0c             	sub    $0xc,%esp
80104a81:	68 6b 77 10 80       	push   $0x8010776b
80104a86:	e8 e5 b8 ff ff       	call   80100370 <panic>
80104a8b:	83 ec 0c             	sub    $0xc,%esp
80104a8e:	68 7a 77 10 80       	push   $0x8010777a
80104a93:	e8 d8 b8 ff ff       	call   80100370 <panic>
80104a98:	83 ec 0c             	sub    $0xc,%esp
80104a9b:	68 5c 77 10 80       	push   $0x8010775c
80104aa0:	e8 cb b8 ff ff       	call   80100370 <panic>
80104aa5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104aa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ab0 <argfd.constprop.0>:
80104ab0:	55                   	push   %ebp
80104ab1:	89 e5                	mov    %esp,%ebp
80104ab3:	56                   	push   %esi
80104ab4:	53                   	push   %ebx
80104ab5:	89 c6                	mov    %eax,%esi
80104ab7:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104aba:	89 d3                	mov    %edx,%ebx
80104abc:	83 ec 18             	sub    $0x18,%esp
80104abf:	50                   	push   %eax
80104ac0:	6a 00                	push   $0x0
80104ac2:	e8 b9 fc ff ff       	call   80104780 <argint>
80104ac7:	83 c4 10             	add    $0x10,%esp
80104aca:	85 c0                	test   %eax,%eax
80104acc:	78 3a                	js     80104b08 <argfd.constprop.0+0x58>
80104ace:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104ad1:	83 f8 0f             	cmp    $0xf,%eax
80104ad4:	77 32                	ja     80104b08 <argfd.constprop.0+0x58>
80104ad6:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104add:	8b 54 82 28          	mov    0x28(%edx,%eax,4),%edx
80104ae1:	85 d2                	test   %edx,%edx
80104ae3:	74 23                	je     80104b08 <argfd.constprop.0+0x58>
80104ae5:	85 f6                	test   %esi,%esi
80104ae7:	74 02                	je     80104aeb <argfd.constprop.0+0x3b>
80104ae9:	89 06                	mov    %eax,(%esi)
80104aeb:	85 db                	test   %ebx,%ebx
80104aed:	74 11                	je     80104b00 <argfd.constprop.0+0x50>
80104aef:	89 13                	mov    %edx,(%ebx)
80104af1:	31 c0                	xor    %eax,%eax
80104af3:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104af6:	5b                   	pop    %ebx
80104af7:	5e                   	pop    %esi
80104af8:	5d                   	pop    %ebp
80104af9:	c3                   	ret    
80104afa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104b00:	31 c0                	xor    %eax,%eax
80104b02:	eb ef                	jmp    80104af3 <argfd.constprop.0+0x43>
80104b04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104b08:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b0d:	eb e4                	jmp    80104af3 <argfd.constprop.0+0x43>
80104b0f:	90                   	nop

80104b10 <sys_dup>:
80104b10:	55                   	push   %ebp
80104b11:	31 c0                	xor    %eax,%eax
80104b13:	89 e5                	mov    %esp,%ebp
80104b15:	53                   	push   %ebx
80104b16:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104b19:	83 ec 14             	sub    $0x14,%esp
80104b1c:	e8 8f ff ff ff       	call   80104ab0 <argfd.constprop.0>
80104b21:	85 c0                	test   %eax,%eax
80104b23:	78 1b                	js     80104b40 <sys_dup+0x30>
80104b25:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104b28:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104b2e:	31 db                	xor    %ebx,%ebx
80104b30:	8b 4c 98 28          	mov    0x28(%eax,%ebx,4),%ecx
80104b34:	85 c9                	test   %ecx,%ecx
80104b36:	74 18                	je     80104b50 <sys_dup+0x40>
80104b38:	83 c3 01             	add    $0x1,%ebx
80104b3b:	83 fb 10             	cmp    $0x10,%ebx
80104b3e:	75 f0                	jne    80104b30 <sys_dup+0x20>
80104b40:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104b45:	89 d8                	mov    %ebx,%eax
80104b47:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b4a:	c9                   	leave  
80104b4b:	c3                   	ret    
80104b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104b50:	83 ec 0c             	sub    $0xc,%esp
80104b53:	89 54 98 28          	mov    %edx,0x28(%eax,%ebx,4)
80104b57:	52                   	push   %edx
80104b58:	e8 63 c2 ff ff       	call   80100dc0 <filedup>
80104b5d:	89 d8                	mov    %ebx,%eax
80104b5f:	83 c4 10             	add    $0x10,%esp
80104b62:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b65:	c9                   	leave  
80104b66:	c3                   	ret    
80104b67:	89 f6                	mov    %esi,%esi
80104b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b70 <sys_read>:
80104b70:	55                   	push   %ebp
80104b71:	31 c0                	xor    %eax,%eax
80104b73:	89 e5                	mov    %esp,%ebp
80104b75:	83 ec 18             	sub    $0x18,%esp
80104b78:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104b7b:	e8 30 ff ff ff       	call   80104ab0 <argfd.constprop.0>
80104b80:	85 c0                	test   %eax,%eax
80104b82:	78 4c                	js     80104bd0 <sys_read+0x60>
80104b84:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104b87:	83 ec 08             	sub    $0x8,%esp
80104b8a:	50                   	push   %eax
80104b8b:	6a 02                	push   $0x2
80104b8d:	e8 ee fb ff ff       	call   80104780 <argint>
80104b92:	83 c4 10             	add    $0x10,%esp
80104b95:	85 c0                	test   %eax,%eax
80104b97:	78 37                	js     80104bd0 <sys_read+0x60>
80104b99:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b9c:	83 ec 04             	sub    $0x4,%esp
80104b9f:	ff 75 f0             	pushl  -0x10(%ebp)
80104ba2:	50                   	push   %eax
80104ba3:	6a 01                	push   $0x1
80104ba5:	e8 16 fc ff ff       	call   801047c0 <argptr>
80104baa:	83 c4 10             	add    $0x10,%esp
80104bad:	85 c0                	test   %eax,%eax
80104baf:	78 1f                	js     80104bd0 <sys_read+0x60>
80104bb1:	83 ec 04             	sub    $0x4,%esp
80104bb4:	ff 75 f0             	pushl  -0x10(%ebp)
80104bb7:	ff 75 f4             	pushl  -0xc(%ebp)
80104bba:	ff 75 ec             	pushl  -0x14(%ebp)
80104bbd:	e8 6e c3 ff ff       	call   80100f30 <fileread>
80104bc2:	83 c4 10             	add    $0x10,%esp
80104bc5:	c9                   	leave  
80104bc6:	c3                   	ret    
80104bc7:	89 f6                	mov    %esi,%esi
80104bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104bd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104bd5:	c9                   	leave  
80104bd6:	c3                   	ret    
80104bd7:	89 f6                	mov    %esi,%esi
80104bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104be0 <sys_write>:
80104be0:	55                   	push   %ebp
80104be1:	31 c0                	xor    %eax,%eax
80104be3:	89 e5                	mov    %esp,%ebp
80104be5:	83 ec 18             	sub    $0x18,%esp
80104be8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104beb:	e8 c0 fe ff ff       	call   80104ab0 <argfd.constprop.0>
80104bf0:	85 c0                	test   %eax,%eax
80104bf2:	78 4c                	js     80104c40 <sys_write+0x60>
80104bf4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104bf7:	83 ec 08             	sub    $0x8,%esp
80104bfa:	50                   	push   %eax
80104bfb:	6a 02                	push   $0x2
80104bfd:	e8 7e fb ff ff       	call   80104780 <argint>
80104c02:	83 c4 10             	add    $0x10,%esp
80104c05:	85 c0                	test   %eax,%eax
80104c07:	78 37                	js     80104c40 <sys_write+0x60>
80104c09:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c0c:	83 ec 04             	sub    $0x4,%esp
80104c0f:	ff 75 f0             	pushl  -0x10(%ebp)
80104c12:	50                   	push   %eax
80104c13:	6a 01                	push   $0x1
80104c15:	e8 a6 fb ff ff       	call   801047c0 <argptr>
80104c1a:	83 c4 10             	add    $0x10,%esp
80104c1d:	85 c0                	test   %eax,%eax
80104c1f:	78 1f                	js     80104c40 <sys_write+0x60>
80104c21:	83 ec 04             	sub    $0x4,%esp
80104c24:	ff 75 f0             	pushl  -0x10(%ebp)
80104c27:	ff 75 f4             	pushl  -0xc(%ebp)
80104c2a:	ff 75 ec             	pushl  -0x14(%ebp)
80104c2d:	e8 8e c3 ff ff       	call   80100fc0 <filewrite>
80104c32:	83 c4 10             	add    $0x10,%esp
80104c35:	c9                   	leave  
80104c36:	c3                   	ret    
80104c37:	89 f6                	mov    %esi,%esi
80104c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104c40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c45:	c9                   	leave  
80104c46:	c3                   	ret    
80104c47:	89 f6                	mov    %esi,%esi
80104c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c50 <sys_close>:
80104c50:	55                   	push   %ebp
80104c51:	89 e5                	mov    %esp,%ebp
80104c53:	83 ec 18             	sub    $0x18,%esp
80104c56:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104c59:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c5c:	e8 4f fe ff ff       	call   80104ab0 <argfd.constprop.0>
80104c61:	85 c0                	test   %eax,%eax
80104c63:	78 2b                	js     80104c90 <sys_close+0x40>
80104c65:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104c68:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104c6e:	83 ec 0c             	sub    $0xc,%esp
80104c71:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104c78:	00 
80104c79:	ff 75 f4             	pushl  -0xc(%ebp)
80104c7c:	e8 8f c1 ff ff       	call   80100e10 <fileclose>
80104c81:	83 c4 10             	add    $0x10,%esp
80104c84:	31 c0                	xor    %eax,%eax
80104c86:	c9                   	leave  
80104c87:	c3                   	ret    
80104c88:	90                   	nop
80104c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104c90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c95:	c9                   	leave  
80104c96:	c3                   	ret    
80104c97:	89 f6                	mov    %esi,%esi
80104c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ca0 <sys_fstat>:
80104ca0:	55                   	push   %ebp
80104ca1:	31 c0                	xor    %eax,%eax
80104ca3:	89 e5                	mov    %esp,%ebp
80104ca5:	83 ec 18             	sub    $0x18,%esp
80104ca8:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104cab:	e8 00 fe ff ff       	call   80104ab0 <argfd.constprop.0>
80104cb0:	85 c0                	test   %eax,%eax
80104cb2:	78 2c                	js     80104ce0 <sys_fstat+0x40>
80104cb4:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104cb7:	83 ec 04             	sub    $0x4,%esp
80104cba:	6a 14                	push   $0x14
80104cbc:	50                   	push   %eax
80104cbd:	6a 01                	push   $0x1
80104cbf:	e8 fc fa ff ff       	call   801047c0 <argptr>
80104cc4:	83 c4 10             	add    $0x10,%esp
80104cc7:	85 c0                	test   %eax,%eax
80104cc9:	78 15                	js     80104ce0 <sys_fstat+0x40>
80104ccb:	83 ec 08             	sub    $0x8,%esp
80104cce:	ff 75 f4             	pushl  -0xc(%ebp)
80104cd1:	ff 75 f0             	pushl  -0x10(%ebp)
80104cd4:	e8 07 c2 ff ff       	call   80100ee0 <filestat>
80104cd9:	83 c4 10             	add    $0x10,%esp
80104cdc:	c9                   	leave  
80104cdd:	c3                   	ret    
80104cde:	66 90                	xchg   %ax,%ax
80104ce0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ce5:	c9                   	leave  
80104ce6:	c3                   	ret    
80104ce7:	89 f6                	mov    %esi,%esi
80104ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104cf0 <sys_link>:
80104cf0:	55                   	push   %ebp
80104cf1:	89 e5                	mov    %esp,%ebp
80104cf3:	57                   	push   %edi
80104cf4:	56                   	push   %esi
80104cf5:	53                   	push   %ebx
80104cf6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104cf9:	83 ec 34             	sub    $0x34,%esp
80104cfc:	50                   	push   %eax
80104cfd:	6a 00                	push   $0x0
80104cff:	e8 0c fb ff ff       	call   80104810 <argstr>
80104d04:	83 c4 10             	add    $0x10,%esp
80104d07:	85 c0                	test   %eax,%eax
80104d09:	0f 88 fb 00 00 00    	js     80104e0a <sys_link+0x11a>
80104d0f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104d12:	83 ec 08             	sub    $0x8,%esp
80104d15:	50                   	push   %eax
80104d16:	6a 01                	push   $0x1
80104d18:	e8 f3 fa ff ff       	call   80104810 <argstr>
80104d1d:	83 c4 10             	add    $0x10,%esp
80104d20:	85 c0                	test   %eax,%eax
80104d22:	0f 88 e2 00 00 00    	js     80104e0a <sys_link+0x11a>
80104d28:	e8 b3 de ff ff       	call   80102be0 <begin_op>
80104d2d:	83 ec 0c             	sub    $0xc,%esp
80104d30:	ff 75 d4             	pushl  -0x2c(%ebp)
80104d33:	e8 58 d1 ff ff       	call   80101e90 <namei>
80104d38:	83 c4 10             	add    $0x10,%esp
80104d3b:	85 c0                	test   %eax,%eax
80104d3d:	89 c3                	mov    %eax,%ebx
80104d3f:	0f 84 f3 00 00 00    	je     80104e38 <sys_link+0x148>
80104d45:	83 ec 0c             	sub    $0xc,%esp
80104d48:	50                   	push   %eax
80104d49:	e8 12 c9 ff ff       	call   80101660 <ilock>
80104d4e:	83 c4 10             	add    $0x10,%esp
80104d51:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104d56:	0f 84 c4 00 00 00    	je     80104e20 <sys_link+0x130>
80104d5c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104d61:	83 ec 0c             	sub    $0xc,%esp
80104d64:	8d 7d da             	lea    -0x26(%ebp),%edi
80104d67:	53                   	push   %ebx
80104d68:	e8 43 c8 ff ff       	call   801015b0 <iupdate>
80104d6d:	89 1c 24             	mov    %ebx,(%esp)
80104d70:	e8 cb c9 ff ff       	call   80101740 <iunlock>
80104d75:	58                   	pop    %eax
80104d76:	5a                   	pop    %edx
80104d77:	57                   	push   %edi
80104d78:	ff 75 d0             	pushl  -0x30(%ebp)
80104d7b:	e8 30 d1 ff ff       	call   80101eb0 <nameiparent>
80104d80:	83 c4 10             	add    $0x10,%esp
80104d83:	85 c0                	test   %eax,%eax
80104d85:	89 c6                	mov    %eax,%esi
80104d87:	74 5b                	je     80104de4 <sys_link+0xf4>
80104d89:	83 ec 0c             	sub    $0xc,%esp
80104d8c:	50                   	push   %eax
80104d8d:	e8 ce c8 ff ff       	call   80101660 <ilock>
80104d92:	83 c4 10             	add    $0x10,%esp
80104d95:	8b 03                	mov    (%ebx),%eax
80104d97:	39 06                	cmp    %eax,(%esi)
80104d99:	75 3d                	jne    80104dd8 <sys_link+0xe8>
80104d9b:	83 ec 04             	sub    $0x4,%esp
80104d9e:	ff 73 04             	pushl  0x4(%ebx)
80104da1:	57                   	push   %edi
80104da2:	56                   	push   %esi
80104da3:	e8 28 d0 ff ff       	call   80101dd0 <dirlink>
80104da8:	83 c4 10             	add    $0x10,%esp
80104dab:	85 c0                	test   %eax,%eax
80104dad:	78 29                	js     80104dd8 <sys_link+0xe8>
80104daf:	83 ec 0c             	sub    $0xc,%esp
80104db2:	56                   	push   %esi
80104db3:	e8 18 cb ff ff       	call   801018d0 <iunlockput>
80104db8:	89 1c 24             	mov    %ebx,(%esp)
80104dbb:	e8 d0 c9 ff ff       	call   80101790 <iput>
80104dc0:	e8 8b de ff ff       	call   80102c50 <end_op>
80104dc5:	83 c4 10             	add    $0x10,%esp
80104dc8:	31 c0                	xor    %eax,%eax
80104dca:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104dcd:	5b                   	pop    %ebx
80104dce:	5e                   	pop    %esi
80104dcf:	5f                   	pop    %edi
80104dd0:	5d                   	pop    %ebp
80104dd1:	c3                   	ret    
80104dd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104dd8:	83 ec 0c             	sub    $0xc,%esp
80104ddb:	56                   	push   %esi
80104ddc:	e8 ef ca ff ff       	call   801018d0 <iunlockput>
80104de1:	83 c4 10             	add    $0x10,%esp
80104de4:	83 ec 0c             	sub    $0xc,%esp
80104de7:	53                   	push   %ebx
80104de8:	e8 73 c8 ff ff       	call   80101660 <ilock>
80104ded:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104df2:	89 1c 24             	mov    %ebx,(%esp)
80104df5:	e8 b6 c7 ff ff       	call   801015b0 <iupdate>
80104dfa:	89 1c 24             	mov    %ebx,(%esp)
80104dfd:	e8 ce ca ff ff       	call   801018d0 <iunlockput>
80104e02:	e8 49 de ff ff       	call   80102c50 <end_op>
80104e07:	83 c4 10             	add    $0x10,%esp
80104e0a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104e0d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e12:	5b                   	pop    %ebx
80104e13:	5e                   	pop    %esi
80104e14:	5f                   	pop    %edi
80104e15:	5d                   	pop    %ebp
80104e16:	c3                   	ret    
80104e17:	89 f6                	mov    %esi,%esi
80104e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104e20:	83 ec 0c             	sub    $0xc,%esp
80104e23:	53                   	push   %ebx
80104e24:	e8 a7 ca ff ff       	call   801018d0 <iunlockput>
80104e29:	e8 22 de ff ff       	call   80102c50 <end_op>
80104e2e:	83 c4 10             	add    $0x10,%esp
80104e31:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e36:	eb 92                	jmp    80104dca <sys_link+0xda>
80104e38:	e8 13 de ff ff       	call   80102c50 <end_op>
80104e3d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e42:	eb 86                	jmp    80104dca <sys_link+0xda>
80104e44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104e4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104e50 <sys_unlink>:
80104e50:	55                   	push   %ebp
80104e51:	89 e5                	mov    %esp,%ebp
80104e53:	57                   	push   %edi
80104e54:	56                   	push   %esi
80104e55:	53                   	push   %ebx
80104e56:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104e59:	83 ec 54             	sub    $0x54,%esp
80104e5c:	50                   	push   %eax
80104e5d:	6a 00                	push   $0x0
80104e5f:	e8 ac f9 ff ff       	call   80104810 <argstr>
80104e64:	83 c4 10             	add    $0x10,%esp
80104e67:	85 c0                	test   %eax,%eax
80104e69:	0f 88 82 01 00 00    	js     80104ff1 <sys_unlink+0x1a1>
80104e6f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80104e72:	e8 69 dd ff ff       	call   80102be0 <begin_op>
80104e77:	83 ec 08             	sub    $0x8,%esp
80104e7a:	53                   	push   %ebx
80104e7b:	ff 75 c0             	pushl  -0x40(%ebp)
80104e7e:	e8 2d d0 ff ff       	call   80101eb0 <nameiparent>
80104e83:	83 c4 10             	add    $0x10,%esp
80104e86:	85 c0                	test   %eax,%eax
80104e88:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80104e8b:	0f 84 6a 01 00 00    	je     80104ffb <sys_unlink+0x1ab>
80104e91:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80104e94:	83 ec 0c             	sub    $0xc,%esp
80104e97:	56                   	push   %esi
80104e98:	e8 c3 c7 ff ff       	call   80101660 <ilock>
80104e9d:	58                   	pop    %eax
80104e9e:	5a                   	pop    %edx
80104e9f:	68 78 77 10 80       	push   $0x80107778
80104ea4:	53                   	push   %ebx
80104ea5:	e8 a6 cc ff ff       	call   80101b50 <namecmp>
80104eaa:	83 c4 10             	add    $0x10,%esp
80104ead:	85 c0                	test   %eax,%eax
80104eaf:	0f 84 fc 00 00 00    	je     80104fb1 <sys_unlink+0x161>
80104eb5:	83 ec 08             	sub    $0x8,%esp
80104eb8:	68 77 77 10 80       	push   $0x80107777
80104ebd:	53                   	push   %ebx
80104ebe:	e8 8d cc ff ff       	call   80101b50 <namecmp>
80104ec3:	83 c4 10             	add    $0x10,%esp
80104ec6:	85 c0                	test   %eax,%eax
80104ec8:	0f 84 e3 00 00 00    	je     80104fb1 <sys_unlink+0x161>
80104ece:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104ed1:	83 ec 04             	sub    $0x4,%esp
80104ed4:	50                   	push   %eax
80104ed5:	53                   	push   %ebx
80104ed6:	56                   	push   %esi
80104ed7:	e8 94 cc ff ff       	call   80101b70 <dirlookup>
80104edc:	83 c4 10             	add    $0x10,%esp
80104edf:	85 c0                	test   %eax,%eax
80104ee1:	89 c3                	mov    %eax,%ebx
80104ee3:	0f 84 c8 00 00 00    	je     80104fb1 <sys_unlink+0x161>
80104ee9:	83 ec 0c             	sub    $0xc,%esp
80104eec:	50                   	push   %eax
80104eed:	e8 6e c7 ff ff       	call   80101660 <ilock>
80104ef2:	83 c4 10             	add    $0x10,%esp
80104ef5:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104efa:	0f 8e 24 01 00 00    	jle    80105024 <sys_unlink+0x1d4>
80104f00:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f05:	8d 75 d8             	lea    -0x28(%ebp),%esi
80104f08:	74 66                	je     80104f70 <sys_unlink+0x120>
80104f0a:	83 ec 04             	sub    $0x4,%esp
80104f0d:	6a 10                	push   $0x10
80104f0f:	6a 00                	push   $0x0
80104f11:	56                   	push   %esi
80104f12:	e8 99 f5 ff ff       	call   801044b0 <memset>
80104f17:	6a 10                	push   $0x10
80104f19:	ff 75 c4             	pushl  -0x3c(%ebp)
80104f1c:	56                   	push   %esi
80104f1d:	ff 75 b4             	pushl  -0x4c(%ebp)
80104f20:	e8 fb ca ff ff       	call   80101a20 <writei>
80104f25:	83 c4 20             	add    $0x20,%esp
80104f28:	83 f8 10             	cmp    $0x10,%eax
80104f2b:	0f 85 e6 00 00 00    	jne    80105017 <sys_unlink+0x1c7>
80104f31:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f36:	0f 84 9c 00 00 00    	je     80104fd8 <sys_unlink+0x188>
80104f3c:	83 ec 0c             	sub    $0xc,%esp
80104f3f:	ff 75 b4             	pushl  -0x4c(%ebp)
80104f42:	e8 89 c9 ff ff       	call   801018d0 <iunlockput>
80104f47:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104f4c:	89 1c 24             	mov    %ebx,(%esp)
80104f4f:	e8 5c c6 ff ff       	call   801015b0 <iupdate>
80104f54:	89 1c 24             	mov    %ebx,(%esp)
80104f57:	e8 74 c9 ff ff       	call   801018d0 <iunlockput>
80104f5c:	e8 ef dc ff ff       	call   80102c50 <end_op>
80104f61:	83 c4 10             	add    $0x10,%esp
80104f64:	31 c0                	xor    %eax,%eax
80104f66:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f69:	5b                   	pop    %ebx
80104f6a:	5e                   	pop    %esi
80104f6b:	5f                   	pop    %edi
80104f6c:	5d                   	pop    %ebp
80104f6d:	c3                   	ret    
80104f6e:	66 90                	xchg   %ax,%ax
80104f70:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80104f74:	76 94                	jbe    80104f0a <sys_unlink+0xba>
80104f76:	bf 20 00 00 00       	mov    $0x20,%edi
80104f7b:	eb 0f                	jmp    80104f8c <sys_unlink+0x13c>
80104f7d:	8d 76 00             	lea    0x0(%esi),%esi
80104f80:	83 c7 10             	add    $0x10,%edi
80104f83:	3b 7b 58             	cmp    0x58(%ebx),%edi
80104f86:	0f 83 7e ff ff ff    	jae    80104f0a <sys_unlink+0xba>
80104f8c:	6a 10                	push   $0x10
80104f8e:	57                   	push   %edi
80104f8f:	56                   	push   %esi
80104f90:	53                   	push   %ebx
80104f91:	e8 8a c9 ff ff       	call   80101920 <readi>
80104f96:	83 c4 10             	add    $0x10,%esp
80104f99:	83 f8 10             	cmp    $0x10,%eax
80104f9c:	75 6c                	jne    8010500a <sys_unlink+0x1ba>
80104f9e:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80104fa3:	74 db                	je     80104f80 <sys_unlink+0x130>
80104fa5:	83 ec 0c             	sub    $0xc,%esp
80104fa8:	53                   	push   %ebx
80104fa9:	e8 22 c9 ff ff       	call   801018d0 <iunlockput>
80104fae:	83 c4 10             	add    $0x10,%esp
80104fb1:	83 ec 0c             	sub    $0xc,%esp
80104fb4:	ff 75 b4             	pushl  -0x4c(%ebp)
80104fb7:	e8 14 c9 ff ff       	call   801018d0 <iunlockput>
80104fbc:	e8 8f dc ff ff       	call   80102c50 <end_op>
80104fc1:	83 c4 10             	add    $0x10,%esp
80104fc4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104fc7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fcc:	5b                   	pop    %ebx
80104fcd:	5e                   	pop    %esi
80104fce:	5f                   	pop    %edi
80104fcf:	5d                   	pop    %ebp
80104fd0:	c3                   	ret    
80104fd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104fd8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104fdb:	83 ec 0c             	sub    $0xc,%esp
80104fde:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
80104fe3:	50                   	push   %eax
80104fe4:	e8 c7 c5 ff ff       	call   801015b0 <iupdate>
80104fe9:	83 c4 10             	add    $0x10,%esp
80104fec:	e9 4b ff ff ff       	jmp    80104f3c <sys_unlink+0xec>
80104ff1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ff6:	e9 6b ff ff ff       	jmp    80104f66 <sys_unlink+0x116>
80104ffb:	e8 50 dc ff ff       	call   80102c50 <end_op>
80105000:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105005:	e9 5c ff ff ff       	jmp    80104f66 <sys_unlink+0x116>
8010500a:	83 ec 0c             	sub    $0xc,%esp
8010500d:	68 9c 77 10 80       	push   $0x8010779c
80105012:	e8 59 b3 ff ff       	call   80100370 <panic>
80105017:	83 ec 0c             	sub    $0xc,%esp
8010501a:	68 ae 77 10 80       	push   $0x801077ae
8010501f:	e8 4c b3 ff ff       	call   80100370 <panic>
80105024:	83 ec 0c             	sub    $0xc,%esp
80105027:	68 8a 77 10 80       	push   $0x8010778a
8010502c:	e8 3f b3 ff ff       	call   80100370 <panic>
80105031:	eb 0d                	jmp    80105040 <sys_open>
80105033:	90                   	nop
80105034:	90                   	nop
80105035:	90                   	nop
80105036:	90                   	nop
80105037:	90                   	nop
80105038:	90                   	nop
80105039:	90                   	nop
8010503a:	90                   	nop
8010503b:	90                   	nop
8010503c:	90                   	nop
8010503d:	90                   	nop
8010503e:	90                   	nop
8010503f:	90                   	nop

80105040 <sys_open>:
80105040:	55                   	push   %ebp
80105041:	89 e5                	mov    %esp,%ebp
80105043:	57                   	push   %edi
80105044:	56                   	push   %esi
80105045:	53                   	push   %ebx
80105046:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105049:	83 ec 24             	sub    $0x24,%esp
8010504c:	50                   	push   %eax
8010504d:	6a 00                	push   $0x0
8010504f:	e8 bc f7 ff ff       	call   80104810 <argstr>
80105054:	83 c4 10             	add    $0x10,%esp
80105057:	85 c0                	test   %eax,%eax
80105059:	0f 88 9e 00 00 00    	js     801050fd <sys_open+0xbd>
8010505f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105062:	83 ec 08             	sub    $0x8,%esp
80105065:	50                   	push   %eax
80105066:	6a 01                	push   $0x1
80105068:	e8 13 f7 ff ff       	call   80104780 <argint>
8010506d:	83 c4 10             	add    $0x10,%esp
80105070:	85 c0                	test   %eax,%eax
80105072:	0f 88 85 00 00 00    	js     801050fd <sys_open+0xbd>
80105078:	e8 63 db ff ff       	call   80102be0 <begin_op>
8010507d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105081:	0f 85 89 00 00 00    	jne    80105110 <sys_open+0xd0>
80105087:	83 ec 0c             	sub    $0xc,%esp
8010508a:	ff 75 e0             	pushl  -0x20(%ebp)
8010508d:	e8 fe cd ff ff       	call   80101e90 <namei>
80105092:	83 c4 10             	add    $0x10,%esp
80105095:	85 c0                	test   %eax,%eax
80105097:	89 c7                	mov    %eax,%edi
80105099:	0f 84 8e 00 00 00    	je     8010512d <sys_open+0xed>
8010509f:	83 ec 0c             	sub    $0xc,%esp
801050a2:	50                   	push   %eax
801050a3:	e8 b8 c5 ff ff       	call   80101660 <ilock>
801050a8:	83 c4 10             	add    $0x10,%esp
801050ab:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
801050b0:	0f 84 d2 00 00 00    	je     80105188 <sys_open+0x148>
801050b6:	e8 95 bc ff ff       	call   80100d50 <filealloc>
801050bb:	85 c0                	test   %eax,%eax
801050bd:	89 c6                	mov    %eax,%esi
801050bf:	74 2b                	je     801050ec <sys_open+0xac>
801050c1:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801050c8:	31 db                	xor    %ebx,%ebx
801050ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801050d0:	8b 44 9a 28          	mov    0x28(%edx,%ebx,4),%eax
801050d4:	85 c0                	test   %eax,%eax
801050d6:	74 68                	je     80105140 <sys_open+0x100>
801050d8:	83 c3 01             	add    $0x1,%ebx
801050db:	83 fb 10             	cmp    $0x10,%ebx
801050de:	75 f0                	jne    801050d0 <sys_open+0x90>
801050e0:	83 ec 0c             	sub    $0xc,%esp
801050e3:	56                   	push   %esi
801050e4:	e8 27 bd ff ff       	call   80100e10 <fileclose>
801050e9:	83 c4 10             	add    $0x10,%esp
801050ec:	83 ec 0c             	sub    $0xc,%esp
801050ef:	57                   	push   %edi
801050f0:	e8 db c7 ff ff       	call   801018d0 <iunlockput>
801050f5:	e8 56 db ff ff       	call   80102c50 <end_op>
801050fa:	83 c4 10             	add    $0x10,%esp
801050fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105100:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105105:	89 d8                	mov    %ebx,%eax
80105107:	5b                   	pop    %ebx
80105108:	5e                   	pop    %esi
80105109:	5f                   	pop    %edi
8010510a:	5d                   	pop    %ebp
8010510b:	c3                   	ret    
8010510c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105110:	83 ec 0c             	sub    $0xc,%esp
80105113:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105116:	31 c9                	xor    %ecx,%ecx
80105118:	6a 00                	push   $0x0
8010511a:	ba 02 00 00 00       	mov    $0x2,%edx
8010511f:	e8 ec f7 ff ff       	call   80104910 <create>
80105124:	83 c4 10             	add    $0x10,%esp
80105127:	85 c0                	test   %eax,%eax
80105129:	89 c7                	mov    %eax,%edi
8010512b:	75 89                	jne    801050b6 <sys_open+0x76>
8010512d:	e8 1e db ff ff       	call   80102c50 <end_op>
80105132:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105137:	eb 40                	jmp    80105179 <sys_open+0x139>
80105139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105140:	83 ec 0c             	sub    $0xc,%esp
80105143:	89 74 9a 28          	mov    %esi,0x28(%edx,%ebx,4)
80105147:	57                   	push   %edi
80105148:	e8 f3 c5 ff ff       	call   80101740 <iunlock>
8010514d:	e8 fe da ff ff       	call   80102c50 <end_op>
80105152:	c7 06 02 00 00 00    	movl   $0x2,(%esi)
80105158:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010515b:	83 c4 10             	add    $0x10,%esp
8010515e:	89 7e 10             	mov    %edi,0x10(%esi)
80105161:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
80105168:	89 c2                	mov    %eax,%edx
8010516a:	f7 d2                	not    %edx
8010516c:	88 56 08             	mov    %dl,0x8(%esi)
8010516f:	80 66 08 01          	andb   $0x1,0x8(%esi)
80105173:	a8 03                	test   $0x3,%al
80105175:	0f 95 46 09          	setne  0x9(%esi)
80105179:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010517c:	89 d8                	mov    %ebx,%eax
8010517e:	5b                   	pop    %ebx
8010517f:	5e                   	pop    %esi
80105180:	5f                   	pop    %edi
80105181:	5d                   	pop    %ebp
80105182:	c3                   	ret    
80105183:	90                   	nop
80105184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105188:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010518b:	85 d2                	test   %edx,%edx
8010518d:	0f 84 23 ff ff ff    	je     801050b6 <sys_open+0x76>
80105193:	e9 54 ff ff ff       	jmp    801050ec <sys_open+0xac>
80105198:	90                   	nop
80105199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801051a0 <sys_mkdir>:
801051a0:	55                   	push   %ebp
801051a1:	89 e5                	mov    %esp,%ebp
801051a3:	83 ec 18             	sub    $0x18,%esp
801051a6:	e8 35 da ff ff       	call   80102be0 <begin_op>
801051ab:	8d 45 f4             	lea    -0xc(%ebp),%eax
801051ae:	83 ec 08             	sub    $0x8,%esp
801051b1:	50                   	push   %eax
801051b2:	6a 00                	push   $0x0
801051b4:	e8 57 f6 ff ff       	call   80104810 <argstr>
801051b9:	83 c4 10             	add    $0x10,%esp
801051bc:	85 c0                	test   %eax,%eax
801051be:	78 30                	js     801051f0 <sys_mkdir+0x50>
801051c0:	83 ec 0c             	sub    $0xc,%esp
801051c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801051c6:	31 c9                	xor    %ecx,%ecx
801051c8:	6a 00                	push   $0x0
801051ca:	ba 01 00 00 00       	mov    $0x1,%edx
801051cf:	e8 3c f7 ff ff       	call   80104910 <create>
801051d4:	83 c4 10             	add    $0x10,%esp
801051d7:	85 c0                	test   %eax,%eax
801051d9:	74 15                	je     801051f0 <sys_mkdir+0x50>
801051db:	83 ec 0c             	sub    $0xc,%esp
801051de:	50                   	push   %eax
801051df:	e8 ec c6 ff ff       	call   801018d0 <iunlockput>
801051e4:	e8 67 da ff ff       	call   80102c50 <end_op>
801051e9:	83 c4 10             	add    $0x10,%esp
801051ec:	31 c0                	xor    %eax,%eax
801051ee:	c9                   	leave  
801051ef:	c3                   	ret    
801051f0:	e8 5b da ff ff       	call   80102c50 <end_op>
801051f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051fa:	c9                   	leave  
801051fb:	c3                   	ret    
801051fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105200 <sys_mknod>:
80105200:	55                   	push   %ebp
80105201:	89 e5                	mov    %esp,%ebp
80105203:	83 ec 18             	sub    $0x18,%esp
80105206:	e8 d5 d9 ff ff       	call   80102be0 <begin_op>
8010520b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010520e:	83 ec 08             	sub    $0x8,%esp
80105211:	50                   	push   %eax
80105212:	6a 00                	push   $0x0
80105214:	e8 f7 f5 ff ff       	call   80104810 <argstr>
80105219:	83 c4 10             	add    $0x10,%esp
8010521c:	85 c0                	test   %eax,%eax
8010521e:	78 60                	js     80105280 <sys_mknod+0x80>
80105220:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105223:	83 ec 08             	sub    $0x8,%esp
80105226:	50                   	push   %eax
80105227:	6a 01                	push   $0x1
80105229:	e8 52 f5 ff ff       	call   80104780 <argint>
8010522e:	83 c4 10             	add    $0x10,%esp
80105231:	85 c0                	test   %eax,%eax
80105233:	78 4b                	js     80105280 <sys_mknod+0x80>
80105235:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105238:	83 ec 08             	sub    $0x8,%esp
8010523b:	50                   	push   %eax
8010523c:	6a 02                	push   $0x2
8010523e:	e8 3d f5 ff ff       	call   80104780 <argint>
80105243:	83 c4 10             	add    $0x10,%esp
80105246:	85 c0                	test   %eax,%eax
80105248:	78 36                	js     80105280 <sys_mknod+0x80>
8010524a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
8010524e:	83 ec 0c             	sub    $0xc,%esp
80105251:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80105255:	ba 03 00 00 00       	mov    $0x3,%edx
8010525a:	50                   	push   %eax
8010525b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010525e:	e8 ad f6 ff ff       	call   80104910 <create>
80105263:	83 c4 10             	add    $0x10,%esp
80105266:	85 c0                	test   %eax,%eax
80105268:	74 16                	je     80105280 <sys_mknod+0x80>
8010526a:	83 ec 0c             	sub    $0xc,%esp
8010526d:	50                   	push   %eax
8010526e:	e8 5d c6 ff ff       	call   801018d0 <iunlockput>
80105273:	e8 d8 d9 ff ff       	call   80102c50 <end_op>
80105278:	83 c4 10             	add    $0x10,%esp
8010527b:	31 c0                	xor    %eax,%eax
8010527d:	c9                   	leave  
8010527e:	c3                   	ret    
8010527f:	90                   	nop
80105280:	e8 cb d9 ff ff       	call   80102c50 <end_op>
80105285:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010528a:	c9                   	leave  
8010528b:	c3                   	ret    
8010528c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105290 <sys_chdir>:
80105290:	55                   	push   %ebp
80105291:	89 e5                	mov    %esp,%ebp
80105293:	53                   	push   %ebx
80105294:	83 ec 14             	sub    $0x14,%esp
80105297:	e8 44 d9 ff ff       	call   80102be0 <begin_op>
8010529c:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010529f:	83 ec 08             	sub    $0x8,%esp
801052a2:	50                   	push   %eax
801052a3:	6a 00                	push   $0x0
801052a5:	e8 66 f5 ff ff       	call   80104810 <argstr>
801052aa:	83 c4 10             	add    $0x10,%esp
801052ad:	85 c0                	test   %eax,%eax
801052af:	78 7f                	js     80105330 <sys_chdir+0xa0>
801052b1:	83 ec 0c             	sub    $0xc,%esp
801052b4:	ff 75 f4             	pushl  -0xc(%ebp)
801052b7:	e8 d4 cb ff ff       	call   80101e90 <namei>
801052bc:	83 c4 10             	add    $0x10,%esp
801052bf:	85 c0                	test   %eax,%eax
801052c1:	89 c3                	mov    %eax,%ebx
801052c3:	74 6b                	je     80105330 <sys_chdir+0xa0>
801052c5:	83 ec 0c             	sub    $0xc,%esp
801052c8:	50                   	push   %eax
801052c9:	e8 92 c3 ff ff       	call   80101660 <ilock>
801052ce:	83 c4 10             	add    $0x10,%esp
801052d1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801052d6:	75 38                	jne    80105310 <sys_chdir+0x80>
801052d8:	83 ec 0c             	sub    $0xc,%esp
801052db:	53                   	push   %ebx
801052dc:	e8 5f c4 ff ff       	call   80101740 <iunlock>
801052e1:	58                   	pop    %eax
801052e2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801052e8:	ff 70 68             	pushl  0x68(%eax)
801052eb:	e8 a0 c4 ff ff       	call   80101790 <iput>
801052f0:	e8 5b d9 ff ff       	call   80102c50 <end_op>
801052f5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801052fb:	83 c4 10             	add    $0x10,%esp
801052fe:	89 58 68             	mov    %ebx,0x68(%eax)
80105301:	31 c0                	xor    %eax,%eax
80105303:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105306:	c9                   	leave  
80105307:	c3                   	ret    
80105308:	90                   	nop
80105309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105310:	83 ec 0c             	sub    $0xc,%esp
80105313:	53                   	push   %ebx
80105314:	e8 b7 c5 ff ff       	call   801018d0 <iunlockput>
80105319:	e8 32 d9 ff ff       	call   80102c50 <end_op>
8010531e:	83 c4 10             	add    $0x10,%esp
80105321:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105326:	eb db                	jmp    80105303 <sys_chdir+0x73>
80105328:	90                   	nop
80105329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105330:	e8 1b d9 ff ff       	call   80102c50 <end_op>
80105335:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010533a:	eb c7                	jmp    80105303 <sys_chdir+0x73>
8010533c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105340 <sys_exec>:
80105340:	55                   	push   %ebp
80105341:	89 e5                	mov    %esp,%ebp
80105343:	57                   	push   %edi
80105344:	56                   	push   %esi
80105345:	53                   	push   %ebx
80105346:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
8010534c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
80105352:	50                   	push   %eax
80105353:	6a 00                	push   $0x0
80105355:	e8 b6 f4 ff ff       	call   80104810 <argstr>
8010535a:	83 c4 10             	add    $0x10,%esp
8010535d:	85 c0                	test   %eax,%eax
8010535f:	78 7f                	js     801053e0 <sys_exec+0xa0>
80105361:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80105367:	83 ec 08             	sub    $0x8,%esp
8010536a:	50                   	push   %eax
8010536b:	6a 01                	push   $0x1
8010536d:	e8 0e f4 ff ff       	call   80104780 <argint>
80105372:	83 c4 10             	add    $0x10,%esp
80105375:	85 c0                	test   %eax,%eax
80105377:	78 67                	js     801053e0 <sys_exec+0xa0>
80105379:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
8010537f:	83 ec 04             	sub    $0x4,%esp
80105382:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105388:	68 80 00 00 00       	push   $0x80
8010538d:	6a 00                	push   $0x0
8010538f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105395:	50                   	push   %eax
80105396:	31 db                	xor    %ebx,%ebx
80105398:	e8 13 f1 ff ff       	call   801044b0 <memset>
8010539d:	83 c4 10             	add    $0x10,%esp
801053a0:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
801053a6:	83 ec 08             	sub    $0x8,%esp
801053a9:	57                   	push   %edi
801053aa:	8d 04 98             	lea    (%eax,%ebx,4),%eax
801053ad:	50                   	push   %eax
801053ae:	e8 4d f3 ff ff       	call   80104700 <fetchint>
801053b3:	83 c4 10             	add    $0x10,%esp
801053b6:	85 c0                	test   %eax,%eax
801053b8:	78 26                	js     801053e0 <sys_exec+0xa0>
801053ba:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
801053c0:	85 c0                	test   %eax,%eax
801053c2:	74 2c                	je     801053f0 <sys_exec+0xb0>
801053c4:	83 ec 08             	sub    $0x8,%esp
801053c7:	56                   	push   %esi
801053c8:	50                   	push   %eax
801053c9:	e8 62 f3 ff ff       	call   80104730 <fetchstr>
801053ce:	83 c4 10             	add    $0x10,%esp
801053d1:	85 c0                	test   %eax,%eax
801053d3:	78 0b                	js     801053e0 <sys_exec+0xa0>
801053d5:	83 c3 01             	add    $0x1,%ebx
801053d8:	83 c6 04             	add    $0x4,%esi
801053db:	83 fb 20             	cmp    $0x20,%ebx
801053de:	75 c0                	jne    801053a0 <sys_exec+0x60>
801053e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801053e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053e8:	5b                   	pop    %ebx
801053e9:	5e                   	pop    %esi
801053ea:	5f                   	pop    %edi
801053eb:	5d                   	pop    %ebp
801053ec:	c3                   	ret    
801053ed:	8d 76 00             	lea    0x0(%esi),%esi
801053f0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801053f6:	83 ec 08             	sub    $0x8,%esp
801053f9:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105400:	00 00 00 00 
80105404:	50                   	push   %eax
80105405:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010540b:	e8 d0 b5 ff ff       	call   801009e0 <exec>
80105410:	83 c4 10             	add    $0x10,%esp
80105413:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105416:	5b                   	pop    %ebx
80105417:	5e                   	pop    %esi
80105418:	5f                   	pop    %edi
80105419:	5d                   	pop    %ebp
8010541a:	c3                   	ret    
8010541b:	90                   	nop
8010541c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105420 <sys_pipe>:
80105420:	55                   	push   %ebp
80105421:	89 e5                	mov    %esp,%ebp
80105423:	57                   	push   %edi
80105424:	56                   	push   %esi
80105425:	53                   	push   %ebx
80105426:	8d 45 dc             	lea    -0x24(%ebp),%eax
80105429:	83 ec 20             	sub    $0x20,%esp
8010542c:	6a 08                	push   $0x8
8010542e:	50                   	push   %eax
8010542f:	6a 00                	push   $0x0
80105431:	e8 8a f3 ff ff       	call   801047c0 <argptr>
80105436:	83 c4 10             	add    $0x10,%esp
80105439:	85 c0                	test   %eax,%eax
8010543b:	78 48                	js     80105485 <sys_pipe+0x65>
8010543d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105440:	83 ec 08             	sub    $0x8,%esp
80105443:	50                   	push   %eax
80105444:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105447:	50                   	push   %eax
80105448:	e8 23 df ff ff       	call   80103370 <pipealloc>
8010544d:	83 c4 10             	add    $0x10,%esp
80105450:	85 c0                	test   %eax,%eax
80105452:	78 31                	js     80105485 <sys_pipe+0x65>
80105454:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80105457:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
8010545e:	31 c0                	xor    %eax,%eax
80105460:	8b 54 81 28          	mov    0x28(%ecx,%eax,4),%edx
80105464:	85 d2                	test   %edx,%edx
80105466:	74 28                	je     80105490 <sys_pipe+0x70>
80105468:	83 c0 01             	add    $0x1,%eax
8010546b:	83 f8 10             	cmp    $0x10,%eax
8010546e:	75 f0                	jne    80105460 <sys_pipe+0x40>
80105470:	83 ec 0c             	sub    $0xc,%esp
80105473:	53                   	push   %ebx
80105474:	e8 97 b9 ff ff       	call   80100e10 <fileclose>
80105479:	58                   	pop    %eax
8010547a:	ff 75 e4             	pushl  -0x1c(%ebp)
8010547d:	e8 8e b9 ff ff       	call   80100e10 <fileclose>
80105482:	83 c4 10             	add    $0x10,%esp
80105485:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010548a:	eb 45                	jmp    801054d1 <sys_pipe+0xb1>
8010548c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105490:	8d 34 81             	lea    (%ecx,%eax,4),%esi
80105493:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80105496:	31 d2                	xor    %edx,%edx
80105498:	89 5e 28             	mov    %ebx,0x28(%esi)
8010549b:	90                   	nop
8010549c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801054a0:	83 7c 91 28 00       	cmpl   $0x0,0x28(%ecx,%edx,4)
801054a5:	74 19                	je     801054c0 <sys_pipe+0xa0>
801054a7:	83 c2 01             	add    $0x1,%edx
801054aa:	83 fa 10             	cmp    $0x10,%edx
801054ad:	75 f1                	jne    801054a0 <sys_pipe+0x80>
801054af:	c7 46 28 00 00 00 00 	movl   $0x0,0x28(%esi)
801054b6:	eb b8                	jmp    80105470 <sys_pipe+0x50>
801054b8:	90                   	nop
801054b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801054c0:	89 7c 91 28          	mov    %edi,0x28(%ecx,%edx,4)
801054c4:	8b 4d dc             	mov    -0x24(%ebp),%ecx
801054c7:	89 01                	mov    %eax,(%ecx)
801054c9:	8b 45 dc             	mov    -0x24(%ebp),%eax
801054cc:	89 50 04             	mov    %edx,0x4(%eax)
801054cf:	31 c0                	xor    %eax,%eax
801054d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801054d4:	5b                   	pop    %ebx
801054d5:	5e                   	pop    %esi
801054d6:	5f                   	pop    %edi
801054d7:	5d                   	pop    %ebp
801054d8:	c3                   	ret    
801054d9:	66 90                	xchg   %ax,%ax
801054db:	66 90                	xchg   %ax,%ax
801054dd:	66 90                	xchg   %ax,%ax
801054df:	90                   	nop

801054e0 <sys_fork>:
801054e0:	55                   	push   %ebp
801054e1:	89 e5                	mov    %esp,%ebp
801054e3:	5d                   	pop    %ebp
801054e4:	e9 07 e5 ff ff       	jmp    801039f0 <fork>
801054e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801054f0 <sys_exit>:
801054f0:	55                   	push   %ebp
801054f1:	89 e5                	mov    %esp,%ebp
801054f3:	83 ec 08             	sub    $0x8,%esp
801054f6:	e8 65 e7 ff ff       	call   80103c60 <exit>
801054fb:	31 c0                	xor    %eax,%eax
801054fd:	c9                   	leave  
801054fe:	c3                   	ret    
801054ff:	90                   	nop

80105500 <sys_wait>:
80105500:	55                   	push   %ebp
80105501:	89 e5                	mov    %esp,%ebp
80105503:	5d                   	pop    %ebp
80105504:	e9 a7 e9 ff ff       	jmp    80103eb0 <wait>
80105509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105510 <sys_kill>:
80105510:	55                   	push   %ebp
80105511:	89 e5                	mov    %esp,%ebp
80105513:	83 ec 20             	sub    $0x20,%esp
80105516:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105519:	50                   	push   %eax
8010551a:	6a 00                	push   $0x0
8010551c:	e8 5f f2 ff ff       	call   80104780 <argint>
80105521:	83 c4 10             	add    $0x10,%esp
80105524:	85 c0                	test   %eax,%eax
80105526:	78 18                	js     80105540 <sys_kill+0x30>
80105528:	83 ec 0c             	sub    $0xc,%esp
8010552b:	ff 75 f4             	pushl  -0xc(%ebp)
8010552e:	e8 cd ea ff ff       	call   80104000 <kill>
80105533:	83 c4 10             	add    $0x10,%esp
80105536:	c9                   	leave  
80105537:	c3                   	ret    
80105538:	90                   	nop
80105539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105540:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105545:	c9                   	leave  
80105546:	c3                   	ret    
80105547:	89 f6                	mov    %esi,%esi
80105549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105550 <sys_getpid>:
80105550:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105556:	55                   	push   %ebp
80105557:	89 e5                	mov    %esp,%ebp
80105559:	8b 40 10             	mov    0x10(%eax),%eax
8010555c:	5d                   	pop    %ebp
8010555d:	c3                   	ret    
8010555e:	66 90                	xchg   %ax,%ax

80105560 <sys_sbrk>:
80105560:	55                   	push   %ebp
80105561:	89 e5                	mov    %esp,%ebp
80105563:	53                   	push   %ebx
80105564:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105567:	83 ec 1c             	sub    $0x1c,%esp
8010556a:	50                   	push   %eax
8010556b:	6a 00                	push   $0x0
8010556d:	e8 0e f2 ff ff       	call   80104780 <argint>
80105572:	83 c4 10             	add    $0x10,%esp
80105575:	85 c0                	test   %eax,%eax
80105577:	78 27                	js     801055a0 <sys_sbrk+0x40>
80105579:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010557f:	83 ec 0c             	sub    $0xc,%esp
80105582:	8b 18                	mov    (%eax),%ebx
80105584:	ff 75 f4             	pushl  -0xc(%ebp)
80105587:	e8 f4 e3 ff ff       	call   80103980 <growproc>
8010558c:	83 c4 10             	add    $0x10,%esp
8010558f:	85 c0                	test   %eax,%eax
80105591:	78 0d                	js     801055a0 <sys_sbrk+0x40>
80105593:	89 d8                	mov    %ebx,%eax
80105595:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105598:	c9                   	leave  
80105599:	c3                   	ret    
8010559a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801055a0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801055a5:	eb ec                	jmp    80105593 <sys_sbrk+0x33>
801055a7:	89 f6                	mov    %esi,%esi
801055a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801055b0 <sys_sleep>:
801055b0:	55                   	push   %ebp
801055b1:	89 e5                	mov    %esp,%ebp
801055b3:	53                   	push   %ebx
801055b4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801055b7:	83 ec 1c             	sub    $0x1c,%esp
801055ba:	50                   	push   %eax
801055bb:	6a 00                	push   $0x0
801055bd:	e8 be f1 ff ff       	call   80104780 <argint>
801055c2:	83 c4 10             	add    $0x10,%esp
801055c5:	85 c0                	test   %eax,%eax
801055c7:	0f 88 8a 00 00 00    	js     80105657 <sys_sleep+0xa7>
801055cd:	83 ec 0c             	sub    $0xc,%esp
801055d0:	68 e0 4c 11 80       	push   $0x80114ce0
801055d5:	e8 a6 ec ff ff       	call   80104280 <acquire>
801055da:	8b 55 f4             	mov    -0xc(%ebp),%edx
801055dd:	83 c4 10             	add    $0x10,%esp
801055e0:	8b 1d 20 55 11 80    	mov    0x80115520,%ebx
801055e6:	85 d2                	test   %edx,%edx
801055e8:	75 27                	jne    80105611 <sys_sleep+0x61>
801055ea:	eb 54                	jmp    80105640 <sys_sleep+0x90>
801055ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801055f0:	83 ec 08             	sub    $0x8,%esp
801055f3:	68 e0 4c 11 80       	push   $0x80114ce0
801055f8:	68 20 55 11 80       	push   $0x80115520
801055fd:	e8 ee e7 ff ff       	call   80103df0 <sleep>
80105602:	a1 20 55 11 80       	mov    0x80115520,%eax
80105607:	83 c4 10             	add    $0x10,%esp
8010560a:	29 d8                	sub    %ebx,%eax
8010560c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010560f:	73 2f                	jae    80105640 <sys_sleep+0x90>
80105611:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105617:	8b 40 24             	mov    0x24(%eax),%eax
8010561a:	85 c0                	test   %eax,%eax
8010561c:	74 d2                	je     801055f0 <sys_sleep+0x40>
8010561e:	83 ec 0c             	sub    $0xc,%esp
80105621:	68 e0 4c 11 80       	push   $0x80114ce0
80105626:	e8 35 ee ff ff       	call   80104460 <release>
8010562b:	83 c4 10             	add    $0x10,%esp
8010562e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105633:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105636:	c9                   	leave  
80105637:	c3                   	ret    
80105638:	90                   	nop
80105639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105640:	83 ec 0c             	sub    $0xc,%esp
80105643:	68 e0 4c 11 80       	push   $0x80114ce0
80105648:	e8 13 ee ff ff       	call   80104460 <release>
8010564d:	83 c4 10             	add    $0x10,%esp
80105650:	31 c0                	xor    %eax,%eax
80105652:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105655:	c9                   	leave  
80105656:	c3                   	ret    
80105657:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010565c:	eb d5                	jmp    80105633 <sys_sleep+0x83>
8010565e:	66 90                	xchg   %ax,%ax

80105660 <sys_uptime>:
80105660:	55                   	push   %ebp
80105661:	89 e5                	mov    %esp,%ebp
80105663:	53                   	push   %ebx
80105664:	83 ec 10             	sub    $0x10,%esp
80105667:	68 e0 4c 11 80       	push   $0x80114ce0
8010566c:	e8 0f ec ff ff       	call   80104280 <acquire>
80105671:	8b 1d 20 55 11 80    	mov    0x80115520,%ebx
80105677:	c7 04 24 e0 4c 11 80 	movl   $0x80114ce0,(%esp)
8010567e:	e8 dd ed ff ff       	call   80104460 <release>
80105683:	89 d8                	mov    %ebx,%eax
80105685:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105688:	c9                   	leave  
80105689:	c3                   	ret    
8010568a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105690 <sys_halt>:
80105690:	55                   	push   %ebp
80105691:	b8 53 00 00 00       	mov    $0x53,%eax
80105696:	b9 bd 77 10 80       	mov    $0x801077bd,%ecx
8010569b:	ba 00 89 ff ff       	mov    $0xffff8900,%edx
801056a0:	89 e5                	mov    %esp,%ebp
801056a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801056a8:	ee                   	out    %al,(%dx)
801056a9:	83 c1 01             	add    $0x1,%ecx
801056ac:	0f b6 01             	movzbl (%ecx),%eax
801056af:	84 c0                	test   %al,%al
801056b1:	75 f5                	jne    801056a8 <sys_halt+0x18>
801056b3:	31 c0                	xor    %eax,%eax
801056b5:	5d                   	pop    %ebp
801056b6:	c3                   	ret    
801056b7:	66 90                	xchg   %ax,%ax
801056b9:	66 90                	xchg   %ax,%ax
801056bb:	66 90                	xchg   %ax,%ax
801056bd:	66 90                	xchg   %ax,%ax
801056bf:	90                   	nop

801056c0 <timerinit>:
801056c0:	55                   	push   %ebp
801056c1:	ba 43 00 00 00       	mov    $0x43,%edx
801056c6:	b8 34 00 00 00       	mov    $0x34,%eax
801056cb:	89 e5                	mov    %esp,%ebp
801056cd:	83 ec 14             	sub    $0x14,%esp
801056d0:	ee                   	out    %al,(%dx)
801056d1:	ba 40 00 00 00       	mov    $0x40,%edx
801056d6:	b8 9c ff ff ff       	mov    $0xffffff9c,%eax
801056db:	ee                   	out    %al,(%dx)
801056dc:	b8 2e 00 00 00       	mov    $0x2e,%eax
801056e1:	ee                   	out    %al,(%dx)
801056e2:	6a 00                	push   $0x0
801056e4:	e8 b7 db ff ff       	call   801032a0 <picenable>
801056e9:	83 c4 10             	add    $0x10,%esp
801056ec:	c9                   	leave  
801056ed:	c3                   	ret    

801056ee <alltraps>:
801056ee:	1e                   	push   %ds
801056ef:	06                   	push   %es
801056f0:	0f a0                	push   %fs
801056f2:	0f a8                	push   %gs
801056f4:	60                   	pusha  
801056f5:	66 b8 10 00          	mov    $0x10,%ax
801056f9:	8e d8                	mov    %eax,%ds
801056fb:	8e c0                	mov    %eax,%es
801056fd:	66 b8 18 00          	mov    $0x18,%ax
80105701:	8e e0                	mov    %eax,%fs
80105703:	8e e8                	mov    %eax,%gs
80105705:	54                   	push   %esp
80105706:	e8 e5 00 00 00       	call   801057f0 <trap>
8010570b:	83 c4 04             	add    $0x4,%esp

8010570e <trapret>:
8010570e:	61                   	popa   
8010570f:	0f a9                	pop    %gs
80105711:	0f a1                	pop    %fs
80105713:	07                   	pop    %es
80105714:	1f                   	pop    %ds
80105715:	83 c4 08             	add    $0x8,%esp
80105718:	cf                   	iret   
80105719:	66 90                	xchg   %ax,%ax
8010571b:	66 90                	xchg   %ax,%ax
8010571d:	66 90                	xchg   %ax,%ax
8010571f:	90                   	nop

80105720 <tvinit>:
80105720:	55                   	push   %ebp
80105721:	31 c0                	xor    %eax,%eax
80105723:	89 e5                	mov    %esp,%ebp
80105725:	83 ec 08             	sub    $0x8,%esp
80105728:	90                   	nop
80105729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105730:	8b 14 85 0c a0 10 80 	mov    -0x7fef5ff4(,%eax,4),%edx
80105737:	b9 08 00 00 00       	mov    $0x8,%ecx
8010573c:	c6 04 c5 24 4d 11 80 	movb   $0x0,-0x7feeb2dc(,%eax,8)
80105743:	00 
80105744:	66 89 0c c5 22 4d 11 	mov    %cx,-0x7feeb2de(,%eax,8)
8010574b:	80 
8010574c:	c6 04 c5 25 4d 11 80 	movb   $0x8e,-0x7feeb2db(,%eax,8)
80105753:	8e 
80105754:	66 89 14 c5 20 4d 11 	mov    %dx,-0x7feeb2e0(,%eax,8)
8010575b:	80 
8010575c:	c1 ea 10             	shr    $0x10,%edx
8010575f:	66 89 14 c5 26 4d 11 	mov    %dx,-0x7feeb2da(,%eax,8)
80105766:	80 
80105767:	83 c0 01             	add    $0x1,%eax
8010576a:	3d 00 01 00 00       	cmp    $0x100,%eax
8010576f:	75 bf                	jne    80105730 <tvinit+0x10>
80105771:	a1 0c a1 10 80       	mov    0x8010a10c,%eax
80105776:	83 ec 08             	sub    $0x8,%esp
80105779:	ba 08 00 00 00       	mov    $0x8,%edx
8010577e:	68 58 76 10 80       	push   $0x80107658
80105783:	68 e0 4c 11 80       	push   $0x80114ce0
80105788:	66 89 15 22 4f 11 80 	mov    %dx,0x80114f22
8010578f:	c6 05 24 4f 11 80 00 	movb   $0x0,0x80114f24
80105796:	66 a3 20 4f 11 80    	mov    %ax,0x80114f20
8010579c:	c1 e8 10             	shr    $0x10,%eax
8010579f:	c6 05 25 4f 11 80 ef 	movb   $0xef,0x80114f25
801057a6:	66 a3 26 4f 11 80    	mov    %ax,0x80114f26
801057ac:	e8 af ea ff ff       	call   80104260 <initlock>
801057b1:	83 c4 10             	add    $0x10,%esp
801057b4:	c9                   	leave  
801057b5:	c3                   	ret    
801057b6:	8d 76 00             	lea    0x0(%esi),%esi
801057b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801057c0 <idtinit>:
801057c0:	55                   	push   %ebp
801057c1:	b8 ff 07 00 00       	mov    $0x7ff,%eax
801057c6:	89 e5                	mov    %esp,%ebp
801057c8:	83 ec 10             	sub    $0x10,%esp
801057cb:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
801057cf:	b8 20 4d 11 80       	mov    $0x80114d20,%eax
801057d4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
801057d8:	c1 e8 10             	shr    $0x10,%eax
801057db:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
801057df:	8d 45 fa             	lea    -0x6(%ebp),%eax
801057e2:	0f 01 18             	lidtl  (%eax)
801057e5:	c9                   	leave  
801057e6:	c3                   	ret    
801057e7:	89 f6                	mov    %esi,%esi
801057e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801057f0 <trap>:
801057f0:	55                   	push   %ebp
801057f1:	89 e5                	mov    %esp,%ebp
801057f3:	57                   	push   %edi
801057f4:	56                   	push   %esi
801057f5:	53                   	push   %ebx
801057f6:	83 ec 0c             	sub    $0xc,%esp
801057f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801057fc:	8b 43 30             	mov    0x30(%ebx),%eax
801057ff:	83 f8 40             	cmp    $0x40,%eax
80105802:	0f 84 f8 00 00 00    	je     80105900 <trap+0x110>
80105808:	83 e8 20             	sub    $0x20,%eax
8010580b:	83 f8 1f             	cmp    $0x1f,%eax
8010580e:	77 68                	ja     80105878 <trap+0x88>
80105810:	ff 24 85 68 78 10 80 	jmp    *-0x7fef8798(,%eax,4)
80105817:	89 f6                	mov    %esi,%esi
80105819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105820:	e8 cb ce ff ff       	call   801026f0 <cpunum>
80105825:	85 c0                	test   %eax,%eax
80105827:	0f 84 b3 01 00 00    	je     801059e0 <trap+0x1f0>
8010582d:	e8 5e cf ff ff       	call   80102790 <lapiceoi>
80105832:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105838:	85 c0                	test   %eax,%eax
8010583a:	74 2d                	je     80105869 <trap+0x79>
8010583c:	8b 50 24             	mov    0x24(%eax),%edx
8010583f:	85 d2                	test   %edx,%edx
80105841:	0f 85 86 00 00 00    	jne    801058cd <trap+0xdd>
80105847:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
8010584b:	0f 84 ef 00 00 00    	je     80105940 <trap+0x150>
80105851:	8b 40 24             	mov    0x24(%eax),%eax
80105854:	85 c0                	test   %eax,%eax
80105856:	74 11                	je     80105869 <trap+0x79>
80105858:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
8010585c:	83 e0 03             	and    $0x3,%eax
8010585f:	66 83 f8 03          	cmp    $0x3,%ax
80105863:	0f 84 c1 00 00 00    	je     8010592a <trap+0x13a>
80105869:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010586c:	5b                   	pop    %ebx
8010586d:	5e                   	pop    %esi
8010586e:	5f                   	pop    %edi
8010586f:	5d                   	pop    %ebp
80105870:	c3                   	ret    
80105871:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105878:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
8010587f:	85 c9                	test   %ecx,%ecx
80105881:	0f 84 8d 01 00 00    	je     80105a14 <trap+0x224>
80105887:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
8010588b:	0f 84 83 01 00 00    	je     80105a14 <trap+0x224>
80105891:	0f 20 d7             	mov    %cr2,%edi
80105894:	8b 73 38             	mov    0x38(%ebx),%esi
80105897:	e8 54 ce ff ff       	call   801026f0 <cpunum>
8010589c:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801058a3:	57                   	push   %edi
801058a4:	56                   	push   %esi
801058a5:	50                   	push   %eax
801058a6:	ff 73 34             	pushl  0x34(%ebx)
801058a9:	ff 73 30             	pushl  0x30(%ebx)
801058ac:	8d 42 6c             	lea    0x6c(%edx),%eax
801058af:	50                   	push   %eax
801058b0:	ff 72 10             	pushl  0x10(%edx)
801058b3:	68 24 78 10 80       	push   $0x80107824
801058b8:	e8 a3 ad ff ff       	call   80100660 <cprintf>
801058bd:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801058c3:	83 c4 20             	add    $0x20,%esp
801058c6:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
801058cd:	0f b7 53 3c          	movzwl 0x3c(%ebx),%edx
801058d1:	83 e2 03             	and    $0x3,%edx
801058d4:	66 83 fa 03          	cmp    $0x3,%dx
801058d8:	0f 85 69 ff ff ff    	jne    80105847 <trap+0x57>
801058de:	e8 7d e3 ff ff       	call   80103c60 <exit>
801058e3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801058e9:	85 c0                	test   %eax,%eax
801058eb:	0f 85 56 ff ff ff    	jne    80105847 <trap+0x57>
801058f1:	e9 73 ff ff ff       	jmp    80105869 <trap+0x79>
801058f6:	8d 76 00             	lea    0x0(%esi),%esi
801058f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105900:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105906:	8b 70 24             	mov    0x24(%eax),%esi
80105909:	85 f6                	test   %esi,%esi
8010590b:	0f 85 bf 00 00 00    	jne    801059d0 <trap+0x1e0>
80105911:	89 58 18             	mov    %ebx,0x18(%eax)
80105914:	e8 77 ef ff ff       	call   80104890 <syscall>
80105919:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010591f:	8b 58 24             	mov    0x24(%eax),%ebx
80105922:	85 db                	test   %ebx,%ebx
80105924:	0f 84 3f ff ff ff    	je     80105869 <trap+0x79>
8010592a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010592d:	5b                   	pop    %ebx
8010592e:	5e                   	pop    %esi
8010592f:	5f                   	pop    %edi
80105930:	5d                   	pop    %ebp
80105931:	e9 2a e3 ff ff       	jmp    80103c60 <exit>
80105936:	8d 76 00             	lea    0x0(%esi),%esi
80105939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105940:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105944:	0f 85 07 ff ff ff    	jne    80105851 <trap+0x61>
8010594a:	e8 61 e4 ff ff       	call   80103db0 <yield>
8010594f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105955:	85 c0                	test   %eax,%eax
80105957:	0f 85 f4 fe ff ff    	jne    80105851 <trap+0x61>
8010595d:	e9 07 ff ff ff       	jmp    80105869 <trap+0x79>
80105962:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105968:	e8 63 cc ff ff       	call   801025d0 <kbdintr>
8010596d:	e8 1e ce ff ff       	call   80102790 <lapiceoi>
80105972:	e9 bb fe ff ff       	jmp    80105832 <trap+0x42>
80105977:	89 f6                	mov    %esi,%esi
80105979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105980:	e8 2b 02 00 00       	call   80105bb0 <uartintr>
80105985:	e9 a3 fe ff ff       	jmp    8010582d <trap+0x3d>
8010598a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105990:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
80105994:	8b 7b 38             	mov    0x38(%ebx),%edi
80105997:	e8 54 cd ff ff       	call   801026f0 <cpunum>
8010599c:	57                   	push   %edi
8010599d:	56                   	push   %esi
8010599e:	50                   	push   %eax
8010599f:	68 cc 77 10 80       	push   $0x801077cc
801059a4:	e8 b7 ac ff ff       	call   80100660 <cprintf>
801059a9:	e8 e2 cd ff ff       	call   80102790 <lapiceoi>
801059ae:	83 c4 10             	add    $0x10,%esp
801059b1:	e9 7c fe ff ff       	jmp    80105832 <trap+0x42>
801059b6:	8d 76 00             	lea    0x0(%esi),%esi
801059b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801059c0:	e8 6b c6 ff ff       	call   80102030 <ideintr>
801059c5:	e8 c6 cd ff ff       	call   80102790 <lapiceoi>
801059ca:	e9 63 fe ff ff       	jmp    80105832 <trap+0x42>
801059cf:	90                   	nop
801059d0:	e8 8b e2 ff ff       	call   80103c60 <exit>
801059d5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801059db:	e9 31 ff ff ff       	jmp    80105911 <trap+0x121>
801059e0:	83 ec 0c             	sub    $0xc,%esp
801059e3:	68 e0 4c 11 80       	push   $0x80114ce0
801059e8:	e8 93 e8 ff ff       	call   80104280 <acquire>
801059ed:	c7 04 24 20 55 11 80 	movl   $0x80115520,(%esp)
801059f4:	83 05 20 55 11 80 01 	addl   $0x1,0x80115520
801059fb:	e8 a0 e5 ff ff       	call   80103fa0 <wakeup>
80105a00:	c7 04 24 e0 4c 11 80 	movl   $0x80114ce0,(%esp)
80105a07:	e8 54 ea ff ff       	call   80104460 <release>
80105a0c:	83 c4 10             	add    $0x10,%esp
80105a0f:	e9 19 fe ff ff       	jmp    8010582d <trap+0x3d>
80105a14:	0f 20 d7             	mov    %cr2,%edi
80105a17:	8b 73 38             	mov    0x38(%ebx),%esi
80105a1a:	e8 d1 cc ff ff       	call   801026f0 <cpunum>
80105a1f:	83 ec 0c             	sub    $0xc,%esp
80105a22:	57                   	push   %edi
80105a23:	56                   	push   %esi
80105a24:	50                   	push   %eax
80105a25:	ff 73 30             	pushl  0x30(%ebx)
80105a28:	68 f0 77 10 80       	push   $0x801077f0
80105a2d:	e8 2e ac ff ff       	call   80100660 <cprintf>
80105a32:	83 c4 14             	add    $0x14,%esp
80105a35:	68 c6 77 10 80       	push   $0x801077c6
80105a3a:	e8 31 a9 ff ff       	call   80100370 <panic>
80105a3f:	90                   	nop

80105a40 <uartgetc>:
80105a40:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
80105a45:	55                   	push   %ebp
80105a46:	89 e5                	mov    %esp,%ebp
80105a48:	85 c0                	test   %eax,%eax
80105a4a:	74 1c                	je     80105a68 <uartgetc+0x28>
80105a4c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105a51:	ec                   	in     (%dx),%al
80105a52:	a8 01                	test   $0x1,%al
80105a54:	74 12                	je     80105a68 <uartgetc+0x28>
80105a56:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a5b:	ec                   	in     (%dx),%al
80105a5c:	0f b6 c0             	movzbl %al,%eax
80105a5f:	5d                   	pop    %ebp
80105a60:	c3                   	ret    
80105a61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105a68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105a6d:	5d                   	pop    %ebp
80105a6e:	c3                   	ret    
80105a6f:	90                   	nop

80105a70 <uartputc.part.0>:
80105a70:	55                   	push   %ebp
80105a71:	89 e5                	mov    %esp,%ebp
80105a73:	57                   	push   %edi
80105a74:	56                   	push   %esi
80105a75:	53                   	push   %ebx
80105a76:	89 c7                	mov    %eax,%edi
80105a78:	bb 80 00 00 00       	mov    $0x80,%ebx
80105a7d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105a82:	83 ec 0c             	sub    $0xc,%esp
80105a85:	eb 1b                	jmp    80105aa2 <uartputc.part.0+0x32>
80105a87:	89 f6                	mov    %esi,%esi
80105a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105a90:	83 ec 0c             	sub    $0xc,%esp
80105a93:	6a 0a                	push   $0xa
80105a95:	e8 16 cd ff ff       	call   801027b0 <microdelay>
80105a9a:	83 c4 10             	add    $0x10,%esp
80105a9d:	83 eb 01             	sub    $0x1,%ebx
80105aa0:	74 07                	je     80105aa9 <uartputc.part.0+0x39>
80105aa2:	89 f2                	mov    %esi,%edx
80105aa4:	ec                   	in     (%dx),%al
80105aa5:	a8 20                	test   $0x20,%al
80105aa7:	74 e7                	je     80105a90 <uartputc.part.0+0x20>
80105aa9:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105aae:	89 f8                	mov    %edi,%eax
80105ab0:	ee                   	out    %al,(%dx)
80105ab1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105ab4:	5b                   	pop    %ebx
80105ab5:	5e                   	pop    %esi
80105ab6:	5f                   	pop    %edi
80105ab7:	5d                   	pop    %ebp
80105ab8:	c3                   	ret    
80105ab9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105ac0 <uartinit>:
80105ac0:	55                   	push   %ebp
80105ac1:	31 c9                	xor    %ecx,%ecx
80105ac3:	89 c8                	mov    %ecx,%eax
80105ac5:	89 e5                	mov    %esp,%ebp
80105ac7:	57                   	push   %edi
80105ac8:	56                   	push   %esi
80105ac9:	53                   	push   %ebx
80105aca:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105acf:	89 da                	mov    %ebx,%edx
80105ad1:	83 ec 0c             	sub    $0xc,%esp
80105ad4:	ee                   	out    %al,(%dx)
80105ad5:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105ada:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105adf:	89 fa                	mov    %edi,%edx
80105ae1:	ee                   	out    %al,(%dx)
80105ae2:	b8 0c 00 00 00       	mov    $0xc,%eax
80105ae7:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105aec:	ee                   	out    %al,(%dx)
80105aed:	be f9 03 00 00       	mov    $0x3f9,%esi
80105af2:	89 c8                	mov    %ecx,%eax
80105af4:	89 f2                	mov    %esi,%edx
80105af6:	ee                   	out    %al,(%dx)
80105af7:	b8 03 00 00 00       	mov    $0x3,%eax
80105afc:	89 fa                	mov    %edi,%edx
80105afe:	ee                   	out    %al,(%dx)
80105aff:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105b04:	89 c8                	mov    %ecx,%eax
80105b06:	ee                   	out    %al,(%dx)
80105b07:	b8 01 00 00 00       	mov    $0x1,%eax
80105b0c:	89 f2                	mov    %esi,%edx
80105b0e:	ee                   	out    %al,(%dx)
80105b0f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105b14:	ec                   	in     (%dx),%al
80105b15:	3c ff                	cmp    $0xff,%al
80105b17:	74 5a                	je     80105b73 <uartinit+0xb3>
80105b19:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80105b20:	00 00 00 
80105b23:	89 da                	mov    %ebx,%edx
80105b25:	ec                   	in     (%dx),%al
80105b26:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105b2b:	ec                   	in     (%dx),%al
80105b2c:	83 ec 0c             	sub    $0xc,%esp
80105b2f:	6a 04                	push   $0x4
80105b31:	e8 6a d7 ff ff       	call   801032a0 <picenable>
80105b36:	59                   	pop    %ecx
80105b37:	5b                   	pop    %ebx
80105b38:	6a 00                	push   $0x0
80105b3a:	6a 04                	push   $0x4
80105b3c:	bb e8 78 10 80       	mov    $0x801078e8,%ebx
80105b41:	e8 4a c7 ff ff       	call   80102290 <ioapicenable>
80105b46:	83 c4 10             	add    $0x10,%esp
80105b49:	b8 78 00 00 00       	mov    $0x78,%eax
80105b4e:	eb 0a                	jmp    80105b5a <uartinit+0x9a>
80105b50:	83 c3 01             	add    $0x1,%ebx
80105b53:	0f be 03             	movsbl (%ebx),%eax
80105b56:	84 c0                	test   %al,%al
80105b58:	74 19                	je     80105b73 <uartinit+0xb3>
80105b5a:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105b60:	85 d2                	test   %edx,%edx
80105b62:	74 ec                	je     80105b50 <uartinit+0x90>
80105b64:	83 c3 01             	add    $0x1,%ebx
80105b67:	e8 04 ff ff ff       	call   80105a70 <uartputc.part.0>
80105b6c:	0f be 03             	movsbl (%ebx),%eax
80105b6f:	84 c0                	test   %al,%al
80105b71:	75 e7                	jne    80105b5a <uartinit+0x9a>
80105b73:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b76:	5b                   	pop    %ebx
80105b77:	5e                   	pop    %esi
80105b78:	5f                   	pop    %edi
80105b79:	5d                   	pop    %ebp
80105b7a:	c3                   	ret    
80105b7b:	90                   	nop
80105b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105b80 <uartputc>:
80105b80:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105b86:	55                   	push   %ebp
80105b87:	89 e5                	mov    %esp,%ebp
80105b89:	85 d2                	test   %edx,%edx
80105b8b:	8b 45 08             	mov    0x8(%ebp),%eax
80105b8e:	74 10                	je     80105ba0 <uartputc+0x20>
80105b90:	5d                   	pop    %ebp
80105b91:	e9 da fe ff ff       	jmp    80105a70 <uartputc.part.0>
80105b96:	8d 76 00             	lea    0x0(%esi),%esi
80105b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105ba0:	5d                   	pop    %ebp
80105ba1:	c3                   	ret    
80105ba2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105bb0 <uartintr>:
80105bb0:	55                   	push   %ebp
80105bb1:	89 e5                	mov    %esp,%ebp
80105bb3:	83 ec 14             	sub    $0x14,%esp
80105bb6:	68 40 5a 10 80       	push   $0x80105a40
80105bbb:	e8 20 ac ff ff       	call   801007e0 <consoleintr>
80105bc0:	83 c4 10             	add    $0x10,%esp
80105bc3:	c9                   	leave  
80105bc4:	c3                   	ret    

80105bc5 <vector0>:
80105bc5:	6a 00                	push   $0x0
80105bc7:	6a 00                	push   $0x0
80105bc9:	e9 20 fb ff ff       	jmp    801056ee <alltraps>

80105bce <vector1>:
80105bce:	6a 00                	push   $0x0
80105bd0:	6a 01                	push   $0x1
80105bd2:	e9 17 fb ff ff       	jmp    801056ee <alltraps>

80105bd7 <vector2>:
80105bd7:	6a 00                	push   $0x0
80105bd9:	6a 02                	push   $0x2
80105bdb:	e9 0e fb ff ff       	jmp    801056ee <alltraps>

80105be0 <vector3>:
80105be0:	6a 00                	push   $0x0
80105be2:	6a 03                	push   $0x3
80105be4:	e9 05 fb ff ff       	jmp    801056ee <alltraps>

80105be9 <vector4>:
80105be9:	6a 00                	push   $0x0
80105beb:	6a 04                	push   $0x4
80105bed:	e9 fc fa ff ff       	jmp    801056ee <alltraps>

80105bf2 <vector5>:
80105bf2:	6a 00                	push   $0x0
80105bf4:	6a 05                	push   $0x5
80105bf6:	e9 f3 fa ff ff       	jmp    801056ee <alltraps>

80105bfb <vector6>:
80105bfb:	6a 00                	push   $0x0
80105bfd:	6a 06                	push   $0x6
80105bff:	e9 ea fa ff ff       	jmp    801056ee <alltraps>

80105c04 <vector7>:
80105c04:	6a 00                	push   $0x0
80105c06:	6a 07                	push   $0x7
80105c08:	e9 e1 fa ff ff       	jmp    801056ee <alltraps>

80105c0d <vector8>:
80105c0d:	6a 08                	push   $0x8
80105c0f:	e9 da fa ff ff       	jmp    801056ee <alltraps>

80105c14 <vector9>:
80105c14:	6a 00                	push   $0x0
80105c16:	6a 09                	push   $0x9
80105c18:	e9 d1 fa ff ff       	jmp    801056ee <alltraps>

80105c1d <vector10>:
80105c1d:	6a 0a                	push   $0xa
80105c1f:	e9 ca fa ff ff       	jmp    801056ee <alltraps>

80105c24 <vector11>:
80105c24:	6a 0b                	push   $0xb
80105c26:	e9 c3 fa ff ff       	jmp    801056ee <alltraps>

80105c2b <vector12>:
80105c2b:	6a 0c                	push   $0xc
80105c2d:	e9 bc fa ff ff       	jmp    801056ee <alltraps>

80105c32 <vector13>:
80105c32:	6a 0d                	push   $0xd
80105c34:	e9 b5 fa ff ff       	jmp    801056ee <alltraps>

80105c39 <vector14>:
80105c39:	6a 0e                	push   $0xe
80105c3b:	e9 ae fa ff ff       	jmp    801056ee <alltraps>

80105c40 <vector15>:
80105c40:	6a 00                	push   $0x0
80105c42:	6a 0f                	push   $0xf
80105c44:	e9 a5 fa ff ff       	jmp    801056ee <alltraps>

80105c49 <vector16>:
80105c49:	6a 00                	push   $0x0
80105c4b:	6a 10                	push   $0x10
80105c4d:	e9 9c fa ff ff       	jmp    801056ee <alltraps>

80105c52 <vector17>:
80105c52:	6a 11                	push   $0x11
80105c54:	e9 95 fa ff ff       	jmp    801056ee <alltraps>

80105c59 <vector18>:
80105c59:	6a 00                	push   $0x0
80105c5b:	6a 12                	push   $0x12
80105c5d:	e9 8c fa ff ff       	jmp    801056ee <alltraps>

80105c62 <vector19>:
80105c62:	6a 00                	push   $0x0
80105c64:	6a 13                	push   $0x13
80105c66:	e9 83 fa ff ff       	jmp    801056ee <alltraps>

80105c6b <vector20>:
80105c6b:	6a 00                	push   $0x0
80105c6d:	6a 14                	push   $0x14
80105c6f:	e9 7a fa ff ff       	jmp    801056ee <alltraps>

80105c74 <vector21>:
80105c74:	6a 00                	push   $0x0
80105c76:	6a 15                	push   $0x15
80105c78:	e9 71 fa ff ff       	jmp    801056ee <alltraps>

80105c7d <vector22>:
80105c7d:	6a 00                	push   $0x0
80105c7f:	6a 16                	push   $0x16
80105c81:	e9 68 fa ff ff       	jmp    801056ee <alltraps>

80105c86 <vector23>:
80105c86:	6a 00                	push   $0x0
80105c88:	6a 17                	push   $0x17
80105c8a:	e9 5f fa ff ff       	jmp    801056ee <alltraps>

80105c8f <vector24>:
80105c8f:	6a 00                	push   $0x0
80105c91:	6a 18                	push   $0x18
80105c93:	e9 56 fa ff ff       	jmp    801056ee <alltraps>

80105c98 <vector25>:
80105c98:	6a 00                	push   $0x0
80105c9a:	6a 19                	push   $0x19
80105c9c:	e9 4d fa ff ff       	jmp    801056ee <alltraps>

80105ca1 <vector26>:
80105ca1:	6a 00                	push   $0x0
80105ca3:	6a 1a                	push   $0x1a
80105ca5:	e9 44 fa ff ff       	jmp    801056ee <alltraps>

80105caa <vector27>:
80105caa:	6a 00                	push   $0x0
80105cac:	6a 1b                	push   $0x1b
80105cae:	e9 3b fa ff ff       	jmp    801056ee <alltraps>

80105cb3 <vector28>:
80105cb3:	6a 00                	push   $0x0
80105cb5:	6a 1c                	push   $0x1c
80105cb7:	e9 32 fa ff ff       	jmp    801056ee <alltraps>

80105cbc <vector29>:
80105cbc:	6a 00                	push   $0x0
80105cbe:	6a 1d                	push   $0x1d
80105cc0:	e9 29 fa ff ff       	jmp    801056ee <alltraps>

80105cc5 <vector30>:
80105cc5:	6a 00                	push   $0x0
80105cc7:	6a 1e                	push   $0x1e
80105cc9:	e9 20 fa ff ff       	jmp    801056ee <alltraps>

80105cce <vector31>:
80105cce:	6a 00                	push   $0x0
80105cd0:	6a 1f                	push   $0x1f
80105cd2:	e9 17 fa ff ff       	jmp    801056ee <alltraps>

80105cd7 <vector32>:
80105cd7:	6a 00                	push   $0x0
80105cd9:	6a 20                	push   $0x20
80105cdb:	e9 0e fa ff ff       	jmp    801056ee <alltraps>

80105ce0 <vector33>:
80105ce0:	6a 00                	push   $0x0
80105ce2:	6a 21                	push   $0x21
80105ce4:	e9 05 fa ff ff       	jmp    801056ee <alltraps>

80105ce9 <vector34>:
80105ce9:	6a 00                	push   $0x0
80105ceb:	6a 22                	push   $0x22
80105ced:	e9 fc f9 ff ff       	jmp    801056ee <alltraps>

80105cf2 <vector35>:
80105cf2:	6a 00                	push   $0x0
80105cf4:	6a 23                	push   $0x23
80105cf6:	e9 f3 f9 ff ff       	jmp    801056ee <alltraps>

80105cfb <vector36>:
80105cfb:	6a 00                	push   $0x0
80105cfd:	6a 24                	push   $0x24
80105cff:	e9 ea f9 ff ff       	jmp    801056ee <alltraps>

80105d04 <vector37>:
80105d04:	6a 00                	push   $0x0
80105d06:	6a 25                	push   $0x25
80105d08:	e9 e1 f9 ff ff       	jmp    801056ee <alltraps>

80105d0d <vector38>:
80105d0d:	6a 00                	push   $0x0
80105d0f:	6a 26                	push   $0x26
80105d11:	e9 d8 f9 ff ff       	jmp    801056ee <alltraps>

80105d16 <vector39>:
80105d16:	6a 00                	push   $0x0
80105d18:	6a 27                	push   $0x27
80105d1a:	e9 cf f9 ff ff       	jmp    801056ee <alltraps>

80105d1f <vector40>:
80105d1f:	6a 00                	push   $0x0
80105d21:	6a 28                	push   $0x28
80105d23:	e9 c6 f9 ff ff       	jmp    801056ee <alltraps>

80105d28 <vector41>:
80105d28:	6a 00                	push   $0x0
80105d2a:	6a 29                	push   $0x29
80105d2c:	e9 bd f9 ff ff       	jmp    801056ee <alltraps>

80105d31 <vector42>:
80105d31:	6a 00                	push   $0x0
80105d33:	6a 2a                	push   $0x2a
80105d35:	e9 b4 f9 ff ff       	jmp    801056ee <alltraps>

80105d3a <vector43>:
80105d3a:	6a 00                	push   $0x0
80105d3c:	6a 2b                	push   $0x2b
80105d3e:	e9 ab f9 ff ff       	jmp    801056ee <alltraps>

80105d43 <vector44>:
80105d43:	6a 00                	push   $0x0
80105d45:	6a 2c                	push   $0x2c
80105d47:	e9 a2 f9 ff ff       	jmp    801056ee <alltraps>

80105d4c <vector45>:
80105d4c:	6a 00                	push   $0x0
80105d4e:	6a 2d                	push   $0x2d
80105d50:	e9 99 f9 ff ff       	jmp    801056ee <alltraps>

80105d55 <vector46>:
80105d55:	6a 00                	push   $0x0
80105d57:	6a 2e                	push   $0x2e
80105d59:	e9 90 f9 ff ff       	jmp    801056ee <alltraps>

80105d5e <vector47>:
80105d5e:	6a 00                	push   $0x0
80105d60:	6a 2f                	push   $0x2f
80105d62:	e9 87 f9 ff ff       	jmp    801056ee <alltraps>

80105d67 <vector48>:
80105d67:	6a 00                	push   $0x0
80105d69:	6a 30                	push   $0x30
80105d6b:	e9 7e f9 ff ff       	jmp    801056ee <alltraps>

80105d70 <vector49>:
80105d70:	6a 00                	push   $0x0
80105d72:	6a 31                	push   $0x31
80105d74:	e9 75 f9 ff ff       	jmp    801056ee <alltraps>

80105d79 <vector50>:
80105d79:	6a 00                	push   $0x0
80105d7b:	6a 32                	push   $0x32
80105d7d:	e9 6c f9 ff ff       	jmp    801056ee <alltraps>

80105d82 <vector51>:
80105d82:	6a 00                	push   $0x0
80105d84:	6a 33                	push   $0x33
80105d86:	e9 63 f9 ff ff       	jmp    801056ee <alltraps>

80105d8b <vector52>:
80105d8b:	6a 00                	push   $0x0
80105d8d:	6a 34                	push   $0x34
80105d8f:	e9 5a f9 ff ff       	jmp    801056ee <alltraps>

80105d94 <vector53>:
80105d94:	6a 00                	push   $0x0
80105d96:	6a 35                	push   $0x35
80105d98:	e9 51 f9 ff ff       	jmp    801056ee <alltraps>

80105d9d <vector54>:
80105d9d:	6a 00                	push   $0x0
80105d9f:	6a 36                	push   $0x36
80105da1:	e9 48 f9 ff ff       	jmp    801056ee <alltraps>

80105da6 <vector55>:
80105da6:	6a 00                	push   $0x0
80105da8:	6a 37                	push   $0x37
80105daa:	e9 3f f9 ff ff       	jmp    801056ee <alltraps>

80105daf <vector56>:
80105daf:	6a 00                	push   $0x0
80105db1:	6a 38                	push   $0x38
80105db3:	e9 36 f9 ff ff       	jmp    801056ee <alltraps>

80105db8 <vector57>:
80105db8:	6a 00                	push   $0x0
80105dba:	6a 39                	push   $0x39
80105dbc:	e9 2d f9 ff ff       	jmp    801056ee <alltraps>

80105dc1 <vector58>:
80105dc1:	6a 00                	push   $0x0
80105dc3:	6a 3a                	push   $0x3a
80105dc5:	e9 24 f9 ff ff       	jmp    801056ee <alltraps>

80105dca <vector59>:
80105dca:	6a 00                	push   $0x0
80105dcc:	6a 3b                	push   $0x3b
80105dce:	e9 1b f9 ff ff       	jmp    801056ee <alltraps>

80105dd3 <vector60>:
80105dd3:	6a 00                	push   $0x0
80105dd5:	6a 3c                	push   $0x3c
80105dd7:	e9 12 f9 ff ff       	jmp    801056ee <alltraps>

80105ddc <vector61>:
80105ddc:	6a 00                	push   $0x0
80105dde:	6a 3d                	push   $0x3d
80105de0:	e9 09 f9 ff ff       	jmp    801056ee <alltraps>

80105de5 <vector62>:
80105de5:	6a 00                	push   $0x0
80105de7:	6a 3e                	push   $0x3e
80105de9:	e9 00 f9 ff ff       	jmp    801056ee <alltraps>

80105dee <vector63>:
80105dee:	6a 00                	push   $0x0
80105df0:	6a 3f                	push   $0x3f
80105df2:	e9 f7 f8 ff ff       	jmp    801056ee <alltraps>

80105df7 <vector64>:
80105df7:	6a 00                	push   $0x0
80105df9:	6a 40                	push   $0x40
80105dfb:	e9 ee f8 ff ff       	jmp    801056ee <alltraps>

80105e00 <vector65>:
80105e00:	6a 00                	push   $0x0
80105e02:	6a 41                	push   $0x41
80105e04:	e9 e5 f8 ff ff       	jmp    801056ee <alltraps>

80105e09 <vector66>:
80105e09:	6a 00                	push   $0x0
80105e0b:	6a 42                	push   $0x42
80105e0d:	e9 dc f8 ff ff       	jmp    801056ee <alltraps>

80105e12 <vector67>:
80105e12:	6a 00                	push   $0x0
80105e14:	6a 43                	push   $0x43
80105e16:	e9 d3 f8 ff ff       	jmp    801056ee <alltraps>

80105e1b <vector68>:
80105e1b:	6a 00                	push   $0x0
80105e1d:	6a 44                	push   $0x44
80105e1f:	e9 ca f8 ff ff       	jmp    801056ee <alltraps>

80105e24 <vector69>:
80105e24:	6a 00                	push   $0x0
80105e26:	6a 45                	push   $0x45
80105e28:	e9 c1 f8 ff ff       	jmp    801056ee <alltraps>

80105e2d <vector70>:
80105e2d:	6a 00                	push   $0x0
80105e2f:	6a 46                	push   $0x46
80105e31:	e9 b8 f8 ff ff       	jmp    801056ee <alltraps>

80105e36 <vector71>:
80105e36:	6a 00                	push   $0x0
80105e38:	6a 47                	push   $0x47
80105e3a:	e9 af f8 ff ff       	jmp    801056ee <alltraps>

80105e3f <vector72>:
80105e3f:	6a 00                	push   $0x0
80105e41:	6a 48                	push   $0x48
80105e43:	e9 a6 f8 ff ff       	jmp    801056ee <alltraps>

80105e48 <vector73>:
80105e48:	6a 00                	push   $0x0
80105e4a:	6a 49                	push   $0x49
80105e4c:	e9 9d f8 ff ff       	jmp    801056ee <alltraps>

80105e51 <vector74>:
80105e51:	6a 00                	push   $0x0
80105e53:	6a 4a                	push   $0x4a
80105e55:	e9 94 f8 ff ff       	jmp    801056ee <alltraps>

80105e5a <vector75>:
80105e5a:	6a 00                	push   $0x0
80105e5c:	6a 4b                	push   $0x4b
80105e5e:	e9 8b f8 ff ff       	jmp    801056ee <alltraps>

80105e63 <vector76>:
80105e63:	6a 00                	push   $0x0
80105e65:	6a 4c                	push   $0x4c
80105e67:	e9 82 f8 ff ff       	jmp    801056ee <alltraps>

80105e6c <vector77>:
80105e6c:	6a 00                	push   $0x0
80105e6e:	6a 4d                	push   $0x4d
80105e70:	e9 79 f8 ff ff       	jmp    801056ee <alltraps>

80105e75 <vector78>:
80105e75:	6a 00                	push   $0x0
80105e77:	6a 4e                	push   $0x4e
80105e79:	e9 70 f8 ff ff       	jmp    801056ee <alltraps>

80105e7e <vector79>:
80105e7e:	6a 00                	push   $0x0
80105e80:	6a 4f                	push   $0x4f
80105e82:	e9 67 f8 ff ff       	jmp    801056ee <alltraps>

80105e87 <vector80>:
80105e87:	6a 00                	push   $0x0
80105e89:	6a 50                	push   $0x50
80105e8b:	e9 5e f8 ff ff       	jmp    801056ee <alltraps>

80105e90 <vector81>:
80105e90:	6a 00                	push   $0x0
80105e92:	6a 51                	push   $0x51
80105e94:	e9 55 f8 ff ff       	jmp    801056ee <alltraps>

80105e99 <vector82>:
80105e99:	6a 00                	push   $0x0
80105e9b:	6a 52                	push   $0x52
80105e9d:	e9 4c f8 ff ff       	jmp    801056ee <alltraps>

80105ea2 <vector83>:
80105ea2:	6a 00                	push   $0x0
80105ea4:	6a 53                	push   $0x53
80105ea6:	e9 43 f8 ff ff       	jmp    801056ee <alltraps>

80105eab <vector84>:
80105eab:	6a 00                	push   $0x0
80105ead:	6a 54                	push   $0x54
80105eaf:	e9 3a f8 ff ff       	jmp    801056ee <alltraps>

80105eb4 <vector85>:
80105eb4:	6a 00                	push   $0x0
80105eb6:	6a 55                	push   $0x55
80105eb8:	e9 31 f8 ff ff       	jmp    801056ee <alltraps>

80105ebd <vector86>:
80105ebd:	6a 00                	push   $0x0
80105ebf:	6a 56                	push   $0x56
80105ec1:	e9 28 f8 ff ff       	jmp    801056ee <alltraps>

80105ec6 <vector87>:
80105ec6:	6a 00                	push   $0x0
80105ec8:	6a 57                	push   $0x57
80105eca:	e9 1f f8 ff ff       	jmp    801056ee <alltraps>

80105ecf <vector88>:
80105ecf:	6a 00                	push   $0x0
80105ed1:	6a 58                	push   $0x58
80105ed3:	e9 16 f8 ff ff       	jmp    801056ee <alltraps>

80105ed8 <vector89>:
80105ed8:	6a 00                	push   $0x0
80105eda:	6a 59                	push   $0x59
80105edc:	e9 0d f8 ff ff       	jmp    801056ee <alltraps>

80105ee1 <vector90>:
80105ee1:	6a 00                	push   $0x0
80105ee3:	6a 5a                	push   $0x5a
80105ee5:	e9 04 f8 ff ff       	jmp    801056ee <alltraps>

80105eea <vector91>:
80105eea:	6a 00                	push   $0x0
80105eec:	6a 5b                	push   $0x5b
80105eee:	e9 fb f7 ff ff       	jmp    801056ee <alltraps>

80105ef3 <vector92>:
80105ef3:	6a 00                	push   $0x0
80105ef5:	6a 5c                	push   $0x5c
80105ef7:	e9 f2 f7 ff ff       	jmp    801056ee <alltraps>

80105efc <vector93>:
80105efc:	6a 00                	push   $0x0
80105efe:	6a 5d                	push   $0x5d
80105f00:	e9 e9 f7 ff ff       	jmp    801056ee <alltraps>

80105f05 <vector94>:
80105f05:	6a 00                	push   $0x0
80105f07:	6a 5e                	push   $0x5e
80105f09:	e9 e0 f7 ff ff       	jmp    801056ee <alltraps>

80105f0e <vector95>:
80105f0e:	6a 00                	push   $0x0
80105f10:	6a 5f                	push   $0x5f
80105f12:	e9 d7 f7 ff ff       	jmp    801056ee <alltraps>

80105f17 <vector96>:
80105f17:	6a 00                	push   $0x0
80105f19:	6a 60                	push   $0x60
80105f1b:	e9 ce f7 ff ff       	jmp    801056ee <alltraps>

80105f20 <vector97>:
80105f20:	6a 00                	push   $0x0
80105f22:	6a 61                	push   $0x61
80105f24:	e9 c5 f7 ff ff       	jmp    801056ee <alltraps>

80105f29 <vector98>:
80105f29:	6a 00                	push   $0x0
80105f2b:	6a 62                	push   $0x62
80105f2d:	e9 bc f7 ff ff       	jmp    801056ee <alltraps>

80105f32 <vector99>:
80105f32:	6a 00                	push   $0x0
80105f34:	6a 63                	push   $0x63
80105f36:	e9 b3 f7 ff ff       	jmp    801056ee <alltraps>

80105f3b <vector100>:
80105f3b:	6a 00                	push   $0x0
80105f3d:	6a 64                	push   $0x64
80105f3f:	e9 aa f7 ff ff       	jmp    801056ee <alltraps>

80105f44 <vector101>:
80105f44:	6a 00                	push   $0x0
80105f46:	6a 65                	push   $0x65
80105f48:	e9 a1 f7 ff ff       	jmp    801056ee <alltraps>

80105f4d <vector102>:
80105f4d:	6a 00                	push   $0x0
80105f4f:	6a 66                	push   $0x66
80105f51:	e9 98 f7 ff ff       	jmp    801056ee <alltraps>

80105f56 <vector103>:
80105f56:	6a 00                	push   $0x0
80105f58:	6a 67                	push   $0x67
80105f5a:	e9 8f f7 ff ff       	jmp    801056ee <alltraps>

80105f5f <vector104>:
80105f5f:	6a 00                	push   $0x0
80105f61:	6a 68                	push   $0x68
80105f63:	e9 86 f7 ff ff       	jmp    801056ee <alltraps>

80105f68 <vector105>:
80105f68:	6a 00                	push   $0x0
80105f6a:	6a 69                	push   $0x69
80105f6c:	e9 7d f7 ff ff       	jmp    801056ee <alltraps>

80105f71 <vector106>:
80105f71:	6a 00                	push   $0x0
80105f73:	6a 6a                	push   $0x6a
80105f75:	e9 74 f7 ff ff       	jmp    801056ee <alltraps>

80105f7a <vector107>:
80105f7a:	6a 00                	push   $0x0
80105f7c:	6a 6b                	push   $0x6b
80105f7e:	e9 6b f7 ff ff       	jmp    801056ee <alltraps>

80105f83 <vector108>:
80105f83:	6a 00                	push   $0x0
80105f85:	6a 6c                	push   $0x6c
80105f87:	e9 62 f7 ff ff       	jmp    801056ee <alltraps>

80105f8c <vector109>:
80105f8c:	6a 00                	push   $0x0
80105f8e:	6a 6d                	push   $0x6d
80105f90:	e9 59 f7 ff ff       	jmp    801056ee <alltraps>

80105f95 <vector110>:
80105f95:	6a 00                	push   $0x0
80105f97:	6a 6e                	push   $0x6e
80105f99:	e9 50 f7 ff ff       	jmp    801056ee <alltraps>

80105f9e <vector111>:
80105f9e:	6a 00                	push   $0x0
80105fa0:	6a 6f                	push   $0x6f
80105fa2:	e9 47 f7 ff ff       	jmp    801056ee <alltraps>

80105fa7 <vector112>:
80105fa7:	6a 00                	push   $0x0
80105fa9:	6a 70                	push   $0x70
80105fab:	e9 3e f7 ff ff       	jmp    801056ee <alltraps>

80105fb0 <vector113>:
80105fb0:	6a 00                	push   $0x0
80105fb2:	6a 71                	push   $0x71
80105fb4:	e9 35 f7 ff ff       	jmp    801056ee <alltraps>

80105fb9 <vector114>:
80105fb9:	6a 00                	push   $0x0
80105fbb:	6a 72                	push   $0x72
80105fbd:	e9 2c f7 ff ff       	jmp    801056ee <alltraps>

80105fc2 <vector115>:
80105fc2:	6a 00                	push   $0x0
80105fc4:	6a 73                	push   $0x73
80105fc6:	e9 23 f7 ff ff       	jmp    801056ee <alltraps>

80105fcb <vector116>:
80105fcb:	6a 00                	push   $0x0
80105fcd:	6a 74                	push   $0x74
80105fcf:	e9 1a f7 ff ff       	jmp    801056ee <alltraps>

80105fd4 <vector117>:
80105fd4:	6a 00                	push   $0x0
80105fd6:	6a 75                	push   $0x75
80105fd8:	e9 11 f7 ff ff       	jmp    801056ee <alltraps>

80105fdd <vector118>:
80105fdd:	6a 00                	push   $0x0
80105fdf:	6a 76                	push   $0x76
80105fe1:	e9 08 f7 ff ff       	jmp    801056ee <alltraps>

80105fe6 <vector119>:
80105fe6:	6a 00                	push   $0x0
80105fe8:	6a 77                	push   $0x77
80105fea:	e9 ff f6 ff ff       	jmp    801056ee <alltraps>

80105fef <vector120>:
80105fef:	6a 00                	push   $0x0
80105ff1:	6a 78                	push   $0x78
80105ff3:	e9 f6 f6 ff ff       	jmp    801056ee <alltraps>

80105ff8 <vector121>:
80105ff8:	6a 00                	push   $0x0
80105ffa:	6a 79                	push   $0x79
80105ffc:	e9 ed f6 ff ff       	jmp    801056ee <alltraps>

80106001 <vector122>:
80106001:	6a 00                	push   $0x0
80106003:	6a 7a                	push   $0x7a
80106005:	e9 e4 f6 ff ff       	jmp    801056ee <alltraps>

8010600a <vector123>:
8010600a:	6a 00                	push   $0x0
8010600c:	6a 7b                	push   $0x7b
8010600e:	e9 db f6 ff ff       	jmp    801056ee <alltraps>

80106013 <vector124>:
80106013:	6a 00                	push   $0x0
80106015:	6a 7c                	push   $0x7c
80106017:	e9 d2 f6 ff ff       	jmp    801056ee <alltraps>

8010601c <vector125>:
8010601c:	6a 00                	push   $0x0
8010601e:	6a 7d                	push   $0x7d
80106020:	e9 c9 f6 ff ff       	jmp    801056ee <alltraps>

80106025 <vector126>:
80106025:	6a 00                	push   $0x0
80106027:	6a 7e                	push   $0x7e
80106029:	e9 c0 f6 ff ff       	jmp    801056ee <alltraps>

8010602e <vector127>:
8010602e:	6a 00                	push   $0x0
80106030:	6a 7f                	push   $0x7f
80106032:	e9 b7 f6 ff ff       	jmp    801056ee <alltraps>

80106037 <vector128>:
80106037:	6a 00                	push   $0x0
80106039:	68 80 00 00 00       	push   $0x80
8010603e:	e9 ab f6 ff ff       	jmp    801056ee <alltraps>

80106043 <vector129>:
80106043:	6a 00                	push   $0x0
80106045:	68 81 00 00 00       	push   $0x81
8010604a:	e9 9f f6 ff ff       	jmp    801056ee <alltraps>

8010604f <vector130>:
8010604f:	6a 00                	push   $0x0
80106051:	68 82 00 00 00       	push   $0x82
80106056:	e9 93 f6 ff ff       	jmp    801056ee <alltraps>

8010605b <vector131>:
8010605b:	6a 00                	push   $0x0
8010605d:	68 83 00 00 00       	push   $0x83
80106062:	e9 87 f6 ff ff       	jmp    801056ee <alltraps>

80106067 <vector132>:
80106067:	6a 00                	push   $0x0
80106069:	68 84 00 00 00       	push   $0x84
8010606e:	e9 7b f6 ff ff       	jmp    801056ee <alltraps>

80106073 <vector133>:
80106073:	6a 00                	push   $0x0
80106075:	68 85 00 00 00       	push   $0x85
8010607a:	e9 6f f6 ff ff       	jmp    801056ee <alltraps>

8010607f <vector134>:
8010607f:	6a 00                	push   $0x0
80106081:	68 86 00 00 00       	push   $0x86
80106086:	e9 63 f6 ff ff       	jmp    801056ee <alltraps>

8010608b <vector135>:
8010608b:	6a 00                	push   $0x0
8010608d:	68 87 00 00 00       	push   $0x87
80106092:	e9 57 f6 ff ff       	jmp    801056ee <alltraps>

80106097 <vector136>:
80106097:	6a 00                	push   $0x0
80106099:	68 88 00 00 00       	push   $0x88
8010609e:	e9 4b f6 ff ff       	jmp    801056ee <alltraps>

801060a3 <vector137>:
801060a3:	6a 00                	push   $0x0
801060a5:	68 89 00 00 00       	push   $0x89
801060aa:	e9 3f f6 ff ff       	jmp    801056ee <alltraps>

801060af <vector138>:
801060af:	6a 00                	push   $0x0
801060b1:	68 8a 00 00 00       	push   $0x8a
801060b6:	e9 33 f6 ff ff       	jmp    801056ee <alltraps>

801060bb <vector139>:
801060bb:	6a 00                	push   $0x0
801060bd:	68 8b 00 00 00       	push   $0x8b
801060c2:	e9 27 f6 ff ff       	jmp    801056ee <alltraps>

801060c7 <vector140>:
801060c7:	6a 00                	push   $0x0
801060c9:	68 8c 00 00 00       	push   $0x8c
801060ce:	e9 1b f6 ff ff       	jmp    801056ee <alltraps>

801060d3 <vector141>:
801060d3:	6a 00                	push   $0x0
801060d5:	68 8d 00 00 00       	push   $0x8d
801060da:	e9 0f f6 ff ff       	jmp    801056ee <alltraps>

801060df <vector142>:
801060df:	6a 00                	push   $0x0
801060e1:	68 8e 00 00 00       	push   $0x8e
801060e6:	e9 03 f6 ff ff       	jmp    801056ee <alltraps>

801060eb <vector143>:
801060eb:	6a 00                	push   $0x0
801060ed:	68 8f 00 00 00       	push   $0x8f
801060f2:	e9 f7 f5 ff ff       	jmp    801056ee <alltraps>

801060f7 <vector144>:
801060f7:	6a 00                	push   $0x0
801060f9:	68 90 00 00 00       	push   $0x90
801060fe:	e9 eb f5 ff ff       	jmp    801056ee <alltraps>

80106103 <vector145>:
80106103:	6a 00                	push   $0x0
80106105:	68 91 00 00 00       	push   $0x91
8010610a:	e9 df f5 ff ff       	jmp    801056ee <alltraps>

8010610f <vector146>:
8010610f:	6a 00                	push   $0x0
80106111:	68 92 00 00 00       	push   $0x92
80106116:	e9 d3 f5 ff ff       	jmp    801056ee <alltraps>

8010611b <vector147>:
8010611b:	6a 00                	push   $0x0
8010611d:	68 93 00 00 00       	push   $0x93
80106122:	e9 c7 f5 ff ff       	jmp    801056ee <alltraps>

80106127 <vector148>:
80106127:	6a 00                	push   $0x0
80106129:	68 94 00 00 00       	push   $0x94
8010612e:	e9 bb f5 ff ff       	jmp    801056ee <alltraps>

80106133 <vector149>:
80106133:	6a 00                	push   $0x0
80106135:	68 95 00 00 00       	push   $0x95
8010613a:	e9 af f5 ff ff       	jmp    801056ee <alltraps>

8010613f <vector150>:
8010613f:	6a 00                	push   $0x0
80106141:	68 96 00 00 00       	push   $0x96
80106146:	e9 a3 f5 ff ff       	jmp    801056ee <alltraps>

8010614b <vector151>:
8010614b:	6a 00                	push   $0x0
8010614d:	68 97 00 00 00       	push   $0x97
80106152:	e9 97 f5 ff ff       	jmp    801056ee <alltraps>

80106157 <vector152>:
80106157:	6a 00                	push   $0x0
80106159:	68 98 00 00 00       	push   $0x98
8010615e:	e9 8b f5 ff ff       	jmp    801056ee <alltraps>

80106163 <vector153>:
80106163:	6a 00                	push   $0x0
80106165:	68 99 00 00 00       	push   $0x99
8010616a:	e9 7f f5 ff ff       	jmp    801056ee <alltraps>

8010616f <vector154>:
8010616f:	6a 00                	push   $0x0
80106171:	68 9a 00 00 00       	push   $0x9a
80106176:	e9 73 f5 ff ff       	jmp    801056ee <alltraps>

8010617b <vector155>:
8010617b:	6a 00                	push   $0x0
8010617d:	68 9b 00 00 00       	push   $0x9b
80106182:	e9 67 f5 ff ff       	jmp    801056ee <alltraps>

80106187 <vector156>:
80106187:	6a 00                	push   $0x0
80106189:	68 9c 00 00 00       	push   $0x9c
8010618e:	e9 5b f5 ff ff       	jmp    801056ee <alltraps>

80106193 <vector157>:
80106193:	6a 00                	push   $0x0
80106195:	68 9d 00 00 00       	push   $0x9d
8010619a:	e9 4f f5 ff ff       	jmp    801056ee <alltraps>

8010619f <vector158>:
8010619f:	6a 00                	push   $0x0
801061a1:	68 9e 00 00 00       	push   $0x9e
801061a6:	e9 43 f5 ff ff       	jmp    801056ee <alltraps>

801061ab <vector159>:
801061ab:	6a 00                	push   $0x0
801061ad:	68 9f 00 00 00       	push   $0x9f
801061b2:	e9 37 f5 ff ff       	jmp    801056ee <alltraps>

801061b7 <vector160>:
801061b7:	6a 00                	push   $0x0
801061b9:	68 a0 00 00 00       	push   $0xa0
801061be:	e9 2b f5 ff ff       	jmp    801056ee <alltraps>

801061c3 <vector161>:
801061c3:	6a 00                	push   $0x0
801061c5:	68 a1 00 00 00       	push   $0xa1
801061ca:	e9 1f f5 ff ff       	jmp    801056ee <alltraps>

801061cf <vector162>:
801061cf:	6a 00                	push   $0x0
801061d1:	68 a2 00 00 00       	push   $0xa2
801061d6:	e9 13 f5 ff ff       	jmp    801056ee <alltraps>

801061db <vector163>:
801061db:	6a 00                	push   $0x0
801061dd:	68 a3 00 00 00       	push   $0xa3
801061e2:	e9 07 f5 ff ff       	jmp    801056ee <alltraps>

801061e7 <vector164>:
801061e7:	6a 00                	push   $0x0
801061e9:	68 a4 00 00 00       	push   $0xa4
801061ee:	e9 fb f4 ff ff       	jmp    801056ee <alltraps>

801061f3 <vector165>:
801061f3:	6a 00                	push   $0x0
801061f5:	68 a5 00 00 00       	push   $0xa5
801061fa:	e9 ef f4 ff ff       	jmp    801056ee <alltraps>

801061ff <vector166>:
801061ff:	6a 00                	push   $0x0
80106201:	68 a6 00 00 00       	push   $0xa6
80106206:	e9 e3 f4 ff ff       	jmp    801056ee <alltraps>

8010620b <vector167>:
8010620b:	6a 00                	push   $0x0
8010620d:	68 a7 00 00 00       	push   $0xa7
80106212:	e9 d7 f4 ff ff       	jmp    801056ee <alltraps>

80106217 <vector168>:
80106217:	6a 00                	push   $0x0
80106219:	68 a8 00 00 00       	push   $0xa8
8010621e:	e9 cb f4 ff ff       	jmp    801056ee <alltraps>

80106223 <vector169>:
80106223:	6a 00                	push   $0x0
80106225:	68 a9 00 00 00       	push   $0xa9
8010622a:	e9 bf f4 ff ff       	jmp    801056ee <alltraps>

8010622f <vector170>:
8010622f:	6a 00                	push   $0x0
80106231:	68 aa 00 00 00       	push   $0xaa
80106236:	e9 b3 f4 ff ff       	jmp    801056ee <alltraps>

8010623b <vector171>:
8010623b:	6a 00                	push   $0x0
8010623d:	68 ab 00 00 00       	push   $0xab
80106242:	e9 a7 f4 ff ff       	jmp    801056ee <alltraps>

80106247 <vector172>:
80106247:	6a 00                	push   $0x0
80106249:	68 ac 00 00 00       	push   $0xac
8010624e:	e9 9b f4 ff ff       	jmp    801056ee <alltraps>

80106253 <vector173>:
80106253:	6a 00                	push   $0x0
80106255:	68 ad 00 00 00       	push   $0xad
8010625a:	e9 8f f4 ff ff       	jmp    801056ee <alltraps>

8010625f <vector174>:
8010625f:	6a 00                	push   $0x0
80106261:	68 ae 00 00 00       	push   $0xae
80106266:	e9 83 f4 ff ff       	jmp    801056ee <alltraps>

8010626b <vector175>:
8010626b:	6a 00                	push   $0x0
8010626d:	68 af 00 00 00       	push   $0xaf
80106272:	e9 77 f4 ff ff       	jmp    801056ee <alltraps>

80106277 <vector176>:
80106277:	6a 00                	push   $0x0
80106279:	68 b0 00 00 00       	push   $0xb0
8010627e:	e9 6b f4 ff ff       	jmp    801056ee <alltraps>

80106283 <vector177>:
80106283:	6a 00                	push   $0x0
80106285:	68 b1 00 00 00       	push   $0xb1
8010628a:	e9 5f f4 ff ff       	jmp    801056ee <alltraps>

8010628f <vector178>:
8010628f:	6a 00                	push   $0x0
80106291:	68 b2 00 00 00       	push   $0xb2
80106296:	e9 53 f4 ff ff       	jmp    801056ee <alltraps>

8010629b <vector179>:
8010629b:	6a 00                	push   $0x0
8010629d:	68 b3 00 00 00       	push   $0xb3
801062a2:	e9 47 f4 ff ff       	jmp    801056ee <alltraps>

801062a7 <vector180>:
801062a7:	6a 00                	push   $0x0
801062a9:	68 b4 00 00 00       	push   $0xb4
801062ae:	e9 3b f4 ff ff       	jmp    801056ee <alltraps>

801062b3 <vector181>:
801062b3:	6a 00                	push   $0x0
801062b5:	68 b5 00 00 00       	push   $0xb5
801062ba:	e9 2f f4 ff ff       	jmp    801056ee <alltraps>

801062bf <vector182>:
801062bf:	6a 00                	push   $0x0
801062c1:	68 b6 00 00 00       	push   $0xb6
801062c6:	e9 23 f4 ff ff       	jmp    801056ee <alltraps>

801062cb <vector183>:
801062cb:	6a 00                	push   $0x0
801062cd:	68 b7 00 00 00       	push   $0xb7
801062d2:	e9 17 f4 ff ff       	jmp    801056ee <alltraps>

801062d7 <vector184>:
801062d7:	6a 00                	push   $0x0
801062d9:	68 b8 00 00 00       	push   $0xb8
801062de:	e9 0b f4 ff ff       	jmp    801056ee <alltraps>

801062e3 <vector185>:
801062e3:	6a 00                	push   $0x0
801062e5:	68 b9 00 00 00       	push   $0xb9
801062ea:	e9 ff f3 ff ff       	jmp    801056ee <alltraps>

801062ef <vector186>:
801062ef:	6a 00                	push   $0x0
801062f1:	68 ba 00 00 00       	push   $0xba
801062f6:	e9 f3 f3 ff ff       	jmp    801056ee <alltraps>

801062fb <vector187>:
801062fb:	6a 00                	push   $0x0
801062fd:	68 bb 00 00 00       	push   $0xbb
80106302:	e9 e7 f3 ff ff       	jmp    801056ee <alltraps>

80106307 <vector188>:
80106307:	6a 00                	push   $0x0
80106309:	68 bc 00 00 00       	push   $0xbc
8010630e:	e9 db f3 ff ff       	jmp    801056ee <alltraps>

80106313 <vector189>:
80106313:	6a 00                	push   $0x0
80106315:	68 bd 00 00 00       	push   $0xbd
8010631a:	e9 cf f3 ff ff       	jmp    801056ee <alltraps>

8010631f <vector190>:
8010631f:	6a 00                	push   $0x0
80106321:	68 be 00 00 00       	push   $0xbe
80106326:	e9 c3 f3 ff ff       	jmp    801056ee <alltraps>

8010632b <vector191>:
8010632b:	6a 00                	push   $0x0
8010632d:	68 bf 00 00 00       	push   $0xbf
80106332:	e9 b7 f3 ff ff       	jmp    801056ee <alltraps>

80106337 <vector192>:
80106337:	6a 00                	push   $0x0
80106339:	68 c0 00 00 00       	push   $0xc0
8010633e:	e9 ab f3 ff ff       	jmp    801056ee <alltraps>

80106343 <vector193>:
80106343:	6a 00                	push   $0x0
80106345:	68 c1 00 00 00       	push   $0xc1
8010634a:	e9 9f f3 ff ff       	jmp    801056ee <alltraps>

8010634f <vector194>:
8010634f:	6a 00                	push   $0x0
80106351:	68 c2 00 00 00       	push   $0xc2
80106356:	e9 93 f3 ff ff       	jmp    801056ee <alltraps>

8010635b <vector195>:
8010635b:	6a 00                	push   $0x0
8010635d:	68 c3 00 00 00       	push   $0xc3
80106362:	e9 87 f3 ff ff       	jmp    801056ee <alltraps>

80106367 <vector196>:
80106367:	6a 00                	push   $0x0
80106369:	68 c4 00 00 00       	push   $0xc4
8010636e:	e9 7b f3 ff ff       	jmp    801056ee <alltraps>

80106373 <vector197>:
80106373:	6a 00                	push   $0x0
80106375:	68 c5 00 00 00       	push   $0xc5
8010637a:	e9 6f f3 ff ff       	jmp    801056ee <alltraps>

8010637f <vector198>:
8010637f:	6a 00                	push   $0x0
80106381:	68 c6 00 00 00       	push   $0xc6
80106386:	e9 63 f3 ff ff       	jmp    801056ee <alltraps>

8010638b <vector199>:
8010638b:	6a 00                	push   $0x0
8010638d:	68 c7 00 00 00       	push   $0xc7
80106392:	e9 57 f3 ff ff       	jmp    801056ee <alltraps>

80106397 <vector200>:
80106397:	6a 00                	push   $0x0
80106399:	68 c8 00 00 00       	push   $0xc8
8010639e:	e9 4b f3 ff ff       	jmp    801056ee <alltraps>

801063a3 <vector201>:
801063a3:	6a 00                	push   $0x0
801063a5:	68 c9 00 00 00       	push   $0xc9
801063aa:	e9 3f f3 ff ff       	jmp    801056ee <alltraps>

801063af <vector202>:
801063af:	6a 00                	push   $0x0
801063b1:	68 ca 00 00 00       	push   $0xca
801063b6:	e9 33 f3 ff ff       	jmp    801056ee <alltraps>

801063bb <vector203>:
801063bb:	6a 00                	push   $0x0
801063bd:	68 cb 00 00 00       	push   $0xcb
801063c2:	e9 27 f3 ff ff       	jmp    801056ee <alltraps>

801063c7 <vector204>:
801063c7:	6a 00                	push   $0x0
801063c9:	68 cc 00 00 00       	push   $0xcc
801063ce:	e9 1b f3 ff ff       	jmp    801056ee <alltraps>

801063d3 <vector205>:
801063d3:	6a 00                	push   $0x0
801063d5:	68 cd 00 00 00       	push   $0xcd
801063da:	e9 0f f3 ff ff       	jmp    801056ee <alltraps>

801063df <vector206>:
801063df:	6a 00                	push   $0x0
801063e1:	68 ce 00 00 00       	push   $0xce
801063e6:	e9 03 f3 ff ff       	jmp    801056ee <alltraps>

801063eb <vector207>:
801063eb:	6a 00                	push   $0x0
801063ed:	68 cf 00 00 00       	push   $0xcf
801063f2:	e9 f7 f2 ff ff       	jmp    801056ee <alltraps>

801063f7 <vector208>:
801063f7:	6a 00                	push   $0x0
801063f9:	68 d0 00 00 00       	push   $0xd0
801063fe:	e9 eb f2 ff ff       	jmp    801056ee <alltraps>

80106403 <vector209>:
80106403:	6a 00                	push   $0x0
80106405:	68 d1 00 00 00       	push   $0xd1
8010640a:	e9 df f2 ff ff       	jmp    801056ee <alltraps>

8010640f <vector210>:
8010640f:	6a 00                	push   $0x0
80106411:	68 d2 00 00 00       	push   $0xd2
80106416:	e9 d3 f2 ff ff       	jmp    801056ee <alltraps>

8010641b <vector211>:
8010641b:	6a 00                	push   $0x0
8010641d:	68 d3 00 00 00       	push   $0xd3
80106422:	e9 c7 f2 ff ff       	jmp    801056ee <alltraps>

80106427 <vector212>:
80106427:	6a 00                	push   $0x0
80106429:	68 d4 00 00 00       	push   $0xd4
8010642e:	e9 bb f2 ff ff       	jmp    801056ee <alltraps>

80106433 <vector213>:
80106433:	6a 00                	push   $0x0
80106435:	68 d5 00 00 00       	push   $0xd5
8010643a:	e9 af f2 ff ff       	jmp    801056ee <alltraps>

8010643f <vector214>:
8010643f:	6a 00                	push   $0x0
80106441:	68 d6 00 00 00       	push   $0xd6
80106446:	e9 a3 f2 ff ff       	jmp    801056ee <alltraps>

8010644b <vector215>:
8010644b:	6a 00                	push   $0x0
8010644d:	68 d7 00 00 00       	push   $0xd7
80106452:	e9 97 f2 ff ff       	jmp    801056ee <alltraps>

80106457 <vector216>:
80106457:	6a 00                	push   $0x0
80106459:	68 d8 00 00 00       	push   $0xd8
8010645e:	e9 8b f2 ff ff       	jmp    801056ee <alltraps>

80106463 <vector217>:
80106463:	6a 00                	push   $0x0
80106465:	68 d9 00 00 00       	push   $0xd9
8010646a:	e9 7f f2 ff ff       	jmp    801056ee <alltraps>

8010646f <vector218>:
8010646f:	6a 00                	push   $0x0
80106471:	68 da 00 00 00       	push   $0xda
80106476:	e9 73 f2 ff ff       	jmp    801056ee <alltraps>

8010647b <vector219>:
8010647b:	6a 00                	push   $0x0
8010647d:	68 db 00 00 00       	push   $0xdb
80106482:	e9 67 f2 ff ff       	jmp    801056ee <alltraps>

80106487 <vector220>:
80106487:	6a 00                	push   $0x0
80106489:	68 dc 00 00 00       	push   $0xdc
8010648e:	e9 5b f2 ff ff       	jmp    801056ee <alltraps>

80106493 <vector221>:
80106493:	6a 00                	push   $0x0
80106495:	68 dd 00 00 00       	push   $0xdd
8010649a:	e9 4f f2 ff ff       	jmp    801056ee <alltraps>

8010649f <vector222>:
8010649f:	6a 00                	push   $0x0
801064a1:	68 de 00 00 00       	push   $0xde
801064a6:	e9 43 f2 ff ff       	jmp    801056ee <alltraps>

801064ab <vector223>:
801064ab:	6a 00                	push   $0x0
801064ad:	68 df 00 00 00       	push   $0xdf
801064b2:	e9 37 f2 ff ff       	jmp    801056ee <alltraps>

801064b7 <vector224>:
801064b7:	6a 00                	push   $0x0
801064b9:	68 e0 00 00 00       	push   $0xe0
801064be:	e9 2b f2 ff ff       	jmp    801056ee <alltraps>

801064c3 <vector225>:
801064c3:	6a 00                	push   $0x0
801064c5:	68 e1 00 00 00       	push   $0xe1
801064ca:	e9 1f f2 ff ff       	jmp    801056ee <alltraps>

801064cf <vector226>:
801064cf:	6a 00                	push   $0x0
801064d1:	68 e2 00 00 00       	push   $0xe2
801064d6:	e9 13 f2 ff ff       	jmp    801056ee <alltraps>

801064db <vector227>:
801064db:	6a 00                	push   $0x0
801064dd:	68 e3 00 00 00       	push   $0xe3
801064e2:	e9 07 f2 ff ff       	jmp    801056ee <alltraps>

801064e7 <vector228>:
801064e7:	6a 00                	push   $0x0
801064e9:	68 e4 00 00 00       	push   $0xe4
801064ee:	e9 fb f1 ff ff       	jmp    801056ee <alltraps>

801064f3 <vector229>:
801064f3:	6a 00                	push   $0x0
801064f5:	68 e5 00 00 00       	push   $0xe5
801064fa:	e9 ef f1 ff ff       	jmp    801056ee <alltraps>

801064ff <vector230>:
801064ff:	6a 00                	push   $0x0
80106501:	68 e6 00 00 00       	push   $0xe6
80106506:	e9 e3 f1 ff ff       	jmp    801056ee <alltraps>

8010650b <vector231>:
8010650b:	6a 00                	push   $0x0
8010650d:	68 e7 00 00 00       	push   $0xe7
80106512:	e9 d7 f1 ff ff       	jmp    801056ee <alltraps>

80106517 <vector232>:
80106517:	6a 00                	push   $0x0
80106519:	68 e8 00 00 00       	push   $0xe8
8010651e:	e9 cb f1 ff ff       	jmp    801056ee <alltraps>

80106523 <vector233>:
80106523:	6a 00                	push   $0x0
80106525:	68 e9 00 00 00       	push   $0xe9
8010652a:	e9 bf f1 ff ff       	jmp    801056ee <alltraps>

8010652f <vector234>:
8010652f:	6a 00                	push   $0x0
80106531:	68 ea 00 00 00       	push   $0xea
80106536:	e9 b3 f1 ff ff       	jmp    801056ee <alltraps>

8010653b <vector235>:
8010653b:	6a 00                	push   $0x0
8010653d:	68 eb 00 00 00       	push   $0xeb
80106542:	e9 a7 f1 ff ff       	jmp    801056ee <alltraps>

80106547 <vector236>:
80106547:	6a 00                	push   $0x0
80106549:	68 ec 00 00 00       	push   $0xec
8010654e:	e9 9b f1 ff ff       	jmp    801056ee <alltraps>

80106553 <vector237>:
80106553:	6a 00                	push   $0x0
80106555:	68 ed 00 00 00       	push   $0xed
8010655a:	e9 8f f1 ff ff       	jmp    801056ee <alltraps>

8010655f <vector238>:
8010655f:	6a 00                	push   $0x0
80106561:	68 ee 00 00 00       	push   $0xee
80106566:	e9 83 f1 ff ff       	jmp    801056ee <alltraps>

8010656b <vector239>:
8010656b:	6a 00                	push   $0x0
8010656d:	68 ef 00 00 00       	push   $0xef
80106572:	e9 77 f1 ff ff       	jmp    801056ee <alltraps>

80106577 <vector240>:
80106577:	6a 00                	push   $0x0
80106579:	68 f0 00 00 00       	push   $0xf0
8010657e:	e9 6b f1 ff ff       	jmp    801056ee <alltraps>

80106583 <vector241>:
80106583:	6a 00                	push   $0x0
80106585:	68 f1 00 00 00       	push   $0xf1
8010658a:	e9 5f f1 ff ff       	jmp    801056ee <alltraps>

8010658f <vector242>:
8010658f:	6a 00                	push   $0x0
80106591:	68 f2 00 00 00       	push   $0xf2
80106596:	e9 53 f1 ff ff       	jmp    801056ee <alltraps>

8010659b <vector243>:
8010659b:	6a 00                	push   $0x0
8010659d:	68 f3 00 00 00       	push   $0xf3
801065a2:	e9 47 f1 ff ff       	jmp    801056ee <alltraps>

801065a7 <vector244>:
801065a7:	6a 00                	push   $0x0
801065a9:	68 f4 00 00 00       	push   $0xf4
801065ae:	e9 3b f1 ff ff       	jmp    801056ee <alltraps>

801065b3 <vector245>:
801065b3:	6a 00                	push   $0x0
801065b5:	68 f5 00 00 00       	push   $0xf5
801065ba:	e9 2f f1 ff ff       	jmp    801056ee <alltraps>

801065bf <vector246>:
801065bf:	6a 00                	push   $0x0
801065c1:	68 f6 00 00 00       	push   $0xf6
801065c6:	e9 23 f1 ff ff       	jmp    801056ee <alltraps>

801065cb <vector247>:
801065cb:	6a 00                	push   $0x0
801065cd:	68 f7 00 00 00       	push   $0xf7
801065d2:	e9 17 f1 ff ff       	jmp    801056ee <alltraps>

801065d7 <vector248>:
801065d7:	6a 00                	push   $0x0
801065d9:	68 f8 00 00 00       	push   $0xf8
801065de:	e9 0b f1 ff ff       	jmp    801056ee <alltraps>

801065e3 <vector249>:
801065e3:	6a 00                	push   $0x0
801065e5:	68 f9 00 00 00       	push   $0xf9
801065ea:	e9 ff f0 ff ff       	jmp    801056ee <alltraps>

801065ef <vector250>:
801065ef:	6a 00                	push   $0x0
801065f1:	68 fa 00 00 00       	push   $0xfa
801065f6:	e9 f3 f0 ff ff       	jmp    801056ee <alltraps>

801065fb <vector251>:
801065fb:	6a 00                	push   $0x0
801065fd:	68 fb 00 00 00       	push   $0xfb
80106602:	e9 e7 f0 ff ff       	jmp    801056ee <alltraps>

80106607 <vector252>:
80106607:	6a 00                	push   $0x0
80106609:	68 fc 00 00 00       	push   $0xfc
8010660e:	e9 db f0 ff ff       	jmp    801056ee <alltraps>

80106613 <vector253>:
80106613:	6a 00                	push   $0x0
80106615:	68 fd 00 00 00       	push   $0xfd
8010661a:	e9 cf f0 ff ff       	jmp    801056ee <alltraps>

8010661f <vector254>:
8010661f:	6a 00                	push   $0x0
80106621:	68 fe 00 00 00       	push   $0xfe
80106626:	e9 c3 f0 ff ff       	jmp    801056ee <alltraps>

8010662b <vector255>:
8010662b:	6a 00                	push   $0x0
8010662d:	68 ff 00 00 00       	push   $0xff
80106632:	e9 b7 f0 ff ff       	jmp    801056ee <alltraps>
80106637:	66 90                	xchg   %ax,%ax
80106639:	66 90                	xchg   %ax,%ax
8010663b:	66 90                	xchg   %ax,%ax
8010663d:	66 90                	xchg   %ax,%ax
8010663f:	90                   	nop

80106640 <walkpgdir>:
80106640:	55                   	push   %ebp
80106641:	89 e5                	mov    %esp,%ebp
80106643:	57                   	push   %edi
80106644:	56                   	push   %esi
80106645:	53                   	push   %ebx
80106646:	89 d3                	mov    %edx,%ebx
80106648:	89 d7                	mov    %edx,%edi
8010664a:	c1 eb 16             	shr    $0x16,%ebx
8010664d:	8d 34 98             	lea    (%eax,%ebx,4),%esi
80106650:	83 ec 0c             	sub    $0xc,%esp
80106653:	8b 06                	mov    (%esi),%eax
80106655:	a8 01                	test   $0x1,%al
80106657:	74 27                	je     80106680 <walkpgdir+0x40>
80106659:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010665e:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
80106664:	c1 ef 0a             	shr    $0xa,%edi
80106667:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010666a:	89 fa                	mov    %edi,%edx
8010666c:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106672:	8d 04 13             	lea    (%ebx,%edx,1),%eax
80106675:	5b                   	pop    %ebx
80106676:	5e                   	pop    %esi
80106677:	5f                   	pop    %edi
80106678:	5d                   	pop    %ebp
80106679:	c3                   	ret    
8010667a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106680:	85 c9                	test   %ecx,%ecx
80106682:	74 2c                	je     801066b0 <walkpgdir+0x70>
80106684:	e8 f7 bd ff ff       	call   80102480 <kalloc>
80106689:	85 c0                	test   %eax,%eax
8010668b:	89 c3                	mov    %eax,%ebx
8010668d:	74 21                	je     801066b0 <walkpgdir+0x70>
8010668f:	83 ec 04             	sub    $0x4,%esp
80106692:	68 00 10 00 00       	push   $0x1000
80106697:	6a 00                	push   $0x0
80106699:	50                   	push   %eax
8010669a:	e8 11 de ff ff       	call   801044b0 <memset>
8010669f:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801066a5:	83 c4 10             	add    $0x10,%esp
801066a8:	83 c8 07             	or     $0x7,%eax
801066ab:	89 06                	mov    %eax,(%esi)
801066ad:	eb b5                	jmp    80106664 <walkpgdir+0x24>
801066af:	90                   	nop
801066b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801066b3:	31 c0                	xor    %eax,%eax
801066b5:	5b                   	pop    %ebx
801066b6:	5e                   	pop    %esi
801066b7:	5f                   	pop    %edi
801066b8:	5d                   	pop    %ebp
801066b9:	c3                   	ret    
801066ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801066c0 <mappages>:
801066c0:	55                   	push   %ebp
801066c1:	89 e5                	mov    %esp,%ebp
801066c3:	57                   	push   %edi
801066c4:	56                   	push   %esi
801066c5:	53                   	push   %ebx
801066c6:	89 d3                	mov    %edx,%ebx
801066c8:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801066ce:	83 ec 1c             	sub    $0x1c,%esp
801066d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801066d4:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
801066d8:	8b 7d 08             	mov    0x8(%ebp),%edi
801066db:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801066e0:	89 45 e0             	mov    %eax,-0x20(%ebp)
801066e3:	8b 45 0c             	mov    0xc(%ebp),%eax
801066e6:	29 df                	sub    %ebx,%edi
801066e8:	83 c8 01             	or     $0x1,%eax
801066eb:	89 45 dc             	mov    %eax,-0x24(%ebp)
801066ee:	eb 15                	jmp    80106705 <mappages+0x45>
801066f0:	f6 00 01             	testb  $0x1,(%eax)
801066f3:	75 45                	jne    8010673a <mappages+0x7a>
801066f5:	0b 75 dc             	or     -0x24(%ebp),%esi
801066f8:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
801066fb:	89 30                	mov    %esi,(%eax)
801066fd:	74 31                	je     80106730 <mappages+0x70>
801066ff:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106705:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106708:	b9 01 00 00 00       	mov    $0x1,%ecx
8010670d:	89 da                	mov    %ebx,%edx
8010670f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106712:	e8 29 ff ff ff       	call   80106640 <walkpgdir>
80106717:	85 c0                	test   %eax,%eax
80106719:	75 d5                	jne    801066f0 <mappages+0x30>
8010671b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010671e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106723:	5b                   	pop    %ebx
80106724:	5e                   	pop    %esi
80106725:	5f                   	pop    %edi
80106726:	5d                   	pop    %ebp
80106727:	c3                   	ret    
80106728:	90                   	nop
80106729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106730:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106733:	31 c0                	xor    %eax,%eax
80106735:	5b                   	pop    %ebx
80106736:	5e                   	pop    %esi
80106737:	5f                   	pop    %edi
80106738:	5d                   	pop    %ebp
80106739:	c3                   	ret    
8010673a:	83 ec 0c             	sub    $0xc,%esp
8010673d:	68 f0 78 10 80       	push   $0x801078f0
80106742:	e8 29 9c ff ff       	call   80100370 <panic>
80106747:	89 f6                	mov    %esi,%esi
80106749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106750 <deallocuvm.part.0>:
80106750:	55                   	push   %ebp
80106751:	89 e5                	mov    %esp,%ebp
80106753:	57                   	push   %edi
80106754:	56                   	push   %esi
80106755:	53                   	push   %ebx
80106756:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
8010675c:	89 c7                	mov    %eax,%edi
8010675e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106764:	83 ec 1c             	sub    $0x1c,%esp
80106767:	89 4d e0             	mov    %ecx,-0x20(%ebp)
8010676a:	39 d3                	cmp    %edx,%ebx
8010676c:	73 60                	jae    801067ce <deallocuvm.part.0+0x7e>
8010676e:	89 d6                	mov    %edx,%esi
80106770:	eb 3d                	jmp    801067af <deallocuvm.part.0+0x5f>
80106772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106778:	8b 10                	mov    (%eax),%edx
8010677a:	f6 c2 01             	test   $0x1,%dl
8010677d:	74 26                	je     801067a5 <deallocuvm.part.0+0x55>
8010677f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106785:	74 52                	je     801067d9 <deallocuvm.part.0+0x89>
80106787:	83 ec 0c             	sub    $0xc,%esp
8010678a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106790:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106793:	52                   	push   %edx
80106794:	e8 37 bb ff ff       	call   801022d0 <kfree>
80106799:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010679c:	83 c4 10             	add    $0x10,%esp
8010679f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801067a5:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801067ab:	39 f3                	cmp    %esi,%ebx
801067ad:	73 1f                	jae    801067ce <deallocuvm.part.0+0x7e>
801067af:	31 c9                	xor    %ecx,%ecx
801067b1:	89 da                	mov    %ebx,%edx
801067b3:	89 f8                	mov    %edi,%eax
801067b5:	e8 86 fe ff ff       	call   80106640 <walkpgdir>
801067ba:	85 c0                	test   %eax,%eax
801067bc:	75 ba                	jne    80106778 <deallocuvm.part.0+0x28>
801067be:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
801067c4:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801067ca:	39 f3                	cmp    %esi,%ebx
801067cc:	72 e1                	jb     801067af <deallocuvm.part.0+0x5f>
801067ce:	8b 45 e0             	mov    -0x20(%ebp),%eax
801067d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801067d4:	5b                   	pop    %ebx
801067d5:	5e                   	pop    %esi
801067d6:	5f                   	pop    %edi
801067d7:	5d                   	pop    %ebp
801067d8:	c3                   	ret    
801067d9:	83 ec 0c             	sub    $0xc,%esp
801067dc:	68 b2 71 10 80       	push   $0x801071b2
801067e1:	e8 8a 9b ff ff       	call   80100370 <panic>
801067e6:	8d 76 00             	lea    0x0(%esi),%esi
801067e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801067f0 <seginit>:
801067f0:	55                   	push   %ebp
801067f1:	89 e5                	mov    %esp,%ebp
801067f3:	53                   	push   %ebx
801067f4:	31 db                	xor    %ebx,%ebx
801067f6:	83 ec 14             	sub    $0x14,%esp
801067f9:	e8 f2 be ff ff       	call   801026f0 <cpunum>
801067fe:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80106804:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106809:	8d 90 a0 27 11 80    	lea    -0x7feed860(%eax),%edx
8010680f:	c6 80 1d 28 11 80 9a 	movb   $0x9a,-0x7feed7e3(%eax)
80106816:	c6 80 1e 28 11 80 cf 	movb   $0xcf,-0x7feed7e2(%eax)
8010681d:	c6 80 25 28 11 80 92 	movb   $0x92,-0x7feed7db(%eax)
80106824:	c6 80 26 28 11 80 cf 	movb   $0xcf,-0x7feed7da(%eax)
8010682b:	66 89 4a 78          	mov    %cx,0x78(%edx)
8010682f:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106834:	66 89 5a 7a          	mov    %bx,0x7a(%edx)
80106838:	66 89 8a 80 00 00 00 	mov    %cx,0x80(%edx)
8010683f:	31 db                	xor    %ebx,%ebx
80106841:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106846:	66 89 9a 82 00 00 00 	mov    %bx,0x82(%edx)
8010684d:	66 89 8a 90 00 00 00 	mov    %cx,0x90(%edx)
80106854:	31 db                	xor    %ebx,%ebx
80106856:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
8010685b:	66 89 9a 92 00 00 00 	mov    %bx,0x92(%edx)
80106862:	31 db                	xor    %ebx,%ebx
80106864:	66 89 8a 98 00 00 00 	mov    %cx,0x98(%edx)
8010686b:	8d 88 54 28 11 80    	lea    -0x7feed7ac(%eax),%ecx
80106871:	66 89 9a 9a 00 00 00 	mov    %bx,0x9a(%edx)
80106878:	31 db                	xor    %ebx,%ebx
8010687a:	c6 80 35 28 11 80 fa 	movb   $0xfa,-0x7feed7cb(%eax)
80106881:	c6 80 36 28 11 80 cf 	movb   $0xcf,-0x7feed7ca(%eax)
80106888:	66 89 9a 88 00 00 00 	mov    %bx,0x88(%edx)
8010688f:	66 89 8a 8a 00 00 00 	mov    %cx,0x8a(%edx)
80106896:	89 cb                	mov    %ecx,%ebx
80106898:	c1 e9 18             	shr    $0x18,%ecx
8010689b:	c6 80 3d 28 11 80 f2 	movb   $0xf2,-0x7feed7c3(%eax)
801068a2:	c6 80 3e 28 11 80 cf 	movb   $0xcf,-0x7feed7c2(%eax)
801068a9:	88 8a 8f 00 00 00    	mov    %cl,0x8f(%edx)
801068af:	c6 80 2d 28 11 80 92 	movb   $0x92,-0x7feed7d3(%eax)
801068b6:	b9 37 00 00 00       	mov    $0x37,%ecx
801068bb:	c6 80 2e 28 11 80 c0 	movb   $0xc0,-0x7feed7d2(%eax)
801068c2:	05 10 28 11 80       	add    $0x80112810,%eax
801068c7:	66 89 4d f2          	mov    %cx,-0xe(%ebp)
801068cb:	c1 eb 10             	shr    $0x10,%ebx
801068ce:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
801068d2:	c1 e8 10             	shr    $0x10,%eax
801068d5:	c6 42 7c 00          	movb   $0x0,0x7c(%edx)
801068d9:	c6 42 7f 00          	movb   $0x0,0x7f(%edx)
801068dd:	c6 82 84 00 00 00 00 	movb   $0x0,0x84(%edx)
801068e4:	c6 82 87 00 00 00 00 	movb   $0x0,0x87(%edx)
801068eb:	c6 82 94 00 00 00 00 	movb   $0x0,0x94(%edx)
801068f2:	c6 82 97 00 00 00 00 	movb   $0x0,0x97(%edx)
801068f9:	c6 82 9c 00 00 00 00 	movb   $0x0,0x9c(%edx)
80106900:	c6 82 9f 00 00 00 00 	movb   $0x0,0x9f(%edx)
80106907:	88 9a 8c 00 00 00    	mov    %bl,0x8c(%edx)
8010690d:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
80106911:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106914:	0f 01 10             	lgdtl  (%eax)
80106917:	b8 18 00 00 00       	mov    $0x18,%eax
8010691c:	8e e8                	mov    %eax,%gs
8010691e:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80106925:	00 00 00 00 
80106929:	65 89 15 00 00 00 00 	mov    %edx,%gs:0x0
80106930:	83 c4 14             	add    $0x14,%esp
80106933:	5b                   	pop    %ebx
80106934:	5d                   	pop    %ebp
80106935:	c3                   	ret    
80106936:	8d 76 00             	lea    0x0(%esi),%esi
80106939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106940 <setupkvm>:
80106940:	55                   	push   %ebp
80106941:	89 e5                	mov    %esp,%ebp
80106943:	56                   	push   %esi
80106944:	53                   	push   %ebx
80106945:	e8 36 bb ff ff       	call   80102480 <kalloc>
8010694a:	85 c0                	test   %eax,%eax
8010694c:	74 52                	je     801069a0 <setupkvm+0x60>
8010694e:	83 ec 04             	sub    $0x4,%esp
80106951:	89 c6                	mov    %eax,%esi
80106953:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
80106958:	68 00 10 00 00       	push   $0x1000
8010695d:	6a 00                	push   $0x0
8010695f:	50                   	push   %eax
80106960:	e8 4b db ff ff       	call   801044b0 <memset>
80106965:	83 c4 10             	add    $0x10,%esp
80106968:	8b 43 04             	mov    0x4(%ebx),%eax
8010696b:	8b 4b 08             	mov    0x8(%ebx),%ecx
8010696e:	83 ec 08             	sub    $0x8,%esp
80106971:	8b 13                	mov    (%ebx),%edx
80106973:	ff 73 0c             	pushl  0xc(%ebx)
80106976:	50                   	push   %eax
80106977:	29 c1                	sub    %eax,%ecx
80106979:	89 f0                	mov    %esi,%eax
8010697b:	e8 40 fd ff ff       	call   801066c0 <mappages>
80106980:	83 c4 10             	add    $0x10,%esp
80106983:	85 c0                	test   %eax,%eax
80106985:	78 19                	js     801069a0 <setupkvm+0x60>
80106987:	83 c3 10             	add    $0x10,%ebx
8010698a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106990:	72 d6                	jb     80106968 <setupkvm+0x28>
80106992:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106995:	89 f0                	mov    %esi,%eax
80106997:	5b                   	pop    %ebx
80106998:	5e                   	pop    %esi
80106999:	5d                   	pop    %ebp
8010699a:	c3                   	ret    
8010699b:	90                   	nop
8010699c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801069a0:	8d 65 f8             	lea    -0x8(%ebp),%esp
801069a3:	31 f6                	xor    %esi,%esi
801069a5:	89 f0                	mov    %esi,%eax
801069a7:	5b                   	pop    %ebx
801069a8:	5e                   	pop    %esi
801069a9:	5d                   	pop    %ebp
801069aa:	c3                   	ret    
801069ab:	90                   	nop
801069ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801069b0 <kvmalloc>:
801069b0:	55                   	push   %ebp
801069b1:	89 e5                	mov    %esp,%ebp
801069b3:	83 ec 08             	sub    $0x8,%esp
801069b6:	e8 85 ff ff ff       	call   80106940 <setupkvm>
801069bb:	a3 24 55 11 80       	mov    %eax,0x80115524
801069c0:	05 00 00 00 80       	add    $0x80000000,%eax
801069c5:	0f 22 d8             	mov    %eax,%cr3
801069c8:	c9                   	leave  
801069c9:	c3                   	ret    
801069ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801069d0 <switchkvm>:
801069d0:	a1 24 55 11 80       	mov    0x80115524,%eax
801069d5:	55                   	push   %ebp
801069d6:	89 e5                	mov    %esp,%ebp
801069d8:	05 00 00 00 80       	add    $0x80000000,%eax
801069dd:	0f 22 d8             	mov    %eax,%cr3
801069e0:	5d                   	pop    %ebp
801069e1:	c3                   	ret    
801069e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801069e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801069f0 <switchuvm>:
801069f0:	55                   	push   %ebp
801069f1:	89 e5                	mov    %esp,%ebp
801069f3:	53                   	push   %ebx
801069f4:	83 ec 04             	sub    $0x4,%esp
801069f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801069fa:	e8 e1 d9 ff ff       	call   801043e0 <pushcli>
801069ff:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80106a05:	b9 67 00 00 00       	mov    $0x67,%ecx
80106a0a:	8d 50 08             	lea    0x8(%eax),%edx
80106a0d:	66 89 88 a0 00 00 00 	mov    %cx,0xa0(%eax)
80106a14:	c6 80 a6 00 00 00 40 	movb   $0x40,0xa6(%eax)
80106a1b:	c6 80 a5 00 00 00 89 	movb   $0x89,0xa5(%eax)
80106a22:	66 89 90 a2 00 00 00 	mov    %dx,0xa2(%eax)
80106a29:	89 d1                	mov    %edx,%ecx
80106a2b:	c1 ea 18             	shr    $0x18,%edx
80106a2e:	88 90 a7 00 00 00    	mov    %dl,0xa7(%eax)
80106a34:	ba 10 00 00 00       	mov    $0x10,%edx
80106a39:	c1 e9 10             	shr    $0x10,%ecx
80106a3c:	66 89 50 10          	mov    %dx,0x10(%eax)
80106a40:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80106a47:	88 88 a4 00 00 00    	mov    %cl,0xa4(%eax)
80106a4d:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106a52:	8b 52 08             	mov    0x8(%edx),%edx
80106a55:	66 89 48 6e          	mov    %cx,0x6e(%eax)
80106a59:	81 c2 00 10 00 00    	add    $0x1000,%edx
80106a5f:	89 50 0c             	mov    %edx,0xc(%eax)
80106a62:	b8 30 00 00 00       	mov    $0x30,%eax
80106a67:	0f 00 d8             	ltr    %ax
80106a6a:	8b 43 04             	mov    0x4(%ebx),%eax
80106a6d:	85 c0                	test   %eax,%eax
80106a6f:	74 11                	je     80106a82 <switchuvm+0x92>
80106a71:	05 00 00 00 80       	add    $0x80000000,%eax
80106a76:	0f 22 d8             	mov    %eax,%cr3
80106a79:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80106a7c:	c9                   	leave  
80106a7d:	e9 8e d9 ff ff       	jmp    80104410 <popcli>
80106a82:	83 ec 0c             	sub    $0xc,%esp
80106a85:	68 f6 78 10 80       	push   $0x801078f6
80106a8a:	e8 e1 98 ff ff       	call   80100370 <panic>
80106a8f:	90                   	nop

80106a90 <inituvm>:
80106a90:	55                   	push   %ebp
80106a91:	89 e5                	mov    %esp,%ebp
80106a93:	57                   	push   %edi
80106a94:	56                   	push   %esi
80106a95:	53                   	push   %ebx
80106a96:	83 ec 1c             	sub    $0x1c,%esp
80106a99:	8b 75 10             	mov    0x10(%ebp),%esi
80106a9c:	8b 45 08             	mov    0x8(%ebp),%eax
80106a9f:	8b 7d 0c             	mov    0xc(%ebp),%edi
80106aa2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106aa8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106aab:	77 49                	ja     80106af6 <inituvm+0x66>
80106aad:	e8 ce b9 ff ff       	call   80102480 <kalloc>
80106ab2:	83 ec 04             	sub    $0x4,%esp
80106ab5:	89 c3                	mov    %eax,%ebx
80106ab7:	68 00 10 00 00       	push   $0x1000
80106abc:	6a 00                	push   $0x0
80106abe:	50                   	push   %eax
80106abf:	e8 ec d9 ff ff       	call   801044b0 <memset>
80106ac4:	58                   	pop    %eax
80106ac5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106acb:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106ad0:	5a                   	pop    %edx
80106ad1:	6a 06                	push   $0x6
80106ad3:	50                   	push   %eax
80106ad4:	31 d2                	xor    %edx,%edx
80106ad6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106ad9:	e8 e2 fb ff ff       	call   801066c0 <mappages>
80106ade:	89 75 10             	mov    %esi,0x10(%ebp)
80106ae1:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106ae4:	83 c4 10             	add    $0x10,%esp
80106ae7:	89 5d 08             	mov    %ebx,0x8(%ebp)
80106aea:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106aed:	5b                   	pop    %ebx
80106aee:	5e                   	pop    %esi
80106aef:	5f                   	pop    %edi
80106af0:	5d                   	pop    %ebp
80106af1:	e9 6a da ff ff       	jmp    80104560 <memmove>
80106af6:	83 ec 0c             	sub    $0xc,%esp
80106af9:	68 0a 79 10 80       	push   $0x8010790a
80106afe:	e8 6d 98 ff ff       	call   80100370 <panic>
80106b03:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106b10 <loaduvm>:
80106b10:	55                   	push   %ebp
80106b11:	89 e5                	mov    %esp,%ebp
80106b13:	57                   	push   %edi
80106b14:	56                   	push   %esi
80106b15:	53                   	push   %ebx
80106b16:	83 ec 0c             	sub    $0xc,%esp
80106b19:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106b20:	0f 85 91 00 00 00    	jne    80106bb7 <loaduvm+0xa7>
80106b26:	8b 75 18             	mov    0x18(%ebp),%esi
80106b29:	31 db                	xor    %ebx,%ebx
80106b2b:	85 f6                	test   %esi,%esi
80106b2d:	75 1a                	jne    80106b49 <loaduvm+0x39>
80106b2f:	eb 6f                	jmp    80106ba0 <loaduvm+0x90>
80106b31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106b38:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106b3e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106b44:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106b47:	76 57                	jbe    80106ba0 <loaduvm+0x90>
80106b49:	8b 55 0c             	mov    0xc(%ebp),%edx
80106b4c:	8b 45 08             	mov    0x8(%ebp),%eax
80106b4f:	31 c9                	xor    %ecx,%ecx
80106b51:	01 da                	add    %ebx,%edx
80106b53:	e8 e8 fa ff ff       	call   80106640 <walkpgdir>
80106b58:	85 c0                	test   %eax,%eax
80106b5a:	74 4e                	je     80106baa <loaduvm+0x9a>
80106b5c:	8b 00                	mov    (%eax),%eax
80106b5e:	8b 4d 14             	mov    0x14(%ebp),%ecx
80106b61:	bf 00 10 00 00       	mov    $0x1000,%edi
80106b66:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106b6b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106b71:	0f 46 fe             	cmovbe %esi,%edi
80106b74:	01 d9                	add    %ebx,%ecx
80106b76:	05 00 00 00 80       	add    $0x80000000,%eax
80106b7b:	57                   	push   %edi
80106b7c:	51                   	push   %ecx
80106b7d:	50                   	push   %eax
80106b7e:	ff 75 10             	pushl  0x10(%ebp)
80106b81:	e8 9a ad ff ff       	call   80101920 <readi>
80106b86:	83 c4 10             	add    $0x10,%esp
80106b89:	39 c7                	cmp    %eax,%edi
80106b8b:	74 ab                	je     80106b38 <loaduvm+0x28>
80106b8d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106b95:	5b                   	pop    %ebx
80106b96:	5e                   	pop    %esi
80106b97:	5f                   	pop    %edi
80106b98:	5d                   	pop    %ebp
80106b99:	c3                   	ret    
80106b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106ba0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ba3:	31 c0                	xor    %eax,%eax
80106ba5:	5b                   	pop    %ebx
80106ba6:	5e                   	pop    %esi
80106ba7:	5f                   	pop    %edi
80106ba8:	5d                   	pop    %ebp
80106ba9:	c3                   	ret    
80106baa:	83 ec 0c             	sub    $0xc,%esp
80106bad:	68 24 79 10 80       	push   $0x80107924
80106bb2:	e8 b9 97 ff ff       	call   80100370 <panic>
80106bb7:	83 ec 0c             	sub    $0xc,%esp
80106bba:	68 c8 79 10 80       	push   $0x801079c8
80106bbf:	e8 ac 97 ff ff       	call   80100370 <panic>
80106bc4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106bca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106bd0 <allocuvm>:
80106bd0:	55                   	push   %ebp
80106bd1:	89 e5                	mov    %esp,%ebp
80106bd3:	57                   	push   %edi
80106bd4:	56                   	push   %esi
80106bd5:	53                   	push   %ebx
80106bd6:	83 ec 0c             	sub    $0xc,%esp
80106bd9:	8b 7d 10             	mov    0x10(%ebp),%edi
80106bdc:	85 ff                	test   %edi,%edi
80106bde:	78 7b                	js     80106c5b <allocuvm+0x8b>
80106be0:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106be3:	8b 45 0c             	mov    0xc(%ebp),%eax
80106be6:	72 75                	jb     80106c5d <allocuvm+0x8d>
80106be8:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106bee:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106bf4:	39 df                	cmp    %ebx,%edi
80106bf6:	77 43                	ja     80106c3b <allocuvm+0x6b>
80106bf8:	eb 6e                	jmp    80106c68 <allocuvm+0x98>
80106bfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106c00:	83 ec 04             	sub    $0x4,%esp
80106c03:	68 00 10 00 00       	push   $0x1000
80106c08:	6a 00                	push   $0x0
80106c0a:	50                   	push   %eax
80106c0b:	e8 a0 d8 ff ff       	call   801044b0 <memset>
80106c10:	58                   	pop    %eax
80106c11:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106c17:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106c1c:	5a                   	pop    %edx
80106c1d:	6a 06                	push   $0x6
80106c1f:	50                   	push   %eax
80106c20:	89 da                	mov    %ebx,%edx
80106c22:	8b 45 08             	mov    0x8(%ebp),%eax
80106c25:	e8 96 fa ff ff       	call   801066c0 <mappages>
80106c2a:	83 c4 10             	add    $0x10,%esp
80106c2d:	85 c0                	test   %eax,%eax
80106c2f:	78 47                	js     80106c78 <allocuvm+0xa8>
80106c31:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106c37:	39 df                	cmp    %ebx,%edi
80106c39:	76 2d                	jbe    80106c68 <allocuvm+0x98>
80106c3b:	e8 40 b8 ff ff       	call   80102480 <kalloc>
80106c40:	85 c0                	test   %eax,%eax
80106c42:	89 c6                	mov    %eax,%esi
80106c44:	75 ba                	jne    80106c00 <allocuvm+0x30>
80106c46:	83 ec 0c             	sub    $0xc,%esp
80106c49:	68 42 79 10 80       	push   $0x80107942
80106c4e:	e8 0d 9a ff ff       	call   80100660 <cprintf>
80106c53:	83 c4 10             	add    $0x10,%esp
80106c56:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106c59:	77 4f                	ja     80106caa <allocuvm+0xda>
80106c5b:	31 c0                	xor    %eax,%eax
80106c5d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c60:	5b                   	pop    %ebx
80106c61:	5e                   	pop    %esi
80106c62:	5f                   	pop    %edi
80106c63:	5d                   	pop    %ebp
80106c64:	c3                   	ret    
80106c65:	8d 76 00             	lea    0x0(%esi),%esi
80106c68:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c6b:	89 f8                	mov    %edi,%eax
80106c6d:	5b                   	pop    %ebx
80106c6e:	5e                   	pop    %esi
80106c6f:	5f                   	pop    %edi
80106c70:	5d                   	pop    %ebp
80106c71:	c3                   	ret    
80106c72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106c78:	83 ec 0c             	sub    $0xc,%esp
80106c7b:	68 5a 79 10 80       	push   $0x8010795a
80106c80:	e8 db 99 ff ff       	call   80100660 <cprintf>
80106c85:	83 c4 10             	add    $0x10,%esp
80106c88:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106c8b:	76 0d                	jbe    80106c9a <allocuvm+0xca>
80106c8d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106c90:	8b 45 08             	mov    0x8(%ebp),%eax
80106c93:	89 fa                	mov    %edi,%edx
80106c95:	e8 b6 fa ff ff       	call   80106750 <deallocuvm.part.0>
80106c9a:	83 ec 0c             	sub    $0xc,%esp
80106c9d:	56                   	push   %esi
80106c9e:	e8 2d b6 ff ff       	call   801022d0 <kfree>
80106ca3:	83 c4 10             	add    $0x10,%esp
80106ca6:	31 c0                	xor    %eax,%eax
80106ca8:	eb b3                	jmp    80106c5d <allocuvm+0x8d>
80106caa:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106cad:	8b 45 08             	mov    0x8(%ebp),%eax
80106cb0:	89 fa                	mov    %edi,%edx
80106cb2:	e8 99 fa ff ff       	call   80106750 <deallocuvm.part.0>
80106cb7:	31 c0                	xor    %eax,%eax
80106cb9:	eb a2                	jmp    80106c5d <allocuvm+0x8d>
80106cbb:	90                   	nop
80106cbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106cc0 <deallocuvm>:
80106cc0:	55                   	push   %ebp
80106cc1:	89 e5                	mov    %esp,%ebp
80106cc3:	8b 55 0c             	mov    0xc(%ebp),%edx
80106cc6:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106cc9:	8b 45 08             	mov    0x8(%ebp),%eax
80106ccc:	39 d1                	cmp    %edx,%ecx
80106cce:	73 10                	jae    80106ce0 <deallocuvm+0x20>
80106cd0:	5d                   	pop    %ebp
80106cd1:	e9 7a fa ff ff       	jmp    80106750 <deallocuvm.part.0>
80106cd6:	8d 76 00             	lea    0x0(%esi),%esi
80106cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106ce0:	89 d0                	mov    %edx,%eax
80106ce2:	5d                   	pop    %ebp
80106ce3:	c3                   	ret    
80106ce4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106cea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106cf0 <freevm>:
80106cf0:	55                   	push   %ebp
80106cf1:	89 e5                	mov    %esp,%ebp
80106cf3:	57                   	push   %edi
80106cf4:	56                   	push   %esi
80106cf5:	53                   	push   %ebx
80106cf6:	83 ec 0c             	sub    $0xc,%esp
80106cf9:	8b 75 08             	mov    0x8(%ebp),%esi
80106cfc:	85 f6                	test   %esi,%esi
80106cfe:	74 59                	je     80106d59 <freevm+0x69>
80106d00:	31 c9                	xor    %ecx,%ecx
80106d02:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106d07:	89 f0                	mov    %esi,%eax
80106d09:	e8 42 fa ff ff       	call   80106750 <deallocuvm.part.0>
80106d0e:	89 f3                	mov    %esi,%ebx
80106d10:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106d16:	eb 0f                	jmp    80106d27 <freevm+0x37>
80106d18:	90                   	nop
80106d19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d20:	83 c3 04             	add    $0x4,%ebx
80106d23:	39 fb                	cmp    %edi,%ebx
80106d25:	74 23                	je     80106d4a <freevm+0x5a>
80106d27:	8b 03                	mov    (%ebx),%eax
80106d29:	a8 01                	test   $0x1,%al
80106d2b:	74 f3                	je     80106d20 <freevm+0x30>
80106d2d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106d32:	83 ec 0c             	sub    $0xc,%esp
80106d35:	83 c3 04             	add    $0x4,%ebx
80106d38:	05 00 00 00 80       	add    $0x80000000,%eax
80106d3d:	50                   	push   %eax
80106d3e:	e8 8d b5 ff ff       	call   801022d0 <kfree>
80106d43:	83 c4 10             	add    $0x10,%esp
80106d46:	39 fb                	cmp    %edi,%ebx
80106d48:	75 dd                	jne    80106d27 <freevm+0x37>
80106d4a:	89 75 08             	mov    %esi,0x8(%ebp)
80106d4d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d50:	5b                   	pop    %ebx
80106d51:	5e                   	pop    %esi
80106d52:	5f                   	pop    %edi
80106d53:	5d                   	pop    %ebp
80106d54:	e9 77 b5 ff ff       	jmp    801022d0 <kfree>
80106d59:	83 ec 0c             	sub    $0xc,%esp
80106d5c:	68 76 79 10 80       	push   $0x80107976
80106d61:	e8 0a 96 ff ff       	call   80100370 <panic>
80106d66:	8d 76 00             	lea    0x0(%esi),%esi
80106d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106d70 <clearpteu>:
80106d70:	55                   	push   %ebp
80106d71:	31 c9                	xor    %ecx,%ecx
80106d73:	89 e5                	mov    %esp,%ebp
80106d75:	83 ec 08             	sub    $0x8,%esp
80106d78:	8b 55 0c             	mov    0xc(%ebp),%edx
80106d7b:	8b 45 08             	mov    0x8(%ebp),%eax
80106d7e:	e8 bd f8 ff ff       	call   80106640 <walkpgdir>
80106d83:	85 c0                	test   %eax,%eax
80106d85:	74 05                	je     80106d8c <clearpteu+0x1c>
80106d87:	83 20 fb             	andl   $0xfffffffb,(%eax)
80106d8a:	c9                   	leave  
80106d8b:	c3                   	ret    
80106d8c:	83 ec 0c             	sub    $0xc,%esp
80106d8f:	68 87 79 10 80       	push   $0x80107987
80106d94:	e8 d7 95 ff ff       	call   80100370 <panic>
80106d99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106da0 <copyuvm>:
80106da0:	55                   	push   %ebp
80106da1:	89 e5                	mov    %esp,%ebp
80106da3:	57                   	push   %edi
80106da4:	56                   	push   %esi
80106da5:	53                   	push   %ebx
80106da6:	83 ec 1c             	sub    $0x1c,%esp
80106da9:	e8 92 fb ff ff       	call   80106940 <setupkvm>
80106dae:	85 c0                	test   %eax,%eax
80106db0:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106db3:	0f 84 a0 00 00 00    	je     80106e59 <copyuvm+0xb9>
80106db9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106dbc:	85 c9                	test   %ecx,%ecx
80106dbe:	0f 84 95 00 00 00    	je     80106e59 <copyuvm+0xb9>
80106dc4:	31 f6                	xor    %esi,%esi
80106dc6:	eb 4e                	jmp    80106e16 <copyuvm+0x76>
80106dc8:	90                   	nop
80106dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106dd0:	83 ec 04             	sub    $0x4,%esp
80106dd3:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80106dd9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106ddc:	68 00 10 00 00       	push   $0x1000
80106de1:	57                   	push   %edi
80106de2:	50                   	push   %eax
80106de3:	e8 78 d7 ff ff       	call   80104560 <memmove>
80106de8:	58                   	pop    %eax
80106de9:	5a                   	pop    %edx
80106dea:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106ded:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106df0:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106df5:	53                   	push   %ebx
80106df6:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106dfc:	52                   	push   %edx
80106dfd:	89 f2                	mov    %esi,%edx
80106dff:	e8 bc f8 ff ff       	call   801066c0 <mappages>
80106e04:	83 c4 10             	add    $0x10,%esp
80106e07:	85 c0                	test   %eax,%eax
80106e09:	78 39                	js     80106e44 <copyuvm+0xa4>
80106e0b:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106e11:	39 75 0c             	cmp    %esi,0xc(%ebp)
80106e14:	76 43                	jbe    80106e59 <copyuvm+0xb9>
80106e16:	8b 45 08             	mov    0x8(%ebp),%eax
80106e19:	31 c9                	xor    %ecx,%ecx
80106e1b:	89 f2                	mov    %esi,%edx
80106e1d:	e8 1e f8 ff ff       	call   80106640 <walkpgdir>
80106e22:	85 c0                	test   %eax,%eax
80106e24:	74 3e                	je     80106e64 <copyuvm+0xc4>
80106e26:	8b 18                	mov    (%eax),%ebx
80106e28:	f6 c3 01             	test   $0x1,%bl
80106e2b:	74 44                	je     80106e71 <copyuvm+0xd1>
80106e2d:	89 df                	mov    %ebx,%edi
80106e2f:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80106e35:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80106e3b:	e8 40 b6 ff ff       	call   80102480 <kalloc>
80106e40:	85 c0                	test   %eax,%eax
80106e42:	75 8c                	jne    80106dd0 <copyuvm+0x30>
80106e44:	83 ec 0c             	sub    $0xc,%esp
80106e47:	ff 75 e0             	pushl  -0x20(%ebp)
80106e4a:	e8 a1 fe ff ff       	call   80106cf0 <freevm>
80106e4f:	83 c4 10             	add    $0x10,%esp
80106e52:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
80106e59:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106e5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e5f:	5b                   	pop    %ebx
80106e60:	5e                   	pop    %esi
80106e61:	5f                   	pop    %edi
80106e62:	5d                   	pop    %ebp
80106e63:	c3                   	ret    
80106e64:	83 ec 0c             	sub    $0xc,%esp
80106e67:	68 91 79 10 80       	push   $0x80107991
80106e6c:	e8 ff 94 ff ff       	call   80100370 <panic>
80106e71:	83 ec 0c             	sub    $0xc,%esp
80106e74:	68 ab 79 10 80       	push   $0x801079ab
80106e79:	e8 f2 94 ff ff       	call   80100370 <panic>
80106e7e:	66 90                	xchg   %ax,%ax

80106e80 <uva2ka>:
80106e80:	55                   	push   %ebp
80106e81:	31 c9                	xor    %ecx,%ecx
80106e83:	89 e5                	mov    %esp,%ebp
80106e85:	83 ec 08             	sub    $0x8,%esp
80106e88:	8b 55 0c             	mov    0xc(%ebp),%edx
80106e8b:	8b 45 08             	mov    0x8(%ebp),%eax
80106e8e:	e8 ad f7 ff ff       	call   80106640 <walkpgdir>
80106e93:	8b 00                	mov    (%eax),%eax
80106e95:	c9                   	leave  
80106e96:	89 c2                	mov    %eax,%edx
80106e98:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106e9d:	83 e2 05             	and    $0x5,%edx
80106ea0:	05 00 00 00 80       	add    $0x80000000,%eax
80106ea5:	83 fa 05             	cmp    $0x5,%edx
80106ea8:	ba 00 00 00 00       	mov    $0x0,%edx
80106ead:	0f 45 c2             	cmovne %edx,%eax
80106eb0:	c3                   	ret    
80106eb1:	eb 0d                	jmp    80106ec0 <copyout>
80106eb3:	90                   	nop
80106eb4:	90                   	nop
80106eb5:	90                   	nop
80106eb6:	90                   	nop
80106eb7:	90                   	nop
80106eb8:	90                   	nop
80106eb9:	90                   	nop
80106eba:	90                   	nop
80106ebb:	90                   	nop
80106ebc:	90                   	nop
80106ebd:	90                   	nop
80106ebe:	90                   	nop
80106ebf:	90                   	nop

80106ec0 <copyout>:
80106ec0:	55                   	push   %ebp
80106ec1:	89 e5                	mov    %esp,%ebp
80106ec3:	57                   	push   %edi
80106ec4:	56                   	push   %esi
80106ec5:	53                   	push   %ebx
80106ec6:	83 ec 1c             	sub    $0x1c,%esp
80106ec9:	8b 5d 14             	mov    0x14(%ebp),%ebx
80106ecc:	8b 55 0c             	mov    0xc(%ebp),%edx
80106ecf:	8b 7d 10             	mov    0x10(%ebp),%edi
80106ed2:	85 db                	test   %ebx,%ebx
80106ed4:	75 40                	jne    80106f16 <copyout+0x56>
80106ed6:	eb 70                	jmp    80106f48 <copyout+0x88>
80106ed8:	90                   	nop
80106ed9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ee0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106ee3:	89 f1                	mov    %esi,%ecx
80106ee5:	29 d1                	sub    %edx,%ecx
80106ee7:	81 c1 00 10 00 00    	add    $0x1000,%ecx
80106eed:	39 d9                	cmp    %ebx,%ecx
80106eef:	0f 47 cb             	cmova  %ebx,%ecx
80106ef2:	29 f2                	sub    %esi,%edx
80106ef4:	83 ec 04             	sub    $0x4,%esp
80106ef7:	01 d0                	add    %edx,%eax
80106ef9:	51                   	push   %ecx
80106efa:	57                   	push   %edi
80106efb:	50                   	push   %eax
80106efc:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80106eff:	e8 5c d6 ff ff       	call   80104560 <memmove>
80106f04:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106f07:	83 c4 10             	add    $0x10,%esp
80106f0a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
80106f10:	01 cf                	add    %ecx,%edi
80106f12:	29 cb                	sub    %ecx,%ebx
80106f14:	74 32                	je     80106f48 <copyout+0x88>
80106f16:	89 d6                	mov    %edx,%esi
80106f18:	83 ec 08             	sub    $0x8,%esp
80106f1b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106f1e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80106f24:	56                   	push   %esi
80106f25:	ff 75 08             	pushl  0x8(%ebp)
80106f28:	e8 53 ff ff ff       	call   80106e80 <uva2ka>
80106f2d:	83 c4 10             	add    $0x10,%esp
80106f30:	85 c0                	test   %eax,%eax
80106f32:	75 ac                	jne    80106ee0 <copyout+0x20>
80106f34:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f37:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106f3c:	5b                   	pop    %ebx
80106f3d:	5e                   	pop    %esi
80106f3e:	5f                   	pop    %edi
80106f3f:	5d                   	pop    %ebp
80106f40:	c3                   	ret    
80106f41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f48:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f4b:	31 c0                	xor    %eax,%eax
80106f4d:	5b                   	pop    %ebx
80106f4e:	5e                   	pop    %esi
80106f4f:	5f                   	pop    %edi
80106f50:	5d                   	pop    %ebp
80106f51:	c3                   	ret    
