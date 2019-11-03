FROM mnbf9rca/cups-google-print

WORKDIR /opt
RUN wget http://gdlp01.c-wss.com/gds/1/0100005951/10/linux-UFRIILT-drv-v500-usen-18.tar.gz
RUN tar xzf linux-UFRIILT-drv-v500-usen-18.tar.gz
RUN dpkg -i linux-UFRIILT-drv-v500-usen/64-bit_Driver/Debian/cnrdrvcups-ufr2lt-us_5.00-1_amd64.deb

#CMD ["cupsd"]
CMD ["/sbin/my_init"]
