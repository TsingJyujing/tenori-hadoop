FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install \
    openjdk-8-jre locales wget python\
    -y && \
    apt autoremove && \
    wget https://mirrors.shu.edu.cn/apache/hbase/1.4.9/hbase-1.4.9-bin.tar.gz && \
    wget https://mirrors.shu.edu.cn/apache/phoenix/apache-phoenix-4.14.1-HBase-1.4/bin/apache-phoenix-4.14.1-HBase-1.4-bin.tar.gz && \
    wget https://mirrors.shu.edu.cn/apache/zookeeper/zookeeper-3.4.12/zookeeper-3.4.12.tar.gz && \
    tar -xzvf zookeeper-3.4.12.tar.gz && \
    tar -xzvf hbase-1.4.9-bin.tar.gz && \
    tar -xzvf apache-phoenix-4.14.1-HBase-1.4-bin.tar.gz && \
    mv hbase-1.4.9 /opt/hbase && \
    mv apache-phoenix-4.14.1-HBase-1.4-bin /opt/phoenix && \
    mv zookeeper-3.4.12 /opt/zookeeper && \
    rm -f zookeeper-3.4.12.tar.gz && \
    rm -f hbase-1.4.9-bin.tar.gz && \
    rm -f apache-phoenix-4.14.1-HBase-1.4-bin.tar.gz && \
    cp /opt/phoenix/phoenix-4.14.1-HBase-1.4-client.jar /opt/hbase/lib/ && \
    cp /opt/phoenix/phoenix-4.14.1-HBase-1.4-server.jar /opt/hbase/lib/ && \
    mkdir -p /var/lib/hbase/pid

COPY startup.sh /opt/startup.sh
COPY hbase-config/* /opt/hbase/conf/
COPY zookeeper-config/* /opt/zookeeper/conf/

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8tar 

EXPOSE 8765

CMD ["bash", "/opt/startup.sh"]