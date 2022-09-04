FROM python:latest

RUN apt-get update && apt-get upgrade -y && \
    apt-get install apache2-utils
COPY entrypoint.sh /usr/local/bin
RUN chmod 755 /usr/local/bin/entrypoint.sh

RUN useradd -m radicale
USER radicale:radicale
RUN mkdir -p /home/radicale/.config/radicale
RUN python3 -m pip install --upgrade radicale 

VOLUME /home/radicale/.config/radicale

EXPOSE 5232

ENTRYPOINT ["entrypoint.sh"]
