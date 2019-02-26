# 手乗り　Phoenix

Simply run Apache Phoenix with a `file://` based HBase, with a query server.

Easy to manage and easy to start.

Try with `docker pull tsingjyujing/tenori-phoenix:release-1.0` to start now! 

## How to build

You can use
```bash
bash util.sh build phoenix:test
```
 to build, and you can also use
```bash
sudo docker build -t phoenix:test .
```
to build it


## How to start

Of course you can start it simply with

```bash
bash util.sh run phoenix:test 8765
```

But the most recommended way is to control all the parameters by yourself.

```bash
sudo docker run -p {your QueryServer port}:8765 -v {local data volum}:/data --stop-timeout {max time to wait hbase stop} -d  {image name}
```

For example:

```bash
sudo docker run -p 18765:8765 -v /var/lib/phoenix:/data --stop-timeout 600 -d  phoenix:latest
````
