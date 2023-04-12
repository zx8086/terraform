terraform {
  required_version = ">= 1.0.0"
  required_providers {
    elasticstack = {
      source  = "elastic/elasticstack"
      version = "~> 0.5.0"
    }
  }
}

provider "elasticstack" {
  elasticsearch {
    api_key  = "QlFJX1BvY0JyMkptbjg3aWtVSDQ6MHRtUk9aZGZUc2FpT0lGN1RkUlIxQQ=="
    endpoints = ["https://192.168.0.156:9200"]
  }
}

resource "elasticstack_elasticsearch_cluster_settings" "my_cluster_settings" {
  transient {
    setting {
      name  = "indices.breaker.total.limit"
      value = "60%"
    }
  }
}