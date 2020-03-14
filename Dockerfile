FROM ubuntu:18.04
LABEL maintainer "collelog <collelog.cavamin@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN set -eux && \
	apt-get update -qq && \
	apt-get install -y -qq --no-install-recommends ca-certificates curl bash build-essential python3 unzip && \
	\
	# pkgscripts-ng
	mkdir -p /toolkit/pkgscripts-ng && \
	cd /toolkit/pkgscripts-ng && \
	curl -fsSL https://github.com/SynologyOpenSource/pkgscripts-ng/tarball/master \
		| tar -xz --strip-components=1 && \
	\
	# cleaning
	apt-get clean && \
	rm -rf /tmp/* /var/lib/apt/lists/*

WORKDIR /toolkit/script
