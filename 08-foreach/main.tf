resource "local_file" "foo" {
  for_each = var.demo
  content = each.value
  filename = "/tmp/${each.key}"
}

variable "demo" {
  default = {
    GRAPES = "graps"
    ORANGE = "orange"
    BANANA = "banana"
  }
}