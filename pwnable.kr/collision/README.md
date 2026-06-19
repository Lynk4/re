# collision
---

```
ssh col@pwnable.kr -p2222
col@pwnable.kr's password: 
 ____  __    __  ____    ____  ____   _        ___      __  _  ____  
|    \|  |__|  ||    \  /    ||    \ | |      /  _]    |  |/ ]|    \ 
|  o  )  |  |  ||  _  ||  o  ||  o  )| |     /  [_     |  ' / |  D  )
|   _/|  |  |  ||  |  ||     ||     || |___ |    _]    |    \ |    / 
|  |  |  `  '  ||  |  ||  _  ||  O  ||     ||   [_  __ |     \|    \ 
|  |   \      / |  |  ||  |  ||     ||     ||     ||  ||  .  ||  .  \
|__|    \_/\_/  |__|__||__|__||_____||_____||_____||__||__|\_||__|\_|
                                                                     
- Site admin : daehee87@khu.ac.kr
- irc.netgarage.org:6667 / #pwnable.kr
- Simply type "irssi" command to join IRC now
- files under /tmp can be erased anytime. make your directory under /tmp
- to use peda, issue `source /usr/share/peda/peda.py` in gdb terminal
ls -la
total 36
drwxr-x---   5 root    col     4096 Oct 23  2016 .
drwxr-xr-x 116 root    root    4096 Oct 30  2023 ..
d---------   2 root    root    4096 Jun 12  2014 .bash_history
dr-xr-xr-x   2 root    root    4096 Aug 20  2014 .irssi
drwxr-xr-x   2 root    root    4096 Oct 23  2016 .pwntools-cache
-r-sr-x---   1 col_pwn col     7341 Jun 11  2014 col
-rw-r--r--   1 root    root     555 Jun 12  2014 col.c
-r--r-----   1 col_pwn col_pwn   52 Jun 11  2014 flag
./col 
\xC8\xCE\xC5\x06\xC8\xCE\xC5\x06\xC8\xCE\xC5\x06\xC8\xCE\xC5\x06\xCC\xCE\xC5\x06
passcode length should be 20 bytes
./col 
\xC8\xCE\xC5\x06\xC8\xCE\xC5\x06\xC8\xCE\xC5\x06\xC8\xCE\xC5\x06\xCC\xCE\xC5\x06
passcode length should be 20 bytes
printf 
'\xC8\xCE\xC5\x06\xC8\xCE\xC5\x06\xC8\xCE\xC5\x06\xC8\xCE\xC5\x06\xCC\xCE\xC5\x06' 
> payload.txt
bash: payload.txt: Permission denied
printf 
'\xC8\xCE\xC5\x06\xC8\xCE\xC5\x06\xC8\xCE\xC5\x06\xC8\xCE\xC5\x06\xCC\xCE\xC5\x06' 
> /tmp/payload.txt
./col $(cat /tmp/payload.txt)
daddy! I just managed to create a hash collision :)

```

