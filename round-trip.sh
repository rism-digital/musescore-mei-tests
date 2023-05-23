mscoremei="$MSCOREMEI/applebuild/src/app/Debug/mscore.app/Contents/MacOS/mscore"
inkscape="$INKSCAPE"

# directory with corresponding test file
test=$1

export LC_ALL="de_DE.UTF-8"

cd $test
"$mscoremei" $test.mscz -o $test.ms.mei
verovio $test.ms.mei --mm-output -o $test.vrv.ms.svg
"$inkscape" --export-type="pdf" $test.vrv.ms.svg
"$mscoremei" $test.ms.mei -o $test.rt.mscz -f
"$mscoremei" $test.ms.mei -o $test.rt.pdf -f
"$mscoremei" $test.rt.mscz -o $test.rt.mei
verovio $test.rt.mei --mm-output -o $test.vrv.rt.svg
"$inkscape" --export-type="pdf" $test.vrv.rt.svg

unzip -p $test.rt.mscz $test.rt.mscx > $test.ms.rt.xml

xmldiff $test.ms.mei $test.rt.mei

cd ..