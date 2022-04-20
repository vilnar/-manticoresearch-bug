# Reproduce manticoresearch bug

## Prepare environment
Run
```
docker-composer up -d
```

Wait until indexer data is generated, there should be a message in the logs: "Prepare environment - Done!"
```
docker logs manticore_test
```

## Reproduce bug
Run stress test and keep running
```
bash sql_loop.sh
```

Run script `reload_index.sh` in new terminal session and wait after a while the program freez
```
docker exec manticore_test bash -c "bash ~/reload_index.sh"
```

After the program hangs, mysql connection does not work
```
mysql --port 19306 --host 127.0.0.1
```

