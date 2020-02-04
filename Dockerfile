FROM debian:stretch AS base

FROM base as build
RUN apt-get update && apt-get -y install --no-install-recommends \
	gcc \
	g++ \
	gfortran \
	libopenblas-dev \
	libblas-dev \
	liblapack-dev \
	libatlas-base-dev \
	python3 \
	python3-dev \
	python3-pip \
	python3-setuptools \
	pybind11-dev \
	wget
RUN pip3 install wheel==0.34.2 cython==0.29.14 pybind11==2.4.3
RUN pip3 wheel numpy==1.18.1 && pip3 install numpy-*.whl
RUN pip3 wheel scipy==1.4.1


# FROM python:3.5.9-slim-stretch
# RUN apt-get update && apt-get -y install --no-install-recommends \
# 	wget
# COPY --from=build /numpy-*.whl /scipy-*.whl /
RUN pip3 install numpy-*.whl scipy-*.whl
# RUN pip install --no-deps keras_applications keras_preprocessing
RUN apt-get update && apt-get -y install --no-install-recommends \
	libhdf5-dev \
	libhdf5-100 \
	pkg-config
# ln -s /usr/lib/arm-linux-gnueabihf/hdf5/serial/libhdf5.so /usr/lib/arm-linux-gnueabihf/libhdf5.so
RUN wget https://storage.googleapis.com/tensorflow/raspberrypi/tensorflow-2.1.0-cp35-none-linux_armv7l.whl
# RUN pip3 install tensorflow-*.whl
