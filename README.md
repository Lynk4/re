# ⚡ REVERSE ENGINEERING & BINARY EXPLOITATION ⚡

Welcome to my personal repository of **Reverse Engineering (RE)**, **Binary Exploitation (Pwn)**, and **Low-Level Assembly** work. This repo houses writeups, custom scripts, source code, and keygens from various CTFs, wargames, and reversing challenges.

---

## 📊 Repository Quick Stats

## 📊 Repository Quick Stats

| Category | Solved | Status | Badges |
| :--- | :---: | :---: | :--- |
| **[ROP Emporium](./ROP-Emporium)** | `4` | In Progress | [![ROP Emporium](https://img.shields.io/badge/ROP_Emporium-4_/_8_Solved-brightgreen?style=flat-square&logo=c&logoColor=white)](./ROP-Emporium) |
| **[crackmes.one](./crackmes)** | `13` | In Progress | [![crackmes.one](https://img.shields.io/badge/crackmes.one-13_Solved-blue?style=flat-square&logo=python&logoColor=white)](./crackmes) |
| **[pwnable.kr](./pwnable.kr)** | `8` | In Progress | [![pwnable.kr](https://img.shields.io/badge/pwnable.kr-8_Solved-orange?style=flat-square&logo=linux&logoColor=white)](./pwnable.kr) |
| **[x86 Assembly](./x86-Assembly)** | `7` | In Progress | [![x86-Assembly](https://img.shields.io/badge/x86--Assembly-7_Projects-blueviolet?style=flat-square&logo=assemblyscript&logoColor=white)](./x86-Assembly) |

---

## 🗂️ Challenge Index

### 🛠️ [ROP Emporium](./ROP-Emporium)
> Return-Oriented Programming (ROP) challenges designed to master the craft of ROP chain construction on x86_64 architectures.

| Challenge | Objective / Exploit Technique | Writeup Link |
| :--- | :--- | :---: |
| **[ret2win](./ROP-Emporium/ret2win)** | Stack overflow to control RIP and return directly to a hidden success function. | [Writeup](./ROP-Emporium/ret2win/README.md) |
| **[split](./ROP-Emporium/split)** | Splitting execution flow to point registers and run arbitrary system commands. | [Writeup](./ROP-Emporium/split/README.md) |
| **[callme](./ROP-Emporium/callme)** | Setting up registers to sequentially invoke multiple functions with precise multi-argument signatures. | [Writeup](./ROP-Emporium/callme/README.md) |
| **[write4](./ROP-Emporium/write4)** | Utilizing arbitrary-write gadgets to write critical strings to writable sections (`.data` / `.bss`) before launching commands. | [Writeup](./ROP-Emporium/write4/README.md) |

---

### 🔓 [crackmes.one](./crackmes)
> Reverse engineering challenges focusing on static/dynamic analysis, cryptographic reversing, anti-debugging, and writing key generators.

| Challenge | Core Reversing Focus / Technique | Solved With | Solution / Writeup |
| :--- | :--- | :---: | :---: |
| **[Adversarial Mind](./crackmes/Adversarial%20Mind)** | Bypassing AI-honeypot prompt injection traps to find the raw password. | IDA Pro | [Writeup](./crackmes/Adversarial%20Mind/README.md) |
| **[keygenme](./crackmes/keygenme)** | Reversing custom hashing and bit-shifting routines to write a key generator. | Ghidra & Python | [Keygen](./crackmes/keygenme/keygenme.py) / [Writeup](./crackmes/keygenme/README.md) |
| **[CrackMeBaby2](./crackmes/CrackMeBaby2)** | Deep-dive reverse engineering of multi-stage password checks. | Static Analysis | [Writeup](./crackmes/CrackMeBaby2/README.md) |
| **[FirstCrackMe](./crackmes/FirstCrackMe)** | Basic password comparison logic checks. | Static Analysis | [Writeup](./crackmes/FirstCrackMe/README.md) |
| **[lafarges_crackme_2](./crackmes/lafarges_crackme_2)** | Reversing Windows PE executables and checking internal structures. | Ghidra | [Writeup](./crackmes/lafarges_crackme_2/README.md) |
| **[first golang crackme](./crackmes/first%20golang%20crackme)** | Reversing Go's unique calling conventions, slice descriptors, and runtime. | Ghidra | [Writeup](./crackmes/first%20golang%20crackme/README.md) |
| **[easy_reverse](./crackmes/easy_reverse)** | Basic binary analysis and disassembly inspection. | GDB | [Writeup](./crackmes/easy_reverse/README.md) |
| **[basik](./crackmes/basik)** | Standard library string manipulation and comparison routines. | Radare2 | [Writeup](./crackmes/basik/README.md) |
| **[CrackMe with password](./crackmes/CrackMe%20with%20password)** | Static string extraction and logic checking. | Strings / GDB | [Writeup](./crackmes/CrackMe%20with%20password/README.md) |
| **[EasiestEver](./crackmes/EasiestEver)** | Basic control flow and password check bypass. | Static Analysis | [Writeup](./crackmes/EasiestEver/README.md) |
| **[crackc_by_pride](./crackmes/crackc_by_pride)** | Analyzing C-style string comparison flow. | Decompiler | [Writeup](./crackmes/crackc_by_pride/README.md) |
| **[CrackMe_V3_Marquire](./crackmes/CrackMe_V3_Marquire)** | Logic reconstruction and memory comparison check. | Ghidra | [Writeup](./crackmes/CrackMe_V3_Marquire/README.md) |
| **[my first crackme](./crackmes/my%20first%20crackme)** | Reviewing static validation checks. | Static Analysis | [Writeup](./crackmes/my%20first%20crackme/README.md) |

---

### 💣 [pwnable.kr](./pwnable.kr)
> Exploiting memory safety issues and logical errors on Linux-based CTF wargames.

| Challenge | Vulnerability / Exploit Focus | Solved With | Solution / Writeup |
| :--- | :--- | :---: | :---: |
| **[fd](./pwnable.kr/fd)** | Linux File Descriptors hijacking (`stdin` redirection) in C. | C logic review | [Writeup](./pwnable.kr/fd/README.md) |
| **[collision](./pwnable.kr/collision)** | Hash collision vulnerability (calculating unsigned int sums in memory). | Python math | [Writeup](./pwnable.kr/collision/README.md) |
| **[bof](./pwnable.kr/bof)** | Stack buffer overflow overwriting adjacent local variable checks. | Python / pwntools | [Writeup](./pwnable.kr/bof/README.md) |
| **[flag](./pwnable.kr/flag)** | Decompressing and unpacking UPX-packed binaries to reverse statically-linked code. | UPX / GDB | [Writeup](./pwnable.kr/flag/README.md) |
| **[passcode](./pwnable.kr/passcode)** | Memory corruption via GOT (Global Offset Table) overwrite. | GDB / pwntools | [Writeup](./pwnable.kr/passcode/README.md) |
| **[random](./pwnable.kr/random)** | Weak pseudo-random number generator exploiting predictable seeds. | C static analysis | [Writeup](./pwnable.kr/random/README.md) |
| **[input](./pwnable.kr/input)** | Argument parsing, piping stdin/stderr, socket programming, env variables, and signals. | Python socket / subprocess | [Solve Script](./pwnable.kr/input/solve.py) / [Writeup](./pwnable.kr/input/README.md) |
| **[leg](./pwnable.kr/leg)** | Reading ARM assembly program counter (PC) register offsets. | ARM register math | [Writeup](./pwnable.kr/leg/README.md) |

---

### 💻 [x86-Assembly](./x86-Assembly)
> Bare-metal x86 and x86_64 Assembly programs built from scratch.

| Project | Assembly Concepts covered | Primary File |
| :--- | :--- | :---: |
| **[Conditions-and-jumping](./x86-Assembly/Conditions-and-jumping)** | Branching logic and conditional jumps (`cmp`, `je`, `jne`, `jg`, `jl`). | [Source Code](./x86-Assembly/Conditions-and-jumping/jumping.asm) |
| **[calculator](./x86-Assembly/calculator)** | Basic arithmetic registers, division, and system calls. | [Source Code](./x86-Assembly/calculator/calculator.asm) |
| **[exabyte](./x86-Assembly/exabyte)** | Register sizing, quadword manipulation, and byte ordering layouts. | [Source Code](./x86-Assembly/exabyte/exabyte.asm) |
| **[hello world](./x86-Assembly/hello%20world)** | Boilerplate NASM file structure and write system call. | [Source Code](./x86-Assembly/hello%20world/hello.asm) |
| **[kick](./x86-Assembly/kick)** | General register move instructions and execution flow control. | [Source Code](./x86-Assembly/kick/kicking.asm) |
| **[move](./x86-Assembly/move)** | Register-to-memory moving operations (`mov`). | [Source Code](./x86-Assembly/move/move.asm) |
| **[project](./x86-Assembly/project)** | NASM project configuration, custom debug outputs, and Makefiles. | [Source Code](./x86-Assembly/project/project.asm) |

---

## 🛠️ The Reverse Engineer's Toolbox

These are the primary tools used throughout the solutions in this repository:

| Tool Category | Software / Libraries | Description |
| :--- | :--- | :--- |
| **Decompilers / Disassemblers** | **Ghidra**, **IDA Pro**, **radare2 / Cutter** | Static binary code analysis, structure recovery, and control flow analysis. |
| **Debuggers** | **GDB** + `pwndbg` / `gef` | Dynamic analysis, stack tracing, memory inspection, and register tracking. |
| **Exploitation** | **pwntools** (Python 3) | Writing robust exploit scripts, interactively piping sockets, and shellcode packing. |
| **Low-Level Tools** | **nasm**, **gcc**, **make**, **checksec**, **UPX** | Writing, building, securing, and unpacking binaries. |

---
s
