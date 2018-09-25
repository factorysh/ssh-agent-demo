FROM bearstech/debian:stretch

RUN apt-get update &&\
        apt-get install -y \
            openssh-client \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /opt/entrypoint.sh

VOLUME /secret
ENV PRIVATE ""

ENTRYPOINT ["/opt/entrypoint.sh"]
CMD ["ssh-agent", "-a", "/secret/ssh-agent.sock", "-D"]
