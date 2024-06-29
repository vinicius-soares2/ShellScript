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
#Vinicius, Julho de 2024
#

ordernar=() # A saida deverá ser ordenada?
inverter=() # A saida devera ser invertida?
maiusculas=() #Caractere usado como delimitado de saida
delim='\t'

MENSAGEM_USO="
USO: $(basename "$0") [OPÇÔES]

OPÇÔES:
	-d, --delimiter C	Usa o caractere C como delimitador
	-r, --reverse	Inverte a listagem
	-s, --sort	Ordena a listagem alfabeticamente
	-u, --uppercase	Mostra a listagem em MAISCÚLAS

	-h, --help	Mostra esta tela de ajuda
	-V, --version	Mostra a versão do programa
"
# Tratamento das opções de linha de comando
while test -n "$1"
do
	case "$1" in
	
		#Opções que ligam/desligam chaves
		-s | --sort	) ordenar=1 ;;
		-r | --reverse	) inverter=1 ;;
		-u | --uppercase) maiusculas=1 ;;
		
		-d | --delimiter)
			shift
			delim="$1"

			if test -z "$delim"
			then 
				echo "Faltou o argumento para a -d"
				exit 1
			fi
		;;

		-h | --help)
			echo "$MENSAGEM_USO"
			exit 0
		;;

		-V | --version)
			echo -n $(basename "$0")
			# Extrai a versão diretamente dos cabeçalho do programa
			grep '^# Versão ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
			exit 0
		;;

		*)
			echo "Opçâo Invalida: $1"
			exit 1
		;;
	esac		
	#Opção $1 já processadam a fila deve andar
	shift
done

# Extrai a listagem
lista=$(cut -d : -f 1,5 /etc/passwd)

# Ordena, inverte ou converte para maiúsculas (se necessario)
test "$ordenar" = 1 && lista=$(echo "$lista" | sort)
test "$inverter" = 1 && lista=$(echo "$lista" | tac)
test "$maiusculas" = 1 && lista=$(echo "$lista" | tr a-z A-Z)

# Mostra o resultado para o usuario
echo "$lista" | tr : "$delim"
