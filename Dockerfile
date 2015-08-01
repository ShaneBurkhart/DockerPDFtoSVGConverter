# To use this, mount the directory the PDF is in into /data
# You also need to set the ENV var PDF_NAME to the name of the file.

FROM debian:jessie

RUN apt-get update && apt-get install -y pdftk poppler-utils

RUN mkdir /data
RUN mkdir /output

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["convert"]
