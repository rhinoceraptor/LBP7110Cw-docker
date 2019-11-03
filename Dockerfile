FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install --yes \
  avahi-daemon \
  libnss-mdns \
  wget \
  cups \
  sudo \
  whois \
  cups \
  cups-client \
  cups-bsd \
  cups-filters \
  foomatic-db-compressed-ppds \
  printer-driver-all \
  openprinting-ppds \
  hpijs-ppds \
  hp-ppd \
  hplip \
  smbclient
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN update-rc.d avahi-daemon enable

WORKDIR /opt
RUN wget http://gdlp01.c-wss.com/gds/1/0100005951/10/linux-UFRIILT-drv-v500-usen-18.tar.gz
RUN tar xzf linux-UFRIILT-drv-v500-usen-18.tar.gz
RUN dpkg -i linux-UFRIILT-drv-v500-usen/64-bit_Driver/Debian/cnrdrvcups-ufr2lt-us_5.00-1_amd64.deb

COPY cupsd.conf /etc/cups/

CMD ["cupsd"]
