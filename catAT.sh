#!/bin/bash

aide="""
Name :
    catAT : Script permettant de dans un ou plusieurs fichiers ce que l'on souhaite
Description :
    Le programme est un cat avancé permettant de lire un ou plusieurs fichier (Pour lire plusieurs fichier, utiliser * -> par exemple : file* va lire file, file1, file68... )
    Le programme peut aussi chercher un mot particulier au sein du fichier.
Exemple:
    catAT -h
        Affiche l'aide

    catAT -n fichier
        va cat le(s) fichier(s) en question

        On peut rajouter l'option -r test
            Cette option permet de chercher un mot dans le(s) fichier(s)

"""


help="0"
name="0"
recherch="0"

while getopts "n:r:" option
do
case $option in
    n)
        name="1"
        fich=$OPTARG
    ;;

    r)
        recherch="1"
        grep=$OPTARG
    ;;

    h)
        help="1"
    ;;

esac
done

if [ $help = "1" ];then
    echo $aide

elif [ $name = "1" ];then
    if [ $recherch = "1" ];then
        cat $fich | grep $grep
    else
        cat $fich
    fi
    
else
    echo $aide
fi