packer {
  required_plugins {
    ansible = {
      version = "v1.0.0"
      source  = "github.com/hashicorp/ansible"
    }
    vagrant = {
      version = "~> 1"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}

source "vagrant" "almalinux9" {
  communicator = "ssh"
  source_path  = "almalinux/9"
  provider     = "virtualbox"
  add_force    = true
  box_version  = "9.4.20240805"
}

build {
  name = "almalinux-server1"
  sources = ["source.vagrant.almalinux9"]


  provisioner "ansible" {
    playbook_file = "./gui_server.yml"
    use_proxy     = false
    ansible_env_vars = [
      "ANSIBLE_HOST_CHECKING=False",
    ]
  }

  post-processor "vagrant-registry" {
    client_id     = "${var.hcp_client_id}"
    client_secret = "${var.hcp_client_secret}"
    version       = "${var.output_box_version}"
    box_tag       = "${var.box_name}"
    architecture  = "amd64"
  }


}
