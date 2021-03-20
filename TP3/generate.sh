if [ ! -f "src/scanner.c" ]; then
    flex flex-files/scanner.l
    mv scanner.c scanner.h src/
fi

if [ ! -d "bin" ]; then
    mkdir bin
fi

if [ ! -f "execute.sh" ]; then
    touch execute.sh
    echo "bin/main < entrada.txt > bin/salida.txt" > execute.sh
    chmod -u=rwx execute.sh
fi

gcc -Wall -o bin/main src/main.c src/scanner.c -lfl

exit 0