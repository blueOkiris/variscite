# Variscite Yocto Builder

## Set Up Env

1. [Install Vagrant](https://developer.hashicorp.com/vagrant/docs/installation)
2. [Install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
3. Run in cmd prompt from this folder: `mkdir yocto-build`
4. Run in cmd prompt from this folder: `vagrant up`
   + If it times out, run `vagrant up --provision` a few times
   + If it still doesn't work, delete with `vagrant destroy` then try again
5. Run in cmd prompt from this folder to gain access to vm: `vagrant ssh`
6. Run in vm to set up repo: `chmod +x init-repo.sh && ./init-repo.sh "Your Name" "your.git-email@whatever.com"`
7. Run in vm: `chmod +x build.sh`

## Building

1. If vm not running, then run in cmd prompt from this folder: `vagrant up`
2. Run in cmd prompt to gain access: `vagrant ssh`
3. Run in vm to build: `./build.sh`

## Update

TODO - depends on if we change anything, but won't be difficult

## Delete

Run in cmd prompt from this folder: `vagrant destroy`

