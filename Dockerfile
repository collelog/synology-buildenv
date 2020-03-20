FROM ubuntu:16.04
LABEL maintainer "collelog <collelog.cavamin@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN set -eux && \
	apt-get update -qq && \
	apt-get install -y -qq --no-install-recommends bash build-essential ca-certificates curl git python3 unzip && \
	\
	# pkgscripts-ng
	mkdir /toolkit && \
	cd /toolkit && \
	git clone https://github.com/SynologyOpenSource/pkgscripts-ng.git && \
	\
	# cleaning
	apt-get clean && \
	rm -rf /tmp/* /var/lib/apt/lists/*

VOLUME /toolkit/results_file
VOLUME /toolkit/results_spk
VOLUME /toolkit/script

WORKDIR /toolkit/pkgscripts-ng
