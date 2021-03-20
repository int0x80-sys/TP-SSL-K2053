EXECUTE="if [ -z \\\$2 ];then
    echo  \\\"Ejecute: .\\execute.sh [Entrada] [Salida] ...\\\"
else
    if [ ! -f \\\$1 ]; then
        echo \\\"No existe la entrada \\\$1..\\\"
    else
        bin/main < \\\$1 > bin/\\\$2
    fi
fi"

COMPILE="EXECUTE=\"$EXECUTE\"
if [ ! -f \"execute.sh\" ]; then
    touch execute.sh
    echo \"\$EXECUTE\" > execute.sh
    chmod -u=rwx execute.sh
fi

if [ ! -d \"bin\" ]; then
    mkdir bin
fi

gcc -Wall -o bin/main src/main.c src/scanner.c src/parser.c -lfl"


if [ ! -f "compile.sh" ];then
    touch compile.sh
    echo "$COMPILE" > compile.sh
    chmod -u=rwx compile.sh
fi

flex flex-bison/scanner.l
bison flex-bison/parser.y

if [ -f "src/parser.*" ];then
    rm -rf src/parser.*
fi

if [ -f "src/scanner.* " ];then
    rm -rf src/scanner.*
fi

mv scanner.* parser.* src/
