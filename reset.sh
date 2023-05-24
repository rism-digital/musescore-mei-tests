# directory with corresponding test file
test=$1

# Round-trip files
rm $test/$test.ms.mei
rm $test/$test.*.rt.*
rm $test/$test.rt.*
rm $test/$test.vrv.*
rm $test/diff.txt
rm $test/result.txt