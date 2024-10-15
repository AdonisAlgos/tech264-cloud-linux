# Learning Cloud Computing - AZURE

- [Learning Cloud Computing - AZURE](#learning-cloud-computing---azure)
  - [The basics of Azure](#the-basics-of-azure)
  - [Azure regions and availability zones.](#azure-regions-and-availability-zones)
  - [How they work together.](#how-they-work-together)
  - [How is Azure structured/organized?](#how-is-azure-structuredorganized)
  - [What types of services does Azure provide?](#what-types-of-services-does-azure-provide)
  - [Ways to access Azure](#ways-to-access-azure)
  - [Difference between Azure and Azure DevOps](#difference-between-azure-and-azure-devops)
  - [Why use the Azure Pricing Calculator?](#why-use-the-azure-pricing-calculator)
  - [Azure Cloud Architecture](#azure-cloud-architecture)
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
  - [SSH creation and Azure integration](#ssh-creation-and-azure-integration)
    - [Creating a New SSH Key Pair on a Local Machine](#creating-a-new-ssh-key-pair-on-a-local-machine)
    - [Setting an SSH key in Azure](#setting-an-ssh-key-in-azure)
  - [Azure Virtual Networks (VNet's).](#azure-virtual-networks-vnets)
    - [Why Create a VNet?](#why-create-a-vnet)
    - [Creating a VNet in Azure](#creating-a-vnet-in-azure)
    - [Planning VNet](#planning-vnet)
  - [Azure Virtual Machines (VM's).](#azure-virtual-machines-vms)
    - [Details you need for Planning a VM](#details-you-need-for-planning-a-vm)
    - [Creating a VM in Azure](#creating-a-vm-in-azure)
    - [How to connect to your Azure VM through SSH](#how-to-connect-to-your-azure-vm-through-ssh)
    - [How to delete a VM](#how-to-delete-a-vm)
    - [Deleting Your Virtual Machine](#deleting-your-virtual-machine)
    - [How to enable an inbound or outbound port.](#how-to-enable-an-inbound-or-outbound-port)
    - [User Data](#user-data)
  - [Azure VM Scale Sets](#azure-vm-scale-sets)
    - [Creating a VM Scale Sets](#creating-a-vm-scale-sets)
    - [VM Scale Set Diagram](#vm-scale-set-diagram)
  - [Azure Alert Management \& Monitoring](#azure-alert-management--monitoring)
    - [What is worst to best in terms of monitoring and responding to load/traffic.](#what-is-worst-to-best-in-terms-of-monitoring-and-responding-to-loadtraffic)
    - [How you setup a dashboard](#how-you-setup-a-dashboard)
    - [How a combination of load testing and the dashboard helped us.](#how-a-combination-of-load-testing-and-the-dashboard-helped-us)
    - [Load testing with Apache Bench](#load-testing-with-apache-bench)
    - [Creating a CPU usage alert (you should get a notification sent your email).](#creating-a-cpu-usage-alert-you-should-get-a-notification-sent-your-email)
  - [2 - Tier Architecture with increased security measures.](#2---tier-architecture-with-increased-security-measures)
  - [Route Tables](#route-tables)
    - [--\> Review and Create](#---review-and-create)
    - [--\> Once it's created, navigate to the resource.](#---once-its-created-navigate-to-the-resource)


## The basics of Azure

Microsoft Azure is a comprehensive cloud computing platform offering a wide range of services, including compute, analytics, storage, and networking. It enables organizations to build, deploy, and manage applications and services through Microsoft-managed data centers worldwide.

## Azure regions and availability zones.

**Azure Regions:** These are distinct geographic locations that house multiple data centers. Each region is a separate geographic area that ensures data residency and compliance boundaries. For example, regions include "East US," "West Europe," and "Southeast Asia."

**Availability Zones:** Within each Azure region, there are multiple availability zones. These are physically separate locations within a region, each with independent data center, power, cooling, and networking. The purpose is to provide high availability and protect applications and data from data center failures.

## How they work together.

**Redundancy and Resilience:** By deploying resources across multiple availability zones within the same region, you can protect your applications from localized failures.

**Low-latency Networking:** Availability zones within a region are connected through high-speed, low-latency networks, ensuring seamless data replication and synchronization.

## How is Azure structured/organized?

* **Subscriptions:** The top-level containers that hold your Azure resources. They are linked to Azure accounts and are used for billing purposes.

* **Resource Groups:** Logical containers within subscriptions that group related resources for an Azure solution. They simplify resource management and access control.

* **Resources:** The individual services you use, such as virtual machines, storage accounts, and databases.

Different scopes at each level: you can set access + policies

[Organize your Azure resources effectively - Cloud Adoption Framework | Microsoft Learn](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-setup-guide/organize-resources)

## What types of services does Azure provide?

Azure offers a broad spectrum of services across various categories:

* **Compute:** Virtual Machines, App Services, Azure Functions
* **Storage:** Blob Storage, File Storage, Queue Storage
* **Networking:** Virtual Network, Load Balancer, Application Gateway
* **Databases:** Azure SQL Database, Azure Cosmos DB, Azure Database for MySQL/PostgreSQL
* **Analytics:** Azure Synapse Analytics, HDInsight, Stream Analytics
* **AI and Machine Learning:** Azure Machine Learning, Cognitive Services
* **Internet of Things (IoT):** IoT Hub, IoT Central
* **Security:** Azure Active Directory, Key Vault, Security Center
* **DevOps:** Azure DevOps Services, Azure DevTest Labs
* **Management Tools:** Azure Portal, Azure CLI, Azure PowerShell

## Ways to access Azure

* **Azure Portal:** A web-based, graphical user interface for managing Azure services.

* **Azure CLI:** A cross-platform command-line tool for managing Azure resources.

* **Azure PowerShell:** A set of cmdlets for managing Azure resources directly from the PowerShell command line.

* **SDKs and APIs:** Azure provides SDKs in various programming languages (e.g., .NET, Java, Python) and REST APIs for developers to interact programmatically.

## Difference between Azure and Azure DevOps

* **Azure:** A cloud computing platform offering infrastructure as a service (IaaS), platform as a service (PaaS), and software as a service (SaaS) for building, deploying, and managing applications.

* **Azure DevOps:** A suite of development tools provided by Microsoft to support the entire software development lifecycle. It includes services like Azure Repos (source control), Azure Pipelines (CI/CD), Azure Boards (work tracking), and more.

## Why use the Azure Pricing Calculator?

The Azure Pricing Calculator is a tool that helps you estimate the costs of using Azure services before deployment. By inputting specific configurations and service selections, you can:

* **Budget Accurately:** Forecast expenses to align with financial planning.

* **Compare Costs:** Evaluate different service options and configurations to find cost-effective solutions.

* **Optimize Resources:** Adjust service tiers and quantities to meet performance needs without overspending.

Using the calculator ensures transparency in pricing and helps in making informed decisions regarding resource allocation.

## Azure Cloud Architecture

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

![azure cloud architecture](../images/cloud-architecture.png "Cloud Architecture")


## SSH creation and Azure integration

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

## Azure Virtual Networks (VNet's).

### Why Create a VNet?

A Virtual Network (VNet) provides isolated networking for resources in the cloud. VNets allow you to:

* Segment resources using subnets (private or public).
* Control traffic flow with Network Security Groups (NSGs).
* Enable secure communication between on-premises and cloud resources via VPN or ExpressRoute.
* Protect sensitive workloads by keeping traffic internal.

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

### Planning VNet

**CIDR Block:**

* Define the IP address range for the VNet, typically in CIDR notation (e.g., `10.0.0.0/16`).

**Subnets:**

* Divide the VNet into subnets. Each subnet gets its own CIDR block within the VNet’s range.
* Subnets can be classified as public (with external internet access) or private (internal-only).

## Azure Virtual Machines (VM's).

### Details you need for Planning a VM

* Virtual network + subnet.
* Name.
* Location + pricing.
* Size cpu, memory (RAM) + pricing.
* Storage + pricing.
* OS (concider software compatability) + pricing.
* SSH key pair.

### Creating a VM in Azure

1. Navigate to the Azure portal: [https://portal.azure.com](https://portal.azure.com).
2. Create a new Virtual Machine:
    * Search for **"Virtual Machine"** > Click **Create** > Select **Azure Virtual Machine**.
3. Configure the settings for the VM:
    * Choose the resource group - `"tech264"`
    * Provide a name for the VM - `"tech264-<name>-<title>"`
    * Select a region - `"(Europe) UK South"`
    * Select Availability Zone (specifiying data center) - `"No infrastructure redundancy required"`
    * Define Security Type - `"Standard"`
    * Choose OS image - `"Ubuntu Pro 18.04 LTS - x64 Gen2"`
    * Select Size (cpu & memory) - `"Standard_B1s - 1 vcpu, 1 GiB memory (Price unavailable)"`
    * Assign authentication type - `"SSH public key"`
    * Re-assign Username - `"adminuser"`
    * Continue through the other tabs **"Tags"** to assign key value tag to **"Owner": "Name"**
4. Submition:
    * Review and click **Create**.

### How to connect to your Azure VM through SSH

### How to delete a VM

*Note: Deleting via the VM leaves elements behind like the NSG Rules always and depending if during VM configuration we checked a box that states once the VM is deleted to also delete NIC and Public IP.*

### Deleting Your Virtual Machine
1. Navigate to resource group.
2. Tick specific resources you would like to be deleted.
3. Locate **delete**.
4. Tick "Apply force delete" just to be safe.
5. Enter "delete" in the input box and click **delete**.
6. Select **delete** once more to confirm **deletion**.

### How to enable an inbound or outbound port.
1. Navigate to your VM's **network settings**.
2. Open up **Settings** and click **inbound Security Rules**.
3. Change the **Destination Port** to `3000`.
4. Change protocol to **TCP**.
5. Change the priority number. The **lower** the priority number is, the **higher** the priority.

*Note: HTTP default port is 80.*

### User Data

* To achieve the next level of automation.
* Immediatelly after VM creation user data will be run.
* User data only runs once.
* Runs as root user - meaning when we clone our app it will be stored in thr root directory.

## Azure VM Scale Sets

### Creating a VM Scale Sets

1. Navigate to the Azure portal: [https://portal.azure.com](https://portal.azure.com).
2. Create a new Virtual Machine:
    * Search for **"Virtual Machine Scale Sets"** > Click **"Create"**
3. Configure the VM Scale Set:
   *   Select Resource Group: **"tech264"**
   *   Add Virtual machine scale set name: **"tech264-adonis-sparta-app-scale-set"**
   *   Availability zone: **"1,2 & 3"**
   *   Orchestration mode: **"Uniform: optimized for large scale stateless workloads"**
   *   Security: **"Standard"**
   *   Scaling mode: **"Autoscaling: Scaling based on a CPU metric, on any schedule."**
   *   Scaling configuration: **"Configure"** > **"Scaling Conditions"** > **"Edit"** > *Cofigured maximum instance limit:2 and Scale out CPU threshold 75* > **"Save"** > **"Save"**.
   *   Image: **"See All"** > **"My Images"** > **"tech264-adonis-ready-to-run-app-image"**.
   *   Username: **"adminuser"**.
   *   SSH public **"key source: Use existing key in Azure"**.
   *   Stored Keys: **"tech264-adonis-az-key"**.
   *   License type: **"Other"**.
   *   OS disk type: **"Standard SSD"**.
   *   Virtual network: **"tech264-adonis-subnet-vnet"**.
   *   Network interface: **"Edit"** > **"Public inbound ports"** > **"Allow selected ports"**.
   *   Select inbound ports: **"SSH & HTTP"**.
   *   Load balancing options: **"Azure load balancer"**.
   *   Select Load Balancer: Create a load balancer > Load balancer name: **"tech264-adonis-sparta-app-lb"** > Create
   *   Health > **Tick**: Enable application health monitoring.
   *   Health > **Tick**: Automatic repairs
   *   Advanced > **Tick**: Enable user data
       *   Add script You can find the implementation in [`userdata app script - no db connection`](../linux/userdata-app-nodbconnection-script.sh).
   *   Tags > Name: **"Owner"**, Value: **"Adonis"**
4. Review + Create > Create

### VM Scale Set Diagram

**Custom Image Process:** This section of the diagram represents the process of creating a custom image from scratch.

1. Accessing the default Virtual Hard Disk File (normally found within the official pages of an OS provider).
2. Downloading it and storing it as Blob Storage.
3. From that file a custom image can be created (Original proceedure of creating images within the Marketplace)

**Not Done**

![Scale Set Architecture](../images/Scale%20Sets.png)

## Azure Alert Management & Monitoring

### What is worst to best in terms of monitoring and responding to load/traffic.

![Scale Set Architecture](../images/monitoring-alert-setups.png)


### How you setup a dashboard

1. Navigate to the **Overview** page of a VM, scroll down and select **Monitoring**
2. In the **Monitoring** window select **see all Platform Metrics**
3. Pin the metrics to be included within the Dashboard (e.g. CPU, Disk bytes).
4. After clicking pin you are prompted with selecting a Dashboard through the **Existing** tab or creating a new one through the **Create new** tab.
5. Repeat for each metric.
6. Navigate to the Azure portal: [https://portal.azure.com](https://portal.azure.com).
7. Search for **Dashboards** and select the created Dashboard.
8. Within your Dashboard overview, you can have a display of the metrics selected and furtherly configure the metrics themselves along with the Dashboard layout.

### How a combination of load testing and the dashboard helped us.

Combining load testing with Azure Dashboards helps identify performance bottlenecks, validate scaling strategies. Dashboards provide centralized, real-time insights and historical tracking, allowing teams to visualize system behavior under stress, optimize resource allocation, and set up alerts for critical thresholds.

### Load testing with Apache Bench

The `sudo apt-get install apache2-utils` command installs the `apache2-utils package`, which includes useful tools for managing and testing Apache HTTP servers.

```bash
sudo apt-get install apache2-utils
```

`AB(Apache Benchmark)` - a command-line tool used for benchmarking and load-testing web servers by sending a specified number of requests to a given URL.

```bash
ab
```
Example implementation
 
```bash
# ab -n 1000 -c 100 http://public ip address/
# to increase the requests : ab -n 1000 -c 200...

ab -n 1000 -c 100 http://yourwebsite.com/
```

*Include a screenshot of your dashboard when you manage to get it to stop responding through extreme load testing*

**Not Done**


### Creating a CPU usage alert (you should get a notification sent your email).
 
1. Navigate to the Azure portal: [https://portal.azure.com](https://portal.azure.com).
2. Search for **Monitor** and navigate to the **Alerts** tab.
3. Click on **Create** > **Alert Rule**.
4. Within the **Scope** tab set the alert coverourage - (e.g., virtual machine or app service).
5. Under the **Condition** tab, define the **Signal name** as > **Percentage CPU** as the signal.
6. Set the **Alert logic** configurations:
   * **Aggregation type** set to **Average**.
   * Set the threshold (e.g., 70%) to trigger an alert under heavy load.
   * Under the **When to evaluate** set bot time indicators to 1 minute.
7. Under the **Actions** tab, set the **Select actions** setting to **Use quick action** and configure the pop-window by defining the method of alert (eg. Email - sends notification to your address).
8. Set the tags under the **Tag** tab and **Review + create**.

*Include a screenshot of the email you received as a notification*

![Scale Set Architecture](../images/alert-monitoring-email.png)

## 2 - Tier Architecture with increased security measures.

We create a VNet with 3 subnets following the same process described within the VNet Creation section.

*Note: As we intent to make this setup more secure we add a further configuration for the private subnet by enabling the no outbound access - this mean whatever is in the subnet cannot access the internet*.

![2-Tier Architecture with 3 subnets - Increased security](../images/2-tier-architecture-increased-security.png)

## Route Tables
 
1. Select **tech264** resource group.
2. For **Region**, Select **UK South**.
 
### --> Review and Create
1. **Ensure** you've selected the correct options. There isn't really much here, really.
2. **Create** your shiny new Route table.
 
### --> Once it's created, navigate to the resource.
 
3. Go to the **Settings** drop down.
4. Click **Routes**.
5. Click **Add**.
 

