#!/bin/bash
#testa se usuario e root
#Nome: ./programa6.sh

#testa se usuario e tem permissao root
if [[ ${UID} -eq 0 ]]

#Se for root, roda opcoes root
then
	echo "Voce tem permissao root!"


#Se não for root, pedir para vira root
else
	echo "Por favor vire root para usar esse programa."
#encerra condicional
fi 
