
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc d0 b5 10 80       	mov    $0x8010b5d0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 60 30 10 80       	mov    $0x80103060,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb 14 b6 10 80       	mov    $0x8010b614,%ebx
  struct buf head;
} bcache;

void
binit(void)
{
80100049:	83 ec 0c             	sub    $0xc,%esp
  struct buf *b;

  initlock(&bcache.lock, "bcache");
8010004c:	68 20 71 10 80       	push   $0x80107120
80100051:	68 e0 b5 10 80       	push   $0x8010b5e0
80100056:	e8 75 43 00 00       	call   801043d0 <initlock>

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
8010005b:	c7 05 2c fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd2c
80100062:	fc 10 80 
  bcache.head.next = &bcache.head;
80100065:	c7 05 30 fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd30
8010006c:	fc 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba dc fc 10 80       	mov    $0x8010fcdc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
    b->prev = &bcache.head;
8010008b:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100092:	68 27 71 10 80       	push   $0x80107127
80100097:	50                   	push   %eax
80100098:	e8 23 42 00 00       	call   801042c0 <initsleeplock>
    bcache.head.next->prev = b;
8010009d:	a1 30 fd 10 80       	mov    0x8010fd30,%eax

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
801000b0:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000b6:	3d dc fc 10 80       	cmp    $0x8010fcdc,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
}
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
static struct buf*
bget(uint dev, uint blockno)
{
  struct buf *b;

  acquire(&bcache.lock);
801000df:	68 e0 b5 10 80       	push   $0x8010b5e0
801000e4:	e8 07 43 00 00       	call   801043f0 <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000e9:	8b 1d 30 fd 10 80    	mov    0x8010fd30,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  // Not cached; recycle some unused buffer and clean buffer
  // "clean" because B_DIRTY and not locked means log.c
  // hasn't yet committed the changes to the buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d 2c fd 10 80    	mov    0x8010fd2c,%ebx
80100126:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 e0 b5 10 80       	push   $0x8010b5e0
80100162:	e8 69 44 00 00       	call   801045d0 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 8e 41 00 00       	call   80104300 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
bread(uint dev, uint blockno)
{
  struct buf *b;

  b = bget(dev, blockno);
  if(!(b->flags & B_VALID)) {
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
    iderw(b);
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 dd 20 00 00       	call   80102260 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
  }
  return b;
}
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
      release(&bcache.lock);
      acquiresleep(&b->lock);
      return b;
    }
  }
  panic("bget: no buffers");
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 2e 71 10 80       	push   $0x8010712e
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
}

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 ed 41 00 00       	call   801043a0 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
  b->flags |= B_DIRTY;
  iderw(b);
801001c4:	e9 97 20 00 00       	jmp    80102260 <iderw>
// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 3f 71 10 80       	push   $0x8010713f
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 ac 41 00 00       	call   801043a0 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 5c 41 00 00       	call   80104360 <releasesleep>

  acquire(&bcache.lock);
80100204:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
8010020b:	e8 e0 41 00 00       	call   801043f0 <acquire>
  b->refcnt--;
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
  if (b->refcnt == 0) {
80100213:	83 c4 10             	add    $0x10,%esp
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
80100216:	83 e8 01             	sub    $0x1,%eax
  if (b->refcnt == 0) {
80100219:	85 c0                	test   %eax,%eax
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
  if (b->refcnt == 0) {
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100232:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
    b->prev = &bcache.head;
80100237:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
  b->refcnt--;
  if (b->refcnt == 0) {
    // no one is waiting for it.
    b->next->prev = b->prev;
    b->prev->next = b->next;
    b->next = bcache.head.next;
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
80100241:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
80100249:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30
  }
  
  release(&bcache.lock);
8010024f:	c7 45 08 e0 b5 10 80 	movl   $0x8010b5e0,0x8(%ebp)
}
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
  
  release(&bcache.lock);
8010025c:	e9 6f 43 00 00       	jmp    801045d0 <release>
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 46 71 10 80       	push   $0x80107146
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	57                   	push   %edi
80100280:	e8 8b 15 00 00       	call   80101810 <iunlock>
  target = n;
  acquire(&cons.lock);
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 5f 41 00 00       	call   801043f0 <acquire>
  while(n > 0){
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
    while(input.r == input.w){
801002a1:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801002a6:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
      if(proc->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 20 a5 10 80       	push   $0x8010a520
801002b8:	68 c0 ff 10 80       	push   $0x8010ffc0
801002bd:	e8 ae 3c 00 00       	call   80103f70 <sleep>

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
    while(input.r == input.w){
801002c2:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
      if(proc->killed){
801002d2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801002d8:	8b 40 24             	mov    0x24(%eax),%eax
801002db:	85 c0                	test   %eax,%eax
801002dd:	74 d1                	je     801002b0 <consoleread+0x40>
        release(&cons.lock);
801002df:	83 ec 0c             	sub    $0xc,%esp
801002e2:	68 20 a5 10 80       	push   $0x8010a520
801002e7:	e8 e4 42 00 00       	call   801045d0 <release>
        ilock(ip);
801002ec:	89 3c 24             	mov    %edi,(%esp)
801002ef:	e8 3c 14 00 00       	call   80101730 <ilock>
        return -1;
801002f4:	83 c4 10             	add    $0x10,%esp
801002f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
801002fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002ff:	5b                   	pop    %ebx
80100300:	5e                   	pop    %esi
80100301:	5f                   	pop    %edi
80100302:	5d                   	pop    %ebp
80100303:	c3                   	ret    
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 c0 ff 10 80    	mov    %edx,0x8010ffc0
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 40 ff 10 80 	movsbl -0x7fef00c0(%edx),%edx
    if(c == C('D')){  // EOF
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
80100322:	83 c6 01             	add    $0x1,%esi
    --n;
80100325:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
80100328:	83 fa 0a             	cmp    $0xa,%edx
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
    --n;
    if(c == '\n')
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
  int c;

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
  }
  release(&cons.lock);
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 20 a5 10 80       	push   $0x8010a520
80100346:	e8 85 42 00 00       	call   801045d0 <release>
  ilock(ip);
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 dd 13 00 00       	call   80101730 <ilock>

  return target - n;
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a1                	jmp    801002fc <consoleread+0x8c>
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
    if(c == C('D')){  // EOF
      if(n < target){
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
80100360:	a3 c0 ff 10 80       	mov    %eax,0x8010ffc0
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
    release(&cons.lock);
}

void
panic(char *s)
{
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 38             	sub    $0x38,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100378:	fa                   	cli    
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
80100379:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
{
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
8010037f:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
80100386:	00 00 00 
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
80100389:	8d 5d d0             	lea    -0x30(%ebp),%ebx
8010038c:	8d 75 f8             	lea    -0x8(%ebp),%esi
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
8010038f:	0f b6 00             	movzbl (%eax),%eax
80100392:	50                   	push   %eax
80100393:	68 4d 71 10 80       	push   $0x8010714d
80100398:	e8 c3 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
8010039d:	58                   	pop    %eax
8010039e:	ff 75 08             	pushl  0x8(%ebp)
801003a1:	e8 ba 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003a6:	c7 04 24 46 76 10 80 	movl   $0x80107646,(%esp)
801003ad:	e8 ae 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003b2:	5a                   	pop    %edx
801003b3:	8d 45 08             	lea    0x8(%ebp),%eax
801003b6:	59                   	pop    %ecx
801003b7:	53                   	push   %ebx
801003b8:	50                   	push   %eax
801003b9:	e8 02 41 00 00       	call   801044c0 <getcallerpcs>
801003be:	83 c4 10             	add    $0x10,%esp
801003c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
801003c8:	83 ec 08             	sub    $0x8,%esp
801003cb:	ff 33                	pushl  (%ebx)
801003cd:	83 c3 04             	add    $0x4,%ebx
801003d0:	68 69 71 10 80       	push   $0x80107169
801003d5:	e8 86 02 00 00       	call   80100660 <cprintf>
  cons.locking = 0;
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
801003da:	83 c4 10             	add    $0x10,%esp
801003dd:	39 f3                	cmp    %esi,%ebx
801003df:	75 e7                	jne    801003c8 <panic+0x58>
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
801003e1:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003e8:	00 00 00 
801003eb:	eb fe                	jmp    801003eb <panic+0x7b>
801003ed:	8d 76 00             	lea    0x0(%esi),%esi

801003f0 <consputc>:
}

void
consputc(int c)
{
  if(panicked){
801003f0:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
  crt[pos] = ' ' | 0x0700;
}

void
consputc(int c)
{
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
    cli();
    for(;;)
      ;
  }

  if(c == BACKSPACE){
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 f1 58 00 00       	call   80105d10 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010042f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100434:	89 f2                	mov    %esi,%edx
80100436:	ec                   	in     (%dx),%al
{
  int pos;

  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
  pos = inb(CRTPORT+1) << 8;
80100437:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c1                	mov    %eax,%ecx
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100447:	89 f2                	mov    %esi,%edx
80100449:	ec                   	in     (%dx),%al
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 c8                	or     %ecx,%eax

  if(c == '\n')
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 

  if(pos < 0 || pos > 25*80)
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
80100492:	89 fb                	mov    %edi,%ebx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
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
801004bb:	89 d8                	mov    %ebx,%eax
801004bd:	ee                   	out    %al,(%dx)

  outb(CRTPORT, 14);
  outb(CRTPORT+1, pos>>8);
  outb(CRTPORT, 15);
  outb(CRTPORT+1, pos);
  crt[pos] = ' ' | 0x0700;
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 01             	mov    %ax,(%ecx)
  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
  cgaputc(c);
}
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
    for(;;)
      ;
  }

  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 38 58 00 00       	call   80105d10 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 2c 58 00 00       	call   80105d10 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 20 58 00 00       	call   80105d10 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004f8:	83 ec 04             	sub    $0x4,%esp
    pos -= 80;
801004fb:	8d 5f b0             	lea    -0x50(%edi),%ebx

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004fe:	68 60 0e 00 00       	push   $0xe60
80100503:	68 a0 80 0b 80       	push   $0x800b80a0
80100508:	68 00 80 0b 80       	push   $0x800b8000
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
8010050d:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100514:	e8 b7 41 00 00       	call   801046d0 <memmove>
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100519:	b8 80 07 00 00       	mov    $0x780,%eax
8010051e:	83 c4 0c             	add    $0xc,%esp
80100521:	29 d8                	sub    %ebx,%eax
80100523:	01 c0                	add    %eax,%eax
80100525:	50                   	push   %eax
80100526:	6a 00                	push   $0x0
80100528:	56                   	push   %esi
80100529:	e8 f2 40 00 00       	call   80104620 <memset>
8010052e:	89 f1                	mov    %esi,%ecx
80100530:	83 c4 10             	add    $0x10,%esp
80100533:	be 07 00 00 00       	mov    $0x7,%esi
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 6d 71 10 80       	push   $0x8010716d
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
    if(pos > 0) --pos;
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
8010055a:	31 db                	xor    %ebx,%ebx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
  pos = inb(CRTPORT+1) << 8;
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
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
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 2c             	sub    $0x2c,%esp
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
8010058b:	85 c9                	test   %ecx,%ecx
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
80100590:	74 0c                	je     8010059e <printint+0x1e>
80100592:	89 c7                	mov    %eax,%edi
80100594:	c1 ef 1f             	shr    $0x1f,%edi
80100597:	85 c0                	test   %eax,%eax
80100599:	89 7d d4             	mov    %edi,-0x2c(%ebp)
8010059c:	78 51                	js     801005ef <printint+0x6f>
    x = -xx;
  else
    x = xx;

  i = 0;
8010059e:	31 ff                	xor    %edi,%edi
801005a0:	8d 5d d7             	lea    -0x29(%ebp),%ebx
801005a3:	eb 05                	jmp    801005aa <printint+0x2a>
801005a5:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
801005a8:	89 cf                	mov    %ecx,%edi
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 4f 01             	lea    0x1(%edi),%ecx
801005af:	f7 f6                	div    %esi
801005b1:	0f b6 92 98 71 10 80 	movzbl -0x7fef8e68(%edx),%edx
  }while((x /= base) != 0);
801005b8:	85 c0                	test   %eax,%eax
  else
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
801005ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
801005bd:	75 e9                	jne    801005a8 <printint+0x28>

  if(sign)
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
    buf[i++] = '-';
801005c6:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
801005cb:	8d 4f 02             	lea    0x2(%edi),%ecx
801005ce:	8d 74 0d d7          	lea    -0x29(%ebp,%ecx,1),%esi
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  while(--i >= 0)
    consputc(buf[i]);
801005d8:	0f be 06             	movsbl (%esi),%eax
801005db:	83 ee 01             	sub    $0x1,%esi
801005de:	e8 0d fe ff ff       	call   801003f0 <consputc>
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
801005e3:	39 de                	cmp    %ebx,%esi
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
    consputc(buf[i]);
}
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    x = -xx;
801005ef:	f7 d8                	neg    %eax
801005f1:	eb ab                	jmp    8010059e <printint+0x1e>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
  int i;

  iunlock(ip);
80100609:	ff 75 08             	pushl  0x8(%ebp)
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
  int i;

  iunlock(ip);
8010060f:	e8 fc 11 00 00       	call   80101810 <iunlock>
  acquire(&cons.lock);
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 d0 3d 00 00       	call   801043f0 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
  for(i = 0; i < n; i++)
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
8010063b:	39 df                	cmp    %ebx,%edi
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
    consputc(buf[i] & 0xff);
  release(&cons.lock);
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 84 3f 00 00       	call   801045d0 <release>
  ilock(ip);
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 db 10 00 00       	call   80101730 <ilock>

  return n;
}
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
//PAGEBREAK: 50

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
  if(locking)
8010066e:	85 c0                	test   %eax,%eax
{
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(locking)
80100673:	0f 85 47 01 00 00    	jne    801007c0 <cprintf+0x160>
    acquire(&cons.lock);

  if (fmt == 0)
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c1                	mov    %eax,%ecx
80100680:	0f 84 4f 01 00 00    	je     801007d5 <cprintf+0x175>
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	31 db                	xor    %ebx,%ebx
8010068b:	8d 75 0c             	lea    0xc(%ebp),%esi
8010068e:	89 cf                	mov    %ecx,%edi
80100690:	85 c0                	test   %eax,%eax
80100692:	75 55                	jne    801006e9 <cprintf+0x89>
80100694:	eb 68                	jmp    801006fe <cprintf+0x9e>
80100696:	8d 76 00             	lea    0x0(%esi),%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c != '%'){
      consputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
801006a0:	83 c3 01             	add    $0x1,%ebx
801006a3:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
    if(c == 0)
801006a7:	85 d2                	test   %edx,%edx
801006a9:	74 53                	je     801006fe <cprintf+0x9e>
      break;
    switch(c){
801006ab:	83 fa 70             	cmp    $0x70,%edx
801006ae:	74 7a                	je     8010072a <cprintf+0xca>
801006b0:	7f 6e                	jg     80100720 <cprintf+0xc0>
801006b2:	83 fa 25             	cmp    $0x25,%edx
801006b5:	0f 84 ad 00 00 00    	je     80100768 <cprintf+0x108>
801006bb:	83 fa 64             	cmp    $0x64,%edx
801006be:	0f 85 84 00 00 00    	jne    80100748 <cprintf+0xe8>
    case 'd':
      printint(*argp++, 10, 1);
801006c4:	8d 46 04             	lea    0x4(%esi),%eax
801006c7:	b9 01 00 00 00       	mov    $0x1,%ecx
801006cc:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006d4:	8b 06                	mov    (%esi),%eax
801006d6:	e8 a5 fe ff ff       	call   80100580 <printint>
801006db:	8b 75 e4             	mov    -0x1c(%ebp),%esi

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006de:	83 c3 01             	add    $0x1,%ebx
801006e1:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e5:	85 c0                	test   %eax,%eax
801006e7:	74 15                	je     801006fe <cprintf+0x9e>
    if(c != '%'){
801006e9:	83 f8 25             	cmp    $0x25,%eax
801006ec:	74 b2                	je     801006a0 <cprintf+0x40>
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
801006ee:	e8 fd fc ff ff       	call   801003f0 <consputc>

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006f3:	83 c3 01             	add    $0x1,%ebx
801006f6:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006fa:	85 c0                	test   %eax,%eax
801006fc:	75 eb                	jne    801006e9 <cprintf+0x89>
      consputc(c);
      break;
    }
  }

  if(locking)
801006fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100701:	85 c0                	test   %eax,%eax
80100703:	74 10                	je     80100715 <cprintf+0xb5>
    release(&cons.lock);
80100705:	83 ec 0c             	sub    $0xc,%esp
80100708:	68 20 a5 10 80       	push   $0x8010a520
8010070d:	e8 be 3e 00 00       	call   801045d0 <release>
80100712:	83 c4 10             	add    $0x10,%esp
}
80100715:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100718:	5b                   	pop    %ebx
80100719:	5e                   	pop    %esi
8010071a:	5f                   	pop    %edi
8010071b:	5d                   	pop    %ebp
8010071c:	c3                   	ret    
8010071d:	8d 76 00             	lea    0x0(%esi),%esi
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
    switch(c){
80100720:	83 fa 73             	cmp    $0x73,%edx
80100723:	74 5b                	je     80100780 <cprintf+0x120>
80100725:	83 fa 78             	cmp    $0x78,%edx
80100728:	75 1e                	jne    80100748 <cprintf+0xe8>
    case 'd':
      printint(*argp++, 10, 1);
      break;
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
8010072a:	8d 46 04             	lea    0x4(%esi),%eax
8010072d:	31 c9                	xor    %ecx,%ecx
8010072f:	ba 10 00 00 00       	mov    $0x10,%edx
80100734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100737:	8b 06                	mov    (%esi),%eax
80100739:	e8 42 fe ff ff       	call   80100580 <printint>
8010073e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
      break;
80100741:	eb 9b                	jmp    801006de <cprintf+0x7e>
80100743:	90                   	nop
80100744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case '%':
      consputc('%');
      break;
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100750:	e8 9b fc ff ff       	call   801003f0 <consputc>
      consputc(c);
80100755:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100758:	89 d0                	mov    %edx,%eax
8010075a:	e8 91 fc ff ff       	call   801003f0 <consputc>
      break;
8010075f:	e9 7a ff ff ff       	jmp    801006de <cprintf+0x7e>
80100764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
80100768:	b8 25 00 00 00       	mov    $0x25,%eax
8010076d:	e8 7e fc ff ff       	call   801003f0 <consputc>
80100772:	e9 7c ff ff ff       	jmp    801006f3 <cprintf+0x93>
80100777:	89 f6                	mov    %esi,%esi
80100779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
80100780:	8d 46 04             	lea    0x4(%esi),%eax
80100783:	8b 36                	mov    (%esi),%esi
80100785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        s = "(null)";
80100788:	b8 80 71 10 80       	mov    $0x80107180,%eax
8010078d:	85 f6                	test   %esi,%esi
8010078f:	0f 44 f0             	cmove  %eax,%esi
      for(; *s; s++)
80100792:	0f be 06             	movsbl (%esi),%eax
80100795:	84 c0                	test   %al,%al
80100797:	74 16                	je     801007af <cprintf+0x14f>
80100799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007a0:	83 c6 01             	add    $0x1,%esi
        consputc(*s);
801007a3:	e8 48 fc ff ff       	call   801003f0 <consputc>
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
801007a8:	0f be 06             	movsbl (%esi),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
801007af:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801007b2:	e9 27 ff ff ff       	jmp    801006de <cprintf+0x7e>
801007b7:	89 f6                	mov    %esi,%esi
801007b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  uint *argp;
  char *s;

  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);
801007c0:	83 ec 0c             	sub    $0xc,%esp
801007c3:	68 20 a5 10 80       	push   $0x8010a520
801007c8:	e8 23 3c 00 00       	call   801043f0 <acquire>
801007cd:	83 c4 10             	add    $0x10,%esp
801007d0:	e9 a4 fe ff ff       	jmp    80100679 <cprintf+0x19>

  if (fmt == 0)
    panic("null fmt");
801007d5:	83 ec 0c             	sub    $0xc,%esp
801007d8:	68 87 71 10 80       	push   $0x80107187
801007dd:	e8 8e fb ff ff       	call   80100370 <panic>
801007e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007f0 <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007f0:	55                   	push   %ebp
801007f1:	89 e5                	mov    %esp,%ebp
801007f3:	57                   	push   %edi
801007f4:	56                   	push   %esi
801007f5:	53                   	push   %ebx
  int c, doprocdump = 0;
801007f6:	31 f6                	xor    %esi,%esi

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007f8:	83 ec 18             	sub    $0x18,%esp
801007fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int c, doprocdump = 0;

  acquire(&cons.lock);
801007fe:	68 20 a5 10 80       	push   $0x8010a520
80100803:	e8 e8 3b 00 00       	call   801043f0 <acquire>
  while((c = getc()) >= 0){
80100808:	83 c4 10             	add    $0x10,%esp
8010080b:	90                   	nop
8010080c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100810:	ff d3                	call   *%ebx
80100812:	85 c0                	test   %eax,%eax
80100814:	89 c7                	mov    %eax,%edi
80100816:	78 48                	js     80100860 <consoleintr+0x70>
    switch(c){
80100818:	83 ff 10             	cmp    $0x10,%edi
8010081b:	0f 84 3f 01 00 00    	je     80100960 <consoleintr+0x170>
80100821:	7e 5d                	jle    80100880 <consoleintr+0x90>
80100823:	83 ff 15             	cmp    $0x15,%edi
80100826:	0f 84 dc 00 00 00    	je     80100908 <consoleintr+0x118>
8010082c:	83 ff 7f             	cmp    $0x7f,%edi
8010082f:	75 54                	jne    80100885 <consoleintr+0x95>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
80100831:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100836:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
8010083c:	74 d2                	je     80100810 <consoleintr+0x20>
        input.e--;
8010083e:	83 e8 01             	sub    $0x1,%eax
80100841:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
        consputc(BACKSPACE);
80100846:	b8 00 01 00 00       	mov    $0x100,%eax
8010084b:	e8 a0 fb ff ff       	call   801003f0 <consputc>
consoleintr(int (*getc)(void))
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
80100850:	ff d3                	call   *%ebx
80100852:	85 c0                	test   %eax,%eax
80100854:	89 c7                	mov    %eax,%edi
80100856:	79 c0                	jns    80100818 <consoleintr+0x28>
80100858:	90                   	nop
80100859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        }
      }
      break;
    }
  }
  release(&cons.lock);
80100860:	83 ec 0c             	sub    $0xc,%esp
80100863:	68 20 a5 10 80       	push   $0x8010a520
80100868:	e8 63 3d 00 00       	call   801045d0 <release>
  if(doprocdump) {
8010086d:	83 c4 10             	add    $0x10,%esp
80100870:	85 f6                	test   %esi,%esi
80100872:	0f 85 f8 00 00 00    	jne    80100970 <consoleintr+0x180>
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100878:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010087b:	5b                   	pop    %ebx
8010087c:	5e                   	pop    %esi
8010087d:	5f                   	pop    %edi
8010087e:	5d                   	pop    %ebp
8010087f:	c3                   	ret    
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
80100880:	83 ff 08             	cmp    $0x8,%edi
80100883:	74 ac                	je     80100831 <consoleintr+0x41>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100885:	85 ff                	test   %edi,%edi
80100887:	74 87                	je     80100810 <consoleintr+0x20>
80100889:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010088e:	89 c2                	mov    %eax,%edx
80100890:	2b 15 c0 ff 10 80    	sub    0x8010ffc0,%edx
80100896:	83 fa 7f             	cmp    $0x7f,%edx
80100899:	0f 87 71 ff ff ff    	ja     80100810 <consoleintr+0x20>
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010089f:	8d 50 01             	lea    0x1(%eax),%edx
801008a2:	83 e0 7f             	and    $0x7f,%eax
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
801008a5:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
801008a8:	89 15 c8 ff 10 80    	mov    %edx,0x8010ffc8
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
801008ae:	0f 84 c8 00 00 00    	je     8010097c <consoleintr+0x18c>
        input.buf[input.e++ % INPUT_BUF] = c;
801008b4:	89 f9                	mov    %edi,%ecx
801008b6:	88 88 40 ff 10 80    	mov    %cl,-0x7fef00c0(%eax)
        consputc(c);
801008bc:	89 f8                	mov    %edi,%eax
801008be:	e8 2d fb ff ff       	call   801003f0 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801008c3:	83 ff 0a             	cmp    $0xa,%edi
801008c6:	0f 84 c1 00 00 00    	je     8010098d <consoleintr+0x19d>
801008cc:	83 ff 04             	cmp    $0x4,%edi
801008cf:	0f 84 b8 00 00 00    	je     8010098d <consoleintr+0x19d>
801008d5:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801008da:	83 e8 80             	sub    $0xffffff80,%eax
801008dd:	39 05 c8 ff 10 80    	cmp    %eax,0x8010ffc8
801008e3:	0f 85 27 ff ff ff    	jne    80100810 <consoleintr+0x20>
          input.w = input.e;
          wakeup(&input.r);
801008e9:	83 ec 0c             	sub    $0xc,%esp
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
        consputc(c);
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
          input.w = input.e;
801008ec:	a3 c4 ff 10 80       	mov    %eax,0x8010ffc4
          wakeup(&input.r);
801008f1:	68 c0 ff 10 80       	push   $0x8010ffc0
801008f6:	e8 15 38 00 00       	call   80104110 <wakeup>
801008fb:	83 c4 10             	add    $0x10,%esp
801008fe:	e9 0d ff ff ff       	jmp    80100810 <consoleintr+0x20>
80100903:	90                   	nop
80100904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100908:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010090d:	39 05 c4 ff 10 80    	cmp    %eax,0x8010ffc4
80100913:	75 2b                	jne    80100940 <consoleintr+0x150>
80100915:	e9 f6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010091a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
80100920:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
        consputc(BACKSPACE);
80100925:	b8 00 01 00 00       	mov    $0x100,%eax
8010092a:	e8 c1 fa ff ff       	call   801003f0 <consputc>
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
8010092f:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100934:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
8010093a:	0f 84 d0 fe ff ff    	je     80100810 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100940:	83 e8 01             	sub    $0x1,%eax
80100943:	89 c2                	mov    %eax,%edx
80100945:	83 e2 7f             	and    $0x7f,%edx
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100948:	80 ba 40 ff 10 80 0a 	cmpb   $0xa,-0x7fef00c0(%edx)
8010094f:	75 cf                	jne    80100920 <consoleintr+0x130>
80100951:	e9 ba fe ff ff       	jmp    80100810 <consoleintr+0x20>
80100956:	8d 76 00             	lea    0x0(%esi),%esi
80100959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
80100960:	be 01 00 00 00       	mov    $0x1,%esi
80100965:	e9 a6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010096a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100970:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100973:	5b                   	pop    %ebx
80100974:	5e                   	pop    %esi
80100975:	5f                   	pop    %edi
80100976:	5d                   	pop    %ebp
      break;
    }
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
80100977:	e9 84 38 00 00       	jmp    80104200 <procdump>
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010097c:	c6 80 40 ff 10 80 0a 	movb   $0xa,-0x7fef00c0(%eax)
        consputc(c);
80100983:	b8 0a 00 00 00       	mov    $0xa,%eax
80100988:	e8 63 fa ff ff       	call   801003f0 <consputc>
8010098d:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100992:	e9 52 ff ff ff       	jmp    801008e9 <consoleintr+0xf9>
80100997:	89 f6                	mov    %esi,%esi
80100999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801009a0 <consoleinit>:
  return n;
}

void
consoleinit(void)
{
801009a0:	55                   	push   %ebp
801009a1:	89 e5                	mov    %esp,%ebp
801009a3:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
801009a6:	68 90 71 10 80       	push   $0x80107190
801009ab:	68 20 a5 10 80       	push   $0x8010a520
801009b0:	e8 1b 3a 00 00       	call   801043d0 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  picenable(IRQ_KBD);
801009b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
void
consoleinit(void)
{
  initlock(&cons.lock, "console");

  devsw[CONSOLE].write = consolewrite;
801009bc:	c7 05 8c 09 11 80 00 	movl   $0x80100600,0x8011098c
801009c3:	06 10 80 
  devsw[CONSOLE].read = consoleread;
801009c6:	c7 05 88 09 11 80 70 	movl   $0x80100270,0x80110988
801009cd:	02 10 80 
  cons.locking = 1;
801009d0:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009d7:	00 00 00 

  picenable(IRQ_KBD);
801009da:	e8 41 2a 00 00       	call   80103420 <picenable>
  ioapicenable(IRQ_KBD, 0);
801009df:	58                   	pop    %eax
801009e0:	5a                   	pop    %edx
801009e1:	6a 00                	push   $0x0
801009e3:	6a 01                	push   $0x1
801009e5:	e8 36 1a 00 00       	call   80102420 <ioapicenable>
}
801009ea:	83 c4 10             	add    $0x10,%esp
801009ed:	c9                   	leave  
801009ee:	c3                   	ret    
801009ef:	90                   	nop

801009f0 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
801009f0:	55                   	push   %ebp
801009f1:	89 e5                	mov    %esp,%ebp
801009f3:	57                   	push   %edi
801009f4:	56                   	push   %esi
801009f5:	53                   	push   %ebx
801009f6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;

  begin_op();
801009fc:	e8 4f 23 00 00       	call   80102d50 <begin_op>

  if((ip = namei(path)) == 0){
80100a01:	83 ec 0c             	sub    $0xc,%esp
80100a04:	ff 75 08             	pushl  0x8(%ebp)
80100a07:	e8 14 16 00 00       	call   80102020 <namei>
80100a0c:	83 c4 10             	add    $0x10,%esp
80100a0f:	85 c0                	test   %eax,%eax
80100a11:	0f 84 a3 01 00 00    	je     80100bba <exec+0x1ca>
    end_op();
    return -1;
  }
  ilock(ip);
80100a17:	83 ec 0c             	sub    $0xc,%esp
80100a1a:	89 c3                	mov    %eax,%ebx
80100a1c:	50                   	push   %eax
80100a1d:	e8 0e 0d 00 00       	call   80101730 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) < sizeof(elf))
80100a22:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a28:	6a 34                	push   $0x34
80100a2a:	6a 00                	push   $0x0
80100a2c:	50                   	push   %eax
80100a2d:	53                   	push   %ebx
80100a2e:	e8 7d 10 00 00       	call   80101ab0 <readi>
80100a33:	83 c4 20             	add    $0x20,%esp
80100a36:	83 f8 33             	cmp    $0x33,%eax
80100a39:	77 25                	ja     80100a60 <exec+0x70>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a3b:	83 ec 0c             	sub    $0xc,%esp
80100a3e:	53                   	push   %ebx
80100a3f:	e8 1c 10 00 00       	call   80101a60 <iunlockput>
    end_op();
80100a44:	e8 77 23 00 00       	call   80102dc0 <end_op>
80100a49:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100a4c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a51:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a54:	5b                   	pop    %ebx
80100a55:	5e                   	pop    %esi
80100a56:	5f                   	pop    %edi
80100a57:	5d                   	pop    %ebp
80100a58:	c3                   	ret    
80100a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) < sizeof(elf))
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100a60:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a67:	45 4c 46 
80100a6a:	75 cf                	jne    80100a3b <exec+0x4b>
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100a6c:	e8 5f 60 00 00       	call   80106ad0 <setupkvm>
80100a71:	85 c0                	test   %eax,%eax
80100a73:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a79:	74 c0                	je     80100a3b <exec+0x4b>
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a7b:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a82:	00 
80100a83:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100a89:	0f 84 a1 02 00 00    	je     80100d30 <exec+0x340>
80100a8f:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100a96:	00 00 00 
80100a99:	31 ff                	xor    %edi,%edi
80100a9b:	eb 18                	jmp    80100ab5 <exec+0xc5>
80100a9d:	8d 76 00             	lea    0x0(%esi),%esi
80100aa0:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100aa7:	83 c7 01             	add    $0x1,%edi
80100aaa:	83 c6 20             	add    $0x20,%esi
80100aad:	39 f8                	cmp    %edi,%eax
80100aaf:	0f 8e ab 00 00 00    	jle    80100b60 <exec+0x170>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100ab5:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100abb:	6a 20                	push   $0x20
80100abd:	56                   	push   %esi
80100abe:	50                   	push   %eax
80100abf:	53                   	push   %ebx
80100ac0:	e8 eb 0f 00 00       	call   80101ab0 <readi>
80100ac5:	83 c4 10             	add    $0x10,%esp
80100ac8:	83 f8 20             	cmp    $0x20,%eax
80100acb:	75 7b                	jne    80100b48 <exec+0x158>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100acd:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100ad4:	75 ca                	jne    80100aa0 <exec+0xb0>
      continue;
    if(ph.memsz < ph.filesz)
80100ad6:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100adc:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100ae2:	72 64                	jb     80100b48 <exec+0x158>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100ae4:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100aea:	72 5c                	jb     80100b48 <exec+0x158>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100aec:	83 ec 04             	sub    $0x4,%esp
80100aef:	50                   	push   %eax
80100af0:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100af6:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100afc:	e8 5f 62 00 00       	call   80106d60 <allocuvm>
80100b01:	83 c4 10             	add    $0x10,%esp
80100b04:	85 c0                	test   %eax,%eax
80100b06:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100b0c:	74 3a                	je     80100b48 <exec+0x158>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
80100b0e:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b14:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b19:	75 2d                	jne    80100b48 <exec+0x158>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b1b:	83 ec 0c             	sub    $0xc,%esp
80100b1e:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b24:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b2a:	53                   	push   %ebx
80100b2b:	50                   	push   %eax
80100b2c:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b32:	e8 69 61 00 00       	call   80106ca0 <loaduvm>
80100b37:	83 c4 20             	add    $0x20,%esp
80100b3a:	85 c0                	test   %eax,%eax
80100b3c:	0f 89 5e ff ff ff    	jns    80100aa0 <exec+0xb0>
80100b42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b48:	83 ec 0c             	sub    $0xc,%esp
80100b4b:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b51:	e8 3a 63 00 00       	call   80106e90 <freevm>
80100b56:	83 c4 10             	add    $0x10,%esp
80100b59:	e9 dd fe ff ff       	jmp    80100a3b <exec+0x4b>
80100b5e:	66 90                	xchg   %ax,%ax
80100b60:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100b66:	81 c6 ff 0f 00 00    	add    $0xfff,%esi
80100b6c:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80100b72:	8d be 00 20 00 00    	lea    0x2000(%esi),%edi
    if(ph.vaddr % PGSIZE != 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
80100b78:	83 ec 0c             	sub    $0xc,%esp
80100b7b:	53                   	push   %ebx
80100b7c:	e8 df 0e 00 00       	call   80101a60 <iunlockput>
  end_op();
80100b81:	e8 3a 22 00 00       	call   80102dc0 <end_op>
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b86:	83 c4 0c             	add    $0xc,%esp
80100b89:	57                   	push   %edi
80100b8a:	56                   	push   %esi
80100b8b:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b91:	e8 ca 61 00 00       	call   80106d60 <allocuvm>
80100b96:	83 c4 10             	add    $0x10,%esp
80100b99:	85 c0                	test   %eax,%eax
80100b9b:	89 c6                	mov    %eax,%esi
80100b9d:	75 2a                	jne    80100bc9 <exec+0x1d9>
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b9f:	83 ec 0c             	sub    $0xc,%esp
80100ba2:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100ba8:	e8 e3 62 00 00       	call   80106e90 <freevm>
80100bad:	83 c4 10             	add    $0x10,%esp
  if(ip){
    iunlockput(ip);
    end_op();
  }
  return -1;
80100bb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bb5:	e9 97 fe ff ff       	jmp    80100a51 <exec+0x61>
  pde_t *pgdir, *oldpgdir;

  begin_op();

  if((ip = namei(path)) == 0){
    end_op();
80100bba:	e8 01 22 00 00       	call   80102dc0 <end_op>
    return -1;
80100bbf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bc4:	e9 88 fe ff ff       	jmp    80100a51 <exec+0x61>
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bc9:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100bcf:	83 ec 08             	sub    $0x8,%esp
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100bd2:	31 ff                	xor    %edi,%edi
80100bd4:	89 f3                	mov    %esi,%ebx
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bd6:	50                   	push   %eax
80100bd7:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100bdd:	e8 2e 63 00 00       	call   80106f10 <clearpteu>
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100be2:	8b 45 0c             	mov    0xc(%ebp),%eax
80100be5:	83 c4 10             	add    $0x10,%esp
80100be8:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100bee:	8b 00                	mov    (%eax),%eax
80100bf0:	85 c0                	test   %eax,%eax
80100bf2:	74 71                	je     80100c65 <exec+0x275>
80100bf4:	89 b5 f0 fe ff ff    	mov    %esi,-0x110(%ebp)
80100bfa:	8b b5 f4 fe ff ff    	mov    -0x10c(%ebp),%esi
80100c00:	eb 0b                	jmp    80100c0d <exec+0x21d>
80100c02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(argc >= MAXARG)
80100c08:	83 ff 20             	cmp    $0x20,%edi
80100c0b:	74 92                	je     80100b9f <exec+0x1af>
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c0d:	83 ec 0c             	sub    $0xc,%esp
80100c10:	50                   	push   %eax
80100c11:	e8 4a 3c 00 00       	call   80104860 <strlen>
80100c16:	f7 d0                	not    %eax
80100c18:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c1a:	58                   	pop    %eax
80100c1b:	8b 45 0c             	mov    0xc(%ebp),%eax

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c1e:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c21:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c24:	e8 37 3c 00 00       	call   80104860 <strlen>
80100c29:	83 c0 01             	add    $0x1,%eax
80100c2c:	50                   	push   %eax
80100c2d:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c30:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c33:	53                   	push   %ebx
80100c34:	56                   	push   %esi
80100c35:	e8 36 64 00 00       	call   80107070 <copyout>
80100c3a:	83 c4 20             	add    $0x20,%esp
80100c3d:	85 c0                	test   %eax,%eax
80100c3f:	0f 88 5a ff ff ff    	js     80100b9f <exec+0x1af>
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c45:	8b 45 0c             	mov    0xc(%ebp),%eax
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c48:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c4f:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c52:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c58:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c5b:	85 c0                	test   %eax,%eax
80100c5d:	75 a9                	jne    80100c08 <exec+0x218>
80100c5f:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c65:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c6c:	89 d9                	mov    %ebx,%ecx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
  }
  ustack[3+argc] = 0;
80100c6e:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c75:	00 00 00 00 

  ustack[0] = 0xffffffff;  // fake return PC
80100c79:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c80:	ff ff ff 
  ustack[1] = argc;
80100c83:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c89:	29 c1                	sub    %eax,%ecx

  sp -= (3+argc+1) * 4;
80100c8b:	83 c0 0c             	add    $0xc,%eax
80100c8e:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c90:	50                   	push   %eax
80100c91:	52                   	push   %edx
80100c92:	53                   	push   %ebx
80100c93:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c99:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c9f:	e8 cc 63 00 00       	call   80107070 <copyout>
80100ca4:	83 c4 10             	add    $0x10,%esp
80100ca7:	85 c0                	test   %eax,%eax
80100ca9:	0f 88 f0 fe ff ff    	js     80100b9f <exec+0x1af>
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100caf:	8b 45 08             	mov    0x8(%ebp),%eax
80100cb2:	0f b6 10             	movzbl (%eax),%edx
80100cb5:	84 d2                	test   %dl,%dl
80100cb7:	74 1a                	je     80100cd3 <exec+0x2e3>
80100cb9:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100cbc:	83 c0 01             	add    $0x1,%eax
80100cbf:	90                   	nop
    if(*s == '/')
      last = s+1;
80100cc0:	80 fa 2f             	cmp    $0x2f,%dl
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100cc3:	0f b6 10             	movzbl (%eax),%edx
    if(*s == '/')
      last = s+1;
80100cc6:	0f 44 c8             	cmove  %eax,%ecx
80100cc9:	83 c0 01             	add    $0x1,%eax
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100ccc:	84 d2                	test   %dl,%dl
80100cce:	75 f0                	jne    80100cc0 <exec+0x2d0>
80100cd0:	89 4d 08             	mov    %ecx,0x8(%ebp)
    if(*s == '/')
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));
80100cd3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100cd9:	83 ec 04             	sub    $0x4,%esp
80100cdc:	6a 10                	push   $0x10
80100cde:	ff 75 08             	pushl  0x8(%ebp)
80100ce1:	83 c0 6c             	add    $0x6c,%eax
80100ce4:	50                   	push   %eax
80100ce5:	e8 36 3b 00 00       	call   80104820 <safestrcpy>

  // Commit to the user image.
  oldpgdir = proc->pgdir;
80100cea:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  proc->pgdir = pgdir;
80100cf0:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
    if(*s == '/')
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));

  // Commit to the user image.
  oldpgdir = proc->pgdir;
80100cf6:	8b 78 04             	mov    0x4(%eax),%edi
  proc->pgdir = pgdir;
  proc->sz = sz;
80100cf9:	89 30                	mov    %esi,(%eax)
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));

  // Commit to the user image.
  oldpgdir = proc->pgdir;
  proc->pgdir = pgdir;
80100cfb:	89 48 04             	mov    %ecx,0x4(%eax)
  proc->sz = sz;
  proc->tf->eip = elf.entry;  // main
80100cfe:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100d04:	8b 8d 3c ff ff ff    	mov    -0xc4(%ebp),%ecx
80100d0a:	8b 50 18             	mov    0x18(%eax),%edx
80100d0d:	89 4a 38             	mov    %ecx,0x38(%edx)
  proc->tf->esp = sp;
80100d10:	8b 50 18             	mov    0x18(%eax),%edx
80100d13:	89 5a 44             	mov    %ebx,0x44(%edx)
  switchuvm(proc);
80100d16:	89 04 24             	mov    %eax,(%esp)
80100d19:	e8 62 5e 00 00       	call   80106b80 <switchuvm>
  freevm(oldpgdir);
80100d1e:	89 3c 24             	mov    %edi,(%esp)
80100d21:	e8 6a 61 00 00       	call   80106e90 <freevm>
  return 0;
80100d26:	83 c4 10             	add    $0x10,%esp
80100d29:	31 c0                	xor    %eax,%eax
80100d2b:	e9 21 fd ff ff       	jmp    80100a51 <exec+0x61>
  if((pgdir = setupkvm()) == 0)
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100d30:	bf 00 20 00 00       	mov    $0x2000,%edi
80100d35:	31 f6                	xor    %esi,%esi
80100d37:	e9 3c fe ff ff       	jmp    80100b78 <exec+0x188>
80100d3c:	66 90                	xchg   %ax,%ax
80100d3e:	66 90                	xchg   %ax,%ax

80100d40 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100d40:	55                   	push   %ebp
80100d41:	89 e5                	mov    %esp,%ebp
80100d43:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100d46:	68 a9 71 10 80       	push   $0x801071a9
80100d4b:	68 e0 ff 10 80       	push   $0x8010ffe0
80100d50:	e8 7b 36 00 00       	call   801043d0 <initlock>
}
80100d55:	83 c4 10             	add    $0x10,%esp
80100d58:	c9                   	leave  
80100d59:	c3                   	ret    
80100d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d60 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d60:	55                   	push   %ebp
80100d61:	89 e5                	mov    %esp,%ebp
80100d63:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d64:	bb 14 00 11 80       	mov    $0x80110014,%ebx
}

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d69:	83 ec 10             	sub    $0x10,%esp
  struct file *f;

  acquire(&ftable.lock);
80100d6c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100d71:	e8 7a 36 00 00       	call   801043f0 <acquire>
80100d76:	83 c4 10             	add    $0x10,%esp
80100d79:	eb 10                	jmp    80100d8b <filealloc+0x2b>
80100d7b:	90                   	nop
80100d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d80:	83 c3 18             	add    $0x18,%ebx
80100d83:	81 fb 74 09 11 80    	cmp    $0x80110974,%ebx
80100d89:	74 25                	je     80100db0 <filealloc+0x50>
    if(f->ref == 0){
80100d8b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d8e:	85 c0                	test   %eax,%eax
80100d90:	75 ee                	jne    80100d80 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100d92:	83 ec 0c             	sub    $0xc,%esp
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
      f->ref = 1;
80100d95:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100d9c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100da1:	e8 2a 38 00 00       	call   801045d0 <release>
      return f;
80100da6:	89 d8                	mov    %ebx,%eax
80100da8:	83 c4 10             	add    $0x10,%esp
    }
  }
  release(&ftable.lock);
  return 0;
}
80100dab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dae:	c9                   	leave  
80100daf:	c3                   	ret    
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
80100db0:	83 ec 0c             	sub    $0xc,%esp
80100db3:	68 e0 ff 10 80       	push   $0x8010ffe0
80100db8:	e8 13 38 00 00       	call   801045d0 <release>
  return 0;
80100dbd:	83 c4 10             	add    $0x10,%esp
80100dc0:	31 c0                	xor    %eax,%eax
}
80100dc2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dc5:	c9                   	leave  
80100dc6:	c3                   	ret    
80100dc7:	89 f6                	mov    %esi,%esi
80100dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100dd0 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100dd0:	55                   	push   %ebp
80100dd1:	89 e5                	mov    %esp,%ebp
80100dd3:	53                   	push   %ebx
80100dd4:	83 ec 10             	sub    $0x10,%esp
80100dd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100dda:	68 e0 ff 10 80       	push   $0x8010ffe0
80100ddf:	e8 0c 36 00 00       	call   801043f0 <acquire>
  if(f->ref < 1)
80100de4:	8b 43 04             	mov    0x4(%ebx),%eax
80100de7:	83 c4 10             	add    $0x10,%esp
80100dea:	85 c0                	test   %eax,%eax
80100dec:	7e 1a                	jle    80100e08 <filedup+0x38>
    panic("filedup");
  f->ref++;
80100dee:	83 c0 01             	add    $0x1,%eax
  release(&ftable.lock);
80100df1:	83 ec 0c             	sub    $0xc,%esp
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
  f->ref++;
80100df4:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100df7:	68 e0 ff 10 80       	push   $0x8010ffe0
80100dfc:	e8 cf 37 00 00       	call   801045d0 <release>
  return f;
}
80100e01:	89 d8                	mov    %ebx,%eax
80100e03:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e06:	c9                   	leave  
80100e07:	c3                   	ret    
struct file*
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
80100e08:	83 ec 0c             	sub    $0xc,%esp
80100e0b:	68 b0 71 10 80       	push   $0x801071b0
80100e10:	e8 5b f5 ff ff       	call   80100370 <panic>
80100e15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e20 <fileclose>:
}

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e20:	55                   	push   %ebp
80100e21:	89 e5                	mov    %esp,%ebp
80100e23:	57                   	push   %edi
80100e24:	56                   	push   %esi
80100e25:	53                   	push   %ebx
80100e26:	83 ec 28             	sub    $0x28,%esp
80100e29:	8b 7d 08             	mov    0x8(%ebp),%edi
  struct file ff;

  acquire(&ftable.lock);
80100e2c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100e31:	e8 ba 35 00 00       	call   801043f0 <acquire>
  if(f->ref < 1)
80100e36:	8b 47 04             	mov    0x4(%edi),%eax
80100e39:	83 c4 10             	add    $0x10,%esp
80100e3c:	85 c0                	test   %eax,%eax
80100e3e:	0f 8e 9b 00 00 00    	jle    80100edf <fileclose+0xbf>
    panic("fileclose");
  if(--f->ref > 0){
80100e44:	83 e8 01             	sub    $0x1,%eax
80100e47:	85 c0                	test   %eax,%eax
80100e49:	89 47 04             	mov    %eax,0x4(%edi)
80100e4c:	74 1a                	je     80100e68 <fileclose+0x48>
    release(&ftable.lock);
80100e4e:	c7 45 08 e0 ff 10 80 	movl   $0x8010ffe0,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e55:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e58:	5b                   	pop    %ebx
80100e59:	5e                   	pop    %esi
80100e5a:	5f                   	pop    %edi
80100e5b:	5d                   	pop    %ebp

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
80100e5c:	e9 6f 37 00 00       	jmp    801045d0 <release>
80100e61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return;
  }
  ff = *f;
80100e68:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e6c:	8b 1f                	mov    (%edi),%ebx
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e6e:	83 ec 0c             	sub    $0xc,%esp
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e71:	8b 77 0c             	mov    0xc(%edi),%esi
  f->ref = 0;
  f->type = FD_NONE;
80100e74:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e7a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e7d:	8b 47 10             	mov    0x10(%edi),%eax
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e80:	68 e0 ff 10 80       	push   $0x8010ffe0
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e85:	89 45 e0             	mov    %eax,-0x20(%ebp)
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e88:	e8 43 37 00 00       	call   801045d0 <release>

  if(ff.type == FD_PIPE)
80100e8d:	83 c4 10             	add    $0x10,%esp
80100e90:	83 fb 01             	cmp    $0x1,%ebx
80100e93:	74 13                	je     80100ea8 <fileclose+0x88>
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
80100e95:	83 fb 02             	cmp    $0x2,%ebx
80100e98:	74 26                	je     80100ec0 <fileclose+0xa0>
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e9d:	5b                   	pop    %ebx
80100e9e:	5e                   	pop    %esi
80100e9f:	5f                   	pop    %edi
80100ea0:	5d                   	pop    %ebp
80100ea1:	c3                   	ret    
80100ea2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);

  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
80100ea8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100eac:	83 ec 08             	sub    $0x8,%esp
80100eaf:	53                   	push   %ebx
80100eb0:	56                   	push   %esi
80100eb1:	e8 3a 27 00 00       	call   801035f0 <pipeclose>
80100eb6:	83 c4 10             	add    $0x10,%esp
80100eb9:	eb df                	jmp    80100e9a <fileclose+0x7a>
80100ebb:	90                   	nop
80100ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  else if(ff.type == FD_INODE){
    begin_op();
80100ec0:	e8 8b 1e 00 00       	call   80102d50 <begin_op>
    iput(ff.ip);
80100ec5:	83 ec 0c             	sub    $0xc,%esp
80100ec8:	ff 75 e0             	pushl  -0x20(%ebp)
80100ecb:	e8 90 09 00 00       	call   80101860 <iput>
    end_op();
80100ed0:	83 c4 10             	add    $0x10,%esp
  }
}
80100ed3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ed6:	5b                   	pop    %ebx
80100ed7:	5e                   	pop    %esi
80100ed8:	5f                   	pop    %edi
80100ed9:	5d                   	pop    %ebp
  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
80100eda:	e9 e1 1e 00 00       	jmp    80102dc0 <end_op>
{
  struct file ff;

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
80100edf:	83 ec 0c             	sub    $0xc,%esp
80100ee2:	68 b8 71 10 80       	push   $0x801071b8
80100ee7:	e8 84 f4 ff ff       	call   80100370 <panic>
80100eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ef0 <filestat>:
}

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100ef0:	55                   	push   %ebp
80100ef1:	89 e5                	mov    %esp,%ebp
80100ef3:	53                   	push   %ebx
80100ef4:	83 ec 04             	sub    $0x4,%esp
80100ef7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100efa:	83 3b 02             	cmpl   $0x2,(%ebx)
80100efd:	75 31                	jne    80100f30 <filestat+0x40>
    ilock(f->ip);
80100eff:	83 ec 0c             	sub    $0xc,%esp
80100f02:	ff 73 10             	pushl  0x10(%ebx)
80100f05:	e8 26 08 00 00       	call   80101730 <ilock>
    stati(f->ip, st);
80100f0a:	58                   	pop    %eax
80100f0b:	5a                   	pop    %edx
80100f0c:	ff 75 0c             	pushl  0xc(%ebp)
80100f0f:	ff 73 10             	pushl  0x10(%ebx)
80100f12:	e8 69 0b 00 00       	call   80101a80 <stati>
    iunlock(f->ip);
80100f17:	59                   	pop    %ecx
80100f18:	ff 73 10             	pushl  0x10(%ebx)
80100f1b:	e8 f0 08 00 00       	call   80101810 <iunlock>
    return 0;
80100f20:	83 c4 10             	add    $0x10,%esp
80100f23:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80100f25:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f28:	c9                   	leave  
80100f29:	c3                   	ret    
80100f2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    ilock(f->ip);
    stati(f->ip, st);
    iunlock(f->ip);
    return 0;
  }
  return -1;
80100f30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100f35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f38:	c9                   	leave  
80100f39:	c3                   	ret    
80100f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f40 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100f40:	55                   	push   %ebp
80100f41:	89 e5                	mov    %esp,%ebp
80100f43:	57                   	push   %edi
80100f44:	56                   	push   %esi
80100f45:	53                   	push   %ebx
80100f46:	83 ec 0c             	sub    $0xc,%esp
80100f49:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f4c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f4f:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100f52:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f56:	74 60                	je     80100fb8 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
80100f58:	8b 03                	mov    (%ebx),%eax
80100f5a:	83 f8 01             	cmp    $0x1,%eax
80100f5d:	74 41                	je     80100fa0 <fileread+0x60>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100f5f:	83 f8 02             	cmp    $0x2,%eax
80100f62:	75 5b                	jne    80100fbf <fileread+0x7f>
    ilock(f->ip);
80100f64:	83 ec 0c             	sub    $0xc,%esp
80100f67:	ff 73 10             	pushl  0x10(%ebx)
80100f6a:	e8 c1 07 00 00       	call   80101730 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f6f:	57                   	push   %edi
80100f70:	ff 73 14             	pushl  0x14(%ebx)
80100f73:	56                   	push   %esi
80100f74:	ff 73 10             	pushl  0x10(%ebx)
80100f77:	e8 34 0b 00 00       	call   80101ab0 <readi>
80100f7c:	83 c4 20             	add    $0x20,%esp
80100f7f:	85 c0                	test   %eax,%eax
80100f81:	89 c6                	mov    %eax,%esi
80100f83:	7e 03                	jle    80100f88 <fileread+0x48>
      f->off += r;
80100f85:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100f88:	83 ec 0c             	sub    $0xc,%esp
80100f8b:	ff 73 10             	pushl  0x10(%ebx)
80100f8e:	e8 7d 08 00 00       	call   80101810 <iunlock>
    return r;
80100f93:	83 c4 10             	add    $0x10,%esp
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
    ilock(f->ip);
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f96:	89 f0                	mov    %esi,%eax
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100f98:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f9b:	5b                   	pop    %ebx
80100f9c:	5e                   	pop    %esi
80100f9d:	5f                   	pop    %edi
80100f9e:	5d                   	pop    %ebp
80100f9f:	c3                   	ret    
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100fa0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fa3:	89 45 08             	mov    %eax,0x8(%ebp)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100fa6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fa9:	5b                   	pop    %ebx
80100faa:	5e                   	pop    %esi
80100fab:	5f                   	pop    %edi
80100fac:	5d                   	pop    %ebp
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100fad:	e9 0e 28 00 00       	jmp    801037c0 <piperead>
80100fb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
fileread(struct file *f, char *addr, int n)
{
  int r;

  if(f->readable == 0)
    return -1;
80100fb8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fbd:	eb d9                	jmp    80100f98 <fileread+0x58>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
80100fbf:	83 ec 0c             	sub    $0xc,%esp
80100fc2:	68 c2 71 10 80       	push   $0x801071c2
80100fc7:	e8 a4 f3 ff ff       	call   80100370 <panic>
80100fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100fd0 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100fd0:	55                   	push   %ebp
80100fd1:	89 e5                	mov    %esp,%ebp
80100fd3:	57                   	push   %edi
80100fd4:	56                   	push   %esi
80100fd5:	53                   	push   %ebx
80100fd6:	83 ec 1c             	sub    $0x1c,%esp
80100fd9:	8b 75 08             	mov    0x8(%ebp),%esi
80100fdc:	8b 45 0c             	mov    0xc(%ebp),%eax
  int r;

  if(f->writable == 0)
80100fdf:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100fe3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100fe6:	8b 45 10             	mov    0x10(%ebp),%eax
80100fe9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int r;

  if(f->writable == 0)
80100fec:	0f 84 aa 00 00 00    	je     8010109c <filewrite+0xcc>
    return -1;
  if(f->type == FD_PIPE)
80100ff2:	8b 06                	mov    (%esi),%eax
80100ff4:	83 f8 01             	cmp    $0x1,%eax
80100ff7:	0f 84 c2 00 00 00    	je     801010bf <filewrite+0xef>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100ffd:	83 f8 02             	cmp    $0x2,%eax
80101000:	0f 85 d8 00 00 00    	jne    801010de <filewrite+0x10e>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80101006:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101009:	31 ff                	xor    %edi,%edi
8010100b:	85 c0                	test   %eax,%eax
8010100d:	7f 34                	jg     80101043 <filewrite+0x73>
8010100f:	e9 9c 00 00 00       	jmp    801010b0 <filewrite+0xe0>
80101014:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101018:	01 46 14             	add    %eax,0x14(%esi)
      iunlock(f->ip);
8010101b:	83 ec 0c             	sub    $0xc,%esp
8010101e:	ff 76 10             	pushl  0x10(%esi)
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101021:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101024:	e8 e7 07 00 00       	call   80101810 <iunlock>
      end_op();
80101029:	e8 92 1d 00 00       	call   80102dc0 <end_op>
8010102e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101031:	83 c4 10             	add    $0x10,%esp

      if(r < 0)
        break;
      if(r != n1)
80101034:	39 d8                	cmp    %ebx,%eax
80101036:	0f 85 95 00 00 00    	jne    801010d1 <filewrite+0x101>
        panic("short filewrite");
      i += r;
8010103c:	01 c7                	add    %eax,%edi
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
8010103e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101041:	7e 6d                	jle    801010b0 <filewrite+0xe0>
      int n1 = n - i;
80101043:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101046:	b8 00 1a 00 00       	mov    $0x1a00,%eax
8010104b:	29 fb                	sub    %edi,%ebx
8010104d:	81 fb 00 1a 00 00    	cmp    $0x1a00,%ebx
80101053:	0f 4f d8             	cmovg  %eax,%ebx
      if(n1 > max)
        n1 = max;

      begin_op();
80101056:	e8 f5 1c 00 00       	call   80102d50 <begin_op>
      ilock(f->ip);
8010105b:	83 ec 0c             	sub    $0xc,%esp
8010105e:	ff 76 10             	pushl  0x10(%esi)
80101061:	e8 ca 06 00 00       	call   80101730 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80101066:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101069:	53                   	push   %ebx
8010106a:	ff 76 14             	pushl  0x14(%esi)
8010106d:	01 f8                	add    %edi,%eax
8010106f:	50                   	push   %eax
80101070:	ff 76 10             	pushl  0x10(%esi)
80101073:	e8 38 0b 00 00       	call   80101bb0 <writei>
80101078:	83 c4 20             	add    $0x20,%esp
8010107b:	85 c0                	test   %eax,%eax
8010107d:	7f 99                	jg     80101018 <filewrite+0x48>
        f->off += r;
      iunlock(f->ip);
8010107f:	83 ec 0c             	sub    $0xc,%esp
80101082:	ff 76 10             	pushl  0x10(%esi)
80101085:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101088:	e8 83 07 00 00       	call   80101810 <iunlock>
      end_op();
8010108d:	e8 2e 1d 00 00       	call   80102dc0 <end_op>

      if(r < 0)
80101092:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101095:	83 c4 10             	add    $0x10,%esp
80101098:	85 c0                	test   %eax,%eax
8010109a:	74 98                	je     80101034 <filewrite+0x64>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
8010109c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
8010109f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  panic("filewrite");
}
801010a4:	5b                   	pop    %ebx
801010a5:	5e                   	pop    %esi
801010a6:	5f                   	pop    %edi
801010a7:	5d                   	pop    %ebp
801010a8:	c3                   	ret    
801010a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
801010b0:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
801010b3:	75 e7                	jne    8010109c <filewrite+0xcc>
  }
  panic("filewrite");
}
801010b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010b8:	89 f8                	mov    %edi,%eax
801010ba:	5b                   	pop    %ebx
801010bb:	5e                   	pop    %esi
801010bc:	5f                   	pop    %edi
801010bd:	5d                   	pop    %ebp
801010be:	c3                   	ret    
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010bf:	8b 46 0c             	mov    0xc(%esi),%eax
801010c2:	89 45 08             	mov    %eax,0x8(%ebp)
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010c8:	5b                   	pop    %ebx
801010c9:	5e                   	pop    %esi
801010ca:	5f                   	pop    %edi
801010cb:	5d                   	pop    %ebp
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010cc:	e9 bf 25 00 00       	jmp    80103690 <pipewrite>
      end_op();

      if(r < 0)
        break;
      if(r != n1)
        panic("short filewrite");
801010d1:	83 ec 0c             	sub    $0xc,%esp
801010d4:	68 cb 71 10 80       	push   $0x801071cb
801010d9:	e8 92 f2 ff ff       	call   80100370 <panic>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
801010de:	83 ec 0c             	sub    $0xc,%esp
801010e1:	68 d1 71 10 80       	push   $0x801071d1
801010e6:	e8 85 f2 ff ff       	call   80100370 <panic>
801010eb:	66 90                	xchg   %ax,%ax
801010ed:	66 90                	xchg   %ax,%ax
801010ef:	90                   	nop

801010f0 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
801010f0:	55                   	push   %ebp
801010f1:	89 e5                	mov    %esp,%ebp
801010f3:	57                   	push   %edi
801010f4:	56                   	push   %esi
801010f5:	53                   	push   %ebx
801010f6:	83 ec 1c             	sub    $0x1c,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
801010f9:	8b 0d e0 09 11 80    	mov    0x801109e0,%ecx
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
801010ff:	89 45 d8             	mov    %eax,-0x28(%ebp)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
80101102:	85 c9                	test   %ecx,%ecx
80101104:	0f 84 85 00 00 00    	je     8010118f <balloc+0x9f>
8010110a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
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
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101139:	31 c0                	xor    %eax,%eax
8010113b:	eb 2d                	jmp    8010116a <balloc+0x7a>
8010113d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
80101140:	89 c1                	mov    %eax,%ecx
80101142:	ba 01 00 00 00       	mov    $0x1,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101147:	8b 5d e4             	mov    -0x1c(%ebp),%ebx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
8010114a:	83 e1 07             	and    $0x7,%ecx
8010114d:	d3 e2                	shl    %cl,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010114f:	89 c1                	mov    %eax,%ecx
80101151:	c1 f9 03             	sar    $0x3,%ecx
80101154:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
80101159:	85 d7                	test   %edx,%edi
8010115b:	74 43                	je     801011a0 <balloc+0xb0>
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010115d:	83 c0 01             	add    $0x1,%eax
80101160:	83 c6 01             	add    $0x1,%esi
80101163:	3d 00 10 00 00       	cmp    $0x1000,%eax
80101168:	74 05                	je     8010116f <balloc+0x7f>
8010116a:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010116d:	72 d1                	jb     80101140 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
8010116f:	83 ec 0c             	sub    $0xc,%esp
80101172:	ff 75 e4             	pushl  -0x1c(%ebp)
80101175:	e8 66 f0 ff ff       	call   801001e0 <brelse>
{
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
8010117a:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101181:	83 c4 10             	add    $0x10,%esp
80101184:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101187:	39 05 e0 09 11 80    	cmp    %eax,0x801109e0
8010118d:	77 82                	ja     80101111 <balloc+0x21>
        return b + bi;
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
8010118f:	83 ec 0c             	sub    $0xc,%esp
80101192:	68 db 71 10 80       	push   $0x801071db
80101197:	e8 d4 f1 ff ff       	call   80100370 <panic>
8010119c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
801011a0:	09 fa                	or     %edi,%edx
801011a2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
801011a5:	83 ec 0c             	sub    $0xc,%esp
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
801011a8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
801011ac:	57                   	push   %edi
801011ad:	e8 7e 1d 00 00       	call   80102f30 <log_write>
        brelse(bp);
801011b2:	89 3c 24             	mov    %edi,(%esp)
801011b5:	e8 26 f0 ff ff       	call   801001e0 <brelse>
static void
bzero(int dev, int bno)
{
  struct buf *bp;

  bp = bread(dev, bno);
801011ba:	58                   	pop    %eax
801011bb:	5a                   	pop    %edx
801011bc:	56                   	push   %esi
801011bd:	ff 75 d8             	pushl  -0x28(%ebp)
801011c0:	e8 0b ef ff ff       	call   801000d0 <bread>
801011c5:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
801011c7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011ca:	83 c4 0c             	add    $0xc,%esp
801011cd:	68 00 02 00 00       	push   $0x200
801011d2:	6a 00                	push   $0x0
801011d4:	50                   	push   %eax
801011d5:	e8 46 34 00 00       	call   80104620 <memset>
  log_write(bp);
801011da:	89 1c 24             	mov    %ebx,(%esp)
801011dd:	e8 4e 1d 00 00       	call   80102f30 <log_write>
  brelse(bp);
801011e2:	89 1c 24             	mov    %ebx,(%esp)
801011e5:	e8 f6 ef ff ff       	call   801001e0 <brelse>
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
}
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
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101200:	55                   	push   %ebp
80101201:	89 e5                	mov    %esp,%ebp
80101203:	57                   	push   %edi
80101204:	56                   	push   %esi
80101205:	53                   	push   %ebx
80101206:	89 c7                	mov    %eax,%edi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101208:	31 f6                	xor    %esi,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010120a:	bb 34 0a 11 80       	mov    $0x80110a34,%ebx
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
8010120f:	83 ec 28             	sub    $0x28,%esp
80101212:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  struct inode *ip, *empty;

  acquire(&icache.lock);
80101215:	68 00 0a 11 80       	push   $0x80110a00
8010121a:	e8 d1 31 00 00       	call   801043f0 <acquire>
8010121f:	83 c4 10             	add    $0x10,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101222:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101225:	eb 1b                	jmp    80101242 <iget+0x42>
80101227:	89 f6                	mov    %esi,%esi
80101229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101230:	85 f6                	test   %esi,%esi
80101232:	74 44                	je     80101278 <iget+0x78>

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101234:	81 c3 8c 00 00 00    	add    $0x8c,%ebx
8010123a:	81 fb 8c 25 11 80    	cmp    $0x8011258c,%ebx
80101240:	74 4e                	je     80101290 <iget+0x90>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101242:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101245:	85 c9                	test   %ecx,%ecx
80101247:	7e e7                	jle    80101230 <iget+0x30>
80101249:	39 3b                	cmp    %edi,(%ebx)
8010124b:	75 e3                	jne    80101230 <iget+0x30>
8010124d:	39 53 04             	cmp    %edx,0x4(%ebx)
80101250:	75 de                	jne    80101230 <iget+0x30>
      ip->ref++;
      release(&icache.lock);
80101252:	83 ec 0c             	sub    $0xc,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
80101255:	83 c1 01             	add    $0x1,%ecx
      release(&icache.lock);
      return ip;
80101258:	89 de                	mov    %ebx,%esi
  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
8010125a:	68 00 0a 11 80       	push   $0x80110a00

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
8010125f:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
80101262:	e8 69 33 00 00       	call   801045d0 <release>
      return ip;
80101267:	83 c4 10             	add    $0x10,%esp
  ip->ref = 1;
  ip->flags = 0;
  release(&icache.lock);

  return ip;
}
8010126a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010126d:	89 f0                	mov    %esi,%eax
8010126f:	5b                   	pop    %ebx
80101270:	5e                   	pop    %esi
80101271:	5f                   	pop    %edi
80101272:	5d                   	pop    %ebp
80101273:	c3                   	ret    
80101274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101278:	85 c9                	test   %ecx,%ecx
8010127a:	0f 44 f3             	cmove  %ebx,%esi

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010127d:	81 c3 8c 00 00 00    	add    $0x8c,%ebx
80101283:	81 fb 8c 25 11 80    	cmp    $0x8011258c,%ebx
80101289:	75 b7                	jne    80101242 <iget+0x42>
8010128b:	90                   	nop
8010128c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
80101290:	85 f6                	test   %esi,%esi
80101292:	74 2d                	je     801012c1 <iget+0xc1>
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->flags = 0;
  release(&icache.lock);
80101294:	83 ec 0c             	sub    $0xc,%esp
  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");

  ip = empty;
  ip->dev = dev;
80101297:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
80101299:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
8010129c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->flags = 0;
801012a3:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
801012aa:	68 00 0a 11 80       	push   $0x80110a00
801012af:	e8 1c 33 00 00       	call   801045d0 <release>

  return ip;
801012b4:	83 c4 10             	add    $0x10,%esp
}
801012b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012ba:	89 f0                	mov    %esi,%eax
801012bc:	5b                   	pop    %ebx
801012bd:	5e                   	pop    %esi
801012be:	5f                   	pop    %edi
801012bf:	5d                   	pop    %ebp
801012c0:	c3                   	ret    
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");
801012c1:	83 ec 0c             	sub    $0xc,%esp
801012c4:	68 f1 71 10 80       	push   $0x801071f1
801012c9:	e8 a2 f0 ff ff       	call   80100370 <panic>
801012ce:	66 90                	xchg   %ax,%ax

801012d0 <bmap>:
// listed in block ip->addrs[NDIRECT].

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn) {
801012d0:	55                   	push   %ebp
801012d1:	89 e5                	mov    %esp,%ebp
801012d3:	57                   	push   %edi
801012d4:	56                   	push   %esi
801012d5:	53                   	push   %ebx
801012d6:	89 c6                	mov    %eax,%esi
801012d8:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;
  
  // case 1: direct: bn in [0,11)
  if (bn < NDIRECT) {
801012db:	83 fa 0a             	cmp    $0xa,%edx
801012de:	77 20                	ja     80101300 <bmap+0x30>
801012e0:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
    if ((addr = ip->addrs[bn]) == 0) {
801012e3:	8b 43 5c             	mov    0x5c(%ebx),%eax
801012e6:	85 c0                	test   %eax,%eax
801012e8:	0f 84 fa 00 00 00    	je     801013e8 <bmap+0x118>
    brelse(bp2);

    return addr;
  }
  panic("bmap: out of range");
}
801012ee:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012f1:	5b                   	pop    %ebx
801012f2:	5e                   	pop    %esi
801012f3:	5f                   	pop    %edi
801012f4:	5d                   	pop    %ebp
801012f5:	c3                   	ret    
801012f6:	8d 76 00             	lea    0x0(%esi),%esi
801012f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    }
    return addr;
  } 
  
  // case 2: singled-linked: original bn in [11, 139)
  bn -= NDIRECT;
80101300:	8d 5a f5             	lea    -0xb(%edx),%ebx
  if (bn < NINDIRECT) {
80101303:	83 fb 7f             	cmp    $0x7f,%ebx
80101306:	0f 86 84 00 00 00    	jbe    80101390 <bmap+0xc0>
    brelse(bp);
    return addr;
  }

  // case 3: double-linked: original bn in [139, 16523)
  bn -= NINDIRECT;
8010130c:	8d 9a 75 ff ff ff    	lea    -0x8b(%edx),%ebx
  if (bn < NDINDIRECT) {
80101312:	81 fb ff 3f 00 00    	cmp    $0x3fff,%ebx
80101318:	0f 87 3c 01 00 00    	ja     8010145a <bmap+0x18a>
    if (0 == (addr = ip->addrs[DOUBLE_LINKED_INDIRECT_TABLE])) {
8010131e:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
80101324:	85 c0                	test   %eax,%eax
80101326:	0f 84 1c 01 00 00    	je     80101448 <bmap+0x178>
      ip->addrs[DOUBLE_LINKED_INDIRECT_TABLE] = addr = balloc(ip->dev);
    }

    bp = bread(ip->dev, addr);
8010132c:	83 ec 08             	sub    $0x8,%esp
8010132f:	50                   	push   %eax
80101330:	ff 36                	pushl  (%esi)
80101332:	e8 99 ed ff ff       	call   801000d0 <bread>
80101337:	89 c2                	mov    %eax,%edx
    a = (uint*)bp->data;
    
    // first-level indirect lookup
    uint idx1 = bn / NINDIRECT;
    if (0 == (addr = a[idx1])) {
80101339:	89 d8                	mov    %ebx,%eax
8010133b:	83 c4 10             	add    $0x10,%esp
8010133e:	c1 e8 07             	shr    $0x7,%eax
80101341:	8d 4c 82 5c          	lea    0x5c(%edx,%eax,4),%ecx
80101345:	8b 39                	mov    (%ecx),%edi
80101347:	85 ff                	test   %edi,%edi
80101349:	0f 84 b1 00 00 00    	je     80101400 <bmap+0x130>
      a[idx1] = addr = balloc(ip->dev);
      log_write(bp);
    }
    brelse(bp);
8010134f:	83 ec 0c             	sub    $0xc,%esp
    // second-level indirect lookup
    struct buf* bp2;
    uint idx2 = bn % NINDIRECT; 
    bp2 = bread(ip->dev, addr);
    a = (uint*)bp2->data;
    if (0 == (addr = a[idx2])) {
80101352:	83 e3 7f             	and    $0x7f,%ebx
    uint idx1 = bn / NINDIRECT;
    if (0 == (addr = a[idx1])) {
      a[idx1] = addr = balloc(ip->dev);
      log_write(bp);
    }
    brelse(bp);
80101355:	52                   	push   %edx
80101356:	e8 85 ee ff ff       	call   801001e0 <brelse>
  
    // second-level indirect lookup
    struct buf* bp2;
    uint idx2 = bn % NINDIRECT; 
    bp2 = bread(ip->dev, addr);
8010135b:	58                   	pop    %eax
8010135c:	5a                   	pop    %edx
8010135d:	57                   	push   %edi
8010135e:	ff 36                	pushl  (%esi)
80101360:	e8 6b ed ff ff       	call   801000d0 <bread>
    a = (uint*)bp2->data;
    if (0 == (addr = a[idx2])) {
80101365:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
80101369:	83 c4 10             	add    $0x10,%esp
    brelse(bp);
  
    // second-level indirect lookup
    struct buf* bp2;
    uint idx2 = bn % NINDIRECT; 
    bp2 = bread(ip->dev, addr);
8010136c:	89 c7                	mov    %eax,%edi
    a = (uint*)bp2->data;
    if (0 == (addr = a[idx2])) {
8010136e:	8b 1a                	mov    (%edx),%ebx
80101370:	85 db                	test   %ebx,%ebx
80101372:	74 44                	je     801013b8 <bmap+0xe8>
      a[idx2] = addr = balloc(ip->dev);
      log_write(bp2);
    }
    brelse(bp2);
80101374:	83 ec 0c             	sub    $0xc,%esp
80101377:	57                   	push   %edi
80101378:	e8 63 ee ff ff       	call   801001e0 <brelse>
8010137d:	83 c4 10             	add    $0x10,%esp

    return addr;
80101380:	89 d8                	mov    %ebx,%eax
  }
  panic("bmap: out of range");
}
80101382:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101385:	5b                   	pop    %ebx
80101386:	5e                   	pop    %esi
80101387:	5f                   	pop    %edi
80101388:	5d                   	pop    %ebp
80101389:	c3                   	ret    
8010138a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  // case 2: singled-linked: original bn in [11, 139)
  bn -= NDIRECT;
  if (bn < NINDIRECT) {
    // if the single-linked lookup talbe doesn't exist
    // allocate it
    if (0 == (addr = ip->addrs[SINGLE_LINKED_INDIRECT_TABLE])) {
80101390:	8b 80 88 00 00 00    	mov    0x88(%eax),%eax
80101396:	85 c0                	test   %eax,%eax
80101398:	0f 84 92 00 00 00    	je     80101430 <bmap+0x160>
      ip->addrs[SINGLE_LINKED_INDIRECT_TABLE] = addr = balloc(ip->dev);
    }

    // read the single-linked lookup talbe
    bp = bread(ip->dev, addr);
8010139e:	83 ec 08             	sub    $0x8,%esp
801013a1:	50                   	push   %eax
801013a2:	ff 36                	pushl  (%esi)
801013a4:	e8 27 ed ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;

    // indirect lookup
    if (0 == (addr = a[bn])) {
801013a9:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
801013ad:	83 c4 10             	add    $0x10,%esp
    if (0 == (addr = ip->addrs[SINGLE_LINKED_INDIRECT_TABLE])) {
      ip->addrs[SINGLE_LINKED_INDIRECT_TABLE] = addr = balloc(ip->dev);
    }

    // read the single-linked lookup talbe
    bp = bread(ip->dev, addr);
801013b0:	89 c7                	mov    %eax,%edi
    a = (uint*)bp->data;

    // indirect lookup
    if (0 == (addr = a[bn])) {
801013b2:	8b 1a                	mov    (%edx),%ebx
801013b4:	85 db                	test   %ebx,%ebx
801013b6:	75 bc                	jne    80101374 <bmap+0xa4>
    struct buf* bp2;
    uint idx2 = bn % NINDIRECT; 
    bp2 = bread(ip->dev, addr);
    a = (uint*)bp2->data;
    if (0 == (addr = a[idx2])) {
      a[idx2] = addr = balloc(ip->dev);
801013b8:	8b 06                	mov    (%esi),%eax
801013ba:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801013bd:	e8 2e fd ff ff       	call   801010f0 <balloc>
801013c2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      log_write(bp2);
801013c5:	83 ec 0c             	sub    $0xc,%esp
    struct buf* bp2;
    uint idx2 = bn % NINDIRECT; 
    bp2 = bread(ip->dev, addr);
    a = (uint*)bp2->data;
    if (0 == (addr = a[idx2])) {
      a[idx2] = addr = balloc(ip->dev);
801013c8:	89 c3                	mov    %eax,%ebx
801013ca:	89 02                	mov    %eax,(%edx)
      log_write(bp2);
801013cc:	57                   	push   %edi
801013cd:	e8 5e 1b 00 00       	call   80102f30 <log_write>
801013d2:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp2);
801013d5:	83 ec 0c             	sub    $0xc,%esp
801013d8:	57                   	push   %edi
801013d9:	e8 02 ee ff ff       	call   801001e0 <brelse>
801013de:	83 c4 10             	add    $0x10,%esp

    return addr;
801013e1:	89 d8                	mov    %ebx,%eax
801013e3:	eb 9d                	jmp    80101382 <bmap+0xb2>
801013e5:	8d 76 00             	lea    0x0(%esi),%esi
  struct buf *bp;
  
  // case 1: direct: bn in [0,11)
  if (bn < NDIRECT) {
    if ((addr = ip->addrs[bn]) == 0) {
      ip->addrs[bn] = addr = balloc(ip->dev);
801013e8:	8b 06                	mov    (%esi),%eax
801013ea:	e8 01 fd ff ff       	call   801010f0 <balloc>
801013ef:	89 43 5c             	mov    %eax,0x5c(%ebx)
    brelse(bp2);

    return addr;
  }
  panic("bmap: out of range");
}
801013f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013f5:	5b                   	pop    %ebx
801013f6:	5e                   	pop    %esi
801013f7:	5f                   	pop    %edi
801013f8:	5d                   	pop    %ebp
801013f9:	c3                   	ret    
801013fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    a = (uint*)bp->data;
    
    // first-level indirect lookup
    uint idx1 = bn / NINDIRECT;
    if (0 == (addr = a[idx1])) {
      a[idx1] = addr = balloc(ip->dev);
80101400:	8b 06                	mov    (%esi),%eax
80101402:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101405:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101408:	e8 e3 fc ff ff       	call   801010f0 <balloc>
      log_write(bp);
8010140d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    a = (uint*)bp->data;
    
    // first-level indirect lookup
    uint idx1 = bn / NINDIRECT;
    if (0 == (addr = a[idx1])) {
      a[idx1] = addr = balloc(ip->dev);
80101410:	8b 4d e0             	mov    -0x20(%ebp),%ecx
      log_write(bp);
80101413:	83 ec 0c             	sub    $0xc,%esp
    a = (uint*)bp->data;
    
    // first-level indirect lookup
    uint idx1 = bn / NINDIRECT;
    if (0 == (addr = a[idx1])) {
      a[idx1] = addr = balloc(ip->dev);
80101416:	89 c7                	mov    %eax,%edi
80101418:	89 01                	mov    %eax,(%ecx)
      log_write(bp);
8010141a:	52                   	push   %edx
8010141b:	e8 10 1b 00 00       	call   80102f30 <log_write>
80101420:	83 c4 10             	add    $0x10,%esp
80101423:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101426:	e9 24 ff ff ff       	jmp    8010134f <bmap+0x7f>
8010142b:	90                   	nop
8010142c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bn -= NDIRECT;
  if (bn < NINDIRECT) {
    // if the single-linked lookup talbe doesn't exist
    // allocate it
    if (0 == (addr = ip->addrs[SINGLE_LINKED_INDIRECT_TABLE])) {
      ip->addrs[SINGLE_LINKED_INDIRECT_TABLE] = addr = balloc(ip->dev);
80101430:	8b 06                	mov    (%esi),%eax
80101432:	e8 b9 fc ff ff       	call   801010f0 <balloc>
80101437:	89 86 88 00 00 00    	mov    %eax,0x88(%esi)
8010143d:	e9 5c ff ff ff       	jmp    8010139e <bmap+0xce>
80101442:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  // case 3: double-linked: original bn in [139, 16523)
  bn -= NINDIRECT;
  if (bn < NDINDIRECT) {
    if (0 == (addr = ip->addrs[DOUBLE_LINKED_INDIRECT_TABLE])) {
      ip->addrs[DOUBLE_LINKED_INDIRECT_TABLE] = addr = balloc(ip->dev);
80101448:	8b 06                	mov    (%esi),%eax
8010144a:	e8 a1 fc ff ff       	call   801010f0 <balloc>
8010144f:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
80101455:	e9 d2 fe ff ff       	jmp    8010132c <bmap+0x5c>
    }
    brelse(bp2);

    return addr;
  }
  panic("bmap: out of range");
8010145a:	83 ec 0c             	sub    $0xc,%esp
8010145d:	68 01 72 10 80       	push   $0x80107201
80101462:	e8 09 ef ff ff       	call   80100370 <panic>
80101467:	89 f6                	mov    %esi,%esi
80101469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101470 <readsb>:
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
80101470:	55                   	push   %ebp
80101471:	89 e5                	mov    %esp,%ebp
80101473:	56                   	push   %esi
80101474:	53                   	push   %ebx
80101475:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct buf *bp;

  bp = bread(dev, 1);
80101478:	83 ec 08             	sub    $0x8,%esp
8010147b:	6a 01                	push   $0x1
8010147d:	ff 75 08             	pushl  0x8(%ebp)
80101480:	e8 4b ec ff ff       	call   801000d0 <bread>
80101485:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
80101487:	8d 40 5c             	lea    0x5c(%eax),%eax
8010148a:	83 c4 0c             	add    $0xc,%esp
8010148d:	6a 1c                	push   $0x1c
8010148f:	50                   	push   %eax
80101490:	56                   	push   %esi
80101491:	e8 3a 32 00 00       	call   801046d0 <memmove>
  brelse(bp);
80101496:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101499:	83 c4 10             	add    $0x10,%esp
}
8010149c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010149f:	5b                   	pop    %ebx
801014a0:	5e                   	pop    %esi
801014a1:	5d                   	pop    %ebp
{
  struct buf *bp;

  bp = bread(dev, 1);
  memmove(sb, bp->data, sizeof(*sb));
  brelse(bp);
801014a2:	e9 39 ed ff ff       	jmp    801001e0 <brelse>
801014a7:	89 f6                	mov    %esi,%esi
801014a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801014b0 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
801014b0:	55                   	push   %ebp
801014b1:	89 e5                	mov    %esp,%ebp
801014b3:	56                   	push   %esi
801014b4:	53                   	push   %ebx
801014b5:	89 d3                	mov    %edx,%ebx
801014b7:	89 c6                	mov    %eax,%esi
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
801014b9:	83 ec 08             	sub    $0x8,%esp
801014bc:	68 e0 09 11 80       	push   $0x801109e0
801014c1:	50                   	push   %eax
801014c2:	e8 a9 ff ff ff       	call   80101470 <readsb>
  bp = bread(dev, BBLOCK(b, sb));
801014c7:	58                   	pop    %eax
801014c8:	5a                   	pop    %edx
801014c9:	89 da                	mov    %ebx,%edx
801014cb:	c1 ea 0c             	shr    $0xc,%edx
801014ce:	03 15 f8 09 11 80    	add    0x801109f8,%edx
801014d4:	52                   	push   %edx
801014d5:	56                   	push   %esi
801014d6:	e8 f5 eb ff ff       	call   801000d0 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
801014db:	89 d9                	mov    %ebx,%ecx
  if((bp->data[bi/8] & m) == 0)
801014dd:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
801014e3:	ba 01 00 00 00       	mov    $0x1,%edx
801014e8:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
801014eb:	c1 fb 03             	sar    $0x3,%ebx
801014ee:	83 c4 10             	add    $0x10,%esp
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
801014f1:	d3 e2                	shl    %cl,%edx
  if((bp->data[bi/8] & m) == 0)
801014f3:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
801014f8:	85 d1                	test   %edx,%ecx
801014fa:	74 27                	je     80101523 <bfree+0x73>
801014fc:	89 c6                	mov    %eax,%esi
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
801014fe:	f7 d2                	not    %edx
80101500:	89 c8                	mov    %ecx,%eax
  log_write(bp);
80101502:	83 ec 0c             	sub    $0xc,%esp
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
80101505:	21 d0                	and    %edx,%eax
80101507:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
  log_write(bp);
8010150b:	56                   	push   %esi
8010150c:	e8 1f 1a 00 00       	call   80102f30 <log_write>
  brelse(bp);
80101511:	89 34 24             	mov    %esi,(%esp)
80101514:	e8 c7 ec ff ff       	call   801001e0 <brelse>
}
80101519:	83 c4 10             	add    $0x10,%esp
8010151c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010151f:	5b                   	pop    %ebx
80101520:	5e                   	pop    %esi
80101521:	5d                   	pop    %ebp
80101522:	c3                   	ret    
  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
80101523:	83 ec 0c             	sub    $0xc,%esp
80101526:	68 14 72 10 80       	push   $0x80107214
8010152b:	e8 40 ee ff ff       	call   80100370 <panic>

80101530 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
80101530:	55                   	push   %ebp
80101531:	89 e5                	mov    %esp,%ebp
80101533:	53                   	push   %ebx
80101534:	bb 40 0a 11 80       	mov    $0x80110a40,%ebx
80101539:	83 ec 0c             	sub    $0xc,%esp
  int i = 0;
  
  initlock(&icache.lock, "icache");
8010153c:	68 27 72 10 80       	push   $0x80107227
80101541:	68 00 0a 11 80       	push   $0x80110a00
80101546:	e8 85 2e 00 00       	call   801043d0 <initlock>
8010154b:	83 c4 10             	add    $0x10,%esp
8010154e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < NINODE; i++) {
    initsleeplock(&icache.inode[i].lock, "inode");
80101550:	83 ec 08             	sub    $0x8,%esp
80101553:	68 2e 72 10 80       	push   $0x8010722e
80101558:	53                   	push   %ebx
80101559:	81 c3 8c 00 00 00    	add    $0x8c,%ebx
8010155f:	e8 5c 2d 00 00       	call   801042c0 <initsleeplock>
iinit(int dev)
{
  int i = 0;
  
  initlock(&icache.lock, "icache");
  for(i = 0; i < NINODE; i++) {
80101564:	83 c4 10             	add    $0x10,%esp
80101567:	81 fb 98 25 11 80    	cmp    $0x80112598,%ebx
8010156d:	75 e1                	jne    80101550 <iinit+0x20>
    initsleeplock(&icache.inode[i].lock, "inode");
  }
  
  readsb(dev, &sb);
8010156f:	83 ec 08             	sub    $0x8,%esp
80101572:	68 e0 09 11 80       	push   $0x801109e0
80101577:	ff 75 08             	pushl  0x8(%ebp)
8010157a:	e8 f1 fe ff ff       	call   80101470 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
8010157f:	ff 35 f8 09 11 80    	pushl  0x801109f8
80101585:	ff 35 f4 09 11 80    	pushl  0x801109f4
8010158b:	ff 35 f0 09 11 80    	pushl  0x801109f0
80101591:	ff 35 ec 09 11 80    	pushl  0x801109ec
80101597:	ff 35 e8 09 11 80    	pushl  0x801109e8
8010159d:	ff 35 e4 09 11 80    	pushl  0x801109e4
801015a3:	ff 35 e0 09 11 80    	pushl  0x801109e0
801015a9:	68 84 72 10 80       	push   $0x80107284
801015ae:	e8 ad f0 ff ff       	call   80100660 <cprintf>
 inodestart %d bmap start %d\n", sb.size, sb.nblocks,
          sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
          sb.bmapstart);
}
801015b3:	83 c4 30             	add    $0x30,%esp
801015b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801015b9:	c9                   	leave  
801015ba:	c3                   	ret    
801015bb:	90                   	nop
801015bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801015c0 <ialloc>:
//PAGEBREAK!
// Allocate a new inode with the given type on device dev.
// A free inode has a type of zero.
struct inode*
ialloc(uint dev, short type)
{
801015c0:	55                   	push   %ebp
801015c1:	89 e5                	mov    %esp,%ebp
801015c3:	57                   	push   %edi
801015c4:	56                   	push   %esi
801015c5:	53                   	push   %ebx
801015c6:	83 ec 1c             	sub    $0x1c,%esp
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
801015c9:	83 3d e8 09 11 80 01 	cmpl   $0x1,0x801109e8
//PAGEBREAK!
// Allocate a new inode with the given type on device dev.
// A free inode has a type of zero.
struct inode*
ialloc(uint dev, short type)
{
801015d0:	8b 45 0c             	mov    0xc(%ebp),%eax
801015d3:	8b 75 08             	mov    0x8(%ebp),%esi
801015d6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
801015d9:	0f 86 91 00 00 00    	jbe    80101670 <ialloc+0xb0>
801015df:	bb 01 00 00 00       	mov    $0x1,%ebx
801015e4:	eb 21                	jmp    80101607 <ialloc+0x47>
801015e6:	8d 76 00             	lea    0x0(%esi),%esi
801015e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
801015f0:	83 ec 0c             	sub    $0xc,%esp
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
801015f3:	83 c3 01             	add    $0x1,%ebx
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
801015f6:	57                   	push   %edi
801015f7:	e8 e4 eb ff ff       	call   801001e0 <brelse>
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
801015fc:	83 c4 10             	add    $0x10,%esp
801015ff:	39 1d e8 09 11 80    	cmp    %ebx,0x801109e8
80101605:	76 69                	jbe    80101670 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101607:	89 d8                	mov    %ebx,%eax
80101609:	83 ec 08             	sub    $0x8,%esp
8010160c:	c1 e8 03             	shr    $0x3,%eax
8010160f:	03 05 f4 09 11 80    	add    0x801109f4,%eax
80101615:	50                   	push   %eax
80101616:	56                   	push   %esi
80101617:	e8 b4 ea ff ff       	call   801000d0 <bread>
8010161c:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
8010161e:	89 d8                	mov    %ebx,%eax
    if(dip->type == 0){  // a free inode
80101620:	83 c4 10             	add    $0x10,%esp
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    bp = bread(dev, IBLOCK(inum, sb));
    dip = (struct dinode*)bp->data + inum%IPB;
80101623:	83 e0 07             	and    $0x7,%eax
80101626:	c1 e0 06             	shl    $0x6,%eax
80101629:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010162d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101631:	75 bd                	jne    801015f0 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101633:	83 ec 04             	sub    $0x4,%esp
80101636:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101639:	6a 40                	push   $0x40
8010163b:	6a 00                	push   $0x0
8010163d:	51                   	push   %ecx
8010163e:	e8 dd 2f 00 00       	call   80104620 <memset>
      dip->type = type;
80101643:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101647:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010164a:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
8010164d:	89 3c 24             	mov    %edi,(%esp)
80101650:	e8 db 18 00 00       	call   80102f30 <log_write>
      brelse(bp);
80101655:	89 3c 24             	mov    %edi,(%esp)
80101658:	e8 83 eb ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
8010165d:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
80101660:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
80101663:	89 da                	mov    %ebx,%edx
80101665:	89 f0                	mov    %esi,%eax
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
80101667:	5b                   	pop    %ebx
80101668:	5e                   	pop    %esi
80101669:	5f                   	pop    %edi
8010166a:	5d                   	pop    %ebp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
8010166b:	e9 90 fb ff ff       	jmp    80101200 <iget>
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
80101670:	83 ec 0c             	sub    $0xc,%esp
80101673:	68 34 72 10 80       	push   $0x80107234
80101678:	e8 f3 ec ff ff       	call   80100370 <panic>
8010167d:	8d 76 00             	lea    0x0(%esi),%esi

80101680 <iupdate>:
}

// Copy a modified in-memory inode to disk.
void
iupdate(struct inode *ip)
{
80101680:	55                   	push   %ebp
80101681:	89 e5                	mov    %esp,%ebp
80101683:	56                   	push   %esi
80101684:	53                   	push   %ebx
80101685:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101688:	83 ec 08             	sub    $0x8,%esp
8010168b:	8b 43 04             	mov    0x4(%ebx),%eax
  dip->type = ip->type;
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010168e:	83 c3 5c             	add    $0x5c,%ebx
iupdate(struct inode *ip)
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101691:	c1 e8 03             	shr    $0x3,%eax
80101694:	03 05 f4 09 11 80    	add    0x801109f4,%eax
8010169a:	50                   	push   %eax
8010169b:	ff 73 a4             	pushl  -0x5c(%ebx)
8010169e:	e8 2d ea ff ff       	call   801000d0 <bread>
801016a3:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801016a5:	8b 43 a8             	mov    -0x58(%ebx),%eax
  dip->type = ip->type;
801016a8:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801016ac:	83 c4 0c             	add    $0xc,%esp
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801016af:	83 e0 07             	and    $0x7,%eax
801016b2:	c1 e0 06             	shl    $0x6,%eax
801016b5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
801016b9:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
801016bc:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801016c0:	83 c0 0c             	add    $0xc,%eax
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
  dip->major = ip->major;
801016c3:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
801016c7:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
801016cb:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
801016cf:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
801016d3:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
801016d7:	8b 53 fc             	mov    -0x4(%ebx),%edx
801016da:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801016dd:	6a 30                	push   $0x30
801016df:	53                   	push   %ebx
801016e0:	50                   	push   %eax
801016e1:	e8 ea 2f 00 00       	call   801046d0 <memmove>
  log_write(bp);
801016e6:	89 34 24             	mov    %esi,(%esp)
801016e9:	e8 42 18 00 00       	call   80102f30 <log_write>
  brelse(bp);
801016ee:	89 75 08             	mov    %esi,0x8(%ebp)
801016f1:	83 c4 10             	add    $0x10,%esp
}
801016f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016f7:	5b                   	pop    %ebx
801016f8:	5e                   	pop    %esi
801016f9:	5d                   	pop    %ebp
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  log_write(bp);
  brelse(bp);
801016fa:	e9 e1 ea ff ff       	jmp    801001e0 <brelse>
801016ff:	90                   	nop

80101700 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
80101700:	55                   	push   %ebp
80101701:	89 e5                	mov    %esp,%ebp
80101703:	53                   	push   %ebx
80101704:	83 ec 10             	sub    $0x10,%esp
80101707:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010170a:	68 00 0a 11 80       	push   $0x80110a00
8010170f:	e8 dc 2c 00 00       	call   801043f0 <acquire>
  ip->ref++;
80101714:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
80101718:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010171f:	e8 ac 2e 00 00       	call   801045d0 <release>
  return ip;
}
80101724:	89 d8                	mov    %ebx,%eax
80101726:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101729:	c9                   	leave  
8010172a:	c3                   	ret    
8010172b:	90                   	nop
8010172c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101730 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
80101730:	55                   	push   %ebp
80101731:	89 e5                	mov    %esp,%ebp
80101733:	56                   	push   %esi
80101734:	53                   	push   %ebx
80101735:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
80101738:	85 db                	test   %ebx,%ebx
8010173a:	0f 84 b4 00 00 00    	je     801017f4 <ilock+0xc4>
80101740:	8b 43 08             	mov    0x8(%ebx),%eax
80101743:	85 c0                	test   %eax,%eax
80101745:	0f 8e a9 00 00 00    	jle    801017f4 <ilock+0xc4>
    panic("ilock");

  acquiresleep(&ip->lock);
8010174b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010174e:	83 ec 0c             	sub    $0xc,%esp
80101751:	50                   	push   %eax
80101752:	e8 a9 2b 00 00       	call   80104300 <acquiresleep>

  if(!(ip->flags & I_VALID)){
80101757:	83 c4 10             	add    $0x10,%esp
8010175a:	f6 43 4c 02          	testb  $0x2,0x4c(%ebx)
8010175e:	74 10                	je     80101770 <ilock+0x40>
    brelse(bp);
    ip->flags |= I_VALID;
    if(ip->type == 0)
      panic("ilock: no type");
  }
}
80101760:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101763:	5b                   	pop    %ebx
80101764:	5e                   	pop    %esi
80101765:	5d                   	pop    %ebp
80101766:	c3                   	ret    
80101767:	89 f6                	mov    %esi,%esi
80101769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    panic("ilock");

  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101770:	8b 43 04             	mov    0x4(%ebx),%eax
80101773:	83 ec 08             	sub    $0x8,%esp
80101776:	c1 e8 03             	shr    $0x3,%eax
80101779:	03 05 f4 09 11 80    	add    0x801109f4,%eax
8010177f:	50                   	push   %eax
80101780:	ff 33                	pushl  (%ebx)
80101782:	e8 49 e9 ff ff       	call   801000d0 <bread>
80101787:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
80101789:	8b 43 04             	mov    0x4(%ebx),%eax
    ip->type = dip->type;
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
8010178c:	83 c4 0c             	add    $0xc,%esp

  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
8010178f:	83 e0 07             	and    $0x7,%eax
80101792:	c1 e0 06             	shl    $0x6,%eax
80101795:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
80101799:	0f b7 10             	movzwl (%eax),%edx
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
8010179c:	83 c0 0c             	add    $0xc,%eax
  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    ip->type = dip->type;
8010179f:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
801017a3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801017a7:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
801017ab:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801017af:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
801017b3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801017b7:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
801017bb:	8b 50 fc             	mov    -0x4(%eax),%edx
801017be:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801017c1:	6a 30                	push   $0x30
801017c3:	50                   	push   %eax
801017c4:	8d 43 5c             	lea    0x5c(%ebx),%eax
801017c7:	50                   	push   %eax
801017c8:	e8 03 2f 00 00       	call   801046d0 <memmove>
    brelse(bp);
801017cd:	89 34 24             	mov    %esi,(%esp)
801017d0:	e8 0b ea ff ff       	call   801001e0 <brelse>
    ip->flags |= I_VALID;
801017d5:	83 4b 4c 02          	orl    $0x2,0x4c(%ebx)
    if(ip->type == 0)
801017d9:	83 c4 10             	add    $0x10,%esp
801017dc:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
801017e1:	0f 85 79 ff ff ff    	jne    80101760 <ilock+0x30>
      panic("ilock: no type");
801017e7:	83 ec 0c             	sub    $0xc,%esp
801017ea:	68 4c 72 10 80       	push   $0x8010724c
801017ef:	e8 7c eb ff ff       	call   80100370 <panic>
{
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    panic("ilock");
801017f4:	83 ec 0c             	sub    $0xc,%esp
801017f7:	68 46 72 10 80       	push   $0x80107246
801017fc:	e8 6f eb ff ff       	call   80100370 <panic>
80101801:	eb 0d                	jmp    80101810 <iunlock>
80101803:	90                   	nop
80101804:	90                   	nop
80101805:	90                   	nop
80101806:	90                   	nop
80101807:	90                   	nop
80101808:	90                   	nop
80101809:	90                   	nop
8010180a:	90                   	nop
8010180b:	90                   	nop
8010180c:	90                   	nop
8010180d:	90                   	nop
8010180e:	90                   	nop
8010180f:	90                   	nop

80101810 <iunlock>:
}

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
80101810:	55                   	push   %ebp
80101811:	89 e5                	mov    %esp,%ebp
80101813:	56                   	push   %esi
80101814:	53                   	push   %ebx
80101815:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101818:	85 db                	test   %ebx,%ebx
8010181a:	74 28                	je     80101844 <iunlock+0x34>
8010181c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010181f:	83 ec 0c             	sub    $0xc,%esp
80101822:	56                   	push   %esi
80101823:	e8 78 2b 00 00       	call   801043a0 <holdingsleep>
80101828:	83 c4 10             	add    $0x10,%esp
8010182b:	85 c0                	test   %eax,%eax
8010182d:	74 15                	je     80101844 <iunlock+0x34>
8010182f:	8b 43 08             	mov    0x8(%ebx),%eax
80101832:	85 c0                	test   %eax,%eax
80101834:	7e 0e                	jle    80101844 <iunlock+0x34>
    panic("iunlock");

  releasesleep(&ip->lock);
80101836:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101839:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010183c:	5b                   	pop    %ebx
8010183d:	5e                   	pop    %esi
8010183e:	5d                   	pop    %ebp
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");

  releasesleep(&ip->lock);
8010183f:	e9 1c 2b 00 00       	jmp    80104360 <releasesleep>
// Unlock the given inode.
void
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");
80101844:	83 ec 0c             	sub    $0xc,%esp
80101847:	68 5b 72 10 80       	push   $0x8010725b
8010184c:	e8 1f eb ff ff       	call   80100370 <panic>
80101851:	eb 0d                	jmp    80101860 <iput>
80101853:	90                   	nop
80101854:	90                   	nop
80101855:	90                   	nop
80101856:	90                   	nop
80101857:	90                   	nop
80101858:	90                   	nop
80101859:	90                   	nop
8010185a:	90                   	nop
8010185b:	90                   	nop
8010185c:	90                   	nop
8010185d:	90                   	nop
8010185e:	90                   	nop
8010185f:	90                   	nop

80101860 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
80101860:	55                   	push   %ebp
80101861:	89 e5                	mov    %esp,%ebp
80101863:	57                   	push   %edi
80101864:	56                   	push   %esi
80101865:	53                   	push   %ebx
80101866:	83 ec 28             	sub    $0x28,%esp
80101869:	8b 75 08             	mov    0x8(%ebp),%esi
  acquire(&icache.lock);
8010186c:	68 00 0a 11 80       	push   $0x80110a00
80101871:	e8 7a 2b 00 00       	call   801043f0 <acquire>
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
80101876:	8b 46 08             	mov    0x8(%esi),%eax
80101879:	83 c4 10             	add    $0x10,%esp
8010187c:	83 f8 01             	cmp    $0x1,%eax
8010187f:	74 19                	je     8010189a <iput+0x3a>
    ip->type = 0;
    iupdate(ip);
    acquire(&icache.lock);
    ip->flags = 0;
  }
  ip->ref--;
80101881:	83 e8 01             	sub    $0x1,%eax
80101884:	89 46 08             	mov    %eax,0x8(%esi)
  release(&icache.lock);
80101887:	c7 45 08 00 0a 11 80 	movl   $0x80110a00,0x8(%ebp)
}
8010188e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101891:	5b                   	pop    %ebx
80101892:	5e                   	pop    %esi
80101893:	5f                   	pop    %edi
80101894:	5d                   	pop    %ebp
    iupdate(ip);
    acquire(&icache.lock);
    ip->flags = 0;
  }
  ip->ref--;
  release(&icache.lock);
80101895:	e9 36 2d 00 00       	jmp    801045d0 <release>
// case it has to free the inode.
void
iput(struct inode *ip)
{
  acquire(&icache.lock);
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
8010189a:	f6 46 4c 02          	testb  $0x2,0x4c(%esi)
8010189e:	74 e1                	je     80101881 <iput+0x21>
801018a0:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
801018a5:	75 da                	jne    80101881 <iput+0x21>
    // inode has no links and no other references: truncate and free.
    release(&icache.lock);
801018a7:	83 ec 0c             	sub    $0xc,%esp
801018aa:	8d 5e 5c             	lea    0x5c(%esi),%ebx
801018ad:	8d be 88 00 00 00    	lea    0x88(%esi),%edi
801018b3:	68 00 0a 11 80       	push   $0x80110a00
801018b8:	e8 13 2d 00 00       	call   801045d0 <release>
801018bd:	83 c4 10             	add    $0x10,%esp
801018c0:	eb 07                	jmp    801018c9 <iput+0x69>
801018c2:	83 c3 04             	add    $0x4,%ebx
  int i, j, k;
  struct buf *bp, *bp2;
  uint *a, *b;
  
  // free direct block
  for (i = 0; i < NDIRECT; i++){
801018c5:	39 fb                	cmp    %edi,%ebx
801018c7:	74 1b                	je     801018e4 <iput+0x84>
    if (ip->addrs[i]) {
801018c9:	8b 13                	mov    (%ebx),%edx
801018cb:	85 d2                	test   %edx,%edx
801018cd:	74 f3                	je     801018c2 <iput+0x62>
      bfree(ip->dev, ip->addrs[i]);
801018cf:	8b 06                	mov    (%esi),%eax
801018d1:	83 c3 04             	add    $0x4,%ebx
801018d4:	e8 d7 fb ff ff       	call   801014b0 <bfree>
      ip->addrs[i] = 0;
801018d9:	c7 43 fc 00 00 00 00 	movl   $0x0,-0x4(%ebx)
  int i, j, k;
  struct buf *bp, *bp2;
  uint *a, *b;
  
  // free direct block
  for (i = 0; i < NDIRECT; i++){
801018e0:	39 fb                	cmp    %edi,%ebx
801018e2:	75 e5                	jne    801018c9 <iput+0x69>
      ip->addrs[i] = 0;
    }
  }
  
  // free single-linked indirect block
  if (ip->addrs[SINGLE_LINKED_INDIRECT_TABLE]) {
801018e4:	8b 86 88 00 00 00    	mov    0x88(%esi),%eax
801018ea:	85 c0                	test   %eax,%eax
801018ec:	75 46                	jne    80101934 <iput+0xd4>
    bfree(ip->dev, ip->addrs[SINGLE_LINKED_INDIRECT_TABLE]);
    ip->addrs[SINGLE_LINKED_INDIRECT_TABLE] = 0;
  }
  
  // free double-linked indirect block
  if (ip->addrs[DOUBLE_LINKED_INDIRECT_TABLE]) {
801018ee:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
801018f4:	85 c0                	test   %eax,%eax
801018f6:	75 72                	jne    8010196a <iput+0x10a>
    bfree(ip->dev, ip->addrs[DOUBLE_LINKED_INDIRECT_TABLE]);
    ip->addrs[DOUBLE_LINKED_INDIRECT_TABLE] = 0;
  }

  ip->size = 0;
  iupdate(ip);
801018f8:	83 ec 0c             	sub    $0xc,%esp
    brelse(bp);
    bfree(ip->dev, ip->addrs[DOUBLE_LINKED_INDIRECT_TABLE]);
    ip->addrs[DOUBLE_LINKED_INDIRECT_TABLE] = 0;
  }

  ip->size = 0;
801018fb:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
80101902:	56                   	push   %esi
80101903:	e8 78 fd ff ff       	call   80101680 <iupdate>
  acquire(&icache.lock);
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
    // inode has no links and no other references: truncate and free.
    release(&icache.lock);
    itrunc(ip);
    ip->type = 0;
80101908:	31 c0                	xor    %eax,%eax
8010190a:	66 89 46 50          	mov    %ax,0x50(%esi)
    iupdate(ip);
8010190e:	89 34 24             	mov    %esi,(%esp)
80101911:	e8 6a fd ff ff       	call   80101680 <iupdate>
    acquire(&icache.lock);
80101916:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010191d:	e8 ce 2a 00 00       	call   801043f0 <acquire>
    ip->flags = 0;
80101922:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
80101929:	8b 46 08             	mov    0x8(%esi),%eax
8010192c:	83 c4 10             	add    $0x10,%esp
8010192f:	e9 4d ff ff ff       	jmp    80101881 <iput+0x21>
    }
  }
  
  // free single-linked indirect block
  if (ip->addrs[SINGLE_LINKED_INDIRECT_TABLE]) {
    bp = bread(ip->dev, ip->addrs[SINGLE_LINKED_INDIRECT_TABLE]);
80101934:	83 ec 08             	sub    $0x8,%esp
80101937:	50                   	push   %eax
80101938:	ff 36                	pushl  (%esi)
8010193a:	e8 91 e7 ff ff       	call   801000d0 <bread>
8010193f:	83 c4 10             	add    $0x10,%esp
80101942:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
80101945:	8d 58 5c             	lea    0x5c(%eax),%ebx
80101948:	8d b8 5c 02 00 00    	lea    0x25c(%eax),%edi
8010194e:	eb 0b                	jmp    8010195b <iput+0xfb>
80101950:	83 c3 04             	add    $0x4,%ebx
    for (j = 0; j < NINDIRECT; ++j) {
80101953:	39 fb                	cmp    %edi,%ebx
80101955:	0f 84 a4 00 00 00    	je     801019ff <iput+0x19f>
      if (a[j]) {
8010195b:	8b 13                	mov    (%ebx),%edx
8010195d:	85 d2                	test   %edx,%edx
8010195f:	74 ef                	je     80101950 <iput+0xf0>
        bfree(ip->dev, a[j]);
80101961:	8b 06                	mov    (%esi),%eax
80101963:	e8 48 fb ff ff       	call   801014b0 <bfree>
80101968:	eb e6                	jmp    80101950 <iput+0xf0>
    ip->addrs[SINGLE_LINKED_INDIRECT_TABLE] = 0;
  }
  
  // free double-linked indirect block
  if (ip->addrs[DOUBLE_LINKED_INDIRECT_TABLE]) {
    bp = bread(ip->dev, ip->addrs[DOUBLE_LINKED_INDIRECT_TABLE]);
8010196a:	83 ec 08             	sub    $0x8,%esp
8010196d:	50                   	push   %eax
8010196e:	ff 36                	pushl  (%esi)
80101970:	e8 5b e7 ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;
80101975:	8d 48 5c             	lea    0x5c(%eax),%ecx
    ip->addrs[SINGLE_LINKED_INDIRECT_TABLE] = 0;
  }
  
  // free double-linked indirect block
  if (ip->addrs[DOUBLE_LINKED_INDIRECT_TABLE]) {
    bp = bread(ip->dev, ip->addrs[DOUBLE_LINKED_INDIRECT_TABLE]);
80101978:	89 45 d8             	mov    %eax,-0x28(%ebp)
8010197b:	05 5c 02 00 00       	add    $0x25c,%eax
80101980:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101983:	83 c4 10             	add    $0x10,%esp
    a = (uint*)bp->data;
80101986:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101989:	eb 15                	jmp    801019a0 <iput+0x140>
8010198b:	90                   	nop
8010198c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101990:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
80101994:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    for (j = 0; j < NINDIRECT; ++j) {
80101997:	3b 45 e0             	cmp    -0x20(%ebp),%eax
8010199a:	0f 84 89 00 00 00    	je     80101a29 <iput+0x1c9>
      if (a[j]) {
801019a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801019a3:	8b 00                	mov    (%eax),%eax
801019a5:	85 c0                	test   %eax,%eax
801019a7:	74 e7                	je     80101990 <iput+0x130>
        bp2 = bread(ip->dev, a[j]);
801019a9:	83 ec 08             	sub    $0x8,%esp
801019ac:	50                   	push   %eax
801019ad:	ff 36                	pushl  (%esi)
801019af:	e8 1c e7 ff ff       	call   801000d0 <bread>
801019b4:	83 c4 10             	add    $0x10,%esp
801019b7:	89 45 dc             	mov    %eax,-0x24(%ebp)
        b = (uint*)bp2->data;
801019ba:	8d 58 5c             	lea    0x5c(%eax),%ebx
801019bd:	8d b8 5c 02 00 00    	lea    0x25c(%eax),%edi
801019c3:	eb 0a                	jmp    801019cf <iput+0x16f>
801019c5:	8d 76 00             	lea    0x0(%esi),%esi
801019c8:	83 c3 04             	add    $0x4,%ebx
        for (k = 0; k < NINDIRECT; ++k) {
801019cb:	39 fb                	cmp    %edi,%ebx
801019cd:	74 14                	je     801019e3 <iput+0x183>
          if (b[k]) {
801019cf:	8b 13                	mov    (%ebx),%edx
801019d1:	85 d2                	test   %edx,%edx
801019d3:	74 f3                	je     801019c8 <iput+0x168>
            bfree(ip->dev, b[k]);
801019d5:	8b 06                	mov    (%esi),%eax
801019d7:	83 c3 04             	add    $0x4,%ebx
801019da:	e8 d1 fa ff ff       	call   801014b0 <bfree>
    a = (uint*)bp->data;
    for (j = 0; j < NINDIRECT; ++j) {
      if (a[j]) {
        bp2 = bread(ip->dev, a[j]);
        b = (uint*)bp2->data;
        for (k = 0; k < NINDIRECT; ++k) {
801019df:	39 fb                	cmp    %edi,%ebx
801019e1:	75 ec                	jne    801019cf <iput+0x16f>
          if (b[k]) {
            bfree(ip->dev, b[k]);
          }
        }
        brelse(bp2);
801019e3:	83 ec 0c             	sub    $0xc,%esp
801019e6:	ff 75 dc             	pushl  -0x24(%ebp)
801019e9:	e8 f2 e7 ff ff       	call   801001e0 <brelse>
        bfree(ip->dev, a[j]);
801019ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801019f1:	8b 10                	mov    (%eax),%edx
801019f3:	8b 06                	mov    (%esi),%eax
801019f5:	e8 b6 fa ff ff       	call   801014b0 <bfree>
801019fa:	83 c4 10             	add    $0x10,%esp
801019fd:	eb 91                	jmp    80101990 <iput+0x130>
    for (j = 0; j < NINDIRECT; ++j) {
      if (a[j]) {
        bfree(ip->dev, a[j]);
      }
    }
    brelse(bp);
801019ff:	83 ec 0c             	sub    $0xc,%esp
80101a02:	ff 75 e4             	pushl  -0x1c(%ebp)
80101a05:	e8 d6 e7 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[SINGLE_LINKED_INDIRECT_TABLE]);
80101a0a:	8b 96 88 00 00 00    	mov    0x88(%esi),%edx
80101a10:	8b 06                	mov    (%esi),%eax
80101a12:	e8 99 fa ff ff       	call   801014b0 <bfree>
    ip->addrs[SINGLE_LINKED_INDIRECT_TABLE] = 0;
80101a17:	c7 86 88 00 00 00 00 	movl   $0x0,0x88(%esi)
80101a1e:	00 00 00 
80101a21:	83 c4 10             	add    $0x10,%esp
80101a24:	e9 c5 fe ff ff       	jmp    801018ee <iput+0x8e>
        }
        brelse(bp2);
        bfree(ip->dev, a[j]);
      }
    }
    brelse(bp);
80101a29:	83 ec 0c             	sub    $0xc,%esp
80101a2c:	ff 75 d8             	pushl  -0x28(%ebp)
80101a2f:	e8 ac e7 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[DOUBLE_LINKED_INDIRECT_TABLE]);
80101a34:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
80101a3a:	8b 06                	mov    (%esi),%eax
80101a3c:	e8 6f fa ff ff       	call   801014b0 <bfree>
    ip->addrs[DOUBLE_LINKED_INDIRECT_TABLE] = 0;
80101a41:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
80101a48:	00 00 00 
80101a4b:	83 c4 10             	add    $0x10,%esp
80101a4e:	e9 a5 fe ff ff       	jmp    801018f8 <iput+0x98>
80101a53:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101a60 <iunlockput>:
}

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
80101a60:	55                   	push   %ebp
80101a61:	89 e5                	mov    %esp,%ebp
80101a63:	53                   	push   %ebx
80101a64:	83 ec 10             	sub    $0x10,%esp
80101a67:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
80101a6a:	53                   	push   %ebx
80101a6b:	e8 a0 fd ff ff       	call   80101810 <iunlock>
  iput(ip);
80101a70:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101a73:	83 c4 10             	add    $0x10,%esp
}
80101a76:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101a79:	c9                   	leave  
// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
  iput(ip);
80101a7a:	e9 e1 fd ff ff       	jmp    80101860 <iput>
80101a7f:	90                   	nop

80101a80 <stati>:
}

// Copy stat information from inode.
void
stati(struct inode *ip, struct stat *st)
{
80101a80:	55                   	push   %ebp
80101a81:	89 e5                	mov    %esp,%ebp
80101a83:	8b 55 08             	mov    0x8(%ebp),%edx
80101a86:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101a89:	8b 0a                	mov    (%edx),%ecx
80101a8b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
80101a8e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101a91:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101a94:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101a98:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
80101a9b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
80101a9f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101aa3:	8b 52 58             	mov    0x58(%edx),%edx
80101aa6:	89 50 10             	mov    %edx,0x10(%eax)
}
80101aa9:	5d                   	pop    %ebp
80101aaa:	c3                   	ret    
80101aab:	90                   	nop
80101aac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101ab0 <readi>:

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101ab0:	55                   	push   %ebp
80101ab1:	89 e5                	mov    %esp,%ebp
80101ab3:	57                   	push   %edi
80101ab4:	56                   	push   %esi
80101ab5:	53                   	push   %ebx
80101ab6:	83 ec 1c             	sub    $0x1c,%esp
80101ab9:	8b 45 08             	mov    0x8(%ebp),%eax
80101abc:	8b 7d 0c             	mov    0xc(%ebp),%edi
80101abf:	8b 75 10             	mov    0x10(%ebp),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101ac2:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101ac7:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101aca:	8b 7d 14             	mov    0x14(%ebp),%edi
80101acd:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101ad0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101ad3:	0f 84 a7 00 00 00    	je     80101b80 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101ad9:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101adc:	8b 40 58             	mov    0x58(%eax),%eax
80101adf:	39 f0                	cmp    %esi,%eax
80101ae1:	0f 82 c1 00 00 00    	jb     80101ba8 <readi+0xf8>
80101ae7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101aea:	89 fa                	mov    %edi,%edx
80101aec:	01 f2                	add    %esi,%edx
80101aee:	0f 82 b4 00 00 00    	jb     80101ba8 <readi+0xf8>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101af4:	89 c1                	mov    %eax,%ecx
80101af6:	29 f1                	sub    %esi,%ecx
80101af8:	39 d0                	cmp    %edx,%eax
80101afa:	0f 43 cf             	cmovae %edi,%ecx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101afd:	31 ff                	xor    %edi,%edi
80101aff:	85 c9                	test   %ecx,%ecx
  }

  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101b01:	89 4d e4             	mov    %ecx,-0x1c(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101b04:	74 6d                	je     80101b73 <readi+0xc3>
80101b06:	8d 76 00             	lea    0x0(%esi),%esi
80101b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101b10:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101b13:	89 f2                	mov    %esi,%edx
80101b15:	c1 ea 09             	shr    $0x9,%edx
80101b18:	89 d8                	mov    %ebx,%eax
80101b1a:	e8 b1 f7 ff ff       	call   801012d0 <bmap>
80101b1f:	83 ec 08             	sub    $0x8,%esp
80101b22:	50                   	push   %eax
80101b23:	ff 33                	pushl  (%ebx)
    m = min(n - tot, BSIZE - off%BSIZE);
80101b25:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101b2a:	e8 a1 e5 ff ff       	call   801000d0 <bread>
80101b2f:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101b31:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101b34:	89 f1                	mov    %esi,%ecx
80101b36:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101b3c:	83 c4 0c             	add    $0xc,%esp
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
80101b3f:	89 55 dc             	mov    %edx,-0x24(%ebp)
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
80101b42:	29 cb                	sub    %ecx,%ebx
80101b44:	29 f8                	sub    %edi,%eax
80101b46:	39 c3                	cmp    %eax,%ebx
80101b48:	0f 47 d8             	cmova  %eax,%ebx
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
80101b4b:	8d 44 0a 5c          	lea    0x5c(%edx,%ecx,1),%eax
80101b4f:	53                   	push   %ebx
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101b50:	01 df                	add    %ebx,%edi
80101b52:	01 de                	add    %ebx,%esi
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
80101b54:	50                   	push   %eax
80101b55:	ff 75 e0             	pushl  -0x20(%ebp)
80101b58:	e8 73 2b 00 00       	call   801046d0 <memmove>
    brelse(bp);
80101b5d:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101b60:	89 14 24             	mov    %edx,(%esp)
80101b63:	e8 78 e6 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101b68:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101b6b:	83 c4 10             	add    $0x10,%esp
80101b6e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101b71:	77 9d                	ja     80101b10 <readi+0x60>
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
80101b73:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101b76:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b79:	5b                   	pop    %ebx
80101b7a:	5e                   	pop    %esi
80101b7b:	5f                   	pop    %edi
80101b7c:	5d                   	pop    %ebp
80101b7d:	c3                   	ret    
80101b7e:	66 90                	xchg   %ax,%ax
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101b80:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b84:	66 83 f8 09          	cmp    $0x9,%ax
80101b88:	77 1e                	ja     80101ba8 <readi+0xf8>
80101b8a:	8b 04 c5 80 09 11 80 	mov    -0x7feef680(,%eax,8),%eax
80101b91:	85 c0                	test   %eax,%eax
80101b93:	74 13                	je     80101ba8 <readi+0xf8>
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101b95:	89 7d 10             	mov    %edi,0x10(%ebp)
    */
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
}
80101b98:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b9b:	5b                   	pop    %ebx
80101b9c:	5e                   	pop    %esi
80101b9d:	5f                   	pop    %edi
80101b9e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101b9f:	ff e0                	jmp    *%eax
80101ba1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
80101ba8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101bad:	eb c7                	jmp    80101b76 <readi+0xc6>
80101baf:	90                   	nop

80101bb0 <writei>:

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101bb0:	55                   	push   %ebp
80101bb1:	89 e5                	mov    %esp,%ebp
80101bb3:	57                   	push   %edi
80101bb4:	56                   	push   %esi
80101bb5:	53                   	push   %ebx
80101bb6:	83 ec 1c             	sub    $0x1c,%esp
80101bb9:	8b 45 08             	mov    0x8(%ebp),%eax
80101bbc:	8b 75 0c             	mov    0xc(%ebp),%esi
80101bbf:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101bc2:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101bc7:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101bca:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101bcd:	8b 75 10             	mov    0x10(%ebp),%esi
80101bd0:	89 7d e0             	mov    %edi,-0x20(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101bd3:	0f 84 b7 00 00 00    	je     80101c90 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101bd9:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101bdc:	39 70 58             	cmp    %esi,0x58(%eax)
80101bdf:	0f 82 eb 00 00 00    	jb     80101cd0 <writei+0x120>
80101be5:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101be8:	89 f8                	mov    %edi,%eax
80101bea:	01 f0                	add    %esi,%eax
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101bec:	3d 00 16 81 00       	cmp    $0x811600,%eax
80101bf1:	0f 87 d9 00 00 00    	ja     80101cd0 <writei+0x120>
80101bf7:	39 c6                	cmp    %eax,%esi
80101bf9:	0f 87 d1 00 00 00    	ja     80101cd0 <writei+0x120>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101bff:	85 ff                	test   %edi,%edi
80101c01:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101c08:	74 78                	je     80101c82 <writei+0xd2>
80101c0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101c10:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101c13:	89 f2                	mov    %esi,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101c15:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101c1a:	c1 ea 09             	shr    $0x9,%edx
80101c1d:	89 f8                	mov    %edi,%eax
80101c1f:	e8 ac f6 ff ff       	call   801012d0 <bmap>
80101c24:	83 ec 08             	sub    $0x8,%esp
80101c27:	50                   	push   %eax
80101c28:	ff 37                	pushl  (%edi)
80101c2a:	e8 a1 e4 ff ff       	call   801000d0 <bread>
80101c2f:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101c31:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101c34:	2b 45 e4             	sub    -0x1c(%ebp),%eax
80101c37:	89 f1                	mov    %esi,%ecx
80101c39:	83 c4 0c             	add    $0xc,%esp
80101c3c:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101c42:	29 cb                	sub    %ecx,%ebx
80101c44:	39 c3                	cmp    %eax,%ebx
80101c46:	0f 47 d8             	cmova  %eax,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101c49:	8d 44 0f 5c          	lea    0x5c(%edi,%ecx,1),%eax
80101c4d:	53                   	push   %ebx
80101c4e:	ff 75 dc             	pushl  -0x24(%ebp)
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101c51:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(bp->data + off%BSIZE, src, m);
80101c53:	50                   	push   %eax
80101c54:	e8 77 2a 00 00       	call   801046d0 <memmove>
    log_write(bp);
80101c59:	89 3c 24             	mov    %edi,(%esp)
80101c5c:	e8 cf 12 00 00       	call   80102f30 <log_write>
    brelse(bp);
80101c61:	89 3c 24             	mov    %edi,(%esp)
80101c64:	e8 77 e5 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101c69:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101c6c:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101c6f:	83 c4 10             	add    $0x10,%esp
80101c72:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101c75:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101c78:	77 96                	ja     80101c10 <writei+0x60>
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
80101c7a:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101c7d:	3b 70 58             	cmp    0x58(%eax),%esi
80101c80:	77 36                	ja     80101cb8 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101c82:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101c85:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c88:	5b                   	pop    %ebx
80101c89:	5e                   	pop    %esi
80101c8a:	5f                   	pop    %edi
80101c8b:	5d                   	pop    %ebp
80101c8c:	c3                   	ret    
80101c8d:	8d 76 00             	lea    0x0(%esi),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101c90:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101c94:	66 83 f8 09          	cmp    $0x9,%ax
80101c98:	77 36                	ja     80101cd0 <writei+0x120>
80101c9a:	8b 04 c5 84 09 11 80 	mov    -0x7feef67c(,%eax,8),%eax
80101ca1:	85 c0                	test   %eax,%eax
80101ca3:	74 2b                	je     80101cd0 <writei+0x120>
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101ca5:	89 7d 10             	mov    %edi,0x10(%ebp)
  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
}
80101ca8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101cab:	5b                   	pop    %ebx
80101cac:	5e                   	pop    %esi
80101cad:	5f                   	pop    %edi
80101cae:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101caf:	ff e0                	jmp    *%eax
80101cb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101cb8:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101cbb:	83 ec 0c             	sub    $0xc,%esp
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101cbe:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101cc1:	50                   	push   %eax
80101cc2:	e8 b9 f9 ff ff       	call   80101680 <iupdate>
80101cc7:	83 c4 10             	add    $0x10,%esp
80101cca:	eb b6                	jmp    80101c82 <writei+0xd2>
80101ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
80101cd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101cd5:	eb ae                	jmp    80101c85 <writei+0xd5>
80101cd7:	89 f6                	mov    %esi,%esi
80101cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ce0 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101ce0:	55                   	push   %ebp
80101ce1:	89 e5                	mov    %esp,%ebp
80101ce3:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101ce6:	6a 0e                	push   $0xe
80101ce8:	ff 75 0c             	pushl  0xc(%ebp)
80101ceb:	ff 75 08             	pushl  0x8(%ebp)
80101cee:	e8 5d 2a 00 00       	call   80104750 <strncmp>
}
80101cf3:	c9                   	leave  
80101cf4:	c3                   	ret    
80101cf5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101cf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101d00 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101d00:	55                   	push   %ebp
80101d01:	89 e5                	mov    %esp,%ebp
80101d03:	57                   	push   %edi
80101d04:	56                   	push   %esi
80101d05:	53                   	push   %ebx
80101d06:	83 ec 1c             	sub    $0x1c,%esp
80101d09:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101d0c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101d11:	0f 85 80 00 00 00    	jne    80101d97 <dirlookup+0x97>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101d17:	8b 53 58             	mov    0x58(%ebx),%edx
80101d1a:	31 ff                	xor    %edi,%edi
80101d1c:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101d1f:	85 d2                	test   %edx,%edx
80101d21:	75 0d                	jne    80101d30 <dirlookup+0x30>
80101d23:	eb 5b                	jmp    80101d80 <dirlookup+0x80>
80101d25:	8d 76 00             	lea    0x0(%esi),%esi
80101d28:	83 c7 10             	add    $0x10,%edi
80101d2b:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101d2e:	76 50                	jbe    80101d80 <dirlookup+0x80>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101d30:	6a 10                	push   $0x10
80101d32:	57                   	push   %edi
80101d33:	56                   	push   %esi
80101d34:	53                   	push   %ebx
80101d35:	e8 76 fd ff ff       	call   80101ab0 <readi>
80101d3a:	83 c4 10             	add    $0x10,%esp
80101d3d:	83 f8 10             	cmp    $0x10,%eax
80101d40:	75 48                	jne    80101d8a <dirlookup+0x8a>
      panic("dirlink read");
    if(de.inum == 0)
80101d42:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101d47:	74 df                	je     80101d28 <dirlookup+0x28>
// Directories

int
namecmp(const char *s, const char *t)
{
  return strncmp(s, t, DIRSIZ);
80101d49:	8d 45 da             	lea    -0x26(%ebp),%eax
80101d4c:	83 ec 04             	sub    $0x4,%esp
80101d4f:	6a 0e                	push   $0xe
80101d51:	50                   	push   %eax
80101d52:	ff 75 0c             	pushl  0xc(%ebp)
80101d55:	e8 f6 29 00 00       	call   80104750 <strncmp>
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
    if(de.inum == 0)
      continue;
    if(namecmp(name, de.name) == 0){
80101d5a:	83 c4 10             	add    $0x10,%esp
80101d5d:	85 c0                	test   %eax,%eax
80101d5f:	75 c7                	jne    80101d28 <dirlookup+0x28>
      // entry matches path element
      if(poff)
80101d61:	8b 45 10             	mov    0x10(%ebp),%eax
80101d64:	85 c0                	test   %eax,%eax
80101d66:	74 05                	je     80101d6d <dirlookup+0x6d>
        *poff = off;
80101d68:	8b 45 10             	mov    0x10(%ebp),%eax
80101d6b:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
      return iget(dp->dev, inum);
80101d6d:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101d71:	8b 03                	mov    (%ebx),%eax
80101d73:	e8 88 f4 ff ff       	call   80101200 <iget>
    }
  }

  return 0;
}
80101d78:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d7b:	5b                   	pop    %ebx
80101d7c:	5e                   	pop    %esi
80101d7d:	5f                   	pop    %edi
80101d7e:	5d                   	pop    %ebp
80101d7f:	c3                   	ret    
80101d80:	8d 65 f4             	lea    -0xc(%ebp),%esp
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
80101d83:	31 c0                	xor    %eax,%eax
}
80101d85:	5b                   	pop    %ebx
80101d86:	5e                   	pop    %esi
80101d87:	5f                   	pop    %edi
80101d88:	5d                   	pop    %ebp
80101d89:	c3                   	ret    
  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101d8a:	83 ec 0c             	sub    $0xc,%esp
80101d8d:	68 75 72 10 80       	push   $0x80107275
80101d92:	e8 d9 e5 ff ff       	call   80100370 <panic>
{
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");
80101d97:	83 ec 0c             	sub    $0xc,%esp
80101d9a:	68 63 72 10 80       	push   $0x80107263
80101d9f:	e8 cc e5 ff ff       	call   80100370 <panic>
80101da4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101daa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101db0 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101db0:	55                   	push   %ebp
80101db1:	89 e5                	mov    %esp,%ebp
80101db3:	57                   	push   %edi
80101db4:	56                   	push   %esi
80101db5:	53                   	push   %ebx
80101db6:	89 cf                	mov    %ecx,%edi
80101db8:	89 c3                	mov    %eax,%ebx
80101dba:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101dbd:	80 38 2f             	cmpb   $0x2f,(%eax)
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101dc0:	89 55 e0             	mov    %edx,-0x20(%ebp)
  struct inode *ip, *next;

  if(*path == '/')
80101dc3:	0f 84 53 01 00 00    	je     80101f1c <namex+0x16c>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);
80101dc9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101dcf:	83 ec 0c             	sub    $0xc,%esp
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);
80101dd2:	8b 70 68             	mov    0x68(%eax),%esi
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101dd5:	68 00 0a 11 80       	push   $0x80110a00
80101dda:	e8 11 26 00 00       	call   801043f0 <acquire>
  ip->ref++;
80101ddf:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101de3:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101dea:	e8 e1 27 00 00       	call   801045d0 <release>
80101def:	83 c4 10             	add    $0x10,%esp
80101df2:	eb 07                	jmp    80101dfb <namex+0x4b>
80101df4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  char *s;
  int len;

  while(*path == '/')
    path++;
80101df8:	83 c3 01             	add    $0x1,%ebx
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
80101dfb:	0f b6 03             	movzbl (%ebx),%eax
80101dfe:	3c 2f                	cmp    $0x2f,%al
80101e00:	74 f6                	je     80101df8 <namex+0x48>
    path++;
  if(*path == 0)
80101e02:	84 c0                	test   %al,%al
80101e04:	0f 84 e3 00 00 00    	je     80101eed <namex+0x13d>
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101e0a:	0f b6 03             	movzbl (%ebx),%eax
80101e0d:	89 da                	mov    %ebx,%edx
80101e0f:	84 c0                	test   %al,%al
80101e11:	0f 84 ac 00 00 00    	je     80101ec3 <namex+0x113>
80101e17:	3c 2f                	cmp    $0x2f,%al
80101e19:	75 09                	jne    80101e24 <namex+0x74>
80101e1b:	e9 a3 00 00 00       	jmp    80101ec3 <namex+0x113>
80101e20:	84 c0                	test   %al,%al
80101e22:	74 0a                	je     80101e2e <namex+0x7e>
    path++;
80101e24:	83 c2 01             	add    $0x1,%edx
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101e27:	0f b6 02             	movzbl (%edx),%eax
80101e2a:	3c 2f                	cmp    $0x2f,%al
80101e2c:	75 f2                	jne    80101e20 <namex+0x70>
80101e2e:	89 d1                	mov    %edx,%ecx
80101e30:	29 d9                	sub    %ebx,%ecx
    path++;
  len = path - s;
  if(len >= DIRSIZ)
80101e32:	83 f9 0d             	cmp    $0xd,%ecx
80101e35:	0f 8e 8d 00 00 00    	jle    80101ec8 <namex+0x118>
    memmove(name, s, DIRSIZ);
80101e3b:	83 ec 04             	sub    $0x4,%esp
80101e3e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101e41:	6a 0e                	push   $0xe
80101e43:	53                   	push   %ebx
80101e44:	57                   	push   %edi
80101e45:	e8 86 28 00 00       	call   801046d0 <memmove>
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101e4a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
80101e4d:	83 c4 10             	add    $0x10,%esp
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101e50:	89 d3                	mov    %edx,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101e52:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101e55:	75 11                	jne    80101e68 <namex+0xb8>
80101e57:	89 f6                	mov    %esi,%esi
80101e59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    path++;
80101e60:	83 c3 01             	add    $0x1,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101e63:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101e66:	74 f8                	je     80101e60 <namex+0xb0>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101e68:	83 ec 0c             	sub    $0xc,%esp
80101e6b:	56                   	push   %esi
80101e6c:	e8 bf f8 ff ff       	call   80101730 <ilock>
    if(ip->type != T_DIR){
80101e71:	83 c4 10             	add    $0x10,%esp
80101e74:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101e79:	0f 85 7f 00 00 00    	jne    80101efe <namex+0x14e>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101e7f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101e82:	85 d2                	test   %edx,%edx
80101e84:	74 09                	je     80101e8f <namex+0xdf>
80101e86:	80 3b 00             	cmpb   $0x0,(%ebx)
80101e89:	0f 84 a3 00 00 00    	je     80101f32 <namex+0x182>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101e8f:	83 ec 04             	sub    $0x4,%esp
80101e92:	6a 00                	push   $0x0
80101e94:	57                   	push   %edi
80101e95:	56                   	push   %esi
80101e96:	e8 65 fe ff ff       	call   80101d00 <dirlookup>
80101e9b:	83 c4 10             	add    $0x10,%esp
80101e9e:	85 c0                	test   %eax,%eax
80101ea0:	74 5c                	je     80101efe <namex+0x14e>

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101ea2:	83 ec 0c             	sub    $0xc,%esp
80101ea5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101ea8:	56                   	push   %esi
80101ea9:	e8 62 f9 ff ff       	call   80101810 <iunlock>
  iput(ip);
80101eae:	89 34 24             	mov    %esi,(%esp)
80101eb1:	e8 aa f9 ff ff       	call   80101860 <iput>
80101eb6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101eb9:	83 c4 10             	add    $0x10,%esp
80101ebc:	89 c6                	mov    %eax,%esi
80101ebe:	e9 38 ff ff ff       	jmp    80101dfb <namex+0x4b>
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101ec3:	31 c9                	xor    %ecx,%ecx
80101ec5:	8d 76 00             	lea    0x0(%esi),%esi
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
80101ec8:	83 ec 04             	sub    $0x4,%esp
80101ecb:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101ece:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101ed1:	51                   	push   %ecx
80101ed2:	53                   	push   %ebx
80101ed3:	57                   	push   %edi
80101ed4:	e8 f7 27 00 00       	call   801046d0 <memmove>
    name[len] = 0;
80101ed9:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101edc:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101edf:	83 c4 10             	add    $0x10,%esp
80101ee2:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101ee6:	89 d3                	mov    %edx,%ebx
80101ee8:	e9 65 ff ff ff       	jmp    80101e52 <namex+0xa2>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101eed:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101ef0:	85 c0                	test   %eax,%eax
80101ef2:	75 54                	jne    80101f48 <namex+0x198>
80101ef4:	89 f0                	mov    %esi,%eax
    iput(ip);
    return 0;
  }
  return ip;
}
80101ef6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ef9:	5b                   	pop    %ebx
80101efa:	5e                   	pop    %esi
80101efb:	5f                   	pop    %edi
80101efc:	5d                   	pop    %ebp
80101efd:	c3                   	ret    

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101efe:	83 ec 0c             	sub    $0xc,%esp
80101f01:	56                   	push   %esi
80101f02:	e8 09 f9 ff ff       	call   80101810 <iunlock>
  iput(ip);
80101f07:	89 34 24             	mov    %esi,(%esp)
80101f0a:	e8 51 f9 ff ff       	call   80101860 <iput>
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101f0f:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101f12:	8d 65 f4             	lea    -0xc(%ebp),%esp
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101f15:	31 c0                	xor    %eax,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101f17:	5b                   	pop    %ebx
80101f18:	5e                   	pop    %esi
80101f19:	5f                   	pop    %edi
80101f1a:	5d                   	pop    %ebp
80101f1b:	c3                   	ret    
namex(char *path, int nameiparent, char *name)
{
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
80101f1c:	ba 01 00 00 00       	mov    $0x1,%edx
80101f21:	b8 01 00 00 00       	mov    $0x1,%eax
80101f26:	e8 d5 f2 ff ff       	call   80101200 <iget>
80101f2b:	89 c6                	mov    %eax,%esi
80101f2d:	e9 c9 fe ff ff       	jmp    80101dfb <namex+0x4b>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
80101f32:	83 ec 0c             	sub    $0xc,%esp
80101f35:	56                   	push   %esi
80101f36:	e8 d5 f8 ff ff       	call   80101810 <iunlock>
      return ip;
80101f3b:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101f3e:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
      return ip;
80101f41:	89 f0                	mov    %esi,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101f43:	5b                   	pop    %ebx
80101f44:	5e                   	pop    %esi
80101f45:	5f                   	pop    %edi
80101f46:	5d                   	pop    %ebp
80101f47:	c3                   	ret    
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
    iput(ip);
80101f48:	83 ec 0c             	sub    $0xc,%esp
80101f4b:	56                   	push   %esi
80101f4c:	e8 0f f9 ff ff       	call   80101860 <iput>
    return 0;
80101f51:	83 c4 10             	add    $0x10,%esp
80101f54:	31 c0                	xor    %eax,%eax
80101f56:	eb 9e                	jmp    80101ef6 <namex+0x146>
80101f58:	90                   	nop
80101f59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101f60 <dirlink>:
}

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
80101f60:	55                   	push   %ebp
80101f61:	89 e5                	mov    %esp,%ebp
80101f63:	57                   	push   %edi
80101f64:	56                   	push   %esi
80101f65:	53                   	push   %ebx
80101f66:	83 ec 20             	sub    $0x20,%esp
80101f69:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
80101f6c:	6a 00                	push   $0x0
80101f6e:	ff 75 0c             	pushl  0xc(%ebp)
80101f71:	53                   	push   %ebx
80101f72:	e8 89 fd ff ff       	call   80101d00 <dirlookup>
80101f77:	83 c4 10             	add    $0x10,%esp
80101f7a:	85 c0                	test   %eax,%eax
80101f7c:	75 67                	jne    80101fe5 <dirlink+0x85>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
80101f7e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101f81:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101f84:	85 ff                	test   %edi,%edi
80101f86:	74 29                	je     80101fb1 <dirlink+0x51>
80101f88:	31 ff                	xor    %edi,%edi
80101f8a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101f8d:	eb 09                	jmp    80101f98 <dirlink+0x38>
80101f8f:	90                   	nop
80101f90:	83 c7 10             	add    $0x10,%edi
80101f93:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101f96:	76 19                	jbe    80101fb1 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101f98:	6a 10                	push   $0x10
80101f9a:	57                   	push   %edi
80101f9b:	56                   	push   %esi
80101f9c:	53                   	push   %ebx
80101f9d:	e8 0e fb ff ff       	call   80101ab0 <readi>
80101fa2:	83 c4 10             	add    $0x10,%esp
80101fa5:	83 f8 10             	cmp    $0x10,%eax
80101fa8:	75 4e                	jne    80101ff8 <dirlink+0x98>
      panic("dirlink read");
    if(de.inum == 0)
80101faa:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101faf:	75 df                	jne    80101f90 <dirlink+0x30>
      break;
  }

  strncpy(de.name, name, DIRSIZ);
80101fb1:	8d 45 da             	lea    -0x26(%ebp),%eax
80101fb4:	83 ec 04             	sub    $0x4,%esp
80101fb7:	6a 0e                	push   $0xe
80101fb9:	ff 75 0c             	pushl  0xc(%ebp)
80101fbc:	50                   	push   %eax
80101fbd:	e8 fe 27 00 00       	call   801047c0 <strncpy>
  de.inum = inum;
80101fc2:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101fc5:	6a 10                	push   $0x10
80101fc7:	57                   	push   %edi
80101fc8:	56                   	push   %esi
80101fc9:	53                   	push   %ebx
    if(de.inum == 0)
      break;
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
80101fca:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101fce:	e8 dd fb ff ff       	call   80101bb0 <writei>
80101fd3:	83 c4 20             	add    $0x20,%esp
80101fd6:	83 f8 10             	cmp    $0x10,%eax
80101fd9:	75 2a                	jne    80102005 <dirlink+0xa5>
    panic("dirlink");

  return 0;
80101fdb:	31 c0                	xor    %eax,%eax
}
80101fdd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fe0:	5b                   	pop    %ebx
80101fe1:	5e                   	pop    %esi
80101fe2:	5f                   	pop    %edi
80101fe3:	5d                   	pop    %ebp
80101fe4:	c3                   	ret    
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    iput(ip);
80101fe5:	83 ec 0c             	sub    $0xc,%esp
80101fe8:	50                   	push   %eax
80101fe9:	e8 72 f8 ff ff       	call   80101860 <iput>
    return -1;
80101fee:	83 c4 10             	add    $0x10,%esp
80101ff1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ff6:	eb e5                	jmp    80101fdd <dirlink+0x7d>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101ff8:	83 ec 0c             	sub    $0xc,%esp
80101ffb:	68 75 72 10 80       	push   $0x80107275
80102000:	e8 6b e3 ff ff       	call   80100370 <panic>
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("dirlink");
80102005:	83 ec 0c             	sub    $0xc,%esp
80102008:	68 42 78 10 80       	push   $0x80107842
8010200d:	e8 5e e3 ff ff       	call   80100370 <panic>
80102012:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102020 <namei>:
  return ip;
}

struct inode*
namei(char *path)
{
80102020:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80102021:	31 d2                	xor    %edx,%edx
  return ip;
}

struct inode*
namei(char *path)
{
80102023:	89 e5                	mov    %esp,%ebp
80102025:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
80102028:	8b 45 08             	mov    0x8(%ebp),%eax
8010202b:	8d 4d ea             	lea    -0x16(%ebp),%ecx
8010202e:	e8 7d fd ff ff       	call   80101db0 <namex>
}
80102033:	c9                   	leave  
80102034:	c3                   	ret    
80102035:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102040 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80102040:	55                   	push   %ebp
  return namex(path, 1, name);
80102041:	ba 01 00 00 00       	mov    $0x1,%edx
  return namex(path, 0, name);
}

struct inode*
nameiparent(char *path, char *name)
{
80102046:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80102048:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010204b:	8b 45 08             	mov    0x8(%ebp),%eax
}
8010204e:	5d                   	pop    %ebp
}

struct inode*
nameiparent(char *path, char *name)
{
  return namex(path, 1, name);
8010204f:	e9 5c fd ff ff       	jmp    80101db0 <namex>
80102054:	66 90                	xchg   %ax,%ax
80102056:	66 90                	xchg   %ax,%ax
80102058:	66 90                	xchg   %ax,%ax
8010205a:	66 90                	xchg   %ax,%ax
8010205c:	66 90                	xchg   %ax,%ax
8010205e:	66 90                	xchg   %ax,%ax

80102060 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80102060:	55                   	push   %ebp
  if(b == 0)
80102061:	85 c0                	test   %eax,%eax
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80102063:	89 e5                	mov    %esp,%ebp
80102065:	56                   	push   %esi
80102066:	53                   	push   %ebx
  if(b == 0)
80102067:	0f 84 ad 00 00 00    	je     8010211a <idestart+0xba>
    panic("idestart");
  if(b->blockno >= FSSIZE)
8010206d:	8b 58 08             	mov    0x8(%eax),%ebx
80102070:	89 c1                	mov    %eax,%ecx
80102072:	81 fb 1f 4e 00 00    	cmp    $0x4e1f,%ebx
80102078:	0f 87 8f 00 00 00    	ja     8010210d <idestart+0xad>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010207e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102083:	90                   	nop
80102084:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102088:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102089:	83 e0 c0             	and    $0xffffffc0,%eax
8010208c:	3c 40                	cmp    $0x40,%al
8010208e:	75 f8                	jne    80102088 <idestart+0x28>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102090:	31 f6                	xor    %esi,%esi
80102092:	ba f6 03 00 00       	mov    $0x3f6,%edx
80102097:	89 f0                	mov    %esi,%eax
80102099:	ee                   	out    %al,(%dx)
8010209a:	ba f2 01 00 00       	mov    $0x1f2,%edx
8010209f:	b8 01 00 00 00       	mov    $0x1,%eax
801020a4:	ee                   	out    %al,(%dx)
801020a5:	ba f3 01 00 00       	mov    $0x1f3,%edx
801020aa:	89 d8                	mov    %ebx,%eax
801020ac:	ee                   	out    %al,(%dx)
801020ad:	89 d8                	mov    %ebx,%eax
801020af:	ba f4 01 00 00       	mov    $0x1f4,%edx
801020b4:	c1 f8 08             	sar    $0x8,%eax
801020b7:	ee                   	out    %al,(%dx)
801020b8:	ba f5 01 00 00       	mov    $0x1f5,%edx
801020bd:	89 f0                	mov    %esi,%eax
801020bf:	ee                   	out    %al,(%dx)
801020c0:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
801020c4:	ba f6 01 00 00       	mov    $0x1f6,%edx
801020c9:	83 e0 01             	and    $0x1,%eax
801020cc:	c1 e0 04             	shl    $0x4,%eax
801020cf:	83 c8 e0             	or     $0xffffffe0,%eax
801020d2:	ee                   	out    %al,(%dx)
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
801020d3:	f6 01 04             	testb  $0x4,(%ecx)
801020d6:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020db:	75 13                	jne    801020f0 <idestart+0x90>
801020dd:	b8 20 00 00 00       	mov    $0x20,%eax
801020e2:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
801020e3:	8d 65 f8             	lea    -0x8(%ebp),%esp
801020e6:	5b                   	pop    %ebx
801020e7:	5e                   	pop    %esi
801020e8:	5d                   	pop    %ebp
801020e9:	c3                   	ret    
801020ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801020f0:	b8 30 00 00 00       	mov    $0x30,%eax
801020f5:	ee                   	out    %al,(%dx)
}

static inline void
outsl(int port, const void *addr, int cnt)
{
  asm volatile("cld; rep outsl" :
801020f6:	ba f0 01 00 00       	mov    $0x1f0,%edx
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
801020fb:	8d 71 5c             	lea    0x5c(%ecx),%esi
801020fe:	b9 80 00 00 00       	mov    $0x80,%ecx
80102103:	fc                   	cld    
80102104:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  } else {
    outb(0x1f7, read_cmd);
  }
}
80102106:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102109:	5b                   	pop    %ebx
8010210a:	5e                   	pop    %esi
8010210b:	5d                   	pop    %ebp
8010210c:	c3                   	ret    
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
  if(b->blockno >= FSSIZE)
    panic("incorrect blockno");
8010210d:	83 ec 0c             	sub    $0xc,%esp
80102110:	68 e0 72 10 80       	push   $0x801072e0
80102115:	e8 56 e2 ff ff       	call   80100370 <panic>
// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
8010211a:	83 ec 0c             	sub    $0xc,%esp
8010211d:	68 d7 72 10 80       	push   $0x801072d7
80102122:	e8 49 e2 ff ff       	call   80100370 <panic>
80102127:	89 f6                	mov    %esi,%esi
80102129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102130 <ideinit>:
  return 0;
}

void
ideinit(void)
{
80102130:	55                   	push   %ebp
80102131:	89 e5                	mov    %esp,%ebp
80102133:	83 ec 10             	sub    $0x10,%esp
  int i;

  initlock(&idelock, "ide");
80102136:	68 f2 72 10 80       	push   $0x801072f2
8010213b:	68 80 a5 10 80       	push   $0x8010a580
80102140:	e8 8b 22 00 00       	call   801043d0 <initlock>
  picenable(IRQ_IDE);
80102145:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
8010214c:	e8 cf 12 00 00       	call   80103420 <picenable>
  ioapicenable(IRQ_IDE, ncpu - 1);
80102151:	58                   	pop    %eax
80102152:	a1 c0 2c 11 80       	mov    0x80112cc0,%eax
80102157:	5a                   	pop    %edx
80102158:	83 e8 01             	sub    $0x1,%eax
8010215b:	50                   	push   %eax
8010215c:	6a 0e                	push   $0xe
8010215e:	e8 bd 02 00 00       	call   80102420 <ioapicenable>
80102163:	83 c4 10             	add    $0x10,%esp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102166:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010216b:	90                   	nop
8010216c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102170:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102171:	83 e0 c0             	and    $0xffffffc0,%eax
80102174:	3c 40                	cmp    $0x40,%al
80102176:	75 f8                	jne    80102170 <ideinit+0x40>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102178:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010217d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80102182:	ee                   	out    %al,(%dx)
80102183:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102188:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010218d:	eb 06                	jmp    80102195 <ideinit+0x65>
8010218f:	90                   	nop
  ioapicenable(IRQ_IDE, ncpu - 1);
  idewait(0);

  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  for(i=0; i<1000; i++){
80102190:	83 e9 01             	sub    $0x1,%ecx
80102193:	74 0f                	je     801021a4 <ideinit+0x74>
80102195:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80102196:	84 c0                	test   %al,%al
80102198:	74 f6                	je     80102190 <ideinit+0x60>
      havedisk1 = 1;
8010219a:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
801021a1:	00 00 00 
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801021a4:	ba f6 01 00 00       	mov    $0x1f6,%edx
801021a9:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
801021ae:	ee                   	out    %al,(%dx)
    }
  }

  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
}
801021af:	c9                   	leave  
801021b0:	c3                   	ret    
801021b1:	eb 0d                	jmp    801021c0 <ideintr>
801021b3:	90                   	nop
801021b4:	90                   	nop
801021b5:	90                   	nop
801021b6:	90                   	nop
801021b7:	90                   	nop
801021b8:	90                   	nop
801021b9:	90                   	nop
801021ba:	90                   	nop
801021bb:	90                   	nop
801021bc:	90                   	nop
801021bd:	90                   	nop
801021be:	90                   	nop
801021bf:	90                   	nop

801021c0 <ideintr>:
}

// Interrupt handler.
void
ideintr(void)
{
801021c0:	55                   	push   %ebp
801021c1:	89 e5                	mov    %esp,%ebp
801021c3:	57                   	push   %edi
801021c4:	56                   	push   %esi
801021c5:	53                   	push   %ebx
801021c6:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
801021c9:	68 80 a5 10 80       	push   $0x8010a580
801021ce:	e8 1d 22 00 00       	call   801043f0 <acquire>
  if((b = idequeue) == 0){
801021d3:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
801021d9:	83 c4 10             	add    $0x10,%esp
801021dc:	85 db                	test   %ebx,%ebx
801021de:	74 34                	je     80102214 <ideintr+0x54>
    release(&idelock);
    // cprintf("spurious IDE interrupt\n");
    return;
  }
  idequeue = b->qnext;
801021e0:	8b 43 58             	mov    0x58(%ebx),%eax
801021e3:	a3 64 a5 10 80       	mov    %eax,0x8010a564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
801021e8:	8b 33                	mov    (%ebx),%esi
801021ea:	f7 c6 04 00 00 00    	test   $0x4,%esi
801021f0:	74 3e                	je     80102230 <ideintr+0x70>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
801021f2:	83 e6 fb             	and    $0xfffffffb,%esi
  wakeup(b);
801021f5:	83 ec 0c             	sub    $0xc,%esp
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
801021f8:	83 ce 02             	or     $0x2,%esi
801021fb:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
801021fd:	53                   	push   %ebx
801021fe:	e8 0d 1f 00 00       	call   80104110 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
80102203:	a1 64 a5 10 80       	mov    0x8010a564,%eax
80102208:	83 c4 10             	add    $0x10,%esp
8010220b:	85 c0                	test   %eax,%eax
8010220d:	74 05                	je     80102214 <ideintr+0x54>
    idestart(idequeue);
8010220f:	e8 4c fe ff ff       	call   80102060 <idestart>
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
  if((b = idequeue) == 0){
    release(&idelock);
80102214:	83 ec 0c             	sub    $0xc,%esp
80102217:	68 80 a5 10 80       	push   $0x8010a580
8010221c:	e8 af 23 00 00       	call   801045d0 <release>
  // Start disk on next buf in queue.
  if(idequeue != 0)
    idestart(idequeue);

  release(&idelock);
}
80102221:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102224:	5b                   	pop    %ebx
80102225:	5e                   	pop    %esi
80102226:	5f                   	pop    %edi
80102227:	5d                   	pop    %ebp
80102228:	c3                   	ret    
80102229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102230:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102235:	8d 76 00             	lea    0x0(%esi),%esi
80102238:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102239:	89 c1                	mov    %eax,%ecx
8010223b:	83 e1 c0             	and    $0xffffffc0,%ecx
8010223e:	80 f9 40             	cmp    $0x40,%cl
80102241:	75 f5                	jne    80102238 <ideintr+0x78>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
80102243:	a8 21                	test   $0x21,%al
80102245:	75 ab                	jne    801021f2 <ideintr+0x32>
  }
  idequeue = b->qnext;

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);
80102247:	8d 7b 5c             	lea    0x5c(%ebx),%edi
}

static inline void
insl(int port, void *addr, int cnt)
{
  asm volatile("cld; rep insl" :
8010224a:	b9 80 00 00 00       	mov    $0x80,%ecx
8010224f:	ba f0 01 00 00       	mov    $0x1f0,%edx
80102254:	fc                   	cld    
80102255:	f3 6d                	rep insl (%dx),%es:(%edi)
80102257:	8b 33                	mov    (%ebx),%esi
80102259:	eb 97                	jmp    801021f2 <ideintr+0x32>
8010225b:	90                   	nop
8010225c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102260 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
80102260:	55                   	push   %ebp
80102261:	89 e5                	mov    %esp,%ebp
80102263:	53                   	push   %ebx
80102264:	83 ec 10             	sub    $0x10,%esp
80102267:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
8010226a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010226d:	50                   	push   %eax
8010226e:	e8 2d 21 00 00       	call   801043a0 <holdingsleep>
80102273:	83 c4 10             	add    $0x10,%esp
80102276:	85 c0                	test   %eax,%eax
80102278:	0f 84 ad 00 00 00    	je     8010232b <iderw+0xcb>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
8010227e:	8b 03                	mov    (%ebx),%eax
80102280:	83 e0 06             	and    $0x6,%eax
80102283:	83 f8 02             	cmp    $0x2,%eax
80102286:	0f 84 b9 00 00 00    	je     80102345 <iderw+0xe5>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010228c:	8b 53 04             	mov    0x4(%ebx),%edx
8010228f:	85 d2                	test   %edx,%edx
80102291:	74 0d                	je     801022a0 <iderw+0x40>
80102293:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102298:	85 c0                	test   %eax,%eax
8010229a:	0f 84 98 00 00 00    	je     80102338 <iderw+0xd8>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
801022a0:	83 ec 0c             	sub    $0xc,%esp
801022a3:	68 80 a5 10 80       	push   $0x8010a580
801022a8:	e8 43 21 00 00       	call   801043f0 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801022ad:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
801022b3:	83 c4 10             	add    $0x10,%esp
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
801022b6:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801022bd:	85 d2                	test   %edx,%edx
801022bf:	75 09                	jne    801022ca <iderw+0x6a>
801022c1:	eb 58                	jmp    8010231b <iderw+0xbb>
801022c3:	90                   	nop
801022c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801022c8:	89 c2                	mov    %eax,%edx
801022ca:	8b 42 58             	mov    0x58(%edx),%eax
801022cd:	85 c0                	test   %eax,%eax
801022cf:	75 f7                	jne    801022c8 <iderw+0x68>
801022d1:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
801022d4:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
801022d6:	3b 1d 64 a5 10 80    	cmp    0x8010a564,%ebx
801022dc:	74 44                	je     80102322 <iderw+0xc2>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801022de:	8b 03                	mov    (%ebx),%eax
801022e0:	83 e0 06             	and    $0x6,%eax
801022e3:	83 f8 02             	cmp    $0x2,%eax
801022e6:	74 23                	je     8010230b <iderw+0xab>
801022e8:	90                   	nop
801022e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    sleep(b, &idelock);
801022f0:	83 ec 08             	sub    $0x8,%esp
801022f3:	68 80 a5 10 80       	push   $0x8010a580
801022f8:	53                   	push   %ebx
801022f9:	e8 72 1c 00 00       	call   80103f70 <sleep>
  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801022fe:	8b 03                	mov    (%ebx),%eax
80102300:	83 c4 10             	add    $0x10,%esp
80102303:	83 e0 06             	and    $0x6,%eax
80102306:	83 f8 02             	cmp    $0x2,%eax
80102309:	75 e5                	jne    801022f0 <iderw+0x90>
    sleep(b, &idelock);
  }

  release(&idelock);
8010230b:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
}
80102312:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102315:	c9                   	leave  
  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
    sleep(b, &idelock);
  }

  release(&idelock);
80102316:	e9 b5 22 00 00       	jmp    801045d0 <release>

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010231b:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
80102320:	eb b2                	jmp    801022d4 <iderw+0x74>
    ;
  *pp = b;

  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);
80102322:	89 d8                	mov    %ebx,%eax
80102324:	e8 37 fd ff ff       	call   80102060 <idestart>
80102329:	eb b3                	jmp    801022de <iderw+0x7e>
iderw(struct buf *b)
{
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
8010232b:	83 ec 0c             	sub    $0xc,%esp
8010232e:	68 f6 72 10 80       	push   $0x801072f6
80102333:	e8 38 e0 ff ff       	call   80100370 <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
    panic("iderw: ide disk 1 not present");
80102338:	83 ec 0c             	sub    $0xc,%esp
8010233b:	68 21 73 10 80       	push   $0x80107321
80102340:	e8 2b e0 ff ff       	call   80100370 <panic>
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
80102345:	83 ec 0c             	sub    $0xc,%esp
80102348:	68 0c 73 10 80       	push   $0x8010730c
8010234d:	e8 1e e0 ff ff       	call   80100370 <panic>
80102352:	66 90                	xchg   %ax,%ax
80102354:	66 90                	xchg   %ax,%ax
80102356:	66 90                	xchg   %ax,%ax
80102358:	66 90                	xchg   %ax,%ax
8010235a:	66 90                	xchg   %ax,%ax
8010235c:	66 90                	xchg   %ax,%ax
8010235e:	66 90                	xchg   %ax,%ax

80102360 <ioapicinit>:
void
ioapicinit(void)
{
  int i, id, maxintr;

  if(!ismp)
80102360:	a1 c4 26 11 80       	mov    0x801126c4,%eax
80102365:	85 c0                	test   %eax,%eax
80102367:	0f 84 a8 00 00 00    	je     80102415 <ioapicinit+0xb5>
  ioapic->data = data;
}

void
ioapicinit(void)
{
8010236d:	55                   	push   %ebp
  int i, id, maxintr;

  if(!ismp)
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
8010236e:	c7 05 8c 25 11 80 00 	movl   $0xfec00000,0x8011258c
80102375:	00 c0 fe 
  ioapic->data = data;
}

void
ioapicinit(void)
{
80102378:	89 e5                	mov    %esp,%ebp
8010237a:	56                   	push   %esi
8010237b:	53                   	push   %ebx
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
8010237c:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102383:	00 00 00 
  return ioapic->data;
80102386:	8b 15 8c 25 11 80    	mov    0x8011258c,%edx
8010238c:	8b 72 10             	mov    0x10(%edx),%esi
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
8010238f:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  return ioapic->data;
80102395:	8b 0d 8c 25 11 80    	mov    0x8011258c,%ecx
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
8010239b:	0f b6 15 c0 26 11 80 	movzbl 0x801126c0,%edx

  if(!ismp)
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
801023a2:	89 f0                	mov    %esi,%eax
801023a4:	c1 e8 10             	shr    $0x10,%eax
801023a7:	0f b6 f0             	movzbl %al,%esi

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
  return ioapic->data;
801023aa:	8b 41 10             	mov    0x10(%ecx),%eax
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
801023ad:	c1 e8 18             	shr    $0x18,%eax
801023b0:	39 d0                	cmp    %edx,%eax
801023b2:	74 16                	je     801023ca <ioapicinit+0x6a>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
801023b4:	83 ec 0c             	sub    $0xc,%esp
801023b7:	68 40 73 10 80       	push   $0x80107340
801023bc:	e8 9f e2 ff ff       	call   80100660 <cprintf>
801023c1:	8b 0d 8c 25 11 80    	mov    0x8011258c,%ecx
801023c7:	83 c4 10             	add    $0x10,%esp
801023ca:	83 c6 21             	add    $0x21,%esi
  ioapic->data = data;
}

void
ioapicinit(void)
{
801023cd:	ba 10 00 00 00       	mov    $0x10,%edx
801023d2:	b8 20 00 00 00       	mov    $0x20,%eax
801023d7:	89 f6                	mov    %esi,%esi
801023d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801023e0:	89 11                	mov    %edx,(%ecx)
  ioapic->data = data;
801023e2:	8b 0d 8c 25 11 80    	mov    0x8011258c,%ecx
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
801023e8:	89 c3                	mov    %eax,%ebx
801023ea:	81 cb 00 00 01 00    	or     $0x10000,%ebx
801023f0:	83 c0 01             	add    $0x1,%eax

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
801023f3:	89 59 10             	mov    %ebx,0x10(%ecx)
801023f6:	8d 5a 01             	lea    0x1(%edx),%ebx
801023f9:	83 c2 02             	add    $0x2,%edx
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
801023fc:	39 f0                	cmp    %esi,%eax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801023fe:	89 19                	mov    %ebx,(%ecx)
  ioapic->data = data;
80102400:	8b 0d 8c 25 11 80    	mov    0x8011258c,%ecx
80102406:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
8010240d:	75 d1                	jne    801023e0 <ioapicinit+0x80>
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
8010240f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102412:	5b                   	pop    %ebx
80102413:	5e                   	pop    %esi
80102414:	5d                   	pop    %ebp
80102415:	f3 c3                	repz ret 
80102417:	89 f6                	mov    %esi,%esi
80102419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102420 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
  if(!ismp)
80102420:	8b 15 c4 26 11 80    	mov    0x801126c4,%edx
  }
}

void
ioapicenable(int irq, int cpunum)
{
80102426:	55                   	push   %ebp
80102427:	89 e5                	mov    %esp,%ebp
  if(!ismp)
80102429:	85 d2                	test   %edx,%edx
  }
}

void
ioapicenable(int irq, int cpunum)
{
8010242b:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!ismp)
8010242e:	74 2b                	je     8010245b <ioapicenable+0x3b>
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102430:	8b 0d 8c 25 11 80    	mov    0x8011258c,%ecx
    return;

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
80102436:	8d 50 20             	lea    0x20(%eax),%edx
80102439:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
8010243d:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
8010243f:	8b 0d 8c 25 11 80    	mov    0x8011258c,%ecx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102445:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
80102448:	89 51 10             	mov    %edx,0x10(%ecx)

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
8010244b:	8b 55 0c             	mov    0xc(%ebp),%edx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
8010244e:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
80102450:	a1 8c 25 11 80       	mov    0x8011258c,%eax

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
80102455:	c1 e2 18             	shl    $0x18,%edx

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
80102458:	89 50 10             	mov    %edx,0x10(%eax)
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
}
8010245b:	5d                   	pop    %ebp
8010245c:	c3                   	ret    
8010245d:	66 90                	xchg   %ax,%ax
8010245f:	90                   	nop

80102460 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
80102460:	55                   	push   %ebp
80102461:	89 e5                	mov    %esp,%ebp
80102463:	53                   	push   %ebx
80102464:	83 ec 04             	sub    $0x4,%esp
80102467:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
8010246a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102470:	75 70                	jne    801024e2 <kfree+0x82>
80102472:	81 fb 68 54 11 80    	cmp    $0x80115468,%ebx
80102478:	72 68                	jb     801024e2 <kfree+0x82>
8010247a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102480:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102485:	77 5b                	ja     801024e2 <kfree+0x82>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
80102487:	83 ec 04             	sub    $0x4,%esp
8010248a:	68 00 10 00 00       	push   $0x1000
8010248f:	6a 01                	push   $0x1
80102491:	53                   	push   %ebx
80102492:	e8 89 21 00 00       	call   80104620 <memset>

  if(kmem.use_lock)
80102497:	8b 15 d4 25 11 80    	mov    0x801125d4,%edx
8010249d:	83 c4 10             	add    $0x10,%esp
801024a0:	85 d2                	test   %edx,%edx
801024a2:	75 2c                	jne    801024d0 <kfree+0x70>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
801024a4:	a1 d8 25 11 80       	mov    0x801125d8,%eax
801024a9:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
801024ab:	a1 d4 25 11 80       	mov    0x801125d4,%eax

  if(kmem.use_lock)
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
801024b0:	89 1d d8 25 11 80    	mov    %ebx,0x801125d8
  if(kmem.use_lock)
801024b6:	85 c0                	test   %eax,%eax
801024b8:	75 06                	jne    801024c0 <kfree+0x60>
    release(&kmem.lock);
}
801024ba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024bd:	c9                   	leave  
801024be:	c3                   	ret    
801024bf:	90                   	nop
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
801024c0:	c7 45 08 a0 25 11 80 	movl   $0x801125a0,0x8(%ebp)
}
801024c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024ca:	c9                   	leave  
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
801024cb:	e9 00 21 00 00       	jmp    801045d0 <release>

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);

  if(kmem.use_lock)
    acquire(&kmem.lock);
801024d0:	83 ec 0c             	sub    $0xc,%esp
801024d3:	68 a0 25 11 80       	push   $0x801125a0
801024d8:	e8 13 1f 00 00       	call   801043f0 <acquire>
801024dd:	83 c4 10             	add    $0x10,%esp
801024e0:	eb c2                	jmp    801024a4 <kfree+0x44>
kfree(char *v)
{
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
    panic("kfree");
801024e2:	83 ec 0c             	sub    $0xc,%esp
801024e5:	68 72 73 10 80       	push   $0x80107372
801024ea:	e8 81 de ff ff       	call   80100370 <panic>
801024ef:	90                   	nop

801024f0 <freerange>:
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
801024f0:	55                   	push   %ebp
801024f1:	89 e5                	mov    %esp,%ebp
801024f3:	56                   	push   %esi
801024f4:	53                   	push   %ebx
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801024f5:	8b 45 08             	mov    0x8(%ebp),%eax
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
801024f8:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801024fb:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102501:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102507:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010250d:	39 de                	cmp    %ebx,%esi
8010250f:	72 23                	jb     80102534 <freerange+0x44>
80102511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102518:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010251e:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102521:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102527:	50                   	push   %eax
80102528:	e8 33 ff ff ff       	call   80102460 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010252d:	83 c4 10             	add    $0x10,%esp
80102530:	39 f3                	cmp    %esi,%ebx
80102532:	76 e4                	jbe    80102518 <freerange+0x28>
    kfree(p);
}
80102534:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102537:	5b                   	pop    %ebx
80102538:	5e                   	pop    %esi
80102539:	5d                   	pop    %ebp
8010253a:	c3                   	ret    
8010253b:	90                   	nop
8010253c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102540 <kinit1>:
// the pages mapped by entrypgdir on free list.
// 2. main() calls kinit2() with the rest of the physical pages
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
80102540:	55                   	push   %ebp
80102541:	89 e5                	mov    %esp,%ebp
80102543:	56                   	push   %esi
80102544:	53                   	push   %ebx
80102545:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
80102548:	83 ec 08             	sub    $0x8,%esp
8010254b:	68 78 73 10 80       	push   $0x80107378
80102550:	68 a0 25 11 80       	push   $0x801125a0
80102555:	e8 76 1e 00 00       	call   801043d0 <initlock>

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010255a:	8b 45 08             	mov    0x8(%ebp),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010255d:	83 c4 10             	add    $0x10,%esp
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
80102560:	c7 05 d4 25 11 80 00 	movl   $0x0,0x801125d4
80102567:	00 00 00 

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010256a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102570:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102576:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010257c:	39 de                	cmp    %ebx,%esi
8010257e:	72 1c                	jb     8010259c <kinit1+0x5c>
    kfree(p);
80102580:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102586:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102589:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
8010258f:	50                   	push   %eax
80102590:	e8 cb fe ff ff       	call   80102460 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102595:	83 c4 10             	add    $0x10,%esp
80102598:	39 de                	cmp    %ebx,%esi
8010259a:	73 e4                	jae    80102580 <kinit1+0x40>
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
  freerange(vstart, vend);
}
8010259c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010259f:	5b                   	pop    %ebx
801025a0:	5e                   	pop    %esi
801025a1:	5d                   	pop    %ebp
801025a2:	c3                   	ret    
801025a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801025a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025b0 <kinit2>:

void
kinit2(void *vstart, void *vend)
{
801025b0:	55                   	push   %ebp
801025b1:	89 e5                	mov    %esp,%ebp
801025b3:	56                   	push   %esi
801025b4:	53                   	push   %ebx

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801025b5:	8b 45 08             	mov    0x8(%ebp),%eax
  freerange(vstart, vend);
}

void
kinit2(void *vstart, void *vend)
{
801025b8:	8b 75 0c             	mov    0xc(%ebp),%esi

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801025bb:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801025c1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801025c7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801025cd:	39 de                	cmp    %ebx,%esi
801025cf:	72 23                	jb     801025f4 <kinit2+0x44>
801025d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
801025d8:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801025de:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801025e1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801025e7:	50                   	push   %eax
801025e8:	e8 73 fe ff ff       	call   80102460 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801025ed:	83 c4 10             	add    $0x10,%esp
801025f0:	39 de                	cmp    %ebx,%esi
801025f2:	73 e4                	jae    801025d8 <kinit2+0x28>

void
kinit2(void *vstart, void *vend)
{
  freerange(vstart, vend);
  kmem.use_lock = 1;
801025f4:	c7 05 d4 25 11 80 01 	movl   $0x1,0x801125d4
801025fb:	00 00 00 
}
801025fe:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102601:	5b                   	pop    %ebx
80102602:	5e                   	pop    %esi
80102603:	5d                   	pop    %ebp
80102604:	c3                   	ret    
80102605:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102610 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
80102610:	55                   	push   %ebp
80102611:	89 e5                	mov    %esp,%ebp
80102613:	53                   	push   %ebx
80102614:	83 ec 04             	sub    $0x4,%esp
  struct run *r;

  if(kmem.use_lock)
80102617:	a1 d4 25 11 80       	mov    0x801125d4,%eax
8010261c:	85 c0                	test   %eax,%eax
8010261e:	75 30                	jne    80102650 <kalloc+0x40>
    acquire(&kmem.lock);
  r = kmem.freelist;
80102620:	8b 1d d8 25 11 80    	mov    0x801125d8,%ebx
  if(r)
80102626:	85 db                	test   %ebx,%ebx
80102628:	74 1c                	je     80102646 <kalloc+0x36>
    kmem.freelist = r->next;
8010262a:	8b 13                	mov    (%ebx),%edx
8010262c:	89 15 d8 25 11 80    	mov    %edx,0x801125d8
  if(kmem.use_lock)
80102632:	85 c0                	test   %eax,%eax
80102634:	74 10                	je     80102646 <kalloc+0x36>
    release(&kmem.lock);
80102636:	83 ec 0c             	sub    $0xc,%esp
80102639:	68 a0 25 11 80       	push   $0x801125a0
8010263e:	e8 8d 1f 00 00       	call   801045d0 <release>
80102643:	83 c4 10             	add    $0x10,%esp
  return (char*)r;
}
80102646:	89 d8                	mov    %ebx,%eax
80102648:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010264b:	c9                   	leave  
8010264c:	c3                   	ret    
8010264d:	8d 76 00             	lea    0x0(%esi),%esi
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
    acquire(&kmem.lock);
80102650:	83 ec 0c             	sub    $0xc,%esp
80102653:	68 a0 25 11 80       	push   $0x801125a0
80102658:	e8 93 1d 00 00       	call   801043f0 <acquire>
  r = kmem.freelist;
8010265d:	8b 1d d8 25 11 80    	mov    0x801125d8,%ebx
  if(r)
80102663:	83 c4 10             	add    $0x10,%esp
80102666:	a1 d4 25 11 80       	mov    0x801125d4,%eax
8010266b:	85 db                	test   %ebx,%ebx
8010266d:	75 bb                	jne    8010262a <kalloc+0x1a>
8010266f:	eb c1                	jmp    80102632 <kalloc+0x22>
80102671:	66 90                	xchg   %ax,%ax
80102673:	66 90                	xchg   %ax,%ax
80102675:	66 90                	xchg   %ax,%ax
80102677:	66 90                	xchg   %ax,%ax
80102679:	66 90                	xchg   %ax,%ax
8010267b:	66 90                	xchg   %ax,%ax
8010267d:	66 90                	xchg   %ax,%ax
8010267f:	90                   	nop

80102680 <kbdgetc>:
#include "defs.h"
#include "kbd.h"

int
kbdgetc(void)
{
80102680:	55                   	push   %ebp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102681:	ba 64 00 00 00       	mov    $0x64,%edx
80102686:	89 e5                	mov    %esp,%ebp
80102688:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
80102689:	a8 01                	test   $0x1,%al
8010268b:	0f 84 af 00 00 00    	je     80102740 <kbdgetc+0xc0>
80102691:	ba 60 00 00 00       	mov    $0x60,%edx
80102696:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
80102697:	0f b6 d0             	movzbl %al,%edx

  if(data == 0xE0){
8010269a:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
801026a0:	74 7e                	je     80102720 <kbdgetc+0xa0>
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
801026a2:	84 c0                	test   %al,%al
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
801026a4:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
801026aa:	79 24                	jns    801026d0 <kbdgetc+0x50>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
801026ac:	f6 c1 40             	test   $0x40,%cl
801026af:	75 05                	jne    801026b6 <kbdgetc+0x36>
801026b1:	89 c2                	mov    %eax,%edx
801026b3:	83 e2 7f             	and    $0x7f,%edx
    shift &= ~(shiftcode[data] | E0ESC);
801026b6:	0f b6 82 a0 74 10 80 	movzbl -0x7fef8b60(%edx),%eax
801026bd:	83 c8 40             	or     $0x40,%eax
801026c0:	0f b6 c0             	movzbl %al,%eax
801026c3:	f7 d0                	not    %eax
801026c5:	21 c8                	and    %ecx,%eax
801026c7:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
    return 0;
801026cc:	31 c0                	xor    %eax,%eax
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801026ce:	5d                   	pop    %ebp
801026cf:	c3                   	ret    
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
801026d0:	f6 c1 40             	test   $0x40,%cl
801026d3:	74 09                	je     801026de <kbdgetc+0x5e>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
801026d5:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
801026d8:	83 e1 bf             	and    $0xffffffbf,%ecx
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
801026db:	0f b6 d0             	movzbl %al,%edx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
801026de:	0f b6 82 a0 74 10 80 	movzbl -0x7fef8b60(%edx),%eax
801026e5:	09 c1                	or     %eax,%ecx
801026e7:	0f b6 82 a0 73 10 80 	movzbl -0x7fef8c60(%edx),%eax
801026ee:	31 c1                	xor    %eax,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
801026f0:	89 c8                	mov    %ecx,%eax
    data |= 0x80;
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
801026f2:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
  c = charcode[shift & (CTL | SHIFT)][data];
801026f8:	83 e0 03             	and    $0x3,%eax
  if(shift & CAPSLOCK){
801026fb:	83 e1 08             	and    $0x8,%ecx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
801026fe:	8b 04 85 80 73 10 80 	mov    -0x7fef8c80(,%eax,4),%eax
80102705:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
  if(shift & CAPSLOCK){
80102709:	74 c3                	je     801026ce <kbdgetc+0x4e>
    if('a' <= c && c <= 'z')
8010270b:	8d 50 9f             	lea    -0x61(%eax),%edx
8010270e:	83 fa 19             	cmp    $0x19,%edx
80102711:	77 1d                	ja     80102730 <kbdgetc+0xb0>
      c += 'A' - 'a';
80102713:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
80102716:	5d                   	pop    %ebp
80102717:	c3                   	ret    
80102718:	90                   	nop
80102719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
    return 0;
80102720:	31 c0                	xor    %eax,%eax
  if((st & KBS_DIB) == 0)
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
80102722:	83 0d b4 a5 10 80 40 	orl    $0x40,0x8010a5b4
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
80102729:	5d                   	pop    %ebp
8010272a:	c3                   	ret    
8010272b:	90                   	nop
8010272c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
80102730:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
80102733:	8d 50 20             	lea    0x20(%eax),%edx
  }
  return c;
}
80102736:	5d                   	pop    %ebp
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
80102737:	83 f9 19             	cmp    $0x19,%ecx
8010273a:	0f 46 c2             	cmovbe %edx,%eax
  }
  return c;
}
8010273d:	c3                   	ret    
8010273e:	66 90                	xchg   %ax,%ax
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
    return -1;
80102740:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
80102745:	5d                   	pop    %ebp
80102746:	c3                   	ret    
80102747:	89 f6                	mov    %esi,%esi
80102749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102750 <kbdintr>:

void
kbdintr(void)
{
80102750:	55                   	push   %ebp
80102751:	89 e5                	mov    %esp,%ebp
80102753:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
80102756:	68 80 26 10 80       	push   $0x80102680
8010275b:	e8 90 e0 ff ff       	call   801007f0 <consoleintr>
}
80102760:	83 c4 10             	add    $0x10,%esp
80102763:	c9                   	leave  
80102764:	c3                   	ret    
80102765:	66 90                	xchg   %ax,%ax
80102767:	66 90                	xchg   %ax,%ax
80102769:	66 90                	xchg   %ax,%ax
8010276b:	66 90                	xchg   %ax,%ax
8010276d:	66 90                	xchg   %ax,%ax
8010276f:	90                   	nop

80102770 <lapicinit>:
//PAGEBREAK!

void
lapicinit(void)
{
  if(!lapic)
80102770:	a1 dc 25 11 80       	mov    0x801125dc,%eax
}
//PAGEBREAK!

void
lapicinit(void)
{
80102775:	55                   	push   %ebp
80102776:	89 e5                	mov    %esp,%ebp
  if(!lapic)
80102778:	85 c0                	test   %eax,%eax
8010277a:	0f 84 c8 00 00 00    	je     80102848 <lapicinit+0xd8>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102780:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102787:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010278a:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010278d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102794:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102797:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010279a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
801027a1:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
801027a4:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027a7:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
801027ae:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
801027b1:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027b4:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
801027bb:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801027be:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027c1:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
801027c8:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801027cb:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
801027ce:	8b 50 30             	mov    0x30(%eax),%edx
801027d1:	c1 ea 10             	shr    $0x10,%edx
801027d4:	80 fa 03             	cmp    $0x3,%dl
801027d7:	77 77                	ja     80102850 <lapicinit+0xe0>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027d9:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801027e0:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027e3:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027e6:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801027ed:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027f0:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027f3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801027fa:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027fd:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102800:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102807:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010280a:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010280d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102814:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102817:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010281a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102821:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
80102824:	8b 50 20             	mov    0x20(%eax),%edx
80102827:	89 f6                	mov    %esi,%esi
80102829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
80102830:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102836:	80 e6 10             	and    $0x10,%dh
80102839:	75 f5                	jne    80102830 <lapicinit+0xc0>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010283b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102842:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102845:	8b 40 20             	mov    0x20(%eax),%eax
  while(lapic[ICRLO] & DELIVS)
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
80102848:	5d                   	pop    %ebp
80102849:	c3                   	ret    
8010284a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102850:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102857:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010285a:	8b 50 20             	mov    0x20(%eax),%edx
8010285d:	e9 77 ff ff ff       	jmp    801027d9 <lapicinit+0x69>
80102862:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102870 <cpunum>:
  lapicw(TPR, 0);
}

int
cpunum(void)
{
80102870:	55                   	push   %ebp
80102871:	89 e5                	mov    %esp,%ebp
80102873:	56                   	push   %esi
80102874:	53                   	push   %ebx

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80102875:	9c                   	pushf  
80102876:	58                   	pop    %eax
  // Cannot call cpu when interrupts are enabled:
  // result not guaranteed to last long enough to be used!
  // Would prefer to panic but even printing is chancy here:
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
80102877:	f6 c4 02             	test   $0x2,%ah
8010287a:	74 12                	je     8010288e <cpunum+0x1e>
    static int n;
    if(n++ == 0)
8010287c:	a1 b8 a5 10 80       	mov    0x8010a5b8,%eax
80102881:	8d 50 01             	lea    0x1(%eax),%edx
80102884:	85 c0                	test   %eax,%eax
80102886:	89 15 b8 a5 10 80    	mov    %edx,0x8010a5b8
8010288c:	74 4d                	je     801028db <cpunum+0x6b>
      cprintf("cpu called from %x with interrupts enabled\n",
        __builtin_return_address(0));
  }

  if (!lapic)
8010288e:	a1 dc 25 11 80       	mov    0x801125dc,%eax
80102893:	85 c0                	test   %eax,%eax
80102895:	74 60                	je     801028f7 <cpunum+0x87>
    return 0;

  apicid = lapic[ID] >> 24;
80102897:	8b 58 20             	mov    0x20(%eax),%ebx
  for (i = 0; i < ncpu; ++i) {
8010289a:	8b 35 c0 2c 11 80    	mov    0x80112cc0,%esi
  }

  if (!lapic)
    return 0;

  apicid = lapic[ID] >> 24;
801028a0:	c1 eb 18             	shr    $0x18,%ebx
  for (i = 0; i < ncpu; ++i) {
801028a3:	85 f6                	test   %esi,%esi
801028a5:	7e 59                	jle    80102900 <cpunum+0x90>
    if (cpus[i].apicid == apicid)
801028a7:	0f b6 05 e0 26 11 80 	movzbl 0x801126e0,%eax
801028ae:	39 c3                	cmp    %eax,%ebx
801028b0:	74 45                	je     801028f7 <cpunum+0x87>
801028b2:	ba 9c 27 11 80       	mov    $0x8011279c,%edx
801028b7:	31 c0                	xor    %eax,%eax
801028b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  if (!lapic)
    return 0;

  apicid = lapic[ID] >> 24;
  for (i = 0; i < ncpu; ++i) {
801028c0:	83 c0 01             	add    $0x1,%eax
801028c3:	39 f0                	cmp    %esi,%eax
801028c5:	74 39                	je     80102900 <cpunum+0x90>
    if (cpus[i].apicid == apicid)
801028c7:	0f b6 0a             	movzbl (%edx),%ecx
801028ca:	81 c2 bc 00 00 00    	add    $0xbc,%edx
801028d0:	39 cb                	cmp    %ecx,%ebx
801028d2:	75 ec                	jne    801028c0 <cpunum+0x50>
      return i;
  }
  panic("unknown apicid\n");
}
801028d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801028d7:	5b                   	pop    %ebx
801028d8:	5e                   	pop    %esi
801028d9:	5d                   	pop    %ebp
801028da:	c3                   	ret    
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
    static int n;
    if(n++ == 0)
      cprintf("cpu called from %x with interrupts enabled\n",
801028db:	83 ec 08             	sub    $0x8,%esp
801028de:	ff 75 04             	pushl  0x4(%ebp)
801028e1:	68 a0 75 10 80       	push   $0x801075a0
801028e6:	e8 75 dd ff ff       	call   80100660 <cprintf>
        __builtin_return_address(0));
  }

  if (!lapic)
801028eb:	a1 dc 25 11 80       	mov    0x801125dc,%eax
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
    static int n;
    if(n++ == 0)
      cprintf("cpu called from %x with interrupts enabled\n",
801028f0:	83 c4 10             	add    $0x10,%esp
        __builtin_return_address(0));
  }

  if (!lapic)
801028f3:	85 c0                	test   %eax,%eax
801028f5:	75 a0                	jne    80102897 <cpunum+0x27>
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
}
801028f7:	8d 65 f8             	lea    -0x8(%ebp),%esp
      cprintf("cpu called from %x with interrupts enabled\n",
        __builtin_return_address(0));
  }

  if (!lapic)
    return 0;
801028fa:	31 c0                	xor    %eax,%eax
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
}
801028fc:	5b                   	pop    %ebx
801028fd:	5e                   	pop    %esi
801028fe:	5d                   	pop    %ebp
801028ff:	c3                   	ret    
  apicid = lapic[ID] >> 24;
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
80102900:	83 ec 0c             	sub    $0xc,%esp
80102903:	68 cc 75 10 80       	push   $0x801075cc
80102908:	e8 63 da ff ff       	call   80100370 <panic>
8010290d:	8d 76 00             	lea    0x0(%esi),%esi

80102910 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
80102910:	a1 dc 25 11 80       	mov    0x801125dc,%eax
}

// Acknowledge interrupt.
void
lapiceoi(void)
{
80102915:	55                   	push   %ebp
80102916:	89 e5                	mov    %esp,%ebp
  if(lapic)
80102918:	85 c0                	test   %eax,%eax
8010291a:	74 0d                	je     80102929 <lapiceoi+0x19>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010291c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102923:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102926:	8b 40 20             	mov    0x20(%eax),%eax
void
lapiceoi(void)
{
  if(lapic)
    lapicw(EOI, 0);
}
80102929:	5d                   	pop    %ebp
8010292a:	c3                   	ret    
8010292b:	90                   	nop
8010292c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102930 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
80102930:	55                   	push   %ebp
80102931:	89 e5                	mov    %esp,%ebp
}
80102933:	5d                   	pop    %ebp
80102934:	c3                   	ret    
80102935:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102940 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
80102940:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102941:	ba 70 00 00 00       	mov    $0x70,%edx
80102946:	b8 0f 00 00 00       	mov    $0xf,%eax
8010294b:	89 e5                	mov    %esp,%ebp
8010294d:	53                   	push   %ebx
8010294e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102951:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102954:	ee                   	out    %al,(%dx)
80102955:	ba 71 00 00 00       	mov    $0x71,%edx
8010295a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010295f:	ee                   	out    %al,(%dx)
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
80102960:	31 c0                	xor    %eax,%eax
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102962:	c1 e3 18             	shl    $0x18,%ebx
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
80102965:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
8010296b:	89 c8                	mov    %ecx,%eax
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
8010296d:	c1 e9 0c             	shr    $0xc,%ecx
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
80102970:	c1 e8 04             	shr    $0x4,%eax
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102973:	89 da                	mov    %ebx,%edx
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
80102975:	80 cd 06             	or     $0x6,%ch
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
80102978:	66 a3 69 04 00 80    	mov    %ax,0x80000469
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010297e:	a1 dc 25 11 80       	mov    0x801125dc,%eax
80102983:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102989:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010298c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102993:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102996:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102999:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801029a0:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
801029a3:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801029a6:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801029ac:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801029af:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
801029b5:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801029b8:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801029be:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801029c1:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
801029c7:	8b 40 20             	mov    0x20(%eax),%eax
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
    microdelay(200);
  }
}
801029ca:	5b                   	pop    %ebx
801029cb:	5d                   	pop    %ebp
801029cc:	c3                   	ret    
801029cd:	8d 76 00             	lea    0x0(%esi),%esi

801029d0 <cmostime>:
  r->year   = cmos_read(YEAR);
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void cmostime(struct rtcdate *r)
{
801029d0:	55                   	push   %ebp
801029d1:	ba 70 00 00 00       	mov    $0x70,%edx
801029d6:	b8 0b 00 00 00       	mov    $0xb,%eax
801029db:	89 e5                	mov    %esp,%ebp
801029dd:	57                   	push   %edi
801029de:	56                   	push   %esi
801029df:	53                   	push   %ebx
801029e0:	83 ec 4c             	sub    $0x4c,%esp
801029e3:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801029e4:	ba 71 00 00 00       	mov    $0x71,%edx
801029e9:	ec                   	in     (%dx),%al
801029ea:	83 e0 04             	and    $0x4,%eax
801029ed:	8d 75 d0             	lea    -0x30(%ebp),%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801029f0:	31 db                	xor    %ebx,%ebx
801029f2:	88 45 b7             	mov    %al,-0x49(%ebp)
801029f5:	bf 70 00 00 00       	mov    $0x70,%edi
801029fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102a00:	89 d8                	mov    %ebx,%eax
80102a02:	89 fa                	mov    %edi,%edx
80102a04:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a05:	b9 71 00 00 00       	mov    $0x71,%ecx
80102a0a:	89 ca                	mov    %ecx,%edx
80102a0c:	ec                   	in     (%dx),%al
  return inb(CMOS_RETURN);
}

static void fill_rtcdate(struct rtcdate *r)
{
  r->second = cmos_read(SECS);
80102a0d:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a10:	89 fa                	mov    %edi,%edx
80102a12:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102a15:	b8 02 00 00 00       	mov    $0x2,%eax
80102a1a:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a1b:	89 ca                	mov    %ecx,%edx
80102a1d:	ec                   	in     (%dx),%al
  r->minute = cmos_read(MINS);
80102a1e:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a21:	89 fa                	mov    %edi,%edx
80102a23:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102a26:	b8 04 00 00 00       	mov    $0x4,%eax
80102a2b:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a2c:	89 ca                	mov    %ecx,%edx
80102a2e:	ec                   	in     (%dx),%al
  r->hour   = cmos_read(HOURS);
80102a2f:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a32:	89 fa                	mov    %edi,%edx
80102a34:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102a37:	b8 07 00 00 00       	mov    $0x7,%eax
80102a3c:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a3d:	89 ca                	mov    %ecx,%edx
80102a3f:	ec                   	in     (%dx),%al
  r->day    = cmos_read(DAY);
80102a40:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a43:	89 fa                	mov    %edi,%edx
80102a45:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102a48:	b8 08 00 00 00       	mov    $0x8,%eax
80102a4d:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a4e:	89 ca                	mov    %ecx,%edx
80102a50:	ec                   	in     (%dx),%al
  r->month  = cmos_read(MONTH);
80102a51:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a54:	89 fa                	mov    %edi,%edx
80102a56:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102a59:	b8 09 00 00 00       	mov    $0x9,%eax
80102a5e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a5f:	89 ca                	mov    %ecx,%edx
80102a61:	ec                   	in     (%dx),%al
  r->year   = cmos_read(YEAR);
80102a62:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a65:	89 fa                	mov    %edi,%edx
80102a67:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102a6a:	b8 0a 00 00 00       	mov    $0xa,%eax
80102a6f:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a70:	89 ca                	mov    %ecx,%edx
80102a72:	ec                   	in     (%dx),%al
  bcd = (sb & (1 << 2)) == 0;

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
80102a73:	84 c0                	test   %al,%al
80102a75:	78 89                	js     80102a00 <cmostime+0x30>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a77:	89 d8                	mov    %ebx,%eax
80102a79:	89 fa                	mov    %edi,%edx
80102a7b:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a7c:	89 ca                	mov    %ecx,%edx
80102a7e:	ec                   	in     (%dx),%al
  return inb(CMOS_RETURN);
}

static void fill_rtcdate(struct rtcdate *r)
{
  r->second = cmos_read(SECS);
80102a7f:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a82:	89 fa                	mov    %edi,%edx
80102a84:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102a87:	b8 02 00 00 00       	mov    $0x2,%eax
80102a8c:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a8d:	89 ca                	mov    %ecx,%edx
80102a8f:	ec                   	in     (%dx),%al
  r->minute = cmos_read(MINS);
80102a90:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a93:	89 fa                	mov    %edi,%edx
80102a95:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102a98:	b8 04 00 00 00       	mov    $0x4,%eax
80102a9d:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a9e:	89 ca                	mov    %ecx,%edx
80102aa0:	ec                   	in     (%dx),%al
  r->hour   = cmos_read(HOURS);
80102aa1:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102aa4:	89 fa                	mov    %edi,%edx
80102aa6:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102aa9:	b8 07 00 00 00       	mov    $0x7,%eax
80102aae:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102aaf:	89 ca                	mov    %ecx,%edx
80102ab1:	ec                   	in     (%dx),%al
  r->day    = cmos_read(DAY);
80102ab2:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102ab5:	89 fa                	mov    %edi,%edx
80102ab7:	89 45 dc             	mov    %eax,-0x24(%ebp)
80102aba:	b8 08 00 00 00       	mov    $0x8,%eax
80102abf:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102ac0:	89 ca                	mov    %ecx,%edx
80102ac2:	ec                   	in     (%dx),%al
  r->month  = cmos_read(MONTH);
80102ac3:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102ac6:	89 fa                	mov    %edi,%edx
80102ac8:	89 45 e0             	mov    %eax,-0x20(%ebp)
80102acb:	b8 09 00 00 00       	mov    $0x9,%eax
80102ad0:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102ad1:	89 ca                	mov    %ecx,%edx
80102ad3:	ec                   	in     (%dx),%al
  r->year   = cmos_read(YEAR);
80102ad4:	0f b6 c0             	movzbl %al,%eax
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102ad7:	83 ec 04             	sub    $0x4,%esp
  r->second = cmos_read(SECS);
  r->minute = cmos_read(MINS);
  r->hour   = cmos_read(HOURS);
  r->day    = cmos_read(DAY);
  r->month  = cmos_read(MONTH);
  r->year   = cmos_read(YEAR);
80102ada:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102add:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102ae0:	6a 18                	push   $0x18
80102ae2:	56                   	push   %esi
80102ae3:	50                   	push   %eax
80102ae4:	e8 87 1b 00 00       	call   80104670 <memcmp>
80102ae9:	83 c4 10             	add    $0x10,%esp
80102aec:	85 c0                	test   %eax,%eax
80102aee:	0f 85 0c ff ff ff    	jne    80102a00 <cmostime+0x30>
      break;
  }

  // convert
  if(bcd) {
80102af4:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
80102af8:	75 78                	jne    80102b72 <cmostime+0x1a2>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
80102afa:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102afd:	89 c2                	mov    %eax,%edx
80102aff:	83 e0 0f             	and    $0xf,%eax
80102b02:	c1 ea 04             	shr    $0x4,%edx
80102b05:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b08:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b0b:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
80102b0e:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102b11:	89 c2                	mov    %eax,%edx
80102b13:	83 e0 0f             	and    $0xf,%eax
80102b16:	c1 ea 04             	shr    $0x4,%edx
80102b19:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b1c:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b1f:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
80102b22:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102b25:	89 c2                	mov    %eax,%edx
80102b27:	83 e0 0f             	and    $0xf,%eax
80102b2a:	c1 ea 04             	shr    $0x4,%edx
80102b2d:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b30:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b33:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
80102b36:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102b39:	89 c2                	mov    %eax,%edx
80102b3b:	83 e0 0f             	and    $0xf,%eax
80102b3e:	c1 ea 04             	shr    $0x4,%edx
80102b41:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b44:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b47:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
80102b4a:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102b4d:	89 c2                	mov    %eax,%edx
80102b4f:	83 e0 0f             	and    $0xf,%eax
80102b52:	c1 ea 04             	shr    $0x4,%edx
80102b55:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b58:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b5b:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
80102b5e:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102b61:	89 c2                	mov    %eax,%edx
80102b63:	83 e0 0f             	and    $0xf,%eax
80102b66:	c1 ea 04             	shr    $0x4,%edx
80102b69:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b6c:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b6f:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
80102b72:	8b 75 08             	mov    0x8(%ebp),%esi
80102b75:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102b78:	89 06                	mov    %eax,(%esi)
80102b7a:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102b7d:	89 46 04             	mov    %eax,0x4(%esi)
80102b80:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102b83:	89 46 08             	mov    %eax,0x8(%esi)
80102b86:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102b89:	89 46 0c             	mov    %eax,0xc(%esi)
80102b8c:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102b8f:	89 46 10             	mov    %eax,0x10(%esi)
80102b92:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102b95:	89 46 14             	mov    %eax,0x14(%esi)
  r->year += 2000;
80102b98:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
}
80102b9f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102ba2:	5b                   	pop    %ebx
80102ba3:	5e                   	pop    %esi
80102ba4:	5f                   	pop    %edi
80102ba5:	5d                   	pop    %ebp
80102ba6:	c3                   	ret    
80102ba7:	66 90                	xchg   %ax,%ax
80102ba9:	66 90                	xchg   %ax,%ax
80102bab:	66 90                	xchg   %ax,%ax
80102bad:	66 90                	xchg   %ax,%ax
80102baf:	90                   	nop

80102bb0 <install_trans>:
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102bb0:	8b 0d 28 26 11 80    	mov    0x80112628,%ecx
80102bb6:	85 c9                	test   %ecx,%ecx
80102bb8:	0f 8e 85 00 00 00    	jle    80102c43 <install_trans+0x93>
}

// Copy committed blocks from log to their home location
static void
install_trans(void)
{
80102bbe:	55                   	push   %ebp
80102bbf:	89 e5                	mov    %esp,%ebp
80102bc1:	57                   	push   %edi
80102bc2:	56                   	push   %esi
80102bc3:	53                   	push   %ebx
80102bc4:	31 db                	xor    %ebx,%ebx
80102bc6:	83 ec 0c             	sub    $0xc,%esp
80102bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
80102bd0:	a1 14 26 11 80       	mov    0x80112614,%eax
80102bd5:	83 ec 08             	sub    $0x8,%esp
80102bd8:	01 d8                	add    %ebx,%eax
80102bda:	83 c0 01             	add    $0x1,%eax
80102bdd:	50                   	push   %eax
80102bde:	ff 35 24 26 11 80    	pushl  0x80112624
80102be4:	e8 e7 d4 ff ff       	call   801000d0 <bread>
80102be9:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102beb:	58                   	pop    %eax
80102bec:	5a                   	pop    %edx
80102bed:	ff 34 9d 2c 26 11 80 	pushl  -0x7feed9d4(,%ebx,4)
80102bf4:	ff 35 24 26 11 80    	pushl  0x80112624
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102bfa:	83 c3 01             	add    $0x1,%ebx
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102bfd:	e8 ce d4 ff ff       	call   801000d0 <bread>
80102c02:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102c04:	8d 47 5c             	lea    0x5c(%edi),%eax
80102c07:	83 c4 0c             	add    $0xc,%esp
80102c0a:	68 00 02 00 00       	push   $0x200
80102c0f:	50                   	push   %eax
80102c10:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c13:	50                   	push   %eax
80102c14:	e8 b7 1a 00 00       	call   801046d0 <memmove>
    bwrite(dbuf);  // write dst to disk
80102c19:	89 34 24             	mov    %esi,(%esp)
80102c1c:	e8 7f d5 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
80102c21:	89 3c 24             	mov    %edi,(%esp)
80102c24:	e8 b7 d5 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
80102c29:	89 34 24             	mov    %esi,(%esp)
80102c2c:	e8 af d5 ff ff       	call   801001e0 <brelse>
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102c31:	83 c4 10             	add    $0x10,%esp
80102c34:	39 1d 28 26 11 80    	cmp    %ebx,0x80112628
80102c3a:	7f 94                	jg     80102bd0 <install_trans+0x20>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    bwrite(dbuf);  // write dst to disk
    brelse(lbuf);
    brelse(dbuf);
  }
}
80102c3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102c3f:	5b                   	pop    %ebx
80102c40:	5e                   	pop    %esi
80102c41:	5f                   	pop    %edi
80102c42:	5d                   	pop    %ebp
80102c43:	f3 c3                	repz ret 
80102c45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c50 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102c50:	55                   	push   %ebp
80102c51:	89 e5                	mov    %esp,%ebp
80102c53:	53                   	push   %ebx
80102c54:	83 ec 0c             	sub    $0xc,%esp
  struct buf *buf = bread(log.dev, log.start);
80102c57:	ff 35 14 26 11 80    	pushl  0x80112614
80102c5d:	ff 35 24 26 11 80    	pushl  0x80112624
80102c63:	e8 68 d4 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102c68:	8b 0d 28 26 11 80    	mov    0x80112628,%ecx
  for (i = 0; i < log.lh.n; i++) {
80102c6e:	83 c4 10             	add    $0x10,%esp
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102c71:	89 c3                	mov    %eax,%ebx
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102c73:	85 c9                	test   %ecx,%ecx
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102c75:	89 48 5c             	mov    %ecx,0x5c(%eax)
  for (i = 0; i < log.lh.n; i++) {
80102c78:	7e 1f                	jle    80102c99 <write_head+0x49>
80102c7a:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102c81:	31 d2                	xor    %edx,%edx
80102c83:	90                   	nop
80102c84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    hb->block[i] = log.lh.block[i];
80102c88:	8b 8a 2c 26 11 80    	mov    -0x7feed9d4(%edx),%ecx
80102c8e:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102c92:	83 c2 04             	add    $0x4,%edx
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102c95:	39 c2                	cmp    %eax,%edx
80102c97:	75 ef                	jne    80102c88 <write_head+0x38>
    hb->block[i] = log.lh.block[i];
  }
  bwrite(buf);
80102c99:	83 ec 0c             	sub    $0xc,%esp
80102c9c:	53                   	push   %ebx
80102c9d:	e8 fe d4 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102ca2:	89 1c 24             	mov    %ebx,(%esp)
80102ca5:	e8 36 d5 ff ff       	call   801001e0 <brelse>
}
80102caa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102cad:	c9                   	leave  
80102cae:	c3                   	ret    
80102caf:	90                   	nop

80102cb0 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev)
{
80102cb0:	55                   	push   %ebp
80102cb1:	89 e5                	mov    %esp,%ebp
80102cb3:	53                   	push   %ebx
80102cb4:	83 ec 2c             	sub    $0x2c,%esp
80102cb7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
80102cba:	68 dc 75 10 80       	push   $0x801075dc
80102cbf:	68 e0 25 11 80       	push   $0x801125e0
80102cc4:	e8 07 17 00 00       	call   801043d0 <initlock>
  readsb(dev, &sb);
80102cc9:	58                   	pop    %eax
80102cca:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102ccd:	5a                   	pop    %edx
80102cce:	50                   	push   %eax
80102ccf:	53                   	push   %ebx
80102cd0:	e8 9b e7 ff ff       	call   80101470 <readsb>
  log.start = sb.logstart;
  log.size = sb.nlog;
80102cd5:	8b 55 e8             	mov    -0x18(%ebp),%edx
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102cd8:	8b 45 ec             	mov    -0x14(%ebp),%eax

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102cdb:	59                   	pop    %ecx
  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
80102cdc:	89 1d 24 26 11 80    	mov    %ebx,0x80112624

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
80102ce2:	89 15 18 26 11 80    	mov    %edx,0x80112618
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102ce8:	a3 14 26 11 80       	mov    %eax,0x80112614

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102ced:	5a                   	pop    %edx
80102cee:	50                   	push   %eax
80102cef:	53                   	push   %ebx
80102cf0:	e8 db d3 ff ff       	call   801000d0 <bread>
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102cf5:	8b 48 5c             	mov    0x5c(%eax),%ecx
  for (i = 0; i < log.lh.n; i++) {
80102cf8:	83 c4 10             	add    $0x10,%esp
80102cfb:	85 c9                	test   %ecx,%ecx
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102cfd:	89 0d 28 26 11 80    	mov    %ecx,0x80112628
  for (i = 0; i < log.lh.n; i++) {
80102d03:	7e 1c                	jle    80102d21 <initlog+0x71>
80102d05:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102d0c:	31 d2                	xor    %edx,%edx
80102d0e:	66 90                	xchg   %ax,%ax
    log.lh.block[i] = lh->block[i];
80102d10:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102d14:	83 c2 04             	add    $0x4,%edx
80102d17:	89 8a 28 26 11 80    	mov    %ecx,-0x7feed9d8(%edx)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
  for (i = 0; i < log.lh.n; i++) {
80102d1d:	39 da                	cmp    %ebx,%edx
80102d1f:	75 ef                	jne    80102d10 <initlog+0x60>
    log.lh.block[i] = lh->block[i];
  }
  brelse(buf);
80102d21:	83 ec 0c             	sub    $0xc,%esp
80102d24:	50                   	push   %eax
80102d25:	e8 b6 d4 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102d2a:	e8 81 fe ff ff       	call   80102bb0 <install_trans>
  log.lh.n = 0;
80102d2f:	c7 05 28 26 11 80 00 	movl   $0x0,0x80112628
80102d36:	00 00 00 
  write_head(); // clear the log
80102d39:	e8 12 ff ff ff       	call   80102c50 <write_head>
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
  recover_from_log();
}
80102d3e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102d41:	c9                   	leave  
80102d42:	c3                   	ret    
80102d43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102d49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102d50 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102d50:	55                   	push   %ebp
80102d51:	89 e5                	mov    %esp,%ebp
80102d53:	83 ec 14             	sub    $0x14,%esp
  acquire(&log.lock);
80102d56:	68 e0 25 11 80       	push   $0x801125e0
80102d5b:	e8 90 16 00 00       	call   801043f0 <acquire>
80102d60:	83 c4 10             	add    $0x10,%esp
80102d63:	eb 18                	jmp    80102d7d <begin_op+0x2d>
80102d65:	8d 76 00             	lea    0x0(%esi),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102d68:	83 ec 08             	sub    $0x8,%esp
80102d6b:	68 e0 25 11 80       	push   $0x801125e0
80102d70:	68 e0 25 11 80       	push   $0x801125e0
80102d75:	e8 f6 11 00 00       	call   80103f70 <sleep>
80102d7a:	83 c4 10             	add    $0x10,%esp
void
begin_op(void)
{
  acquire(&log.lock);
  while(1){
    if(log.committing){
80102d7d:	a1 20 26 11 80       	mov    0x80112620,%eax
80102d82:	85 c0                	test   %eax,%eax
80102d84:	75 e2                	jne    80102d68 <begin_op+0x18>
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102d86:	a1 1c 26 11 80       	mov    0x8011261c,%eax
80102d8b:	8b 15 28 26 11 80    	mov    0x80112628,%edx
80102d91:	83 c0 01             	add    $0x1,%eax
80102d94:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102d97:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102d9a:	83 fa 1e             	cmp    $0x1e,%edx
80102d9d:	7f c9                	jg     80102d68 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102d9f:	83 ec 0c             	sub    $0xc,%esp
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
80102da2:	a3 1c 26 11 80       	mov    %eax,0x8011261c
      release(&log.lock);
80102da7:	68 e0 25 11 80       	push   $0x801125e0
80102dac:	e8 1f 18 00 00       	call   801045d0 <release>
      break;
    }
  }
}
80102db1:	83 c4 10             	add    $0x10,%esp
80102db4:	c9                   	leave  
80102db5:	c3                   	ret    
80102db6:	8d 76 00             	lea    0x0(%esi),%esi
80102db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102dc0 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102dc0:	55                   	push   %ebp
80102dc1:	89 e5                	mov    %esp,%ebp
80102dc3:	57                   	push   %edi
80102dc4:	56                   	push   %esi
80102dc5:	53                   	push   %ebx
80102dc6:	83 ec 18             	sub    $0x18,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102dc9:	68 e0 25 11 80       	push   $0x801125e0
80102dce:	e8 1d 16 00 00       	call   801043f0 <acquire>
  log.outstanding -= 1;
80102dd3:	a1 1c 26 11 80       	mov    0x8011261c,%eax
  if(log.committing)
80102dd8:	8b 1d 20 26 11 80    	mov    0x80112620,%ebx
80102dde:	83 c4 10             	add    $0x10,%esp
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102de1:	83 e8 01             	sub    $0x1,%eax
  if(log.committing)
80102de4:	85 db                	test   %ebx,%ebx
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102de6:	a3 1c 26 11 80       	mov    %eax,0x8011261c
  if(log.committing)
80102deb:	0f 85 23 01 00 00    	jne    80102f14 <end_op+0x154>
    panic("log.committing");
  if(log.outstanding == 0){
80102df1:	85 c0                	test   %eax,%eax
80102df3:	0f 85 f7 00 00 00    	jne    80102ef0 <end_op+0x130>
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
  }
  release(&log.lock);
80102df9:	83 ec 0c             	sub    $0xc,%esp
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
  if(log.outstanding == 0){
    do_commit = 1;
    log.committing = 1;
80102dfc:	c7 05 20 26 11 80 01 	movl   $0x1,0x80112620
80102e03:	00 00 00 
}

static void
commit()
{
  if (log.lh.n > 0) {
80102e06:	31 db                	xor    %ebx,%ebx
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
  }
  release(&log.lock);
80102e08:	68 e0 25 11 80       	push   $0x801125e0
80102e0d:	e8 be 17 00 00       	call   801045d0 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102e12:	8b 0d 28 26 11 80    	mov    0x80112628,%ecx
80102e18:	83 c4 10             	add    $0x10,%esp
80102e1b:	85 c9                	test   %ecx,%ecx
80102e1d:	0f 8e 8a 00 00 00    	jle    80102ead <end_op+0xed>
80102e23:	90                   	nop
80102e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102e28:	a1 14 26 11 80       	mov    0x80112614,%eax
80102e2d:	83 ec 08             	sub    $0x8,%esp
80102e30:	01 d8                	add    %ebx,%eax
80102e32:	83 c0 01             	add    $0x1,%eax
80102e35:	50                   	push   %eax
80102e36:	ff 35 24 26 11 80    	pushl  0x80112624
80102e3c:	e8 8f d2 ff ff       	call   801000d0 <bread>
80102e41:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102e43:	58                   	pop    %eax
80102e44:	5a                   	pop    %edx
80102e45:	ff 34 9d 2c 26 11 80 	pushl  -0x7feed9d4(,%ebx,4)
80102e4c:	ff 35 24 26 11 80    	pushl  0x80112624
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102e52:	83 c3 01             	add    $0x1,%ebx
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102e55:	e8 76 d2 ff ff       	call   801000d0 <bread>
80102e5a:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102e5c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102e5f:	83 c4 0c             	add    $0xc,%esp
80102e62:	68 00 02 00 00       	push   $0x200
80102e67:	50                   	push   %eax
80102e68:	8d 46 5c             	lea    0x5c(%esi),%eax
80102e6b:	50                   	push   %eax
80102e6c:	e8 5f 18 00 00       	call   801046d0 <memmove>
    bwrite(to);  // write the log
80102e71:	89 34 24             	mov    %esi,(%esp)
80102e74:	e8 27 d3 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102e79:	89 3c 24             	mov    %edi,(%esp)
80102e7c:	e8 5f d3 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102e81:	89 34 24             	mov    %esi,(%esp)
80102e84:	e8 57 d3 ff ff       	call   801001e0 <brelse>
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102e89:	83 c4 10             	add    $0x10,%esp
80102e8c:	3b 1d 28 26 11 80    	cmp    0x80112628,%ebx
80102e92:	7c 94                	jl     80102e28 <end_op+0x68>
static void
commit()
{
  if (log.lh.n > 0) {
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102e94:	e8 b7 fd ff ff       	call   80102c50 <write_head>
    install_trans(); // Now install writes to home locations
80102e99:	e8 12 fd ff ff       	call   80102bb0 <install_trans>
    log.lh.n = 0;
80102e9e:	c7 05 28 26 11 80 00 	movl   $0x0,0x80112628
80102ea5:	00 00 00 
    write_head();    // Erase the transaction from the log
80102ea8:	e8 a3 fd ff ff       	call   80102c50 <write_head>

  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
80102ead:	83 ec 0c             	sub    $0xc,%esp
80102eb0:	68 e0 25 11 80       	push   $0x801125e0
80102eb5:	e8 36 15 00 00       	call   801043f0 <acquire>
    log.committing = 0;
    wakeup(&log);
80102eba:	c7 04 24 e0 25 11 80 	movl   $0x801125e0,(%esp)
  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
    log.committing = 0;
80102ec1:	c7 05 20 26 11 80 00 	movl   $0x0,0x80112620
80102ec8:	00 00 00 
    wakeup(&log);
80102ecb:	e8 40 12 00 00       	call   80104110 <wakeup>
    release(&log.lock);
80102ed0:	c7 04 24 e0 25 11 80 	movl   $0x801125e0,(%esp)
80102ed7:	e8 f4 16 00 00       	call   801045d0 <release>
80102edc:	83 c4 10             	add    $0x10,%esp
  }
}
80102edf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102ee2:	5b                   	pop    %ebx
80102ee3:	5e                   	pop    %esi
80102ee4:	5f                   	pop    %edi
80102ee5:	5d                   	pop    %ebp
80102ee6:	c3                   	ret    
80102ee7:	89 f6                	mov    %esi,%esi
80102ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(log.outstanding == 0){
    do_commit = 1;
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
80102ef0:	83 ec 0c             	sub    $0xc,%esp
80102ef3:	68 e0 25 11 80       	push   $0x801125e0
80102ef8:	e8 13 12 00 00       	call   80104110 <wakeup>
  }
  release(&log.lock);
80102efd:	c7 04 24 e0 25 11 80 	movl   $0x801125e0,(%esp)
80102f04:	e8 c7 16 00 00       	call   801045d0 <release>
80102f09:	83 c4 10             	add    $0x10,%esp
    acquire(&log.lock);
    log.committing = 0;
    wakeup(&log);
    release(&log.lock);
  }
}
80102f0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102f0f:	5b                   	pop    %ebx
80102f10:	5e                   	pop    %esi
80102f11:	5f                   	pop    %edi
80102f12:	5d                   	pop    %ebp
80102f13:	c3                   	ret    
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
80102f14:	83 ec 0c             	sub    $0xc,%esp
80102f17:	68 e0 75 10 80       	push   $0x801075e0
80102f1c:	e8 4f d4 ff ff       	call   80100370 <panic>
80102f21:	eb 0d                	jmp    80102f30 <log_write>
80102f23:	90                   	nop
80102f24:	90                   	nop
80102f25:	90                   	nop
80102f26:	90                   	nop
80102f27:	90                   	nop
80102f28:	90                   	nop
80102f29:	90                   	nop
80102f2a:	90                   	nop
80102f2b:	90                   	nop
80102f2c:	90                   	nop
80102f2d:	90                   	nop
80102f2e:	90                   	nop
80102f2f:	90                   	nop

80102f30 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102f30:	55                   	push   %ebp
80102f31:	89 e5                	mov    %esp,%ebp
80102f33:	53                   	push   %ebx
80102f34:	83 ec 04             	sub    $0x4,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102f37:	8b 15 28 26 11 80    	mov    0x80112628,%edx
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102f3d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102f40:	83 fa 1d             	cmp    $0x1d,%edx
80102f43:	0f 8f 97 00 00 00    	jg     80102fe0 <log_write+0xb0>
80102f49:	a1 18 26 11 80       	mov    0x80112618,%eax
80102f4e:	83 e8 01             	sub    $0x1,%eax
80102f51:	39 c2                	cmp    %eax,%edx
80102f53:	0f 8d 87 00 00 00    	jge    80102fe0 <log_write+0xb0>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102f59:	a1 1c 26 11 80       	mov    0x8011261c,%eax
80102f5e:	85 c0                	test   %eax,%eax
80102f60:	0f 8e 87 00 00 00    	jle    80102fed <log_write+0xbd>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102f66:	83 ec 0c             	sub    $0xc,%esp
80102f69:	68 e0 25 11 80       	push   $0x801125e0
80102f6e:	e8 7d 14 00 00       	call   801043f0 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102f73:	8b 15 28 26 11 80    	mov    0x80112628,%edx
80102f79:	83 c4 10             	add    $0x10,%esp
80102f7c:	83 fa 00             	cmp    $0x0,%edx
80102f7f:	7e 50                	jle    80102fd1 <log_write+0xa1>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102f81:	8b 4b 08             	mov    0x8(%ebx),%ecx
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102f84:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102f86:	3b 0d 2c 26 11 80    	cmp    0x8011262c,%ecx
80102f8c:	75 0b                	jne    80102f99 <log_write+0x69>
80102f8e:	eb 38                	jmp    80102fc8 <log_write+0x98>
80102f90:	39 0c 85 2c 26 11 80 	cmp    %ecx,-0x7feed9d4(,%eax,4)
80102f97:	74 2f                	je     80102fc8 <log_write+0x98>
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102f99:	83 c0 01             	add    $0x1,%eax
80102f9c:	39 d0                	cmp    %edx,%eax
80102f9e:	75 f0                	jne    80102f90 <log_write+0x60>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102fa0:	89 0c 95 2c 26 11 80 	mov    %ecx,-0x7feed9d4(,%edx,4)
  if (i == log.lh.n)
    log.lh.n++;
80102fa7:	83 c2 01             	add    $0x1,%edx
80102faa:	89 15 28 26 11 80    	mov    %edx,0x80112628
  b->flags |= B_DIRTY; // prevent eviction
80102fb0:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102fb3:	c7 45 08 e0 25 11 80 	movl   $0x801125e0,0x8(%ebp)
}
80102fba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102fbd:	c9                   	leave  
  }
  log.lh.block[i] = b->blockno;
  if (i == log.lh.n)
    log.lh.n++;
  b->flags |= B_DIRTY; // prevent eviction
  release(&log.lock);
80102fbe:	e9 0d 16 00 00       	jmp    801045d0 <release>
80102fc3:	90                   	nop
80102fc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102fc8:	89 0c 85 2c 26 11 80 	mov    %ecx,-0x7feed9d4(,%eax,4)
80102fcf:	eb df                	jmp    80102fb0 <log_write+0x80>
80102fd1:	8b 43 08             	mov    0x8(%ebx),%eax
80102fd4:	a3 2c 26 11 80       	mov    %eax,0x8011262c
  if (i == log.lh.n)
80102fd9:	75 d5                	jne    80102fb0 <log_write+0x80>
80102fdb:	eb ca                	jmp    80102fa7 <log_write+0x77>
80102fdd:	8d 76 00             	lea    0x0(%esi),%esi
log_write(struct buf *b)
{
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    panic("too big a transaction");
80102fe0:	83 ec 0c             	sub    $0xc,%esp
80102fe3:	68 ef 75 10 80       	push   $0x801075ef
80102fe8:	e8 83 d3 ff ff       	call   80100370 <panic>
  if (log.outstanding < 1)
    panic("log_write outside of trans");
80102fed:	83 ec 0c             	sub    $0xc,%esp
80102ff0:	68 05 76 10 80       	push   $0x80107605
80102ff5:	e8 76 d3 ff ff       	call   80100370 <panic>
80102ffa:	66 90                	xchg   %ax,%ax
80102ffc:	66 90                	xchg   %ax,%ax
80102ffe:	66 90                	xchg   %ax,%ax

80103000 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80103000:	55                   	push   %ebp
80103001:	89 e5                	mov    %esp,%ebp
80103003:	83 ec 08             	sub    $0x8,%esp
  cprintf("cpu%d: starting\n", cpunum());
80103006:	e8 65 f8 ff ff       	call   80102870 <cpunum>
8010300b:	83 ec 08             	sub    $0x8,%esp
8010300e:	50                   	push   %eax
8010300f:	68 20 76 10 80       	push   $0x80107620
80103014:	e8 47 d6 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80103019:	e8 32 29 00 00       	call   80105950 <idtinit>
  xchg(&cpu->started, 1); // tell startothers() we're up
8010301e:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80103025:	b8 01 00 00 00       	mov    $0x1,%eax
8010302a:	f0 87 82 a8 00 00 00 	lock xchg %eax,0xa8(%edx)
  scheduler();     // start running processes
80103031:	e8 5a 0c 00 00       	call   80103c90 <scheduler>
80103036:	8d 76 00             	lea    0x0(%esi),%esi
80103039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103040 <mpenter>:
}

// Other CPUs jump here from entryother.S.
static void
mpenter(void)
{
80103040:	55                   	push   %ebp
80103041:	89 e5                	mov    %esp,%ebp
80103043:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80103046:	e8 15 3b 00 00       	call   80106b60 <switchkvm>
  seginit();
8010304b:	e8 30 39 00 00       	call   80106980 <seginit>
  lapicinit();
80103050:	e8 1b f7 ff ff       	call   80102770 <lapicinit>
  mpmain();
80103055:	e8 a6 ff ff ff       	call   80103000 <mpmain>
8010305a:	66 90                	xchg   %ax,%ax
8010305c:	66 90                	xchg   %ax,%ax
8010305e:	66 90                	xchg   %ax,%ax

80103060 <main>:
// Bootstrap processor starts running C code here.
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
80103060:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80103064:	83 e4 f0             	and    $0xfffffff0,%esp
80103067:	ff 71 fc             	pushl  -0x4(%ecx)
8010306a:	55                   	push   %ebp
8010306b:	89 e5                	mov    %esp,%ebp
8010306d:	53                   	push   %ebx
8010306e:	51                   	push   %ecx
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
8010306f:	83 ec 08             	sub    $0x8,%esp
80103072:	68 00 00 40 80       	push   $0x80400000
80103077:	68 68 54 11 80       	push   $0x80115468
8010307c:	e8 bf f4 ff ff       	call   80102540 <kinit1>
  kvmalloc();      // kernel page table
80103081:	e8 ba 3a 00 00       	call   80106b40 <kvmalloc>
  mpinit();        // detect other processors
80103086:	e8 b5 01 00 00       	call   80103240 <mpinit>
  lapicinit();     // interrupt controller
8010308b:	e8 e0 f6 ff ff       	call   80102770 <lapicinit>
  seginit();       // segment descriptors
80103090:	e8 eb 38 00 00       	call   80106980 <seginit>
  cprintf("\ncpu%d: starting xv6\n\n", cpunum());
80103095:	e8 d6 f7 ff ff       	call   80102870 <cpunum>
8010309a:	5a                   	pop    %edx
8010309b:	59                   	pop    %ecx
8010309c:	50                   	push   %eax
8010309d:	68 31 76 10 80       	push   $0x80107631
801030a2:	e8 b9 d5 ff ff       	call   80100660 <cprintf>
  picinit();       // another interrupt controller
801030a7:	e8 a4 03 00 00       	call   80103450 <picinit>
  ioapicinit();    // another interrupt controller
801030ac:	e8 af f2 ff ff       	call   80102360 <ioapicinit>
  consoleinit();   // console hardware
801030b1:	e8 ea d8 ff ff       	call   801009a0 <consoleinit>
  uartinit();      // serial port
801030b6:	e8 95 2b 00 00       	call   80105c50 <uartinit>
  pinit();         // process table
801030bb:	e8 30 09 00 00       	call   801039f0 <pinit>
  tvinit();        // trap vectors
801030c0:	e8 eb 27 00 00       	call   801058b0 <tvinit>
  binit();         // buffer cache
801030c5:	e8 76 cf ff ff       	call   80100040 <binit>
  fileinit();      // file table
801030ca:	e8 71 dc ff ff       	call   80100d40 <fileinit>
  ideinit();       // disk
801030cf:	e8 5c f0 ff ff       	call   80102130 <ideinit>
  if(!ismp)
801030d4:	8b 1d c4 26 11 80    	mov    0x801126c4,%ebx
801030da:	83 c4 10             	add    $0x10,%esp
801030dd:	85 db                	test   %ebx,%ebx
801030df:	0f 84 ca 00 00 00    	je     801031af <main+0x14f>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
801030e5:	83 ec 04             	sub    $0x4,%esp

  for(c = cpus; c < cpus+ncpu; c++){
801030e8:	bb e0 26 11 80       	mov    $0x801126e0,%ebx

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
801030ed:	68 8a 00 00 00       	push   $0x8a
801030f2:	68 8c a4 10 80       	push   $0x8010a48c
801030f7:	68 00 70 00 80       	push   $0x80007000
801030fc:	e8 cf 15 00 00       	call   801046d0 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80103101:	69 05 c0 2c 11 80 bc 	imul   $0xbc,0x80112cc0,%eax
80103108:	00 00 00 
8010310b:	83 c4 10             	add    $0x10,%esp
8010310e:	05 e0 26 11 80       	add    $0x801126e0,%eax
80103113:	39 d8                	cmp    %ebx,%eax
80103115:	76 7c                	jbe    80103193 <main+0x133>
80103117:	89 f6                	mov    %esi,%esi
80103119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c == cpus+cpunum())  // We've started already.
80103120:	e8 4b f7 ff ff       	call   80102870 <cpunum>
80103125:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
8010312b:	05 e0 26 11 80       	add    $0x801126e0,%eax
80103130:	39 c3                	cmp    %eax,%ebx
80103132:	74 46                	je     8010317a <main+0x11a>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80103134:	e8 d7 f4 ff ff       	call   80102610 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
    *(void**)(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
80103139:	83 ec 08             	sub    $0x8,%esp

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
8010313c:	05 00 10 00 00       	add    $0x1000,%eax
    *(void**)(code-8) = mpenter;
80103141:	c7 05 f8 6f 00 80 40 	movl   $0x80103040,0x80006ff8
80103148:	30 10 80 

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
8010314b:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    *(void**)(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80103150:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80103157:	90 10 00 

    lapicstartap(c->apicid, V2P(code));
8010315a:	68 00 70 00 00       	push   $0x7000
8010315f:	0f b6 03             	movzbl (%ebx),%eax
80103162:	50                   	push   %eax
80103163:	e8 d8 f7 ff ff       	call   80102940 <lapicstartap>
80103168:	83 c4 10             	add    $0x10,%esp
8010316b:	90                   	nop
8010316c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80103170:	8b 83 a8 00 00 00    	mov    0xa8(%ebx),%eax
80103176:	85 c0                	test   %eax,%eax
80103178:	74 f6                	je     80103170 <main+0x110>
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
8010317a:	69 05 c0 2c 11 80 bc 	imul   $0xbc,0x80112cc0,%eax
80103181:	00 00 00 
80103184:	81 c3 bc 00 00 00    	add    $0xbc,%ebx
8010318a:	05 e0 26 11 80       	add    $0x801126e0,%eax
8010318f:	39 c3                	cmp    %eax,%ebx
80103191:	72 8d                	jb     80103120 <main+0xc0>
  fileinit();      // file table
  ideinit();       // disk
  if(!ismp)
    timerinit();   // uniprocessor timer
  startothers();   // start other processors
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80103193:	83 ec 08             	sub    $0x8,%esp
80103196:	68 00 00 00 8e       	push   $0x8e000000
8010319b:	68 00 00 40 80       	push   $0x80400000
801031a0:	e8 0b f4 ff ff       	call   801025b0 <kinit2>
  userinit();      // first user process
801031a5:	e8 66 08 00 00       	call   80103a10 <userinit>
  mpmain();        // finish this processor's setup
801031aa:	e8 51 fe ff ff       	call   80103000 <mpmain>
  tvinit();        // trap vectors
  binit();         // buffer cache
  fileinit();      // file table
  ideinit();       // disk
  if(!ismp)
    timerinit();   // uniprocessor timer
801031af:	e8 9c 26 00 00       	call   80105850 <timerinit>
801031b4:	e9 2c ff ff ff       	jmp    801030e5 <main+0x85>
801031b9:	66 90                	xchg   %ax,%ax
801031bb:	66 90                	xchg   %ax,%ax
801031bd:	66 90                	xchg   %ax,%ax
801031bf:	90                   	nop

801031c0 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
801031c0:	55                   	push   %ebp
801031c1:	89 e5                	mov    %esp,%ebp
801031c3:	57                   	push   %edi
801031c4:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
801031c5:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
801031cb:	53                   	push   %ebx
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
801031cc:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
801031cf:	83 ec 0c             	sub    $0xc,%esp
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
801031d2:	39 de                	cmp    %ebx,%esi
801031d4:	73 48                	jae    8010321e <mpsearch1+0x5e>
801031d6:	8d 76 00             	lea    0x0(%esi),%esi
801031d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
801031e0:	83 ec 04             	sub    $0x4,%esp
801031e3:	8d 7e 10             	lea    0x10(%esi),%edi
801031e6:	6a 04                	push   $0x4
801031e8:	68 48 76 10 80       	push   $0x80107648
801031ed:	56                   	push   %esi
801031ee:	e8 7d 14 00 00       	call   80104670 <memcmp>
801031f3:	83 c4 10             	add    $0x10,%esp
801031f6:	85 c0                	test   %eax,%eax
801031f8:	75 1e                	jne    80103218 <mpsearch1+0x58>
801031fa:	8d 7e 10             	lea    0x10(%esi),%edi
801031fd:	89 f2                	mov    %esi,%edx
801031ff:	31 c9                	xor    %ecx,%ecx
80103201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
    sum += addr[i];
80103208:	0f b6 02             	movzbl (%edx),%eax
8010320b:	83 c2 01             	add    $0x1,%edx
8010320e:	01 c1                	add    %eax,%ecx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80103210:	39 fa                	cmp    %edi,%edx
80103212:	75 f4                	jne    80103208 <mpsearch1+0x48>
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80103214:	84 c9                	test   %cl,%cl
80103216:	74 10                	je     80103228 <mpsearch1+0x68>
{
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80103218:	39 fb                	cmp    %edi,%ebx
8010321a:	89 fe                	mov    %edi,%esi
8010321c:	77 c2                	ja     801031e0 <mpsearch1+0x20>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
}
8010321e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
80103221:	31 c0                	xor    %eax,%eax
}
80103223:	5b                   	pop    %ebx
80103224:	5e                   	pop    %esi
80103225:	5f                   	pop    %edi
80103226:	5d                   	pop    %ebp
80103227:	c3                   	ret    
80103228:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010322b:	89 f0                	mov    %esi,%eax
8010322d:	5b                   	pop    %ebx
8010322e:	5e                   	pop    %esi
8010322f:	5f                   	pop    %edi
80103230:	5d                   	pop    %ebp
80103231:	c3                   	ret    
80103232:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103240 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80103240:	55                   	push   %ebp
80103241:	89 e5                	mov    %esp,%ebp
80103243:	57                   	push   %edi
80103244:	56                   	push   %esi
80103245:	53                   	push   %ebx
80103246:	83 ec 1c             	sub    $0x1c,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80103249:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103250:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103257:	c1 e0 08             	shl    $0x8,%eax
8010325a:	09 d0                	or     %edx,%eax
8010325c:	c1 e0 04             	shl    $0x4,%eax
8010325f:	85 c0                	test   %eax,%eax
80103261:	75 1b                	jne    8010327e <mpinit+0x3e>
    if((mp = mpsearch1(p, 1024)))
      return mp;
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
80103263:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010326a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103271:	c1 e0 08             	shl    $0x8,%eax
80103274:	09 d0                	or     %edx,%eax
80103276:	c1 e0 0a             	shl    $0xa,%eax
80103279:	2d 00 04 00 00       	sub    $0x400,%eax
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
    if((mp = mpsearch1(p, 1024)))
8010327e:	ba 00 04 00 00       	mov    $0x400,%edx
80103283:	e8 38 ff ff ff       	call   801031c0 <mpsearch1>
80103288:	85 c0                	test   %eax,%eax
8010328a:	89 c6                	mov    %eax,%esi
8010328c:	0f 84 66 01 00 00    	je     801033f8 <mpinit+0x1b8>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103292:	8b 5e 04             	mov    0x4(%esi),%ebx
80103295:	85 db                	test   %ebx,%ebx
80103297:	0f 84 d6 00 00 00    	je     80103373 <mpinit+0x133>
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
8010329d:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
  if(memcmp(conf, "PCMP", 4) != 0)
801032a3:	83 ec 04             	sub    $0x4,%esp
801032a6:	6a 04                	push   $0x4
801032a8:	68 4d 76 10 80       	push   $0x8010764d
801032ad:	50                   	push   %eax
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
801032ae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
801032b1:	e8 ba 13 00 00       	call   80104670 <memcmp>
801032b6:	83 c4 10             	add    $0x10,%esp
801032b9:	85 c0                	test   %eax,%eax
801032bb:	0f 85 b2 00 00 00    	jne    80103373 <mpinit+0x133>
    return 0;
  if(conf->version != 1 && conf->version != 4)
801032c1:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
801032c8:	3c 01                	cmp    $0x1,%al
801032ca:	74 08                	je     801032d4 <mpinit+0x94>
801032cc:	3c 04                	cmp    $0x4,%al
801032ce:	0f 85 9f 00 00 00    	jne    80103373 <mpinit+0x133>
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
801032d4:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801032db:	85 ff                	test   %edi,%edi
801032dd:	74 1e                	je     801032fd <mpinit+0xbd>
801032df:	31 d2                	xor    %edx,%edx
801032e1:	31 c0                	xor    %eax,%eax
801032e3:	90                   	nop
801032e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sum += addr[i];
801032e8:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
801032ef:	80 
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801032f0:	83 c0 01             	add    $0x1,%eax
    sum += addr[i];
801032f3:	01 ca                	add    %ecx,%edx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801032f5:	39 c7                	cmp    %eax,%edi
801032f7:	75 ef                	jne    801032e8 <mpinit+0xa8>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
801032f9:	84 d2                	test   %dl,%dl
801032fb:	75 76                	jne    80103373 <mpinit+0x133>
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
801032fd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103300:	85 ff                	test   %edi,%edi
80103302:	74 6f                	je     80103373 <mpinit+0x133>
    return;
  ismp = 1;
80103304:	c7 05 c4 26 11 80 01 	movl   $0x1,0x801126c4
8010330b:	00 00 00 
  lapic = (uint*)conf->lapicaddr;
8010330e:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
80103314:	a3 dc 25 11 80       	mov    %eax,0x801125dc
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103319:	0f b7 8b 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%ecx
80103320:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
80103326:	01 f9                	add    %edi,%ecx
80103328:	39 c8                	cmp    %ecx,%eax
8010332a:	0f 83 a0 00 00 00    	jae    801033d0 <mpinit+0x190>
    switch(*p){
80103330:	80 38 04             	cmpb   $0x4,(%eax)
80103333:	0f 87 87 00 00 00    	ja     801033c0 <mpinit+0x180>
80103339:	0f b6 10             	movzbl (%eax),%edx
8010333c:	ff 24 95 54 76 10 80 	jmp    *-0x7fef89ac(,%edx,4)
80103343:	90                   	nop
80103344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103348:	83 c0 08             	add    $0x8,%eax

  if((conf = mpconfig(&mp)) == 0)
    return;
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
8010334b:	39 c1                	cmp    %eax,%ecx
8010334d:	77 e1                	ja     80103330 <mpinit+0xf0>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp){
8010334f:	a1 c4 26 11 80       	mov    0x801126c4,%eax
80103354:	85 c0                	test   %eax,%eax
80103356:	75 78                	jne    801033d0 <mpinit+0x190>
    // Didn't like what we found; fall back to no MP.
    ncpu = 1;
80103358:	c7 05 c0 2c 11 80 01 	movl   $0x1,0x80112cc0
8010335f:	00 00 00 
    lapic = 0;
80103362:	c7 05 dc 25 11 80 00 	movl   $0x0,0x801125dc
80103369:	00 00 00 
    ioapicid = 0;
8010336c:	c6 05 c0 26 11 80 00 	movb   $0x0,0x801126c0
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
80103373:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103376:	5b                   	pop    %ebx
80103377:	5e                   	pop    %esi
80103378:	5f                   	pop    %edi
80103379:	5d                   	pop    %ebp
8010337a:	c3                   	ret    
8010337b:	90                   	nop
8010337c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
80103380:	8b 15 c0 2c 11 80    	mov    0x80112cc0,%edx
80103386:	83 fa 07             	cmp    $0x7,%edx
80103389:	7f 19                	jg     801033a4 <mpinit+0x164>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
8010338b:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
8010338f:	69 fa bc 00 00 00    	imul   $0xbc,%edx,%edi
        ncpu++;
80103395:	83 c2 01             	add    $0x1,%edx
80103398:	89 15 c0 2c 11 80    	mov    %edx,0x80112cc0
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
8010339e:	88 9f e0 26 11 80    	mov    %bl,-0x7feed920(%edi)
        ncpu++;
      }
      p += sizeof(struct mpproc);
801033a4:	83 c0 14             	add    $0x14,%eax
      continue;
801033a7:	eb a2                	jmp    8010334b <mpinit+0x10b>
801033a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
801033b0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
801033b4:	83 c0 08             	add    $0x8,%eax
      }
      p += sizeof(struct mpproc);
      continue;
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
801033b7:	88 15 c0 26 11 80    	mov    %dl,0x801126c0
      p += sizeof(struct mpioapic);
      continue;
801033bd:	eb 8c                	jmp    8010334b <mpinit+0x10b>
801033bf:	90                   	nop
    case MPIOINTR:
    case MPLINTR:
      p += 8;
      continue;
    default:
      ismp = 0;
801033c0:	c7 05 c4 26 11 80 00 	movl   $0x0,0x801126c4
801033c7:	00 00 00 
      break;
801033ca:	e9 7c ff ff ff       	jmp    8010334b <mpinit+0x10b>
801033cf:	90                   	nop
    lapic = 0;
    ioapicid = 0;
    return;
  }

  if(mp->imcrp){
801033d0:	80 7e 0c 00          	cmpb   $0x0,0xc(%esi)
801033d4:	74 9d                	je     80103373 <mpinit+0x133>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801033d6:	ba 22 00 00 00       	mov    $0x22,%edx
801033db:	b8 70 00 00 00       	mov    $0x70,%eax
801033e0:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801033e1:	ba 23 00 00 00       	mov    $0x23,%edx
801033e6:	ec                   	in     (%dx),%al
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801033e7:	83 c8 01             	or     $0x1,%eax
801033ea:	ee                   	out    %al,(%dx)
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
801033eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801033ee:	5b                   	pop    %ebx
801033ef:	5e                   	pop    %esi
801033f0:	5f                   	pop    %edi
801033f1:	5d                   	pop    %ebp
801033f2:	c3                   	ret    
801033f3:	90                   	nop
801033f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
801033f8:	ba 00 00 01 00       	mov    $0x10000,%edx
801033fd:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80103402:	e8 b9 fd ff ff       	call   801031c0 <mpsearch1>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103407:	85 c0                	test   %eax,%eax
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
80103409:	89 c6                	mov    %eax,%esi
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
8010340b:	0f 85 81 fe ff ff    	jne    80103292 <mpinit+0x52>
80103411:	e9 5d ff ff ff       	jmp    80103373 <mpinit+0x133>
80103416:	66 90                	xchg   %ax,%ax
80103418:	66 90                	xchg   %ax,%ax
8010341a:	66 90                	xchg   %ax,%ax
8010341c:	66 90                	xchg   %ax,%ax
8010341e:	66 90                	xchg   %ax,%ax

80103420 <picenable>:
  outb(IO_PIC2+1, mask >> 8);
}

void
picenable(int irq)
{
80103420:	55                   	push   %ebp
  picsetmask(irqmask & ~(1<<irq));
80103421:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
80103426:	ba 21 00 00 00       	mov    $0x21,%edx
  outb(IO_PIC2+1, mask >> 8);
}

void
picenable(int irq)
{
8010342b:	89 e5                	mov    %esp,%ebp
  picsetmask(irqmask & ~(1<<irq));
8010342d:	8b 4d 08             	mov    0x8(%ebp),%ecx
80103430:	d3 c0                	rol    %cl,%eax
80103432:	66 23 05 00 a0 10 80 	and    0x8010a000,%ax
static ushort irqmask = 0xFFFF & ~(1<<IRQ_SLAVE);

static void
picsetmask(ushort mask)
{
  irqmask = mask;
80103439:	66 a3 00 a0 10 80    	mov    %ax,0x8010a000
8010343f:	ee                   	out    %al,(%dx)
80103440:	ba a1 00 00 00       	mov    $0xa1,%edx
80103445:	66 c1 e8 08          	shr    $0x8,%ax
80103449:	ee                   	out    %al,(%dx)

void
picenable(int irq)
{
  picsetmask(irqmask & ~(1<<irq));
}
8010344a:	5d                   	pop    %ebp
8010344b:	c3                   	ret    
8010344c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103450 <picinit>:

// Initialize the 8259A interrupt controllers.
void
picinit(void)
{
80103450:	55                   	push   %ebp
80103451:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103456:	89 e5                	mov    %esp,%ebp
80103458:	57                   	push   %edi
80103459:	56                   	push   %esi
8010345a:	53                   	push   %ebx
8010345b:	bb 21 00 00 00       	mov    $0x21,%ebx
80103460:	89 da                	mov    %ebx,%edx
80103462:	ee                   	out    %al,(%dx)
80103463:	b9 a1 00 00 00       	mov    $0xa1,%ecx
80103468:	89 ca                	mov    %ecx,%edx
8010346a:	ee                   	out    %al,(%dx)
8010346b:	bf 11 00 00 00       	mov    $0x11,%edi
80103470:	be 20 00 00 00       	mov    $0x20,%esi
80103475:	89 f8                	mov    %edi,%eax
80103477:	89 f2                	mov    %esi,%edx
80103479:	ee                   	out    %al,(%dx)
8010347a:	b8 20 00 00 00       	mov    $0x20,%eax
8010347f:	89 da                	mov    %ebx,%edx
80103481:	ee                   	out    %al,(%dx)
80103482:	b8 04 00 00 00       	mov    $0x4,%eax
80103487:	ee                   	out    %al,(%dx)
80103488:	b8 03 00 00 00       	mov    $0x3,%eax
8010348d:	ee                   	out    %al,(%dx)
8010348e:	bb a0 00 00 00       	mov    $0xa0,%ebx
80103493:	89 f8                	mov    %edi,%eax
80103495:	89 da                	mov    %ebx,%edx
80103497:	ee                   	out    %al,(%dx)
80103498:	b8 28 00 00 00       	mov    $0x28,%eax
8010349d:	89 ca                	mov    %ecx,%edx
8010349f:	ee                   	out    %al,(%dx)
801034a0:	b8 02 00 00 00       	mov    $0x2,%eax
801034a5:	ee                   	out    %al,(%dx)
801034a6:	b8 03 00 00 00       	mov    $0x3,%eax
801034ab:	ee                   	out    %al,(%dx)
801034ac:	bf 68 00 00 00       	mov    $0x68,%edi
801034b1:	89 f2                	mov    %esi,%edx
801034b3:	89 f8                	mov    %edi,%eax
801034b5:	ee                   	out    %al,(%dx)
801034b6:	b9 0a 00 00 00       	mov    $0xa,%ecx
801034bb:	89 c8                	mov    %ecx,%eax
801034bd:	ee                   	out    %al,(%dx)
801034be:	89 f8                	mov    %edi,%eax
801034c0:	89 da                	mov    %ebx,%edx
801034c2:	ee                   	out    %al,(%dx)
801034c3:	89 c8                	mov    %ecx,%eax
801034c5:	ee                   	out    %al,(%dx)
  outb(IO_PIC1, 0x0a);             // read IRR by default

  outb(IO_PIC2, 0x68);             // OCW3
  outb(IO_PIC2, 0x0a);             // OCW3

  if(irqmask != 0xFFFF)
801034c6:	0f b7 05 00 a0 10 80 	movzwl 0x8010a000,%eax
801034cd:	66 83 f8 ff          	cmp    $0xffff,%ax
801034d1:	74 10                	je     801034e3 <picinit+0x93>
801034d3:	ba 21 00 00 00       	mov    $0x21,%edx
801034d8:	ee                   	out    %al,(%dx)
801034d9:	ba a1 00 00 00       	mov    $0xa1,%edx
801034de:	66 c1 e8 08          	shr    $0x8,%ax
801034e2:	ee                   	out    %al,(%dx)
    picsetmask(irqmask);
}
801034e3:	5b                   	pop    %ebx
801034e4:	5e                   	pop    %esi
801034e5:	5f                   	pop    %edi
801034e6:	5d                   	pop    %ebp
801034e7:	c3                   	ret    
801034e8:	66 90                	xchg   %ax,%ax
801034ea:	66 90                	xchg   %ax,%ax
801034ec:	66 90                	xchg   %ax,%ax
801034ee:	66 90                	xchg   %ax,%ax

801034f0 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
801034f0:	55                   	push   %ebp
801034f1:	89 e5                	mov    %esp,%ebp
801034f3:	57                   	push   %edi
801034f4:	56                   	push   %esi
801034f5:	53                   	push   %ebx
801034f6:	83 ec 0c             	sub    $0xc,%esp
801034f9:	8b 75 08             	mov    0x8(%ebp),%esi
801034fc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
801034ff:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103505:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
8010350b:	e8 50 d8 ff ff       	call   80100d60 <filealloc>
80103510:	85 c0                	test   %eax,%eax
80103512:	89 06                	mov    %eax,(%esi)
80103514:	0f 84 a8 00 00 00    	je     801035c2 <pipealloc+0xd2>
8010351a:	e8 41 d8 ff ff       	call   80100d60 <filealloc>
8010351f:	85 c0                	test   %eax,%eax
80103521:	89 03                	mov    %eax,(%ebx)
80103523:	0f 84 87 00 00 00    	je     801035b0 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80103529:	e8 e2 f0 ff ff       	call   80102610 <kalloc>
8010352e:	85 c0                	test   %eax,%eax
80103530:	89 c7                	mov    %eax,%edi
80103532:	0f 84 b0 00 00 00    	je     801035e8 <pipealloc+0xf8>
    goto bad;
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
80103538:	83 ec 08             	sub    $0x8,%esp
  *f0 = *f1 = 0;
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
    goto bad;
  p->readopen = 1;
8010353b:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103542:	00 00 00 
  p->writeopen = 1;
80103545:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010354c:	00 00 00 
  p->nwrite = 0;
8010354f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103556:	00 00 00 
  p->nread = 0;
80103559:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103560:	00 00 00 
  initlock(&p->lock, "pipe");
80103563:	68 68 76 10 80       	push   $0x80107668
80103568:	50                   	push   %eax
80103569:	e8 62 0e 00 00       	call   801043d0 <initlock>
  (*f0)->type = FD_PIPE;
8010356e:	8b 06                	mov    (%esi),%eax
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
80103570:	83 c4 10             	add    $0x10,%esp
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
  (*f0)->type = FD_PIPE;
80103573:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103579:	8b 06                	mov    (%esi),%eax
8010357b:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
8010357f:	8b 06                	mov    (%esi),%eax
80103581:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80103585:	8b 06                	mov    (%esi),%eax
80103587:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
8010358a:	8b 03                	mov    (%ebx),%eax
8010358c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
80103592:	8b 03                	mov    (%ebx),%eax
80103594:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103598:	8b 03                	mov    (%ebx),%eax
8010359a:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
8010359e:	8b 03                	mov    (%ebx),%eax
801035a0:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
801035a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
801035a6:	31 c0                	xor    %eax,%eax
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
801035a8:	5b                   	pop    %ebx
801035a9:	5e                   	pop    %esi
801035aa:	5f                   	pop    %edi
801035ab:	5d                   	pop    %ebp
801035ac:	c3                   	ret    
801035ad:	8d 76 00             	lea    0x0(%esi),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
801035b0:	8b 06                	mov    (%esi),%eax
801035b2:	85 c0                	test   %eax,%eax
801035b4:	74 1e                	je     801035d4 <pipealloc+0xe4>
    fileclose(*f0);
801035b6:	83 ec 0c             	sub    $0xc,%esp
801035b9:	50                   	push   %eax
801035ba:	e8 61 d8 ff ff       	call   80100e20 <fileclose>
801035bf:	83 c4 10             	add    $0x10,%esp
  if(*f1)
801035c2:	8b 03                	mov    (%ebx),%eax
801035c4:	85 c0                	test   %eax,%eax
801035c6:	74 0c                	je     801035d4 <pipealloc+0xe4>
    fileclose(*f1);
801035c8:	83 ec 0c             	sub    $0xc,%esp
801035cb:	50                   	push   %eax
801035cc:	e8 4f d8 ff ff       	call   80100e20 <fileclose>
801035d1:	83 c4 10             	add    $0x10,%esp
  return -1;
}
801035d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    kfree((char*)p);
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
801035d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801035dc:	5b                   	pop    %ebx
801035dd:	5e                   	pop    %esi
801035de:	5f                   	pop    %edi
801035df:	5d                   	pop    %ebp
801035e0:	c3                   	ret    
801035e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
801035e8:	8b 06                	mov    (%esi),%eax
801035ea:	85 c0                	test   %eax,%eax
801035ec:	75 c8                	jne    801035b6 <pipealloc+0xc6>
801035ee:	eb d2                	jmp    801035c2 <pipealloc+0xd2>

801035f0 <pipeclose>:
  return -1;
}

void
pipeclose(struct pipe *p, int writable)
{
801035f0:	55                   	push   %ebp
801035f1:	89 e5                	mov    %esp,%ebp
801035f3:	56                   	push   %esi
801035f4:	53                   	push   %ebx
801035f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801035f8:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
801035fb:	83 ec 0c             	sub    $0xc,%esp
801035fe:	53                   	push   %ebx
801035ff:	e8 ec 0d 00 00       	call   801043f0 <acquire>
  if(writable){
80103604:	83 c4 10             	add    $0x10,%esp
80103607:	85 f6                	test   %esi,%esi
80103609:	74 45                	je     80103650 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
8010360b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103611:	83 ec 0c             	sub    $0xc,%esp
void
pipeclose(struct pipe *p, int writable)
{
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
80103614:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010361b:	00 00 00 
    wakeup(&p->nread);
8010361e:	50                   	push   %eax
8010361f:	e8 ec 0a 00 00       	call   80104110 <wakeup>
80103624:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103627:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010362d:	85 d2                	test   %edx,%edx
8010362f:	75 0a                	jne    8010363b <pipeclose+0x4b>
80103631:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103637:	85 c0                	test   %eax,%eax
80103639:	74 35                	je     80103670 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
8010363b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010363e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103641:	5b                   	pop    %ebx
80103642:	5e                   	pop    %esi
80103643:	5d                   	pop    %ebp
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
80103644:	e9 87 0f 00 00       	jmp    801045d0 <release>
80103649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
80103650:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103656:	83 ec 0c             	sub    $0xc,%esp
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
80103659:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103660:	00 00 00 
    wakeup(&p->nwrite);
80103663:	50                   	push   %eax
80103664:	e8 a7 0a 00 00       	call   80104110 <wakeup>
80103669:	83 c4 10             	add    $0x10,%esp
8010366c:	eb b9                	jmp    80103627 <pipeclose+0x37>
8010366e:	66 90                	xchg   %ax,%ax
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
80103670:	83 ec 0c             	sub    $0xc,%esp
80103673:	53                   	push   %ebx
80103674:	e8 57 0f 00 00       	call   801045d0 <release>
    kfree((char*)p);
80103679:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010367c:	83 c4 10             	add    $0x10,%esp
  } else
    release(&p->lock);
}
8010367f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103682:	5b                   	pop    %ebx
80103683:	5e                   	pop    %esi
80103684:	5d                   	pop    %ebp
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
80103685:	e9 d6 ed ff ff       	jmp    80102460 <kfree>
8010368a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103690 <pipewrite>:
}

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103690:	55                   	push   %ebp
80103691:	89 e5                	mov    %esp,%ebp
80103693:	57                   	push   %edi
80103694:	56                   	push   %esi
80103695:	53                   	push   %ebx
80103696:	83 ec 28             	sub    $0x28,%esp
80103699:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i;

  acquire(&p->lock);
8010369c:	57                   	push   %edi
8010369d:	e8 4e 0d 00 00       	call   801043f0 <acquire>
  for(i = 0; i < n; i++){
801036a2:	8b 45 10             	mov    0x10(%ebp),%eax
801036a5:	83 c4 10             	add    $0x10,%esp
801036a8:	85 c0                	test   %eax,%eax
801036aa:	0f 8e c6 00 00 00    	jle    80103776 <pipewrite+0xe6>
801036b0:	8b 45 0c             	mov    0xc(%ebp),%eax
801036b3:	8b 8f 38 02 00 00    	mov    0x238(%edi),%ecx
801036b9:	8d b7 34 02 00 00    	lea    0x234(%edi),%esi
801036bf:	8d 9f 38 02 00 00    	lea    0x238(%edi),%ebx
801036c5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801036c8:	03 45 10             	add    0x10(%ebp),%eax
801036cb:	89 45 e0             	mov    %eax,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801036ce:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
801036d4:	8d 90 00 02 00 00    	lea    0x200(%eax),%edx
801036da:	39 d1                	cmp    %edx,%ecx
801036dc:	0f 85 cf 00 00 00    	jne    801037b1 <pipewrite+0x121>
      if(p->readopen == 0 || proc->killed){
801036e2:	8b 97 3c 02 00 00    	mov    0x23c(%edi),%edx
801036e8:	85 d2                	test   %edx,%edx
801036ea:	0f 84 a8 00 00 00    	je     80103798 <pipewrite+0x108>
801036f0:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801036f7:	8b 42 24             	mov    0x24(%edx),%eax
801036fa:	85 c0                	test   %eax,%eax
801036fc:	74 25                	je     80103723 <pipewrite+0x93>
801036fe:	e9 95 00 00 00       	jmp    80103798 <pipewrite+0x108>
80103703:	90                   	nop
80103704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103708:	8b 87 3c 02 00 00    	mov    0x23c(%edi),%eax
8010370e:	85 c0                	test   %eax,%eax
80103710:	0f 84 82 00 00 00    	je     80103798 <pipewrite+0x108>
80103716:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010371c:	8b 40 24             	mov    0x24(%eax),%eax
8010371f:	85 c0                	test   %eax,%eax
80103721:	75 75                	jne    80103798 <pipewrite+0x108>
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
80103723:	83 ec 0c             	sub    $0xc,%esp
80103726:	56                   	push   %esi
80103727:	e8 e4 09 00 00       	call   80104110 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
8010372c:	59                   	pop    %ecx
8010372d:	58                   	pop    %eax
8010372e:	57                   	push   %edi
8010372f:	53                   	push   %ebx
80103730:	e8 3b 08 00 00       	call   80103f70 <sleep>
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103735:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
8010373b:	8b 97 38 02 00 00    	mov    0x238(%edi),%edx
80103741:	83 c4 10             	add    $0x10,%esp
80103744:	05 00 02 00 00       	add    $0x200,%eax
80103749:	39 c2                	cmp    %eax,%edx
8010374b:	74 bb                	je     80103708 <pipewrite+0x78>
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
8010374d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103750:	8d 4a 01             	lea    0x1(%edx),%ecx
80103753:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
80103757:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
8010375d:	89 8f 38 02 00 00    	mov    %ecx,0x238(%edi)
80103763:	0f b6 00             	movzbl (%eax),%eax
80103766:	88 44 17 34          	mov    %al,0x34(%edi,%edx,1)
8010376a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
8010376d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
80103770:	0f 85 58 ff ff ff    	jne    801036ce <pipewrite+0x3e>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103776:	8d 97 34 02 00 00    	lea    0x234(%edi),%edx
8010377c:	83 ec 0c             	sub    $0xc,%esp
8010377f:	52                   	push   %edx
80103780:	e8 8b 09 00 00       	call   80104110 <wakeup>
  release(&p->lock);
80103785:	89 3c 24             	mov    %edi,(%esp)
80103788:	e8 43 0e 00 00       	call   801045d0 <release>
  return n;
8010378d:	83 c4 10             	add    $0x10,%esp
80103790:	8b 45 10             	mov    0x10(%ebp),%eax
80103793:	eb 14                	jmp    801037a9 <pipewrite+0x119>
80103795:	8d 76 00             	lea    0x0(%esi),%esi

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || proc->killed){
        release(&p->lock);
80103798:	83 ec 0c             	sub    $0xc,%esp
8010379b:	57                   	push   %edi
8010379c:	e8 2f 0e 00 00       	call   801045d0 <release>
        return -1;
801037a1:	83 c4 10             	add    $0x10,%esp
801037a4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
801037a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801037ac:	5b                   	pop    %ebx
801037ad:	5e                   	pop    %esi
801037ae:	5f                   	pop    %edi
801037af:	5d                   	pop    %ebp
801037b0:	c3                   	ret    
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801037b1:	89 ca                	mov    %ecx,%edx
801037b3:	eb 98                	jmp    8010374d <pipewrite+0xbd>
801037b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801037b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801037c0 <piperead>:
  return n;
}

int
piperead(struct pipe *p, char *addr, int n)
{
801037c0:	55                   	push   %ebp
801037c1:	89 e5                	mov    %esp,%ebp
801037c3:	57                   	push   %edi
801037c4:	56                   	push   %esi
801037c5:	53                   	push   %ebx
801037c6:	83 ec 18             	sub    $0x18,%esp
801037c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801037cc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
801037cf:	53                   	push   %ebx
801037d0:	e8 1b 0c 00 00       	call   801043f0 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801037d5:	83 c4 10             	add    $0x10,%esp
801037d8:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801037de:	39 83 38 02 00 00    	cmp    %eax,0x238(%ebx)
801037e4:	75 6a                	jne    80103850 <piperead+0x90>
801037e6:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
801037ec:	85 f6                	test   %esi,%esi
801037ee:	0f 84 cc 00 00 00    	je     801038c0 <piperead+0x100>
801037f4:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
801037fa:	eb 2d                	jmp    80103829 <piperead+0x69>
801037fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(proc->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
80103800:	83 ec 08             	sub    $0x8,%esp
80103803:	53                   	push   %ebx
80103804:	56                   	push   %esi
80103805:	e8 66 07 00 00       	call   80103f70 <sleep>
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
8010380a:	83 c4 10             	add    $0x10,%esp
8010380d:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80103813:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
80103819:	75 35                	jne    80103850 <piperead+0x90>
8010381b:	8b 93 40 02 00 00    	mov    0x240(%ebx),%edx
80103821:	85 d2                	test   %edx,%edx
80103823:	0f 84 97 00 00 00    	je     801038c0 <piperead+0x100>
    if(proc->killed){
80103829:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103830:	8b 4a 24             	mov    0x24(%edx),%ecx
80103833:	85 c9                	test   %ecx,%ecx
80103835:	74 c9                	je     80103800 <piperead+0x40>
      release(&p->lock);
80103837:	83 ec 0c             	sub    $0xc,%esp
8010383a:	53                   	push   %ebx
8010383b:	e8 90 0d 00 00       	call   801045d0 <release>
      return -1;
80103840:	83 c4 10             	add    $0x10,%esp
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103843:	8d 65 f4             	lea    -0xc(%ebp),%esp

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
    if(proc->killed){
      release(&p->lock);
      return -1;
80103846:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
8010384b:	5b                   	pop    %ebx
8010384c:	5e                   	pop    %esi
8010384d:	5f                   	pop    %edi
8010384e:	5d                   	pop    %ebp
8010384f:	c3                   	ret    
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103850:	8b 45 10             	mov    0x10(%ebp),%eax
80103853:	85 c0                	test   %eax,%eax
80103855:	7e 69                	jle    801038c0 <piperead+0x100>
    if(p->nread == p->nwrite)
80103857:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
8010385d:	31 c9                	xor    %ecx,%ecx
8010385f:	eb 15                	jmp    80103876 <piperead+0xb6>
80103861:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103868:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
8010386e:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
80103874:	74 5a                	je     801038d0 <piperead+0x110>
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103876:	8d 72 01             	lea    0x1(%edx),%esi
80103879:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
8010387f:	89 b3 34 02 00 00    	mov    %esi,0x234(%ebx)
80103885:	0f b6 54 13 34       	movzbl 0x34(%ebx,%edx,1),%edx
8010388a:	88 14 0f             	mov    %dl,(%edi,%ecx,1)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
8010388d:	83 c1 01             	add    $0x1,%ecx
80103890:	39 4d 10             	cmp    %ecx,0x10(%ebp)
80103893:	75 d3                	jne    80103868 <piperead+0xa8>
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
80103895:	8d 93 38 02 00 00    	lea    0x238(%ebx),%edx
8010389b:	83 ec 0c             	sub    $0xc,%esp
8010389e:	52                   	push   %edx
8010389f:	e8 6c 08 00 00       	call   80104110 <wakeup>
  release(&p->lock);
801038a4:	89 1c 24             	mov    %ebx,(%esp)
801038a7:	e8 24 0d 00 00       	call   801045d0 <release>
  return i;
801038ac:	8b 45 10             	mov    0x10(%ebp),%eax
801038af:	83 c4 10             	add    $0x10,%esp
}
801038b2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801038b5:	5b                   	pop    %ebx
801038b6:	5e                   	pop    %esi
801038b7:	5f                   	pop    %edi
801038b8:	5d                   	pop    %ebp
801038b9:	c3                   	ret    
801038ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801038c0:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
801038c7:	eb cc                	jmp    80103895 <piperead+0xd5>
801038c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801038d0:	89 4d 10             	mov    %ecx,0x10(%ebp)
801038d3:	eb c0                	jmp    80103895 <piperead+0xd5>
801038d5:	66 90                	xchg   %ax,%ax
801038d7:	66 90                	xchg   %ax,%ax
801038d9:	66 90                	xchg   %ax,%ax
801038db:	66 90                	xchg   %ax,%ax
801038dd:	66 90                	xchg   %ax,%ax
801038df:	90                   	nop

801038e0 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801038e0:	55                   	push   %ebp
801038e1:	89 e5                	mov    %esp,%ebp
801038e3:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801038e4:	bb 14 2d 11 80       	mov    $0x80112d14,%ebx
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801038e9:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
801038ec:	68 e0 2c 11 80       	push   $0x80112ce0
801038f1:	e8 fa 0a 00 00       	call   801043f0 <acquire>
801038f6:	83 c4 10             	add    $0x10,%esp
801038f9:	eb 10                	jmp    8010390b <allocproc+0x2b>
801038fb:	90                   	nop
801038fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103900:	83 c3 7c             	add    $0x7c,%ebx
80103903:	81 fb 14 4c 11 80    	cmp    $0x80114c14,%ebx
80103909:	74 75                	je     80103980 <allocproc+0xa0>
    if(p->state == UNUSED)
8010390b:	8b 43 0c             	mov    0xc(%ebx),%eax
8010390e:	85 c0                	test   %eax,%eax
80103910:	75 ee                	jne    80103900 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
80103912:	a1 08 a0 10 80       	mov    0x8010a008,%eax

  release(&ptable.lock);
80103917:	83 ec 0c             	sub    $0xc,%esp

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
8010391a:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;

  release(&ptable.lock);
80103921:	68 e0 2c 11 80       	push   $0x80112ce0
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
80103926:	8d 50 01             	lea    0x1(%eax),%edx
80103929:	89 43 10             	mov    %eax,0x10(%ebx)
8010392c:	89 15 08 a0 10 80    	mov    %edx,0x8010a008

  release(&ptable.lock);
80103932:	e8 99 0c 00 00       	call   801045d0 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
80103937:	e8 d4 ec ff ff       	call   80102610 <kalloc>
8010393c:	83 c4 10             	add    $0x10,%esp
8010393f:	85 c0                	test   %eax,%eax
80103941:	89 43 08             	mov    %eax,0x8(%ebx)
80103944:	74 51                	je     80103997 <allocproc+0xb7>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103946:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010394c:	83 ec 04             	sub    $0x4,%esp
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
8010394f:	05 9c 0f 00 00       	add    $0xf9c,%eax
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103954:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
80103957:	c7 40 14 9e 58 10 80 	movl   $0x8010589e,0x14(%eax)

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010395e:	6a 14                	push   $0x14
80103960:	6a 00                	push   $0x0
80103962:	50                   	push   %eax
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
80103963:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103966:	e8 b5 0c 00 00       	call   80104620 <memset>
  p->context->eip = (uint)forkret;
8010396b:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
8010396e:	83 c4 10             	add    $0x10,%esp
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;
80103971:	c7 40 10 a0 39 10 80 	movl   $0x801039a0,0x10(%eax)

  return p;
80103978:	89 d8                	mov    %ebx,%eax
}
8010397a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010397d:	c9                   	leave  
8010397e:	c3                   	ret    
8010397f:	90                   	nop

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
80103980:	83 ec 0c             	sub    $0xc,%esp
80103983:	68 e0 2c 11 80       	push   $0x80112ce0
80103988:	e8 43 0c 00 00       	call   801045d0 <release>
  return 0;
8010398d:	83 c4 10             	add    $0x10,%esp
80103990:	31 c0                	xor    %eax,%eax
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
80103992:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103995:	c9                   	leave  
80103996:	c3                   	ret    

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
80103997:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
8010399e:	eb da                	jmp    8010397a <allocproc+0x9a>

801039a0 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
801039a0:	55                   	push   %ebp
801039a1:	89 e5                	mov    %esp,%ebp
801039a3:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
801039a6:	68 e0 2c 11 80       	push   $0x80112ce0
801039ab:	e8 20 0c 00 00       	call   801045d0 <release>

  if (first) {
801039b0:	a1 04 a0 10 80       	mov    0x8010a004,%eax
801039b5:	83 c4 10             	add    $0x10,%esp
801039b8:	85 c0                	test   %eax,%eax
801039ba:	75 04                	jne    801039c0 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
801039bc:	c9                   	leave  
801039bd:	c3                   	ret    
801039be:	66 90                	xchg   %ax,%ax
  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
801039c0:	83 ec 0c             	sub    $0xc,%esp

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
801039c3:	c7 05 04 a0 10 80 00 	movl   $0x0,0x8010a004
801039ca:	00 00 00 
    iinit(ROOTDEV);
801039cd:	6a 01                	push   $0x1
801039cf:	e8 5c db ff ff       	call   80101530 <iinit>
    initlog(ROOTDEV);
801039d4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801039db:	e8 d0 f2 ff ff       	call   80102cb0 <initlog>
801039e0:	83 c4 10             	add    $0x10,%esp
  }

  // Return to "caller", actually trapret (see allocproc).
}
801039e3:	c9                   	leave  
801039e4:	c3                   	ret    
801039e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801039e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801039f0 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
801039f0:	55                   	push   %ebp
801039f1:	89 e5                	mov    %esp,%ebp
801039f3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
801039f6:	68 6d 76 10 80       	push   $0x8010766d
801039fb:	68 e0 2c 11 80       	push   $0x80112ce0
80103a00:	e8 cb 09 00 00       	call   801043d0 <initlock>
}
80103a05:	83 c4 10             	add    $0x10,%esp
80103a08:	c9                   	leave  
80103a09:	c3                   	ret    
80103a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103a10 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
80103a10:	55                   	push   %ebp
80103a11:	89 e5                	mov    %esp,%ebp
80103a13:	53                   	push   %ebx
80103a14:	83 ec 04             	sub    $0x4,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
80103a17:	e8 c4 fe ff ff       	call   801038e0 <allocproc>
80103a1c:	89 c3                	mov    %eax,%ebx
  
  initproc = p;
80103a1e:	a3 bc a5 10 80       	mov    %eax,0x8010a5bc
  if((p->pgdir = setupkvm()) == 0)
80103a23:	e8 a8 30 00 00       	call   80106ad0 <setupkvm>
80103a28:	85 c0                	test   %eax,%eax
80103a2a:	89 43 04             	mov    %eax,0x4(%ebx)
80103a2d:	0f 84 bd 00 00 00    	je     80103af0 <userinit+0xe0>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103a33:	83 ec 04             	sub    $0x4,%esp
80103a36:	68 2c 00 00 00       	push   $0x2c
80103a3b:	68 60 a4 10 80       	push   $0x8010a460
80103a40:	50                   	push   %eax
80103a41:	e8 da 31 00 00       	call   80106c20 <inituvm>
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
80103a46:	83 c4 0c             	add    $0xc,%esp
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
80103a49:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
80103a4f:	6a 4c                	push   $0x4c
80103a51:	6a 00                	push   $0x0
80103a53:	ff 73 18             	pushl  0x18(%ebx)
80103a56:	e8 c5 0b 00 00       	call   80104620 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
80103a5b:	8b 43 18             	mov    0x18(%ebx),%eax
80103a5e:	ba 23 00 00 00       	mov    $0x23,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103a63:	b9 2b 00 00 00       	mov    $0x2b,%ecx
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
80103a68:	83 c4 0c             	add    $0xc,%esp
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
80103a6b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103a6f:	8b 43 18             	mov    0x18(%ebx),%eax
80103a72:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103a76:	8b 43 18             	mov    0x18(%ebx),%eax
80103a79:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103a7d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103a81:	8b 43 18             	mov    0x18(%ebx),%eax
80103a84:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103a88:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
80103a8c:	8b 43 18             	mov    0x18(%ebx),%eax
80103a8f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103a96:	8b 43 18             	mov    0x18(%ebx),%eax
80103a99:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103aa0:	8b 43 18             	mov    0x18(%ebx),%eax
80103aa3:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
80103aaa:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103aad:	6a 10                	push   $0x10
80103aaf:	68 8d 76 10 80       	push   $0x8010768d
80103ab4:	50                   	push   %eax
80103ab5:	e8 66 0d 00 00       	call   80104820 <safestrcpy>
  p->cwd = namei("/");
80103aba:	c7 04 24 96 76 10 80 	movl   $0x80107696,(%esp)
80103ac1:	e8 5a e5 ff ff       	call   80102020 <namei>
80103ac6:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
80103ac9:	c7 04 24 e0 2c 11 80 	movl   $0x80112ce0,(%esp)
80103ad0:	e8 1b 09 00 00       	call   801043f0 <acquire>

  p->state = RUNNABLE;
80103ad5:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
80103adc:	c7 04 24 e0 2c 11 80 	movl   $0x80112ce0,(%esp)
80103ae3:	e8 e8 0a 00 00       	call   801045d0 <release>
}
80103ae8:	83 c4 10             	add    $0x10,%esp
80103aeb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103aee:	c9                   	leave  
80103aef:	c3                   	ret    

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
80103af0:	83 ec 0c             	sub    $0xc,%esp
80103af3:	68 74 76 10 80       	push   $0x80107674
80103af8:	e8 73 c8 ff ff       	call   80100370 <panic>
80103afd:	8d 76 00             	lea    0x0(%esi),%esi

80103b00 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
80103b00:	55                   	push   %ebp
80103b01:	89 e5                	mov    %esp,%ebp
80103b03:	83 ec 08             	sub    $0x8,%esp
  uint sz;

  sz = proc->sz;
80103b06:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
80103b0d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint sz;

  sz = proc->sz;
80103b10:	8b 02                	mov    (%edx),%eax
  if(n > 0){
80103b12:	83 f9 00             	cmp    $0x0,%ecx
80103b15:	7e 39                	jle    80103b50 <growproc+0x50>
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
80103b17:	83 ec 04             	sub    $0x4,%esp
80103b1a:	01 c1                	add    %eax,%ecx
80103b1c:	51                   	push   %ecx
80103b1d:	50                   	push   %eax
80103b1e:	ff 72 04             	pushl  0x4(%edx)
80103b21:	e8 3a 32 00 00       	call   80106d60 <allocuvm>
80103b26:	83 c4 10             	add    $0x10,%esp
80103b29:	85 c0                	test   %eax,%eax
80103b2b:	74 3b                	je     80103b68 <growproc+0x68>
80103b2d:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  proc->sz = sz;
80103b34:	89 02                	mov    %eax,(%edx)
  switchuvm(proc);
80103b36:	83 ec 0c             	sub    $0xc,%esp
80103b39:	65 ff 35 04 00 00 00 	pushl  %gs:0x4
80103b40:	e8 3b 30 00 00       	call   80106b80 <switchuvm>
  return 0;
80103b45:	83 c4 10             	add    $0x10,%esp
80103b48:	31 c0                	xor    %eax,%eax
}
80103b4a:	c9                   	leave  
80103b4b:	c3                   	ret    
80103b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  sz = proc->sz;
  if(n > 0){
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
80103b50:	74 e2                	je     80103b34 <growproc+0x34>
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
80103b52:	83 ec 04             	sub    $0x4,%esp
80103b55:	01 c1                	add    %eax,%ecx
80103b57:	51                   	push   %ecx
80103b58:	50                   	push   %eax
80103b59:	ff 72 04             	pushl  0x4(%edx)
80103b5c:	e8 ff 32 00 00       	call   80106e60 <deallocuvm>
80103b61:	83 c4 10             	add    $0x10,%esp
80103b64:	85 c0                	test   %eax,%eax
80103b66:	75 c5                	jne    80103b2d <growproc+0x2d>
  uint sz;

  sz = proc->sz;
  if(n > 0){
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
80103b68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return -1;
  }
  proc->sz = sz;
  switchuvm(proc);
  return 0;
}
80103b6d:	c9                   	leave  
80103b6e:	c3                   	ret    
80103b6f:	90                   	nop

80103b70 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
80103b70:	55                   	push   %ebp
80103b71:	89 e5                	mov    %esp,%ebp
80103b73:	57                   	push   %edi
80103b74:	56                   	push   %esi
80103b75:	53                   	push   %ebx
80103b76:	83 ec 0c             	sub    $0xc,%esp
  int i, pid;
  struct proc *np;

  // Allocate process.
  if((np = allocproc()) == 0){
80103b79:	e8 62 fd ff ff       	call   801038e0 <allocproc>
80103b7e:	85 c0                	test   %eax,%eax
80103b80:	0f 84 d6 00 00 00    	je     80103c5c <fork+0xec>
80103b86:	89 c3                	mov    %eax,%ebx
    return -1;
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
80103b88:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103b8e:	83 ec 08             	sub    $0x8,%esp
80103b91:	ff 30                	pushl  (%eax)
80103b93:	ff 70 04             	pushl  0x4(%eax)
80103b96:	e8 a5 33 00 00       	call   80106f40 <copyuvm>
80103b9b:	83 c4 10             	add    $0x10,%esp
80103b9e:	85 c0                	test   %eax,%eax
80103ba0:	89 43 04             	mov    %eax,0x4(%ebx)
80103ba3:	0f 84 ba 00 00 00    	je     80103c63 <fork+0xf3>
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = proc->sz;
80103ba9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  np->parent = proc;
  *np->tf = *proc->tf;
80103baf:	8b 7b 18             	mov    0x18(%ebx),%edi
80103bb2:	b9 13 00 00 00       	mov    $0x13,%ecx
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = proc->sz;
80103bb7:	8b 00                	mov    (%eax),%eax
80103bb9:	89 03                	mov    %eax,(%ebx)
  np->parent = proc;
80103bbb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103bc1:	89 43 14             	mov    %eax,0x14(%ebx)
  *np->tf = *proc->tf;
80103bc4:	8b 70 18             	mov    0x18(%eax),%esi
80103bc7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103bc9:	31 f6                	xor    %esi,%esi
  np->sz = proc->sz;
  np->parent = proc;
  *np->tf = *proc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
80103bcb:	8b 43 18             	mov    0x18(%ebx),%eax
80103bce:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103bd5:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(i = 0; i < NOFILE; i++)
    if(proc->ofile[i])
80103be0:	8b 44 b2 28          	mov    0x28(%edx,%esi,4),%eax
80103be4:	85 c0                	test   %eax,%eax
80103be6:	74 17                	je     80103bff <fork+0x8f>
      np->ofile[i] = filedup(proc->ofile[i]);
80103be8:	83 ec 0c             	sub    $0xc,%esp
80103beb:	50                   	push   %eax
80103bec:	e8 df d1 ff ff       	call   80100dd0 <filedup>
80103bf1:	89 44 b3 28          	mov    %eax,0x28(%ebx,%esi,4)
80103bf5:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103bfc:	83 c4 10             	add    $0x10,%esp
  *np->tf = *proc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103bff:	83 c6 01             	add    $0x1,%esi
80103c02:	83 fe 10             	cmp    $0x10,%esi
80103c05:	75 d9                	jne    80103be0 <fork+0x70>
    if(proc->ofile[i])
      np->ofile[i] = filedup(proc->ofile[i]);
  np->cwd = idup(proc->cwd);
80103c07:	83 ec 0c             	sub    $0xc,%esp
80103c0a:	ff 72 68             	pushl  0x68(%edx)
80103c0d:	e8 ee da ff ff       	call   80101700 <idup>
80103c12:	89 43 68             	mov    %eax,0x68(%ebx)

  safestrcpy(np->name, proc->name, sizeof(proc->name));
80103c15:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103c1b:	83 c4 0c             	add    $0xc,%esp
80103c1e:	6a 10                	push   $0x10
80103c20:	83 c0 6c             	add    $0x6c,%eax
80103c23:	50                   	push   %eax
80103c24:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103c27:	50                   	push   %eax
80103c28:	e8 f3 0b 00 00       	call   80104820 <safestrcpy>

  pid = np->pid;
80103c2d:	8b 73 10             	mov    0x10(%ebx),%esi

  acquire(&ptable.lock);
80103c30:	c7 04 24 e0 2c 11 80 	movl   $0x80112ce0,(%esp)
80103c37:	e8 b4 07 00 00       	call   801043f0 <acquire>

  np->state = RUNNABLE;
80103c3c:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
80103c43:	c7 04 24 e0 2c 11 80 	movl   $0x80112ce0,(%esp)
80103c4a:	e8 81 09 00 00       	call   801045d0 <release>

  return pid;
80103c4f:	83 c4 10             	add    $0x10,%esp
80103c52:	89 f0                	mov    %esi,%eax
}
80103c54:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103c57:	5b                   	pop    %ebx
80103c58:	5e                   	pop    %esi
80103c59:	5f                   	pop    %edi
80103c5a:	5d                   	pop    %ebp
80103c5b:	c3                   	ret    
  int i, pid;
  struct proc *np;

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
80103c5c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103c61:	eb f1                	jmp    80103c54 <fork+0xe4>
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
    kfree(np->kstack);
80103c63:	83 ec 0c             	sub    $0xc,%esp
80103c66:	ff 73 08             	pushl  0x8(%ebx)
80103c69:	e8 f2 e7 ff ff       	call   80102460 <kfree>
    np->kstack = 0;
80103c6e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103c75:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103c7c:	83 c4 10             	add    $0x10,%esp
80103c7f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103c84:	eb ce                	jmp    80103c54 <fork+0xe4>
80103c86:	8d 76 00             	lea    0x0(%esi),%esi
80103c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103c90 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80103c90:	55                   	push   %ebp
80103c91:	89 e5                	mov    %esp,%ebp
80103c93:	53                   	push   %ebx
80103c94:	83 ec 04             	sub    $0x4,%esp
80103c97:	89 f6                	mov    %esi,%esi
80103c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
}

static inline void
sti(void)
{
  asm volatile("sti");
80103ca0:	fb                   	sti    
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103ca1:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ca4:	bb 14 2d 11 80       	mov    $0x80112d14,%ebx
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103ca9:	68 e0 2c 11 80       	push   $0x80112ce0
80103cae:	e8 3d 07 00 00       	call   801043f0 <acquire>
80103cb3:	83 c4 10             	add    $0x10,%esp
80103cb6:	eb 13                	jmp    80103ccb <scheduler+0x3b>
80103cb8:	90                   	nop
80103cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103cc0:	83 c3 7c             	add    $0x7c,%ebx
80103cc3:	81 fb 14 4c 11 80    	cmp    $0x80114c14,%ebx
80103cc9:	74 55                	je     80103d20 <scheduler+0x90>
      if(p->state != RUNNABLE)
80103ccb:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103ccf:	75 ef                	jne    80103cc0 <scheduler+0x30>

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
      switchuvm(p);
80103cd1:	83 ec 0c             	sub    $0xc,%esp
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
80103cd4:	65 89 1d 04 00 00 00 	mov    %ebx,%gs:0x4
      switchuvm(p);
80103cdb:	53                   	push   %ebx
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103cdc:	83 c3 7c             	add    $0x7c,%ebx

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
      switchuvm(p);
80103cdf:	e8 9c 2e 00 00       	call   80106b80 <switchuvm>
      p->state = RUNNING;
      swtch(&cpu->scheduler, p->context);
80103ce4:	58                   	pop    %eax
80103ce5:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
      switchuvm(p);
      p->state = RUNNING;
80103ceb:	c7 43 90 04 00 00 00 	movl   $0x4,-0x70(%ebx)
      swtch(&cpu->scheduler, p->context);
80103cf2:	5a                   	pop    %edx
80103cf3:	ff 73 a0             	pushl  -0x60(%ebx)
80103cf6:	83 c0 04             	add    $0x4,%eax
80103cf9:	50                   	push   %eax
80103cfa:	e8 7c 0b 00 00       	call   8010487b <swtch>
      switchkvm();
80103cff:	e8 5c 2e 00 00       	call   80106b60 <switchkvm>

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
80103d04:	83 c4 10             	add    $0x10,%esp
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103d07:	81 fb 14 4c 11 80    	cmp    $0x80114c14,%ebx
      swtch(&cpu->scheduler, p->context);
      switchkvm();

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
80103d0d:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80103d14:	00 00 00 00 
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103d18:	75 b1                	jne    80103ccb <scheduler+0x3b>
80103d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
    }
    release(&ptable.lock);
80103d20:	83 ec 0c             	sub    $0xc,%esp
80103d23:	68 e0 2c 11 80       	push   $0x80112ce0
80103d28:	e8 a3 08 00 00       	call   801045d0 <release>

  }
80103d2d:	83 c4 10             	add    $0x10,%esp
80103d30:	e9 6b ff ff ff       	jmp    80103ca0 <scheduler+0x10>
80103d35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103d40 <sched>:
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
80103d40:	55                   	push   %ebp
80103d41:	89 e5                	mov    %esp,%ebp
80103d43:	53                   	push   %ebx
80103d44:	83 ec 10             	sub    $0x10,%esp
  int intena;

  if(!holding(&ptable.lock))
80103d47:	68 e0 2c 11 80       	push   $0x80112ce0
80103d4c:	e8 cf 07 00 00       	call   80104520 <holding>
80103d51:	83 c4 10             	add    $0x10,%esp
80103d54:	85 c0                	test   %eax,%eax
80103d56:	74 4c                	je     80103da4 <sched+0x64>
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
80103d58:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80103d5f:	83 ba ac 00 00 00 01 	cmpl   $0x1,0xac(%edx)
80103d66:	75 63                	jne    80103dcb <sched+0x8b>
    panic("sched locks");
  if(proc->state == RUNNING)
80103d68:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d6e:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80103d72:	74 4a                	je     80103dbe <sched+0x7e>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103d74:	9c                   	pushf  
80103d75:	59                   	pop    %ecx
    panic("sched running");
  if(readeflags()&FL_IF)
80103d76:	80 e5 02             	and    $0x2,%ch
80103d79:	75 36                	jne    80103db1 <sched+0x71>
    panic("sched interruptible");
  intena = cpu->intena;
  swtch(&proc->context, cpu->scheduler);
80103d7b:	83 ec 08             	sub    $0x8,%esp
80103d7e:	83 c0 1c             	add    $0x1c,%eax
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = cpu->intena;
80103d81:	8b 9a b0 00 00 00    	mov    0xb0(%edx),%ebx
  swtch(&proc->context, cpu->scheduler);
80103d87:	ff 72 04             	pushl  0x4(%edx)
80103d8a:	50                   	push   %eax
80103d8b:	e8 eb 0a 00 00       	call   8010487b <swtch>
  cpu->intena = intena;
80103d90:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
}
80103d96:	83 c4 10             	add    $0x10,%esp
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = cpu->intena;
  swtch(&proc->context, cpu->scheduler);
  cpu->intena = intena;
80103d99:	89 98 b0 00 00 00    	mov    %ebx,0xb0(%eax)
}
80103d9f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103da2:	c9                   	leave  
80103da3:	c3                   	ret    
sched(void)
{
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
80103da4:	83 ec 0c             	sub    $0xc,%esp
80103da7:	68 98 76 10 80       	push   $0x80107698
80103dac:	e8 bf c5 ff ff       	call   80100370 <panic>
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103db1:	83 ec 0c             	sub    $0xc,%esp
80103db4:	68 c4 76 10 80       	push   $0x801076c4
80103db9:	e8 b2 c5 ff ff       	call   80100370 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
80103dbe:	83 ec 0c             	sub    $0xc,%esp
80103dc1:	68 b6 76 10 80       	push   $0x801076b6
80103dc6:	e8 a5 c5 ff ff       	call   80100370 <panic>
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
80103dcb:	83 ec 0c             	sub    $0xc,%esp
80103dce:	68 aa 76 10 80       	push   $0x801076aa
80103dd3:	e8 98 c5 ff ff       	call   80100370 <panic>
80103dd8:	90                   	nop
80103dd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103de0 <exit>:
exit(void)
{
  struct proc *p;
  int fd;

  if(proc == initproc)
80103de0:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103de7:	3b 15 bc a5 10 80    	cmp    0x8010a5bc,%edx
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103ded:	55                   	push   %ebp
80103dee:	89 e5                	mov    %esp,%ebp
80103df0:	56                   	push   %esi
80103df1:	53                   	push   %ebx
  struct proc *p;
  int fd;

  if(proc == initproc)
80103df2:	0f 84 1f 01 00 00    	je     80103f17 <exit+0x137>
80103df8:	31 db                	xor    %ebx,%ebx
80103dfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd]){
80103e00:	8d 73 08             	lea    0x8(%ebx),%esi
80103e03:	8b 44 b2 08          	mov    0x8(%edx,%esi,4),%eax
80103e07:	85 c0                	test   %eax,%eax
80103e09:	74 1b                	je     80103e26 <exit+0x46>
      fileclose(proc->ofile[fd]);
80103e0b:	83 ec 0c             	sub    $0xc,%esp
80103e0e:	50                   	push   %eax
80103e0f:	e8 0c d0 ff ff       	call   80100e20 <fileclose>
      proc->ofile[fd] = 0;
80103e14:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103e1b:	83 c4 10             	add    $0x10,%esp
80103e1e:	c7 44 b2 08 00 00 00 	movl   $0x0,0x8(%edx,%esi,4)
80103e25:	00 

  if(proc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103e26:	83 c3 01             	add    $0x1,%ebx
80103e29:	83 fb 10             	cmp    $0x10,%ebx
80103e2c:	75 d2                	jne    80103e00 <exit+0x20>
      fileclose(proc->ofile[fd]);
      proc->ofile[fd] = 0;
    }
  }

  begin_op();
80103e2e:	e8 1d ef ff ff       	call   80102d50 <begin_op>
  iput(proc->cwd);
80103e33:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e39:	83 ec 0c             	sub    $0xc,%esp
80103e3c:	ff 70 68             	pushl  0x68(%eax)
80103e3f:	e8 1c da ff ff       	call   80101860 <iput>
  end_op();
80103e44:	e8 77 ef ff ff       	call   80102dc0 <end_op>
  proc->cwd = 0;
80103e49:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e4f:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)

  acquire(&ptable.lock);
80103e56:	c7 04 24 e0 2c 11 80 	movl   $0x80112ce0,(%esp)
80103e5d:	e8 8e 05 00 00       	call   801043f0 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
80103e62:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
80103e69:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e6c:	b8 14 2d 11 80       	mov    $0x80112d14,%eax
  proc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
80103e71:	8b 51 14             	mov    0x14(%ecx),%edx
80103e74:	eb 14                	jmp    80103e8a <exit+0xaa>
80103e76:	8d 76 00             	lea    0x0(%esi),%esi
80103e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e80:	83 c0 7c             	add    $0x7c,%eax
80103e83:	3d 14 4c 11 80       	cmp    $0x80114c14,%eax
80103e88:	74 1c                	je     80103ea6 <exit+0xc6>
    if(p->state == SLEEPING && p->chan == chan)
80103e8a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e8e:	75 f0                	jne    80103e80 <exit+0xa0>
80103e90:	3b 50 20             	cmp    0x20(%eax),%edx
80103e93:	75 eb                	jne    80103e80 <exit+0xa0>
      p->state = RUNNABLE;
80103e95:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e9c:	83 c0 7c             	add    $0x7c,%eax
80103e9f:	3d 14 4c 11 80       	cmp    $0x80114c14,%eax
80103ea4:	75 e4                	jne    80103e8a <exit+0xaa>
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == proc){
      p->parent = initproc;
80103ea6:	8b 1d bc a5 10 80    	mov    0x8010a5bc,%ebx
80103eac:	ba 14 2d 11 80       	mov    $0x80112d14,%edx
80103eb1:	eb 10                	jmp    80103ec3 <exit+0xe3>
80103eb3:	90                   	nop
80103eb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103eb8:	83 c2 7c             	add    $0x7c,%edx
80103ebb:	81 fa 14 4c 11 80    	cmp    $0x80114c14,%edx
80103ec1:	74 3b                	je     80103efe <exit+0x11e>
    if(p->parent == proc){
80103ec3:	3b 4a 14             	cmp    0x14(%edx),%ecx
80103ec6:	75 f0                	jne    80103eb8 <exit+0xd8>
      p->parent = initproc;
      if(p->state == ZOMBIE)
80103ec8:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == proc){
      p->parent = initproc;
80103ecc:	89 5a 14             	mov    %ebx,0x14(%edx)
      if(p->state == ZOMBIE)
80103ecf:	75 e7                	jne    80103eb8 <exit+0xd8>
80103ed1:	b8 14 2d 11 80       	mov    $0x80112d14,%eax
80103ed6:	eb 12                	jmp    80103eea <exit+0x10a>
80103ed8:	90                   	nop
80103ed9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103ee0:	83 c0 7c             	add    $0x7c,%eax
80103ee3:	3d 14 4c 11 80       	cmp    $0x80114c14,%eax
80103ee8:	74 ce                	je     80103eb8 <exit+0xd8>
    if(p->state == SLEEPING && p->chan == chan)
80103eea:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103eee:	75 f0                	jne    80103ee0 <exit+0x100>
80103ef0:	3b 58 20             	cmp    0x20(%eax),%ebx
80103ef3:	75 eb                	jne    80103ee0 <exit+0x100>
      p->state = RUNNABLE;
80103ef5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103efc:	eb e2                	jmp    80103ee0 <exit+0x100>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  proc->state = ZOMBIE;
80103efe:	c7 41 0c 05 00 00 00 	movl   $0x5,0xc(%ecx)
  sched();
80103f05:	e8 36 fe ff ff       	call   80103d40 <sched>
  panic("zombie exit");
80103f0a:	83 ec 0c             	sub    $0xc,%esp
80103f0d:	68 e5 76 10 80       	push   $0x801076e5
80103f12:	e8 59 c4 ff ff       	call   80100370 <panic>
{
  struct proc *p;
  int fd;

  if(proc == initproc)
    panic("init exiting");
80103f17:	83 ec 0c             	sub    $0xc,%esp
80103f1a:	68 d8 76 10 80       	push   $0x801076d8
80103f1f:	e8 4c c4 ff ff       	call   80100370 <panic>
80103f24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103f2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103f30 <yield>:
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
80103f30:	55                   	push   %ebp
80103f31:	89 e5                	mov    %esp,%ebp
80103f33:	83 ec 14             	sub    $0x14,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103f36:	68 e0 2c 11 80       	push   $0x80112ce0
80103f3b:	e8 b0 04 00 00       	call   801043f0 <acquire>
  proc->state = RUNNABLE;
80103f40:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f46:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
80103f4d:	e8 ee fd ff ff       	call   80103d40 <sched>
  release(&ptable.lock);
80103f52:	c7 04 24 e0 2c 11 80 	movl   $0x80112ce0,(%esp)
80103f59:	e8 72 06 00 00       	call   801045d0 <release>
}
80103f5e:	83 c4 10             	add    $0x10,%esp
80103f61:	c9                   	leave  
80103f62:	c3                   	ret    
80103f63:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103f69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103f70 <sleep>:
// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  if(proc == 0)
80103f70:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103f76:	55                   	push   %ebp
80103f77:	89 e5                	mov    %esp,%ebp
80103f79:	56                   	push   %esi
80103f7a:	53                   	push   %ebx
  if(proc == 0)
80103f7b:	85 c0                	test   %eax,%eax

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103f7d:	8b 75 08             	mov    0x8(%ebp),%esi
80103f80:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(proc == 0)
80103f83:	0f 84 97 00 00 00    	je     80104020 <sleep+0xb0>
    panic("sleep");

  if(lk == 0)
80103f89:	85 db                	test   %ebx,%ebx
80103f8b:	0f 84 82 00 00 00    	je     80104013 <sleep+0xa3>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103f91:	81 fb e0 2c 11 80    	cmp    $0x80112ce0,%ebx
80103f97:	74 57                	je     80103ff0 <sleep+0x80>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103f99:	83 ec 0c             	sub    $0xc,%esp
80103f9c:	68 e0 2c 11 80       	push   $0x80112ce0
80103fa1:	e8 4a 04 00 00       	call   801043f0 <acquire>
    release(lk);
80103fa6:	89 1c 24             	mov    %ebx,(%esp)
80103fa9:	e8 22 06 00 00       	call   801045d0 <release>
  }

  // Go to sleep.
  proc->chan = chan;
80103fae:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103fb4:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103fb7:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103fbe:	e8 7d fd ff ff       	call   80103d40 <sched>

  // Tidy up.
  proc->chan = 0;
80103fc3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103fc9:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
80103fd0:	c7 04 24 e0 2c 11 80 	movl   $0x80112ce0,(%esp)
80103fd7:	e8 f4 05 00 00       	call   801045d0 <release>
    acquire(lk);
80103fdc:	89 5d 08             	mov    %ebx,0x8(%ebp)
80103fdf:	83 c4 10             	add    $0x10,%esp
  }
}
80103fe2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103fe5:	5b                   	pop    %ebx
80103fe6:	5e                   	pop    %esi
80103fe7:	5d                   	pop    %ebp
  proc->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103fe8:	e9 03 04 00 00       	jmp    801043f0 <acquire>
80103fed:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }

  // Go to sleep.
  proc->chan = chan;
80103ff0:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103ff3:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103ffa:	e8 41 fd ff ff       	call   80103d40 <sched>

  // Tidy up.
  proc->chan = 0;
80103fff:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104005:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
8010400c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010400f:	5b                   	pop    %ebx
80104010:	5e                   	pop    %esi
80104011:	5d                   	pop    %ebp
80104012:	c3                   	ret    
{
  if(proc == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");
80104013:	83 ec 0c             	sub    $0xc,%esp
80104016:	68 f7 76 10 80       	push   $0x801076f7
8010401b:	e8 50 c3 ff ff       	call   80100370 <panic>
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  if(proc == 0)
    panic("sleep");
80104020:	83 ec 0c             	sub    $0xc,%esp
80104023:	68 f1 76 10 80       	push   $0x801076f1
80104028:	e8 43 c3 ff ff       	call   80100370 <panic>
8010402d:	8d 76 00             	lea    0x0(%esi),%esi

80104030 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
80104030:	55                   	push   %ebp
80104031:	89 e5                	mov    %esp,%ebp
80104033:	56                   	push   %esi
80104034:	53                   	push   %ebx
  struct proc *p;
  int havekids, pid;

  acquire(&ptable.lock);
80104035:	83 ec 0c             	sub    $0xc,%esp
80104038:	68 e0 2c 11 80       	push   $0x80112ce0
8010403d:	e8 ae 03 00 00       	call   801043f0 <acquire>
80104042:	83 c4 10             	add    $0x10,%esp
80104045:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
8010404b:	31 d2                	xor    %edx,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010404d:	bb 14 2d 11 80       	mov    $0x80112d14,%ebx
80104052:	eb 0f                	jmp    80104063 <wait+0x33>
80104054:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104058:	83 c3 7c             	add    $0x7c,%ebx
8010405b:	81 fb 14 4c 11 80    	cmp    $0x80114c14,%ebx
80104061:	74 1d                	je     80104080 <wait+0x50>
      if(p->parent != proc)
80104063:	3b 43 14             	cmp    0x14(%ebx),%eax
80104066:	75 f0                	jne    80104058 <wait+0x28>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
80104068:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
8010406c:	74 30                	je     8010409e <wait+0x6e>

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010406e:	83 c3 7c             	add    $0x7c,%ebx
      if(p->parent != proc)
        continue;
      havekids = 1;
80104071:	ba 01 00 00 00       	mov    $0x1,%edx

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104076:	81 fb 14 4c 11 80    	cmp    $0x80114c14,%ebx
8010407c:	75 e5                	jne    80104063 <wait+0x33>
8010407e:	66 90                	xchg   %ax,%ax
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
80104080:	85 d2                	test   %edx,%edx
80104082:	74 70                	je     801040f4 <wait+0xc4>
80104084:	8b 50 24             	mov    0x24(%eax),%edx
80104087:	85 d2                	test   %edx,%edx
80104089:	75 69                	jne    801040f4 <wait+0xc4>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
8010408b:	83 ec 08             	sub    $0x8,%esp
8010408e:	68 e0 2c 11 80       	push   $0x80112ce0
80104093:	50                   	push   %eax
80104094:	e8 d7 fe ff ff       	call   80103f70 <sleep>
  }
80104099:	83 c4 10             	add    $0x10,%esp
8010409c:	eb a7                	jmp    80104045 <wait+0x15>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
8010409e:	83 ec 0c             	sub    $0xc,%esp
801040a1:	ff 73 08             	pushl  0x8(%ebx)
      if(p->parent != proc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
801040a4:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
801040a7:	e8 b4 e3 ff ff       	call   80102460 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
801040ac:	59                   	pop    %ecx
801040ad:	ff 73 04             	pushl  0x4(%ebx)
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
801040b0:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
801040b7:	e8 d4 2d 00 00       	call   80106e90 <freevm>
        p->pid = 0;
801040bc:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
801040c3:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
801040ca:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
801040ce:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
801040d5:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
801040dc:	c7 04 24 e0 2c 11 80 	movl   $0x80112ce0,(%esp)
801040e3:	e8 e8 04 00 00       	call   801045d0 <release>
        return pid;
801040e8:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
801040eb:	8d 65 f8             	lea    -0x8(%ebp),%esp
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
801040ee:	89 f0                	mov    %esi,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
801040f0:	5b                   	pop    %ebx
801040f1:	5e                   	pop    %esi
801040f2:	5d                   	pop    %ebp
801040f3:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
      release(&ptable.lock);
801040f4:	83 ec 0c             	sub    $0xc,%esp
801040f7:	68 e0 2c 11 80       	push   $0x80112ce0
801040fc:	e8 cf 04 00 00       	call   801045d0 <release>
      return -1;
80104101:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80104104:	8d 65 f8             	lea    -0x8(%ebp),%esp
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
      release(&ptable.lock);
      return -1;
80104107:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
8010410c:	5b                   	pop    %ebx
8010410d:	5e                   	pop    %esi
8010410e:	5d                   	pop    %ebp
8010410f:	c3                   	ret    

80104110 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80104110:	55                   	push   %ebp
80104111:	89 e5                	mov    %esp,%ebp
80104113:	53                   	push   %ebx
80104114:	83 ec 10             	sub    $0x10,%esp
80104117:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
8010411a:	68 e0 2c 11 80       	push   $0x80112ce0
8010411f:	e8 cc 02 00 00       	call   801043f0 <acquire>
80104124:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104127:	b8 14 2d 11 80       	mov    $0x80112d14,%eax
8010412c:	eb 0c                	jmp    8010413a <wakeup+0x2a>
8010412e:	66 90                	xchg   %ax,%ax
80104130:	83 c0 7c             	add    $0x7c,%eax
80104133:	3d 14 4c 11 80       	cmp    $0x80114c14,%eax
80104138:	74 1c                	je     80104156 <wakeup+0x46>
    if(p->state == SLEEPING && p->chan == chan)
8010413a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
8010413e:	75 f0                	jne    80104130 <wakeup+0x20>
80104140:	3b 58 20             	cmp    0x20(%eax),%ebx
80104143:	75 eb                	jne    80104130 <wakeup+0x20>
      p->state = RUNNABLE;
80104145:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010414c:	83 c0 7c             	add    $0x7c,%eax
8010414f:	3d 14 4c 11 80       	cmp    $0x80114c14,%eax
80104154:	75 e4                	jne    8010413a <wakeup+0x2a>
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80104156:	c7 45 08 e0 2c 11 80 	movl   $0x80112ce0,0x8(%ebp)
}
8010415d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104160:	c9                   	leave  
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80104161:	e9 6a 04 00 00       	jmp    801045d0 <release>
80104166:	8d 76 00             	lea    0x0(%esi),%esi
80104169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104170 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80104170:	55                   	push   %ebp
80104171:	89 e5                	mov    %esp,%ebp
80104173:	53                   	push   %ebx
80104174:	83 ec 10             	sub    $0x10,%esp
80104177:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
8010417a:	68 e0 2c 11 80       	push   $0x80112ce0
8010417f:	e8 6c 02 00 00       	call   801043f0 <acquire>
80104184:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104187:	b8 14 2d 11 80       	mov    $0x80112d14,%eax
8010418c:	eb 0c                	jmp    8010419a <kill+0x2a>
8010418e:	66 90                	xchg   %ax,%ax
80104190:	83 c0 7c             	add    $0x7c,%eax
80104193:	3d 14 4c 11 80       	cmp    $0x80114c14,%eax
80104198:	74 3e                	je     801041d8 <kill+0x68>
    if(p->pid == pid){
8010419a:	39 58 10             	cmp    %ebx,0x10(%eax)
8010419d:	75 f1                	jne    80104190 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
8010419f:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
801041a3:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
801041aa:	74 1c                	je     801041c8 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
801041ac:	83 ec 0c             	sub    $0xc,%esp
801041af:	68 e0 2c 11 80       	push   $0x80112ce0
801041b4:	e8 17 04 00 00       	call   801045d0 <release>
      return 0;
801041b9:	83 c4 10             	add    $0x10,%esp
801041bc:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
801041be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801041c1:	c9                   	leave  
801041c2:	c3                   	ret    
801041c3:	90                   	nop
801041c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
801041c8:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
801041cf:	eb db                	jmp    801041ac <kill+0x3c>
801041d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
801041d8:	83 ec 0c             	sub    $0xc,%esp
801041db:	68 e0 2c 11 80       	push   $0x80112ce0
801041e0:	e8 eb 03 00 00       	call   801045d0 <release>
  return -1;
801041e5:	83 c4 10             	add    $0x10,%esp
801041e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801041ed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801041f0:	c9                   	leave  
801041f1:	c3                   	ret    
801041f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801041f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104200 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104200:	55                   	push   %ebp
80104201:	89 e5                	mov    %esp,%ebp
80104203:	57                   	push   %edi
80104204:	56                   	push   %esi
80104205:	53                   	push   %ebx
80104206:	8d 75 e8             	lea    -0x18(%ebp),%esi
80104209:	bb 80 2d 11 80       	mov    $0x80112d80,%ebx
8010420e:	83 ec 3c             	sub    $0x3c,%esp
80104211:	eb 24                	jmp    80104237 <procdump+0x37>
80104213:	90                   	nop
80104214:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104218:	83 ec 0c             	sub    $0xc,%esp
8010421b:	68 46 76 10 80       	push   $0x80107646
80104220:	e8 3b c4 ff ff       	call   80100660 <cprintf>
80104225:	83 c4 10             	add    $0x10,%esp
80104228:	83 c3 7c             	add    $0x7c,%ebx
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010422b:	81 fb 80 4c 11 80    	cmp    $0x80114c80,%ebx
80104231:	0f 84 81 00 00 00    	je     801042b8 <procdump+0xb8>
    if(p->state == UNUSED)
80104237:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010423a:	85 c0                	test   %eax,%eax
8010423c:	74 ea                	je     80104228 <procdump+0x28>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
8010423e:	83 f8 05             	cmp    $0x5,%eax
      state = states[p->state];
    else
      state = "???";
80104241:	ba 08 77 10 80       	mov    $0x80107708,%edx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104246:	77 11                	ja     80104259 <procdump+0x59>
80104248:	8b 14 85 40 77 10 80 	mov    -0x7fef88c0(,%eax,4),%edx
      state = states[p->state];
    else
      state = "???";
8010424f:	b8 08 77 10 80       	mov    $0x80107708,%eax
80104254:	85 d2                	test   %edx,%edx
80104256:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
80104259:	53                   	push   %ebx
8010425a:	52                   	push   %edx
8010425b:	ff 73 a4             	pushl  -0x5c(%ebx)
8010425e:	68 0c 77 10 80       	push   $0x8010770c
80104263:	e8 f8 c3 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
80104268:	83 c4 10             	add    $0x10,%esp
8010426b:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
8010426f:	75 a7                	jne    80104218 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80104271:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104274:	83 ec 08             	sub    $0x8,%esp
80104277:	8d 7d c0             	lea    -0x40(%ebp),%edi
8010427a:	50                   	push   %eax
8010427b:	8b 43 b0             	mov    -0x50(%ebx),%eax
8010427e:	8b 40 0c             	mov    0xc(%eax),%eax
80104281:	83 c0 08             	add    $0x8,%eax
80104284:	50                   	push   %eax
80104285:	e8 36 02 00 00       	call   801044c0 <getcallerpcs>
8010428a:	83 c4 10             	add    $0x10,%esp
8010428d:	8d 76 00             	lea    0x0(%esi),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
80104290:	8b 17                	mov    (%edi),%edx
80104292:	85 d2                	test   %edx,%edx
80104294:	74 82                	je     80104218 <procdump+0x18>
        cprintf(" %p", pc[i]);
80104296:	83 ec 08             	sub    $0x8,%esp
80104299:	83 c7 04             	add    $0x4,%edi
8010429c:	52                   	push   %edx
8010429d:	68 69 71 10 80       	push   $0x80107169
801042a2:	e8 b9 c3 ff ff       	call   80100660 <cprintf>
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
801042a7:	83 c4 10             	add    $0x10,%esp
801042aa:	39 f7                	cmp    %esi,%edi
801042ac:	75 e2                	jne    80104290 <procdump+0x90>
801042ae:	e9 65 ff ff ff       	jmp    80104218 <procdump+0x18>
801042b3:	90                   	nop
801042b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
801042b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801042bb:	5b                   	pop    %ebx
801042bc:	5e                   	pop    %esi
801042bd:	5f                   	pop    %edi
801042be:	5d                   	pop    %ebp
801042bf:	c3                   	ret    

801042c0 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
801042c0:	55                   	push   %ebp
801042c1:	89 e5                	mov    %esp,%ebp
801042c3:	53                   	push   %ebx
801042c4:	83 ec 0c             	sub    $0xc,%esp
801042c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
801042ca:	68 58 77 10 80       	push   $0x80107758
801042cf:	8d 43 04             	lea    0x4(%ebx),%eax
801042d2:	50                   	push   %eax
801042d3:	e8 f8 00 00 00       	call   801043d0 <initlock>
  lk->name = name;
801042d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
801042db:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
801042e1:	83 c4 10             	add    $0x10,%esp
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
  lk->locked = 0;
  lk->pid = 0;
801042e4:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)

void
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
801042eb:	89 43 38             	mov    %eax,0x38(%ebx)
  lk->locked = 0;
  lk->pid = 0;
}
801042ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801042f1:	c9                   	leave  
801042f2:	c3                   	ret    
801042f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801042f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104300 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
80104300:	55                   	push   %ebp
80104301:	89 e5                	mov    %esp,%ebp
80104303:	56                   	push   %esi
80104304:	53                   	push   %ebx
80104305:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104308:	83 ec 0c             	sub    $0xc,%esp
8010430b:	8d 73 04             	lea    0x4(%ebx),%esi
8010430e:	56                   	push   %esi
8010430f:	e8 dc 00 00 00       	call   801043f0 <acquire>
  while (lk->locked) {
80104314:	8b 13                	mov    (%ebx),%edx
80104316:	83 c4 10             	add    $0x10,%esp
80104319:	85 d2                	test   %edx,%edx
8010431b:	74 16                	je     80104333 <acquiresleep+0x33>
8010431d:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
80104320:	83 ec 08             	sub    $0x8,%esp
80104323:	56                   	push   %esi
80104324:	53                   	push   %ebx
80104325:	e8 46 fc ff ff       	call   80103f70 <sleep>

void
acquiresleep(struct sleeplock *lk)
{
  acquire(&lk->lk);
  while (lk->locked) {
8010432a:	8b 03                	mov    (%ebx),%eax
8010432c:	83 c4 10             	add    $0x10,%esp
8010432f:	85 c0                	test   %eax,%eax
80104331:	75 ed                	jne    80104320 <acquiresleep+0x20>
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
80104333:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = proc->pid;
80104339:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010433f:	8b 40 10             	mov    0x10(%eax),%eax
80104342:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80104345:	89 75 08             	mov    %esi,0x8(%ebp)
}
80104348:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010434b:	5b                   	pop    %ebx
8010434c:	5e                   	pop    %esi
8010434d:	5d                   	pop    %ebp
  while (lk->locked) {
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
  lk->pid = proc->pid;
  release(&lk->lk);
8010434e:	e9 7d 02 00 00       	jmp    801045d0 <release>
80104353:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104360 <releasesleep>:
}

void
releasesleep(struct sleeplock *lk)
{
80104360:	55                   	push   %ebp
80104361:	89 e5                	mov    %esp,%ebp
80104363:	56                   	push   %esi
80104364:	53                   	push   %ebx
80104365:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104368:	83 ec 0c             	sub    $0xc,%esp
8010436b:	8d 73 04             	lea    0x4(%ebx),%esi
8010436e:	56                   	push   %esi
8010436f:	e8 7c 00 00 00       	call   801043f0 <acquire>
  lk->locked = 0;
80104374:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010437a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104381:	89 1c 24             	mov    %ebx,(%esp)
80104384:	e8 87 fd ff ff       	call   80104110 <wakeup>
  release(&lk->lk);
80104389:	89 75 08             	mov    %esi,0x8(%ebp)
8010438c:	83 c4 10             	add    $0x10,%esp
}
8010438f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104392:	5b                   	pop    %ebx
80104393:	5e                   	pop    %esi
80104394:	5d                   	pop    %ebp
{
  acquire(&lk->lk);
  lk->locked = 0;
  lk->pid = 0;
  wakeup(lk);
  release(&lk->lk);
80104395:	e9 36 02 00 00       	jmp    801045d0 <release>
8010439a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801043a0 <holdingsleep>:
}

int
holdingsleep(struct sleeplock *lk)
{
801043a0:	55                   	push   %ebp
801043a1:	89 e5                	mov    %esp,%ebp
801043a3:	56                   	push   %esi
801043a4:	53                   	push   %ebx
801043a5:	8b 75 08             	mov    0x8(%ebp),%esi
  int r;
  
  acquire(&lk->lk);
801043a8:	83 ec 0c             	sub    $0xc,%esp
801043ab:	8d 5e 04             	lea    0x4(%esi),%ebx
801043ae:	53                   	push   %ebx
801043af:	e8 3c 00 00 00       	call   801043f0 <acquire>
  r = lk->locked;
801043b4:	8b 36                	mov    (%esi),%esi
  release(&lk->lk);
801043b6:	89 1c 24             	mov    %ebx,(%esp)
801043b9:	e8 12 02 00 00       	call   801045d0 <release>
  return r;
}
801043be:	8d 65 f8             	lea    -0x8(%ebp),%esp
801043c1:	89 f0                	mov    %esi,%eax
801043c3:	5b                   	pop    %ebx
801043c4:	5e                   	pop    %esi
801043c5:	5d                   	pop    %ebp
801043c6:	c3                   	ret    
801043c7:	66 90                	xchg   %ax,%ax
801043c9:	66 90                	xchg   %ax,%ax
801043cb:	66 90                	xchg   %ax,%ax
801043cd:	66 90                	xchg   %ax,%ax
801043cf:	90                   	nop

801043d0 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
801043d0:	55                   	push   %ebp
801043d1:	89 e5                	mov    %esp,%ebp
801043d3:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
801043d6:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
801043d9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
  lk->name = name;
801043df:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
  lk->cpu = 0;
801043e2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
801043e9:	5d                   	pop    %ebp
801043ea:	c3                   	ret    
801043eb:	90                   	nop
801043ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801043f0 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
801043f0:	55                   	push   %ebp
801043f1:	89 e5                	mov    %esp,%ebp
801043f3:	53                   	push   %ebx
801043f4:	83 ec 04             	sub    $0x4,%esp
801043f7:	9c                   	pushf  
801043f8:	5a                   	pop    %edx
}

static inline void
cli(void)
{
  asm volatile("cli");
801043f9:	fa                   	cli    
{
  int eflags;

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
801043fa:	65 8b 0d 00 00 00 00 	mov    %gs:0x0,%ecx
80104401:	8b 81 ac 00 00 00    	mov    0xac(%ecx),%eax
80104407:	85 c0                	test   %eax,%eax
80104409:	75 0c                	jne    80104417 <acquire+0x27>
    cpu->intena = eflags & FL_IF;
8010440b:	81 e2 00 02 00 00    	and    $0x200,%edx
80104411:	89 91 b0 00 00 00    	mov    %edx,0xb0(%ecx)
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
80104417:	8b 55 08             	mov    0x8(%ebp),%edx

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
    cpu->intena = eflags & FL_IF;
  cpu->ncli += 1;
8010441a:	83 c0 01             	add    $0x1,%eax
8010441d:	89 81 ac 00 00 00    	mov    %eax,0xac(%ecx)

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
80104423:	8b 02                	mov    (%edx),%eax
80104425:	85 c0                	test   %eax,%eax
80104427:	74 05                	je     8010442e <acquire+0x3e>
80104429:	39 4a 08             	cmp    %ecx,0x8(%edx)
8010442c:	74 7a                	je     801044a8 <acquire+0xb8>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
8010442e:	b9 01 00 00 00       	mov    $0x1,%ecx
80104433:	90                   	nop
80104434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104438:	89 c8                	mov    %ecx,%eax
8010443a:	f0 87 02             	lock xchg %eax,(%edx)
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");

  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
8010443d:	85 c0                	test   %eax,%eax
8010443f:	75 f7                	jne    80104438 <acquire+0x48>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
80104441:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
80104446:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104449:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
getcallerpcs(void *v, uint pcs[])
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
8010444f:	89 ea                	mov    %ebp,%edx
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
80104451:	89 41 08             	mov    %eax,0x8(%ecx)
  getcallerpcs(&lk, lk->pcs);
80104454:	83 c1 0c             	add    $0xc,%ecx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104457:	31 c0                	xor    %eax,%eax
80104459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104460:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104466:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010446c:	77 1a                	ja     80104488 <acquire+0x98>
      break;
    pcs[i] = ebp[1];     // saved %eip
8010446e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104471:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104474:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
80104477:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104479:	83 f8 0a             	cmp    $0xa,%eax
8010447c:	75 e2                	jne    80104460 <acquire+0x70>
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
  getcallerpcs(&lk, lk->pcs);
}
8010447e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104481:	c9                   	leave  
80104482:	c3                   	ret    
80104483:	90                   	nop
80104484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
80104488:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010448f:	83 c0 01             	add    $0x1,%eax
80104492:	83 f8 0a             	cmp    $0xa,%eax
80104495:	74 e7                	je     8010447e <acquire+0x8e>
    pcs[i] = 0;
80104497:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010449e:	83 c0 01             	add    $0x1,%eax
801044a1:	83 f8 0a             	cmp    $0xa,%eax
801044a4:	75 e2                	jne    80104488 <acquire+0x98>
801044a6:	eb d6                	jmp    8010447e <acquire+0x8e>
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");
801044a8:	83 ec 0c             	sub    $0xc,%esp
801044ab:	68 63 77 10 80       	push   $0x80107763
801044b0:	e8 bb be ff ff       	call   80100370 <panic>
801044b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801044c0 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
801044c0:	55                   	push   %ebp
801044c1:	89 e5                	mov    %esp,%ebp
801044c3:	53                   	push   %ebx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
801044c4:	8b 45 08             	mov    0x8(%ebp),%eax
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
801044c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
801044ca:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
801044cd:	31 c0                	xor    %eax,%eax
801044cf:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801044d0:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801044d6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801044dc:	77 1a                	ja     801044f8 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
801044de:	8b 5a 04             	mov    0x4(%edx),%ebx
801044e1:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801044e4:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
801044e7:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801044e9:	83 f8 0a             	cmp    $0xa,%eax
801044ec:	75 e2                	jne    801044d0 <getcallerpcs+0x10>
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
801044ee:	5b                   	pop    %ebx
801044ef:	5d                   	pop    %ebp
801044f0:	c3                   	ret    
801044f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
801044f8:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801044ff:	83 c0 01             	add    $0x1,%eax
80104502:	83 f8 0a             	cmp    $0xa,%eax
80104505:	74 e7                	je     801044ee <getcallerpcs+0x2e>
    pcs[i] = 0;
80104507:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010450e:	83 c0 01             	add    $0x1,%eax
80104511:	83 f8 0a             	cmp    $0xa,%eax
80104514:	75 e2                	jne    801044f8 <getcallerpcs+0x38>
80104516:	eb d6                	jmp    801044ee <getcallerpcs+0x2e>
80104518:	90                   	nop
80104519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104520 <holding>:
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
80104520:	55                   	push   %ebp
80104521:	89 e5                	mov    %esp,%ebp
80104523:	8b 55 08             	mov    0x8(%ebp),%edx
  return lock->locked && lock->cpu == cpu;
80104526:	8b 02                	mov    (%edx),%eax
80104528:	85 c0                	test   %eax,%eax
8010452a:	74 14                	je     80104540 <holding+0x20>
8010452c:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104532:	39 42 08             	cmp    %eax,0x8(%edx)
}
80104535:	5d                   	pop    %ebp

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
80104536:	0f 94 c0             	sete   %al
80104539:	0f b6 c0             	movzbl %al,%eax
}
8010453c:	c3                   	ret    
8010453d:	8d 76 00             	lea    0x0(%esi),%esi
80104540:	31 c0                	xor    %eax,%eax
80104542:	5d                   	pop    %ebp
80104543:	c3                   	ret    
80104544:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010454a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104550 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104550:	55                   	push   %ebp
80104551:	89 e5                	mov    %esp,%ebp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104553:	9c                   	pushf  
80104554:	59                   	pop    %ecx
}

static inline void
cli(void)
{
  asm volatile("cli");
80104555:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
80104556:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
8010455d:	8b 82 ac 00 00 00    	mov    0xac(%edx),%eax
80104563:	85 c0                	test   %eax,%eax
80104565:	75 0c                	jne    80104573 <pushcli+0x23>
    cpu->intena = eflags & FL_IF;
80104567:	81 e1 00 02 00 00    	and    $0x200,%ecx
8010456d:	89 8a b0 00 00 00    	mov    %ecx,0xb0(%edx)
  cpu->ncli += 1;
80104573:	83 c0 01             	add    $0x1,%eax
80104576:	89 82 ac 00 00 00    	mov    %eax,0xac(%edx)
}
8010457c:	5d                   	pop    %ebp
8010457d:	c3                   	ret    
8010457e:	66 90                	xchg   %ax,%ax

80104580 <popcli>:

void
popcli(void)
{
80104580:	55                   	push   %ebp
80104581:	89 e5                	mov    %esp,%ebp
80104583:	83 ec 08             	sub    $0x8,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104586:	9c                   	pushf  
80104587:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80104588:	f6 c4 02             	test   $0x2,%ah
8010458b:	75 2c                	jne    801045b9 <popcli+0x39>
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
8010458d:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104594:	83 aa ac 00 00 00 01 	subl   $0x1,0xac(%edx)
8010459b:	78 0f                	js     801045ac <popcli+0x2c>
    panic("popcli");
  if(cpu->ncli == 0 && cpu->intena)
8010459d:	75 0b                	jne    801045aa <popcli+0x2a>
8010459f:	8b 82 b0 00 00 00    	mov    0xb0(%edx),%eax
801045a5:	85 c0                	test   %eax,%eax
801045a7:	74 01                	je     801045aa <popcli+0x2a>
}

static inline void
sti(void)
{
  asm volatile("sti");
801045a9:	fb                   	sti    
    sti();
}
801045aa:	c9                   	leave  
801045ab:	c3                   	ret    
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
    panic("popcli");
801045ac:	83 ec 0c             	sub    $0xc,%esp
801045af:	68 82 77 10 80       	push   $0x80107782
801045b4:	e8 b7 bd ff ff       	call   80100370 <panic>

void
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
801045b9:	83 ec 0c             	sub    $0xc,%esp
801045bc:	68 6b 77 10 80       	push   $0x8010776b
801045c1:	e8 aa bd ff ff       	call   80100370 <panic>
801045c6:	8d 76 00             	lea    0x0(%esi),%esi
801045c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045d0 <release>:
}

// Release the lock.
void
release(struct spinlock *lk)
{
801045d0:	55                   	push   %ebp
801045d1:	89 e5                	mov    %esp,%ebp
801045d3:	83 ec 08             	sub    $0x8,%esp
801045d6:	8b 45 08             	mov    0x8(%ebp),%eax

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
801045d9:	8b 10                	mov    (%eax),%edx
801045db:	85 d2                	test   %edx,%edx
801045dd:	74 0c                	je     801045eb <release+0x1b>
801045df:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
801045e6:	39 50 08             	cmp    %edx,0x8(%eax)
801045e9:	74 15                	je     80104600 <release+0x30>
// Release the lock.
void
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");
801045eb:	83 ec 0c             	sub    $0xc,%esp
801045ee:	68 89 77 10 80       	push   $0x80107789
801045f3:	e8 78 bd ff ff       	call   80100370 <panic>
801045f8:	90                   	nop
801045f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  lk->pcs[0] = 0;
80104600:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  lk->cpu = 0;
80104607:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
8010460e:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
80104613:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  popcli();
}
80104619:	c9                   	leave  
  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );

  popcli();
8010461a:	e9 61 ff ff ff       	jmp    80104580 <popcli>
8010461f:	90                   	nop

80104620 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
80104620:	55                   	push   %ebp
80104621:	89 e5                	mov    %esp,%ebp
80104623:	57                   	push   %edi
80104624:	53                   	push   %ebx
80104625:	8b 55 08             	mov    0x8(%ebp),%edx
80104628:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
8010462b:	f6 c2 03             	test   $0x3,%dl
8010462e:	75 05                	jne    80104635 <memset+0x15>
80104630:	f6 c1 03             	test   $0x3,%cl
80104633:	74 13                	je     80104648 <memset+0x28>
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
80104635:	89 d7                	mov    %edx,%edi
80104637:	8b 45 0c             	mov    0xc(%ebp),%eax
8010463a:	fc                   	cld    
8010463b:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
8010463d:	5b                   	pop    %ebx
8010463e:	89 d0                	mov    %edx,%eax
80104640:	5f                   	pop    %edi
80104641:	5d                   	pop    %ebp
80104642:	c3                   	ret    
80104643:	90                   	nop
80104644:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

void*
memset(void *dst, int c, uint n)
{
  if ((int)dst%4 == 0 && n%4 == 0){
    c &= 0xFF;
80104648:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
}

static inline void
stosl(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosl" :
8010464c:	c1 e9 02             	shr    $0x2,%ecx
8010464f:	89 fb                	mov    %edi,%ebx
80104651:	89 f8                	mov    %edi,%eax
80104653:	c1 e3 18             	shl    $0x18,%ebx
80104656:	c1 e0 10             	shl    $0x10,%eax
80104659:	09 d8                	or     %ebx,%eax
8010465b:	09 f8                	or     %edi,%eax
8010465d:	c1 e7 08             	shl    $0x8,%edi
80104660:	09 f8                	or     %edi,%eax
80104662:	89 d7                	mov    %edx,%edi
80104664:	fc                   	cld    
80104665:	f3 ab                	rep stos %eax,%es:(%edi)
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
80104667:	5b                   	pop    %ebx
80104668:	89 d0                	mov    %edx,%eax
8010466a:	5f                   	pop    %edi
8010466b:	5d                   	pop    %ebp
8010466c:	c3                   	ret    
8010466d:	8d 76 00             	lea    0x0(%esi),%esi

80104670 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
80104670:	55                   	push   %ebp
80104671:	89 e5                	mov    %esp,%ebp
80104673:	57                   	push   %edi
80104674:	56                   	push   %esi
80104675:	8b 45 10             	mov    0x10(%ebp),%eax
80104678:	53                   	push   %ebx
80104679:	8b 75 0c             	mov    0xc(%ebp),%esi
8010467c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
8010467f:	85 c0                	test   %eax,%eax
80104681:	74 29                	je     801046ac <memcmp+0x3c>
    if(*s1 != *s2)
80104683:	0f b6 13             	movzbl (%ebx),%edx
80104686:	0f b6 0e             	movzbl (%esi),%ecx
80104689:	38 d1                	cmp    %dl,%cl
8010468b:	75 2b                	jne    801046b8 <memcmp+0x48>
8010468d:	8d 78 ff             	lea    -0x1(%eax),%edi
80104690:	31 c0                	xor    %eax,%eax
80104692:	eb 14                	jmp    801046a8 <memcmp+0x38>
80104694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104698:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
8010469d:	83 c0 01             	add    $0x1,%eax
801046a0:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
801046a4:	38 ca                	cmp    %cl,%dl
801046a6:	75 10                	jne    801046b8 <memcmp+0x48>
{
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
801046a8:	39 f8                	cmp    %edi,%eax
801046aa:	75 ec                	jne    80104698 <memcmp+0x28>
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
801046ac:	5b                   	pop    %ebx
    if(*s1 != *s2)
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
801046ad:	31 c0                	xor    %eax,%eax
}
801046af:	5e                   	pop    %esi
801046b0:	5f                   	pop    %edi
801046b1:	5d                   	pop    %ebp
801046b2:	c3                   	ret    
801046b3:	90                   	nop
801046b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
801046b8:	0f b6 c2             	movzbl %dl,%eax
    s1++, s2++;
  }

  return 0;
}
801046bb:	5b                   	pop    %ebx

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
801046bc:	29 c8                	sub    %ecx,%eax
    s1++, s2++;
  }

  return 0;
}
801046be:	5e                   	pop    %esi
801046bf:	5f                   	pop    %edi
801046c0:	5d                   	pop    %ebp
801046c1:	c3                   	ret    
801046c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801046c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046d0 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
801046d0:	55                   	push   %ebp
801046d1:	89 e5                	mov    %esp,%ebp
801046d3:	56                   	push   %esi
801046d4:	53                   	push   %ebx
801046d5:	8b 45 08             	mov    0x8(%ebp),%eax
801046d8:	8b 75 0c             	mov    0xc(%ebp),%esi
801046db:	8b 5d 10             	mov    0x10(%ebp),%ebx
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
801046de:	39 c6                	cmp    %eax,%esi
801046e0:	73 2e                	jae    80104710 <memmove+0x40>
801046e2:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
801046e5:	39 c8                	cmp    %ecx,%eax
801046e7:	73 27                	jae    80104710 <memmove+0x40>
    s += n;
    d += n;
    while(n-- > 0)
801046e9:	85 db                	test   %ebx,%ebx
801046eb:	8d 53 ff             	lea    -0x1(%ebx),%edx
801046ee:	74 17                	je     80104707 <memmove+0x37>
      *--d = *--s;
801046f0:	29 d9                	sub    %ebx,%ecx
801046f2:	89 cb                	mov    %ecx,%ebx
801046f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801046f8:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801046fc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  s = src;
  d = dst;
  if(s < d && s + n > d){
    s += n;
    d += n;
    while(n-- > 0)
801046ff:	83 ea 01             	sub    $0x1,%edx
80104702:	83 fa ff             	cmp    $0xffffffff,%edx
80104705:	75 f1                	jne    801046f8 <memmove+0x28>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
80104707:	5b                   	pop    %ebx
80104708:	5e                   	pop    %esi
80104709:	5d                   	pop    %ebp
8010470a:	c3                   	ret    
8010470b:	90                   	nop
8010470c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
80104710:	31 d2                	xor    %edx,%edx
80104712:	85 db                	test   %ebx,%ebx
80104714:	74 f1                	je     80104707 <memmove+0x37>
80104716:	8d 76 00             	lea    0x0(%esi),%esi
80104719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      *d++ = *s++;
80104720:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104724:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104727:	83 c2 01             	add    $0x1,%edx
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
8010472a:	39 d3                	cmp    %edx,%ebx
8010472c:	75 f2                	jne    80104720 <memmove+0x50>
      *d++ = *s++;

  return dst;
}
8010472e:	5b                   	pop    %ebx
8010472f:	5e                   	pop    %esi
80104730:	5d                   	pop    %ebp
80104731:	c3                   	ret    
80104732:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104740 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
80104740:	55                   	push   %ebp
80104741:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
80104743:	5d                   	pop    %ebp

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
  return memmove(dst, src, n);
80104744:	eb 8a                	jmp    801046d0 <memmove>
80104746:	8d 76 00             	lea    0x0(%esi),%esi
80104749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104750 <strncmp>:
}

int
strncmp(const char *p, const char *q, uint n)
{
80104750:	55                   	push   %ebp
80104751:	89 e5                	mov    %esp,%ebp
80104753:	57                   	push   %edi
80104754:	56                   	push   %esi
80104755:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104758:	53                   	push   %ebx
80104759:	8b 7d 08             	mov    0x8(%ebp),%edi
8010475c:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n > 0 && *p && *p == *q)
8010475f:	85 c9                	test   %ecx,%ecx
80104761:	74 37                	je     8010479a <strncmp+0x4a>
80104763:	0f b6 17             	movzbl (%edi),%edx
80104766:	0f b6 1e             	movzbl (%esi),%ebx
80104769:	84 d2                	test   %dl,%dl
8010476b:	74 3f                	je     801047ac <strncmp+0x5c>
8010476d:	38 d3                	cmp    %dl,%bl
8010476f:	75 3b                	jne    801047ac <strncmp+0x5c>
80104771:	8d 47 01             	lea    0x1(%edi),%eax
80104774:	01 cf                	add    %ecx,%edi
80104776:	eb 1b                	jmp    80104793 <strncmp+0x43>
80104778:	90                   	nop
80104779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104780:	0f b6 10             	movzbl (%eax),%edx
80104783:	84 d2                	test   %dl,%dl
80104785:	74 21                	je     801047a8 <strncmp+0x58>
80104787:	0f b6 19             	movzbl (%ecx),%ebx
8010478a:	83 c0 01             	add    $0x1,%eax
8010478d:	89 ce                	mov    %ecx,%esi
8010478f:	38 da                	cmp    %bl,%dl
80104791:	75 19                	jne    801047ac <strncmp+0x5c>
80104793:	39 c7                	cmp    %eax,%edi
    n--, p++, q++;
80104795:	8d 4e 01             	lea    0x1(%esi),%ecx
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
80104798:	75 e6                	jne    80104780 <strncmp+0x30>
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
8010479a:	5b                   	pop    %ebx
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
8010479b:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}
8010479d:	5e                   	pop    %esi
8010479e:	5f                   	pop    %edi
8010479f:	5d                   	pop    %ebp
801047a0:	c3                   	ret    
801047a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801047a8:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
801047ac:	0f b6 c2             	movzbl %dl,%eax
801047af:	29 d8                	sub    %ebx,%eax
}
801047b1:	5b                   	pop    %ebx
801047b2:	5e                   	pop    %esi
801047b3:	5f                   	pop    %edi
801047b4:	5d                   	pop    %ebp
801047b5:	c3                   	ret    
801047b6:	8d 76 00             	lea    0x0(%esi),%esi
801047b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047c0 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
801047c0:	55                   	push   %ebp
801047c1:	89 e5                	mov    %esp,%ebp
801047c3:	56                   	push   %esi
801047c4:	53                   	push   %ebx
801047c5:	8b 45 08             	mov    0x8(%ebp),%eax
801047c8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801047cb:	8b 4d 10             	mov    0x10(%ebp),%ecx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
801047ce:	89 c2                	mov    %eax,%edx
801047d0:	eb 19                	jmp    801047eb <strncpy+0x2b>
801047d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801047d8:	83 c3 01             	add    $0x1,%ebx
801047db:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
801047df:	83 c2 01             	add    $0x1,%edx
801047e2:	84 c9                	test   %cl,%cl
801047e4:	88 4a ff             	mov    %cl,-0x1(%edx)
801047e7:	74 09                	je     801047f2 <strncpy+0x32>
801047e9:	89 f1                	mov    %esi,%ecx
801047eb:	85 c9                	test   %ecx,%ecx
801047ed:	8d 71 ff             	lea    -0x1(%ecx),%esi
801047f0:	7f e6                	jg     801047d8 <strncpy+0x18>
    ;
  while(n-- > 0)
801047f2:	31 c9                	xor    %ecx,%ecx
801047f4:	85 f6                	test   %esi,%esi
801047f6:	7e 17                	jle    8010480f <strncpy+0x4f>
801047f8:	90                   	nop
801047f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    *s++ = 0;
80104800:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104804:	89 f3                	mov    %esi,%ebx
80104806:	83 c1 01             	add    $0x1,%ecx
80104809:	29 cb                	sub    %ecx,%ebx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
8010480b:	85 db                	test   %ebx,%ebx
8010480d:	7f f1                	jg     80104800 <strncpy+0x40>
    *s++ = 0;
  return os;
}
8010480f:	5b                   	pop    %ebx
80104810:	5e                   	pop    %esi
80104811:	5d                   	pop    %ebp
80104812:	c3                   	ret    
80104813:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104820 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
80104820:	55                   	push   %ebp
80104821:	89 e5                	mov    %esp,%ebp
80104823:	56                   	push   %esi
80104824:	53                   	push   %ebx
80104825:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104828:	8b 45 08             	mov    0x8(%ebp),%eax
8010482b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  if(n <= 0)
8010482e:	85 c9                	test   %ecx,%ecx
80104830:	7e 26                	jle    80104858 <safestrcpy+0x38>
80104832:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104836:	89 c1                	mov    %eax,%ecx
80104838:	eb 17                	jmp    80104851 <safestrcpy+0x31>
8010483a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
80104840:	83 c2 01             	add    $0x1,%edx
80104843:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104847:	83 c1 01             	add    $0x1,%ecx
8010484a:	84 db                	test   %bl,%bl
8010484c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010484f:	74 04                	je     80104855 <safestrcpy+0x35>
80104851:	39 f2                	cmp    %esi,%edx
80104853:	75 eb                	jne    80104840 <safestrcpy+0x20>
    ;
  *s = 0;
80104855:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
80104858:	5b                   	pop    %ebx
80104859:	5e                   	pop    %esi
8010485a:	5d                   	pop    %ebp
8010485b:	c3                   	ret    
8010485c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104860 <strlen>:

int
strlen(const char *s)
{
80104860:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104861:	31 c0                	xor    %eax,%eax
  return os;
}

int
strlen(const char *s)
{
80104863:	89 e5                	mov    %esp,%ebp
80104865:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
80104868:	80 3a 00             	cmpb   $0x0,(%edx)
8010486b:	74 0c                	je     80104879 <strlen+0x19>
8010486d:	8d 76 00             	lea    0x0(%esi),%esi
80104870:	83 c0 01             	add    $0x1,%eax
80104873:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104877:	75 f7                	jne    80104870 <strlen+0x10>
    ;
  return n;
}
80104879:	5d                   	pop    %ebp
8010487a:	c3                   	ret    

8010487b <swtch>:
# Save current register context in old
# and then load register context from new.

.globl swtch
swtch:
  movl 4(%esp), %eax
8010487b:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
8010487f:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-save registers
  pushl %ebp
80104883:	55                   	push   %ebp
  pushl %ebx
80104884:	53                   	push   %ebx
  pushl %esi
80104885:	56                   	push   %esi
  pushl %edi
80104886:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80104887:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
80104889:	89 d4                	mov    %edx,%esp

  # Load new callee-save registers
  popl %edi
8010488b:	5f                   	pop    %edi
  popl %esi
8010488c:	5e                   	pop    %esi
  popl %ebx
8010488d:	5b                   	pop    %ebx
  popl %ebp
8010488e:	5d                   	pop    %ebp
  ret
8010488f:	c3                   	ret    

80104890 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104890:	55                   	push   %ebp
  if(addr >= proc->sz || addr+4 > proc->sz)
80104891:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104898:	89 e5                	mov    %esp,%ebp
8010489a:	8b 45 08             	mov    0x8(%ebp),%eax
  if(addr >= proc->sz || addr+4 > proc->sz)
8010489d:	8b 12                	mov    (%edx),%edx
8010489f:	39 c2                	cmp    %eax,%edx
801048a1:	76 15                	jbe    801048b8 <fetchint+0x28>
801048a3:	8d 48 04             	lea    0x4(%eax),%ecx
801048a6:	39 ca                	cmp    %ecx,%edx
801048a8:	72 0e                	jb     801048b8 <fetchint+0x28>
    return -1;
  *ip = *(int*)(addr);
801048aa:	8b 10                	mov    (%eax),%edx
801048ac:	8b 45 0c             	mov    0xc(%ebp),%eax
801048af:	89 10                	mov    %edx,(%eax)
  return 0;
801048b1:	31 c0                	xor    %eax,%eax
}
801048b3:	5d                   	pop    %ebp
801048b4:	c3                   	ret    
801048b5:	8d 76 00             	lea    0x0(%esi),%esi
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
801048b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  *ip = *(int*)(addr);
  return 0;
}
801048bd:	5d                   	pop    %ebp
801048be:	c3                   	ret    
801048bf:	90                   	nop

801048c0 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
801048c0:	55                   	push   %ebp
  char *s, *ep;

  if(addr >= proc->sz)
801048c1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
801048c7:	89 e5                	mov    %esp,%ebp
801048c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  char *s, *ep;

  if(addr >= proc->sz)
801048cc:	39 08                	cmp    %ecx,(%eax)
801048ce:	76 2c                	jbe    801048fc <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
801048d0:	8b 55 0c             	mov    0xc(%ebp),%edx
801048d3:	89 c8                	mov    %ecx,%eax
801048d5:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
801048d7:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801048de:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
801048e0:	39 d1                	cmp    %edx,%ecx
801048e2:	73 18                	jae    801048fc <fetchstr+0x3c>
    if(*s == 0)
801048e4:	80 39 00             	cmpb   $0x0,(%ecx)
801048e7:	75 0c                	jne    801048f5 <fetchstr+0x35>
801048e9:	eb 1d                	jmp    80104908 <fetchstr+0x48>
801048eb:	90                   	nop
801048ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801048f0:	80 38 00             	cmpb   $0x0,(%eax)
801048f3:	74 13                	je     80104908 <fetchstr+0x48>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
801048f5:	83 c0 01             	add    $0x1,%eax
801048f8:	39 c2                	cmp    %eax,%edx
801048fa:	77 f4                	ja     801048f0 <fetchstr+0x30>
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
    return -1;
801048fc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
  return -1;
}
80104901:	5d                   	pop    %ebp
80104902:	c3                   	ret    
80104903:	90                   	nop
80104904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
80104908:	29 c8                	sub    %ecx,%eax
  return -1;
}
8010490a:	5d                   	pop    %ebp
8010490b:	c3                   	ret    
8010490c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104910 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104910:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
}

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104917:	55                   	push   %ebp
80104918:	89 e5                	mov    %esp,%ebp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
8010491a:	8b 42 18             	mov    0x18(%edx),%eax
8010491d:	8b 4d 08             	mov    0x8(%ebp),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104920:	8b 12                	mov    (%edx),%edx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104922:	8b 40 44             	mov    0x44(%eax),%eax
80104925:	8d 04 88             	lea    (%eax,%ecx,4),%eax
80104928:	8d 48 04             	lea    0x4(%eax),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
8010492b:	39 d1                	cmp    %edx,%ecx
8010492d:	73 19                	jae    80104948 <argint+0x38>
8010492f:	8d 48 08             	lea    0x8(%eax),%ecx
80104932:	39 ca                	cmp    %ecx,%edx
80104934:	72 12                	jb     80104948 <argint+0x38>
    return -1;
  *ip = *(int*)(addr);
80104936:	8b 50 04             	mov    0x4(%eax),%edx
80104939:	8b 45 0c             	mov    0xc(%ebp),%eax
8010493c:	89 10                	mov    %edx,(%eax)
  return 0;
8010493e:	31 c0                	xor    %eax,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
}
80104940:	5d                   	pop    %ebp
80104941:	c3                   	ret    
80104942:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
80104948:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
}
8010494d:	5d                   	pop    %ebp
8010494e:	c3                   	ret    
8010494f:	90                   	nop

80104950 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104950:	55                   	push   %ebp
80104951:	89 e5                	mov    %esp,%ebp
80104953:	83 ec 08             	sub    $0x8,%esp

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104956:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010495c:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010495f:	8b 50 18             	mov    0x18(%eax),%edx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104962:	8b 00                	mov    (%eax),%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104964:	8b 52 44             	mov    0x44(%edx),%edx
80104967:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
8010496a:	8d 4a 04             	lea    0x4(%edx),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
8010496d:	39 c1                	cmp    %eax,%ecx
8010496f:	73 27                	jae    80104998 <argptr+0x48>
80104971:	8d 4a 08             	lea    0x8(%edx),%ecx
80104974:	39 c8                	cmp    %ecx,%eax
80104976:	72 20                	jb     80104998 <argptr+0x48>
    return -1;
  *ip = *(int*)(addr);
80104978:	8b 52 04             	mov    0x4(%edx),%edx

  if(argint(n, &i) < 0) {
     cprintf ("Testing");
      return -1;
   }
  if((uint)i >= proc->sz || (uint)i+size > proc->sz)
8010497b:	39 c2                	cmp    %eax,%edx
8010497d:	73 29                	jae    801049a8 <argptr+0x58>
8010497f:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104982:	01 d1                	add    %edx,%ecx
80104984:	39 c1                	cmp    %eax,%ecx
80104986:	77 20                	ja     801049a8 <argptr+0x58>
    return -1;
  *pp = (char*)i;
80104988:	8b 45 0c             	mov    0xc(%ebp),%eax
8010498b:	89 10                	mov    %edx,(%eax)
  return 0;
8010498d:	31 c0                	xor    %eax,%eax
}
8010498f:	c9                   	leave  
80104990:	c3                   	ret    
80104991:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
argptr(int n, char **pp, int size)
{
  int i;

  if(argint(n, &i) < 0) {
     cprintf ("Testing");
80104998:	83 ec 0c             	sub    $0xc,%esp
8010499b:	68 91 77 10 80       	push   $0x80107791
801049a0:	e8 bb bc ff ff       	call   80100660 <cprintf>
      return -1;
801049a5:	83 c4 10             	add    $0x10,%esp
801049a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   }
  if((uint)i >= proc->sz || (uint)i+size > proc->sz)
    return -1;
  *pp = (char*)i;
  return 0;
}
801049ad:	c9                   	leave  
801049ae:	c3                   	ret    
801049af:	90                   	nop

801049b0 <argstr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801049b0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
801049b6:	55                   	push   %ebp
801049b7:	89 e5                	mov    %esp,%ebp

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801049b9:	8b 50 18             	mov    0x18(%eax),%edx
801049bc:	8b 4d 08             	mov    0x8(%ebp),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
801049bf:	8b 00                	mov    (%eax),%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801049c1:	8b 52 44             	mov    0x44(%edx),%edx
801049c4:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
801049c7:	8d 4a 04             	lea    0x4(%edx),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
801049ca:	39 c1                	cmp    %eax,%ecx
801049cc:	73 07                	jae    801049d5 <argstr+0x25>
801049ce:	8d 4a 08             	lea    0x8(%edx),%ecx
801049d1:	39 c8                	cmp    %ecx,%eax
801049d3:	73 0b                	jae    801049e0 <argstr+0x30>
int
argstr(int n, char **pp)
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
801049d5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchstr(addr, pp);
}
801049da:	5d                   	pop    %ebp
801049db:	c3                   	ret    
801049dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
  *ip = *(int*)(addr);
801049e0:	8b 4a 04             	mov    0x4(%edx),%ecx
int
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
801049e3:	39 c1                	cmp    %eax,%ecx
801049e5:	73 ee                	jae    801049d5 <argstr+0x25>
    return -1;
  *pp = (char*)addr;
801049e7:	8b 55 0c             	mov    0xc(%ebp),%edx
801049ea:	89 c8                	mov    %ecx,%eax
801049ec:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
801049ee:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801049f5:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
801049f7:	39 d1                	cmp    %edx,%ecx
801049f9:	73 da                	jae    801049d5 <argstr+0x25>
    if(*s == 0)
801049fb:	80 39 00             	cmpb   $0x0,(%ecx)
801049fe:	75 0d                	jne    80104a0d <argstr+0x5d>
80104a00:	eb 1e                	jmp    80104a20 <argstr+0x70>
80104a02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104a08:	80 38 00             	cmpb   $0x0,(%eax)
80104a0b:	74 13                	je     80104a20 <argstr+0x70>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
80104a0d:	83 c0 01             	add    $0x1,%eax
80104a10:	39 c2                	cmp    %eax,%edx
80104a12:	77 f4                	ja     80104a08 <argstr+0x58>
80104a14:	eb bf                	jmp    801049d5 <argstr+0x25>
80104a16:	8d 76 00             	lea    0x0(%esi),%esi
80104a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(*s == 0)
      return s - *pp;
80104a20:	29 c8                	sub    %ecx,%eax
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
  return fetchstr(addr, pp);
}
80104a22:	5d                   	pop    %ebp
80104a23:	c3                   	ret    
80104a24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104a2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104a30 <syscall>:
[SYS_halt]   "halt",
};
*/
void
syscall(void)
{
80104a30:	55                   	push   %ebp
80104a31:	89 e5                	mov    %esp,%ebp
80104a33:	53                   	push   %ebx
80104a34:	83 ec 04             	sub    $0x4,%esp
  int num;

  num = proc->tf->eax;
80104a37:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104a3e:	8b 5a 18             	mov    0x18(%edx),%ebx
80104a41:	8b 43 1c             	mov    0x1c(%ebx),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104a44:	8d 48 ff             	lea    -0x1(%eax),%ecx
80104a47:	83 f9 15             	cmp    $0x15,%ecx
80104a4a:	77 1c                	ja     80104a68 <syscall+0x38>
80104a4c:	8b 0c 85 c0 77 10 80 	mov    -0x7fef8840(,%eax,4),%ecx
80104a53:	85 c9                	test   %ecx,%ecx
80104a55:	74 11                	je     80104a68 <syscall+0x38>
    proc->tf->eax = syscalls[num]();
80104a57:	ff d1                	call   *%ecx
80104a59:	89 43 1c             	mov    %eax,0x1c(%ebx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
  }
}
80104a5c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104a5f:	c9                   	leave  
80104a60:	c3                   	ret    
80104a61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
    //cprintf("%s->%d\n",syscallnames[num],syscalls[num]());
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104a68:	50                   	push   %eax
            proc->pid, proc->name, num);
80104a69:	8d 42 6c             	lea    0x6c(%edx),%eax
  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
    //cprintf("%s->%d\n",syscallnames[num],syscalls[num]());
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104a6c:	50                   	push   %eax
80104a6d:	ff 72 10             	pushl  0x10(%edx)
80104a70:	68 99 77 10 80       	push   $0x80107799
80104a75:	e8 e6 bb ff ff       	call   80100660 <cprintf>
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
80104a7a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104a80:	83 c4 10             	add    $0x10,%esp
80104a83:	8b 40 18             	mov    0x18(%eax),%eax
80104a86:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
80104a8d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104a90:	c9                   	leave  
80104a91:	c3                   	ret    
80104a92:	66 90                	xchg   %ax,%ax
80104a94:	66 90                	xchg   %ax,%ax
80104a96:	66 90                	xchg   %ax,%ax
80104a98:	66 90                	xchg   %ax,%ax
80104a9a:	66 90                	xchg   %ax,%ax
80104a9c:	66 90                	xchg   %ax,%ax
80104a9e:	66 90                	xchg   %ax,%ax

80104aa0 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104aa0:	55                   	push   %ebp
80104aa1:	89 e5                	mov    %esp,%ebp
80104aa3:	57                   	push   %edi
80104aa4:	56                   	push   %esi
80104aa5:	53                   	push   %ebx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104aa6:	8d 75 da             	lea    -0x26(%ebp),%esi
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104aa9:	83 ec 44             	sub    $0x44,%esp
80104aac:	89 4d c0             	mov    %ecx,-0x40(%ebp)
80104aaf:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104ab2:	56                   	push   %esi
80104ab3:	50                   	push   %eax
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104ab4:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104ab7:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104aba:	e8 81 d5 ff ff       	call   80102040 <nameiparent>
80104abf:	83 c4 10             	add    $0x10,%esp
80104ac2:	85 c0                	test   %eax,%eax
80104ac4:	0f 84 f6 00 00 00    	je     80104bc0 <create+0x120>
    return 0;
  ilock(dp);
80104aca:	83 ec 0c             	sub    $0xc,%esp
80104acd:	89 c7                	mov    %eax,%edi
80104acf:	50                   	push   %eax
80104ad0:	e8 5b cc ff ff       	call   80101730 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
80104ad5:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104ad8:	83 c4 0c             	add    $0xc,%esp
80104adb:	50                   	push   %eax
80104adc:	56                   	push   %esi
80104add:	57                   	push   %edi
80104ade:	e8 1d d2 ff ff       	call   80101d00 <dirlookup>
80104ae3:	83 c4 10             	add    $0x10,%esp
80104ae6:	85 c0                	test   %eax,%eax
80104ae8:	89 c3                	mov    %eax,%ebx
80104aea:	74 54                	je     80104b40 <create+0xa0>
    iunlockput(dp);
80104aec:	83 ec 0c             	sub    $0xc,%esp
80104aef:	57                   	push   %edi
80104af0:	e8 6b cf ff ff       	call   80101a60 <iunlockput>
    ilock(ip);
80104af5:	89 1c 24             	mov    %ebx,(%esp)
80104af8:	e8 33 cc ff ff       	call   80101730 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104afd:	83 c4 10             	add    $0x10,%esp
80104b00:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104b05:	75 19                	jne    80104b20 <create+0x80>
80104b07:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
80104b0c:	89 d8                	mov    %ebx,%eax
80104b0e:	75 10                	jne    80104b20 <create+0x80>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104b10:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104b13:	5b                   	pop    %ebx
80104b14:	5e                   	pop    %esi
80104b15:	5f                   	pop    %edi
80104b16:	5d                   	pop    %ebp
80104b17:	c3                   	ret    
80104b18:	90                   	nop
80104b19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if((ip = dirlookup(dp, name, &off)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
80104b20:	83 ec 0c             	sub    $0xc,%esp
80104b23:	53                   	push   %ebx
80104b24:	e8 37 cf ff ff       	call   80101a60 <iunlockput>
    return 0;
80104b29:	83 c4 10             	add    $0x10,%esp
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104b2c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
    return 0;
80104b2f:	31 c0                	xor    %eax,%eax
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104b31:	5b                   	pop    %ebx
80104b32:	5e                   	pop    %esi
80104b33:	5f                   	pop    %edi
80104b34:	5d                   	pop    %ebp
80104b35:	c3                   	ret    
80104b36:	8d 76 00             	lea    0x0(%esi),%esi
80104b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      return ip;
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
80104b40:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104b44:	83 ec 08             	sub    $0x8,%esp
80104b47:	50                   	push   %eax
80104b48:	ff 37                	pushl  (%edi)
80104b4a:	e8 71 ca ff ff       	call   801015c0 <ialloc>
80104b4f:	83 c4 10             	add    $0x10,%esp
80104b52:	85 c0                	test   %eax,%eax
80104b54:	89 c3                	mov    %eax,%ebx
80104b56:	0f 84 cc 00 00 00    	je     80104c28 <create+0x188>
    panic("create: ialloc");

  ilock(ip);
80104b5c:	83 ec 0c             	sub    $0xc,%esp
80104b5f:	50                   	push   %eax
80104b60:	e8 cb cb ff ff       	call   80101730 <ilock>
  ip->major = major;
80104b65:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104b69:	66 89 43 52          	mov    %ax,0x52(%ebx)
  ip->minor = minor;
80104b6d:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104b71:	66 89 43 54          	mov    %ax,0x54(%ebx)
  ip->nlink = 1;
80104b75:	b8 01 00 00 00       	mov    $0x1,%eax
80104b7a:	66 89 43 56          	mov    %ax,0x56(%ebx)
  iupdate(ip);
80104b7e:	89 1c 24             	mov    %ebx,(%esp)
80104b81:	e8 fa ca ff ff       	call   80101680 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
80104b86:	83 c4 10             	add    $0x10,%esp
80104b89:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104b8e:	74 40                	je     80104bd0 <create+0x130>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
80104b90:	83 ec 04             	sub    $0x4,%esp
80104b93:	ff 73 04             	pushl  0x4(%ebx)
80104b96:	56                   	push   %esi
80104b97:	57                   	push   %edi
80104b98:	e8 c3 d3 ff ff       	call   80101f60 <dirlink>
80104b9d:	83 c4 10             	add    $0x10,%esp
80104ba0:	85 c0                	test   %eax,%eax
80104ba2:	78 77                	js     80104c1b <create+0x17b>
    panic("create: dirlink");

  iunlockput(dp);
80104ba4:	83 ec 0c             	sub    $0xc,%esp
80104ba7:	57                   	push   %edi
80104ba8:	e8 b3 ce ff ff       	call   80101a60 <iunlockput>

  return ip;
80104bad:	83 c4 10             	add    $0x10,%esp
}
80104bb0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
80104bb3:	89 d8                	mov    %ebx,%eax
}
80104bb5:	5b                   	pop    %ebx
80104bb6:	5e                   	pop    %esi
80104bb7:	5f                   	pop    %edi
80104bb8:	5d                   	pop    %ebp
80104bb9:	c3                   	ret    
80104bba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    return 0;
80104bc0:	31 c0                	xor    %eax,%eax
80104bc2:	e9 49 ff ff ff       	jmp    80104b10 <create+0x70>
80104bc7:	89 f6                	mov    %esi,%esi
80104bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  ip->minor = minor;
  ip->nlink = 1;
  iupdate(ip);

  if(type == T_DIR){  // Create . and .. entries.
    dp->nlink++;  // for ".."
80104bd0:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
    iupdate(dp);
80104bd5:	83 ec 0c             	sub    $0xc,%esp
80104bd8:	57                   	push   %edi
80104bd9:	e8 a2 ca ff ff       	call   80101680 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104bde:	83 c4 0c             	add    $0xc,%esp
80104be1:	ff 73 04             	pushl  0x4(%ebx)
80104be4:	68 38 78 10 80       	push   $0x80107838
80104be9:	53                   	push   %ebx
80104bea:	e8 71 d3 ff ff       	call   80101f60 <dirlink>
80104bef:	83 c4 10             	add    $0x10,%esp
80104bf2:	85 c0                	test   %eax,%eax
80104bf4:	78 18                	js     80104c0e <create+0x16e>
80104bf6:	83 ec 04             	sub    $0x4,%esp
80104bf9:	ff 77 04             	pushl  0x4(%edi)
80104bfc:	68 37 78 10 80       	push   $0x80107837
80104c01:	53                   	push   %ebx
80104c02:	e8 59 d3 ff ff       	call   80101f60 <dirlink>
80104c07:	83 c4 10             	add    $0x10,%esp
80104c0a:	85 c0                	test   %eax,%eax
80104c0c:	79 82                	jns    80104b90 <create+0xf0>
      panic("create dots");
80104c0e:	83 ec 0c             	sub    $0xc,%esp
80104c11:	68 2b 78 10 80       	push   $0x8010782b
80104c16:	e8 55 b7 ff ff       	call   80100370 <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");
80104c1b:	83 ec 0c             	sub    $0xc,%esp
80104c1e:	68 3a 78 10 80       	push   $0x8010783a
80104c23:	e8 48 b7 ff ff       	call   80100370 <panic>
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");
80104c28:	83 ec 0c             	sub    $0xc,%esp
80104c2b:	68 1c 78 10 80       	push   $0x8010781c
80104c30:	e8 3b b7 ff ff       	call   80100370 <panic>
80104c35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c40 <argfd.constprop.0>:
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104c40:	55                   	push   %ebp
80104c41:	89 e5                	mov    %esp,%ebp
80104c43:	56                   	push   %esi
80104c44:	53                   	push   %ebx
80104c45:	89 c6                	mov    %eax,%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104c47:	8d 45 f4             	lea    -0xc(%ebp),%eax
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104c4a:	89 d3                	mov    %edx,%ebx
80104c4c:	83 ec 18             	sub    $0x18,%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104c4f:	50                   	push   %eax
80104c50:	6a 00                	push   $0x0
80104c52:	e8 b9 fc ff ff       	call   80104910 <argint>
80104c57:	83 c4 10             	add    $0x10,%esp
80104c5a:	85 c0                	test   %eax,%eax
80104c5c:	78 3a                	js     80104c98 <argfd.constprop.0+0x58>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0)
80104c5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104c61:	83 f8 0f             	cmp    $0xf,%eax
80104c64:	77 32                	ja     80104c98 <argfd.constprop.0+0x58>
80104c66:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104c6d:	8b 54 82 28          	mov    0x28(%edx,%eax,4),%edx
80104c71:	85 d2                	test   %edx,%edx
80104c73:	74 23                	je     80104c98 <argfd.constprop.0+0x58>
    return -1;
  if(pfd)
80104c75:	85 f6                	test   %esi,%esi
80104c77:	74 02                	je     80104c7b <argfd.constprop.0+0x3b>
    *pfd = fd;
80104c79:	89 06                	mov    %eax,(%esi)
  if(pf)
80104c7b:	85 db                	test   %ebx,%ebx
80104c7d:	74 11                	je     80104c90 <argfd.constprop.0+0x50>
    *pf = f;
80104c7f:	89 13                	mov    %edx,(%ebx)
  return 0;
80104c81:	31 c0                	xor    %eax,%eax
}
80104c83:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104c86:	5b                   	pop    %ebx
80104c87:	5e                   	pop    %esi
80104c88:	5d                   	pop    %ebp
80104c89:	c3                   	ret    
80104c8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
80104c90:	31 c0                	xor    %eax,%eax
80104c92:	eb ef                	jmp    80104c83 <argfd.constprop.0+0x43>
80104c94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
80104c98:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c9d:	eb e4                	jmp    80104c83 <argfd.constprop.0+0x43>
80104c9f:	90                   	nop

80104ca0 <sys_dup>:
  return -1;
}

int
sys_dup(void)
{
80104ca0:	55                   	push   %ebp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104ca1:	31 c0                	xor    %eax,%eax
  return -1;
}

int
sys_dup(void)
{
80104ca3:	89 e5                	mov    %esp,%ebp
80104ca5:	53                   	push   %ebx
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104ca6:	8d 55 f4             	lea    -0xc(%ebp),%edx
  return -1;
}

int
sys_dup(void)
{
80104ca9:	83 ec 14             	sub    $0x14,%esp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104cac:	e8 8f ff ff ff       	call   80104c40 <argfd.constprop.0>
80104cb1:	85 c0                	test   %eax,%eax
80104cb3:	78 1b                	js     80104cd0 <sys_dup+0x30>
    return -1;
  if((fd=fdalloc(f)) < 0)
80104cb5:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104cb8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80104cbe:	31 db                	xor    %ebx,%ebx
    if(proc->ofile[fd] == 0){
80104cc0:	8b 4c 98 28          	mov    0x28(%eax,%ebx,4),%ecx
80104cc4:	85 c9                	test   %ecx,%ecx
80104cc6:	74 18                	je     80104ce0 <sys_dup+0x40>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80104cc8:	83 c3 01             	add    $0x1,%ebx
80104ccb:	83 fb 10             	cmp    $0x10,%ebx
80104cce:	75 f0                	jne    80104cc0 <sys_dup+0x20>
{
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
80104cd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
80104cd5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104cd8:	c9                   	leave  
80104cd9:	c3                   	ret    
80104cda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
80104ce0:	83 ec 0c             	sub    $0xc,%esp
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80104ce3:	89 54 98 28          	mov    %edx,0x28(%eax,%ebx,4)

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
80104ce7:	52                   	push   %edx
80104ce8:	e8 e3 c0 ff ff       	call   80100dd0 <filedup>
  return fd;
80104ced:	89 d8                	mov    %ebx,%eax
80104cef:	83 c4 10             	add    $0x10,%esp
}
80104cf2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104cf5:	c9                   	leave  
80104cf6:	c3                   	ret    
80104cf7:	89 f6                	mov    %esi,%esi
80104cf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d00 <sys_read>:

int
sys_read(void)
{
80104d00:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104d01:	31 c0                	xor    %eax,%eax
  return fd;
}

int
sys_read(void)
{
80104d03:	89 e5                	mov    %esp,%ebp
80104d05:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104d08:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104d0b:	e8 30 ff ff ff       	call   80104c40 <argfd.constprop.0>
80104d10:	85 c0                	test   %eax,%eax
80104d12:	78 4c                	js     80104d60 <sys_read+0x60>
80104d14:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d17:	83 ec 08             	sub    $0x8,%esp
80104d1a:	50                   	push   %eax
80104d1b:	6a 02                	push   $0x2
80104d1d:	e8 ee fb ff ff       	call   80104910 <argint>
80104d22:	83 c4 10             	add    $0x10,%esp
80104d25:	85 c0                	test   %eax,%eax
80104d27:	78 37                	js     80104d60 <sys_read+0x60>
80104d29:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d2c:	83 ec 04             	sub    $0x4,%esp
80104d2f:	ff 75 f0             	pushl  -0x10(%ebp)
80104d32:	50                   	push   %eax
80104d33:	6a 01                	push   $0x1
80104d35:	e8 16 fc ff ff       	call   80104950 <argptr>
80104d3a:	83 c4 10             	add    $0x10,%esp
80104d3d:	85 c0                	test   %eax,%eax
80104d3f:	78 1f                	js     80104d60 <sys_read+0x60>
    return -1;
  return fileread(f, p, n);
80104d41:	83 ec 04             	sub    $0x4,%esp
80104d44:	ff 75 f0             	pushl  -0x10(%ebp)
80104d47:	ff 75 f4             	pushl  -0xc(%ebp)
80104d4a:	ff 75 ec             	pushl  -0x14(%ebp)
80104d4d:	e8 ee c1 ff ff       	call   80100f40 <fileread>
80104d52:	83 c4 10             	add    $0x10,%esp
}
80104d55:	c9                   	leave  
80104d56:	c3                   	ret    
80104d57:	89 f6                	mov    %esi,%esi
80104d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104d60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fileread(f, p, n);
}
80104d65:	c9                   	leave  
80104d66:	c3                   	ret    
80104d67:	89 f6                	mov    %esi,%esi
80104d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d70 <sys_write>:

int
sys_write(void)
{
80104d70:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104d71:	31 c0                	xor    %eax,%eax
  return fileread(f, p, n);
}

int
sys_write(void)
{
80104d73:	89 e5                	mov    %esp,%ebp
80104d75:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104d78:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104d7b:	e8 c0 fe ff ff       	call   80104c40 <argfd.constprop.0>
80104d80:	85 c0                	test   %eax,%eax
80104d82:	78 4c                	js     80104dd0 <sys_write+0x60>
80104d84:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d87:	83 ec 08             	sub    $0x8,%esp
80104d8a:	50                   	push   %eax
80104d8b:	6a 02                	push   $0x2
80104d8d:	e8 7e fb ff ff       	call   80104910 <argint>
80104d92:	83 c4 10             	add    $0x10,%esp
80104d95:	85 c0                	test   %eax,%eax
80104d97:	78 37                	js     80104dd0 <sys_write+0x60>
80104d99:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d9c:	83 ec 04             	sub    $0x4,%esp
80104d9f:	ff 75 f0             	pushl  -0x10(%ebp)
80104da2:	50                   	push   %eax
80104da3:	6a 01                	push   $0x1
80104da5:	e8 a6 fb ff ff       	call   80104950 <argptr>
80104daa:	83 c4 10             	add    $0x10,%esp
80104dad:	85 c0                	test   %eax,%eax
80104daf:	78 1f                	js     80104dd0 <sys_write+0x60>
    return -1;
  return filewrite(f, p, n);
80104db1:	83 ec 04             	sub    $0x4,%esp
80104db4:	ff 75 f0             	pushl  -0x10(%ebp)
80104db7:	ff 75 f4             	pushl  -0xc(%ebp)
80104dba:	ff 75 ec             	pushl  -0x14(%ebp)
80104dbd:	e8 0e c2 ff ff       	call   80100fd0 <filewrite>
80104dc2:	83 c4 10             	add    $0x10,%esp
}
80104dc5:	c9                   	leave  
80104dc6:	c3                   	ret    
80104dc7:	89 f6                	mov    %esi,%esi
80104dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104dd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filewrite(f, p, n);
}
80104dd5:	c9                   	leave  
80104dd6:	c3                   	ret    
80104dd7:	89 f6                	mov    %esi,%esi
80104dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104de0 <sys_close>:

int
sys_close(void)
{
80104de0:	55                   	push   %ebp
80104de1:	89 e5                	mov    %esp,%ebp
80104de3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
80104de6:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104de9:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104dec:	e8 4f fe ff ff       	call   80104c40 <argfd.constprop.0>
80104df1:	85 c0                	test   %eax,%eax
80104df3:	78 2b                	js     80104e20 <sys_close+0x40>
    return -1;
  proc->ofile[fd] = 0;
80104df5:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104df8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  fileclose(f);
80104dfe:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
  proc->ofile[fd] = 0;
80104e01:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104e08:	00 
  fileclose(f);
80104e09:	ff 75 f4             	pushl  -0xc(%ebp)
80104e0c:	e8 0f c0 ff ff       	call   80100e20 <fileclose>
  return 0;
80104e11:	83 c4 10             	add    $0x10,%esp
80104e14:	31 c0                	xor    %eax,%eax
}
80104e16:	c9                   	leave  
80104e17:	c3                   	ret    
80104e18:	90                   	nop
80104e19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
80104e20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  proc->ofile[fd] = 0;
  fileclose(f);
  return 0;
}
80104e25:	c9                   	leave  
80104e26:	c3                   	ret    
80104e27:	89 f6                	mov    %esi,%esi
80104e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e30 <sys_fstat>:

int
sys_fstat(void)
{
80104e30:	55                   	push   %ebp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104e31:	31 c0                	xor    %eax,%eax
  return 0;
}

int
sys_fstat(void)
{
80104e33:	89 e5                	mov    %esp,%ebp
80104e35:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104e38:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104e3b:	e8 00 fe ff ff       	call   80104c40 <argfd.constprop.0>
80104e40:	85 c0                	test   %eax,%eax
80104e42:	78 2c                	js     80104e70 <sys_fstat+0x40>
80104e44:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e47:	83 ec 04             	sub    $0x4,%esp
80104e4a:	6a 14                	push   $0x14
80104e4c:	50                   	push   %eax
80104e4d:	6a 01                	push   $0x1
80104e4f:	e8 fc fa ff ff       	call   80104950 <argptr>
80104e54:	83 c4 10             	add    $0x10,%esp
80104e57:	85 c0                	test   %eax,%eax
80104e59:	78 15                	js     80104e70 <sys_fstat+0x40>
    return -1;
  return filestat(f, st);
80104e5b:	83 ec 08             	sub    $0x8,%esp
80104e5e:	ff 75 f4             	pushl  -0xc(%ebp)
80104e61:	ff 75 f0             	pushl  -0x10(%ebp)
80104e64:	e8 87 c0 ff ff       	call   80100ef0 <filestat>
80104e69:	83 c4 10             	add    $0x10,%esp
}
80104e6c:	c9                   	leave  
80104e6d:	c3                   	ret    
80104e6e:	66 90                	xchg   %ax,%ax
{
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
    return -1;
80104e70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filestat(f, st);
}
80104e75:	c9                   	leave  
80104e76:	c3                   	ret    
80104e77:	89 f6                	mov    %esi,%esi
80104e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e80 <sys_link>:

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104e80:	55                   	push   %ebp
80104e81:	89 e5                	mov    %esp,%ebp
80104e83:	57                   	push   %edi
80104e84:	56                   	push   %esi
80104e85:	53                   	push   %ebx
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104e86:	8d 45 d4             	lea    -0x2c(%ebp),%eax
}

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104e89:	83 ec 34             	sub    $0x34,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104e8c:	50                   	push   %eax
80104e8d:	6a 00                	push   $0x0
80104e8f:	e8 1c fb ff ff       	call   801049b0 <argstr>
80104e94:	83 c4 10             	add    $0x10,%esp
80104e97:	85 c0                	test   %eax,%eax
80104e99:	0f 88 fb 00 00 00    	js     80104f9a <sys_link+0x11a>
80104e9f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104ea2:	83 ec 08             	sub    $0x8,%esp
80104ea5:	50                   	push   %eax
80104ea6:	6a 01                	push   $0x1
80104ea8:	e8 03 fb ff ff       	call   801049b0 <argstr>
80104ead:	83 c4 10             	add    $0x10,%esp
80104eb0:	85 c0                	test   %eax,%eax
80104eb2:	0f 88 e2 00 00 00    	js     80104f9a <sys_link+0x11a>
    return -1;

  begin_op();
80104eb8:	e8 93 de ff ff       	call   80102d50 <begin_op>
  if((ip = namei(old)) == 0){
80104ebd:	83 ec 0c             	sub    $0xc,%esp
80104ec0:	ff 75 d4             	pushl  -0x2c(%ebp)
80104ec3:	e8 58 d1 ff ff       	call   80102020 <namei>
80104ec8:	83 c4 10             	add    $0x10,%esp
80104ecb:	85 c0                	test   %eax,%eax
80104ecd:	89 c3                	mov    %eax,%ebx
80104ecf:	0f 84 f3 00 00 00    	je     80104fc8 <sys_link+0x148>
    end_op();
    return -1;
  }

  ilock(ip);
80104ed5:	83 ec 0c             	sub    $0xc,%esp
80104ed8:	50                   	push   %eax
80104ed9:	e8 52 c8 ff ff       	call   80101730 <ilock>
  if(ip->type == T_DIR){
80104ede:	83 c4 10             	add    $0x10,%esp
80104ee1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104ee6:	0f 84 c4 00 00 00    	je     80104fb0 <sys_link+0x130>
    iunlockput(ip);
    end_op();
    return -1;
  }

  ip->nlink++;
80104eec:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80104ef1:	83 ec 0c             	sub    $0xc,%esp
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
80104ef4:	8d 7d da             	lea    -0x26(%ebp),%edi
    end_op();
    return -1;
  }

  ip->nlink++;
  iupdate(ip);
80104ef7:	53                   	push   %ebx
80104ef8:	e8 83 c7 ff ff       	call   80101680 <iupdate>
  iunlock(ip);
80104efd:	89 1c 24             	mov    %ebx,(%esp)
80104f00:	e8 0b c9 ff ff       	call   80101810 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
80104f05:	58                   	pop    %eax
80104f06:	5a                   	pop    %edx
80104f07:	57                   	push   %edi
80104f08:	ff 75 d0             	pushl  -0x30(%ebp)
80104f0b:	e8 30 d1 ff ff       	call   80102040 <nameiparent>
80104f10:	83 c4 10             	add    $0x10,%esp
80104f13:	85 c0                	test   %eax,%eax
80104f15:	89 c6                	mov    %eax,%esi
80104f17:	74 5b                	je     80104f74 <sys_link+0xf4>
    goto bad;
  ilock(dp);
80104f19:	83 ec 0c             	sub    $0xc,%esp
80104f1c:	50                   	push   %eax
80104f1d:	e8 0e c8 ff ff       	call   80101730 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104f22:	83 c4 10             	add    $0x10,%esp
80104f25:	8b 03                	mov    (%ebx),%eax
80104f27:	39 06                	cmp    %eax,(%esi)
80104f29:	75 3d                	jne    80104f68 <sys_link+0xe8>
80104f2b:	83 ec 04             	sub    $0x4,%esp
80104f2e:	ff 73 04             	pushl  0x4(%ebx)
80104f31:	57                   	push   %edi
80104f32:	56                   	push   %esi
80104f33:	e8 28 d0 ff ff       	call   80101f60 <dirlink>
80104f38:	83 c4 10             	add    $0x10,%esp
80104f3b:	85 c0                	test   %eax,%eax
80104f3d:	78 29                	js     80104f68 <sys_link+0xe8>
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
80104f3f:	83 ec 0c             	sub    $0xc,%esp
80104f42:	56                   	push   %esi
80104f43:	e8 18 cb ff ff       	call   80101a60 <iunlockput>
  iput(ip);
80104f48:	89 1c 24             	mov    %ebx,(%esp)
80104f4b:	e8 10 c9 ff ff       	call   80101860 <iput>

  end_op();
80104f50:	e8 6b de ff ff       	call   80102dc0 <end_op>

  return 0;
80104f55:	83 c4 10             	add    $0x10,%esp
80104f58:	31 c0                	xor    %eax,%eax
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}
80104f5a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f5d:	5b                   	pop    %ebx
80104f5e:	5e                   	pop    %esi
80104f5f:	5f                   	pop    %edi
80104f60:	5d                   	pop    %ebp
80104f61:	c3                   	ret    
80104f62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
80104f68:	83 ec 0c             	sub    $0xc,%esp
80104f6b:	56                   	push   %esi
80104f6c:	e8 ef ca ff ff       	call   80101a60 <iunlockput>
    goto bad;
80104f71:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  ilock(ip);
80104f74:	83 ec 0c             	sub    $0xc,%esp
80104f77:	53                   	push   %ebx
80104f78:	e8 b3 c7 ff ff       	call   80101730 <ilock>
  ip->nlink--;
80104f7d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104f82:	89 1c 24             	mov    %ebx,(%esp)
80104f85:	e8 f6 c6 ff ff       	call   80101680 <iupdate>
  iunlockput(ip);
80104f8a:	89 1c 24             	mov    %ebx,(%esp)
80104f8d:	e8 ce ca ff ff       	call   80101a60 <iunlockput>
  end_op();
80104f92:	e8 29 de ff ff       	call   80102dc0 <end_op>
  return -1;
80104f97:	83 c4 10             	add    $0x10,%esp
}
80104f9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ilock(ip);
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
80104f9d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104fa2:	5b                   	pop    %ebx
80104fa3:	5e                   	pop    %esi
80104fa4:	5f                   	pop    %edi
80104fa5:	5d                   	pop    %ebp
80104fa6:	c3                   	ret    
80104fa7:	89 f6                	mov    %esi,%esi
80104fa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
  }

  ilock(ip);
  if(ip->type == T_DIR){
    iunlockput(ip);
80104fb0:	83 ec 0c             	sub    $0xc,%esp
80104fb3:	53                   	push   %ebx
80104fb4:	e8 a7 ca ff ff       	call   80101a60 <iunlockput>
    end_op();
80104fb9:	e8 02 de ff ff       	call   80102dc0 <end_op>
    return -1;
80104fbe:	83 c4 10             	add    $0x10,%esp
80104fc1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fc6:	eb 92                	jmp    80104f5a <sys_link+0xda>
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
    return -1;

  begin_op();
  if((ip = namei(old)) == 0){
    end_op();
80104fc8:	e8 f3 dd ff ff       	call   80102dc0 <end_op>
    return -1;
80104fcd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fd2:	eb 86                	jmp    80104f5a <sys_link+0xda>
80104fd4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104fda:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104fe0 <sys_unlink>:
}

//PAGEBREAK!
int
sys_unlink(void)
{
80104fe0:	55                   	push   %ebp
80104fe1:	89 e5                	mov    %esp,%ebp
80104fe3:	57                   	push   %edi
80104fe4:	56                   	push   %esi
80104fe5:	53                   	push   %ebx
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80104fe6:	8d 45 c0             	lea    -0x40(%ebp),%eax
}

//PAGEBREAK!
int
sys_unlink(void)
{
80104fe9:	83 ec 54             	sub    $0x54,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80104fec:	50                   	push   %eax
80104fed:	6a 00                	push   $0x0
80104fef:	e8 bc f9 ff ff       	call   801049b0 <argstr>
80104ff4:	83 c4 10             	add    $0x10,%esp
80104ff7:	85 c0                	test   %eax,%eax
80104ff9:	0f 88 82 01 00 00    	js     80105181 <sys_unlink+0x1a1>
    return -1;

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
80104fff:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  uint off;

  if(argstr(0, &path) < 0)
    return -1;

  begin_op();
80105002:	e8 49 dd ff ff       	call   80102d50 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80105007:	83 ec 08             	sub    $0x8,%esp
8010500a:	53                   	push   %ebx
8010500b:	ff 75 c0             	pushl  -0x40(%ebp)
8010500e:	e8 2d d0 ff ff       	call   80102040 <nameiparent>
80105013:	83 c4 10             	add    $0x10,%esp
80105016:	85 c0                	test   %eax,%eax
80105018:	89 45 b4             	mov    %eax,-0x4c(%ebp)
8010501b:	0f 84 6a 01 00 00    	je     8010518b <sys_unlink+0x1ab>
    end_op();
    return -1;
  }

  ilock(dp);
80105021:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80105024:	83 ec 0c             	sub    $0xc,%esp
80105027:	56                   	push   %esi
80105028:	e8 03 c7 ff ff       	call   80101730 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
8010502d:	58                   	pop    %eax
8010502e:	5a                   	pop    %edx
8010502f:	68 38 78 10 80       	push   $0x80107838
80105034:	53                   	push   %ebx
80105035:	e8 a6 cc ff ff       	call   80101ce0 <namecmp>
8010503a:	83 c4 10             	add    $0x10,%esp
8010503d:	85 c0                	test   %eax,%eax
8010503f:	0f 84 fc 00 00 00    	je     80105141 <sys_unlink+0x161>
80105045:	83 ec 08             	sub    $0x8,%esp
80105048:	68 37 78 10 80       	push   $0x80107837
8010504d:	53                   	push   %ebx
8010504e:	e8 8d cc ff ff       	call   80101ce0 <namecmp>
80105053:	83 c4 10             	add    $0x10,%esp
80105056:	85 c0                	test   %eax,%eax
80105058:	0f 84 e3 00 00 00    	je     80105141 <sys_unlink+0x161>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
8010505e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80105061:	83 ec 04             	sub    $0x4,%esp
80105064:	50                   	push   %eax
80105065:	53                   	push   %ebx
80105066:	56                   	push   %esi
80105067:	e8 94 cc ff ff       	call   80101d00 <dirlookup>
8010506c:	83 c4 10             	add    $0x10,%esp
8010506f:	85 c0                	test   %eax,%eax
80105071:	89 c3                	mov    %eax,%ebx
80105073:	0f 84 c8 00 00 00    	je     80105141 <sys_unlink+0x161>
    goto bad;
  ilock(ip);
80105079:	83 ec 0c             	sub    $0xc,%esp
8010507c:	50                   	push   %eax
8010507d:	e8 ae c6 ff ff       	call   80101730 <ilock>

  if(ip->nlink < 1)
80105082:	83 c4 10             	add    $0x10,%esp
80105085:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
8010508a:	0f 8e 24 01 00 00    	jle    801051b4 <sys_unlink+0x1d4>
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
80105090:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105095:	8d 75 d8             	lea    -0x28(%ebp),%esi
80105098:	74 66                	je     80105100 <sys_unlink+0x120>
    iunlockput(ip);
    goto bad;
  }

  memset(&de, 0, sizeof(de));
8010509a:	83 ec 04             	sub    $0x4,%esp
8010509d:	6a 10                	push   $0x10
8010509f:	6a 00                	push   $0x0
801050a1:	56                   	push   %esi
801050a2:	e8 79 f5 ff ff       	call   80104620 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801050a7:	6a 10                	push   $0x10
801050a9:	ff 75 c4             	pushl  -0x3c(%ebp)
801050ac:	56                   	push   %esi
801050ad:	ff 75 b4             	pushl  -0x4c(%ebp)
801050b0:	e8 fb ca ff ff       	call   80101bb0 <writei>
801050b5:	83 c4 20             	add    $0x20,%esp
801050b8:	83 f8 10             	cmp    $0x10,%eax
801050bb:	0f 85 e6 00 00 00    	jne    801051a7 <sys_unlink+0x1c7>
    panic("unlink: writei");
  if(ip->type == T_DIR){
801050c1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801050c6:	0f 84 9c 00 00 00    	je     80105168 <sys_unlink+0x188>
    dp->nlink--;
    iupdate(dp);
  }
  iunlockput(dp);
801050cc:	83 ec 0c             	sub    $0xc,%esp
801050cf:	ff 75 b4             	pushl  -0x4c(%ebp)
801050d2:	e8 89 c9 ff ff       	call   80101a60 <iunlockput>

  ip->nlink--;
801050d7:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
801050dc:	89 1c 24             	mov    %ebx,(%esp)
801050df:	e8 9c c5 ff ff       	call   80101680 <iupdate>
  iunlockput(ip);
801050e4:	89 1c 24             	mov    %ebx,(%esp)
801050e7:	e8 74 c9 ff ff       	call   80101a60 <iunlockput>

  end_op();
801050ec:	e8 cf dc ff ff       	call   80102dc0 <end_op>

  return 0;
801050f1:	83 c4 10             	add    $0x10,%esp
801050f4:	31 c0                	xor    %eax,%eax

bad:
  iunlockput(dp);
  end_op();
  return -1;
}
801050f6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801050f9:	5b                   	pop    %ebx
801050fa:	5e                   	pop    %esi
801050fb:	5f                   	pop    %edi
801050fc:	5d                   	pop    %ebp
801050fd:	c3                   	ret    
801050fe:	66 90                	xchg   %ax,%ax
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80105100:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105104:	76 94                	jbe    8010509a <sys_unlink+0xba>
80105106:	bf 20 00 00 00       	mov    $0x20,%edi
8010510b:	eb 0f                	jmp    8010511c <sys_unlink+0x13c>
8010510d:	8d 76 00             	lea    0x0(%esi),%esi
80105110:	83 c7 10             	add    $0x10,%edi
80105113:	3b 7b 58             	cmp    0x58(%ebx),%edi
80105116:	0f 83 7e ff ff ff    	jae    8010509a <sys_unlink+0xba>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
8010511c:	6a 10                	push   $0x10
8010511e:	57                   	push   %edi
8010511f:	56                   	push   %esi
80105120:	53                   	push   %ebx
80105121:	e8 8a c9 ff ff       	call   80101ab0 <readi>
80105126:	83 c4 10             	add    $0x10,%esp
80105129:	83 f8 10             	cmp    $0x10,%eax
8010512c:	75 6c                	jne    8010519a <sys_unlink+0x1ba>
      panic("isdirempty: readi");
    if(de.inum != 0)
8010512e:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105133:	74 db                	je     80105110 <sys_unlink+0x130>
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
    iunlockput(ip);
80105135:	83 ec 0c             	sub    $0xc,%esp
80105138:	53                   	push   %ebx
80105139:	e8 22 c9 ff ff       	call   80101a60 <iunlockput>
    goto bad;
8010513e:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  iunlockput(dp);
80105141:	83 ec 0c             	sub    $0xc,%esp
80105144:	ff 75 b4             	pushl  -0x4c(%ebp)
80105147:	e8 14 c9 ff ff       	call   80101a60 <iunlockput>
  end_op();
8010514c:	e8 6f dc ff ff       	call   80102dc0 <end_op>
  return -1;
80105151:	83 c4 10             	add    $0x10,%esp
}
80105154:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;

bad:
  iunlockput(dp);
  end_op();
  return -1;
80105157:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010515c:	5b                   	pop    %ebx
8010515d:	5e                   	pop    %esi
8010515e:	5f                   	pop    %edi
8010515f:	5d                   	pop    %ebp
80105160:	c3                   	ret    
80105161:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
80105168:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    iupdate(dp);
8010516b:	83 ec 0c             	sub    $0xc,%esp

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
8010516e:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
80105173:	50                   	push   %eax
80105174:	e8 07 c5 ff ff       	call   80101680 <iupdate>
80105179:	83 c4 10             	add    $0x10,%esp
8010517c:	e9 4b ff ff ff       	jmp    801050cc <sys_unlink+0xec>
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
    return -1;
80105181:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105186:	e9 6b ff ff ff       	jmp    801050f6 <sys_unlink+0x116>

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
    end_op();
8010518b:	e8 30 dc ff ff       	call   80102dc0 <end_op>
    return -1;
80105190:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105195:	e9 5c ff ff ff       	jmp    801050f6 <sys_unlink+0x116>
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
8010519a:	83 ec 0c             	sub    $0xc,%esp
8010519d:	68 5c 78 10 80       	push   $0x8010785c
801051a2:	e8 c9 b1 ff ff       	call   80100370 <panic>
    goto bad;
  }

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
801051a7:	83 ec 0c             	sub    $0xc,%esp
801051aa:	68 6e 78 10 80       	push   $0x8010786e
801051af:	e8 bc b1 ff ff       	call   80100370 <panic>
  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
801051b4:	83 ec 0c             	sub    $0xc,%esp
801051b7:	68 4a 78 10 80       	push   $0x8010784a
801051bc:	e8 af b1 ff ff       	call   80100370 <panic>
801051c1:	eb 0d                	jmp    801051d0 <sys_open>
801051c3:	90                   	nop
801051c4:	90                   	nop
801051c5:	90                   	nop
801051c6:	90                   	nop
801051c7:	90                   	nop
801051c8:	90                   	nop
801051c9:	90                   	nop
801051ca:	90                   	nop
801051cb:	90                   	nop
801051cc:	90                   	nop
801051cd:	90                   	nop
801051ce:	90                   	nop
801051cf:	90                   	nop

801051d0 <sys_open>:
  return ip;
}

int
sys_open(void)
{
801051d0:	55                   	push   %ebp
801051d1:	89 e5                	mov    %esp,%ebp
801051d3:	57                   	push   %edi
801051d4:	56                   	push   %esi
801051d5:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
801051d6:	8d 45 e0             	lea    -0x20(%ebp),%eax
  return ip;
}

int
sys_open(void)
{
801051d9:	83 ec 24             	sub    $0x24,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
801051dc:	50                   	push   %eax
801051dd:	6a 00                	push   $0x0
801051df:	e8 cc f7 ff ff       	call   801049b0 <argstr>
801051e4:	83 c4 10             	add    $0x10,%esp
801051e7:	85 c0                	test   %eax,%eax
801051e9:	0f 88 9e 00 00 00    	js     8010528d <sys_open+0xbd>
801051ef:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801051f2:	83 ec 08             	sub    $0x8,%esp
801051f5:	50                   	push   %eax
801051f6:	6a 01                	push   $0x1
801051f8:	e8 13 f7 ff ff       	call   80104910 <argint>
801051fd:	83 c4 10             	add    $0x10,%esp
80105200:	85 c0                	test   %eax,%eax
80105202:	0f 88 85 00 00 00    	js     8010528d <sys_open+0xbd>
    return -1;

  begin_op();
80105208:	e8 43 db ff ff       	call   80102d50 <begin_op>

  if(omode & O_CREATE){
8010520d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105211:	0f 85 89 00 00 00    	jne    801052a0 <sys_open+0xd0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80105217:	83 ec 0c             	sub    $0xc,%esp
8010521a:	ff 75 e0             	pushl  -0x20(%ebp)
8010521d:	e8 fe cd ff ff       	call   80102020 <namei>
80105222:	83 c4 10             	add    $0x10,%esp
80105225:	85 c0                	test   %eax,%eax
80105227:	89 c7                	mov    %eax,%edi
80105229:	0f 84 8e 00 00 00    	je     801052bd <sys_open+0xed>
      end_op();
      return -1;
    }
    ilock(ip);
8010522f:	83 ec 0c             	sub    $0xc,%esp
80105232:	50                   	push   %eax
80105233:	e8 f8 c4 ff ff       	call   80101730 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80105238:	83 c4 10             	add    $0x10,%esp
8010523b:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
80105240:	0f 84 d2 00 00 00    	je     80105318 <sys_open+0x148>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80105246:	e8 15 bb ff ff       	call   80100d60 <filealloc>
8010524b:	85 c0                	test   %eax,%eax
8010524d:	89 c6                	mov    %eax,%esi
8010524f:	74 2b                	je     8010527c <sys_open+0xac>
80105251:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80105258:	31 db                	xor    %ebx,%ebx
8010525a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
80105260:	8b 44 9a 28          	mov    0x28(%edx,%ebx,4),%eax
80105264:	85 c0                	test   %eax,%eax
80105266:	74 68                	je     801052d0 <sys_open+0x100>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105268:	83 c3 01             	add    $0x1,%ebx
8010526b:	83 fb 10             	cmp    $0x10,%ebx
8010526e:	75 f0                	jne    80105260 <sys_open+0x90>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
80105270:	83 ec 0c             	sub    $0xc,%esp
80105273:	56                   	push   %esi
80105274:	e8 a7 bb ff ff       	call   80100e20 <fileclose>
80105279:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
8010527c:	83 ec 0c             	sub    $0xc,%esp
8010527f:	57                   	push   %edi
80105280:	e8 db c7 ff ff       	call   80101a60 <iunlockput>
    end_op();
80105285:	e8 36 db ff ff       	call   80102dc0 <end_op>
    return -1;
8010528a:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
8010528d:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
80105290:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
80105295:	5b                   	pop    %ebx
80105296:	5e                   	pop    %esi
80105297:	5f                   	pop    %edi
80105298:	5d                   	pop    %ebp
80105299:	c3                   	ret    
8010529a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
801052a0:	83 ec 0c             	sub    $0xc,%esp
801052a3:	8b 45 e0             	mov    -0x20(%ebp),%eax
801052a6:	31 c9                	xor    %ecx,%ecx
801052a8:	6a 00                	push   $0x0
801052aa:	ba 02 00 00 00       	mov    $0x2,%edx
801052af:	e8 ec f7 ff ff       	call   80104aa0 <create>
    if(ip == 0){
801052b4:	83 c4 10             	add    $0x10,%esp
801052b7:	85 c0                	test   %eax,%eax
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
801052b9:	89 c7                	mov    %eax,%edi
    if(ip == 0){
801052bb:	75 89                	jne    80105246 <sys_open+0x76>
      end_op();
801052bd:	e8 fe da ff ff       	call   80102dc0 <end_op>
      return -1;
801052c2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052c7:	eb 43                	jmp    8010530c <sys_open+0x13c>
801052c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801052d0:	83 ec 0c             	sub    $0xc,%esp
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
801052d3:	89 74 9a 28          	mov    %esi,0x28(%edx,%ebx,4)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801052d7:	57                   	push   %edi
801052d8:	e8 33 c5 ff ff       	call   80101810 <iunlock>
  end_op();
801052dd:	e8 de da ff ff       	call   80102dc0 <end_op>

  f->type = FD_INODE;
801052e2:	c7 06 02 00 00 00    	movl   $0x2,(%esi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
801052e8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801052eb:	83 c4 10             	add    $0x10,%esp
  }
  iunlock(ip);
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
801052ee:	89 7e 10             	mov    %edi,0x10(%esi)
  f->off = 0;
801052f1:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
  f->readable = !(omode & O_WRONLY);
801052f8:	89 d0                	mov    %edx,%eax
801052fa:	83 e0 01             	and    $0x1,%eax
801052fd:	83 f0 01             	xor    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105300:	83 e2 03             	and    $0x3,%edx
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80105303:	88 46 08             	mov    %al,0x8(%esi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105306:	0f 95 46 09          	setne  0x9(%esi)
  return fd;
8010530a:	89 d8                	mov    %ebx,%eax
}
8010530c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010530f:	5b                   	pop    %ebx
80105310:	5e                   	pop    %esi
80105311:	5f                   	pop    %edi
80105312:	5d                   	pop    %ebp
80105313:	c3                   	ret    
80105314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((ip = namei(path)) == 0){
      end_op();
      return -1;
    }
    ilock(ip);
    if(ip->type == T_DIR && omode != O_RDONLY){
80105318:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010531b:	85 d2                	test   %edx,%edx
8010531d:	0f 84 23 ff ff ff    	je     80105246 <sys_open+0x76>
80105323:	e9 54 ff ff ff       	jmp    8010527c <sys_open+0xac>
80105328:	90                   	nop
80105329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105330 <sys_mkdir>:
  return fd;
}

int
sys_mkdir(void)
{
80105330:	55                   	push   %ebp
80105331:	89 e5                	mov    %esp,%ebp
80105333:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105336:	e8 15 da ff ff       	call   80102d50 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
8010533b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010533e:	83 ec 08             	sub    $0x8,%esp
80105341:	50                   	push   %eax
80105342:	6a 00                	push   $0x0
80105344:	e8 67 f6 ff ff       	call   801049b0 <argstr>
80105349:	83 c4 10             	add    $0x10,%esp
8010534c:	85 c0                	test   %eax,%eax
8010534e:	78 30                	js     80105380 <sys_mkdir+0x50>
80105350:	83 ec 0c             	sub    $0xc,%esp
80105353:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105356:	31 c9                	xor    %ecx,%ecx
80105358:	6a 00                	push   $0x0
8010535a:	ba 01 00 00 00       	mov    $0x1,%edx
8010535f:	e8 3c f7 ff ff       	call   80104aa0 <create>
80105364:	83 c4 10             	add    $0x10,%esp
80105367:	85 c0                	test   %eax,%eax
80105369:	74 15                	je     80105380 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010536b:	83 ec 0c             	sub    $0xc,%esp
8010536e:	50                   	push   %eax
8010536f:	e8 ec c6 ff ff       	call   80101a60 <iunlockput>
  end_op();
80105374:	e8 47 da ff ff       	call   80102dc0 <end_op>
  return 0;
80105379:	83 c4 10             	add    $0x10,%esp
8010537c:	31 c0                	xor    %eax,%eax
}
8010537e:	c9                   	leave  
8010537f:	c3                   	ret    
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    end_op();
80105380:	e8 3b da ff ff       	call   80102dc0 <end_op>
    return -1;
80105385:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010538a:	c9                   	leave  
8010538b:	c3                   	ret    
8010538c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105390 <sys_mknod>:

int
sys_mknod(void)
{
80105390:	55                   	push   %ebp
80105391:	89 e5                	mov    %esp,%ebp
80105393:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80105396:	e8 b5 d9 ff ff       	call   80102d50 <begin_op>
  if((argstr(0, &path)) < 0 ||
8010539b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010539e:	83 ec 08             	sub    $0x8,%esp
801053a1:	50                   	push   %eax
801053a2:	6a 00                	push   $0x0
801053a4:	e8 07 f6 ff ff       	call   801049b0 <argstr>
801053a9:	83 c4 10             	add    $0x10,%esp
801053ac:	85 c0                	test   %eax,%eax
801053ae:	78 60                	js     80105410 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
801053b0:	8d 45 f0             	lea    -0x10(%ebp),%eax
801053b3:	83 ec 08             	sub    $0x8,%esp
801053b6:	50                   	push   %eax
801053b7:	6a 01                	push   $0x1
801053b9:	e8 52 f5 ff ff       	call   80104910 <argint>
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
801053be:	83 c4 10             	add    $0x10,%esp
801053c1:	85 c0                	test   %eax,%eax
801053c3:	78 4b                	js     80105410 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
801053c5:	8d 45 f4             	lea    -0xc(%ebp),%eax
801053c8:	83 ec 08             	sub    $0x8,%esp
801053cb:	50                   	push   %eax
801053cc:	6a 02                	push   $0x2
801053ce:	e8 3d f5 ff ff       	call   80104910 <argint>
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
801053d3:	83 c4 10             	add    $0x10,%esp
801053d6:	85 c0                	test   %eax,%eax
801053d8:	78 36                	js     80105410 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
801053da:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
801053de:	83 ec 0c             	sub    $0xc,%esp
801053e1:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
801053e5:	ba 03 00 00 00       	mov    $0x3,%edx
801053ea:	50                   	push   %eax
801053eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
801053ee:	e8 ad f6 ff ff       	call   80104aa0 <create>
801053f3:	83 c4 10             	add    $0x10,%esp
801053f6:	85 c0                	test   %eax,%eax
801053f8:	74 16                	je     80105410 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
801053fa:	83 ec 0c             	sub    $0xc,%esp
801053fd:	50                   	push   %eax
801053fe:	e8 5d c6 ff ff       	call   80101a60 <iunlockput>
  end_op();
80105403:	e8 b8 d9 ff ff       	call   80102dc0 <end_op>
  return 0;
80105408:	83 c4 10             	add    $0x10,%esp
8010540b:	31 c0                	xor    %eax,%eax
}
8010540d:	c9                   	leave  
8010540e:	c3                   	ret    
8010540f:	90                   	nop
  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
80105410:	e8 ab d9 ff ff       	call   80102dc0 <end_op>
    return -1;
80105415:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010541a:	c9                   	leave  
8010541b:	c3                   	ret    
8010541c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105420 <sys_chdir>:

int
sys_chdir(void)
{
80105420:	55                   	push   %ebp
80105421:	89 e5                	mov    %esp,%ebp
80105423:	53                   	push   %ebx
80105424:	83 ec 14             	sub    $0x14,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105427:	e8 24 d9 ff ff       	call   80102d50 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
8010542c:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010542f:	83 ec 08             	sub    $0x8,%esp
80105432:	50                   	push   %eax
80105433:	6a 00                	push   $0x0
80105435:	e8 76 f5 ff ff       	call   801049b0 <argstr>
8010543a:	83 c4 10             	add    $0x10,%esp
8010543d:	85 c0                	test   %eax,%eax
8010543f:	78 7f                	js     801054c0 <sys_chdir+0xa0>
80105441:	83 ec 0c             	sub    $0xc,%esp
80105444:	ff 75 f4             	pushl  -0xc(%ebp)
80105447:	e8 d4 cb ff ff       	call   80102020 <namei>
8010544c:	83 c4 10             	add    $0x10,%esp
8010544f:	85 c0                	test   %eax,%eax
80105451:	89 c3                	mov    %eax,%ebx
80105453:	74 6b                	je     801054c0 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
80105455:	83 ec 0c             	sub    $0xc,%esp
80105458:	50                   	push   %eax
80105459:	e8 d2 c2 ff ff       	call   80101730 <ilock>
  if(ip->type != T_DIR){
8010545e:	83 c4 10             	add    $0x10,%esp
80105461:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105466:	75 38                	jne    801054a0 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105468:	83 ec 0c             	sub    $0xc,%esp
8010546b:	53                   	push   %ebx
8010546c:	e8 9f c3 ff ff       	call   80101810 <iunlock>
  iput(proc->cwd);
80105471:	58                   	pop    %eax
80105472:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105478:	ff 70 68             	pushl  0x68(%eax)
8010547b:	e8 e0 c3 ff ff       	call   80101860 <iput>
  end_op();
80105480:	e8 3b d9 ff ff       	call   80102dc0 <end_op>
  proc->cwd = ip;
80105485:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  return 0;
8010548b:	83 c4 10             	add    $0x10,%esp
    return -1;
  }
  iunlock(ip);
  iput(proc->cwd);
  end_op();
  proc->cwd = ip;
8010548e:	89 58 68             	mov    %ebx,0x68(%eax)
  return 0;
80105491:	31 c0                	xor    %eax,%eax
}
80105493:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105496:	c9                   	leave  
80105497:	c3                   	ret    
80105498:	90                   	nop
80105499:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
801054a0:	83 ec 0c             	sub    $0xc,%esp
801054a3:	53                   	push   %ebx
801054a4:	e8 b7 c5 ff ff       	call   80101a60 <iunlockput>
    end_op();
801054a9:	e8 12 d9 ff ff       	call   80102dc0 <end_op>
    return -1;
801054ae:	83 c4 10             	add    $0x10,%esp
801054b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054b6:	eb db                	jmp    80105493 <sys_chdir+0x73>
801054b8:	90                   	nop
801054b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
    end_op();
801054c0:	e8 fb d8 ff ff       	call   80102dc0 <end_op>
    return -1;
801054c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054ca:	eb c7                	jmp    80105493 <sys_chdir+0x73>
801054cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801054d0 <sys_exec>:
  return 0;
}

int
sys_exec(void)
{
801054d0:	55                   	push   %ebp
801054d1:	89 e5                	mov    %esp,%ebp
801054d3:	57                   	push   %edi
801054d4:	56                   	push   %esi
801054d5:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801054d6:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
  return 0;
}

int
sys_exec(void)
{
801054dc:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801054e2:	50                   	push   %eax
801054e3:	6a 00                	push   $0x0
801054e5:	e8 c6 f4 ff ff       	call   801049b0 <argstr>
801054ea:	83 c4 10             	add    $0x10,%esp
801054ed:	85 c0                	test   %eax,%eax
801054ef:	78 7f                	js     80105570 <sys_exec+0xa0>
801054f1:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
801054f7:	83 ec 08             	sub    $0x8,%esp
801054fa:	50                   	push   %eax
801054fb:	6a 01                	push   $0x1
801054fd:	e8 0e f4 ff ff       	call   80104910 <argint>
80105502:	83 c4 10             	add    $0x10,%esp
80105505:	85 c0                	test   %eax,%eax
80105507:	78 67                	js     80105570 <sys_exec+0xa0>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80105509:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
8010550f:	83 ec 04             	sub    $0x4,%esp
80105512:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105518:	68 80 00 00 00       	push   $0x80
8010551d:	6a 00                	push   $0x0
8010551f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105525:	50                   	push   %eax
80105526:	31 db                	xor    %ebx,%ebx
80105528:	e8 f3 f0 ff ff       	call   80104620 <memset>
8010552d:	83 c4 10             	add    $0x10,%esp
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80105530:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105536:	83 ec 08             	sub    $0x8,%esp
80105539:	57                   	push   %edi
8010553a:	8d 04 98             	lea    (%eax,%ebx,4),%eax
8010553d:	50                   	push   %eax
8010553e:	e8 4d f3 ff ff       	call   80104890 <fetchint>
80105543:	83 c4 10             	add    $0x10,%esp
80105546:	85 c0                	test   %eax,%eax
80105548:	78 26                	js     80105570 <sys_exec+0xa0>
      return -1;
    if(uarg == 0){
8010554a:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105550:	85 c0                	test   %eax,%eax
80105552:	74 2c                	je     80105580 <sys_exec+0xb0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
80105554:	83 ec 08             	sub    $0x8,%esp
80105557:	56                   	push   %esi
80105558:	50                   	push   %eax
80105559:	e8 62 f3 ff ff       	call   801048c0 <fetchstr>
8010555e:	83 c4 10             	add    $0x10,%esp
80105561:	85 c0                	test   %eax,%eax
80105563:	78 0b                	js     80105570 <sys_exec+0xa0>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
80105565:	83 c3 01             	add    $0x1,%ebx
80105568:	83 c6 04             	add    $0x4,%esi
    if(i >= NELEM(argv))
8010556b:	83 fb 20             	cmp    $0x20,%ebx
8010556e:	75 c0                	jne    80105530 <sys_exec+0x60>
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
80105570:	8d 65 f4             	lea    -0xc(%ebp),%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
80105573:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
80105578:	5b                   	pop    %ebx
80105579:	5e                   	pop    %esi
8010557a:	5f                   	pop    %edi
8010557b:	5d                   	pop    %ebp
8010557c:	c3                   	ret    
8010557d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
80105580:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105586:	83 ec 08             	sub    $0x8,%esp
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
      argv[i] = 0;
80105589:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105590:	00 00 00 00 
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
80105594:	50                   	push   %eax
80105595:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010559b:	e8 50 b4 ff ff       	call   801009f0 <exec>
801055a0:	83 c4 10             	add    $0x10,%esp
}
801055a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801055a6:	5b                   	pop    %ebx
801055a7:	5e                   	pop    %esi
801055a8:	5f                   	pop    %edi
801055a9:	5d                   	pop    %ebp
801055aa:	c3                   	ret    
801055ab:	90                   	nop
801055ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801055b0 <sys_pipe>:

int
sys_pipe(void)
{
801055b0:	55                   	push   %ebp
801055b1:	89 e5                	mov    %esp,%ebp
801055b3:	57                   	push   %edi
801055b4:	56                   	push   %esi
801055b5:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801055b6:	8d 45 dc             	lea    -0x24(%ebp),%eax
  return exec(path, argv);
}

int
sys_pipe(void)
{
801055b9:	83 ec 20             	sub    $0x20,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801055bc:	6a 08                	push   $0x8
801055be:	50                   	push   %eax
801055bf:	6a 00                	push   $0x0
801055c1:	e8 8a f3 ff ff       	call   80104950 <argptr>
801055c6:	83 c4 10             	add    $0x10,%esp
801055c9:	85 c0                	test   %eax,%eax
801055cb:	78 48                	js     80105615 <sys_pipe+0x65>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
801055cd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801055d0:	83 ec 08             	sub    $0x8,%esp
801055d3:	50                   	push   %eax
801055d4:	8d 45 e0             	lea    -0x20(%ebp),%eax
801055d7:	50                   	push   %eax
801055d8:	e8 13 df ff ff       	call   801034f0 <pipealloc>
801055dd:	83 c4 10             	add    $0x10,%esp
801055e0:	85 c0                	test   %eax,%eax
801055e2:	78 31                	js     80105615 <sys_pipe+0x65>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801055e4:	8b 5d e0             	mov    -0x20(%ebp),%ebx
801055e7:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
801055ee:	31 c0                	xor    %eax,%eax
    if(proc->ofile[fd] == 0){
801055f0:	8b 54 81 28          	mov    0x28(%ecx,%eax,4),%edx
801055f4:	85 d2                	test   %edx,%edx
801055f6:	74 28                	je     80105620 <sys_pipe+0x70>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
801055f8:	83 c0 01             	add    $0x1,%eax
801055fb:	83 f8 10             	cmp    $0x10,%eax
801055fe:	75 f0                	jne    801055f0 <sys_pipe+0x40>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
    fileclose(rf);
80105600:	83 ec 0c             	sub    $0xc,%esp
80105603:	53                   	push   %ebx
80105604:	e8 17 b8 ff ff       	call   80100e20 <fileclose>
    fileclose(wf);
80105609:	58                   	pop    %eax
8010560a:	ff 75 e4             	pushl  -0x1c(%ebp)
8010560d:	e8 0e b8 ff ff       	call   80100e20 <fileclose>
    return -1;
80105612:	83 c4 10             	add    $0x10,%esp
80105615:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010561a:	eb 45                	jmp    80105661 <sys_pipe+0xb1>
8010561c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105620:	8d 34 81             	lea    (%ecx,%eax,4),%esi
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105623:	8b 7d e4             	mov    -0x1c(%ebp),%edi
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105626:	31 d2                	xor    %edx,%edx
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80105628:	89 5e 28             	mov    %ebx,0x28(%esi)
8010562b:	90                   	nop
8010562c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
80105630:	83 7c 91 28 00       	cmpl   $0x0,0x28(%ecx,%edx,4)
80105635:	74 19                	je     80105650 <sys_pipe+0xa0>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105637:	83 c2 01             	add    $0x1,%edx
8010563a:	83 fa 10             	cmp    $0x10,%edx
8010563d:	75 f1                	jne    80105630 <sys_pipe+0x80>
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
8010563f:	c7 46 28 00 00 00 00 	movl   $0x0,0x28(%esi)
80105646:	eb b8                	jmp    80105600 <sys_pipe+0x50>
80105648:	90                   	nop
80105649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80105650:	89 7c 91 28          	mov    %edi,0x28(%ecx,%edx,4)
      proc->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
80105654:	8b 4d dc             	mov    -0x24(%ebp),%ecx
80105657:	89 01                	mov    %eax,(%ecx)
  fd[1] = fd1;
80105659:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010565c:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
8010565f:	31 c0                	xor    %eax,%eax
}
80105661:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105664:	5b                   	pop    %ebx
80105665:	5e                   	pop    %esi
80105666:	5f                   	pop    %edi
80105667:	5d                   	pop    %ebp
80105668:	c3                   	ret    
80105669:	66 90                	xchg   %ax,%ax
8010566b:	66 90                	xchg   %ax,%ax
8010566d:	66 90                	xchg   %ax,%ax
8010566f:	90                   	nop

80105670 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
80105670:	55                   	push   %ebp
80105671:	89 e5                	mov    %esp,%ebp
  return fork();
}
80105673:	5d                   	pop    %ebp
#include "proc.h"

int
sys_fork(void)
{
  return fork();
80105674:	e9 f7 e4 ff ff       	jmp    80103b70 <fork>
80105679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105680 <sys_exit>:
}

int
sys_exit(void)
{
80105680:	55                   	push   %ebp
80105681:	89 e5                	mov    %esp,%ebp
80105683:	83 ec 08             	sub    $0x8,%esp
  exit();
80105686:	e8 55 e7 ff ff       	call   80103de0 <exit>
  return 0;  // not reached
}
8010568b:	31 c0                	xor    %eax,%eax
8010568d:	c9                   	leave  
8010568e:	c3                   	ret    
8010568f:	90                   	nop

80105690 <sys_wait>:

int
sys_wait(void)
{
80105690:	55                   	push   %ebp
80105691:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105693:	5d                   	pop    %ebp
}

int
sys_wait(void)
{
  return wait();
80105694:	e9 97 e9 ff ff       	jmp    80104030 <wait>
80105699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801056a0 <sys_kill>:
}

int
sys_kill(void)
{
801056a0:	55                   	push   %ebp
801056a1:	89 e5                	mov    %esp,%ebp
801056a3:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
801056a6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801056a9:	50                   	push   %eax
801056aa:	6a 00                	push   $0x0
801056ac:	e8 5f f2 ff ff       	call   80104910 <argint>
801056b1:	83 c4 10             	add    $0x10,%esp
801056b4:	85 c0                	test   %eax,%eax
801056b6:	78 18                	js     801056d0 <sys_kill+0x30>
    return -1;
  return kill(pid);
801056b8:	83 ec 0c             	sub    $0xc,%esp
801056bb:	ff 75 f4             	pushl  -0xc(%ebp)
801056be:	e8 ad ea ff ff       	call   80104170 <kill>
801056c3:	83 c4 10             	add    $0x10,%esp
}
801056c6:	c9                   	leave  
801056c7:	c3                   	ret    
801056c8:	90                   	nop
801056c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
801056d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return kill(pid);
}
801056d5:	c9                   	leave  
801056d6:	c3                   	ret    
801056d7:	89 f6                	mov    %esi,%esi
801056d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801056e0 <sys_getpid>:

int
sys_getpid(void)
{
  return proc->pid;
801056e0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  return kill(pid);
}

int
sys_getpid(void)
{
801056e6:	55                   	push   %ebp
801056e7:	89 e5                	mov    %esp,%ebp
  return proc->pid;
801056e9:	8b 40 10             	mov    0x10(%eax),%eax
}
801056ec:	5d                   	pop    %ebp
801056ed:	c3                   	ret    
801056ee:	66 90                	xchg   %ax,%ax

801056f0 <sys_sbrk>:

int
sys_sbrk(void)
{
801056f0:	55                   	push   %ebp
801056f1:	89 e5                	mov    %esp,%ebp
801056f3:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
801056f4:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return proc->pid;
}

int
sys_sbrk(void)
{
801056f7:	83 ec 1c             	sub    $0x1c,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
801056fa:	50                   	push   %eax
801056fb:	6a 00                	push   $0x0
801056fd:	e8 0e f2 ff ff       	call   80104910 <argint>
80105702:	83 c4 10             	add    $0x10,%esp
80105705:	85 c0                	test   %eax,%eax
80105707:	78 27                	js     80105730 <sys_sbrk+0x40>
    return -1;
  addr = proc->sz;
80105709:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  if(growproc(n) < 0)
8010570f:	83 ec 0c             	sub    $0xc,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = proc->sz;
80105712:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105714:	ff 75 f4             	pushl  -0xc(%ebp)
80105717:	e8 e4 e3 ff ff       	call   80103b00 <growproc>
8010571c:	83 c4 10             	add    $0x10,%esp
8010571f:	85 c0                	test   %eax,%eax
80105721:	78 0d                	js     80105730 <sys_sbrk+0x40>
    return -1;
  return addr;
80105723:	89 d8                	mov    %ebx,%eax
}
80105725:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105728:	c9                   	leave  
80105729:	c3                   	ret    
8010572a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
80105730:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105735:	eb ee                	jmp    80105725 <sys_sbrk+0x35>
80105737:	89 f6                	mov    %esi,%esi
80105739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105740 <sys_sleep>:
  return addr;
}

int
sys_sleep(void)
{
80105740:	55                   	push   %ebp
80105741:	89 e5                	mov    %esp,%ebp
80105743:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105744:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return addr;
}

int
sys_sleep(void)
{
80105747:	83 ec 1c             	sub    $0x1c,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
8010574a:	50                   	push   %eax
8010574b:	6a 00                	push   $0x0
8010574d:	e8 be f1 ff ff       	call   80104910 <argint>
80105752:	83 c4 10             	add    $0x10,%esp
80105755:	85 c0                	test   %eax,%eax
80105757:	0f 88 8a 00 00 00    	js     801057e7 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
8010575d:	83 ec 0c             	sub    $0xc,%esp
80105760:	68 20 4c 11 80       	push   $0x80114c20
80105765:	e8 86 ec ff ff       	call   801043f0 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
8010576a:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010576d:	83 c4 10             	add    $0x10,%esp
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
80105770:	8b 1d 60 54 11 80    	mov    0x80115460,%ebx
  while(ticks - ticks0 < n){
80105776:	85 d2                	test   %edx,%edx
80105778:	75 27                	jne    801057a1 <sys_sleep+0x61>
8010577a:	eb 54                	jmp    801057d0 <sys_sleep+0x90>
8010577c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(proc->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105780:	83 ec 08             	sub    $0x8,%esp
80105783:	68 20 4c 11 80       	push   $0x80114c20
80105788:	68 60 54 11 80       	push   $0x80115460
8010578d:	e8 de e7 ff ff       	call   80103f70 <sleep>

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80105792:	a1 60 54 11 80       	mov    0x80115460,%eax
80105797:	83 c4 10             	add    $0x10,%esp
8010579a:	29 d8                	sub    %ebx,%eax
8010579c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010579f:	73 2f                	jae    801057d0 <sys_sleep+0x90>
    if(proc->killed){
801057a1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801057a7:	8b 40 24             	mov    0x24(%eax),%eax
801057aa:	85 c0                	test   %eax,%eax
801057ac:	74 d2                	je     80105780 <sys_sleep+0x40>
      release(&tickslock);
801057ae:	83 ec 0c             	sub    $0xc,%esp
801057b1:	68 20 4c 11 80       	push   $0x80114c20
801057b6:	e8 15 ee ff ff       	call   801045d0 <release>
      return -1;
801057bb:	83 c4 10             	add    $0x10,%esp
801057be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
801057c3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801057c6:	c9                   	leave  
801057c7:	c3                   	ret    
801057c8:	90                   	nop
801057c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
801057d0:	83 ec 0c             	sub    $0xc,%esp
801057d3:	68 20 4c 11 80       	push   $0x80114c20
801057d8:	e8 f3 ed ff ff       	call   801045d0 <release>
  return 0;
801057dd:	83 c4 10             	add    $0x10,%esp
801057e0:	31 c0                	xor    %eax,%eax
}
801057e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801057e5:	c9                   	leave  
801057e6:	c3                   	ret    
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
801057e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801057ec:	eb d5                	jmp    801057c3 <sys_sleep+0x83>
801057ee:	66 90                	xchg   %ax,%ax

801057f0 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
801057f0:	55                   	push   %ebp
801057f1:	89 e5                	mov    %esp,%ebp
801057f3:	53                   	push   %ebx
801057f4:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
801057f7:	68 20 4c 11 80       	push   $0x80114c20
801057fc:	e8 ef eb ff ff       	call   801043f0 <acquire>
  xticks = ticks;
80105801:	8b 1d 60 54 11 80    	mov    0x80115460,%ebx
  release(&tickslock);
80105807:	c7 04 24 20 4c 11 80 	movl   $0x80114c20,(%esp)
8010580e:	e8 bd ed ff ff       	call   801045d0 <release>
  return xticks;
}
80105813:	89 d8                	mov    %ebx,%eax
80105815:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105818:	c9                   	leave  
80105819:	c3                   	ret    
8010581a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105820 <sys_halt>:

int
sys_halt(void) {
80105820:	55                   	push   %ebp
80105821:	b8 53 00 00 00       	mov    $0x53,%eax
80105826:	b9 7d 78 10 80       	mov    $0x8010787d,%ecx
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010582b:	ba 00 89 ff ff       	mov    $0xffff8900,%edx
80105830:	89 e5                	mov    %esp,%ebp
80105832:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105838:	ee                   	out    %al,(%dx)
  char *p = "Shutdown";
  for (; *p; p++) {
80105839:	83 c1 01             	add    $0x1,%ecx
8010583c:	0f b6 01             	movzbl (%ecx),%eax
8010583f:	84 c0                	test   %al,%al
80105841:	75 f5                	jne    80105838 <sys_halt+0x18>
    outb(0x8900, *p);
  }
  return 0;
}
80105843:	31 c0                	xor    %eax,%eax
80105845:	5d                   	pop    %ebp
80105846:	c3                   	ret    
80105847:	66 90                	xchg   %ax,%ax
80105849:	66 90                	xchg   %ax,%ax
8010584b:	66 90                	xchg   %ax,%ax
8010584d:	66 90                	xchg   %ax,%ax
8010584f:	90                   	nop

80105850 <timerinit>:
#define TIMER_RATEGEN   0x04    // mode 2, rate generator
#define TIMER_16BIT     0x30    // r/w counter 16 bits, LSB first

void
timerinit(void)
{
80105850:	55                   	push   %ebp
80105851:	ba 43 00 00 00       	mov    $0x43,%edx
80105856:	b8 34 00 00 00       	mov    $0x34,%eax
8010585b:	89 e5                	mov    %esp,%ebp
8010585d:	83 ec 14             	sub    $0x14,%esp
80105860:	ee                   	out    %al,(%dx)
80105861:	ba 40 00 00 00       	mov    $0x40,%edx
80105866:	b8 9c ff ff ff       	mov    $0xffffff9c,%eax
8010586b:	ee                   	out    %al,(%dx)
8010586c:	b8 2e 00 00 00       	mov    $0x2e,%eax
80105871:	ee                   	out    %al,(%dx)
  // Interrupt 100 times/sec.
  outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
  outb(IO_TIMER1, TIMER_DIV(100) % 256);
  outb(IO_TIMER1, TIMER_DIV(100) / 256);
  picenable(IRQ_TIMER);
80105872:	6a 00                	push   $0x0
80105874:	e8 a7 db ff ff       	call   80103420 <picenable>
}
80105879:	83 c4 10             	add    $0x10,%esp
8010587c:	c9                   	leave  
8010587d:	c3                   	ret    

8010587e <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
8010587e:	1e                   	push   %ds
  pushl %es
8010587f:	06                   	push   %es
  pushl %fs
80105880:	0f a0                	push   %fs
  pushl %gs
80105882:	0f a8                	push   %gs
  pushal
80105884:	60                   	pusha  
  
  # Set up data and per-cpu segments.
  movw $(SEG_KDATA<<3), %ax
80105885:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
80105889:	8e d8                	mov    %eax,%ds
  movw %ax, %es
8010588b:	8e c0                	mov    %eax,%es
  movw $(SEG_KCPU<<3), %ax
8010588d:	66 b8 18 00          	mov    $0x18,%ax
  movw %ax, %fs
80105891:	8e e0                	mov    %eax,%fs
  movw %ax, %gs
80105893:	8e e8                	mov    %eax,%gs

  # Call trap(tf), where tf=%esp
  pushl %esp
80105895:	54                   	push   %esp
  call trap
80105896:	e8 e5 00 00 00       	call   80105980 <trap>
  addl $4, %esp
8010589b:	83 c4 04             	add    $0x4,%esp

8010589e <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
8010589e:	61                   	popa   
  popl %gs
8010589f:	0f a9                	pop    %gs
  popl %fs
801058a1:	0f a1                	pop    %fs
  popl %es
801058a3:	07                   	pop    %es
  popl %ds
801058a4:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
801058a5:	83 c4 08             	add    $0x8,%esp
  iret
801058a8:	cf                   	iret   
801058a9:	66 90                	xchg   %ax,%ax
801058ab:	66 90                	xchg   %ax,%ax
801058ad:	66 90                	xchg   %ax,%ax
801058af:	90                   	nop

801058b0 <tvinit>:
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
801058b0:	31 c0                	xor    %eax,%eax
801058b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
801058b8:	8b 14 85 0c a0 10 80 	mov    -0x7fef5ff4(,%eax,4),%edx
801058bf:	b9 08 00 00 00       	mov    $0x8,%ecx
801058c4:	c6 04 c5 64 4c 11 80 	movb   $0x0,-0x7feeb39c(,%eax,8)
801058cb:	00 
801058cc:	66 89 0c c5 62 4c 11 	mov    %cx,-0x7feeb39e(,%eax,8)
801058d3:	80 
801058d4:	c6 04 c5 65 4c 11 80 	movb   $0x8e,-0x7feeb39b(,%eax,8)
801058db:	8e 
801058dc:	66 89 14 c5 60 4c 11 	mov    %dx,-0x7feeb3a0(,%eax,8)
801058e3:	80 
801058e4:	c1 ea 10             	shr    $0x10,%edx
801058e7:	66 89 14 c5 66 4c 11 	mov    %dx,-0x7feeb39a(,%eax,8)
801058ee:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
801058ef:	83 c0 01             	add    $0x1,%eax
801058f2:	3d 00 01 00 00       	cmp    $0x100,%eax
801058f7:	75 bf                	jne    801058b8 <tvinit+0x8>
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
801058f9:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801058fa:	ba 08 00 00 00       	mov    $0x8,%edx
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
801058ff:	89 e5                	mov    %esp,%ebp
80105901:	83 ec 10             	sub    $0x10,%esp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105904:	a1 0c a1 10 80       	mov    0x8010a10c,%eax

  initlock(&tickslock, "time");
80105909:	68 86 78 10 80       	push   $0x80107886
8010590e:	68 20 4c 11 80       	push   $0x80114c20
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105913:	66 89 15 62 4e 11 80 	mov    %dx,0x80114e62
8010591a:	c6 05 64 4e 11 80 00 	movb   $0x0,0x80114e64
80105921:	66 a3 60 4e 11 80    	mov    %ax,0x80114e60
80105927:	c1 e8 10             	shr    $0x10,%eax
8010592a:	c6 05 65 4e 11 80 ef 	movb   $0xef,0x80114e65
80105931:	66 a3 66 4e 11 80    	mov    %ax,0x80114e66

  initlock(&tickslock, "time");
80105937:	e8 94 ea ff ff       	call   801043d0 <initlock>
}
8010593c:	83 c4 10             	add    $0x10,%esp
8010593f:	c9                   	leave  
80105940:	c3                   	ret    
80105941:	eb 0d                	jmp    80105950 <idtinit>
80105943:	90                   	nop
80105944:	90                   	nop
80105945:	90                   	nop
80105946:	90                   	nop
80105947:	90                   	nop
80105948:	90                   	nop
80105949:	90                   	nop
8010594a:	90                   	nop
8010594b:	90                   	nop
8010594c:	90                   	nop
8010594d:	90                   	nop
8010594e:	90                   	nop
8010594f:	90                   	nop

80105950 <idtinit>:

void
idtinit(void)
{
80105950:	55                   	push   %ebp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80105951:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105956:	89 e5                	mov    %esp,%ebp
80105958:	83 ec 10             	sub    $0x10,%esp
8010595b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
8010595f:	b8 60 4c 11 80       	mov    $0x80114c60,%eax
80105964:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105968:	c1 e8 10             	shr    $0x10,%eax
8010596b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
8010596f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105972:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105975:	c9                   	leave  
80105976:	c3                   	ret    
80105977:	89 f6                	mov    %esi,%esi
80105979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105980 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105980:	55                   	push   %ebp
80105981:	89 e5                	mov    %esp,%ebp
80105983:	57                   	push   %edi
80105984:	56                   	push   %esi
80105985:	53                   	push   %ebx
80105986:	83 ec 0c             	sub    $0xc,%esp
80105989:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
8010598c:	8b 43 30             	mov    0x30(%ebx),%eax
8010598f:	83 f8 40             	cmp    $0x40,%eax
80105992:	0f 84 f8 00 00 00    	je     80105a90 <trap+0x110>
    if(proc->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105998:	83 e8 20             	sub    $0x20,%eax
8010599b:	83 f8 1f             	cmp    $0x1f,%eax
8010599e:	77 68                	ja     80105a08 <trap+0x88>
801059a0:	ff 24 85 2c 79 10 80 	jmp    *-0x7fef86d4(,%eax,4)
801059a7:	89 f6                	mov    %esi,%esi
801059a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
801059b0:	e8 bb ce ff ff       	call   80102870 <cpunum>
801059b5:	85 c0                	test   %eax,%eax
801059b7:	0f 84 b3 01 00 00    	je     80105b70 <trap+0x1f0>
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
    lapiceoi();
801059bd:	e8 4e cf ff ff       	call   80102910 <lapiceoi>
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
801059c2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801059c8:	85 c0                	test   %eax,%eax
801059ca:	74 2d                	je     801059f9 <trap+0x79>
801059cc:	8b 50 24             	mov    0x24(%eax),%edx
801059cf:	85 d2                	test   %edx,%edx
801059d1:	0f 85 86 00 00 00    	jne    80105a5d <trap+0xdd>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
801059d7:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
801059db:	0f 84 ef 00 00 00    	je     80105ad0 <trap+0x150>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
801059e1:	8b 40 24             	mov    0x24(%eax),%eax
801059e4:	85 c0                	test   %eax,%eax
801059e6:	74 11                	je     801059f9 <trap+0x79>
801059e8:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
801059ec:	83 e0 03             	and    $0x3,%eax
801059ef:	66 83 f8 03          	cmp    $0x3,%ax
801059f3:	0f 84 c1 00 00 00    	je     80105aba <trap+0x13a>
    exit();
}
801059f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801059fc:	5b                   	pop    %ebx
801059fd:	5e                   	pop    %esi
801059fe:	5f                   	pop    %edi
801059ff:	5d                   	pop    %ebp
80105a00:	c3                   	ret    
80105a01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
80105a08:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
80105a0f:	85 c9                	test   %ecx,%ecx
80105a11:	0f 84 8d 01 00 00    	je     80105ba4 <trap+0x224>
80105a17:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80105a1b:	0f 84 83 01 00 00    	je     80105ba4 <trap+0x224>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105a21:	0f 20 d7             	mov    %cr2,%edi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105a24:	8b 73 38             	mov    0x38(%ebx),%esi
80105a27:	e8 44 ce ff ff       	call   80102870 <cpunum>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
80105a2c:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105a33:	57                   	push   %edi
80105a34:	56                   	push   %esi
80105a35:	50                   	push   %eax
80105a36:	ff 73 34             	pushl  0x34(%ebx)
80105a39:	ff 73 30             	pushl  0x30(%ebx)
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
80105a3c:	8d 42 6c             	lea    0x6c(%edx),%eax
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105a3f:	50                   	push   %eax
80105a40:	ff 72 10             	pushl  0x10(%edx)
80105a43:	68 e8 78 10 80       	push   $0x801078e8
80105a48:	e8 13 ac ff ff       	call   80100660 <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
            rcr2());
    proc->killed = 1;
80105a4d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105a53:	83 c4 20             	add    $0x20,%esp
80105a56:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105a5d:	0f b7 53 3c          	movzwl 0x3c(%ebx),%edx
80105a61:	83 e2 03             	and    $0x3,%edx
80105a64:	66 83 fa 03          	cmp    $0x3,%dx
80105a68:	0f 85 69 ff ff ff    	jne    801059d7 <trap+0x57>
    exit();
80105a6e:	e8 6d e3 ff ff       	call   80103de0 <exit>
80105a73:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105a79:	85 c0                	test   %eax,%eax
80105a7b:	0f 85 56 ff ff ff    	jne    801059d7 <trap+0x57>
80105a81:	e9 73 ff ff ff       	jmp    801059f9 <trap+0x79>
80105a86:	8d 76 00             	lea    0x0(%esi),%esi
80105a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
80105a90:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105a96:	8b 70 24             	mov    0x24(%eax),%esi
80105a99:	85 f6                	test   %esi,%esi
80105a9b:	0f 85 bf 00 00 00    	jne    80105b60 <trap+0x1e0>
      exit();
    proc->tf = tf;
80105aa1:	89 58 18             	mov    %ebx,0x18(%eax)
    syscall();
80105aa4:	e8 87 ef ff ff       	call   80104a30 <syscall>
    if(proc->killed)
80105aa9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105aaf:	8b 58 24             	mov    0x24(%eax),%ebx
80105ab2:	85 db                	test   %ebx,%ebx
80105ab4:	0f 84 3f ff ff ff    	je     801059f9 <trap+0x79>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();
}
80105aba:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105abd:	5b                   	pop    %ebx
80105abe:	5e                   	pop    %esi
80105abf:	5f                   	pop    %edi
80105ac0:	5d                   	pop    %ebp
    if(proc->killed)
      exit();
    proc->tf = tf;
    syscall();
    if(proc->killed)
      exit();
80105ac1:	e9 1a e3 ff ff       	jmp    80103de0 <exit>
80105ac6:	8d 76 00             	lea    0x0(%esi),%esi
80105ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105ad0:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105ad4:	0f 85 07 ff ff ff    	jne    801059e1 <trap+0x61>
    yield();
80105ada:	e8 51 e4 ff ff       	call   80103f30 <yield>
80105adf:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105ae5:	85 c0                	test   %eax,%eax
80105ae7:	0f 85 f4 fe ff ff    	jne    801059e1 <trap+0x61>
80105aed:	e9 07 ff ff ff       	jmp    801059f9 <trap+0x79>
80105af2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
80105af8:	e8 53 cc ff ff       	call   80102750 <kbdintr>
    lapiceoi();
80105afd:	e8 0e ce ff ff       	call   80102910 <lapiceoi>
    break;
80105b02:	e9 bb fe ff ff       	jmp    801059c2 <trap+0x42>
80105b07:	89 f6                	mov    %esi,%esi
80105b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  case T_IRQ0 + IRQ_COM1:
    uartintr();
80105b10:	e8 2b 02 00 00       	call   80105d40 <uartintr>
80105b15:	e9 a3 fe ff ff       	jmp    801059bd <trap+0x3d>
80105b1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105b20:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
80105b24:	8b 7b 38             	mov    0x38(%ebx),%edi
80105b27:	e8 44 cd ff ff       	call   80102870 <cpunum>
80105b2c:	57                   	push   %edi
80105b2d:	56                   	push   %esi
80105b2e:	50                   	push   %eax
80105b2f:	68 90 78 10 80       	push   $0x80107890
80105b34:	e8 27 ab ff ff       	call   80100660 <cprintf>
            cpunum(), tf->cs, tf->eip);
    lapiceoi();
80105b39:	e8 d2 cd ff ff       	call   80102910 <lapiceoi>
    break;
80105b3e:	83 c4 10             	add    $0x10,%esp
80105b41:	e9 7c fe ff ff       	jmp    801059c2 <trap+0x42>
80105b46:	8d 76 00             	lea    0x0(%esi),%esi
80105b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
80105b50:	e8 6b c6 ff ff       	call   801021c0 <ideintr>
    lapiceoi();
80105b55:	e8 b6 cd ff ff       	call   80102910 <lapiceoi>
    break;
80105b5a:	e9 63 fe ff ff       	jmp    801059c2 <trap+0x42>
80105b5f:	90                   	nop
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
      exit();
80105b60:	e8 7b e2 ff ff       	call   80103de0 <exit>
80105b65:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105b6b:	e9 31 ff ff ff       	jmp    80105aa1 <trap+0x121>
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
80105b70:	83 ec 0c             	sub    $0xc,%esp
80105b73:	68 20 4c 11 80       	push   $0x80114c20
80105b78:	e8 73 e8 ff ff       	call   801043f0 <acquire>
      ticks++;
      wakeup(&ticks);
80105b7d:	c7 04 24 60 54 11 80 	movl   $0x80115460,(%esp)

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
      ticks++;
80105b84:	83 05 60 54 11 80 01 	addl   $0x1,0x80115460
      wakeup(&ticks);
80105b8b:	e8 80 e5 ff ff       	call   80104110 <wakeup>
      release(&tickslock);
80105b90:	c7 04 24 20 4c 11 80 	movl   $0x80114c20,(%esp)
80105b97:	e8 34 ea ff ff       	call   801045d0 <release>
80105b9c:	83 c4 10             	add    $0x10,%esp
80105b9f:	e9 19 fe ff ff       	jmp    801059bd <trap+0x3d>
80105ba4:	0f 20 d7             	mov    %cr2,%edi

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105ba7:	8b 73 38             	mov    0x38(%ebx),%esi
80105baa:	e8 c1 cc ff ff       	call   80102870 <cpunum>
80105baf:	83 ec 0c             	sub    $0xc,%esp
80105bb2:	57                   	push   %edi
80105bb3:	56                   	push   %esi
80105bb4:	50                   	push   %eax
80105bb5:	ff 73 30             	pushl  0x30(%ebx)
80105bb8:	68 b4 78 10 80       	push   $0x801078b4
80105bbd:	e8 9e aa ff ff       	call   80100660 <cprintf>
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
80105bc2:	83 c4 14             	add    $0x14,%esp
80105bc5:	68 8b 78 10 80       	push   $0x8010788b
80105bca:	e8 a1 a7 ff ff       	call   80100370 <panic>
80105bcf:	90                   	nop

80105bd0 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105bd0:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
  outb(COM1+0, c);
}

static int
uartgetc(void)
{
80105bd5:	55                   	push   %ebp
80105bd6:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105bd8:	85 c0                	test   %eax,%eax
80105bda:	74 1c                	je     80105bf8 <uartgetc+0x28>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105bdc:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105be1:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105be2:	a8 01                	test   $0x1,%al
80105be4:	74 12                	je     80105bf8 <uartgetc+0x28>
80105be6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105beb:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105bec:	0f b6 c0             	movzbl %al,%eax
}
80105bef:	5d                   	pop    %ebp
80105bf0:	c3                   	ret    
80105bf1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

static int
uartgetc(void)
{
  if(!uart)
    return -1;
80105bf8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(!(inb(COM1+5) & 0x01))
    return -1;
  return inb(COM1+0);
}
80105bfd:	5d                   	pop    %ebp
80105bfe:	c3                   	ret    
80105bff:	90                   	nop

80105c00 <uartputc.part.0>:
  for(p="xv6...\n"; *p; p++)
    uartputc(*p);
}

void
uartputc(int c)
80105c00:	55                   	push   %ebp
80105c01:	89 e5                	mov    %esp,%ebp
80105c03:	57                   	push   %edi
80105c04:	56                   	push   %esi
80105c05:	53                   	push   %ebx
80105c06:	89 c7                	mov    %eax,%edi
80105c08:	bb 80 00 00 00       	mov    $0x80,%ebx
80105c0d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105c12:	83 ec 0c             	sub    $0xc,%esp
80105c15:	eb 1b                	jmp    80105c32 <uartputc.part.0+0x32>
80105c17:	89 f6                	mov    %esi,%esi
80105c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
80105c20:	83 ec 0c             	sub    $0xc,%esp
80105c23:	6a 0a                	push   $0xa
80105c25:	e8 06 cd ff ff       	call   80102930 <microdelay>
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105c2a:	83 c4 10             	add    $0x10,%esp
80105c2d:	83 eb 01             	sub    $0x1,%ebx
80105c30:	74 07                	je     80105c39 <uartputc.part.0+0x39>
80105c32:	89 f2                	mov    %esi,%edx
80105c34:	ec                   	in     (%dx),%al
80105c35:	a8 20                	test   $0x20,%al
80105c37:	74 e7                	je     80105c20 <uartputc.part.0+0x20>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105c39:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105c3e:	89 f8                	mov    %edi,%eax
80105c40:	ee                   	out    %al,(%dx)
    microdelay(10);
  outb(COM1+0, c);
}
80105c41:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c44:	5b                   	pop    %ebx
80105c45:	5e                   	pop    %esi
80105c46:	5f                   	pop    %edi
80105c47:	5d                   	pop    %ebp
80105c48:	c3                   	ret    
80105c49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105c50 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
80105c50:	55                   	push   %ebp
80105c51:	31 c9                	xor    %ecx,%ecx
80105c53:	89 c8                	mov    %ecx,%eax
80105c55:	89 e5                	mov    %esp,%ebp
80105c57:	57                   	push   %edi
80105c58:	56                   	push   %esi
80105c59:	53                   	push   %ebx
80105c5a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105c5f:	89 da                	mov    %ebx,%edx
80105c61:	83 ec 0c             	sub    $0xc,%esp
80105c64:	ee                   	out    %al,(%dx)
80105c65:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105c6a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105c6f:	89 fa                	mov    %edi,%edx
80105c71:	ee                   	out    %al,(%dx)
80105c72:	b8 0c 00 00 00       	mov    $0xc,%eax
80105c77:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105c7c:	ee                   	out    %al,(%dx)
80105c7d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105c82:	89 c8                	mov    %ecx,%eax
80105c84:	89 f2                	mov    %esi,%edx
80105c86:	ee                   	out    %al,(%dx)
80105c87:	b8 03 00 00 00       	mov    $0x3,%eax
80105c8c:	89 fa                	mov    %edi,%edx
80105c8e:	ee                   	out    %al,(%dx)
80105c8f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105c94:	89 c8                	mov    %ecx,%eax
80105c96:	ee                   	out    %al,(%dx)
80105c97:	b8 01 00 00 00       	mov    $0x1,%eax
80105c9c:	89 f2                	mov    %esi,%edx
80105c9e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105c9f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105ca4:	ec                   	in     (%dx),%al
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
80105ca5:	3c ff                	cmp    $0xff,%al
80105ca7:	74 5a                	je     80105d03 <uartinit+0xb3>
    return;
  uart = 1;
80105ca9:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80105cb0:	00 00 00 
80105cb3:	89 da                	mov    %ebx,%edx
80105cb5:	ec                   	in     (%dx),%al
80105cb6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105cbb:	ec                   	in     (%dx),%al

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  picenable(IRQ_COM1);
80105cbc:	83 ec 0c             	sub    $0xc,%esp
80105cbf:	6a 04                	push   $0x4
80105cc1:	e8 5a d7 ff ff       	call   80103420 <picenable>
  ioapicenable(IRQ_COM1, 0);
80105cc6:	59                   	pop    %ecx
80105cc7:	5b                   	pop    %ebx
80105cc8:	6a 00                	push   $0x0
80105cca:	6a 04                	push   $0x4
80105ccc:	bb ac 79 10 80       	mov    $0x801079ac,%ebx
80105cd1:	e8 4a c7 ff ff       	call   80102420 <ioapicenable>
80105cd6:	83 c4 10             	add    $0x10,%esp
80105cd9:	b8 78 00 00 00       	mov    $0x78,%eax
80105cde:	eb 0a                	jmp    80105cea <uartinit+0x9a>

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105ce0:	83 c3 01             	add    $0x1,%ebx
80105ce3:	0f be 03             	movsbl (%ebx),%eax
80105ce6:	84 c0                	test   %al,%al
80105ce8:	74 19                	je     80105d03 <uartinit+0xb3>
void
uartputc(int c)
{
  int i;

  if(!uart)
80105cea:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105cf0:	85 d2                	test   %edx,%edx
80105cf2:	74 ec                	je     80105ce0 <uartinit+0x90>
  inb(COM1+0);
  picenable(IRQ_COM1);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105cf4:	83 c3 01             	add    $0x1,%ebx
80105cf7:	e8 04 ff ff ff       	call   80105c00 <uartputc.part.0>
80105cfc:	0f be 03             	movsbl (%ebx),%eax
80105cff:	84 c0                	test   %al,%al
80105d01:	75 e7                	jne    80105cea <uartinit+0x9a>
    uartputc(*p);
}
80105d03:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105d06:	5b                   	pop    %ebx
80105d07:	5e                   	pop    %esi
80105d08:	5f                   	pop    %edi
80105d09:	5d                   	pop    %ebp
80105d0a:	c3                   	ret    
80105d0b:	90                   	nop
80105d0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105d10 <uartputc>:
void
uartputc(int c)
{
  int i;

  if(!uart)
80105d10:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80105d16:	55                   	push   %ebp
80105d17:	89 e5                	mov    %esp,%ebp
  int i;

  if(!uart)
80105d19:	85 d2                	test   %edx,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80105d1b:	8b 45 08             	mov    0x8(%ebp),%eax
  int i;

  if(!uart)
80105d1e:	74 10                	je     80105d30 <uartputc+0x20>
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
  outb(COM1+0, c);
}
80105d20:	5d                   	pop    %ebp
80105d21:	e9 da fe ff ff       	jmp    80105c00 <uartputc.part.0>
80105d26:	8d 76 00             	lea    0x0(%esi),%esi
80105d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105d30:	5d                   	pop    %ebp
80105d31:	c3                   	ret    
80105d32:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105d40 <uartintr>:
  return inb(COM1+0);
}

void
uartintr(void)
{
80105d40:	55                   	push   %ebp
80105d41:	89 e5                	mov    %esp,%ebp
80105d43:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80105d46:	68 d0 5b 10 80       	push   $0x80105bd0
80105d4b:	e8 a0 aa ff ff       	call   801007f0 <consoleintr>
}
80105d50:	83 c4 10             	add    $0x10,%esp
80105d53:	c9                   	leave  
80105d54:	c3                   	ret    

80105d55 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
80105d55:	6a 00                	push   $0x0
  pushl $0
80105d57:	6a 00                	push   $0x0
  jmp alltraps
80105d59:	e9 20 fb ff ff       	jmp    8010587e <alltraps>

80105d5e <vector1>:
.globl vector1
vector1:
  pushl $0
80105d5e:	6a 00                	push   $0x0
  pushl $1
80105d60:	6a 01                	push   $0x1
  jmp alltraps
80105d62:	e9 17 fb ff ff       	jmp    8010587e <alltraps>

80105d67 <vector2>:
.globl vector2
vector2:
  pushl $0
80105d67:	6a 00                	push   $0x0
  pushl $2
80105d69:	6a 02                	push   $0x2
  jmp alltraps
80105d6b:	e9 0e fb ff ff       	jmp    8010587e <alltraps>

80105d70 <vector3>:
.globl vector3
vector3:
  pushl $0
80105d70:	6a 00                	push   $0x0
  pushl $3
80105d72:	6a 03                	push   $0x3
  jmp alltraps
80105d74:	e9 05 fb ff ff       	jmp    8010587e <alltraps>

80105d79 <vector4>:
.globl vector4
vector4:
  pushl $0
80105d79:	6a 00                	push   $0x0
  pushl $4
80105d7b:	6a 04                	push   $0x4
  jmp alltraps
80105d7d:	e9 fc fa ff ff       	jmp    8010587e <alltraps>

80105d82 <vector5>:
.globl vector5
vector5:
  pushl $0
80105d82:	6a 00                	push   $0x0
  pushl $5
80105d84:	6a 05                	push   $0x5
  jmp alltraps
80105d86:	e9 f3 fa ff ff       	jmp    8010587e <alltraps>

80105d8b <vector6>:
.globl vector6
vector6:
  pushl $0
80105d8b:	6a 00                	push   $0x0
  pushl $6
80105d8d:	6a 06                	push   $0x6
  jmp alltraps
80105d8f:	e9 ea fa ff ff       	jmp    8010587e <alltraps>

80105d94 <vector7>:
.globl vector7
vector7:
  pushl $0
80105d94:	6a 00                	push   $0x0
  pushl $7
80105d96:	6a 07                	push   $0x7
  jmp alltraps
80105d98:	e9 e1 fa ff ff       	jmp    8010587e <alltraps>

80105d9d <vector8>:
.globl vector8
vector8:
  pushl $8
80105d9d:	6a 08                	push   $0x8
  jmp alltraps
80105d9f:	e9 da fa ff ff       	jmp    8010587e <alltraps>

80105da4 <vector9>:
.globl vector9
vector9:
  pushl $0
80105da4:	6a 00                	push   $0x0
  pushl $9
80105da6:	6a 09                	push   $0x9
  jmp alltraps
80105da8:	e9 d1 fa ff ff       	jmp    8010587e <alltraps>

80105dad <vector10>:
.globl vector10
vector10:
  pushl $10
80105dad:	6a 0a                	push   $0xa
  jmp alltraps
80105daf:	e9 ca fa ff ff       	jmp    8010587e <alltraps>

80105db4 <vector11>:
.globl vector11
vector11:
  pushl $11
80105db4:	6a 0b                	push   $0xb
  jmp alltraps
80105db6:	e9 c3 fa ff ff       	jmp    8010587e <alltraps>

80105dbb <vector12>:
.globl vector12
vector12:
  pushl $12
80105dbb:	6a 0c                	push   $0xc
  jmp alltraps
80105dbd:	e9 bc fa ff ff       	jmp    8010587e <alltraps>

80105dc2 <vector13>:
.globl vector13
vector13:
  pushl $13
80105dc2:	6a 0d                	push   $0xd
  jmp alltraps
80105dc4:	e9 b5 fa ff ff       	jmp    8010587e <alltraps>

80105dc9 <vector14>:
.globl vector14
vector14:
  pushl $14
80105dc9:	6a 0e                	push   $0xe
  jmp alltraps
80105dcb:	e9 ae fa ff ff       	jmp    8010587e <alltraps>

80105dd0 <vector15>:
.globl vector15
vector15:
  pushl $0
80105dd0:	6a 00                	push   $0x0
  pushl $15
80105dd2:	6a 0f                	push   $0xf
  jmp alltraps
80105dd4:	e9 a5 fa ff ff       	jmp    8010587e <alltraps>

80105dd9 <vector16>:
.globl vector16
vector16:
  pushl $0
80105dd9:	6a 00                	push   $0x0
  pushl $16
80105ddb:	6a 10                	push   $0x10
  jmp alltraps
80105ddd:	e9 9c fa ff ff       	jmp    8010587e <alltraps>

80105de2 <vector17>:
.globl vector17
vector17:
  pushl $17
80105de2:	6a 11                	push   $0x11
  jmp alltraps
80105de4:	e9 95 fa ff ff       	jmp    8010587e <alltraps>

80105de9 <vector18>:
.globl vector18
vector18:
  pushl $0
80105de9:	6a 00                	push   $0x0
  pushl $18
80105deb:	6a 12                	push   $0x12
  jmp alltraps
80105ded:	e9 8c fa ff ff       	jmp    8010587e <alltraps>

80105df2 <vector19>:
.globl vector19
vector19:
  pushl $0
80105df2:	6a 00                	push   $0x0
  pushl $19
80105df4:	6a 13                	push   $0x13
  jmp alltraps
80105df6:	e9 83 fa ff ff       	jmp    8010587e <alltraps>

80105dfb <vector20>:
.globl vector20
vector20:
  pushl $0
80105dfb:	6a 00                	push   $0x0
  pushl $20
80105dfd:	6a 14                	push   $0x14
  jmp alltraps
80105dff:	e9 7a fa ff ff       	jmp    8010587e <alltraps>

80105e04 <vector21>:
.globl vector21
vector21:
  pushl $0
80105e04:	6a 00                	push   $0x0
  pushl $21
80105e06:	6a 15                	push   $0x15
  jmp alltraps
80105e08:	e9 71 fa ff ff       	jmp    8010587e <alltraps>

80105e0d <vector22>:
.globl vector22
vector22:
  pushl $0
80105e0d:	6a 00                	push   $0x0
  pushl $22
80105e0f:	6a 16                	push   $0x16
  jmp alltraps
80105e11:	e9 68 fa ff ff       	jmp    8010587e <alltraps>

80105e16 <vector23>:
.globl vector23
vector23:
  pushl $0
80105e16:	6a 00                	push   $0x0
  pushl $23
80105e18:	6a 17                	push   $0x17
  jmp alltraps
80105e1a:	e9 5f fa ff ff       	jmp    8010587e <alltraps>

80105e1f <vector24>:
.globl vector24
vector24:
  pushl $0
80105e1f:	6a 00                	push   $0x0
  pushl $24
80105e21:	6a 18                	push   $0x18
  jmp alltraps
80105e23:	e9 56 fa ff ff       	jmp    8010587e <alltraps>

80105e28 <vector25>:
.globl vector25
vector25:
  pushl $0
80105e28:	6a 00                	push   $0x0
  pushl $25
80105e2a:	6a 19                	push   $0x19
  jmp alltraps
80105e2c:	e9 4d fa ff ff       	jmp    8010587e <alltraps>

80105e31 <vector26>:
.globl vector26
vector26:
  pushl $0
80105e31:	6a 00                	push   $0x0
  pushl $26
80105e33:	6a 1a                	push   $0x1a
  jmp alltraps
80105e35:	e9 44 fa ff ff       	jmp    8010587e <alltraps>

80105e3a <vector27>:
.globl vector27
vector27:
  pushl $0
80105e3a:	6a 00                	push   $0x0
  pushl $27
80105e3c:	6a 1b                	push   $0x1b
  jmp alltraps
80105e3e:	e9 3b fa ff ff       	jmp    8010587e <alltraps>

80105e43 <vector28>:
.globl vector28
vector28:
  pushl $0
80105e43:	6a 00                	push   $0x0
  pushl $28
80105e45:	6a 1c                	push   $0x1c
  jmp alltraps
80105e47:	e9 32 fa ff ff       	jmp    8010587e <alltraps>

80105e4c <vector29>:
.globl vector29
vector29:
  pushl $0
80105e4c:	6a 00                	push   $0x0
  pushl $29
80105e4e:	6a 1d                	push   $0x1d
  jmp alltraps
80105e50:	e9 29 fa ff ff       	jmp    8010587e <alltraps>

80105e55 <vector30>:
.globl vector30
vector30:
  pushl $0
80105e55:	6a 00                	push   $0x0
  pushl $30
80105e57:	6a 1e                	push   $0x1e
  jmp alltraps
80105e59:	e9 20 fa ff ff       	jmp    8010587e <alltraps>

80105e5e <vector31>:
.globl vector31
vector31:
  pushl $0
80105e5e:	6a 00                	push   $0x0
  pushl $31
80105e60:	6a 1f                	push   $0x1f
  jmp alltraps
80105e62:	e9 17 fa ff ff       	jmp    8010587e <alltraps>

80105e67 <vector32>:
.globl vector32
vector32:
  pushl $0
80105e67:	6a 00                	push   $0x0
  pushl $32
80105e69:	6a 20                	push   $0x20
  jmp alltraps
80105e6b:	e9 0e fa ff ff       	jmp    8010587e <alltraps>

80105e70 <vector33>:
.globl vector33
vector33:
  pushl $0
80105e70:	6a 00                	push   $0x0
  pushl $33
80105e72:	6a 21                	push   $0x21
  jmp alltraps
80105e74:	e9 05 fa ff ff       	jmp    8010587e <alltraps>

80105e79 <vector34>:
.globl vector34
vector34:
  pushl $0
80105e79:	6a 00                	push   $0x0
  pushl $34
80105e7b:	6a 22                	push   $0x22
  jmp alltraps
80105e7d:	e9 fc f9 ff ff       	jmp    8010587e <alltraps>

80105e82 <vector35>:
.globl vector35
vector35:
  pushl $0
80105e82:	6a 00                	push   $0x0
  pushl $35
80105e84:	6a 23                	push   $0x23
  jmp alltraps
80105e86:	e9 f3 f9 ff ff       	jmp    8010587e <alltraps>

80105e8b <vector36>:
.globl vector36
vector36:
  pushl $0
80105e8b:	6a 00                	push   $0x0
  pushl $36
80105e8d:	6a 24                	push   $0x24
  jmp alltraps
80105e8f:	e9 ea f9 ff ff       	jmp    8010587e <alltraps>

80105e94 <vector37>:
.globl vector37
vector37:
  pushl $0
80105e94:	6a 00                	push   $0x0
  pushl $37
80105e96:	6a 25                	push   $0x25
  jmp alltraps
80105e98:	e9 e1 f9 ff ff       	jmp    8010587e <alltraps>

80105e9d <vector38>:
.globl vector38
vector38:
  pushl $0
80105e9d:	6a 00                	push   $0x0
  pushl $38
80105e9f:	6a 26                	push   $0x26
  jmp alltraps
80105ea1:	e9 d8 f9 ff ff       	jmp    8010587e <alltraps>

80105ea6 <vector39>:
.globl vector39
vector39:
  pushl $0
80105ea6:	6a 00                	push   $0x0
  pushl $39
80105ea8:	6a 27                	push   $0x27
  jmp alltraps
80105eaa:	e9 cf f9 ff ff       	jmp    8010587e <alltraps>

80105eaf <vector40>:
.globl vector40
vector40:
  pushl $0
80105eaf:	6a 00                	push   $0x0
  pushl $40
80105eb1:	6a 28                	push   $0x28
  jmp alltraps
80105eb3:	e9 c6 f9 ff ff       	jmp    8010587e <alltraps>

80105eb8 <vector41>:
.globl vector41
vector41:
  pushl $0
80105eb8:	6a 00                	push   $0x0
  pushl $41
80105eba:	6a 29                	push   $0x29
  jmp alltraps
80105ebc:	e9 bd f9 ff ff       	jmp    8010587e <alltraps>

80105ec1 <vector42>:
.globl vector42
vector42:
  pushl $0
80105ec1:	6a 00                	push   $0x0
  pushl $42
80105ec3:	6a 2a                	push   $0x2a
  jmp alltraps
80105ec5:	e9 b4 f9 ff ff       	jmp    8010587e <alltraps>

80105eca <vector43>:
.globl vector43
vector43:
  pushl $0
80105eca:	6a 00                	push   $0x0
  pushl $43
80105ecc:	6a 2b                	push   $0x2b
  jmp alltraps
80105ece:	e9 ab f9 ff ff       	jmp    8010587e <alltraps>

80105ed3 <vector44>:
.globl vector44
vector44:
  pushl $0
80105ed3:	6a 00                	push   $0x0
  pushl $44
80105ed5:	6a 2c                	push   $0x2c
  jmp alltraps
80105ed7:	e9 a2 f9 ff ff       	jmp    8010587e <alltraps>

80105edc <vector45>:
.globl vector45
vector45:
  pushl $0
80105edc:	6a 00                	push   $0x0
  pushl $45
80105ede:	6a 2d                	push   $0x2d
  jmp alltraps
80105ee0:	e9 99 f9 ff ff       	jmp    8010587e <alltraps>

80105ee5 <vector46>:
.globl vector46
vector46:
  pushl $0
80105ee5:	6a 00                	push   $0x0
  pushl $46
80105ee7:	6a 2e                	push   $0x2e
  jmp alltraps
80105ee9:	e9 90 f9 ff ff       	jmp    8010587e <alltraps>

80105eee <vector47>:
.globl vector47
vector47:
  pushl $0
80105eee:	6a 00                	push   $0x0
  pushl $47
80105ef0:	6a 2f                	push   $0x2f
  jmp alltraps
80105ef2:	e9 87 f9 ff ff       	jmp    8010587e <alltraps>

80105ef7 <vector48>:
.globl vector48
vector48:
  pushl $0
80105ef7:	6a 00                	push   $0x0
  pushl $48
80105ef9:	6a 30                	push   $0x30
  jmp alltraps
80105efb:	e9 7e f9 ff ff       	jmp    8010587e <alltraps>

80105f00 <vector49>:
.globl vector49
vector49:
  pushl $0
80105f00:	6a 00                	push   $0x0
  pushl $49
80105f02:	6a 31                	push   $0x31
  jmp alltraps
80105f04:	e9 75 f9 ff ff       	jmp    8010587e <alltraps>

80105f09 <vector50>:
.globl vector50
vector50:
  pushl $0
80105f09:	6a 00                	push   $0x0
  pushl $50
80105f0b:	6a 32                	push   $0x32
  jmp alltraps
80105f0d:	e9 6c f9 ff ff       	jmp    8010587e <alltraps>

80105f12 <vector51>:
.globl vector51
vector51:
  pushl $0
80105f12:	6a 00                	push   $0x0
  pushl $51
80105f14:	6a 33                	push   $0x33
  jmp alltraps
80105f16:	e9 63 f9 ff ff       	jmp    8010587e <alltraps>

80105f1b <vector52>:
.globl vector52
vector52:
  pushl $0
80105f1b:	6a 00                	push   $0x0
  pushl $52
80105f1d:	6a 34                	push   $0x34
  jmp alltraps
80105f1f:	e9 5a f9 ff ff       	jmp    8010587e <alltraps>

80105f24 <vector53>:
.globl vector53
vector53:
  pushl $0
80105f24:	6a 00                	push   $0x0
  pushl $53
80105f26:	6a 35                	push   $0x35
  jmp alltraps
80105f28:	e9 51 f9 ff ff       	jmp    8010587e <alltraps>

80105f2d <vector54>:
.globl vector54
vector54:
  pushl $0
80105f2d:	6a 00                	push   $0x0
  pushl $54
80105f2f:	6a 36                	push   $0x36
  jmp alltraps
80105f31:	e9 48 f9 ff ff       	jmp    8010587e <alltraps>

80105f36 <vector55>:
.globl vector55
vector55:
  pushl $0
80105f36:	6a 00                	push   $0x0
  pushl $55
80105f38:	6a 37                	push   $0x37
  jmp alltraps
80105f3a:	e9 3f f9 ff ff       	jmp    8010587e <alltraps>

80105f3f <vector56>:
.globl vector56
vector56:
  pushl $0
80105f3f:	6a 00                	push   $0x0
  pushl $56
80105f41:	6a 38                	push   $0x38
  jmp alltraps
80105f43:	e9 36 f9 ff ff       	jmp    8010587e <alltraps>

80105f48 <vector57>:
.globl vector57
vector57:
  pushl $0
80105f48:	6a 00                	push   $0x0
  pushl $57
80105f4a:	6a 39                	push   $0x39
  jmp alltraps
80105f4c:	e9 2d f9 ff ff       	jmp    8010587e <alltraps>

80105f51 <vector58>:
.globl vector58
vector58:
  pushl $0
80105f51:	6a 00                	push   $0x0
  pushl $58
80105f53:	6a 3a                	push   $0x3a
  jmp alltraps
80105f55:	e9 24 f9 ff ff       	jmp    8010587e <alltraps>

80105f5a <vector59>:
.globl vector59
vector59:
  pushl $0
80105f5a:	6a 00                	push   $0x0
  pushl $59
80105f5c:	6a 3b                	push   $0x3b
  jmp alltraps
80105f5e:	e9 1b f9 ff ff       	jmp    8010587e <alltraps>

80105f63 <vector60>:
.globl vector60
vector60:
  pushl $0
80105f63:	6a 00                	push   $0x0
  pushl $60
80105f65:	6a 3c                	push   $0x3c
  jmp alltraps
80105f67:	e9 12 f9 ff ff       	jmp    8010587e <alltraps>

80105f6c <vector61>:
.globl vector61
vector61:
  pushl $0
80105f6c:	6a 00                	push   $0x0
  pushl $61
80105f6e:	6a 3d                	push   $0x3d
  jmp alltraps
80105f70:	e9 09 f9 ff ff       	jmp    8010587e <alltraps>

80105f75 <vector62>:
.globl vector62
vector62:
  pushl $0
80105f75:	6a 00                	push   $0x0
  pushl $62
80105f77:	6a 3e                	push   $0x3e
  jmp alltraps
80105f79:	e9 00 f9 ff ff       	jmp    8010587e <alltraps>

80105f7e <vector63>:
.globl vector63
vector63:
  pushl $0
80105f7e:	6a 00                	push   $0x0
  pushl $63
80105f80:	6a 3f                	push   $0x3f
  jmp alltraps
80105f82:	e9 f7 f8 ff ff       	jmp    8010587e <alltraps>

80105f87 <vector64>:
.globl vector64
vector64:
  pushl $0
80105f87:	6a 00                	push   $0x0
  pushl $64
80105f89:	6a 40                	push   $0x40
  jmp alltraps
80105f8b:	e9 ee f8 ff ff       	jmp    8010587e <alltraps>

80105f90 <vector65>:
.globl vector65
vector65:
  pushl $0
80105f90:	6a 00                	push   $0x0
  pushl $65
80105f92:	6a 41                	push   $0x41
  jmp alltraps
80105f94:	e9 e5 f8 ff ff       	jmp    8010587e <alltraps>

80105f99 <vector66>:
.globl vector66
vector66:
  pushl $0
80105f99:	6a 00                	push   $0x0
  pushl $66
80105f9b:	6a 42                	push   $0x42
  jmp alltraps
80105f9d:	e9 dc f8 ff ff       	jmp    8010587e <alltraps>

80105fa2 <vector67>:
.globl vector67
vector67:
  pushl $0
80105fa2:	6a 00                	push   $0x0
  pushl $67
80105fa4:	6a 43                	push   $0x43
  jmp alltraps
80105fa6:	e9 d3 f8 ff ff       	jmp    8010587e <alltraps>

80105fab <vector68>:
.globl vector68
vector68:
  pushl $0
80105fab:	6a 00                	push   $0x0
  pushl $68
80105fad:	6a 44                	push   $0x44
  jmp alltraps
80105faf:	e9 ca f8 ff ff       	jmp    8010587e <alltraps>

80105fb4 <vector69>:
.globl vector69
vector69:
  pushl $0
80105fb4:	6a 00                	push   $0x0
  pushl $69
80105fb6:	6a 45                	push   $0x45
  jmp alltraps
80105fb8:	e9 c1 f8 ff ff       	jmp    8010587e <alltraps>

80105fbd <vector70>:
.globl vector70
vector70:
  pushl $0
80105fbd:	6a 00                	push   $0x0
  pushl $70
80105fbf:	6a 46                	push   $0x46
  jmp alltraps
80105fc1:	e9 b8 f8 ff ff       	jmp    8010587e <alltraps>

80105fc6 <vector71>:
.globl vector71
vector71:
  pushl $0
80105fc6:	6a 00                	push   $0x0
  pushl $71
80105fc8:	6a 47                	push   $0x47
  jmp alltraps
80105fca:	e9 af f8 ff ff       	jmp    8010587e <alltraps>

80105fcf <vector72>:
.globl vector72
vector72:
  pushl $0
80105fcf:	6a 00                	push   $0x0
  pushl $72
80105fd1:	6a 48                	push   $0x48
  jmp alltraps
80105fd3:	e9 a6 f8 ff ff       	jmp    8010587e <alltraps>

80105fd8 <vector73>:
.globl vector73
vector73:
  pushl $0
80105fd8:	6a 00                	push   $0x0
  pushl $73
80105fda:	6a 49                	push   $0x49
  jmp alltraps
80105fdc:	e9 9d f8 ff ff       	jmp    8010587e <alltraps>

80105fe1 <vector74>:
.globl vector74
vector74:
  pushl $0
80105fe1:	6a 00                	push   $0x0
  pushl $74
80105fe3:	6a 4a                	push   $0x4a
  jmp alltraps
80105fe5:	e9 94 f8 ff ff       	jmp    8010587e <alltraps>

80105fea <vector75>:
.globl vector75
vector75:
  pushl $0
80105fea:	6a 00                	push   $0x0
  pushl $75
80105fec:	6a 4b                	push   $0x4b
  jmp alltraps
80105fee:	e9 8b f8 ff ff       	jmp    8010587e <alltraps>

80105ff3 <vector76>:
.globl vector76
vector76:
  pushl $0
80105ff3:	6a 00                	push   $0x0
  pushl $76
80105ff5:	6a 4c                	push   $0x4c
  jmp alltraps
80105ff7:	e9 82 f8 ff ff       	jmp    8010587e <alltraps>

80105ffc <vector77>:
.globl vector77
vector77:
  pushl $0
80105ffc:	6a 00                	push   $0x0
  pushl $77
80105ffe:	6a 4d                	push   $0x4d
  jmp alltraps
80106000:	e9 79 f8 ff ff       	jmp    8010587e <alltraps>

80106005 <vector78>:
.globl vector78
vector78:
  pushl $0
80106005:	6a 00                	push   $0x0
  pushl $78
80106007:	6a 4e                	push   $0x4e
  jmp alltraps
80106009:	e9 70 f8 ff ff       	jmp    8010587e <alltraps>

8010600e <vector79>:
.globl vector79
vector79:
  pushl $0
8010600e:	6a 00                	push   $0x0
  pushl $79
80106010:	6a 4f                	push   $0x4f
  jmp alltraps
80106012:	e9 67 f8 ff ff       	jmp    8010587e <alltraps>

80106017 <vector80>:
.globl vector80
vector80:
  pushl $0
80106017:	6a 00                	push   $0x0
  pushl $80
80106019:	6a 50                	push   $0x50
  jmp alltraps
8010601b:	e9 5e f8 ff ff       	jmp    8010587e <alltraps>

80106020 <vector81>:
.globl vector81
vector81:
  pushl $0
80106020:	6a 00                	push   $0x0
  pushl $81
80106022:	6a 51                	push   $0x51
  jmp alltraps
80106024:	e9 55 f8 ff ff       	jmp    8010587e <alltraps>

80106029 <vector82>:
.globl vector82
vector82:
  pushl $0
80106029:	6a 00                	push   $0x0
  pushl $82
8010602b:	6a 52                	push   $0x52
  jmp alltraps
8010602d:	e9 4c f8 ff ff       	jmp    8010587e <alltraps>

80106032 <vector83>:
.globl vector83
vector83:
  pushl $0
80106032:	6a 00                	push   $0x0
  pushl $83
80106034:	6a 53                	push   $0x53
  jmp alltraps
80106036:	e9 43 f8 ff ff       	jmp    8010587e <alltraps>

8010603b <vector84>:
.globl vector84
vector84:
  pushl $0
8010603b:	6a 00                	push   $0x0
  pushl $84
8010603d:	6a 54                	push   $0x54
  jmp alltraps
8010603f:	e9 3a f8 ff ff       	jmp    8010587e <alltraps>

80106044 <vector85>:
.globl vector85
vector85:
  pushl $0
80106044:	6a 00                	push   $0x0
  pushl $85
80106046:	6a 55                	push   $0x55
  jmp alltraps
80106048:	e9 31 f8 ff ff       	jmp    8010587e <alltraps>

8010604d <vector86>:
.globl vector86
vector86:
  pushl $0
8010604d:	6a 00                	push   $0x0
  pushl $86
8010604f:	6a 56                	push   $0x56
  jmp alltraps
80106051:	e9 28 f8 ff ff       	jmp    8010587e <alltraps>

80106056 <vector87>:
.globl vector87
vector87:
  pushl $0
80106056:	6a 00                	push   $0x0
  pushl $87
80106058:	6a 57                	push   $0x57
  jmp alltraps
8010605a:	e9 1f f8 ff ff       	jmp    8010587e <alltraps>

8010605f <vector88>:
.globl vector88
vector88:
  pushl $0
8010605f:	6a 00                	push   $0x0
  pushl $88
80106061:	6a 58                	push   $0x58
  jmp alltraps
80106063:	e9 16 f8 ff ff       	jmp    8010587e <alltraps>

80106068 <vector89>:
.globl vector89
vector89:
  pushl $0
80106068:	6a 00                	push   $0x0
  pushl $89
8010606a:	6a 59                	push   $0x59
  jmp alltraps
8010606c:	e9 0d f8 ff ff       	jmp    8010587e <alltraps>

80106071 <vector90>:
.globl vector90
vector90:
  pushl $0
80106071:	6a 00                	push   $0x0
  pushl $90
80106073:	6a 5a                	push   $0x5a
  jmp alltraps
80106075:	e9 04 f8 ff ff       	jmp    8010587e <alltraps>

8010607a <vector91>:
.globl vector91
vector91:
  pushl $0
8010607a:	6a 00                	push   $0x0
  pushl $91
8010607c:	6a 5b                	push   $0x5b
  jmp alltraps
8010607e:	e9 fb f7 ff ff       	jmp    8010587e <alltraps>

80106083 <vector92>:
.globl vector92
vector92:
  pushl $0
80106083:	6a 00                	push   $0x0
  pushl $92
80106085:	6a 5c                	push   $0x5c
  jmp alltraps
80106087:	e9 f2 f7 ff ff       	jmp    8010587e <alltraps>

8010608c <vector93>:
.globl vector93
vector93:
  pushl $0
8010608c:	6a 00                	push   $0x0
  pushl $93
8010608e:	6a 5d                	push   $0x5d
  jmp alltraps
80106090:	e9 e9 f7 ff ff       	jmp    8010587e <alltraps>

80106095 <vector94>:
.globl vector94
vector94:
  pushl $0
80106095:	6a 00                	push   $0x0
  pushl $94
80106097:	6a 5e                	push   $0x5e
  jmp alltraps
80106099:	e9 e0 f7 ff ff       	jmp    8010587e <alltraps>

8010609e <vector95>:
.globl vector95
vector95:
  pushl $0
8010609e:	6a 00                	push   $0x0
  pushl $95
801060a0:	6a 5f                	push   $0x5f
  jmp alltraps
801060a2:	e9 d7 f7 ff ff       	jmp    8010587e <alltraps>

801060a7 <vector96>:
.globl vector96
vector96:
  pushl $0
801060a7:	6a 00                	push   $0x0
  pushl $96
801060a9:	6a 60                	push   $0x60
  jmp alltraps
801060ab:	e9 ce f7 ff ff       	jmp    8010587e <alltraps>

801060b0 <vector97>:
.globl vector97
vector97:
  pushl $0
801060b0:	6a 00                	push   $0x0
  pushl $97
801060b2:	6a 61                	push   $0x61
  jmp alltraps
801060b4:	e9 c5 f7 ff ff       	jmp    8010587e <alltraps>

801060b9 <vector98>:
.globl vector98
vector98:
  pushl $0
801060b9:	6a 00                	push   $0x0
  pushl $98
801060bb:	6a 62                	push   $0x62
  jmp alltraps
801060bd:	e9 bc f7 ff ff       	jmp    8010587e <alltraps>

801060c2 <vector99>:
.globl vector99
vector99:
  pushl $0
801060c2:	6a 00                	push   $0x0
  pushl $99
801060c4:	6a 63                	push   $0x63
  jmp alltraps
801060c6:	e9 b3 f7 ff ff       	jmp    8010587e <alltraps>

801060cb <vector100>:
.globl vector100
vector100:
  pushl $0
801060cb:	6a 00                	push   $0x0
  pushl $100
801060cd:	6a 64                	push   $0x64
  jmp alltraps
801060cf:	e9 aa f7 ff ff       	jmp    8010587e <alltraps>

801060d4 <vector101>:
.globl vector101
vector101:
  pushl $0
801060d4:	6a 00                	push   $0x0
  pushl $101
801060d6:	6a 65                	push   $0x65
  jmp alltraps
801060d8:	e9 a1 f7 ff ff       	jmp    8010587e <alltraps>

801060dd <vector102>:
.globl vector102
vector102:
  pushl $0
801060dd:	6a 00                	push   $0x0
  pushl $102
801060df:	6a 66                	push   $0x66
  jmp alltraps
801060e1:	e9 98 f7 ff ff       	jmp    8010587e <alltraps>

801060e6 <vector103>:
.globl vector103
vector103:
  pushl $0
801060e6:	6a 00                	push   $0x0
  pushl $103
801060e8:	6a 67                	push   $0x67
  jmp alltraps
801060ea:	e9 8f f7 ff ff       	jmp    8010587e <alltraps>

801060ef <vector104>:
.globl vector104
vector104:
  pushl $0
801060ef:	6a 00                	push   $0x0
  pushl $104
801060f1:	6a 68                	push   $0x68
  jmp alltraps
801060f3:	e9 86 f7 ff ff       	jmp    8010587e <alltraps>

801060f8 <vector105>:
.globl vector105
vector105:
  pushl $0
801060f8:	6a 00                	push   $0x0
  pushl $105
801060fa:	6a 69                	push   $0x69
  jmp alltraps
801060fc:	e9 7d f7 ff ff       	jmp    8010587e <alltraps>

80106101 <vector106>:
.globl vector106
vector106:
  pushl $0
80106101:	6a 00                	push   $0x0
  pushl $106
80106103:	6a 6a                	push   $0x6a
  jmp alltraps
80106105:	e9 74 f7 ff ff       	jmp    8010587e <alltraps>

8010610a <vector107>:
.globl vector107
vector107:
  pushl $0
8010610a:	6a 00                	push   $0x0
  pushl $107
8010610c:	6a 6b                	push   $0x6b
  jmp alltraps
8010610e:	e9 6b f7 ff ff       	jmp    8010587e <alltraps>

80106113 <vector108>:
.globl vector108
vector108:
  pushl $0
80106113:	6a 00                	push   $0x0
  pushl $108
80106115:	6a 6c                	push   $0x6c
  jmp alltraps
80106117:	e9 62 f7 ff ff       	jmp    8010587e <alltraps>

8010611c <vector109>:
.globl vector109
vector109:
  pushl $0
8010611c:	6a 00                	push   $0x0
  pushl $109
8010611e:	6a 6d                	push   $0x6d
  jmp alltraps
80106120:	e9 59 f7 ff ff       	jmp    8010587e <alltraps>

80106125 <vector110>:
.globl vector110
vector110:
  pushl $0
80106125:	6a 00                	push   $0x0
  pushl $110
80106127:	6a 6e                	push   $0x6e
  jmp alltraps
80106129:	e9 50 f7 ff ff       	jmp    8010587e <alltraps>

8010612e <vector111>:
.globl vector111
vector111:
  pushl $0
8010612e:	6a 00                	push   $0x0
  pushl $111
80106130:	6a 6f                	push   $0x6f
  jmp alltraps
80106132:	e9 47 f7 ff ff       	jmp    8010587e <alltraps>

80106137 <vector112>:
.globl vector112
vector112:
  pushl $0
80106137:	6a 00                	push   $0x0
  pushl $112
80106139:	6a 70                	push   $0x70
  jmp alltraps
8010613b:	e9 3e f7 ff ff       	jmp    8010587e <alltraps>

80106140 <vector113>:
.globl vector113
vector113:
  pushl $0
80106140:	6a 00                	push   $0x0
  pushl $113
80106142:	6a 71                	push   $0x71
  jmp alltraps
80106144:	e9 35 f7 ff ff       	jmp    8010587e <alltraps>

80106149 <vector114>:
.globl vector114
vector114:
  pushl $0
80106149:	6a 00                	push   $0x0
  pushl $114
8010614b:	6a 72                	push   $0x72
  jmp alltraps
8010614d:	e9 2c f7 ff ff       	jmp    8010587e <alltraps>

80106152 <vector115>:
.globl vector115
vector115:
  pushl $0
80106152:	6a 00                	push   $0x0
  pushl $115
80106154:	6a 73                	push   $0x73
  jmp alltraps
80106156:	e9 23 f7 ff ff       	jmp    8010587e <alltraps>

8010615b <vector116>:
.globl vector116
vector116:
  pushl $0
8010615b:	6a 00                	push   $0x0
  pushl $116
8010615d:	6a 74                	push   $0x74
  jmp alltraps
8010615f:	e9 1a f7 ff ff       	jmp    8010587e <alltraps>

80106164 <vector117>:
.globl vector117
vector117:
  pushl $0
80106164:	6a 00                	push   $0x0
  pushl $117
80106166:	6a 75                	push   $0x75
  jmp alltraps
80106168:	e9 11 f7 ff ff       	jmp    8010587e <alltraps>

8010616d <vector118>:
.globl vector118
vector118:
  pushl $0
8010616d:	6a 00                	push   $0x0
  pushl $118
8010616f:	6a 76                	push   $0x76
  jmp alltraps
80106171:	e9 08 f7 ff ff       	jmp    8010587e <alltraps>

80106176 <vector119>:
.globl vector119
vector119:
  pushl $0
80106176:	6a 00                	push   $0x0
  pushl $119
80106178:	6a 77                	push   $0x77
  jmp alltraps
8010617a:	e9 ff f6 ff ff       	jmp    8010587e <alltraps>

8010617f <vector120>:
.globl vector120
vector120:
  pushl $0
8010617f:	6a 00                	push   $0x0
  pushl $120
80106181:	6a 78                	push   $0x78
  jmp alltraps
80106183:	e9 f6 f6 ff ff       	jmp    8010587e <alltraps>

80106188 <vector121>:
.globl vector121
vector121:
  pushl $0
80106188:	6a 00                	push   $0x0
  pushl $121
8010618a:	6a 79                	push   $0x79
  jmp alltraps
8010618c:	e9 ed f6 ff ff       	jmp    8010587e <alltraps>

80106191 <vector122>:
.globl vector122
vector122:
  pushl $0
80106191:	6a 00                	push   $0x0
  pushl $122
80106193:	6a 7a                	push   $0x7a
  jmp alltraps
80106195:	e9 e4 f6 ff ff       	jmp    8010587e <alltraps>

8010619a <vector123>:
.globl vector123
vector123:
  pushl $0
8010619a:	6a 00                	push   $0x0
  pushl $123
8010619c:	6a 7b                	push   $0x7b
  jmp alltraps
8010619e:	e9 db f6 ff ff       	jmp    8010587e <alltraps>

801061a3 <vector124>:
.globl vector124
vector124:
  pushl $0
801061a3:	6a 00                	push   $0x0
  pushl $124
801061a5:	6a 7c                	push   $0x7c
  jmp alltraps
801061a7:	e9 d2 f6 ff ff       	jmp    8010587e <alltraps>

801061ac <vector125>:
.globl vector125
vector125:
  pushl $0
801061ac:	6a 00                	push   $0x0
  pushl $125
801061ae:	6a 7d                	push   $0x7d
  jmp alltraps
801061b0:	e9 c9 f6 ff ff       	jmp    8010587e <alltraps>

801061b5 <vector126>:
.globl vector126
vector126:
  pushl $0
801061b5:	6a 00                	push   $0x0
  pushl $126
801061b7:	6a 7e                	push   $0x7e
  jmp alltraps
801061b9:	e9 c0 f6 ff ff       	jmp    8010587e <alltraps>

801061be <vector127>:
.globl vector127
vector127:
  pushl $0
801061be:	6a 00                	push   $0x0
  pushl $127
801061c0:	6a 7f                	push   $0x7f
  jmp alltraps
801061c2:	e9 b7 f6 ff ff       	jmp    8010587e <alltraps>

801061c7 <vector128>:
.globl vector128
vector128:
  pushl $0
801061c7:	6a 00                	push   $0x0
  pushl $128
801061c9:	68 80 00 00 00       	push   $0x80
  jmp alltraps
801061ce:	e9 ab f6 ff ff       	jmp    8010587e <alltraps>

801061d3 <vector129>:
.globl vector129
vector129:
  pushl $0
801061d3:	6a 00                	push   $0x0
  pushl $129
801061d5:	68 81 00 00 00       	push   $0x81
  jmp alltraps
801061da:	e9 9f f6 ff ff       	jmp    8010587e <alltraps>

801061df <vector130>:
.globl vector130
vector130:
  pushl $0
801061df:	6a 00                	push   $0x0
  pushl $130
801061e1:	68 82 00 00 00       	push   $0x82
  jmp alltraps
801061e6:	e9 93 f6 ff ff       	jmp    8010587e <alltraps>

801061eb <vector131>:
.globl vector131
vector131:
  pushl $0
801061eb:	6a 00                	push   $0x0
  pushl $131
801061ed:	68 83 00 00 00       	push   $0x83
  jmp alltraps
801061f2:	e9 87 f6 ff ff       	jmp    8010587e <alltraps>

801061f7 <vector132>:
.globl vector132
vector132:
  pushl $0
801061f7:	6a 00                	push   $0x0
  pushl $132
801061f9:	68 84 00 00 00       	push   $0x84
  jmp alltraps
801061fe:	e9 7b f6 ff ff       	jmp    8010587e <alltraps>

80106203 <vector133>:
.globl vector133
vector133:
  pushl $0
80106203:	6a 00                	push   $0x0
  pushl $133
80106205:	68 85 00 00 00       	push   $0x85
  jmp alltraps
8010620a:	e9 6f f6 ff ff       	jmp    8010587e <alltraps>

8010620f <vector134>:
.globl vector134
vector134:
  pushl $0
8010620f:	6a 00                	push   $0x0
  pushl $134
80106211:	68 86 00 00 00       	push   $0x86
  jmp alltraps
80106216:	e9 63 f6 ff ff       	jmp    8010587e <alltraps>

8010621b <vector135>:
.globl vector135
vector135:
  pushl $0
8010621b:	6a 00                	push   $0x0
  pushl $135
8010621d:	68 87 00 00 00       	push   $0x87
  jmp alltraps
80106222:	e9 57 f6 ff ff       	jmp    8010587e <alltraps>

80106227 <vector136>:
.globl vector136
vector136:
  pushl $0
80106227:	6a 00                	push   $0x0
  pushl $136
80106229:	68 88 00 00 00       	push   $0x88
  jmp alltraps
8010622e:	e9 4b f6 ff ff       	jmp    8010587e <alltraps>

80106233 <vector137>:
.globl vector137
vector137:
  pushl $0
80106233:	6a 00                	push   $0x0
  pushl $137
80106235:	68 89 00 00 00       	push   $0x89
  jmp alltraps
8010623a:	e9 3f f6 ff ff       	jmp    8010587e <alltraps>

8010623f <vector138>:
.globl vector138
vector138:
  pushl $0
8010623f:	6a 00                	push   $0x0
  pushl $138
80106241:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
80106246:	e9 33 f6 ff ff       	jmp    8010587e <alltraps>

8010624b <vector139>:
.globl vector139
vector139:
  pushl $0
8010624b:	6a 00                	push   $0x0
  pushl $139
8010624d:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
80106252:	e9 27 f6 ff ff       	jmp    8010587e <alltraps>

80106257 <vector140>:
.globl vector140
vector140:
  pushl $0
80106257:	6a 00                	push   $0x0
  pushl $140
80106259:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
8010625e:	e9 1b f6 ff ff       	jmp    8010587e <alltraps>

80106263 <vector141>:
.globl vector141
vector141:
  pushl $0
80106263:	6a 00                	push   $0x0
  pushl $141
80106265:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
8010626a:	e9 0f f6 ff ff       	jmp    8010587e <alltraps>

8010626f <vector142>:
.globl vector142
vector142:
  pushl $0
8010626f:	6a 00                	push   $0x0
  pushl $142
80106271:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
80106276:	e9 03 f6 ff ff       	jmp    8010587e <alltraps>

8010627b <vector143>:
.globl vector143
vector143:
  pushl $0
8010627b:	6a 00                	push   $0x0
  pushl $143
8010627d:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
80106282:	e9 f7 f5 ff ff       	jmp    8010587e <alltraps>

80106287 <vector144>:
.globl vector144
vector144:
  pushl $0
80106287:	6a 00                	push   $0x0
  pushl $144
80106289:	68 90 00 00 00       	push   $0x90
  jmp alltraps
8010628e:	e9 eb f5 ff ff       	jmp    8010587e <alltraps>

80106293 <vector145>:
.globl vector145
vector145:
  pushl $0
80106293:	6a 00                	push   $0x0
  pushl $145
80106295:	68 91 00 00 00       	push   $0x91
  jmp alltraps
8010629a:	e9 df f5 ff ff       	jmp    8010587e <alltraps>

8010629f <vector146>:
.globl vector146
vector146:
  pushl $0
8010629f:	6a 00                	push   $0x0
  pushl $146
801062a1:	68 92 00 00 00       	push   $0x92
  jmp alltraps
801062a6:	e9 d3 f5 ff ff       	jmp    8010587e <alltraps>

801062ab <vector147>:
.globl vector147
vector147:
  pushl $0
801062ab:	6a 00                	push   $0x0
  pushl $147
801062ad:	68 93 00 00 00       	push   $0x93
  jmp alltraps
801062b2:	e9 c7 f5 ff ff       	jmp    8010587e <alltraps>

801062b7 <vector148>:
.globl vector148
vector148:
  pushl $0
801062b7:	6a 00                	push   $0x0
  pushl $148
801062b9:	68 94 00 00 00       	push   $0x94
  jmp alltraps
801062be:	e9 bb f5 ff ff       	jmp    8010587e <alltraps>

801062c3 <vector149>:
.globl vector149
vector149:
  pushl $0
801062c3:	6a 00                	push   $0x0
  pushl $149
801062c5:	68 95 00 00 00       	push   $0x95
  jmp alltraps
801062ca:	e9 af f5 ff ff       	jmp    8010587e <alltraps>

801062cf <vector150>:
.globl vector150
vector150:
  pushl $0
801062cf:	6a 00                	push   $0x0
  pushl $150
801062d1:	68 96 00 00 00       	push   $0x96
  jmp alltraps
801062d6:	e9 a3 f5 ff ff       	jmp    8010587e <alltraps>

801062db <vector151>:
.globl vector151
vector151:
  pushl $0
801062db:	6a 00                	push   $0x0
  pushl $151
801062dd:	68 97 00 00 00       	push   $0x97
  jmp alltraps
801062e2:	e9 97 f5 ff ff       	jmp    8010587e <alltraps>

801062e7 <vector152>:
.globl vector152
vector152:
  pushl $0
801062e7:	6a 00                	push   $0x0
  pushl $152
801062e9:	68 98 00 00 00       	push   $0x98
  jmp alltraps
801062ee:	e9 8b f5 ff ff       	jmp    8010587e <alltraps>

801062f3 <vector153>:
.globl vector153
vector153:
  pushl $0
801062f3:	6a 00                	push   $0x0
  pushl $153
801062f5:	68 99 00 00 00       	push   $0x99
  jmp alltraps
801062fa:	e9 7f f5 ff ff       	jmp    8010587e <alltraps>

801062ff <vector154>:
.globl vector154
vector154:
  pushl $0
801062ff:	6a 00                	push   $0x0
  pushl $154
80106301:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
80106306:	e9 73 f5 ff ff       	jmp    8010587e <alltraps>

8010630b <vector155>:
.globl vector155
vector155:
  pushl $0
8010630b:	6a 00                	push   $0x0
  pushl $155
8010630d:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
80106312:	e9 67 f5 ff ff       	jmp    8010587e <alltraps>

80106317 <vector156>:
.globl vector156
vector156:
  pushl $0
80106317:	6a 00                	push   $0x0
  pushl $156
80106319:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
8010631e:	e9 5b f5 ff ff       	jmp    8010587e <alltraps>

80106323 <vector157>:
.globl vector157
vector157:
  pushl $0
80106323:	6a 00                	push   $0x0
  pushl $157
80106325:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
8010632a:	e9 4f f5 ff ff       	jmp    8010587e <alltraps>

8010632f <vector158>:
.globl vector158
vector158:
  pushl $0
8010632f:	6a 00                	push   $0x0
  pushl $158
80106331:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
80106336:	e9 43 f5 ff ff       	jmp    8010587e <alltraps>

8010633b <vector159>:
.globl vector159
vector159:
  pushl $0
8010633b:	6a 00                	push   $0x0
  pushl $159
8010633d:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
80106342:	e9 37 f5 ff ff       	jmp    8010587e <alltraps>

80106347 <vector160>:
.globl vector160
vector160:
  pushl $0
80106347:	6a 00                	push   $0x0
  pushl $160
80106349:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
8010634e:	e9 2b f5 ff ff       	jmp    8010587e <alltraps>

80106353 <vector161>:
.globl vector161
vector161:
  pushl $0
80106353:	6a 00                	push   $0x0
  pushl $161
80106355:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
8010635a:	e9 1f f5 ff ff       	jmp    8010587e <alltraps>

8010635f <vector162>:
.globl vector162
vector162:
  pushl $0
8010635f:	6a 00                	push   $0x0
  pushl $162
80106361:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
80106366:	e9 13 f5 ff ff       	jmp    8010587e <alltraps>

8010636b <vector163>:
.globl vector163
vector163:
  pushl $0
8010636b:	6a 00                	push   $0x0
  pushl $163
8010636d:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
80106372:	e9 07 f5 ff ff       	jmp    8010587e <alltraps>

80106377 <vector164>:
.globl vector164
vector164:
  pushl $0
80106377:	6a 00                	push   $0x0
  pushl $164
80106379:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
8010637e:	e9 fb f4 ff ff       	jmp    8010587e <alltraps>

80106383 <vector165>:
.globl vector165
vector165:
  pushl $0
80106383:	6a 00                	push   $0x0
  pushl $165
80106385:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
8010638a:	e9 ef f4 ff ff       	jmp    8010587e <alltraps>

8010638f <vector166>:
.globl vector166
vector166:
  pushl $0
8010638f:	6a 00                	push   $0x0
  pushl $166
80106391:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
80106396:	e9 e3 f4 ff ff       	jmp    8010587e <alltraps>

8010639b <vector167>:
.globl vector167
vector167:
  pushl $0
8010639b:	6a 00                	push   $0x0
  pushl $167
8010639d:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
801063a2:	e9 d7 f4 ff ff       	jmp    8010587e <alltraps>

801063a7 <vector168>:
.globl vector168
vector168:
  pushl $0
801063a7:	6a 00                	push   $0x0
  pushl $168
801063a9:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
801063ae:	e9 cb f4 ff ff       	jmp    8010587e <alltraps>

801063b3 <vector169>:
.globl vector169
vector169:
  pushl $0
801063b3:	6a 00                	push   $0x0
  pushl $169
801063b5:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
801063ba:	e9 bf f4 ff ff       	jmp    8010587e <alltraps>

801063bf <vector170>:
.globl vector170
vector170:
  pushl $0
801063bf:	6a 00                	push   $0x0
  pushl $170
801063c1:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
801063c6:	e9 b3 f4 ff ff       	jmp    8010587e <alltraps>

801063cb <vector171>:
.globl vector171
vector171:
  pushl $0
801063cb:	6a 00                	push   $0x0
  pushl $171
801063cd:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
801063d2:	e9 a7 f4 ff ff       	jmp    8010587e <alltraps>

801063d7 <vector172>:
.globl vector172
vector172:
  pushl $0
801063d7:	6a 00                	push   $0x0
  pushl $172
801063d9:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
801063de:	e9 9b f4 ff ff       	jmp    8010587e <alltraps>

801063e3 <vector173>:
.globl vector173
vector173:
  pushl $0
801063e3:	6a 00                	push   $0x0
  pushl $173
801063e5:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
801063ea:	e9 8f f4 ff ff       	jmp    8010587e <alltraps>

801063ef <vector174>:
.globl vector174
vector174:
  pushl $0
801063ef:	6a 00                	push   $0x0
  pushl $174
801063f1:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
801063f6:	e9 83 f4 ff ff       	jmp    8010587e <alltraps>

801063fb <vector175>:
.globl vector175
vector175:
  pushl $0
801063fb:	6a 00                	push   $0x0
  pushl $175
801063fd:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
80106402:	e9 77 f4 ff ff       	jmp    8010587e <alltraps>

80106407 <vector176>:
.globl vector176
vector176:
  pushl $0
80106407:	6a 00                	push   $0x0
  pushl $176
80106409:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
8010640e:	e9 6b f4 ff ff       	jmp    8010587e <alltraps>

80106413 <vector177>:
.globl vector177
vector177:
  pushl $0
80106413:	6a 00                	push   $0x0
  pushl $177
80106415:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
8010641a:	e9 5f f4 ff ff       	jmp    8010587e <alltraps>

8010641f <vector178>:
.globl vector178
vector178:
  pushl $0
8010641f:	6a 00                	push   $0x0
  pushl $178
80106421:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
80106426:	e9 53 f4 ff ff       	jmp    8010587e <alltraps>

8010642b <vector179>:
.globl vector179
vector179:
  pushl $0
8010642b:	6a 00                	push   $0x0
  pushl $179
8010642d:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
80106432:	e9 47 f4 ff ff       	jmp    8010587e <alltraps>

80106437 <vector180>:
.globl vector180
vector180:
  pushl $0
80106437:	6a 00                	push   $0x0
  pushl $180
80106439:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
8010643e:	e9 3b f4 ff ff       	jmp    8010587e <alltraps>

80106443 <vector181>:
.globl vector181
vector181:
  pushl $0
80106443:	6a 00                	push   $0x0
  pushl $181
80106445:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
8010644a:	e9 2f f4 ff ff       	jmp    8010587e <alltraps>

8010644f <vector182>:
.globl vector182
vector182:
  pushl $0
8010644f:	6a 00                	push   $0x0
  pushl $182
80106451:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
80106456:	e9 23 f4 ff ff       	jmp    8010587e <alltraps>

8010645b <vector183>:
.globl vector183
vector183:
  pushl $0
8010645b:	6a 00                	push   $0x0
  pushl $183
8010645d:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
80106462:	e9 17 f4 ff ff       	jmp    8010587e <alltraps>

80106467 <vector184>:
.globl vector184
vector184:
  pushl $0
80106467:	6a 00                	push   $0x0
  pushl $184
80106469:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
8010646e:	e9 0b f4 ff ff       	jmp    8010587e <alltraps>

80106473 <vector185>:
.globl vector185
vector185:
  pushl $0
80106473:	6a 00                	push   $0x0
  pushl $185
80106475:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
8010647a:	e9 ff f3 ff ff       	jmp    8010587e <alltraps>

8010647f <vector186>:
.globl vector186
vector186:
  pushl $0
8010647f:	6a 00                	push   $0x0
  pushl $186
80106481:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
80106486:	e9 f3 f3 ff ff       	jmp    8010587e <alltraps>

8010648b <vector187>:
.globl vector187
vector187:
  pushl $0
8010648b:	6a 00                	push   $0x0
  pushl $187
8010648d:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
80106492:	e9 e7 f3 ff ff       	jmp    8010587e <alltraps>

80106497 <vector188>:
.globl vector188
vector188:
  pushl $0
80106497:	6a 00                	push   $0x0
  pushl $188
80106499:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
8010649e:	e9 db f3 ff ff       	jmp    8010587e <alltraps>

801064a3 <vector189>:
.globl vector189
vector189:
  pushl $0
801064a3:	6a 00                	push   $0x0
  pushl $189
801064a5:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
801064aa:	e9 cf f3 ff ff       	jmp    8010587e <alltraps>

801064af <vector190>:
.globl vector190
vector190:
  pushl $0
801064af:	6a 00                	push   $0x0
  pushl $190
801064b1:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
801064b6:	e9 c3 f3 ff ff       	jmp    8010587e <alltraps>

801064bb <vector191>:
.globl vector191
vector191:
  pushl $0
801064bb:	6a 00                	push   $0x0
  pushl $191
801064bd:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
801064c2:	e9 b7 f3 ff ff       	jmp    8010587e <alltraps>

801064c7 <vector192>:
.globl vector192
vector192:
  pushl $0
801064c7:	6a 00                	push   $0x0
  pushl $192
801064c9:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
801064ce:	e9 ab f3 ff ff       	jmp    8010587e <alltraps>

801064d3 <vector193>:
.globl vector193
vector193:
  pushl $0
801064d3:	6a 00                	push   $0x0
  pushl $193
801064d5:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
801064da:	e9 9f f3 ff ff       	jmp    8010587e <alltraps>

801064df <vector194>:
.globl vector194
vector194:
  pushl $0
801064df:	6a 00                	push   $0x0
  pushl $194
801064e1:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
801064e6:	e9 93 f3 ff ff       	jmp    8010587e <alltraps>

801064eb <vector195>:
.globl vector195
vector195:
  pushl $0
801064eb:	6a 00                	push   $0x0
  pushl $195
801064ed:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
801064f2:	e9 87 f3 ff ff       	jmp    8010587e <alltraps>

801064f7 <vector196>:
.globl vector196
vector196:
  pushl $0
801064f7:	6a 00                	push   $0x0
  pushl $196
801064f9:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
801064fe:	e9 7b f3 ff ff       	jmp    8010587e <alltraps>

80106503 <vector197>:
.globl vector197
vector197:
  pushl $0
80106503:	6a 00                	push   $0x0
  pushl $197
80106505:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
8010650a:	e9 6f f3 ff ff       	jmp    8010587e <alltraps>

8010650f <vector198>:
.globl vector198
vector198:
  pushl $0
8010650f:	6a 00                	push   $0x0
  pushl $198
80106511:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
80106516:	e9 63 f3 ff ff       	jmp    8010587e <alltraps>

8010651b <vector199>:
.globl vector199
vector199:
  pushl $0
8010651b:	6a 00                	push   $0x0
  pushl $199
8010651d:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
80106522:	e9 57 f3 ff ff       	jmp    8010587e <alltraps>

80106527 <vector200>:
.globl vector200
vector200:
  pushl $0
80106527:	6a 00                	push   $0x0
  pushl $200
80106529:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
8010652e:	e9 4b f3 ff ff       	jmp    8010587e <alltraps>

80106533 <vector201>:
.globl vector201
vector201:
  pushl $0
80106533:	6a 00                	push   $0x0
  pushl $201
80106535:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
8010653a:	e9 3f f3 ff ff       	jmp    8010587e <alltraps>

8010653f <vector202>:
.globl vector202
vector202:
  pushl $0
8010653f:	6a 00                	push   $0x0
  pushl $202
80106541:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
80106546:	e9 33 f3 ff ff       	jmp    8010587e <alltraps>

8010654b <vector203>:
.globl vector203
vector203:
  pushl $0
8010654b:	6a 00                	push   $0x0
  pushl $203
8010654d:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
80106552:	e9 27 f3 ff ff       	jmp    8010587e <alltraps>

80106557 <vector204>:
.globl vector204
vector204:
  pushl $0
80106557:	6a 00                	push   $0x0
  pushl $204
80106559:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
8010655e:	e9 1b f3 ff ff       	jmp    8010587e <alltraps>

80106563 <vector205>:
.globl vector205
vector205:
  pushl $0
80106563:	6a 00                	push   $0x0
  pushl $205
80106565:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
8010656a:	e9 0f f3 ff ff       	jmp    8010587e <alltraps>

8010656f <vector206>:
.globl vector206
vector206:
  pushl $0
8010656f:	6a 00                	push   $0x0
  pushl $206
80106571:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
80106576:	e9 03 f3 ff ff       	jmp    8010587e <alltraps>

8010657b <vector207>:
.globl vector207
vector207:
  pushl $0
8010657b:	6a 00                	push   $0x0
  pushl $207
8010657d:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
80106582:	e9 f7 f2 ff ff       	jmp    8010587e <alltraps>

80106587 <vector208>:
.globl vector208
vector208:
  pushl $0
80106587:	6a 00                	push   $0x0
  pushl $208
80106589:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
8010658e:	e9 eb f2 ff ff       	jmp    8010587e <alltraps>

80106593 <vector209>:
.globl vector209
vector209:
  pushl $0
80106593:	6a 00                	push   $0x0
  pushl $209
80106595:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
8010659a:	e9 df f2 ff ff       	jmp    8010587e <alltraps>

8010659f <vector210>:
.globl vector210
vector210:
  pushl $0
8010659f:	6a 00                	push   $0x0
  pushl $210
801065a1:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
801065a6:	e9 d3 f2 ff ff       	jmp    8010587e <alltraps>

801065ab <vector211>:
.globl vector211
vector211:
  pushl $0
801065ab:	6a 00                	push   $0x0
  pushl $211
801065ad:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
801065b2:	e9 c7 f2 ff ff       	jmp    8010587e <alltraps>

801065b7 <vector212>:
.globl vector212
vector212:
  pushl $0
801065b7:	6a 00                	push   $0x0
  pushl $212
801065b9:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
801065be:	e9 bb f2 ff ff       	jmp    8010587e <alltraps>

801065c3 <vector213>:
.globl vector213
vector213:
  pushl $0
801065c3:	6a 00                	push   $0x0
  pushl $213
801065c5:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
801065ca:	e9 af f2 ff ff       	jmp    8010587e <alltraps>

801065cf <vector214>:
.globl vector214
vector214:
  pushl $0
801065cf:	6a 00                	push   $0x0
  pushl $214
801065d1:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
801065d6:	e9 a3 f2 ff ff       	jmp    8010587e <alltraps>

801065db <vector215>:
.globl vector215
vector215:
  pushl $0
801065db:	6a 00                	push   $0x0
  pushl $215
801065dd:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
801065e2:	e9 97 f2 ff ff       	jmp    8010587e <alltraps>

801065e7 <vector216>:
.globl vector216
vector216:
  pushl $0
801065e7:	6a 00                	push   $0x0
  pushl $216
801065e9:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
801065ee:	e9 8b f2 ff ff       	jmp    8010587e <alltraps>

801065f3 <vector217>:
.globl vector217
vector217:
  pushl $0
801065f3:	6a 00                	push   $0x0
  pushl $217
801065f5:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
801065fa:	e9 7f f2 ff ff       	jmp    8010587e <alltraps>

801065ff <vector218>:
.globl vector218
vector218:
  pushl $0
801065ff:	6a 00                	push   $0x0
  pushl $218
80106601:	68 da 00 00 00       	push   $0xda
  jmp alltraps
80106606:	e9 73 f2 ff ff       	jmp    8010587e <alltraps>

8010660b <vector219>:
.globl vector219
vector219:
  pushl $0
8010660b:	6a 00                	push   $0x0
  pushl $219
8010660d:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80106612:	e9 67 f2 ff ff       	jmp    8010587e <alltraps>

80106617 <vector220>:
.globl vector220
vector220:
  pushl $0
80106617:	6a 00                	push   $0x0
  pushl $220
80106619:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
8010661e:	e9 5b f2 ff ff       	jmp    8010587e <alltraps>

80106623 <vector221>:
.globl vector221
vector221:
  pushl $0
80106623:	6a 00                	push   $0x0
  pushl $221
80106625:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
8010662a:	e9 4f f2 ff ff       	jmp    8010587e <alltraps>

8010662f <vector222>:
.globl vector222
vector222:
  pushl $0
8010662f:	6a 00                	push   $0x0
  pushl $222
80106631:	68 de 00 00 00       	push   $0xde
  jmp alltraps
80106636:	e9 43 f2 ff ff       	jmp    8010587e <alltraps>

8010663b <vector223>:
.globl vector223
vector223:
  pushl $0
8010663b:	6a 00                	push   $0x0
  pushl $223
8010663d:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80106642:	e9 37 f2 ff ff       	jmp    8010587e <alltraps>

80106647 <vector224>:
.globl vector224
vector224:
  pushl $0
80106647:	6a 00                	push   $0x0
  pushl $224
80106649:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
8010664e:	e9 2b f2 ff ff       	jmp    8010587e <alltraps>

80106653 <vector225>:
.globl vector225
vector225:
  pushl $0
80106653:	6a 00                	push   $0x0
  pushl $225
80106655:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
8010665a:	e9 1f f2 ff ff       	jmp    8010587e <alltraps>

8010665f <vector226>:
.globl vector226
vector226:
  pushl $0
8010665f:	6a 00                	push   $0x0
  pushl $226
80106661:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
80106666:	e9 13 f2 ff ff       	jmp    8010587e <alltraps>

8010666b <vector227>:
.globl vector227
vector227:
  pushl $0
8010666b:	6a 00                	push   $0x0
  pushl $227
8010666d:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80106672:	e9 07 f2 ff ff       	jmp    8010587e <alltraps>

80106677 <vector228>:
.globl vector228
vector228:
  pushl $0
80106677:	6a 00                	push   $0x0
  pushl $228
80106679:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
8010667e:	e9 fb f1 ff ff       	jmp    8010587e <alltraps>

80106683 <vector229>:
.globl vector229
vector229:
  pushl $0
80106683:	6a 00                	push   $0x0
  pushl $229
80106685:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
8010668a:	e9 ef f1 ff ff       	jmp    8010587e <alltraps>

8010668f <vector230>:
.globl vector230
vector230:
  pushl $0
8010668f:	6a 00                	push   $0x0
  pushl $230
80106691:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80106696:	e9 e3 f1 ff ff       	jmp    8010587e <alltraps>

8010669b <vector231>:
.globl vector231
vector231:
  pushl $0
8010669b:	6a 00                	push   $0x0
  pushl $231
8010669d:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
801066a2:	e9 d7 f1 ff ff       	jmp    8010587e <alltraps>

801066a7 <vector232>:
.globl vector232
vector232:
  pushl $0
801066a7:	6a 00                	push   $0x0
  pushl $232
801066a9:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
801066ae:	e9 cb f1 ff ff       	jmp    8010587e <alltraps>

801066b3 <vector233>:
.globl vector233
vector233:
  pushl $0
801066b3:	6a 00                	push   $0x0
  pushl $233
801066b5:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
801066ba:	e9 bf f1 ff ff       	jmp    8010587e <alltraps>

801066bf <vector234>:
.globl vector234
vector234:
  pushl $0
801066bf:	6a 00                	push   $0x0
  pushl $234
801066c1:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
801066c6:	e9 b3 f1 ff ff       	jmp    8010587e <alltraps>

801066cb <vector235>:
.globl vector235
vector235:
  pushl $0
801066cb:	6a 00                	push   $0x0
  pushl $235
801066cd:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
801066d2:	e9 a7 f1 ff ff       	jmp    8010587e <alltraps>

801066d7 <vector236>:
.globl vector236
vector236:
  pushl $0
801066d7:	6a 00                	push   $0x0
  pushl $236
801066d9:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
801066de:	e9 9b f1 ff ff       	jmp    8010587e <alltraps>

801066e3 <vector237>:
.globl vector237
vector237:
  pushl $0
801066e3:	6a 00                	push   $0x0
  pushl $237
801066e5:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
801066ea:	e9 8f f1 ff ff       	jmp    8010587e <alltraps>

801066ef <vector238>:
.globl vector238
vector238:
  pushl $0
801066ef:	6a 00                	push   $0x0
  pushl $238
801066f1:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
801066f6:	e9 83 f1 ff ff       	jmp    8010587e <alltraps>

801066fb <vector239>:
.globl vector239
vector239:
  pushl $0
801066fb:	6a 00                	push   $0x0
  pushl $239
801066fd:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
80106702:	e9 77 f1 ff ff       	jmp    8010587e <alltraps>

80106707 <vector240>:
.globl vector240
vector240:
  pushl $0
80106707:	6a 00                	push   $0x0
  pushl $240
80106709:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
8010670e:	e9 6b f1 ff ff       	jmp    8010587e <alltraps>

80106713 <vector241>:
.globl vector241
vector241:
  pushl $0
80106713:	6a 00                	push   $0x0
  pushl $241
80106715:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
8010671a:	e9 5f f1 ff ff       	jmp    8010587e <alltraps>

8010671f <vector242>:
.globl vector242
vector242:
  pushl $0
8010671f:	6a 00                	push   $0x0
  pushl $242
80106721:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
80106726:	e9 53 f1 ff ff       	jmp    8010587e <alltraps>

8010672b <vector243>:
.globl vector243
vector243:
  pushl $0
8010672b:	6a 00                	push   $0x0
  pushl $243
8010672d:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80106732:	e9 47 f1 ff ff       	jmp    8010587e <alltraps>

80106737 <vector244>:
.globl vector244
vector244:
  pushl $0
80106737:	6a 00                	push   $0x0
  pushl $244
80106739:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
8010673e:	e9 3b f1 ff ff       	jmp    8010587e <alltraps>

80106743 <vector245>:
.globl vector245
vector245:
  pushl $0
80106743:	6a 00                	push   $0x0
  pushl $245
80106745:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
8010674a:	e9 2f f1 ff ff       	jmp    8010587e <alltraps>

8010674f <vector246>:
.globl vector246
vector246:
  pushl $0
8010674f:	6a 00                	push   $0x0
  pushl $246
80106751:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
80106756:	e9 23 f1 ff ff       	jmp    8010587e <alltraps>

8010675b <vector247>:
.globl vector247
vector247:
  pushl $0
8010675b:	6a 00                	push   $0x0
  pushl $247
8010675d:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80106762:	e9 17 f1 ff ff       	jmp    8010587e <alltraps>

80106767 <vector248>:
.globl vector248
vector248:
  pushl $0
80106767:	6a 00                	push   $0x0
  pushl $248
80106769:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
8010676e:	e9 0b f1 ff ff       	jmp    8010587e <alltraps>

80106773 <vector249>:
.globl vector249
vector249:
  pushl $0
80106773:	6a 00                	push   $0x0
  pushl $249
80106775:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
8010677a:	e9 ff f0 ff ff       	jmp    8010587e <alltraps>

8010677f <vector250>:
.globl vector250
vector250:
  pushl $0
8010677f:	6a 00                	push   $0x0
  pushl $250
80106781:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80106786:	e9 f3 f0 ff ff       	jmp    8010587e <alltraps>

8010678b <vector251>:
.globl vector251
vector251:
  pushl $0
8010678b:	6a 00                	push   $0x0
  pushl $251
8010678d:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80106792:	e9 e7 f0 ff ff       	jmp    8010587e <alltraps>

80106797 <vector252>:
.globl vector252
vector252:
  pushl $0
80106797:	6a 00                	push   $0x0
  pushl $252
80106799:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
8010679e:	e9 db f0 ff ff       	jmp    8010587e <alltraps>

801067a3 <vector253>:
.globl vector253
vector253:
  pushl $0
801067a3:	6a 00                	push   $0x0
  pushl $253
801067a5:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
801067aa:	e9 cf f0 ff ff       	jmp    8010587e <alltraps>

801067af <vector254>:
.globl vector254
vector254:
  pushl $0
801067af:	6a 00                	push   $0x0
  pushl $254
801067b1:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
801067b6:	e9 c3 f0 ff ff       	jmp    8010587e <alltraps>

801067bb <vector255>:
.globl vector255
vector255:
  pushl $0
801067bb:	6a 00                	push   $0x0
  pushl $255
801067bd:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
801067c2:	e9 b7 f0 ff ff       	jmp    8010587e <alltraps>
801067c7:	66 90                	xchg   %ax,%ax
801067c9:	66 90                	xchg   %ax,%ax
801067cb:	66 90                	xchg   %ax,%ax
801067cd:	66 90                	xchg   %ax,%ax
801067cf:	90                   	nop

801067d0 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
801067d0:	55                   	push   %ebp
801067d1:	89 e5                	mov    %esp,%ebp
801067d3:	57                   	push   %edi
801067d4:	56                   	push   %esi
801067d5:	53                   	push   %ebx
801067d6:	89 d3                	mov    %edx,%ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
801067d8:	c1 ea 16             	shr    $0x16,%edx
801067db:	8d 3c 90             	lea    (%eax,%edx,4),%edi
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
801067de:	83 ec 0c             	sub    $0xc,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
801067e1:	8b 07                	mov    (%edi),%eax
801067e3:	a8 01                	test   $0x1,%al
801067e5:	74 29                	je     80106810 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
801067e7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801067ec:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
801067f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
801067f5:	c1 eb 0a             	shr    $0xa,%ebx
801067f8:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
801067fe:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
}
80106801:	5b                   	pop    %ebx
80106802:	5e                   	pop    %esi
80106803:	5f                   	pop    %edi
80106804:	5d                   	pop    %ebp
80106805:	c3                   	ret    
80106806:	8d 76 00             	lea    0x0(%esi),%esi
80106809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106810:	85 c9                	test   %ecx,%ecx
80106812:	74 2c                	je     80106840 <walkpgdir+0x70>
80106814:	e8 f7 bd ff ff       	call   80102610 <kalloc>
80106819:	85 c0                	test   %eax,%eax
8010681b:	89 c6                	mov    %eax,%esi
8010681d:	74 21                	je     80106840 <walkpgdir+0x70>
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
8010681f:	83 ec 04             	sub    $0x4,%esp
80106822:	68 00 10 00 00       	push   $0x1000
80106827:	6a 00                	push   $0x0
80106829:	50                   	push   %eax
8010682a:	e8 f1 dd ff ff       	call   80104620 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
8010682f:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106835:	83 c4 10             	add    $0x10,%esp
80106838:	83 c8 07             	or     $0x7,%eax
8010683b:	89 07                	mov    %eax,(%edi)
8010683d:	eb b3                	jmp    801067f2 <walkpgdir+0x22>
8010683f:	90                   	nop
  }
  return &pgtab[PTX(va)];
}
80106840:	8d 65 f4             	lea    -0xc(%ebp),%esp
  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
80106843:	31 c0                	xor    %eax,%eax
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
80106845:	5b                   	pop    %ebx
80106846:	5e                   	pop    %esi
80106847:	5f                   	pop    %edi
80106848:	5d                   	pop    %ebp
80106849:	c3                   	ret    
8010684a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106850 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106850:	55                   	push   %ebp
80106851:	89 e5                	mov    %esp,%ebp
80106853:	57                   	push   %edi
80106854:	56                   	push   %esi
80106855:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106856:	89 d3                	mov    %edx,%ebx
80106858:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
8010685e:	83 ec 1c             	sub    $0x1c,%esp
80106861:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106864:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106868:	8b 7d 08             	mov    0x8(%ebp),%edi
8010686b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106870:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106873:	8b 45 0c             	mov    0xc(%ebp),%eax
80106876:	29 df                	sub    %ebx,%edi
80106878:	83 c8 01             	or     $0x1,%eax
8010687b:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010687e:	eb 15                	jmp    80106895 <mappages+0x45>
  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
80106880:	f6 00 01             	testb  $0x1,(%eax)
80106883:	75 45                	jne    801068ca <mappages+0x7a>
      panic("remap");
    *pte = pa | perm | PTE_P;
80106885:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
80106888:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
8010688b:	89 30                	mov    %esi,(%eax)
    if(a == last)
8010688d:	74 31                	je     801068c0 <mappages+0x70>
      break;
    a += PGSIZE;
8010688f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106895:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106898:	b9 01 00 00 00       	mov    $0x1,%ecx
8010689d:	89 da                	mov    %ebx,%edx
8010689f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
801068a2:	e8 29 ff ff ff       	call   801067d0 <walkpgdir>
801068a7:	85 c0                	test   %eax,%eax
801068a9:	75 d5                	jne    80106880 <mappages+0x30>
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
801068ab:	8d 65 f4             	lea    -0xc(%ebp),%esp

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
801068ae:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
801068b3:	5b                   	pop    %ebx
801068b4:	5e                   	pop    %esi
801068b5:	5f                   	pop    %edi
801068b6:	5d                   	pop    %ebp
801068b7:	c3                   	ret    
801068b8:	90                   	nop
801068b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801068c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
801068c3:	31 c0                	xor    %eax,%eax
}
801068c5:	5b                   	pop    %ebx
801068c6:	5e                   	pop    %esi
801068c7:	5f                   	pop    %edi
801068c8:	5d                   	pop    %ebp
801068c9:	c3                   	ret    
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
801068ca:	83 ec 0c             	sub    $0xc,%esp
801068cd:	68 b4 79 10 80       	push   $0x801079b4
801068d2:	e8 99 9a ff ff       	call   80100370 <panic>
801068d7:	89 f6                	mov    %esi,%esi
801068d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801068e0 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801068e0:	55                   	push   %ebp
801068e1:	89 e5                	mov    %esp,%ebp
801068e3:	57                   	push   %edi
801068e4:	56                   	push   %esi
801068e5:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801068e6:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801068ec:	89 c7                	mov    %eax,%edi
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801068ee:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801068f4:	83 ec 1c             	sub    $0x1c,%esp
801068f7:	89 4d e0             	mov    %ecx,-0x20(%ebp)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
801068fa:	39 d3                	cmp    %edx,%ebx
801068fc:	73 60                	jae    8010695e <deallocuvm.part.0+0x7e>
801068fe:	89 d6                	mov    %edx,%esi
80106900:	eb 3d                	jmp    8010693f <deallocuvm.part.0+0x5f>
80106902:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a += (NPTENTRIES - 1) * PGSIZE;
    else if((*pte & PTE_P) != 0){
80106908:	8b 10                	mov    (%eax),%edx
8010690a:	f6 c2 01             	test   $0x1,%dl
8010690d:	74 26                	je     80106935 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
8010690f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106915:	74 52                	je     80106969 <deallocuvm.part.0+0x89>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106917:	83 ec 0c             	sub    $0xc,%esp
8010691a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106920:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106923:	52                   	push   %edx
80106924:	e8 37 bb ff ff       	call   80102460 <kfree>
      *pte = 0;
80106929:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010692c:	83 c4 10             	add    $0x10,%esp
8010692f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106935:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010693b:	39 f3                	cmp    %esi,%ebx
8010693d:	73 1f                	jae    8010695e <deallocuvm.part.0+0x7e>
    pte = walkpgdir(pgdir, (char*)a, 0);
8010693f:	31 c9                	xor    %ecx,%ecx
80106941:	89 da                	mov    %ebx,%edx
80106943:	89 f8                	mov    %edi,%eax
80106945:	e8 86 fe ff ff       	call   801067d0 <walkpgdir>
    if(!pte)
8010694a:	85 c0                	test   %eax,%eax
8010694c:	75 ba                	jne    80106908 <deallocuvm.part.0+0x28>
      a += (NPTENTRIES - 1) * PGSIZE;
8010694e:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106954:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010695a:	39 f3                	cmp    %esi,%ebx
8010695c:	72 e1                	jb     8010693f <deallocuvm.part.0+0x5f>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
8010695e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106961:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106964:	5b                   	pop    %ebx
80106965:	5e                   	pop    %esi
80106966:	5f                   	pop    %edi
80106967:	5d                   	pop    %ebp
80106968:	c3                   	ret    
    if(!pte)
      a += (NPTENTRIES - 1) * PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
80106969:	83 ec 0c             	sub    $0xc,%esp
8010696c:	68 72 73 10 80       	push   $0x80107372
80106971:	e8 fa 99 ff ff       	call   80100370 <panic>
80106976:	8d 76 00             	lea    0x0(%esi),%esi
80106979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106980 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106980:	55                   	push   %ebp
80106981:	89 e5                	mov    %esp,%ebp
80106983:	53                   	push   %ebx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106984:	31 db                	xor    %ebx,%ebx

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106986:	83 ec 14             	sub    $0x14,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
80106989:	e8 e2 be ff ff       	call   80102870 <cpunum>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
8010698e:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80106994:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106999:	8d 90 e0 26 11 80    	lea    -0x7feed920(%eax),%edx
8010699f:	c6 80 5d 27 11 80 9a 	movb   $0x9a,-0x7feed8a3(%eax)
801069a6:	c6 80 5e 27 11 80 cf 	movb   $0xcf,-0x7feed8a2(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801069ad:	c6 80 65 27 11 80 92 	movb   $0x92,-0x7feed89b(%eax)
801069b4:	c6 80 66 27 11 80 cf 	movb   $0xcf,-0x7feed89a(%eax)
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
801069bb:	66 89 4a 78          	mov    %cx,0x78(%edx)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801069bf:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
801069c4:	66 89 5a 7a          	mov    %bx,0x7a(%edx)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801069c8:	66 89 8a 80 00 00 00 	mov    %cx,0x80(%edx)
801069cf:	31 db                	xor    %ebx,%ebx
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801069d1:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801069d6:	66 89 9a 82 00 00 00 	mov    %bx,0x82(%edx)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801069dd:	66 89 8a 90 00 00 00 	mov    %cx,0x90(%edx)
801069e4:	31 db                	xor    %ebx,%ebx
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801069e6:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801069eb:	66 89 9a 92 00 00 00 	mov    %bx,0x92(%edx)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801069f2:	31 db                	xor    %ebx,%ebx
801069f4:	66 89 8a 98 00 00 00 	mov    %cx,0x98(%edx)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
801069fb:	8d 88 94 27 11 80    	lea    -0x7feed86c(%eax),%ecx
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106a01:	66 89 9a 9a 00 00 00 	mov    %bx,0x9a(%edx)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106a08:	31 db                	xor    %ebx,%ebx
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106a0a:	c6 80 75 27 11 80 fa 	movb   $0xfa,-0x7feed88b(%eax)
80106a11:	c6 80 76 27 11 80 cf 	movb   $0xcf,-0x7feed88a(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106a18:	66 89 9a 88 00 00 00 	mov    %bx,0x88(%edx)
80106a1f:	66 89 8a 8a 00 00 00 	mov    %cx,0x8a(%edx)
80106a26:	89 cb                	mov    %ecx,%ebx
80106a28:	c1 e9 18             	shr    $0x18,%ecx
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106a2b:	c6 80 7d 27 11 80 f2 	movb   $0xf2,-0x7feed883(%eax)
80106a32:	c6 80 7e 27 11 80 cf 	movb   $0xcf,-0x7feed882(%eax)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106a39:	88 8a 8f 00 00 00    	mov    %cl,0x8f(%edx)
80106a3f:	c6 80 6d 27 11 80 92 	movb   $0x92,-0x7feed893(%eax)
static inline void
lgdt(struct segdesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80106a46:	b9 37 00 00 00       	mov    $0x37,%ecx
80106a4b:	c6 80 6e 27 11 80 c0 	movb   $0xc0,-0x7feed892(%eax)

  lgdt(c->gdt, sizeof(c->gdt));
80106a52:	05 50 27 11 80       	add    $0x80112750,%eax
80106a57:	66 89 4d f2          	mov    %cx,-0xe(%ebp)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106a5b:	c1 eb 10             	shr    $0x10,%ebx
  pd[1] = (uint)p;
80106a5e:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106a62:	c1 e8 10             	shr    $0x10,%eax
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106a65:	c6 42 7c 00          	movb   $0x0,0x7c(%edx)
80106a69:	c6 42 7f 00          	movb   $0x0,0x7f(%edx)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106a6d:	c6 82 84 00 00 00 00 	movb   $0x0,0x84(%edx)
80106a74:	c6 82 87 00 00 00 00 	movb   $0x0,0x87(%edx)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106a7b:	c6 82 94 00 00 00 00 	movb   $0x0,0x94(%edx)
80106a82:	c6 82 97 00 00 00 00 	movb   $0x0,0x97(%edx)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106a89:	c6 82 9c 00 00 00 00 	movb   $0x0,0x9c(%edx)
80106a90:	c6 82 9f 00 00 00 00 	movb   $0x0,0x9f(%edx)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106a97:	88 9a 8c 00 00 00    	mov    %bl,0x8c(%edx)
80106a9d:	66 89 45 f6          	mov    %ax,-0xa(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
80106aa1:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106aa4:	0f 01 10             	lgdtl  (%eax)
}

static inline void
loadgs(ushort v)
{
  asm volatile("movw %0, %%gs" : : "r" (v));
80106aa7:	b8 18 00 00 00       	mov    $0x18,%eax
80106aac:	8e e8                	mov    %eax,%gs
  lgdt(c->gdt, sizeof(c->gdt));
  loadgs(SEG_KCPU << 3);

  // Initialize cpu-local storage.
  cpu = c;
  proc = 0;
80106aae:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80106ab5:	00 00 00 00 

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
80106ab9:	65 89 15 00 00 00 00 	mov    %edx,%gs:0x0
  loadgs(SEG_KCPU << 3);

  // Initialize cpu-local storage.
  cpu = c;
  proc = 0;
}
80106ac0:	83 c4 14             	add    $0x14,%esp
80106ac3:	5b                   	pop    %ebx
80106ac4:	5d                   	pop    %ebp
80106ac5:	c3                   	ret    
80106ac6:	8d 76 00             	lea    0x0(%esi),%esi
80106ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106ad0 <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80106ad0:	55                   	push   %ebp
80106ad1:	89 e5                	mov    %esp,%ebp
80106ad3:	56                   	push   %esi
80106ad4:	53                   	push   %ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80106ad5:	e8 36 bb ff ff       	call   80102610 <kalloc>
80106ada:	85 c0                	test   %eax,%eax
80106adc:	74 52                	je     80106b30 <setupkvm+0x60>
    return 0;
  memset(pgdir, 0, PGSIZE);
80106ade:	83 ec 04             	sub    $0x4,%esp
80106ae1:	89 c6                	mov    %eax,%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106ae3:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
80106ae8:	68 00 10 00 00       	push   $0x1000
80106aed:	6a 00                	push   $0x0
80106aef:	50                   	push   %eax
80106af0:	e8 2b db ff ff       	call   80104620 <memset>
80106af5:	83 c4 10             	add    $0x10,%esp
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106af8:	8b 43 04             	mov    0x4(%ebx),%eax
80106afb:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106afe:	83 ec 08             	sub    $0x8,%esp
80106b01:	8b 13                	mov    (%ebx),%edx
80106b03:	ff 73 0c             	pushl  0xc(%ebx)
80106b06:	50                   	push   %eax
80106b07:	29 c1                	sub    %eax,%ecx
80106b09:	89 f0                	mov    %esi,%eax
80106b0b:	e8 40 fd ff ff       	call   80106850 <mappages>
80106b10:	83 c4 10             	add    $0x10,%esp
80106b13:	85 c0                	test   %eax,%eax
80106b15:	78 19                	js     80106b30 <setupkvm+0x60>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106b17:	83 c3 10             	add    $0x10,%ebx
80106b1a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106b20:	75 d6                	jne    80106af8 <setupkvm+0x28>
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
}
80106b22:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106b25:	89 f0                	mov    %esi,%eax
80106b27:	5b                   	pop    %ebx
80106b28:	5e                   	pop    %esi
80106b29:	5d                   	pop    %ebp
80106b2a:	c3                   	ret    
80106b2b:	90                   	nop
80106b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106b30:	8d 65 f8             	lea    -0x8(%ebp),%esp
{
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
80106b33:	31 c0                	xor    %eax,%eax
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
}
80106b35:	5b                   	pop    %ebx
80106b36:	5e                   	pop    %esi
80106b37:	5d                   	pop    %ebp
80106b38:	c3                   	ret    
80106b39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106b40 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
80106b40:	55                   	push   %ebp
80106b41:	89 e5                	mov    %esp,%ebp
80106b43:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106b46:	e8 85 ff ff ff       	call   80106ad0 <setupkvm>
80106b4b:	a3 64 54 11 80       	mov    %eax,0x80115464
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106b50:	05 00 00 00 80       	add    $0x80000000,%eax
80106b55:	0f 22 d8             	mov    %eax,%cr3
  switchkvm();
}
80106b58:	c9                   	leave  
80106b59:	c3                   	ret    
80106b5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106b60 <switchkvm>:
80106b60:	a1 64 54 11 80       	mov    0x80115464,%eax

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80106b65:	55                   	push   %ebp
80106b66:	89 e5                	mov    %esp,%ebp
80106b68:	05 00 00 00 80       	add    $0x80000000,%eax
80106b6d:	0f 22 d8             	mov    %eax,%cr3
  lcr3(V2P(kpgdir));   // switch to the kernel page table
}
80106b70:	5d                   	pop    %ebp
80106b71:	c3                   	ret    
80106b72:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106b80 <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
80106b80:	55                   	push   %ebp
80106b81:	89 e5                	mov    %esp,%ebp
80106b83:	53                   	push   %ebx
80106b84:	83 ec 04             	sub    $0x4,%esp
80106b87:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pushcli();
80106b8a:	e8 c1 d9 ff ff       	call   80104550 <pushcli>
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106b8f:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80106b95:	b9 67 00 00 00       	mov    $0x67,%ecx
80106b9a:	8d 50 08             	lea    0x8(%eax),%edx
80106b9d:	66 89 88 a0 00 00 00 	mov    %cx,0xa0(%eax)
80106ba4:	c6 80 a6 00 00 00 40 	movb   $0x40,0xa6(%eax)
  cpu->gdt[SEG_TSS].s = 0;
80106bab:	c6 80 a5 00 00 00 89 	movb   $0x89,0xa5(%eax)
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106bb2:	66 89 90 a2 00 00 00 	mov    %dx,0xa2(%eax)
80106bb9:	89 d1                	mov    %edx,%ecx
80106bbb:	c1 ea 18             	shr    $0x18,%edx
80106bbe:	88 90 a7 00 00 00    	mov    %dl,0xa7(%eax)
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
80106bc4:	ba 10 00 00 00       	mov    $0x10,%edx
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106bc9:	c1 e9 10             	shr    $0x10,%ecx
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
80106bcc:	66 89 50 10          	mov    %dx,0x10(%eax)
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
80106bd0:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106bd7:	88 88 a4 00 00 00    	mov    %cl,0xa4(%eax)
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
80106bdd:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
{
  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
80106be2:	8b 52 08             	mov    0x8(%edx),%edx
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
80106be5:	66 89 48 6e          	mov    %cx,0x6e(%eax)
{
  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
80106be9:	81 c2 00 10 00 00    	add    $0x1000,%edx
80106bef:	89 50 0c             	mov    %edx,0xc(%eax)
}

static inline void
ltr(ushort sel)
{
  asm volatile("ltr %0" : : "r" (sel));
80106bf2:	b8 30 00 00 00       	mov    $0x30,%eax
80106bf7:	0f 00 d8             	ltr    %ax
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  if(p->pgdir == 0)
80106bfa:	8b 43 04             	mov    0x4(%ebx),%eax
80106bfd:	85 c0                	test   %eax,%eax
80106bff:	74 11                	je     80106c12 <switchuvm+0x92>
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106c01:	05 00 00 00 80       	add    $0x80000000,%eax
80106c06:	0f 22 d8             	mov    %eax,%cr3
    panic("switchuvm: no pgdir");
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
}
80106c09:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80106c0c:	c9                   	leave  
  cpu->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
80106c0d:	e9 6e d9 ff ff       	jmp    80104580 <popcli>
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
80106c12:	83 ec 0c             	sub    $0xc,%esp
80106c15:	68 ba 79 10 80       	push   $0x801079ba
80106c1a:	e8 51 97 ff ff       	call   80100370 <panic>
80106c1f:	90                   	nop

80106c20 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106c20:	55                   	push   %ebp
80106c21:	89 e5                	mov    %esp,%ebp
80106c23:	57                   	push   %edi
80106c24:	56                   	push   %esi
80106c25:	53                   	push   %ebx
80106c26:	83 ec 1c             	sub    $0x1c,%esp
80106c29:	8b 75 10             	mov    0x10(%ebp),%esi
80106c2c:	8b 45 08             	mov    0x8(%ebp),%eax
80106c2f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *mem;

  if(sz >= PGSIZE)
80106c32:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106c38:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *mem;

  if(sz >= PGSIZE)
80106c3b:	77 49                	ja     80106c86 <inituvm+0x66>
    panic("inituvm: more than a page");
  mem = kalloc();
80106c3d:	e8 ce b9 ff ff       	call   80102610 <kalloc>
  memset(mem, 0, PGSIZE);
80106c42:	83 ec 04             	sub    $0x4,%esp
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
80106c45:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106c47:	68 00 10 00 00       	push   $0x1000
80106c4c:	6a 00                	push   $0x0
80106c4e:	50                   	push   %eax
80106c4f:	e8 cc d9 ff ff       	call   80104620 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106c54:	58                   	pop    %eax
80106c55:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106c5b:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106c60:	5a                   	pop    %edx
80106c61:	6a 06                	push   $0x6
80106c63:	50                   	push   %eax
80106c64:	31 d2                	xor    %edx,%edx
80106c66:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106c69:	e8 e2 fb ff ff       	call   80106850 <mappages>
  memmove(mem, init, sz);
80106c6e:	89 75 10             	mov    %esi,0x10(%ebp)
80106c71:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106c74:	83 c4 10             	add    $0x10,%esp
80106c77:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106c7a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c7d:	5b                   	pop    %ebx
80106c7e:	5e                   	pop    %esi
80106c7f:	5f                   	pop    %edi
80106c80:	5d                   	pop    %ebp
  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
80106c81:	e9 4a da ff ff       	jmp    801046d0 <memmove>
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
80106c86:	83 ec 0c             	sub    $0xc,%esp
80106c89:	68 ce 79 10 80       	push   $0x801079ce
80106c8e:	e8 dd 96 ff ff       	call   80100370 <panic>
80106c93:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106ca0 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
80106ca0:	55                   	push   %ebp
80106ca1:	89 e5                	mov    %esp,%ebp
80106ca3:	57                   	push   %edi
80106ca4:	56                   	push   %esi
80106ca5:	53                   	push   %ebx
80106ca6:	83 ec 0c             	sub    $0xc,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
80106ca9:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106cb0:	0f 85 91 00 00 00    	jne    80106d47 <loaduvm+0xa7>
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
80106cb6:	8b 75 18             	mov    0x18(%ebp),%esi
80106cb9:	31 db                	xor    %ebx,%ebx
80106cbb:	85 f6                	test   %esi,%esi
80106cbd:	75 1a                	jne    80106cd9 <loaduvm+0x39>
80106cbf:	eb 6f                	jmp    80106d30 <loaduvm+0x90>
80106cc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106cc8:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106cce:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106cd4:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106cd7:	76 57                	jbe    80106d30 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106cd9:	8b 55 0c             	mov    0xc(%ebp),%edx
80106cdc:	8b 45 08             	mov    0x8(%ebp),%eax
80106cdf:	31 c9                	xor    %ecx,%ecx
80106ce1:	01 da                	add    %ebx,%edx
80106ce3:	e8 e8 fa ff ff       	call   801067d0 <walkpgdir>
80106ce8:	85 c0                	test   %eax,%eax
80106cea:	74 4e                	je     80106d3a <loaduvm+0x9a>
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106cec:	8b 00                	mov    (%eax),%eax
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106cee:	8b 4d 14             	mov    0x14(%ebp),%ecx
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
    if(sz - i < PGSIZE)
80106cf1:	bf 00 10 00 00       	mov    $0x1000,%edi
  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106cf6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106cfb:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106d01:	0f 46 fe             	cmovbe %esi,%edi
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106d04:	01 d9                	add    %ebx,%ecx
80106d06:	05 00 00 00 80       	add    $0x80000000,%eax
80106d0b:	57                   	push   %edi
80106d0c:	51                   	push   %ecx
80106d0d:	50                   	push   %eax
80106d0e:	ff 75 10             	pushl  0x10(%ebp)
80106d11:	e8 9a ad ff ff       	call   80101ab0 <readi>
80106d16:	83 c4 10             	add    $0x10,%esp
80106d19:	39 c7                	cmp    %eax,%edi
80106d1b:	74 ab                	je     80106cc8 <loaduvm+0x28>
      return -1;
  }
  return 0;
}
80106d1d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
80106d20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
80106d25:	5b                   	pop    %ebx
80106d26:	5e                   	pop    %esi
80106d27:	5f                   	pop    %edi
80106d28:	5d                   	pop    %ebp
80106d29:	c3                   	ret    
80106d2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106d30:	8d 65 f4             	lea    -0xc(%ebp),%esp
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
80106d33:	31 c0                	xor    %eax,%eax
}
80106d35:	5b                   	pop    %ebx
80106d36:	5e                   	pop    %esi
80106d37:	5f                   	pop    %edi
80106d38:	5d                   	pop    %ebp
80106d39:	c3                   	ret    

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
80106d3a:	83 ec 0c             	sub    $0xc,%esp
80106d3d:	68 e8 79 10 80       	push   $0x801079e8
80106d42:	e8 29 96 ff ff       	call   80100370 <panic>
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
80106d47:	83 ec 0c             	sub    $0xc,%esp
80106d4a:	68 8c 7a 10 80       	push   $0x80107a8c
80106d4f:	e8 1c 96 ff ff       	call   80100370 <panic>
80106d54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106d5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106d60 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106d60:	55                   	push   %ebp
80106d61:	89 e5                	mov    %esp,%ebp
80106d63:	57                   	push   %edi
80106d64:	56                   	push   %esi
80106d65:	53                   	push   %ebx
80106d66:	83 ec 0c             	sub    $0xc,%esp
80106d69:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
80106d6c:	85 ff                	test   %edi,%edi
80106d6e:	0f 88 ca 00 00 00    	js     80106e3e <allocuvm+0xde>
    return 0;
  if(newsz < oldsz)
80106d74:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
80106d77:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
    return 0;
  if(newsz < oldsz)
80106d7a:	0f 82 82 00 00 00    	jb     80106e02 <allocuvm+0xa2>
    return oldsz;

  a = PGROUNDUP(oldsz);
80106d80:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106d86:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106d8c:	39 df                	cmp    %ebx,%edi
80106d8e:	77 43                	ja     80106dd3 <allocuvm+0x73>
80106d90:	e9 bb 00 00 00       	jmp    80106e50 <allocuvm+0xf0>
80106d95:	8d 76 00             	lea    0x0(%esi),%esi
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
80106d98:	83 ec 04             	sub    $0x4,%esp
80106d9b:	68 00 10 00 00       	push   $0x1000
80106da0:	6a 00                	push   $0x0
80106da2:	50                   	push   %eax
80106da3:	e8 78 d8 ff ff       	call   80104620 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106da8:	58                   	pop    %eax
80106da9:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106daf:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106db4:	5a                   	pop    %edx
80106db5:	6a 06                	push   $0x6
80106db7:	50                   	push   %eax
80106db8:	89 da                	mov    %ebx,%edx
80106dba:	8b 45 08             	mov    0x8(%ebp),%eax
80106dbd:	e8 8e fa ff ff       	call   80106850 <mappages>
80106dc2:	83 c4 10             	add    $0x10,%esp
80106dc5:	85 c0                	test   %eax,%eax
80106dc7:	78 47                	js     80106e10 <allocuvm+0xb0>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106dc9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106dcf:	39 df                	cmp    %ebx,%edi
80106dd1:	76 7d                	jbe    80106e50 <allocuvm+0xf0>
    mem = kalloc();
80106dd3:	e8 38 b8 ff ff       	call   80102610 <kalloc>
    if(mem == 0){
80106dd8:	85 c0                	test   %eax,%eax
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
80106dda:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106ddc:	75 ba                	jne    80106d98 <allocuvm+0x38>
      cprintf("allocuvm out of memory\n");
80106dde:	83 ec 0c             	sub    $0xc,%esp
80106de1:	68 06 7a 10 80       	push   $0x80107a06
80106de6:	e8 75 98 ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106deb:	83 c4 10             	add    $0x10,%esp
80106dee:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106df1:	76 4b                	jbe    80106e3e <allocuvm+0xde>
80106df3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106df6:	8b 45 08             	mov    0x8(%ebp),%eax
80106df9:	89 fa                	mov    %edi,%edx
80106dfb:	e8 e0 fa ff ff       	call   801068e0 <deallocuvm.part.0>
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
80106e00:	31 c0                	xor    %eax,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106e02:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e05:	5b                   	pop    %ebx
80106e06:	5e                   	pop    %esi
80106e07:	5f                   	pop    %edi
80106e08:	5d                   	pop    %ebp
80106e09:	c3                   	ret    
80106e0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
80106e10:	83 ec 0c             	sub    $0xc,%esp
80106e13:	68 1e 7a 10 80       	push   $0x80107a1e
80106e18:	e8 43 98 ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106e1d:	83 c4 10             	add    $0x10,%esp
80106e20:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106e23:	76 0d                	jbe    80106e32 <allocuvm+0xd2>
80106e25:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106e28:	8b 45 08             	mov    0x8(%ebp),%eax
80106e2b:	89 fa                	mov    %edi,%edx
80106e2d:	e8 ae fa ff ff       	call   801068e0 <deallocuvm.part.0>
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
80106e32:	83 ec 0c             	sub    $0xc,%esp
80106e35:	56                   	push   %esi
80106e36:	e8 25 b6 ff ff       	call   80102460 <kfree>
      return 0;
80106e3b:	83 c4 10             	add    $0x10,%esp
    }
  }
  return newsz;
}
80106e3e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
      return 0;
80106e41:	31 c0                	xor    %eax,%eax
    }
  }
  return newsz;
}
80106e43:	5b                   	pop    %ebx
80106e44:	5e                   	pop    %esi
80106e45:	5f                   	pop    %edi
80106e46:	5d                   	pop    %ebp
80106e47:	c3                   	ret    
80106e48:	90                   	nop
80106e49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e50:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106e53:	89 f8                	mov    %edi,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106e55:	5b                   	pop    %ebx
80106e56:	5e                   	pop    %esi
80106e57:	5f                   	pop    %edi
80106e58:	5d                   	pop    %ebp
80106e59:	c3                   	ret    
80106e5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106e60 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106e60:	55                   	push   %ebp
80106e61:	89 e5                	mov    %esp,%ebp
80106e63:	8b 55 0c             	mov    0xc(%ebp),%edx
80106e66:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106e69:	8b 45 08             	mov    0x8(%ebp),%eax
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106e6c:	39 d1                	cmp    %edx,%ecx
80106e6e:	73 10                	jae    80106e80 <deallocuvm+0x20>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106e70:	5d                   	pop    %ebp
80106e71:	e9 6a fa ff ff       	jmp    801068e0 <deallocuvm.part.0>
80106e76:	8d 76 00             	lea    0x0(%esi),%esi
80106e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106e80:	89 d0                	mov    %edx,%eax
80106e82:	5d                   	pop    %ebp
80106e83:	c3                   	ret    
80106e84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106e8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106e90 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106e90:	55                   	push   %ebp
80106e91:	89 e5                	mov    %esp,%ebp
80106e93:	57                   	push   %edi
80106e94:	56                   	push   %esi
80106e95:	53                   	push   %ebx
80106e96:	83 ec 0c             	sub    $0xc,%esp
80106e99:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106e9c:	85 f6                	test   %esi,%esi
80106e9e:	74 59                	je     80106ef9 <freevm+0x69>
80106ea0:	31 c9                	xor    %ecx,%ecx
80106ea2:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106ea7:	89 f0                	mov    %esi,%eax
80106ea9:	e8 32 fa ff ff       	call   801068e0 <deallocuvm.part.0>
80106eae:	89 f3                	mov    %esi,%ebx
80106eb0:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106eb6:	eb 0f                	jmp    80106ec7 <freevm+0x37>
80106eb8:	90                   	nop
80106eb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ec0:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106ec3:	39 fb                	cmp    %edi,%ebx
80106ec5:	74 23                	je     80106eea <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106ec7:	8b 03                	mov    (%ebx),%eax
80106ec9:	a8 01                	test   $0x1,%al
80106ecb:	74 f3                	je     80106ec0 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
80106ecd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106ed2:	83 ec 0c             	sub    $0xc,%esp
80106ed5:	83 c3 04             	add    $0x4,%ebx
80106ed8:	05 00 00 00 80       	add    $0x80000000,%eax
80106edd:	50                   	push   %eax
80106ede:	e8 7d b5 ff ff       	call   80102460 <kfree>
80106ee3:	83 c4 10             	add    $0x10,%esp
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106ee6:	39 fb                	cmp    %edi,%ebx
80106ee8:	75 dd                	jne    80106ec7 <freevm+0x37>
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106eea:	89 75 08             	mov    %esi,0x8(%ebp)
}
80106eed:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ef0:	5b                   	pop    %ebx
80106ef1:	5e                   	pop    %esi
80106ef2:	5f                   	pop    %edi
80106ef3:	5d                   	pop    %ebp
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106ef4:	e9 67 b5 ff ff       	jmp    80102460 <kfree>
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
80106ef9:	83 ec 0c             	sub    $0xc,%esp
80106efc:	68 3a 7a 10 80       	push   $0x80107a3a
80106f01:	e8 6a 94 ff ff       	call   80100370 <panic>
80106f06:	8d 76 00             	lea    0x0(%esi),%esi
80106f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106f10 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106f10:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106f11:	31 c9                	xor    %ecx,%ecx

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106f13:	89 e5                	mov    %esp,%ebp
80106f15:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106f18:	8b 55 0c             	mov    0xc(%ebp),%edx
80106f1b:	8b 45 08             	mov    0x8(%ebp),%eax
80106f1e:	e8 ad f8 ff ff       	call   801067d0 <walkpgdir>
  if(pte == 0)
80106f23:	85 c0                	test   %eax,%eax
80106f25:	74 05                	je     80106f2c <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80106f27:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
80106f2a:	c9                   	leave  
80106f2b:	c3                   	ret    
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
80106f2c:	83 ec 0c             	sub    $0xc,%esp
80106f2f:	68 4b 7a 10 80       	push   $0x80107a4b
80106f34:	e8 37 94 ff ff       	call   80100370 <panic>
80106f39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106f40 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80106f40:	55                   	push   %ebp
80106f41:	89 e5                	mov    %esp,%ebp
80106f43:	57                   	push   %edi
80106f44:	56                   	push   %esi
80106f45:	53                   	push   %ebx
80106f46:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80106f49:	e8 82 fb ff ff       	call   80106ad0 <setupkvm>
80106f4e:	85 c0                	test   %eax,%eax
80106f50:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106f53:	0f 84 b2 00 00 00    	je     8010700b <copyuvm+0xcb>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106f59:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106f5c:	85 c9                	test   %ecx,%ecx
80106f5e:	0f 84 9c 00 00 00    	je     80107000 <copyuvm+0xc0>
80106f64:	31 f6                	xor    %esi,%esi
80106f66:	eb 4a                	jmp    80106fb2 <copyuvm+0x72>
80106f68:	90                   	nop
80106f69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106f70:	83 ec 04             	sub    $0x4,%esp
80106f73:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80106f79:	68 00 10 00 00       	push   $0x1000
80106f7e:	57                   	push   %edi
80106f7f:	50                   	push   %eax
80106f80:	e8 4b d7 ff ff       	call   801046d0 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
80106f85:	58                   	pop    %eax
80106f86:	5a                   	pop    %edx
80106f87:	8d 93 00 00 00 80    	lea    -0x80000000(%ebx),%edx
80106f8d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106f90:	ff 75 e4             	pushl  -0x1c(%ebp)
80106f93:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106f98:	52                   	push   %edx
80106f99:	89 f2                	mov    %esi,%edx
80106f9b:	e8 b0 f8 ff ff       	call   80106850 <mappages>
80106fa0:	83 c4 10             	add    $0x10,%esp
80106fa3:	85 c0                	test   %eax,%eax
80106fa5:	78 3e                	js     80106fe5 <copyuvm+0xa5>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106fa7:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106fad:	39 75 0c             	cmp    %esi,0xc(%ebp)
80106fb0:	76 4e                	jbe    80107000 <copyuvm+0xc0>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106fb2:	8b 45 08             	mov    0x8(%ebp),%eax
80106fb5:	31 c9                	xor    %ecx,%ecx
80106fb7:	89 f2                	mov    %esi,%edx
80106fb9:	e8 12 f8 ff ff       	call   801067d0 <walkpgdir>
80106fbe:	85 c0                	test   %eax,%eax
80106fc0:	74 5a                	je     8010701c <copyuvm+0xdc>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
80106fc2:	8b 18                	mov    (%eax),%ebx
80106fc4:	f6 c3 01             	test   $0x1,%bl
80106fc7:	74 46                	je     8010700f <copyuvm+0xcf>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106fc9:	89 df                	mov    %ebx,%edi
    flags = PTE_FLAGS(*pte);
80106fcb:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80106fd1:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106fd4:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
80106fda:	e8 31 b6 ff ff       	call   80102610 <kalloc>
80106fdf:	85 c0                	test   %eax,%eax
80106fe1:	89 c3                	mov    %eax,%ebx
80106fe3:	75 8b                	jne    80106f70 <copyuvm+0x30>
      goto bad;
  }
  return d;

bad:
  freevm(d);
80106fe5:	83 ec 0c             	sub    $0xc,%esp
80106fe8:	ff 75 e0             	pushl  -0x20(%ebp)
80106feb:	e8 a0 fe ff ff       	call   80106e90 <freevm>
  return 0;
80106ff0:	83 c4 10             	add    $0x10,%esp
80106ff3:	31 c0                	xor    %eax,%eax
}
80106ff5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ff8:	5b                   	pop    %ebx
80106ff9:	5e                   	pop    %esi
80106ffa:	5f                   	pop    %edi
80106ffb:	5d                   	pop    %ebp
80106ffc:	c3                   	ret    
80106ffd:	8d 76 00             	lea    0x0(%esi),%esi
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80107000:	8b 45 e0             	mov    -0x20(%ebp),%eax
  return d;

bad:
  freevm(d);
  return 0;
}
80107003:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107006:	5b                   	pop    %ebx
80107007:	5e                   	pop    %esi
80107008:	5f                   	pop    %edi
80107009:	5d                   	pop    %ebp
8010700a:	c3                   	ret    
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
8010700b:	31 c0                	xor    %eax,%eax
8010700d:	eb e6                	jmp    80106ff5 <copyuvm+0xb5>
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
8010700f:	83 ec 0c             	sub    $0xc,%esp
80107012:	68 6f 7a 10 80       	push   $0x80107a6f
80107017:	e8 54 93 ff ff       	call   80100370 <panic>

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
8010701c:	83 ec 0c             	sub    $0xc,%esp
8010701f:	68 55 7a 10 80       	push   $0x80107a55
80107024:	e8 47 93 ff ff       	call   80100370 <panic>
80107029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107030 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80107030:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107031:	31 c9                	xor    %ecx,%ecx

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80107033:	89 e5                	mov    %esp,%ebp
80107035:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107038:	8b 55 0c             	mov    0xc(%ebp),%edx
8010703b:	8b 45 08             	mov    0x8(%ebp),%eax
8010703e:	e8 8d f7 ff ff       	call   801067d0 <walkpgdir>
  if((*pte & PTE_P) == 0)
80107043:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
80107045:	89 c2                	mov    %eax,%edx
80107047:	83 e2 05             	and    $0x5,%edx
8010704a:	83 fa 05             	cmp    $0x5,%edx
8010704d:	75 11                	jne    80107060 <uva2ka+0x30>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
8010704f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
}
80107054:	c9                   	leave  
  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80107055:	05 00 00 00 80       	add    $0x80000000,%eax
}
8010705a:	c3                   	ret    
8010705b:	90                   	nop
8010705c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
80107060:	31 c0                	xor    %eax,%eax
  return (char*)P2V(PTE_ADDR(*pte));
}
80107062:	c9                   	leave  
80107063:	c3                   	ret    
80107064:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010706a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107070 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80107070:	55                   	push   %ebp
80107071:	89 e5                	mov    %esp,%ebp
80107073:	57                   	push   %edi
80107074:	56                   	push   %esi
80107075:	53                   	push   %ebx
80107076:	83 ec 1c             	sub    $0x1c,%esp
80107079:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010707c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010707f:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107082:	85 db                	test   %ebx,%ebx
80107084:	75 40                	jne    801070c6 <copyout+0x56>
80107086:	eb 70                	jmp    801070f8 <copyout+0x88>
80107088:	90                   	nop
80107089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80107090:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107093:	89 f1                	mov    %esi,%ecx
80107095:	29 d1                	sub    %edx,%ecx
80107097:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010709d:	39 d9                	cmp    %ebx,%ecx
8010709f:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
801070a2:	29 f2                	sub    %esi,%edx
801070a4:	83 ec 04             	sub    $0x4,%esp
801070a7:	01 d0                	add    %edx,%eax
801070a9:	51                   	push   %ecx
801070aa:	57                   	push   %edi
801070ab:	50                   	push   %eax
801070ac:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801070af:	e8 1c d6 ff ff       	call   801046d0 <memmove>
    len -= n;
    buf += n;
801070b4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801070b7:	83 c4 10             	add    $0x10,%esp
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
801070ba:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
801070c0:	01 cf                	add    %ecx,%edi
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801070c2:	29 cb                	sub    %ecx,%ebx
801070c4:	74 32                	je     801070f8 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
801070c6:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
801070c8:	83 ec 08             	sub    $0x8,%esp
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
801070cb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801070ce:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
801070d4:	56                   	push   %esi
801070d5:	ff 75 08             	pushl  0x8(%ebp)
801070d8:	e8 53 ff ff ff       	call   80107030 <uva2ka>
    if(pa0 == 0)
801070dd:	83 c4 10             	add    $0x10,%esp
801070e0:	85 c0                	test   %eax,%eax
801070e2:	75 ac                	jne    80107090 <copyout+0x20>
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
801070e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
801070e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
801070ec:	5b                   	pop    %ebx
801070ed:	5e                   	pop    %esi
801070ee:	5f                   	pop    %edi
801070ef:	5d                   	pop    %ebp
801070f0:	c3                   	ret    
801070f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801070f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
801070fb:	31 c0                	xor    %eax,%eax
}
801070fd:	5b                   	pop    %ebx
801070fe:	5e                   	pop    %esi
801070ff:	5f                   	pop    %edi
80107100:	5d                   	pop    %ebp
80107101:	c3                   	ret    
