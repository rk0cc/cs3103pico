# Choose Linux based distro
FROM alpine:3

# Author information
LABEL org.opencontainers.image.authors="CHAN Cheuk Long <clchan443-c@my.cityu.edu.hk>"

# Install fundamental dependencies
RUN apk update && apk upgrade
RUN apk add nano gcc g++ make automake zsh unzip zip xz xz-dev mc curl bzip2

# Install legacy python and supporting dependencies
RUN apk add musl-dev libffi-dev openssl-dev bzip2-dev zlib-dev sqlite-dev readline-dev gdbm-dev libxml2-dev libxslt-dev libjpeg-turbo-dev libpng-dev freetype-dev
ADD https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tar.xz /tmp/python2.tar.xz
RUN tar -xJf /tmp/python2.tar.xz -C /tmp && rm /tmp/python2.tar.xz
RUN cd /tmp/Python-2.7.18 && ./configure && make install
RUN rm -rf /tmp/Python-2.7.18

ADD https://bootstrap.pypa.io/pip/2.7/get-pip.py /tmp/get-pip.py
RUN python2 /tmp/get-pip.py
RUN rm /tmp/get-pip.py

# Provide better zsh prompt
RUN echo 'PROMPT="%n@%m:%d> "' >> /etc/zsh/zshrc

# Invoke shell
CMD ["/bin/zsh", "-c"]
