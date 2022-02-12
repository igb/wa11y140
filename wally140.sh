IFS=""

if [ "$#" -ne 1 ]; then
    wordle=`pbpaste`;
else
    wordle=`cat $1`
fi
    
filters=(
    "s/Line //;"
    "s/and/\&/g;"
    "s/in the wrong/in wrong/g;"
    "s/\.//;"
    "s/correct/right/g;"
    "s/!//;"
    "s/://;"
    "s/th / /g;"
    "s/th,/,/g;"
    "s/st / /g;"
    "s/st,/,/g;"
    "s/,//g;")


for t in ${filters[@]}; do
    if [ `echo $wordle | wc -c` -gt 140 ]; then
	wordle=`echo "$wordle" | sed $t`
    fi
done

if [ `echo $wordle | wc -c` -gt 140 ]; then
    echo "Could not express your Wordle text in 140 characters or less. :-(" 
else
    score=`echo $wordle | wc -c | xargs`
    echo "$wordle" | pbcopy
    echo "Rewrote your Wordle text in $score characters and copied it to the clipboard."
fi

