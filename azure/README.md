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
  - [Plan to create a VM](#plan-to-create-a-vm)
    - [Creating a VNet in Azure](#creating-a-vnet-in-azure-1)
  - [Linux commands](#linux-commands)
  - [Managing file ownership.](#managing-file-ownership)
    - [Why is managing file ownership important?](#why-is-managing-file-ownership-important)
    - [What is the command to view file ownership?](#what-is-the-command-to-view-file-ownership)
    - [What permissions are set when a user creates a file or directory? Who does the file or directory belong to?](#what-permissions-are-set-when-a-user-creates-a-file-or-directory-who-does-the-file-or-directory-belong-to)
    - [Why does the owner, by default, not receive execute permissions when they create a file?](#why-does-the-owner-by-default-not-receive-execute-permissions-when-they-create-a-file)
    - [What command is used to change the owner of a file or directory?](#what-command-is-used-to-change-the-owner-of-a-file-or-directory)
  - [Managing file permissions.](#managing-file-permissions)
    - [Does being the owner of a file mean you have full permissions on that file? Explain.](#does-being-the-owner-of-a-file-mean-you-have-full-permissions-on-that-file-explain)
    - [If you give permissions to the User entity, what does this mean?](#if-you-give-permissions-to-the-user-entity-what-does-this-mean)
    - [If you give permissions to the Group entity, what does this mean?](#if-you-give-permissions-to-the-group-entity-what-does-this-mean)
    - [If you give permissions to the Other entity, what does this mean?](#if-you-give-permissions-to-the-other-entity-what-does-this-mean)
    - [You give the following permissions to a file: User permissions are read-only, Group permissions are read and write, Other permissions are read, write, and execute. You are logged in as the user who is the owner of the file. What permissions will you have on this file? Explain.](#you-give-the-following-permissions-to-a-file-user-permissions-are-read-only-group-permissions-are-read-and-write-other-permissions-are-read-write-and-execute-you-are-logged-in-as-the-user-who-is-the-owner-of-the-file-what-permissions-will-you-have-on-this-file-explain)
    - [Here is one line from ls -l. Work out everything you can about permissions on this file or directory.](#here-is-one-line-from-ls--l-work-out-everything-you-can-about-permissions-on-this-file-or-directory)
  - [Managing file permissions using numeric values](#managing-file-permissions-using-numeric-values)
    - [What numeric values are assigned to each permission?](#what-numeric-values-are-assigned-to-each-permission)
    - [What value can you assign to get read + write permissions?](#what-value-can-you-assign-to-get-read--write-permissions)
    - [What value would assign read, write, and execute permissions?](#what-value-would-assign-read-write-and-execute-permissions)
    - [What value would assign read and execute permissions?](#what-value-would-assign-read-and-execute-permissions)
    - [Often, a file or directory's mode/permissions are represented by 3 numbers. What do you think 644 would mean?](#often-a-file-or-directorys-modepermissions-are-represented-by-3-numbers-what-do-you-think-644-would-mean)
  - [Changing file permissions](#changing-file-permissions)
    - [What command changes file permissions?](#what-command-changes-file-permissions)
    - [To change permissions on a file, what must the end user be? (2 answers)](#to-change-permissions-on-a-file-what-must-the-end-user-be-2-answers)
    - [Give examples of some different ways/syntaxes to set permissions on a new file (named testfile.txt) to:](#give-examples-of-some-different-wayssyntaxes-to-set-permissions-on-a-new-file-named-testfiletxt-to)
      - [Set User to read, Group to read + write + execute, and Other to read and write only](#set-user-to-read-group-to-read--write--execute-and-other-to-read-and-write-only)
      - [Add execute permissions (to all entities)](#add-execute-permissions-to-all-entities)
      - [Take write permissions away from Group](#take-write-permissions-away-from-group)
      - [Use numeric values to give read + write access to User, read access to Group, and no access to Other](#use-numeric-values-to-give-read--write-access-to-user-read-access-to-group-and-no-access-to-other)


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

## Plan to create a VM

* Virtual network + subnet.
* Name.
* Location + pricing.
* Size cpu, memory (RAM) + pricing.
* Storage + pricing.
* OS (concider software compatability) + pricing.
* SSH key pair.

### Creating a VNet in Azure

1. Navigate to the Azure portal: [https://portal.azure.com](https://portal.azure.com).
2. Create a new Virtual Machine:
    * Search for **"Virtual Machine"** > Click **"Create"** > Select **"Azure Virtual Machine"**.
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
    * 
    * 
4. Complete the VNet setup:
    * Continue through other tabs **"IP address"** to set network **CIDR block** represents range of ip addresses and similarly configure subnets.
    * Continue through the other tabs **"Tags"** to assign key value tag to **"Owner": "Name"**
5. Submition:
    * Review and click **Create**.

Linux free - stable - scales well - used for DevOps

Clone of the unix system - unix was run on large systems but linux can be run on small systems

Many types of distributions of linux

Bash shell

is an interpreter for linux commands

## Linux commands

Displays the operating system name.
```bash
uname
```
Shows all available system information.
```bash
uname -a
```
Displays the current user's username.
```bash
whoami
```
Shows the process information of the current shell.
```bash
ps -p $$
```
Lists previously entered commands in the shell.
```bash
history
```
Re-executes the command at the specified history number.
```bash
!<number>
```
Clears the entire command history.
```bash
history -c
```
Lists all files and directories, including hidden ones.
```bash
ls -a
``` 
Lists all files and directories with detailed information.

```bash
ls -al
```
Downloads a file from the internet and saves it as <file_name>.
```bash
curl <url> --output <file_name>
```

Downloads a file from the internet and saves it as `<file_name>`.

```bash
wget <url> -O <file_name>
```
Renames or moves a file.

```bash
mv <file_name> <new_file_name>
```

Displays the file type and related information.

```bash
file <file_name>
```

Copies a file to a new file.

```bash
cp <file_name> <new_file_name>
```
Removes a file.

```bash
rm <file_name>
```
Creates a new directory; multiple names create multiple directories.

```bash
mkdir <directory_name>
```

Does not remove directories; use rmdir instead.

```bash
rm <directory_name>
```
Removes an empty directory.

```bash
rmdir <directory_name>
```

Removes a directory and its contents recursively.

```bash
rm -r <directory_name>
```

Escape character; ignores the special meaning of the next character.

```bash
\
```

Creates an empty file or updates the timestamp of an existing file.

```bash
touch <file_name>
```

Displays the contents of a file.

```bash
cat <file_name>
```

Opens a file for editing; creates it if it doesn't exist.

```bash
nano <file_name>
```

Displays the first <number> lines of a file.

```bash
head -<number> <file_name>
```

Displays a file with line numbers.

```bash
nl <file_name>
```

Searches the file for lines containing <word> and prints them.

```bash
cat <file_name> | grep <word>
```

Installs the specified package (requires superuser privileges).

```bash
sudo apt install <package_name>
```

Updates the package list.

```bash
sudo apt update
```

Installs 'tree' to display directories in a tree-like format.

```bash
sudo apt install tree
```

Upgrades all installed packages to the latest versions (use with caution).

```bash
sudo apt upgrade -y
```

Switches to the superuser account (use with caution; remember to exit when done).

```bash
sudo su
```

## Managing file ownership.

### Why is managing file ownership important?

Managing file ownership is essential for controlling access to files and directories, ensuring that only authorized users can read, modify, or execute them. This maintains system security and prevents unauthorized access.

### What is the command to view file ownership?

Use ls -l to view detailed information about files, including their ownership and permissions.

### What permissions are set when a user creates a file or directory? Who does the file or directory belong to?

When a user creates a file or directory, default permissions are set based on the system's umask value. Typically, a new file gets permissions like rw-r--r-- (644), and a new directory gets rwxr-xr-x (755). The file or directory belongs to the user who created it and their primary group.

### Why does the owner, by default, not receive execute permissions when they create a file?

Because most new files are regular data files, not executable programs, the system does not grant execute (x) permissions by default to prevent accidental execution of non-executable files.

### What command is used to change the owner of a file or directory?

Use the chown command to change the owner of a file or directory. For example: chown new_owner filename.

## Managing file permissions.

### Does being the owner of a file mean you have full permissions on that file? Explain.

No, being the owner of a file does not automatically grant you full permissions. Your access is determined by the user (owner) permission settings for that file. While the owner can change the file's permissions, they are still restricted to the permissions currently assigned to them.

### If you give permissions to the User entity, what does this mean?

Granting permissions to the User entity sets the actions that the file's owner can perform. These permissions apply exclusively to the owner and define their ability to read, write, or execute the file.

### If you give permissions to the Group entity, what does this mean?

Granting permissions to the Group entity defines what all users who are members of the file's group can do. These permissions apply to every user in that specific group, dictating their access levels.

### If you give permissions to the Other entity, what does this mean?

Granting permissions to the Other entity sets the permissions for all other users on the system who are neither the owner nor part of the file's group. These permissions determine the access rights for anyone else trying to interact with the file.

### You give the following permissions to a file: User permissions are read-only, Group permissions are read and write, Other permissions are read, write, and execute. You are logged in as the user who is the owner of the file. What permissions will you have on this file? Explain.

As the owner, you will have read-only permissions on the file because the user (owner) permissions are set to read-only. Even though the group and other entities have more permissions, they do not affect the owner's access. The system checks permissions in the order of user, group, then other, applying only the first applicable set.

### Here is one line from ls -l. Work out everything you can about permissions on this file or directory.

-rwxr-xr-- 1 tcboony staff 123 Nov 25 18:36 keeprunning.sh

* File Type: - indicates it's a regular file.
* Owner Permissions (rwx): The owner (tcboony) has read (r), write (w), and execute (x) permissions—full access.
* Group Permissions (r-x): Users in the group staff have read (r) and execute (x) permissions but no write permission.
* Other Permissions (r--): All other users have read-only (r) permission.
* Link Count: 1 means there is one hard link to the file.
* Owner: The file is owned by user tcboony.
* Group: The file's group is staff.
* Size: The file is 123 bytes.
* Last Modified: The file was last modified on November 25 at 18:36.
* Filename: The name of the file is keeprunning.sh.

## Managing file permissions using numeric values

### What numeric values are assigned to each permission?

* Read (r): 4
* Write (w): 2
* Execute (x): 1

### What value can you assign to get read + write permissions?

Add the numeric values of read and write:

* Read (4) + Write (2) = 6

So, the value 6 assigns read and write permissions.

### What value would assign read, write, and execute permissions?

Add all three permission values:

* Read (4) + Write (2) + Execute (1) = 7

So, the value 7 assigns read, write, and execute permissions.

### What value would assign read and execute permissions?

Add the numeric values of read and execute:

* Read (4) + Execute (1) = 5

So, the value 5 assigns read and execute permissions.

### Often, a file or directory's mode/permissions are represented by 3 numbers. What do you think 644 would mean?

The three numbers represent permissions for the User (owner), Group, and Others, respectively.

* 6 (User): Read (4) + Write (2) = Read and Write permissions.
* 4 (Group): Read (4) = Read-only permission.
* 4 (Others): Read (4) = Read-only permission.

Therefore, 644 means:

* The owner has read and write permissions.
* The group has read-only permission.
* Others have read-only permission.

## Changing file permissions

### What command changes file permissions?

The chmod command is used to change file permissions.

### To change permissions on a file, what must the end user be? (2 answers)

The user must either:

* Be the owner of the file.
* Have superuser (root) privileges.

### Give examples of some different ways/syntaxes to set permissions on a new file (named testfile.txt) to:

#### Set User to read, Group to read + write + execute, and Other to read and write only

Using symbolic notation:

```bash
chmod u=r,g=rwx,o=rw testfile.txt
```

Using numeric notation:

Calculate permissions:
* User (u): read (4) = 4
* Group (g): read (4) + write (2) + execute (1) = 7
* Other (o): read (4) + write (2) = 6

```bash
chmod 476 testfile.txt
```

#### Add execute permissions (to all entities)

```bash
chmod a+x testfile.txt
```

#### Take write permissions away from Group

```bash
chmod g-w testfile.txt
```

#### Use numeric values to give read + write access to User, read access to Group, and no access to Other

Calculate permissions:

* User (u): read (4) + write (2) = 6
* Group (g): read (4) = 4
* Other (o): no permissions = 0

```bash
chmod 640 testfile.txt
```