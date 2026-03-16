# Cloud & Virtual Machines

## Cloud
 
### What is cloud computing?

Cloud computing is the delivery of computing services over the internet instead of running them on your own computers/servers.

Services:
- Storage
- Servers
- Databases
- Networking
- Software
- Analytics
- Artificial Intelligence
 
### How do we know if something is in the cloud?
 
A service is usually cloud based if you need the **internet** to access it, if the data is stored on **remote servers**, if you **don't manage hardware** yourself, or if you can access it from **multiple devices anywhere**.

### Differences between on-prem and the cloud?

| Feature           | On-Prem          | Cloud            |
| ----------------- | ---------------- | ---------------- |
| Hardware location | Company building | Data centres     |
| Setup cost        | High upfront     | Low upfront      |
| Maintenance       | Company managed  | Provider managed |
| Scalability       | Slow to expand   | Quick to scale   |
| Access            | Internal network | Internet access  |

###  4 deployment models of cloud: private vs public vs hybrid vs multi-cloud

#### Private (Single-tenant)

Cloud infrastructure is used by one organization only allowing for more control and security, however this comes with a high cost and management needs.

#### Public (Multi-tenant)

Infrastructure owned by a cloud provider and shared between customers, like AWS and Google. These are cheaper and more scalable but allow less control.

#### Hybrid

A mix of private and public allowing sensitive data to be kept private and websites hosted publicly. This allows for more flexibility and a better security balance.

#### Multi

Using multiple cloud providers at the same time like using AWS for applications and Google for storage. This avoids dependency on one provider increasing reliability.

### Types of cloud services: IaaS, PaaS, SaaS

#### IaaS (Infrastructure as a Service)

The servers, storage, and networking are rented. The operating systems and applications are self managed.

#### PaaS (Platform as a Service)

The provider manages infrastructure and runtime environment, you just deploy applications.

#### SaaS (Software as a Service)

Ready to use software delivered over the internet, like Microsoft 365. You only use the software, everything else is managed.

![Resposibility Diagram](images/shared-responsibility.svg)

### What are the advantages/disadvantages of the cloud? (Particularly for a business)
 
* Difference between OpEx vs CapEx and how it relates the cloud
 
* Is migrating to the cloud always cheaper?
* Guaranteed levels of service
 
### Marketshare - Who are the biggest cloud providers?
 
### Which cloud provider do you think might be the best?
 
### What sorts of things do you usually need to pay for when using the cloud?


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

