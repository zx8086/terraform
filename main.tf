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
    endpoints = ["https://elasticsearch.siobytes.com/"]
    cert_file = "SiobytesFullChain.pem"
    key_file = "server.key"
  }
}

# module "elasticstack_elasticsearch_cluster_settings" {
#   source = "./modules/elasticstack_elasticsearch_cluster_settings"
# }


# resource "elasticstack_kibana_space" "example" {
#   space_id    = "test_space"
#   name        = "Test Space"
#   description = "A fresh space for testing visualisations"
#   initials    = "ts"
# }

resource "elasticstack_elasticsearch_cluster_settings" "my_cluster_settings" {
  transient {
    setting {
      name  = "indices.breaker.total.limit"
      value = "60%"
    }
  }
}