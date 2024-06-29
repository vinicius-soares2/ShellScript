#!/bin/bash

#usuarios5.sh
#
# Mostra os login e nomes de usuarios do sistema
# Obs.: Lê dados do arquivo /etc/passwd
#
# Versão 1: Mostra os usuarios e nomes separados por TAB
# Versão 2: Adicionado suporte á opção -h
# Versão 3: Adicionado suporte á opção -V e opções invalidas
# Versão 4: Arumado bug quando não tem opções , basename no nome do programa, -V extraindo direto dos cabeçalho, adicionadas opções  --help e --version
# Versão 5: Adicionadas opções -s e --sort
#
#Vinicius, Julho de 2024
#
ordenar=() # A saida deveraser ordenada?
MENSAGEM_USO="
Uso: $(basename "$0") [-h | -V | -s]

	-s, -- sort 	Ordena a listagem alfabeticamente
	-h, --help	Mostra esta tela de ajuda
	-V, --version	Mostra a versão do programa
"
#Tratamento das opções de linha de comando 
while test -n "$1"
do
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
			#Extrai a versao diretamento dos cabeçalho do programa
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
#opcao $1 ja processada, a fila de ve andar
	shift
done
# Extrai a listagem
lista=$(cut -d : -f 1,5 /etc/passwd)

# Ordenaa listagem (se necessario)
if test "$ordenar" = 1
then
	lista=$(echo "$lista" | sort)
fi
# Mostra o resultado para o usuario
echo "$lista" | tr : \\t
