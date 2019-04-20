from ubuntu:16.04

RUN apt-get update && apt-get install -y \
                    python3 \
                    python3-pip 
RUN pip3 install jupyter \
                 numpy \ 
                 scikit-learn \
                 findspark

RUN apt-get update && apt-get install -y\
            default-jre \
            scala \
            wget
RUN pip3 install py4j
RUN mkdir ./SPARK
RUN wget -P ./SPARK  http://ftp.man.poznan.pl/apache/spark/spark-2.4.1/spark-2.4.1-bin-hadoop2.7.tgz 
RUN echo "360A7B57290537C5EB3570C70D0D0B9580C4F9DB8D0FA9746C3BBB6544BBB8F629901582968955ACEB5649CB9D66C2D524971E4E3EF34C35D96F02FF6DBA4D72  ./SPARK/spark-2.4.1-bin-hadoop2.7.tgz" | sha512sum -c -
RUN tar xvzf ./SPARK/spark-2.4.1-bin-hadoop2.7.tgz
ENV SPARK_HOME='./spark-2.4.1-bin-hadoop2.7'
ENV PATH=$SPARK_HOME:$PATH
ENV PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH
ENV PYSPARK_DRIVER_PYTHON="jupyter"
ENV PYSPARK_DRIVER_PYTHON_OPTS="notebook"
ENV PYSPARK_PYTHON=python3
RUN chmod 777 spark-2.4.1-bin-hadoop2.7
RUN chmod 777 spark-2.4.1-bin-hadoop2.7/python
RUN chmod 777 spark-2.4.1-bin-hadoop2.7/python/pyspark

