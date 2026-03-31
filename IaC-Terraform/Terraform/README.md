# Terraform

## Commands 

Install dependencies needed in script:

> terraform init

Format tf files:

> terraform fmt

Check changes in `main.tf`:

> terraform plan

Create everything in `main.tf`:

> terraform apply

Remove everything stated in `main.tf`:

> terraform destroy

## Variables

### Provider Block

- region
  - Type: string
  - Purpose: States the region the instance is located

### Resource Block

- ami
  - Type: string
  - Purpose: Gives the id of an AMI to use to create the instance with
- instance_type
  - Type: string
  - Purpose: Gives the name of the instance type to use (e.g. t3.micro)
- associate_public_ip_address
  - Type: bool
  - Purpose: States if a public ip should be made
- tags
  - Type: map of string
  - Purpose: Assigns tags with values (e.g. Name = instance_name)
- vpc_security_group_ids
  - Type: set of string
  - Purpose: Gives the ids of security groups to use
- key_name
  - Type: string
  - Purpose: Gives the name of the ssh key pair on AWS
- user_data
  - Type: string
  - Purpose: Contains user data, can load a file or be inputed manually