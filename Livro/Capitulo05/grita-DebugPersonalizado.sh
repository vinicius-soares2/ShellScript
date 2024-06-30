#!/bin/bash
# grita-DebugPersonalizado.sh
#
# Mostra uma palavra ($TXT) em maisuculas e com exclamações 
# Exemplo: foo -> !!!!!FOO!!!!!

DEBUG=1		# Depuração:0 delisga, 1 liga
# Função de depuração
Debug(){	
	[ "$DEBUG" = 1 ] && echo "-----------{ $*"
}

#Mostra as mensagens de depuração em amarelo
Debug(){
	[ "$DEBUG" = 1 ] && echo -e "\033[33;1m$*\033[m"
}

TXT="gritaria"
TXT="     $TXT    " 		# Adicionando 5 de espaço
Debug "TXT com espaços	:[$TXT]"
TXT=$(echo $TXT | tr ' ' ' !')	# Troca os espaços por exclamações
Debug "TXT com exclamações: [$TXT]"

TXT=$(echo $TXT | tr a-z A-Z)	# Deixa o texto em maisculas
echo "$TXT"			# Mostra a mensagem
