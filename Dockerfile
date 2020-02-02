FROM francoisgervais/opencv-python:4.1.1-py35 AS base

FROM base as build
RUN apt-get update && apt-get -y install --no-install-recommends \
	build-essential \
	libopenblas-dev \
	libblas-dev \
	liblapack-dev \
	libatlas-base-dev \
	gfortran \
	wget \
	pybind11-dev
RUN pip wheel scipy==1.4.1


FROM base
COPY --from=build /scipy-*.whl /
RUN pip install scipy-*.whl
RUN wget https://storage.googleapis.com/tensorflow/raspberrypi/tensorflow-2.1.0-cp35-none-linux_armv7l.whl
RUN pip install tensorflow-*.whl
