FROM python:3.6-alpine
RUN echo "http://dl-3.alpinelinux.org/alpine/latest-stable/community" >> /etc/apk/repositories
RUN apk add --no-cache openblas
RUN apk add --no-cache --virtual .build-deps \
	build-base \
	g++ \
        musl-dev \
        gfortran \
        libgfortran \
        openblas-dev
#        lapack lapack-dev

RUN ln -s /usr/include/locale.h /usr/include/xlocale.h 
RUN pip install cython==0.25.2 
RUN pip install numpy==1.12.0
RUN pip install pandas==0.19.2
RUN pip install scipy==0.18.1
RUN pip install scikit-learn==0.18.1

RUN apk del .build-deps

ENV LANG C.UTF-8
# RUN pip3 install pandas==0.18.1 scipy==0.18.1 scikit-learn==0.18.1 numpy==1.11.1

