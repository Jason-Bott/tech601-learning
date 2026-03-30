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
  - [.gitignore for Terraform](#gitignore-for-terraform)

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

## .gitignore for Terraform

Template:

> https://raw.githubusercontent.com/github/gitignore/main/Terraform.gitignore

Important files to ignore:

- .tfstate
- .tfstate.backup
  - These files will contain sensitive data so need to be kept hidden
- variable.tf
  - Can hide information that other people don't need to see