provider "vsphere" {
    vsphere_server          = var.vsphere_server
    user                    = var.vsphere_user
    password                = var.vsphere_password
    allow_unverified_ssl    = true
}

data "vsphere_datacenter" "dc" {
    name                    = var.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
    name                    = var.vsphere_datastore
    datacenter_id           = "${data.vsphere_datacenter.dc.id}"
  
}

data "vsphere_resource_pool" "pool" {
  name          = "Cluster-1/Resources"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_compute_cluster" "compute_cluster" {
  name          = "Cluster-1"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}


data "vsphere_network" "network" {
    name                    = var.vm_network
    datacenter_id           = "${data.vsphere_datacenter.dc.id}"  
}

data "vsphere_virtual_machine" "template" {
  name                      = var.vm_template
  datacenter_id             = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_host" "host" {
  name          = "10.1.160.15"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
    name                    = "test-vj"
    resource_pool_id        = "${data.vsphere_resource_pool.pool.id}"
    datastore_id            = "${data.vsphere_datastore.datastore.id}"

    num_cpus                = 12
    memory                  = 32768
    guest_id                = "rhel7_64Guest"
    shutdown_wait_timeout   = 10

    network_interface {
        network_id          = "${data.vsphere_network.network.id}"
        adapter_type        = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
    }

    disk {
        label               = "disk0"
        size                = 120
    }

    #Included a clone attribute in the resource
    clone {
        template_uuid       = "${data.vsphere_virtual_machine.template.id}"

        
    }
  
}

# resource "vsphere_virtual_machine" "vmFromRemoteOvf" {
#   name                       = "vm2"
#   resource_pool_id           = data.vsphere_resource_pool.pool.id
#   datastore_id               = data.vsphere_datastore.datastore.id
#   host_system_id             = data.vsphere_host.host.id
#   wait_for_guest_net_timeout = 0
#   wait_for_guest_ip_timeout  = 0
#   datacenter_id              = data.vsphere_datacenter.dc.id
#   ovf_deploy {
#     // Url to remote ovf/ova file
#     remote_ovf_url = "https://rhcos-redirector.apps.art.xq1c.p1.openshiftapps.com/art/storage/releases/rhcos-4.8/48.84.202105190318-0/x86_64/rhcos-48.84.202105190318-0-vmware.x86_64.ova"
#   }
# }