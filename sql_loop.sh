#!/bin/bash

i=0
while true; do
    mysql --port 19306 --host 127.0.0.1 -e "select * from search_dist where match('ab|ac|a1|a2|a3|a4|a5|a6|a7|a8|a9|a1|b1|b2|b2|b3|b4|b5|b6|b7|b8|b9|c0|c1|c2|c3|c4|c5|c6|c7|c8|c9')" > /dev/null &
    mysql --port 19306 --host 127.0.0.1 -e "select * from search_dist where match('a11|a12|a13|a14|a15|a16|a17|a18|a19|a21|b21|b22|b222|b23|b24|b25|b26|b27|b28|b29|c10|c11|c12|c13')" > /dev/null &
    wait
    i=$((i+1))
    echo ""
    echo "SQL query iteration: ${i}"
done

