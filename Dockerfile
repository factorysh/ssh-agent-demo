FROM bearstech/debian:stretch

RUN apt-get update &&\
        apt-get install -y \
            expect \
            openssh-client \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /opt/entrypoint.sh

VOLUME /secret
ENV PRIVATE ""
ENV SSH_AUTH_SOCK /secret/ssh-agent.sock

ENTRYPOINT ["/opt/entrypoint.sh"]
CMD ["agent"]
