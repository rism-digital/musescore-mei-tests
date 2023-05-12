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
* Extract the MuseScore XML in `score-01.ms.xml`
* Extract the MusicXML with MuseScore into `score-01.musicxml`
* Convert the MusicXML to MEI with Verovio into `score-01.basic.mei`

These files are store in the repository.

## Round-trip evaluation

Assumes MuseScore to be built following [these](https://github.com/rism-digital/MuseScore/wiki/Building-instruction-memo) building instructions.

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

The script also runs `xmldiff` on the two MEI files.

These files are not stored in the repository

## Clean-up

All files but the original MuseScore file can be removed with:
```bash
./reset.sh score-01
```

