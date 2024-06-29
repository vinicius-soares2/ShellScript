#!/bin/bash

#usuarios7.sh
#
# Mostra os login e nomes de usuarios do sistema
# Obs.: Lê dados do arquivo /etc/passwd
#
# Versão 1: Mostra os usuarios e nomes separados por TAB
# Versão 2: Adicionado suporte á opção -h
# Versão 3: Adicionado suporte á opção -V e opções invalidas
# Versão 4: Arumado bug quando não tem opções , basename no 
#	    Nome do programa, -V extraindo direto dos cabeçalho, 
#	    Adicionadas opções  --help e --version
# Versão 5: Adicionadas opções -s e --sort
# Versão 6: Adicionadas opções -r , --reverse, -u, --uppercase,
#	    Leitura de multiplas opções (loop)
# Versão 7: Melhorias no codigo para que fique mais legivel,
#	    Adicionas opções -d e --delimiter			
# Versçao 7g: Modificado para usar o getops
#
#Vinicius, Julho de 2024
#

ordenar=() 
inverter=()
maiusculas=()
delim='\t'

MENSAGEM_USO="
USO: $(basename "$0") [OPCAO]

OPCOES:

-d C	Usa o caractere C como delimitador
-r	Inverte a listagem
-s	Ordena a listagem
-u	Monstra a listagem em MAIÚSCULAS

-h	Mostra esta tela de ajuda
-V	Mostra a versao do programa
"
#Tratamento de opcoes de linha de comando
while getopts ":hVd:rsu" opcao
do
	case "$opcao" in
		#opcões que ligam/desligam chaves
		s) ordenar=1 ;;
		r) inverter=1 ;;
		u) maiusculas=1 ;;
		
		d)
			delim="$OPTARG"
		;;
		h)
			echo "$MENSAGEM_USO"
			exit 0
		;;
		V)
			echo -n $(basename "$0")
			# Extrai a versão diretamente dos cabeçalho do programa
			grep '^# Versão ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
			exit 0
		;;
	       \?)
			echo "OPÇÂO INVALIDA: $OPTARG"
			exit 1
		;;
		:)
			echo "Faltou argumento para: $OPTARG"
			exit 1
		;;
	esac
done

# Extrai a listagem
lista=$(cut -d : -f 1,5 /etc/passwd)

# Ordena, inverte ou converte para maiúsculas (se necessario)
test "$ordenar" = 1 && lista=$(echo "$lista" | sort)
test "$inverter" = 1 && lista=$(echo "$lista" | tac)
test "$maiusculas" = 1 && lista=$(echo "$lista" | tr a-z A-Z)

# Mostra o resultado para o usuario
echo "$lista" | tr : "$delim"

