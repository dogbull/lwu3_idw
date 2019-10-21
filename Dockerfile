FROM ubuntu
MAINTAINER ParkJooHyeon <www.jrr.kr@gmail.com>


RUN \
    sed -i \
    -e 's/http:\/\/archive.ubuntu.com/http:\/\/mirror.kakao.com/g' \
    -e 's/http:\/\/security.ubuntu.com/http:\/\/mirror.kakao.com/g' \
    -e 's/http:\/\/extras.ubuntu.com/http:\/\/mirror.kakao.com/g' \
    /etc/apt/sources.list


ENV \
    LC_ALL=C.UTF-8 \
    TZ=Asia/Seoul


RUN \
    echo ${TZ} > /etc/timezone && \
    apt-get update -y && \
    apt-get install -y tzdata && \
    rm -rf /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


RUN \
    apt-get update -y && \
    apt-get install -y \
        wget \
        curl \
        unzip \
        vim-tiny \
        python3 \
        gdal-bin \
        gdal-data \
        mapserver-bin \
        cgi-mapserver \
        apache2 \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


RUN \
    cd usr/share/fonts/ && \
    wget http://cdn.naver.com/naver/NanumFont/fontfiles/NanumFont_TTF_ALL.zip && \
    unzip NanumFont_TTF_ALL.zip  -d NanumFont && \
    rm -rf NanumFont_TTF_ALL.zip


COPY \
    ./resources/000-default.conf /etc/apache2/sites-enabled/000-default.conf


RUN \
    ln -s /etc/apache2/mods-available/cgi.load /etc/apache2/mods-enabled/


COPY \
    ./run /usr/local/bin/run


RUN \
    ln -s /usr/bin/python3 /usr/local/bin/python && \
    chmod +x /usr/local/bin/*
