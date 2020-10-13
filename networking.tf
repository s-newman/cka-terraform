resource "google_compute_network" "k8s_net" {
  name = "k8s-net"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "k8s_subnet" {
  name = "k8s-subnet"
  ip_cidr_range = "10.1.0.0/16"
  network = google_compute_network.k8s_net.id
}

resource "google_compute_firewall" "k8s_allow_internal" {
  name = "k8s-allow-internal"
  description = "Allow all traffic internally."
  network = google_compute_network.k8s_net.id
  direction = "EGRESS"
  destination_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "all"
  }
}

resource "google_compute_firewall" "k8s_allow_ingress" {
  name = "k8s-allow-ingress"
  description = "Allow inbound SSH, Kubernetes API, and ICMP traffic from external sources."
  network = google_compute_network.k8s_net.id
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports = ["22", "6443"]
  }
}

resource "google_compute_address" "k8s_address" {
  name = "k8s-address"
}