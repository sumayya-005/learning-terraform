variable "sample" {
  default = "hello"
}

# Variable is not a combination then var.sample, if it is combining with any other string then ${var.sample}
output "sample" {
  value = "var.sample"
}

output "sample1" {
  value = "Hey, ${var.sample}"
}

#string data type
variable "sample1" {
  default = "Hello World"
}

