# Test suite for MEI support in MuseScore

Each test is a distinct directory with a corresponding MuseScore file. The repository also includes some scripts

## Initial conversion with MuseScore and Verovio

Needs the environment variable `MSCORE` to be set to the `mscore` binary. E.g.:
```bash
export MSCORE="/Applications/MuseScore 4.app/Contents/MacOS/mscore"
```

Verovio can be installed with `brew install verovio`

Then running:
```
./convert.sh score-01
```
will produce:
* A PDF version in `score-01.pdf`

and for reference:
* Extract the MuseScore XML in `reference/score-01.ms.xml`
* Extract the MusicXML with MuseScore into `reference/score-01.musicxml`
* Convert the MusicXML to MEI with Verovio into `reference/score-01.basic.mei`

These files are store in the repository.

## Round-trip evaluation

Assumes MuseScore to be built following [these](https://github.com/rism-digital/MuseScore/wiki/Building-instruction-memo) building instructions.

Needs the environment variable `INKSCAPE` to be set to the `inkscape` binary. E.g.:
```bash
export INKSCAPE="/Applications/Inkscape.app/Contents/MacOS/inkscape"
```

Needs the environment variable `MSCOREMEI` to be set to the root of the MuseScore repository. E.g.:
```bash
export MSCOREMEI="/Users/laurent/tools/musescore-mei"      
```

Then running:
```
./round-trip.sh score-01
```
will produce:
* The MEI export from MuseScore in `score-01.ms.mei`
* The MuseScore file reimported from MEI in `score-01.rt.mscz`
* A PDF version of the reimported file in `score-01.rt.pdf`
* The round-trip MEI export from MuseScore in `score-01.rt.mei`
* A PDF version of the exported and re-exported MEI file rendered with Verovio

The script also runs `xmldiff` on the two MEI files stored into a `diff.txt` file and the number of changes in `result.txt`

Only the `.ms.mei` (first output form MuseScore) file is stored in the repository. All the others are not.

## Running all tests

All round-trip tests can be run with:
```
./run.sh
```

This will generate a `results.txt` file indicating failure or the number of changes detected for each test

## Clean-up

All round-trip files can be removed with:
```bash
./reset.sh score-01
```

All files but the original MuseScore file can be removed with:
```bash
./reset-convert.sh score-01
```

