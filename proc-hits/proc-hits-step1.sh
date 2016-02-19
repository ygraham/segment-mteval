rdir=batched-hits
wdir=analysis

mkdir $wdir
mkdir out

perl hits2r.pl ad $rdir $wdir > $wdir/ad-latest.csv
wc -l $wdir/ad-latest.csv

R --no-save --args $wdir ad < concurrent-hits.R
R --no-save --args $wdir ad < wrkr-times.R
perl filter-rejected.pl $wdir/ad-wrkr-stats.csv < $wdir/ad-latest.csv > $wdir/ad-approved.csv
perl repeats.pl < $wdir/ad-approved.csv > $wdir/ad-repeats.csv
R --no-save --args $wdir < quality-control.R
perl raw-bad-ref-pval-2-csv.pl < $wdir/ad-trk-stats.txt > $wdir/ad-trk-stats.csv
perl filter-pval-paired.pl < $wdir/ad-trk-stats.csv > $wdir/ad-trk-stats.class
perl filter-latest.pl ad $wdir/ad-trk-stats.class < $wdir/ad-approved.csv > $wdir/ad-good-raw.csv
perl repeats.pl < $wdir/ad-good-raw.csv > $wdir/ad-good-raw-repeats.csv


