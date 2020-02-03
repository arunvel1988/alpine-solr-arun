  FROM alpine
  
  MAINTAINER admin
   
   
   
  RUN apk --update add openjdk8-jre wget gnupg bash curl && rm -rf /var/cache/apk/*
   
  RUN adduser solr --disabled-password
  
 RUN cd /opt
 
 RUN wget https://archive.apache.org/dist/lucene/solr/8.3.1/solr-8.3.1.tgz && \
 tar xzf solr-8.3.1.tgz solr-8.3.1/bin/install_solr_service.sh --strip-components=2 && \
 apk add --no-cache --upgrade bash && \
 apk add openrc --no-cache
 
 
 RUN  bash ./install_solr_service.sh solr-8.3.1.tgz
  
 EXPOSE 8983
 WORKDIR /opt/solr
 USER solr
 CMD ["bin/solr", "start" , "-f" ]
                          
