cd /opt/zookeeper
bin/zkServer.sh start
cd /opt/hbase
bin/start-hbase.sh
cd /opt/phoenix
nohup bin/queryserver.py start >/dev/null 2>&1 &

echo "Phoenix server started."

prog_exit()
{
    echo "Stopping Phoenix server..."

    cd /opt/phoenix
    bin/queryserver.py stop
    echo "Query server stopped."

    cd /opt/hbase
    bin/stop-hbase.sh
    echo "HBase stopped."

    cd /opt/zookeeper
    bin/zkServer.sh stop
    echo "Zookeeper stopped, all service stopped."
}
trap "prog_exit" 15

flag=4
while [ $flag -ge 4 ];do
    sleep 2;
    flag=`ps aux|grep java|wc -l`
done;

