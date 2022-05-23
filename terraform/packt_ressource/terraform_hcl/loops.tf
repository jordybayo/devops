variable "number_of_bucket" {
  default = 1
}

resource "aws_s3_bucket" "my_bucket" {
  count = number_of_bucket.default != 0 ? var.number_of_bucket : 1

  bucket = "my-bucket-01323"
}

variable "users" {
  default = ["batman", "superman", "ironman"]
}

resource "aws_iam_user" "users" {
  for_each = toset(var.users)
  name     = each.value
}


##############################################

variable "ast_tags" {
  type = map(string)
  default = {
    Name = "ASG_EC2"
    Type = "m4.large"
    Team = "DEV"
  }
}

resource "aws_autoscaling_group" "asg" {
  max_size = 0
  min_size = 0

  dynamic "tag" {
    for_each = var.ast_tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

##############################################
# Outputs
output "uppercase_heros" {
  value = [for hero in var.users : upper(hero) if length(hero) < 7]
}