from pwn import *
import os
#stage 1
args = ['A']*100
args[65] = '\x00'
args[66] = '\x20\x0a\x0d'

args[67] = '5555'

r1,w1 = os.pipe()
r2,w2 = os.pipe()
# stage 2
os.write(w1,'\x00\x0a\x00\xff')
os.write(w2,'\x00\x0a\x02\xff')

#stage 3
en = {'\xde\xad\xbe\xef':'\xca\xfe\xba\xbe'}

#stage 4
with open('\x0a','w') as f:
	f.write('\x00\x00\x00\x00')
	
p = process(executable='/home/input2/input',argv=args,stdin=r1,stderr=r2,env=en)


conn = remote('localhost',5555)
conn.sendline('\xde\xad\xbe\xef')
p.interactive()


