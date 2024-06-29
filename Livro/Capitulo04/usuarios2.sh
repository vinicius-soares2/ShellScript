#!/bin/bash

MENSAGEM_USO="
USO: $0 [-h]

-h  MOSTRA TELA DE AJUDA
"
#tratamento de opcoes
if test "$1" = "-h"
then
    echo "$MENSAGEM_USO"
exit 0
elif test "$1" = "-V"
then
	#Mostra a versao do programa 
	echo "-V Versao do programa"
	#...
fi

# processamento
cut -d : -f 1,5 /etc/passwd | tr : \\tr
