# Debian based container intended for testing of Ansible depolyments

FROM debian:buster
MAINTAINER fiki <martin.fikejz@gmail.com>

RUN set -eux \
	&& printf "Acquire::http::Pipeline-Depth 0;\nAcquire::http::No-Cache true;\nAcquire::BrokenProxy true;" > /etc/apt/apt.conf.d/99fixbadproxy \
	&& apt-get update \
	&& apt-get install -y \
		aptitude \
		sudo \
		python \
		openssh-server \
	&& rm -rf /var/lib/apt/lists/* \
	&& apt-get purge -y --autoremove

# Create user and add to sudoers
RUN set -eux \
		&& useradd -m -s /bin/bash fiki \
		&& echo "fiki ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/fiki

COPY files /

ENTRYPOINT ["/entrypoint.sh"]

USER fiki

