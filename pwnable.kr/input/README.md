
---

```bash
input2@pwnable:/tmp/test$ ln -s /home/input2/flag flag
input2@pwnable:/tmp/test$ ls
flag
input2@pwnable:/tmp/test$ cat flag
cat: flag: Permission denied
input2@pwnable:/tmp/test$ nano solve.py
Unable to create directory /home/input2/.nano: Permission denied
It is required for saving/loading search history or cursor positions.

Press Enter to continue

input2@pwnable:/tmp/test$ python solve.py
[+] Starting local process '/home/input2/input': pid 142216
[+] Opening connection to localhost on port 5555: Done
[*] Switching to interactive mode
Welcome to pwnable.kr
Let's see if you know how to give input to program
Just give me correct inputs then you will get the flag :)
Stage 1 clear!
Stage 2 clear!
Stage 3 clear!
Stage 4 clear!
Stage 5 clear!
[*] Process '/home/input2/input' stopped with exit code 0 (pid 142216)
Mommy! I learned how to pass various input in Linux :)
Exception in thread Thread-3:
```

---

