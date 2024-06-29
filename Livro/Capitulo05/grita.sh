#!/bin/bash
# grita.sh
#
# Mostra uma palavra ($TXT) em maisuculas e com exclamações 
# Exemplo: foo -> !!!!!FOO!!!!!

TXT="gritaria"
TXT="	$TXT	"		# Adiciona 5 espaçoes ao redor
TXT=$(echo $TXT | tr ' ' ' !')	# Troca os espaços por exclamações
TXT=$(echo $TXT | tr a-z A-Z)	# Deixa o texto em maisculas
echo "$TXT"			# Mostra a mensagem
