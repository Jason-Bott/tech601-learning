# IaC & Terraform

- [IaC \& Terraform](#iac--terraform)
  - [Infrastructure as Code (IaC)](#infrastructure-as-code-iac)
    - [Two main types of IaC](#two-main-types-of-iac)
      - [Declaritive IaC (Desired State)](#declaritive-iac-desired-state)
      - [Imperative IaC (Procedural)](#imperative-iac-procedural)
      - [Key Differences](#key-differences)
    - [Two main types of IaC (again)](#two-main-types-of-iac-again)
      - [Tools](#tools)
  - [Terraform](#terraform)
    - [Why is Terraform so popular?](#why-is-terraform-so-popular)
    - [How it works](#how-it-works)
    - [tf.state](#tfstate)
  - [Setting up environment variables for Access Keys](#setting-up-environment-variables-for-access-keys)
  - [Setting up main.tf](#setting-up-maintf)
    - [Provider Block](#provider-block)
    - [Resource Block](#resource-block)
  - [Commands](#commands)
  - [Variables](#variables)
    - [Provider Block](#provider-block-1)
    - [Resource Block](#resource-block-1)
  - [.gitignore for Terraform](#gitignore-for-terraform)
  - [Creating Terraform scripts](#creating-terraform-scripts)
    - [main.tf](#maintf)
    - [variable.tf](#variabletf)
    - [Two Tier Deployment](#two-tier-deployment)
    - [GitHub repo creation](#github-repo-creation)

## Infrastructure as Code (IaC)

Infrastructure as Code (IaC) is the practice of managing and provisioning infrastructure (servers, networks, databases) using code instead of manual setup.

Instead of clicking around in a console, you write files that define what resources you want and how they should be configured.

### Two main types of IaC

#### Declaritive IaC (Desired State)

You define what you want but not how to get there. You describe the end stat, the tool figures out the steps.

Example:

- ami = "ami-123"
- instance_type = "t3.micro"
- etc

#### Imperative IaC (Procedural)

You define how to do it step by step. You write instructions and the execution takes place.

Example:

- create-server
- install-nginx
- start-nginx
- etc

#### Key Differences

| Feature     | Declarative       | Imperative               |
| ----------- | ----------------- | ------------------------ |
| Focus       | End state         | Steps/process            |
| Control     | Less control      | Full control             |
| Complexity  | Simpler to manage | More complex             |
| Idempotency | Built-in          | Must be handled manually |
| Debugging   | Easier            | Harder                   |

### Two main types of IaC (again)

- Orchestration
  - Terraform
- Config management
  - Ansible

#### Tools

- Delcarative
  - Terraform
  - AWS CloudFormation
  - Azure Resource Manager
  - Pulumi
- Imperative
  - Ansible
  - Chef
  - Puppet
  - Shell/Bash scripts

## Terraform

### Why is Terraform so popular?

- Multi-cloud support
  - Works with AWS, Azure, etc
  - One tool for everything
- Declarative and simple
  - Uses HCL (HashiCorp Configuration Language)
  - Easy to read and learn
- Strong ecosystem
  - Huge provider library
  - Large community
- Execution plan
  - `terraform plan` shows exact changes before applying
  - Reduces risk
- State management
  - Tracks infrastructure automatically

### How it works

Terraform follows the following workflow:

`plan -> apply -> manage state`

1. Write configuration
    - Define infrastructure in `.tf` files
2. Initialize
    - `terraform init`
    - Downloads providers (e.g. AWS, Azure, etc)
3. Plan
    - `terraform plan`
    - Compares your code (desired state) to the real infrastructure (current state)
    - Outputs a diff
4. Apply
    - `terraform apply`
    - Executes changes to match desired state
5. State tracking
    - Terraform keeps a record of what it created

### tf.state

The `terrafrom.tfstate` file is Terraform's source of truth. It stores what resources exist, their configuration, and metadata (IDs, dependencies, etc).

`tf.state` is both important and **sensitive** because it contains secrets. The file can store API keys, passwords, private IPs, resource IDs, etc. It should be treated like a secret file.

Terraform uses it to know what exists and to avoid recreating resources that are already there. If it gets lost or corrupted then Terraform may try to recreate everything which could cause outages or duplication.

## Setting up environment variables for Access Keys

1. Type "environment variables" into windows search
2. Select Environment variables
3. Under user variables, press new
4. In Variable add "AWS_ACCESS_KEY" or "AWS_SECRET_ACCESS_KEY"
5. In Value add the key

## Setting up main.tf

### Provider Block

Example:

```
# Where to create this resource
provider "aws" {
  # Which region to create it in
  region = "eu-west-1"
  
  # terraform init - download required dependencies for that cloud service provider
}
```

The provider block tells terraform which cloud provider you are going to use, using a `terraform init` will download required dependencies for that cloud provider. Inside the block extra information can be set, for example the region which instances should be created.

### Resource Block

Example:

```
# Which service?
resource "aws_instance" "first_app_instance" {
  # Which AMI?
  ami = var.app_ami_id

  # What instance type?
  instance_type = var.instance_type

  # Do we want a public IP address?
  associate_public_ip_address = true

  # Name of resource
  tags = {
    Name = "tech601-jason-tf-instance"
  }
}
```

The resource block is used to tell terraform what to create, in this example it creates an EC2 instance and assigns it a name for terraform (note this name is not the one used for AWS). Inside this block variables can be assigned to indicate things like AMIs, instance types, names, etc.

## Commands 

Install dependencies needed:

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

## .gitignore for Terraform

Template:

> https://raw.githubusercontent.com/github/gitignore/main/Terraform.gitignore

Important files to ignore:

- .tfstate
- .tfstate.backup
  - These files will contain sensitive data so need to be kept hidden
- variable.tf
  - Can hide information that other people don't need to see

## Creating Terraform scripts

- For each task/folder there are two files that are created:
  - `main.tf`
  - `variable.tf`

### main.tf

The `main.tf` file contains the provider and resource blocks, this is where the cloud provider that will be used is stated (AWS in this case) as well as the instances to be created. Each block can take in as much or as little information (as long as the necessary is included) as you want.

### variable.tf

The `variable.tf` file contains all the variables to be used in the `main.tf` file. These files can be added to the `.gitignore` so that all information like AMI IDs, SG IDs or SSH key pairs are not pushed to GitHub. The `main.tf` file can then reference these variables for use by Terraform

### Two Tier Deployment

When deploying an app with a database the app needs the databases private IP to connect to it. Because of this the app should be created second. Terraform can detect refrences from one creation of an instance and creates an implicit dependency. So if the app requires the databases Ip as a variable, Terraform will create the db first, wait for a private Ip and then inject this value into the app before creating the app.

Terraform has a strict evaluation order however, this is:

1. Input variables (your variables.tf)
2. Locals
3. Resources (like aws_instance)
4. Outputs

Because of this, the app's user data cannot contain the reference to the databases private Ip in the `variable.tf` file. To work around this a new file can be created containing the user data and a reference to an external variable (the private Ip). In the `main.tf` file this user data can be read using `templatefile()`. This function reads the file at the given path and renders its content as a template, variables (like the private Ip) can then be inserted into this template to create a user data script that now contains everything we had before, and also the private Ip.

### GitHub repo creation

A personal access token will need to be created. **MAKE SURE THIS IS NOT PUSHED TO GITHUB.** The token will required the following permissions when being created:

- repo
- delete_repo