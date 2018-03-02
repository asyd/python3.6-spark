FROM python:3.6-stretch

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apt-utils && \
    apt-get install -y openjdk-8-jre-headless wget bash && \
    apt-get install -y librdkafka-dev build-essential && \
    apt-get install -y python3 python3-dev python3-pip && \
    pip install confluent-kafka && \
    apt-get clean -y && \
    wget http://mirror.ibcp.fr/pub/apache/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz -P / && \
    (cd / ; tar xfz spark-2.2.0-bin-hadoop2.7.tgz ; rm spark-2.2.0-bin-hadoop2.7.tgz) && \
    # Install other python packages
    /usr/local/bin/pip install -U pip && \
    /usr/local/bin/pip install -U pillow pytesseract opencv-python requests && \
    # Install tesseract
    apt-get install -y tesseract-ocr tesseract-ocr-eng tesseract-ocr-enm tesseract-ocr-fra
