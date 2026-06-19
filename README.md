# ⚡ REVERSE ENGINEERING & BINARY EXPLOITATION ⚡

Welcome to my personal repository of **Reverse Engineering (RE)**, **Binary Exploitation (Pwn)**, and **Low-Level Assembly** work. This repo houses writeups, custom scripts, source code, and keygens from various CTFs, wargames, and reversing challenges.

---

## 📊 Repository Quick Stats

| Category | Solved / Total | Status | Badges |
| :--- | :---: | :---: | :--- |
| **[ROP Emporium](./ROP-Emporium)** | `4 / 8` | In Progress | [![ROP Emporium](https://img.shields.io/badge/ROP_Emporium-4_/_8_Solved-brightgreen?style=flat-square&logo=c&logoColor=white)](./ROP-Emporium) |
| **[crackmes.one](./crackmes)** | `13 / 13` | Completed | [![crackmes.one](https://img.shields.io/badge/crackmes.one-13_Solved-blue?style=flat-square&logo=python&logoColor=white)](./crackmes) |
| **[pwnable.kr](./pwnable.kr)** | `8 / 8` | Completed | [![pwnable.kr](https://img.shields.io/badge/pwnable.kr-8_Solved-orange?style=flat-square&logo=linux&logoColor=white)](./pwnable.kr) |
| **[x86 Assembly](./x86-Assembly)** | `7 / 7` | Completed | [![x86-Assembly](https://img.shields.io/badge/x86--Assembly-7_Projects-blueviolet?style=flat-square&logo=assemblyscript&logoColor=white)](./x86-Assembly) |

---

## 🗂️ Challenge Index

### 🛠️ [ROP Emporium](./ROP-Emporium)
> Return-Oriented Programming (ROP) challenges designed to master the craft of ROP chain construction on x86_64 architectures.
* 🏁 **[ret2win](./ROP-Emporium/ret2win)** — Stack overflow to control RIP and return directly to a hidden success function.
* 🏁 **[split](./ROP-Emporium/split)** — Crafting a basic ROP chain to point a command-execution register to `/bin/cat flag.txt`.
* 🏁 **[callme](./ROP-Emporium/callme)** — Setting up registers to sequentially invoke multiple functions with precise multi-argument signatures.
* 🏁 **[write4](./ROP-Emporium/write4)** — Utilizing arbitrary-write gadgets to write critical strings to writable sections (`.data` / `.bss`) before launching commands.

### 🔓 [crackmes.one](./crackmes)
> Reverse engineering challenges focusing on static/dynamic analysis, cryptographic reversing, anti-debugging, and writing key generators.
* 🧠 **[Adversarial Mind](./crackmes/Adversarial%20Mind)** — Identifying and bypassing an AI-honeypot prompt injection trap to locate the raw password.
* 🧠 **[keygenme](./crackmes/keygenme)** — Analyzing custom hashing and bit-shifting routines to construct a complete key generator in Python ([keygen.py](./crackmes/keygenme/keygenme.py)).
* 🧠 **[CrackMeBaby2](./crackmes/CrackMeBaby2)** — Deep dive writeup analyzing password logic checks.
* 🧠 **[FirstCrackMe](./crackmes/FirstCrackMe)** — Initial entry-level reverse engineering challenge.
* 🧠 **[lafarges_crackme_2](./crackmes/lafarges_crackme_2)** — Working with Windows PE reverse engineering.
* 🧠 **[first golang crackme](./crackmes/first%20golang%20crackme)** — Disassembling and decompiling Go's unique calling conventions and runtime structures.
* 🧠 **More Challenges:** [easy_reverse](./crackmes/easy_reverse), [basik](./crackmes/basik), [CrackMe with password](./crackmes/CrackMe%20with%20password), [EasiestEver](./crackmes/EasiestEver), [crackc_by_pride](./crackmes/crackc_by_pride), [CrackMe_V3_Marquire](./crackmes/CrackMe_V3_Marquire), [my first crackme](./crackmes/my%20first%20crackme).

### 💣 [pwnable.kr](./pwnable.kr)
> Exploiting memory safety issues and logical errors on Linux-based CTF wargames.
* 💥 **[fd](./pwnable.kr/fd)** — Exploiting file descriptors (`stdin`, `stdout`, `stderr`) in C.
* 💥 **[collision](./pwnable.kr/collision)** — Calculating raw integer hash collisions to pass verification checks.
* 💥 **[bof](./pwnable.kr/bof)** — Simple stack buffer overflow hijacking a variable compare check.
* 💥 **[flag](./pwnable.kr/flag)** — Decompressing and unpacking UPX-packed binaries to reverse statically-linked functions.
* 💥 **[passcode](./pwnable.kr/passcode)** — Utilizing stack variables to overwrite a function's Global Offset Table (GOT) entry.
* 💥 **[random](./pwnable.kr/random)** — Explaining and defeating predictable random number seeds.
* 💥 **[input](./pwnable.kr/input)** — A multi-stage challenge requiring socket programming, process piping, signal handling, and environment spoofing ([solve.py](./pwnable.kr/input/solve.py)).
* 💥 **[leg](./pwnable.kr/leg)** — Decoding ARM assembly instruction pipeline behavior (PC register offsets).

### 💻 [x86-Assembly](./x86-Assembly)
> Bare-metal x86 and x86_64 Assembly programs built from scratch.
* 📝 **[Conditions and jumping](./x86-Assembly/Conditions-and-jumping)** — Branching logic, loops, and comparison instructions.
* 📝 **[calculator](./x86-Assembly/calculator)** — Simple CLI calculator handling operations in assembly.
* 📝 **[exabyte](./x86-Assembly/exabyte)** — Register sizing, byte ordering, and stack layouts.
* 📝 **[hello world](./x86-Assembly/hello%20world)** — Boilerplate NASM structure.
* 📝 **[kick](./x86-Assembly/kick) & [move](./x86-Assembly/move)** — Low-level register copy operations and compiling with Makefiles.
* 📝 **[project](./x86-Assembly/project)** — General assembly sandbox.

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

## 🚀 Getting Started

If you want to run or test these exploits locally:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/kant/re.git
   cd re
   ```

2. **Run a solve script:**
   For example, to run the pwnable.kr input script:
   ```bash
   cd pwnable.kr/input
   python3 solve.py
   ```

3. **Compile Assembly Projects:**
   Go to any Assembly folder and run `make`:
   ```bash
   cd x86-Assembly/calculator
   make
   ./calculator
   ```

---

> [!NOTE]
> All binary exploitation, assembly, and reversing tasks are completed strictly for educational and self-improvement purposes.

```
       [+] Made with 💻 and ☕ by Kant [+]
```
