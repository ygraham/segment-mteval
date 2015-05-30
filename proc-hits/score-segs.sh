DIR=analysis
ITEM=ad
SRC=$1
TRG=$2
MIN_N=15

STND=stnd;
R --no-save --args $DIR $ITEM $STND $SRC $TRG $MIN_N < score-segs.R

STND=raw
R --no-save --args $DIR $ITEM $STND $SRC $TRG $MIN_N < score-segs.R
