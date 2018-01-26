FROM python:3.6-stretch

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apt-utils && \
    apt-get install -y openjdk-8-jre-headless wget bash && \
    wget http://mirror.ibcp.fr/pub/apache/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz -P / && \
    (cd / ; tar xfz spark-2.2.0-bin-hadoop2.7.tgz ; rm spark-2.2.0-bin-hadoop2.7.tgz) 
