#!/bin/sh

mkdir ~/corbeille

export CORBEILLE=$(realpath ~/corbeille)

alias TRASH='ls $CORBEILLE'

alias RM='RM(){./rm.sh $@}'

alias RESTORE='RESTORE(){./restore.sh $@}'
