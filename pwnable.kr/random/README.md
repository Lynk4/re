# RANDOM


----------------------

SOURCE CODE:
random.c
```c
#include <stdio.h>

int main(){
	unsigned int random;
	random = rand();	// random value!

	unsigned int key=0;
	scanf("%d", &key);

	if( (key ^ random) == 0xdeadbeef ){
		printf("Good!\n");
		system("/bin/cat flag");
		return 0;
	}

	printf("Wrong, maybe you should try 2^32 cases.\n");
	return 0;
}
```
---

The rand() function is used to generate the random value, but it is not cryptographically secure.

---

compile this code.........
```c
#include <stdio.h>

int main(){
	unsigned int random;
	random = rand();	// random value!
  printf("%u",random^0xdeadbeef);
	return 0;
}
```


---
```bash
ls
flag  random  random.c
./random
3039230856
Good!
Mommy, I thought libc random is unpredictable...

```
----------------------------------------------
