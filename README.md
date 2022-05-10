# dump-load-sql
Scripts for periodically dump postgersql databases. And restore if needed.

## Start dumping
Pass flag `--user` to create user services, otherwise creates system services.
```
$ ./install.sh --user
```

## Stop dumping and remove dump services
Pass flag `--user` to create user services, otherwise creates system services.
```
$ ./uninstall.sh --user
```

## Restore
Restore should be done as root to stop andstart postgresql service.
```
# ./load-sql.sh
```
