rm results.txt

for d in */ ; do
    test=${d/\//}
    ./reset.sh $test
    ./round-trip.sh $test
    cat $test/result.txt >> results.txt
done

cat results.txt
