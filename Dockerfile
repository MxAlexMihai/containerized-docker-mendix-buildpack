FROM amd64/alpine:3.14.1

# inspired by https://github.com/itzg/easy-add/releases/download/${EASY_ADD_VER}/easy-add_${TARGETOS}_${TARGETARCH}${TARGETVARIANT} /usr/bin/easy-add

LABEL org.opencontainers.image.authors="Alex Mihai <>"

RUN apk update \
	&& apk add \
	bash \
	make \
	unzip \
	sudo \
	git \
	docker-cli \
	docker-compose


ARG MXBUILDPACKTAG=v6.0.1

RUN git clone --branch ${MXBUILDPACKTAG} https://github.com/mendix/docker-mendix-buildpack.git /docker-mendix-buildpack
# RUN git clone --single-branch --branch v3.1.1 https://github.com/mendix/docker-mendix-buildpack /docker-mendix-buildpack
# RUN git clone https://github.com/mendix/docker-mendix-buildpack /docker-mendix-buildpack

VOLUME ["/docker-mendix-buildpack/project"]
VOLUME ["/var/run/docker.sock"]

WORKDIR /docker-mendix-buildpack
ENTRYPOINT ["/bin/bash"]
