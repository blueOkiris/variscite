Vagrant.configure("2") do |config|
    # Base box
    config.vm.box = "ubuntu/jammy64"

    config.vm.boot_timeout = 10000

    # Set up a shared folder
    config.vm.synced_folder "yocto-build", "/build", owner: "vagrant", group: "vagrant"

    # Provisioning script
    config.vm.provision "shell", inline: <<-SHELL
        export DEBIAN_FRONTEND=noninteractives
        export TZ=America/Chicago
        sudo apt-get update \
            && sudo apt-get install -y \
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
                linux-headers-generic \
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
        sudo apt update && sudo apt upgrade -y
        curl https://commondatastorage.googleapis.com/git-repo-downloads/repo > repo
        sudo mv repo /bin/repo
        sudo chmod a+x /bin/repo
        sudo locale-gen "en_US.UTF-8"
    SHELL

    config.vm.provision "file", source: "init-repo.sh", destination: "init-repo.sh"
    config.vm.provision "file", source: "build.sh", destination: "build.sh"

    config.vm.disk :disk, size: "20GB", primary: true

    # Customize the amount of memory on the VM (optional)
    config.vm.provider "virtualbox" do |vb|
        vb.memory = "16384"
        vb.cpus = 8
    end

    config.ssh.keep_alive = true
end

