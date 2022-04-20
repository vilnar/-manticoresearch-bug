#!/bin/bash

old_data_dir="/home/manticore/old_indexes/data"
new_data_dir="/home/manticore/new_indexes/data"
replication_dir="/var/lib/manticore/data/replication"


for i in {1..3000}; do
    rm -f $replication_dir/*

    target_data_dir=$new_data_dir
    n=$(($i%2))
    if [[ $n == 0 ]]; then
        target_data_dir=$old_data_dir
    fi

    {
        cp $target_data_dir/search.sp* $replication_dir/
        mysql --port 9306 --host 127.0.0.1 --execute "RELOAD INDEX search FROM '${replication_dir}/search'"
    } &

    {
        cp $target_data_dir/search1.sp* $replication_dir/
        mysql --port 9306 --host 127.0.0.1 --execute "RELOAD INDEX search1 FROM '${replication_dir}/search1'"
    } &

    {
        cp $target_data_dir/search2.sp* $replication_dir/
        mysql --port 9306 --host 127.0.0.1 --execute "RELOAD INDEX search2 FROM '${replication_dir}/search2'"
    } &

    {
        cp $target_data_dir/search3.sp* $replication_dir/
        mysql --port 9306 --host 127.0.0.1 --execute "RELOAD INDEX search3 FROM '${replication_dir}/search3'"
    } &

    {
        cp $target_data_dir/search4.sp* $replication_dir/
        mysql --port 9306 --host 127.0.0.1 --execute "RELOAD INDEX search4 FROM '${replication_dir}/search4'"
    } &

    {
        cp $target_data_dir/search5.sp* $replication_dir/
        mysql --port 9306 --host 127.0.0.1 --execute "RELOAD INDEX search5 FROM '${replication_dir}/search5'"
    } &

    {
        cp $target_data_dir/search6.sp* $replication_dir/
        mysql --port 9306 --host 127.0.0.1 --execute "RELOAD INDEX search6 FROM '${replication_dir}/search6'"
    } &

    {
        cp $target_data_dir/search7.sp* $replication_dir/
        mysql --port 9306 --host 127.0.0.1 --execute "RELOAD INDEX search7 FROM '${replication_dir}/search7'"
    } &

    {
        cp $target_data_dir/search8.sp* $replication_dir/
        mysql --port 9306 --host 127.0.0.1 --execute "RELOAD INDEX search8 FROM '${replication_dir}/search8'"
    } &

    {
        cp $target_data_dir/search9.sp* $replication_dir/
        mysql --port 9306 --host 127.0.0.1 --execute "RELOAD INDEX search9 FROM '${replication_dir}/search9'"
    } &

    wait

    echo ""
    echo "Reload indexes iteration: ${i}"
done
