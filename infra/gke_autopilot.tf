module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 3.0"

  project_id   = var.project_id
  network_name = "${var.project_id}-vpc"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name   = "subnet-gke"
      subnet_ip     = "10.0.0.0/22"
      subnet_region = var.region
    }
  ]

  secondary_ranges = {
    subnet-gke = [
      {
        range_name    = "pods"
        ip_cidr_range = "192.168.64.0/20"
      },
      {
        range_name    = "services"
        ip_cidr_range = "192.168.100.0/24"
      },
    ]
  }
}

module "kubernetes-engine" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "17.1.0"

  name               = var.gke_name
  project_id         = var.project_id
  region             = var.region
  network            = module.vpc.network_name
  subnetwork         = module.vpc.subnets_names[0]
  ip_range_pods      = "pods"
  ip_range_services  = "services"
  release_channel    = "RAPID"

}
