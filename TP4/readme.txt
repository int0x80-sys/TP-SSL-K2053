--------------TP4--------------------------

*Para crear los fuentes de C del scanner y el parser:
    ./configure.sh

*En caso de que no puedan ejecutar configure por los permisos:
    chmod -u=rwx configure.sh
    ./configure.sh

*configure.sh genera otro script para compilar los fuentes de C:
    ./compile.sh

*compile.sh genera otro script para ejecutar el programa. Ejecutar el script y pasarle el archivo de entrada y el nombre de la salida, que se va a guardar en la carpeta bin:
    ./execute.sh [Entrada] [Salida]