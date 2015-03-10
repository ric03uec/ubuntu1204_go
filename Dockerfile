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

RUN /bin/bash -c ". /root/.gvm/scripts/gvm && gvm install go1.1 --prefer-binary && gvm use go1.1 && go install -a -race std";
RUN /bin/bash -c ". /root/.gvm/scripts/gvm && gvm install go1.2 --prefer-binary && gvm use go1.2 && go install -a -race std";
RUN /bin/bash -c ". /root/.gvm/scripts/gvm && gvm install go1.3 --prefer-binary && gvm use go1.3 && go install -a -race std";
RUN /bin/bash -c ". /root/.gvm/scripts/gvm && gvm install go1.4 --prefer-binary && gvm use go1.4 && go install -a -race std";
RUN /bin/bash -c ". /root/.gvm/scripts/gvm && gvm install release || true";
RUN /bin/bash -c ". /root/.gvm/scripts/gvm && gvm install tip || true";

env GVM_ROOT /root/.gvm
env PATH $PATH:/root/.gvm/bin

CMD ["/bin/bash"]
