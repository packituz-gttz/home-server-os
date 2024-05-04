packer {
  required_plugins {
    ansible = {
      version = "v1.0.0"
      source = "github.com/hashicorp/ansible"
    }
  }
}

source "vagrant" "almalinux9" {
  communicator = "ssh"
  source_path  = "almalinux/9"
  provider     = "virtualbox"
  add_force    = true
  box_version  = "${var.box_version}"
}

build {
  name    = "almalinux-server"
  sources = ["source.vagrant.almalinux9"]


  provisioner "ansible" {
    playbook_file = "./gui_server.yml"
    use_proxy     = false
    ansible_env_vars = [
      "ANSIBLE_HOST_CHECKING=False",
    ]
  }

  post-processor "vagrant-cloud" {
    access_token = "${var.cloud_access_token}"
    version      = "${var.output_box_version}"
    box_tag      = "${var.box_name}"
  }

}
