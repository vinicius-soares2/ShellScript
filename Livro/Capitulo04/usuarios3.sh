#!/bin/bash
#usuarios333.sh
#
# Mostra os logins e nomes de usuario do sistema
# Obs.:Lê dados de arquivo /etc/passwd
#
# Versão 1: Mostra o usuario e nomes separados por TAB
# Versão 2: Adicionado suporte a opcão -h
# Versão 3: Adicionado suporte a opcão -V e opções invalidas

#Vinicius, Julho de 2024
#

MENSAGEM_USO="
Uso: $(basename "$0") [-h | -V]
#Uso: $0 [-h | -V] 

-h Mostra esta de ajuda e sai
-V Mostra a versão do programa e sai
"
# Tratamento das opcões de linha de comando
case "$1" in
-h | --help)
	echo "$MENSAGEM_USO"
	exit 0
;;

-V | --version)
	echo $0 Versão 3
	exit 0
;;

*)
	if test -n "$1"
	then
		echo "Opção Invalida: $1"
		exit 1
	fi
;;
esac

# Processamento
cut -d : -f 1,5 /etc/passwd | tr : \\t
