variable "do_api_token" {
    default = "default-token"
}

variable "do_cluster_name" {
    default = "default-cluster-name"
}

provider "digitalocean" {
    token = "${var.do_api_token}"
}

resource "digitalocean_kubernetes_cluster" "prototype" {
    name = "${var.do_cluster_name}"
    region = "sfo2"
    version = "1.16.6-do.0"

    node_pool {
        name = "worker-pool"
        size = "s-1vcpu-2gb"
        node_count = 1
    }
}

output "cluster-id" {
    value = "${digitalocean_kubernetes_cluster.prototype.id}"
}
