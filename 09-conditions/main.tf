variable "a" {}

output "test" {
  value = var.a > 10 ? "a is GT 10" : "a is LT 10"
}

resource "null_resource" "text" {
  count = var.a > 10 ? 1 : 0
}