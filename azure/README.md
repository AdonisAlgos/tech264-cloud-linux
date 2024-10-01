# Learning Cloud Computing - AZURE

- [Learning Cloud Computing - AZURE](#learning-cloud-computing---azure)
  - [Cloud Architecture](#cloud-architecture)
    - [Virtual Network (VNet)](#virtual-network-vnet)
    - [Subnet](#subnet)
    - [Resource Group](#resource-group)
    - [Disk](#disk)
    - [Public IP](#public-ip)
    - [NSG Rule - Allow HTTP](#nsg-rule---allow-http)
    - [NSG Rule - Allow SSH](#nsg-rule---allow-ssh)
    - [Region](#region)
    - [SSH Key](#ssh-key)
    - [Network Interface Controller (NIC)](#network-interface-controller-nic)
    - [Virtual Machine (VM)](#virtual-machine-vm)
    - [Network Security Group (NSG)](#network-security-group-nsg)
  - [Steps to Create an SSH Key Pair on a Local Machine and Put the Public Key on Azure](#steps-to-create-an-ssh-key-pair-on-a-local-machine-and-put-the-public-key-on-azure)
    - [Creating a New SSH Key Pair on a Local Machine](#creating-a-new-ssh-key-pair-on-a-local-machine)
    - [Creating a VNet in Azure](#creating-a-vnet-in-azure)
    - [Setting an SSH key in Azure](#setting-an-ssh-key-in-azure)
  - [Why Create a VNet?](#why-create-a-vnet)
  - [Details You Need for Planning a VNet:](#details-you-need-for-planning-a-vnet)
    - [CIDR Block:](#cidr-block)
    - [Subnets:](#subnets)


## Cloud Architecture

### Virtual Network (VNet)
A **Virtual Network (VNet)** provides an isolated network where you can securely deploy and manage resources such as virtual machines (VMs). VNets allow for communication between resources in the same network and can be connected to on-premises networks.

### Subnet
A **Subnet** is a range of IP addresses within a Virtual Network (VNet). Subnets allow you to segment your VNet into smaller networks, helping to organize resources and apply security rules more efficiently.

### Resource Group
A **Resource Group** is a container used to organize and manage related cloud resources such as virtual machines, storage, and networks. It allows for easier management, monitoring, and billing of these resources.

### Disk
A **Disk** in cloud environments is virtual storage attached to a Virtual Machine (VM). Disks store operating systems, applications, and data.

### Public IP
A **Public IP** address allows resources like Virtual Machines (VMs) to communicate with the internet. It provides external-facing connectivity to your cloud resources.

### NSG Rule - Allow HTTP
An **NSG (Network Security Group) rule to allow HTTP** traffic permits inbound and/or outbound web traffic, typically used for web applications. This rule allows public HTTP access to resources like web servers.

### NSG Rule - Allow SSH
An **NSG rule to allow SSH** traffic permits inbound connections, enabling remote access to a Virtual Machine (VM) through a Secure Shell (SSH) protocol.

### Region
A **Region** refers to a geographical location where cloud resources are deployed. Each region consists of multiple data centers and provides redundancy, lower latency, and compliance with data sovereignty regulations.

### SSH Key
An **SSH Key** is a pair of cryptographic keys (public and private) used for secure authentication when accessing Virtual Machines (VMs). The private key is kept by the user, and the public key is stored in the VM.

### Network Interface Controller (NIC)
A **Network Interface Controller (NIC)** is the virtualized hardware that allows a Virtual Machine (VM) to connect to a network. Each NIC is assigned an IP address and provides communication between the VM and other resources.

### Virtual Machine (VM)
A **Virtual Machine (VM)** is a scalable compute resource that runs on virtualized hardware in the cloud. VMs allow users to run applications and workloads without needing to maintain physical servers.

### Network Security Group (NSG)
A **Network Security Group (NSG)** is a set of security rules that control inbound and outbound network traffic to resources in a Virtual Network (VNet), such as Virtual Machines (VMs) and subnets. NSGs help secure cloud environments by allowing or denying traffic based on various criteria.

[cloud architecture](../images/cloud-architecture.png "Cloud Architecture")


## Steps to Create an SSH Key Pair on a Local Machine and Put the Public Key on Azure

### Creating a New SSH Key Pair on a Local Machine

1. Open a terminal on your local machine.
2. Navigate to home directory `cd ~`
3. Create an ssh directory `mkdir .ssh`
4. Enter the .ssh directory `cd .ssh`
5. Generate an SSH key pair using the following command:

    ```bash
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/mykey
    ```

   * `-t rsa`: Specifies the type of key (RSA).
   * `-b 4096`: Sets the key size to 4096 bits.
   * `-f ~/.ssh/mykey`: The file name and path to store the keys.

    This command generates two files:
   * `mykey`: The private key (keep this secure, never share it).
   * `mykey.pub`: The public key (this is shared with the VM).

6. View the public key:

```bash
cat ~/.ssh/mykey.pub
```

### Creating a VNet in Azure

1. Navigate to the Azure portal: [https://portal.azure.com](https://portal.azure.com).
2. Create a new Virtual Network:
    * Search for **"Virtual Network"** > Click **"Create"**.
3. Configure the basic settings for the VNet:
    * Choose the resource group.
    * Provide a name for the VNet.
    * Select a region.
4. Complete the VNet setup:
    * Continue through other tabs **"IP address"** to set network **CIDR block** represents range of ip addresses and similarly configure subnets.
    * Continue through the other tabs **"Tags"** to assign key value tag to **"Owner": "Name"**
5. Submition:
    * Review and click **Create**.

### Setting an SSH key in Azure
1. Navigate to the Azure portal: [https://portal.azure.com](https://portal.azure.com).
2. Create a new SSH key:
    * Search for **"SSH keys"** > Click **"Create"**.
3. Configure the basic settings for the VNet:
    * Choose the resource group.
    * Provide a name for the SSH key.
    * Select **"Upload existing public key"**
    * Paste the **public** SSH key from your local device. File should end with the `.pub` extension. 
4. Complete SSH key setup:
    * Continue through the other tabs **"Tags"** to assign key value tag to **"Owner": "Name"**
5. Submition:
    * Review and click **Create**.

Planning/Creating a VNet

## Why Create a VNet?

A Virtual Network (VNet) provides isolated networking for resources in the cloud. VNets allow you to:

* Segment resources using subnets (private or public).
* Control traffic flow with Network Security Groups (NSGs).
* Enable secure communication between on-premises and cloud resources via VPN or ExpressRoute.
* Protect sensitive workloads by keeping traffic internal.

## Details You Need for Planning a VNet:

### CIDR Block:

* Define the IP address range for the VNet, typically in CIDR notation (e.g., `10.0.0.0/16`).

### Subnets:

* Divide the VNet into subnets. Each subnet gets its own CIDR block within the VNet’s range.
* Subnets can be classified as public (with external internet access) or private (internal-only).