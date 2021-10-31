project = "test-gcp-2"

app "example-nodejs" {
  labels = {
    "service" = "example-nodejs",
    "env"     = "dev"
  }

  build {
    use "pack" {
      builder = "heroku/buildpacks:20"
    }

    registry {
      use "docker" {
        image = "gcr.io/${var.gcp-project}/example-nodejs"
        tag   = "latest"
      }
    }
  }

  deploy {
    use "google-cloud-run" {
      project  = "ira-sandbox"
      location = "us-east1"

      port = 5000

      static_environment = {
        "NAME" : "World"
      }

      capacity {
        memory                     = 128
        cpu_count                  = 1
        max_requests_per_container = 10
        request_timeout            = 300
      }

      auto_scaling {
        max = 2
      }
    }
  }

  release {
    use "google-cloud-run" {}
  }
}

variable "gcp-project" {
  default     = "ira-sandbox"
  type        = string
  description = "The target gcp project for deployments"
}