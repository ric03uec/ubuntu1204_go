FROM shipimg/ubuntu1204_base:latest

RUN apt-get update && apt-get install -y \
    binutils \
    bison \
    curl \
    gcc \
    make \
    mercurial \
    ed;

RUN curl -s -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | bash;

RUN /bin/bash -c ". /root/.gvm/scripts/gvm && gvm install go1.1";
RUN /bin/bash -c ". /root/.gvm/scripts/gvm && gvm install go1.2";
RUN /bin/bash -c ". /root/.gvm/scripts/gvm && gvm install go1.3";
RUN /bin/bash -c ". /root/.gvm/scripts/gvm && gvm install release";

env GVM_ROOT /root/.gvm
env PATH $PATH:/root/.gvm/bin

CMD ["/bin/bash"]
