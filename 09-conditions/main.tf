variable "a" {}

output "test" {
  value = var.a > 10 ? "a is GT 10" : "a is LT 10"
}