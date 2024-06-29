#!/bin/bash
# getops-teste.sh
#

#Vinicius, Julho de 2024

# Loop que processa todas as opções da linha de comando.
# Atenção ao formato das opções válidas "sa:"
# - Os dois-pontos do inicio ligam o modo silencioso
# - As opções válidas são 'sa:', que são -s e -a
# - OS dois-pontos de 'a:' representam um argumento: -a FOO
#
while getopts ":sa" opcao
do
	# $opção guarda a opção da vez (ou ? e : em caso de erro)
	# $OPTARG guarda o argumento da opção (se houver)
	#	
	case $opcao in
		s) echo "OK Opção simples (-s)";;
		a) echo "OK Opcão com argumento (-a), recebeu: $OPTARG";;
	       \?) echo "ERRO Opcão invalida: $OPTARG";;
		:) echo "ERRO Faltou argumento para: $OPTARG";;
	esac
done
# O loop termina quando nenhuma opcão for encotrada.
# Mas ainda podem existir argumentos, como um nome de arquivo.
# A variavel $OPTIND guarda o indice do resto da linha de 
# comando, util para arrancar as opções ja processadas.
#
echo
shift $((OPTIND -1))
echo "INDICE: $OPTIND"
echo "RESTO: $*"
echo
