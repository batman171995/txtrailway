FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata
# setting the working directory in the container
RUN mkdir ./app
RUN chmod 777 ./app
WORKDIR /app/
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    curl \
    git \
    python3 \
    python3-pip \
    wget \
    ffmpeg \
    aria2 \
    mediainfo \
    pv \
    jq
# Copying the content of the local src directory to the working directory
COPY . .
RUN pip3 install -r requirements.txt
CMD python3 main.py
