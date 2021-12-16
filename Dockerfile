FROM ubuntu:focal
ARG USER=dealii
ARG USER_PASSWORD=dealii
ARG DEAL_REPO=ppa:ginggs/deal.ii-9.2.0-backports

RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get -y install tzdata

RUN apt-get update \
  && apt-get install -y software-properties-common \
  && add-apt-repository $DEAL_REPO \
  && apt-get update \
  && apt-get install -y ssh \
      build-essential \
      gcc \
      g++ \
      gdb \
      clang \
      make \
      ninja-build \
      cmake \
      autoconf \
      automake \
      locales-all \
      rsync \
      tar \
      python \
	  sudo \
	  deal.II \
  && apt-get clean

RUN ( \
    echo 'LogLevel DEBUG2'; \
    echo 'PermitRootLogin yes'; \
    echo 'PasswordAuthentication yes'; \
    echo 'Subsystem sftp /usr/lib/openssh/sftp-server'; \
  ) > /etc/ssh/sshd_config\
  && mkdir /run/sshd

RUN useradd -m $USER\
  && yes $USER_PASSWORD | passwd $USER 

RUN usermod -s /bin/bash -aG sudo $USER

CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]
