#!/bin/bash
# grita-DebugSimples.sh 
#
# Mostra uma palavra ($TXT) em maisuculas e com exclamações 
# Exemplo: foo -> !!!!!FOO!!!!!

TXT="gritaria"


TXT="	$TXT	"		# Adiciona 5 espaçoes ao redor

echo "TXT Com espaços   :[$TXT]"
TXT=$(echo $TXT | tr ' ' ' !')	# Troca os espaços por exclamações
echo "TXT com exclamações: [$TXT]"


TXT=$(echo $TXT | tr a-z A-Z)	# Deixa o texto em maisculas
echo "$TXT" #Mostra a mensagem
