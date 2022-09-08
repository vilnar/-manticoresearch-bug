# Manticoresearch issue 739

Reproduce [issue](https://github.com/manticoresoftware/manticoresearch/issues/739)

## Prepare environment
Run
```
docker-composer up -d
```

Wait until indexer data is generated, there should be a message in the logs: "Prepare environment - Done!"
```
docker logs manticore_test
```

## Reproduce
Run stress test and keep running
```
bash sql_loop.sh
```

Run script `reload_index.sh` in new terminal session and wait while then it will freez
```
docker exec manticore_test bash -c "bash ~/reload_index.sh"
```

After the program freez, mysql connection does not work
```
mysql --port 19306 --host 127.0.0.1
```

