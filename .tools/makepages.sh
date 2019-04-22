#!/bin/sh
# argument is the list of filters

FILTERS=$*
for d in $FILTERS ; do
    make --silent --no-print-directory -C $d page
    if [ $? -eq 0 ]; then
    	  printf "SUCCESS for %s\n" "$d"
        cp -a $d/.build/ .build/pages/$d
    else
    	  printf "NO PAGE for %s\n" "$d"
    fi
done

exit $err
