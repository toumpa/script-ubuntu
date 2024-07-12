#!/bin/bash
cd $HOME/Desktop/

set1=(he she it they) #dhmiourgia pinakwn <3
set2=(is was were)
set3=(a to the there)

mkdir -p $HOME/Desktop/results #dhmiourgia katalogou results  -p = an uparxei mhn to ksanaftiaxei

gcc word_search.c #compile to .c arxeio

if [ $# != 1 ]; then #elegxos gia lathos arithmo arguments
	echo "Wrong number of arguments!"
else
	for i in ${set1[@]} #4 fores dld to megethos tou pinaka
	do
		for j in ${set2[@]} #3 fores
		do
			for n in ${set3[@]} #4 fores
			do
        			./a.out $1 $i $j $n > $HOME/Desktop/results/"out_${i}_${j}_${n}.txt"
				#$1 = prwth parametros apothikeuei sto path ta arxeia me ta antistoixa names
			done
 		done
	done

	cd $HOME/Desktop/results
	x=$(ls | wc -l) #metraei ton arithmo twn files ston dir results
	z=$(find -empty | wc -l)
	y=$((x-z))
	w=$(find -type f -exec wc -l {} \; | awk '{total += $1} END{print total}') 
	echo "Total number of generated files: $x"
	echo "Total number of not empty files: $y"
	echo "Total number of empty files: $z"
	echo "Total number of results (in lines): $w"
fi

if [ $? != 0 ]; then	#elegxos kwdikou eksodou 
	echo "EXIT CODE :" $? #an den einai 0 tote termatizei 
fi

