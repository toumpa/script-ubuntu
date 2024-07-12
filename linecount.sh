#!/bin/bash
if [ $# == 0 ]; then
	echo "0 lines"
fi
i=0                                       
while [[ $i != $# ]] && [[ $# != 0 ]]
do
	i=$n #prospathoume na metavalloume to path kathe fora alla de douleuei...
	cd $1 #cd sto 1o path
	#x=0
	#echo $x
	find . -type f | xargs wc -l 2> $HOME/error.txt | cat > $HOME/test.txt   #to apotelesma ths find mpainei san orisma sthn wc
	echo -e -n $1 ":"	 #-n = den allazei grammh
	tail -1 $HOME/test.txt    #-1 gia emfanish teleytaias seiras
	i=$((i+1)) #auksanei to orisma
	wc -l $HOME/error.txt > $HOME/b.txt #to plithos twn errors ta vazei sto b.txt
	x=$( head -c -21 $HOME/b.txt ) #pairnei to 1o byte tou b.txt kai to vazei sto x
	if [ $x > 0 ]; then #an uparxei estw kai ena error mpainei sthn if kai emfanizei swsta ta errors
		echo -n " $0 : " 
		cat < $HOME/error.txt
	fi
	rm $HOME/b.txt #ta kanei remove 
	rm $HOME/error.txt
done
