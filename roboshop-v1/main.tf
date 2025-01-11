module "frontend" {
  source = "./vm"
  component = "frontend"
}

module "catalogue" {
  source = "./vm"
  component = "catalogue"
}