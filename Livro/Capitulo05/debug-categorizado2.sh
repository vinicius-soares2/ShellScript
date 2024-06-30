#!/bin/bash
# debug-categorizado2.sh
#
# Exemplo de Debug categorizado em três niveis
DEBUG=${1:-0}	# Passe o nivel pelo $1

Debug(){
	[ $1 -le $DEBUG ] || return
	local prefixo
	case "$1" in
		1)prefixo="-- ";;
		2)prefixo="---- ";;
		3)prefixo="------ ";;
		*) echo "mensagem nao categorizada: $*"; return;;
	esac
	shift
	echo $prefixo$*

}


