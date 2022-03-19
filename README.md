# awk scripts Sollection
## Collection of useful awk scripts


### tuple_builder.awk
goal: Purpose of this script is to process n number of files and merge lines into tuples with smallest possible complexity which is O(2n).

all files should have the same number of lines
example:

```
$ cat hosts.txt
localhost
127.0.0.1
10.0.2.15
```

```
$cat ports.txt
22
80
25
```

```
$cat protocols.txt
ssh
http
smtp
```

```
$ awk -f awk_script_collection/tuple_builder.awk hosts.txt ports.txt protocols.txt
localhost 22 ssh 
127.0.0.1 80 http 
10.0.2.15 25 smtp 
```
