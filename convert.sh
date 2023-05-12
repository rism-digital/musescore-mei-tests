mscore="$MSCORE"

# directory with corresponding test file
test=$1

cd $test
"$mscore" $test.mscz -o $test.pdf
"$mscore" $test.mscz -o $test.musicxml
verovio $test.musicxml -t mei-basic -o $test.basic.mei 

unzip -p $test.mscz $test.mscx > $test.ms.xml

cd ..