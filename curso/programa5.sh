#!/bin/bash
#checar idade do usuario crackudo 
#Nome: ./programa4.sh

#mensagem de boas vindas 
echo "Bem vindo ao nosso programa $0."

#Coletamos resposta do usuario
echo "Qual ea sua idade?"
read IDADE


#Fazemos o teste com o if
if [[ ${IDADE} -ge 18 ]]


#se os teste for verdadeiro

then
	echo "Voce tem 18 anos ou mais."
	echo "Aqui esta o seu ingresso para o show 1."
#Outro teste aui para verificar se usuario tem 17 anos
elif [[ ${IDADE} -ge 16 ]]
then
	echo "Voce tem entre 16 e 17."
	echo "Seu ingresso para o show 2."
#se teste for falso
else
	echo "Voce nao tem 18 ainda."
	echo "Volte quando tiver 18 anos."

#fechamos a condicional com fi
fi
