# Dockerfile for dev environment

FROM ubuntu
MAINTAINER Manish Jain <manishrjain@gmail.com>
RUN apt-get update && apt-get install -y \
 ack-grep \
 cmake \
 curl \
 g++ \
 git \
 golang \
 make \
 man-db \
 mercurial \
 ncurses-dev \
 nodejs \
 npm \
 procps \
 python-dev \
 python-pip \
 ssh \
 sudo \
 unzip \
 vim \
 xz-utils \
 tmux \
 ctags \
 && rm -rf /var/lib/apt/lists/*

RUN pip install ipython

# Store your favourite bashrc config, and copy it over.
# WARNING: If you don't have a bashrc, this step would fail.
COPY bashrc /root/.bashrc

# Vundle: Vim plugin manager
RUN git clone https://github.com/gmarik/Vundle.vim.git /root/.vim/bundle/Vundle.vim

# YouCompleteMe: This plugin takes the longest time to download all its deps. So, let's do the downloading as a separate step.
RUN git clone https://github.com/Valloric/YouCompleteMe.git /root/.vim/bundle/YouCompleteMe
RUN cd /root/.vim/bundle/YouCompleteMe && git submodule update --init --recursive \
 && ./install.sh --clang-completer

RUN mkdir -p /go/src

ENV GOPATH /go
ENV GOBIN /go/bin
ENV PATH /go/bin:$PATH
ENV HOME /root
WORKDIR /go/src

#fix godef
RUN git clone https://github.com/9fans/go /go/src/9fans.net/go

# VIM
COPY vimrc /root/.vimrc
RUN vim +PluginInstall  +qall
RUN vim +GoInstallBinaries +qall

# Change timezone
RUN ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime

CMD ["/bin/bash"]

# Run Docker with
# sudo docker run -i -t -v ~/workspace/src:/go/src testing2
