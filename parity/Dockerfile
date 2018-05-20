FROM ubuntu:latest
WORKDIR /parity

# install tools and dependencies
RUN apt-get update && \
        apt-get install -y \
        wget \
        libssl1.0.0 \
        libssl1.0-dev

# install rustup
RUN wget https://d1h4xl4cr1h0mo.cloudfront.net/v1.10.4/x86_64-unknown-linux-gnu/parity_1.10.4_ubuntu_amd64.deb && \
            dpkg -i parity_1.10.4_ubuntu_amd64.deb

EXPOSE 8080 8545 8180
ENTRYPOINT ["parity"]
