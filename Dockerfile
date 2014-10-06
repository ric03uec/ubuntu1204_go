FROM shippableimages/ubuntu1204_base:0.0.3

RUN apt-get update && apt-get install -y \
    binutils \
    bison \
    build-essential \
    curl \
    gcc \
    make \
    mercurial;

RUN curl -s -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | bash;

CMD ["/bin/bash"]
