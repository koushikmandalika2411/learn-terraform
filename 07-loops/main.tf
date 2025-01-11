# resource "null_resource" "demo" {
#   count = 10
# }

resource "null_resource" "demo" {
  count = length(var.demo)
}

variable "demo" {
  default = [
    "Apple",
    "Banana"
  ]
}