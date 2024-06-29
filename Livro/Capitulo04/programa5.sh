#!/bin/bash

# Exemplo
# Script: xgetopts.sh

while getopts ab:cde OPCAO
do
    # Verifica o parâmetro armazenado em 'OPCAO'
    case $OPCAO in
        # Atribui uma ação.
        'a') opcao_A=1 ;;
        'b') argumento_B="$OPTARG" ;;
        'c') opcao_C=1 ;;
        'd') opcao_D=1 ;;
        'e') opcao_E=1 ;;
    esac
done

# Testa os valores das variáveis.
[ $opcao_A ] && echo "Opção 'A' foi ativada."
[ $argumento_B ] && echo "Opção 'B' foi ativada com o valor '$argumento_B'."
[ $opcao_C ] && echo "Opção 'C' foi ativada."
[ $opcao_D ] && echo "Opção 'D' foi ativada."
[ $opcao_E ] && echo "Opção 'E' foi ativada."

exit 0
#FIM
