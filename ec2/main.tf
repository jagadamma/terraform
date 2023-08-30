resource "aws_instance" "example" {
  for_each = var.instance_configurations

  ami           = each.value.ami
  instance_type = each.value.instance_type
  #subnet_id    = each.value.subnet_id
  #vpc_id       = each.value.id
  key_name      = each.value.key_name
  tags          = each.value.tags
}
