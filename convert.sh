mscore="$MSCORE"

# directory with corresponding test file
test=$1



cd $test
mkdir reference

# convert MSCZ to PDF and to MusicXML
"$mscore" $test.mscz -o $test.pdf
"$mscore" $test.mscz -o reference/$test.musicxml

# convert MusicXML to MEI Basic with Verovio
verovio reference/$test.musicxml -t mei-basic -o reference/$test.basic.mei 

# unzip the MSCZ to XML
unzip -p $test.mscz $test.mscx > reference/$test.ms.xml

cd ..