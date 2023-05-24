mscore="$MSCORE"

# directory with corresponding test file
test=$1

cd $test

# convert MSCZ to PDF and to MusicXML
"$mscore" $test.mscz -o $test.pdf
"$mscore" $test.mscz -o $test.musicxml

# convert MusicXML to MEI Basic with Verovio
verovio $test.musicxml -t mei-basic -o $test.basic.mei 

# unzip the MSCZ to XML
unzip -p $test.mscz $test.mscx > $test.ms.xml

cd ..