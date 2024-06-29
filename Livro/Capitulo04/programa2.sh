#!/bin/bash

MENSAGEM="
USO: $0 [-v]

-v:  Mostra a versão do programa.

"
if test "$1" = "-v"
then
	echo "$MENSAGEM"
exit 0
fi


