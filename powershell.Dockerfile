# Dockerfile for completing CS3103 tutorials
# Copyright (C) 2025 CHAN Cheuk Long
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Choose Linux based distro
FROM alpine:latest

# Author information
LABEL org.opencontainers.image.authors="CHAN Cheuk Long <clchan443-c@my.cityu.edu.hk>"

# Install fundamental dependencies
RUN apk --no-cache upgrade
RUN apk --no-cache add nano gcc g++ make automake readline powershell unzip zip xz xz-dev mc curl bzip2 htop

# Install legacy python and supporting dependencies
RUN apk --no-cache add musl-dev libffi-dev openssl-dev bzip2-dev zlib-dev sqlite-dev readline-dev gdbm-dev libxml2-dev libxslt-dev libjpeg-turbo-dev libpng-dev freetype-dev
ADD https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tar.xz /tmp/python2.tar.xz
RUN tar -xJf /tmp/python2.tar.xz -C /tmp && rm /tmp/python2.tar.xz
RUN cd /tmp/Python-2.7.18 && ./configure && make install
RUN rm -rf /tmp/Python-2.7.18

# Install man pages and documentation files
RUN apk --no-cache add mandoc man-pages
COPY fetch_manpage.sh /opt/fetch_manpage.sh
RUN chmod +x /opt/fetch_manpage.sh
RUN /opt/fetch_manpage.sh

# Invoke shell
CMD ["/usr/bin/pwsh"]
