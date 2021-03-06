FROM google/ruby
RUN apt-get update && apt-get install -y git

WORKDIR /app
RUN git clone https://bitbucket.org/glycoSW/glytoucan-stanza.git

WORKDIR /app/glytoucan-stanza
RUN git pull && git checkout f9ae434
EXPOSE 9292
ENV RACK_ENV production
RUN ["/usr/bin/bundle", "install"]

WORKDIR /
ADD run.sh /run.sh
CMD ["/run.sh"]
