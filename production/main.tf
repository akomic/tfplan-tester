terraform {
  required_version = ">= 1.0"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}

# Simple random string resource for testing
resource "random_string" "test" {
  length  = 16
  special = false
  upper   = false
}

# Local file output for demonstration
resource "local_file" "test_output" {
  content  = "Generated random string: ${random_string.test.result}"
  filename = "${path.module}/output.txt"
}

# Output the random string
output "random_value" {
  description = "The generated random string"
  value       = random_string.test.result
}

output "file_path" {
  description = "Path to the generated file"
  value       = local_file.test_output.filename
}
