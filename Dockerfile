# Use latest Debian stable

FROM    ubuntu:22.04

WORKDIR /opt/repo

# Install needed packages

ENV     DEBIAN_FRONTEND=noninteractives
ENV     TZ=America/Chicago
RUN     apt-get update \
            && apt-get install -y \
                asciidoc \
                autoconf \
                automake \
                bc \
                build-essential \
                chrpath \
                coreutils \
                cpio \
                curl \
                cvs \
                desktop-file-utils \
                diffstat \
                docbook-utils \
                dos2unix \
                g++ \
                gawk \
                gcc \
                gcc-multilib \
                git \
                groff \
                help2man \
                iputils-ping \
                libacl1 \
                libarchive-dev \
                libelf-dev \
                libgnutls28-dev \
                libgl1-mesa-dev \
                libglib2.0-dev \
                libglu1-mesa-dev \
                liblz4-tool \
                libncurses5 \
                libncurses5-dev \
                libncursesw5-dev \
                libsdl1.2-dev \
                libssl-dev \
                libtool \
                libyaml-dev \
                locales \
                lzop \
                make \
                mercurial \
                mtd-utils \
                pv \
                python-is-python3 \
                python3 \
                python3-git \
                python3-jinja2 \
                python3-pip \
                python3-pexpect \
                python3-subunit \
                rename \
                sed \
                socat \
                subversion \
                sudo \
                texi2html \
                texinfo \
                u-boot-tools \
                unzip \
                wget \
                xterm \
                xz-utils \
                zlib1g-dev \
                zstd

RUN     curl https://commondatastorage.googleapis.com/git-repo-downloads/repo > /bin/repo
RUN     chmod a+x /bin/repo

# Set up locale

RUN     locale-gen "en_US.UTF-8"

# Switch to non-root (bitbake requires that)

ARG     USERNAME=atono
ARG     USER_UID=1000
ARG     USER_GID=$USER_UID
RUN     groupadd --gid $USER_GID $USERNAME \
            && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
            && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
            && chmod 0440 /etc/sudoers.d/$USERNAME
RUN     chown -R $USERNAME:$USERNAME /opt/repo
USER    $USERNAME

# Copy over runtime scripts

COPY    build.sh .
RUN     sudo chmod +x build.sh

COPY    init-repo.sh .
RUN     sudo chmod +x init-repo.sh

