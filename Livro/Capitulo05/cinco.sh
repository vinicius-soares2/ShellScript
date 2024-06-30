#!/bin/bash
# cinco.sh
#
# Conta até cinco :)

set -v		# Liga o debug de linhas
echo $((0+1))
echo $((0+2))
set +v		# Desliga o debug de linha
echo $((0+3))
set -x 		# Liga o debug de comandos
echo $((0+4))
echo $((0+5))
set +x		# Desliga o debug de comandos
