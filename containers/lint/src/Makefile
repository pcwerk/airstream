
# basic compile

FLAGS=-Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow -Wconversion -Werror

default: app
app:
	$(CC) -c $(FLAGS) main.c
	$(CC) -o app main.o	

clean:
	/bin/rm -f main.o

squeaky: clean
	/bin/rm -f app
