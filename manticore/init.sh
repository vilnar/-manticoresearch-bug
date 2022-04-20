#!/bin/bash

sudo mkdir -p /var/log/manticore /var/lib/manticore/data/replication
sudo chown -R manticore:manticore /var/run/manticore /var/lib/manticore /var/log/manticore /home/manticore/

indexer --all
searchd --config /etc/manticoresearch/manticore.conf


# prepare data for reload index
old_data_dir="/home/manticore/old_indexes/data"
new_data_dir="/home/manticore/new_indexes/data"
default_data_folder="/var/lib/manticore/data"

mkdir -p $old_data_dir
mkdir -p $new_data_dir

indexer --all --rotate &
wait
sleep 1
cp $default_data_folder/search* $old_data_dir


indexer --all --rotate &
wait
sleep 1
cp $default_data_folder/search* $new_data_dir

printf '\n\nPrepare environment - Done!\n\n'


/bin/bash
