#!/bin/bash

while getopts ":o:p:q" opcao; do
    case $opcao in
        o)
            echo "Opção 'o' foi ativada com o argumento: $OPTARG"
            ;;
        p)
            echo "Opção 'p' foi ativada com o argumento: $OPTARG"
            ;;
        q)
            echo "Opção 'q' foi ativada"
            ;;
        :)
            echo "Opção '-$OPTARG' requer um argumento."
            ;;
        ?)
            echo "Opção inválida: '-$OPTARG'"
            ;;
    esac
done

shift $((OPTIND - 1))

echo "Argumentos restantes: $@"

