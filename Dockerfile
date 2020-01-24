FROM ubuntu:eoan

ARG PANDOC_VERSION=2.9.1.1
ARG CROSSREF_VERSION=0.3.6.1b
ARG EISVOGEL_VERSION=1.3.1
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update

# pandoc: https://pandoc.org
ADD https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-1-amd64.deb /tmp/pandoc.deb
RUN apt-get -y install /tmp/pandoc.deb texlive-full

# wkhtmltopdf: https://wkhtmltopdf.org
RUN apt-get -y install wkhtmltopdf

# weasyprint: https://weasyprint.org
RUN apt-get -y install build-essential python3-dev python3-pip python3-setuptools python3-wheel python3-cffi libcairo2 libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info
RUN pip3 install weasyprint

# pandocomatic: https://heerdebeer.org/Software/markdown/pandocomatic/
RUN apt-get -y install ruby
RUN gem install pandocomatic

# pandoc-crossref: 
RUN apt-get install -y wget && wget https://github.com/lierdakil/pandoc-crossref/releases/download/v${CROSSREF_VERSION}/linux-pandoc_$(echo ${PANDOC_VERSION} | sed 's/\./_/g').tar.gz -O /tmp/crossref.tar.gz
RUN tar -C/usr/bin -xvf /tmp/crossref.tar.gz ./pandoc-crossref

# eisvogel: https://github.com/Wandmalfarbe/pandoc-latex-template
ADD https://github.com/Wandmalfarbe/pandoc-latex-template/releases/download/v${EISVOGEL_VERSION}/Eisvogel-${EISVOGEL_VERSION}.tar.gz /tmp/eisvogel.tar.gz
RUN mkdir /opt/eisvogel && tar -C/opt/eisvogel/ -xvf /tmp/eisvogel.tar.gz
ADD eisvogel /usr/local/bin/eisvogel

# TODO: add more templates

RUN rm -rf /tmp/*
WORKDIR /data
