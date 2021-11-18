
#EXEEXT=.exe
EXEEXT=

CC			=gcc$(EXEEXT)
#CP			=cp
RM			=rm -f
#AR			=ar
#ARFLAGS		=cr
#RANLIB		=ranlib

#CFLAGS+=-g -O2
#static link
CFLAGS+=-Wall -D_GNU_SOURCE -static
LDFLAGS =`pkg-config --libs popt`
LDFLAGS+=-s

PROGS=getkey$(EXEEXT)

all: clean $(PROGS)

getkey$(EXEEXT): getkey.o
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)  -lpopt

#getkey:
#	$(CC) $(CFLAGS) $(LDFLAGS) getkey.c
	#-o getkey.exe
	#gcc $(CFLAGS) $(LDFLAGS) getkey.c -o getkey.exe
	#gcc -g -O2 -Wall -D_GNU_SOURCE -DWIN32 -lpopt getkey.c -o getkey.exe
#poll.o: poll.c
#	$(CC) $(CFLAGS) $(LDFLAGS) -o $@

clean:
	$(RM) -f $(PROGS) *.o

PHONE: all clean
