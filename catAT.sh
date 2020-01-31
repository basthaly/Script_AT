#!/bin/bash

help="0"
name="0"
recherch="0"
save="0"
dossier="./"

while getopts "hf:d:n:r:" option
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

    d)
        dossier=$OPTARG
    ;;

    h)
        help="1"
    ;;

    f)
        save=$OPTARG

esac
done

if [ $help = "1" ];then
    echo -e """\e[32m
Name :
    catAT : Script permettant de dans un ou plusieurs fichiers ce que l'on souhaite
Description :
    Le programme est un cat avancé permettant de lire un ou plusieurs fichier (Pour lire plusieurs fichier, utiliser * -> par exemple : file* va lire file, file1, file68... )
    Le programme peut aussi chercher un mot particulier au sein du fichier.
Exemple:
    catAT \e[32m-h\e[32m
        Affiche l'aide

    catAT \e[34m-n fichier\e[32m
        va cat le(s) fichier(s) en question

        \e[34m-r test\e[32m
            Cette option permet de chercher un mot dans le(s) fichier(s)
        \e[34m-d dossier\e[32m
            Cette option permet de choisir le dossier dans lequel le programme travaille
        \e[34m-f fichier\e[32m
            Cette option permet de choisir un fichier dans lequel stocker le résultat de la commande, le fichier se place à l'emplacement ou vous êtes.
            Par défault le résultat n'est pas stocké.
\e[37m
"""

elif [ $name = "1" ];then
    if [ $recherch = "1" ];then
        if [ $save != "0" ];then
            cat $dossier$fich | grep $grep > $save
        else
            cat $dossier$fich | grep $grep --color
        fi
    else
        if [ $save != "0" ];then
            cat $dossier$fich > $save
        else
            cat $dossier$fich
        fi
    fi
    
else
    echo -e """\e[32m
Name :
    catAT : Script permettant de dans un ou plusieurs fichiers ce que l'on souhaite
Description :
    Le programme est un cat avancé permettant de lire un ou plusieurs fichier (Pour lire plusieurs fichier, utiliser * -> par exemple : file* va lire file, file1, file68... )
    Le programme peut aussi chercher un mot particulier au sein du fichier.
Exemple:
    catAT \e[96m-h\e[32m
        Affiche l'aide

    catAT \e[96m-n fichier\e[32m
        va cat le(s) fichier(s) en question

        \e[96m-r test\e[32m
            Cette option permet de chercher un mot dans le(s) fichier(s)
        \e[96m-d dossier\e[32m
            Cette option permet de choisir le dossier dans lequel le programme travaille
        \e[96m-f fichier\e[32m
            Cette option permet de choisir un fichier dans lequel stocker le résultat de la commande, le fichier se place à l'emplacement ou vous êtes.
            Par défault le résultat n'est pas stocké.
\e[37m
""" 
fi