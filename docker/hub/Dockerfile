FROM jdubois/jhipster-docker

# parameters
ENV JHIPSTER_GITHUB https://github.com/vhadzhipopov/power.git

# clone project
USER jhipster
RUN cd /home/jhipster && \
    git clone ${JHIPSTER_GITHUB} /home/jhipster/github/ && \
    cd /home/jhipster/github/ && \
    mvn -Pprod package -DskipTests=true && \
    mv /home/jhipster/github/target/*.war /home/jhipster/app.war && \
    rm -Rf /home/jhipster/github && \
    rm -Rf /home/jhipster/.m2/repository/ && \
    rm -Rf /home/jhipster/.npm/

USER root
RUN mv /home/jhipster/app.war /app.war

RUN bash -c 'touch /app.war'
ADD run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 8080
VOLUME /tmp
CMD ["/run.sh"]
