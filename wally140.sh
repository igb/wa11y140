if [ "$#" -ne 1 ]; then
    foo=`pbpaste | sed 's/Line //; s/and/\&/g; s/in the wrong/in wrong/g; s/\.//; s/correct/right/g; s/!//; s/://; s/th / /g; s/th,/,/g; s/st / /g; s/st,/,/g;'`
    echo "$foo" | wc -c 
else
    sed -i 's/search_string/replace_string/' $1
fi
