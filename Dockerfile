FROM python:3.6-stretch

ARG GITLAB_USER
ARG GITLAB_TOKEN

ARG SPARK_VERSION=2.2.1
ARG SPARK_IMAGE=http://mirror.ibcp.fr/pub/apache/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop2.7.tgz

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apt-utils && \
    apt-get install -y openjdk-8-jre-headless wget bash && \
    apt-get install -y librdkafka-dev build-essential && \
    apt-get install -y python3 python3-dev python3-pip postgresql-server-dev-9.6 && \
    pip install confluent-kafka && \
    apt-get clean -y && \
    wget $SPARK_IMAGE -P / && \
    (cd / ; tar xfz spark-${SPARK_VERSION}-bin-hadoop2.7.tgz ; rm spark-${SPARK_VERSION}-bin-hadoop2.7.tgz) && \
    # Install other python packages
    /usr/local/bin/pip install -U pip && \
    /usr/local/bin/pip install -U pillow pytesseract opencv-python requests beautifulsoup4 tensorflow && \
    # Install tesseract
    apt-get install -y tesseract-ocr tesseract-ocr-eng tesseract-ocr-enm tesseract-ocr-fra && \
    # Add cpgcopy
    echo -e "machine gitlab.com\nlogin ${GITLAB_USER}\npassword ${GITLAB_TOKEN}" > ~/.netrc && \ 
    /usr/local/bin/pip install cython numpy pandas pgcopy 
    # /usr/local/bin/pip install git+https://gitlab.com/bigdatamedia/extra/cpgcopy.git 
