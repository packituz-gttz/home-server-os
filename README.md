## Home Server OS

Custom image for home lab server based on [AlmaLinux9](https://almalinux.org/) built with packer and exported into a vagrant box compatible with virtualbox.

The purpouse of the box is to have a GUI (GNOME) and an up-to-date image of the OS used on the repo [home-server](https://github.com/packituz-gttz/home-server), since building it from the ground is very time consuming.

The box can be downloaded from here: https://app.vagrantup.com/packituz16/boxes/almalinux9-server

### Development

Be sure to have the following dependencies installed.

- GNU make: https://www.gnu.org/software/make/

- packer: https://github.com/hashicorp/packer

- Vagrant: https://github.com/hashicorp/vagrant

- Virtualbox: https://www.virtualbox.org/


Executing `make` at the root of the project displays the available commands for the project.

##### Building the Image

Create a file named vagrant-alma.auto.pkrvars.hcl and inside of it set the values for the required variables, the list of variables needed can be found in the file vagrant-alma.auto.pkr.hcl

In order to build the box and upload it into Vagrant Cloud execute

```bash
make build
```

Notice: This process is very time consuming about 45min depending on your machine and internet specs.