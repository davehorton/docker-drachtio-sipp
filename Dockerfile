FROM debian:jessie

RUN apt-get update \
  && apt-get -y --quiet --force-yes upgrade \
  && apt-get install -y --no-install-recommends ca-certificates gcc g++ make build-essential git wget libssl-dev libpcap-dev libncurses-dev \
  && cd /usr/local/src \
  && wget https://github.com/SIPp/sipp/releases/download/v3.5.1/sipp-3.5.1.tar.gz \
  && tar xvf sipp-3.5.1.tar.gz && cd sipp-3.5.1 && ./configure --with-pcap && make && make install \
  && apt-get purge -y --quiet --force-yes --auto-remove ca-certificates gcc g++ make build-essential git wget \
  && rm -rf /var/lib/{apt,dpkg,cache,log}/ \
  && rm -Rf /var/log/* \
  && rm -Rf /var/lib/apt/lists/* \
  && cd /usr/local/src \
  && rm -Rf * \
  && mkdir /scenarios

VOLUME ["/scenarios"]

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["sipp"]
