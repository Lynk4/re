# flag

---

```bash
❯ sudo gdb ./flag
[sudo] password for lynk:
GNU gdb (GDB) 14.2
Copyright (C) 2023 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "x86_64-pc-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<https://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word"...
pwndbg: loaded 160 pwndbg commands and 47 shell commands. Type pwndbg [--shell | 
--all] [filter] for a list.
pwndbg: created $rebase, $base, $ida GDB functions (can be used with print/break)
Reading symbols from ./flag...
(No debugging symbols found in ./flag)
------- tip of the day (disable with set show-tips off) -------
Use the errno (or errno <number>) command to see the name of the last or provided 
(libc) error
pwndbg> catch syscall exit_group
Catchpoint 1 (syscall 'exit_group' [231])
pwndbg> r
Starting program: /home/lynk/pwnable/flag/flag
I will malloc() and strcpy the flag there. take it.

Catchpoint 1 (call to syscall exit_group), 0x0000000000418ee8 in ?? ()
LEGEND: STACK | HEAP | CODE | DATA | WX | RODATA
──────────────────────────────────────────────────[ 
REGISTERS / show-flags off / show-compact-regs off 
]───────────────────────────────────────────────────
 RAX  0xffffffffffffffda
 RBX  0
 RCX  0x418ee8 ◂— cmp rax, -0x1000 /* 'H=' */
 RDX  0
 RDI  0
 RSI  0x3c
 R8   0xe7
 R9   0xffffffffffffffc0
 R10  0x22
 R11  0x246
 R12  0x6c4420 ◂— 0
 R13  1
 R14  0
 R15  0x7fffffffd4c0 —▸ 0x40000c ◂— syscall
 RBP  0x4b39d0 —▸ 0x494d40 ◂— sub rsp, 8
 RSP  0x7fffffffd0f8 —▸ 0x401c21 ◂— mov rdi, r12
 RIP  0x418ee8 ◂— cmp rax, -0x1000 /* 'H=' */
───────────────────────────────────────────────────────────[ 
DISASM / x86-64 / set emulate on 
]────────────────────────────────────────────────────────────
 ► 0x418ee8    cmp    rax, -0x1000     0xffffffffffffffda - 0xfffffffffffff000     
EFLAGS => 0x202 [ cf pf af zf sf IF df of ]
   0x418eee    jbe    0x418ed0                    <0x418ed0>

   0x418ef0    neg    eax
   0x418ef2    mov    dword ptr fs:[r9], eax
   0x418ef6    jmp    0x418ed0                    <0x418ed0>
    ↓
   0x418ed0    mov    rdi, rdx
   0x418ed3    mov    eax, esi
   0x418ed5    syscall
   0x418ed7    cmp    rax, -0x1000
   0x418edd    ja     0x418ef8                    <0x418ef8>

   0x418edf    hlt
─────────────────────────────────────────────────────────────────────────[ 
STACK 
]─────────────────────────────────────────────────────────────────────────
00:0000│ rsp 0x7fffffffd0f8 —▸ 0x401c21 ◂— mov rdi, r12
01:0008│     0x7fffffffd100 —▸ 0x401ae0 ◂— push rbx
02:0010│     0x7fffffffd108 —▸ 0x401ae0 ◂— push rbx
03:0018│     0x7fffffffd110 ◂— 0
04:0020│     0x7fffffffd118 —▸ 0x401a50 ◂— push r14
05:0028│     0x7fffffffd120 ◂— 0
06:0030│     0x7fffffffd128 —▸ 0x401c43 ◂— nop
07:0038│     0x7fffffffd130 ◂— 0
───────────────────────────────────────────────────────────────────────[ 
BACKTRACE 
]───────────────────────────────────────────────────────────────────────
 ► 0         0x418ee8
   1         0x401c21
   2         0x401ae0
   3         0x401ae0
   4              0x0
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
pwndbg> generate-core-file flag-core
warning: Memory read failed for corefile section, 4096 bytes at 
0xffffffffff600000.
Saved corefile flag-core
pwndbg>
```
---

### now the file is unpacked ..............

```bash
❯ file flag-core
flag-core: ELF 64-bit LSB core file, x86-64, version 1 (SYSV), SVR4-style, from 
'/home/lynk/pwnable/flag/flag', real uid: 0, effective uid: 0, real gid: 0, 
effective gid: 0, execfn: '/home/lynk/pwnable/flag/flag', platform: 'x86_64'
```
---

just use strings on flag-core you will get the flag.........

---

<img width="1440" alt="Screenshot 2024-12-09 at 11 54 24 PM" src="https://github.com/user-attachments/assets/b230e689-d21f-49b6-a7c7-b2b00279ba62">

---

