#!/bin/bash
#
#MUDA DE DIRETORIO E CRIAR ARQUIVO 
cd /tmp
touch arquivo1
ls -l /tmp/arquivo1
pwd

#ATRIBUIR DATA A VARIAVEL
DATA=$(date +%m-%y)
cd ~/Documentos/shell
touch arquivo-${DATA}.txt
