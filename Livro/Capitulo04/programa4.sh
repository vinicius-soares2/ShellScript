#!/bin/bash

#
# Versão 1: Programa sobre escolha
while getopts ":j:x:e" opcao
do
	case $opcao in
	j)
		echo "Opcao 'J' Jade Leigh Foi Ativada: $OPTARG"
	;;
	x)
		echo "Opcao 'X' Xo Bunny Foi Ativada: $OPTARG"
	;;
	e)
		echo "Opcao 'E' Ellie Idol Foi Ativada: $OPTARG"
	;;
	:)
		echo "OPCAO $OPTARG requer um argumento."
	;;
	?)
		echo "OPCAO INVALIDA $OPTARG"
	;;
	esac
done
shift $((OPTIND -1))
echo "Argumentos Passados: $@"
