FROM ubuntu:20.04
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get -y install \
        git \
        libsecret-1-dev \
        pkg-config \
        nodejs \
        npm \
	vim
RUN npm install -g --unsafe-perm joplin
CMD ["joplin"]

ADD .vimrc /root/

RUN \
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
  vim +PluginInstall +qall

RUN apt-get install --no-install-recommends -y locales && rm -rf /var/lib/apt/lists/*
RUN echo "LC_ALL=zh_TW.UTF-8" >> /etc/environment
RUN echo "zh_TW.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=zh_TW.UTF-8" > /etc/locale.conf