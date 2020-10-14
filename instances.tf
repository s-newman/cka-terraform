resource "google_compute_instance" "master" {
  name         = "master"
  machine_type = "e2-standard-2"

  metadata_startup_script = file("${path.cwd}/startup.sh")

  boot_disk {
    initialize_params {
      size  = 50
      image = "ubuntu-2004-lts"
    }
  }
  network_interface {
    network    = google_compute_network.k8s_net.name
    subnetwork = google_compute_subnetwork.k8s_subnet.name
    access_config {
      nat_ip = google_compute_address.k8s_address.address
    }
  }
}

resource "google_compute_instance" "worker" {
  count        = var.workers
  name         = "worker-${count.index}"
  machine_type = "e2-standard-2"

  metadata_startup_script = file("${path.cwd}/startup.sh")

  boot_disk {
    initialize_params {
      size  = 50
      image = "ubuntu-2004-lts"
    }
  }
  network_interface {
    network    = google_compute_network.k8s_net.name
    subnetwork = google_compute_subnetwork.k8s_subnet.name
    access_config {}
  }
}
