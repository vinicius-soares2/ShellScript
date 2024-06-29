#!/bin/bash
#simples progama em while
COUNTER=1
while [[ ${COUNTER} -le 10 ]]
do
	echo "VOLTA DE NUMERO ${COUNTER}"
	((COUNTER++))
done
echo "O VALOR DO COUNTER QUANDO O LOOP TERMINOU FOI DE ${COUNTER}"

