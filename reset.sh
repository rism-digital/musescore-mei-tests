# directory with corresponding test file
test=$1

# Convert files
rm $test/$test.pdf
rm $test/$test.ms.xml
rm $test/$test.basic.mei
rm $test/$test.musicxml

# Round-trip files
rm $test/$test.ms.mei
rm $test/$test.rt.*