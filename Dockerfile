FROM alpine:3.8

RUN apk --no-cache add \
    git \
    gnupg

# Cache empty keychain
RUN gpg --list-keys

COPY verify.sh /verify.sh
ENTRYPOINT ["/verify.sh"]
