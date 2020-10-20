FROM ubuntu:20.04
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get -y install \
        git \
        libsecret-1-dev \
        pkg-config \
        nodejs \
        npm \
		vim \
		locales
RUN locale-gen "zh_TW.UTF-8" \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=zh_TW.UTF-8

ENV LANG zh_TW.UTF-8 
ENV LC_ALL zh_TW.UTF-8

RUN npm install -g --unsafe-perm joplin
CMD ["joplin"]

ADD .vimrc /root/

RUN \
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
  vim +PluginInstall +qall
