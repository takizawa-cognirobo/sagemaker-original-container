# Build an image that can do training and inference in SageMaker
# This is a Python 3 image that uses the nginx, gunicorn, flask stack
# And use tensorflow-gpu
# for serving inferences in a stable way.

FROM tensorflow/tensorflow:latest-gpu-py3

RUN apt-get -y update && apt-get install -y --no-install-recommends \
         wget \
         nginx \
         ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# install libralies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Set some environment variables. PYTHONUNBUFFERED keeps Python from buffering our standard
# output stream, which means that logs can be delivered to the user quickly. PYTHONDONTWRITEBYTECODE
# keeps Python from writing the .pyc files which are unnecessary in this case. We also update
# PATH so that the train and serve programs are found when the container is invoked.

RUN find / | grep  libcuda.so.1

ENV LD_LIBRARY_PATH="/usr/local/cuda-9.0/lib64/:/usr/local/cuda-10.0/compat/:${LD_LIBRARY_PATH}"
ENV PYTHONUNBUFFERED=TRUE
ENV PYTHONDONTWRITEBYTECODE=TRUE
ENV PATH="/opt/program:${PATH}"

RUN echo $LD_LIBRARY_PATH

# Set up the program in the image
COPY model /opt/program
WORKDIR /opt/program
