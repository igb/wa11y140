if [ "$#" -ne 1 ]; then
    wordle=`pbpaste`;
else
    wordle=`cat $1`
fi
    

  wordle=`echo "$wordle" | sed 's/Line //; s/and/\&/g; s/in the wrong/in wrong/g; s/\.//; s/correct/right/g; s/!//; s/://; s/th / /g; s/th,/,/g; s/st / /g; s/st,/,/g;'`
    echo "$wordle" | wc -c 
