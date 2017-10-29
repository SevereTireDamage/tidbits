#!/bin/sh
#
# Extract 4-byte hex dwords from a text stream and output them in a consistent
# manner for other processing.
#

set -e

if [ -z "$*" ] ; then

    #
    # Actual work here. The rest is selftest and wrappers.
    #
    grep -o -E '\b(0x)?[[:xdigit:]]{8}\b' | sed -r 's/^0x//'

elif [ "$*" = "selftest" ] ; then
    shift
    cat <<EOM | sh $0 $@
        lol aabbccdd 12345678
0x600df00d
0100: 0xffEED008
EOM
else
    sh $0 <<EOM
$*
EOM
fi

