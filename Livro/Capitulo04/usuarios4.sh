#!/bin/bash

#usuarios4.sh
#
# Mostra os login e nomes de usuarios do sistema
# Obs.: Lê dados do arquivo /etc/passwd
#
# Versão 1: Mostra os usuarios e nomes separados por TAB
# Versão 2: Adicionado suporte á opção -h
# Versão 3: Adicionado suporte á opção -V e opções invalidas
# Versão 4: Arumado bug quando não tem opções , basename no nome do programa, -V extraindo direto dos cabeçalho, adicionadas opções  --help e --version
#
#Vinicius, Julho de 2024
#
ordenar=()
MENSAGEM_USO="
USO: $(basename "$0") [-h | -V]

-h, --help Mostra esta tela de ajuda
-V, --version Mostra esta tela da versão
"
#Tratamento das opções de linha de comando
case "$1" in
	-s | --sort)
		ordenar=1
	;;

	-h | --help)
		echo "$MENSAGEM_USO"
		exit 0
	;;
	-V | --version)
		echo -n $(basename "$0")
		#Extra a versao diretamente dos cabeçalho do programa
		grep '^# Versão ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
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
#if test "$ordenar" = 1
#then
#	cut -d : -f 1,5 /etc/passwd | tr : \\t | sort
#	# Ordena  a listagem
#else
#	cut -d : -f 1,5 /etc/passwd | tr : \\t
	
#fi

#extra a listagem
lista=$(cut -d : -f 1,5 /etc/passwd)

#ordena a listagem (se necessario)
if test "$ordenar" = 1
then
	lista=$(echo "$lista" | sort)
fi
#mostra o resultado pro usuario
echo "$lista" | tr : \\t
# Processamento
#cut -d : -f 1,5 /etc/passwd | tr : \\t 
