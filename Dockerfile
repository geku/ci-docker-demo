FROM cloudgear/ruby:2.2
MAINTAINER Georg Kunz, CloudGear GmbH <contact@cloudgear.net>

RUN apt-get update -q && apt-get install -yq --no-install-recommends \
        curl \
        jq \
        wget && \
    # clean up
    rm -rf /var/lib/apt/lists/* && \
    truncate -s 0 /var/log/*log && \

    # Install binaries
    wget --quiet -P /usr/local/bin https://storage.googleapis.com/kubernetes-release/release/v1.5.3/bin/linux/amd64/kubectl && \
    chmod u+x /usr/local/bin/kubectl && \
    wget --quiet -O /tmp/sigil.tgz https://github.com/gliderlabs/sigil/releases/download/v0.4.0/sigil_0.4.0_Linux_x86_64.tgz && \
    tar -xzvf /tmp/sigil.tgz -C /usr/local/bin/ && \
    chmod u+x /usr/local/bin/sigil
