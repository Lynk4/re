# Easy Crack

---

Challenge : [http://reversing.kr/challenge.php](http://reversing.kr/challenge.php)

**Solving Easy_CrackMe with x64dbg**

> **Important:** This file is **32-bit** (`PE32`, Intel 80386). Use **x32dbg** (included with the x64dbg package), not the 64-bit debugger. The steps are the same; only the executable name differs.
> 

## **Phase 1 -  Run it and understand the goal**

1. Open **x32dbg**.
2. **File → Open** → select `Easy_CrackMe.exe`.
3. Press **F9** (Run). A dialog appears asking for a password.
4. Type anything (e.g. `test`) and click the button.
5. You get **“Incorrect Password”** → the app compares your input to a hidden value. Your job is to find that value in the debugger.

---

## **Phase 2  Find where validation happens (strings)**

1. In x32dbg, with the program paused or running, open the **CPU** tab.
2. Right-click in the disassembly → **Search for → All modules → String references**(or **Ctrl+N** in some builds, or use the **References** pane).
3. Search / scroll for:
    - `Incorrect Password`
    - `Congratulation !!`
4. Double-click **`Incorrect Password`**. You land in code that uses that string — usually the **failure** path of the check.
5. Scroll **up** a bit in the same function. You should see conditional jumps (`je`, `jne`, `jnz`, etc.) that decide success vs failure.

You’ve found the **validation function** (around **`00401080`** in this binary).

![Screenshot 2026-06-19 at 12.27.13 PM.png](Easy%20Crack/Screenshot_2026-06-19_at_12.27.13_PM.png)

---

## **Phase 3 — Break when your input is read (API breakpoint)**

Static strings tell you *where* checking happens; an API breakpoint tells you *when* your typed password is in memory.

1. **Ctrl+G** → type **`GetDlgItemTextA`** → Enter (go to the import / IAT entry).
2. Press **F2** on the **`call GetDlgItemTextA`** (or set breakpoint on the API in the **Symbols** tab under `user32`).
3. **F9** to run the dialog again.
4. Type a test password, click the button.
5. The debugger breaks **inside or right after** `GetDlgItemTextA`.

After the call returns, your password sits in a **buffer on the stack**. That’s what you need to follow next.

![Screenshot 2026-06-19 at 12.29.51 PM.png](Easy%20Crack/Screenshot_2026-06-19_at_12.29.51_PM.png)

---

## **Phase 4 - Map the buffer layout (stack variables)**

1. When broken after `GetDlgItemTextA`, note **ESP** (stack pointer) in the registers pane.
2. In the **Stack** window, look at bytes starting near **`[esp+4]`**, **`[esp+5]`**, **`[esp+8]`**, etc.
3. Your test string should appear there (e.g. if you typed `test`, you’ll see `74 65 73 74` = `test`).

In IDA-style decompilation of this crackme, the layout is effectively:

| **Stack offset** | **Role** |
| --- | --- |
| `[esp+4]` | 1st character of password |
| `[esp+5]` | 2nd character |
| `[esp+6]` | 3rd character |
| … | … |

**Tip:** In x32dbg, right-click the stack address → **Follow in Dump** to see the string clearly as ASCII.

---

## **Phase 5 - Step through each check (this is the core skill)**

From the code after `GetDlgItemTextA`, single-step with **F8** (Step over) and watch each comparison.

You’ll see a pattern like this (addresses may vary slightly, logic is the same):

### **Check 1 - 2nd character must be `'a'`**

```bash
004010AA | FF15 9C504000            | call dword ptr ds:[<GetDlgItemTextA>]   |
004010B0 | 807C24 05 61             | cmp byte ptr ss:[esp+5],61              | 61:'a'
004010B5 | 75 7E                    | jne easy_crackme.401135                 |
```

![Screenshot 2026-06-19 at 12.34.10 PM.png](Easy%20Crack/Screenshot_2026-06-19_at_12.34.10_PM.png)

**What you learn:** password[1] = **`a`**

---

### **Check 2 - next two chars must be `"5y"` (case-insensitive)**

```bash
004010B7 | 6A 02                    | push 2                                  |
004010B9 | 8D4C24 0A                | lea ecx,dword ptr ss:[esp+A]            |
004010BD | 68 78604000              | push easy_crackme.406078                | 406078:"5y"
004010C2 | 51                       | push ecx                                |
004010C3 | E8 88000000              | call easy_crackme.401150                |
```

![Screenshot 2026-06-19 at 12.34.53 PM.png](Easy%20Crack/Screenshot_2026-06-19_at_12.34.53_PM.png)

**What you learn:** password[2..3] = **`5y`**

In the **Dump**, follow the pushed pointer and confirm it compares against the literal **`5y`** in memory.

---

### **Check 3 — from 5th character onward must be `"R3versing"`**

Hand-rolled loop or `strcmp`:

```bash
004010CF | 53                       | push ebx                                |
004010D0 | 56                       | push esi                                |
004010D1 | BE 6C604000              | mov esi,easy_crackme.40606C             | 40606C:"R3versing"
004010D6 | 8D4424 10                | lea eax,dword ptr ss:[esp+10]           |
004010DA | 8A10                     | mov dl,byte ptr ds:[eax]                |
004010DC | 8A1E                     | mov bl,byte ptr ds:[esi]                |
```

![Screenshot 2026-06-19 at 12.36.13 PM.png](Easy%20Crack/Screenshot_2026-06-19_at_12.36.13_PM.png)

**What you learn:** starting at index 4: **`R3versing`** 

---

### **Check 4 - 1st character must be `'E'`**

```bash
00401109 | 85C0                     | test eax,eax                            |
0040110B | 75 28                    | jne easy_crackme.401135                 |
0040110D | 807C24 04 45             | cmp byte ptr ss:[esp+4],45              | 45:'E'
00401112 | 75 21                    | jne easy_crackme.401135                 |
```

![Screenshot 2026-06-19 at 12.51.17 PM.png](Easy%20Crack/Screenshot_2026-06-19_at_12.51.17_PM.png)

Combine what each check told you:

| **Index** | **Char** | **Source** |
| --- | --- | --- |
| 0 | `E` | 1st char check |
| 1 | `a` | 2nd char check |
| 2–3 | `5y` | strnicmp |
| 4+ | `R3versing` | strcmp loop |

Concatenate:

```bash
E + a + 5y + R3versing  →  Ea5yR3versing
```

---

## **Phase 7 - Verify in the debugger (optional but good practice)**

1. **F9** run again (or restart: **Ctrl+F2**, then **F9**).
2. Enter **`Ea5yR3versing`** in the dialog.
3. If you still have a breakpoint on the check function, step through — every `cmp` / `jne` should **not** jump to the failure path.
4. You should hit the path that pushes **`Congratulation !!`** and get the success message box.

![Screenshot 2026-06-19 at 12.52.38 PM.png](Easy%20Crack/Screenshot_2026-06-19_at_12.52.38_PM.png)

---