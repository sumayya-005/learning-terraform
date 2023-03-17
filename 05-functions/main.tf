output "sample" {
  value = element(var.sample, 0)
}

variable "sample" {
  default = ["abc", 123]
}

variable "sample1" {
  default = {
    orange = {
      name  = "Orange"
      count = 10
    }
    apple = {
      name  = "Apple"
      count = 100
    }
  }
}

output "sample1" {
  value = lookup(lookup(var.sample1, "apple", null), "count", 0)
}