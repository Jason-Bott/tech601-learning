# Cloud Notes

## Pros and Cons of Cloud

### Advantages

- Cloud providers manage the data centres and physical servers for you
  - No need for single users to maintain cooling systems, power, etc
- Cloud systems can increase or decrease resources quickly depending on demand
- Enables remote working
- Allows data to be available across multiple devices
- Provides automatic updates

### Disadvantages

- Requires a stable internet connection
- Data is stored in third-party data centres
- Can be expensive
- Limited control over system architecture, it is handled by the provider
- Massive data centres
  - High energy consumption
  - Envrionmental footprint

## Virtual Machine Documentation

### Creating an instance

1. Add name, formatted appropriately (e.g. tech601-jason-first-vm)
2. Select Amazon Machine Image (e.g. Ubuntu, Windows)
3. Select Instance Type (e.g. t3.micro)
4. Select your key pair for login (or create one)
5. Set up network settings using security group or create a new one
6. Configure storage
7. Launch instance

### Creating a key pair

1. Enter key pair name, include service used (e.g. tech601-jason-aws)
2. Select key pair type (RSA)
3. Select file format (.pem)

### Creating a security group

1. Add security group name, include what is allowed in name (e.g. tech601-jason-allow-ssh-http)
2. Add description
3. Ensure rules are set properly (can be done simply in non edit mode first)
4. Will create group on instance creation

### Using the virtual machine 

- Ensure in the ireland region

#### Connecting

1. Instance State -> Start Instance
2. Connect -> SSH Client
3. In GitBash enter .ssh folder and run commands shown
   1. chmod command ensures key pair is read only
   2. ssh -i command connects to the virtual machine

#### Exiting

1. In GitBash enter "exit"
2. Instance State -> Stop Instance
   1. Or Terminate if no longer needed

