FROM mono

#ADD ./src/ /src/
RUN apt-get update \
  && apt-get install -y wget unzip

RUN curl -s https://api.github.com/repos/yar229/WebDavMailRuCloud/releases/latest \
      | grep browser_download_url \
      | grep dotNet45 \
      | cut -d '"' -f 4 \
      | wget -O /release.zip -qi -
RUN unzip release.zip -d /WebDavMailRuCloud

EXPOSE 801

CMD ["mono","/WebDavMailRuCloud/wdmrc.exe", "-h", "http://*"]
