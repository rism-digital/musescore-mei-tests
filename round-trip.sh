mscoremei="$MSCOREMEI/applebuild/src/app/Debug/mscore.app/Contents/MacOS/mscore"
inkscape="$INKSCAPE"

# directory with corresponding test file
test=$1

# set the locale to ensure A4 PDF rendering from MuseScore
export LC_ALL="de_DE.UTF-8"

cd $test
# convert (export) from MSCZ to MEI
"$mscoremei" $test.mscz -o $test.ms.mei

# render the exported MEI and convert the SVG to PDF
verovio $test.ms.mei --mm-output -o $test.vrv.ms.svg
"$inkscape" --export-type="pdf" $test.vrv.ms.svg

# convert (import) the MEI file to MSCZ and to PDF
"$mscoremei" $test.ms.mei -o $test.rt.mscz -f
"$mscoremei" $test.ms.mei -o $test.rt.pdf -f

# re-convert (export) from MSCZ to MEI
"$mscoremei" $test.rt.mscz -o $test.rt.mei

# render the re-exported MEI and convert the SVG to PDF
verovio $test.rt.mei --mm-output -o $test.vrv.rt.svg
"$inkscape" --export-type="pdf" $test.vrv.rt.svg

# unzip the MSCZ to XML
unzip -p $test.rt.mscz $test.rt.mscx > $test.ms.rt.xml

# if the round-trip MEI file is there, run an xmldiff
if [ -e $test.rt.mei ]; then
    # grep to remove empty lines (when no differences)
    xmldiff $test.ms.mei $test.rt.mei | grep -v "^$" > diff.txt
    echo `cat diff.txt | wc -l` "\t$test" > result.txt 
else
    echo "FAILED\t$test" > result.txt
fi

cd ..