# initialize terraform file
terraform init

# terraform apply a config file
terraform apply
terraform apply --auto-approve

# define variable with terraform plan
terraform plan --var-file="dev.tfvars"

# define variable with terraform plan in direct line
terraform plan -var="bucket_name=jordy-s3-bucket"

# look for state of ressource
terraform state list

# show state a liste ressource in detail
terraform state show subnet-1 (for example)

# show the differents output of the file
terraform output

# to show ouput without impacting our environment use refresh command
terraform refresh
terraform output

# terrraform ressource 
terraform destroy -target aws_instance.web-server-instance # destroy onlty instance
terraform apply -target aws_instance.web-server-instance # apply only instace

# terrafor variable
# it is possible to define the v ariable while running apply command
terraform apply -var "subnet_prefix=10.0.100.0/24"
# we can specify a var file when apply command
terraform apply -var-file example.tfvars