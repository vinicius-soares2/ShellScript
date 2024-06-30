#!/bin/bash
# cinco.sh
#
# Conta até cinco :)

set -x		# Liga debug
trap read DEBUG	# Liga o passo a passo
echo $((0+1))
echo $((0+2))
trap "" DEBUG	# Desliga o passo a passo
echo $((0+3))
echo $((0+4))
echo $((0+5))
