#!/bin/bash

#usuarios6.sh
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
#			
#Vinicius, Julho de 2024
#
ordenar=() # A saida devera ser ordenada?
inverter=() # A Saida devera ser invertida?
maiusculas=() #A saida devera ser em maiuscula?

MENSAGEM_USO="
USO: $(basename "$0") [OPÇÕES]

OPÇÔES:
	-r, --reverse	Inverte a listagem
	-s, --sort	Ordena a listagem alfabeticamente
	-u, --uppercase	Mostra a listagemem MAIÙSCULAS

	-h, --help	Mosta esta tela de ajuda
	-V, --version	Mostra a versaodo programa
"
# Tratamento das opções de linha de comando
while test -n "$1"
do
	case "$1" in
		-s | --sort)
			ordenar=1
		;;
		
		-r | --reverse)
			inverter=1
		;;
		
		-u | --uppercase)
			maiusculas=1
		;;
		-h | --help)
			echo "$MENSAGEM_USO"
			exit 0
		;;
		-V | --version)
			echo -n $(basename "$0")
			# Extrai a versão diretamente dos cabeçalho do programa
			grep '^# Versão' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
			exit 0
		;;
		*)
			echo "Opção Invalida: $1"
			exit 1
		;;
	esac
	#Opção $1 já processada, a fila deve andar
	shift
done
# Extrai a listagem
lista=$(cut -d -f 1,5 /etc/passwd)

#Ordena a listagem (se necessario)
if test "$ordenar" = 1
then
	lista=$(echo "$lista" | sort)
fi

#Inverte a listagem (se necessario)
if test "$inverter" = 1
then
	lista=$(echo "$lista" | tac)
fi

#Converte para Maiúscula (se necessario)
if test "$maisculas" = 1
then
	lista=$(echo "$lista" | tr a-z A-Z)
fi

#Mostra o resultado para o usuario
echo "$lista" | tr : \\t
