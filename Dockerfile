FROM python:3.5.2
MAINTAINER Tim Li <timli.mv@gmail.com>

RUN apt-get update && apt-get install -y \
    apt-utils \
    sudo \
    sed \
    debconf \
    locales \
    locales-all

COPY docker/locale.gen /etc/
RUN locale-gen
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en

RUN adduser --disabled-password --gecos '' python_user
RUN adduser python_user sudo
RUN echo "python_user       ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN python -m pip install --upgrade pip
RUN pip install -U pytest

COPY docker/initscript.sh /
RUN chmod +x /initscript.sh
RUN su -c "/initscript.sh" - python_user

CMD ["/bin/bash"]
