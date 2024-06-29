#!/bin/bash
ATRIZ="JADE LEIGH"
#O Nosso primeiro programa complexo
#Mostrar que o programa começou
echo "O programa foi iniciando..."

#mostra o hostname do sistema
echo "Nome Da Maquina: $(hostname)"

#mostra a versao do kernel
echo "Versao do Kernel: $(uname -r)"

#Mostra informação sobre a maquina
echo "Info Sobre a maquina: $(uname -m)"

#Mostra dispositivos em blocos disponiveis
echo "Dispositivos em bloco disponivel: 
$(lsblk)"

#mostra o espaço no sistema
df -h
#atriz porno favorita
echo "Atriz Porno Favorita: ${ATRIZ}"
