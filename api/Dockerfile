FROM openjdk:12

#installs dependnecies
RUN \
##curl
yum install curl -y \
##rlwrap
yum install rlwrap -y \
## maven
yum install make -y
##lein
RUN curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > lein
RUN mv lein /usr/local/bin/lein
RUN chmod a+x /usr/local/bin/lein
##clojure
RUN curl -O https://download.clojure.org/install/linux-install-1.10.2.774.sh
RUN chmod +x linux-install-1.10.2.774.sh
RUN ./linux-install-1.10.2.774.sh

#pulls the files in
WORKDIR /api
COPY ./* ./

EXPOSE 8080

#RUN make bundle
RUN make target/bundle/bin target/bundle/datasim_server.jar
CMD ["make", "server"]
