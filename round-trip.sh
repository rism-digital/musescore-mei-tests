mscoremei="$MSCOREMEI/applebuild/src/app/Debug/mscore.app/Contents/MacOS/mscore"

# directory with corresponding test file
test=$1

cd $test
"$mscoremei" $test.mscz -o $test.ms.mei
"$mscoremei" $test.ms.mei -o $test.rt.mscz -f
"$mscoremei" $test.ms.mei -o $test.rt.pdf -f
"$mscoremei" $test.rt.mscz -o $test.rt.mei

xmldiff $test.ms.mei $test.rt.mei

cd ..