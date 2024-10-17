# Learning AWS

- [Learning AWS](#learning-aws)
  - [Adding SSH key on AWS](#adding-ssh-key-on-aws)
    - [Generate an SSH Key](#generate-an-ssh-key)
    - [Add the key to AWS](#add-the-key-to-aws)
  - [Creating a 2-Tier Architecture on AWS (App \& Database)](#creating-a-2-tier-architecture-on-aws-app--database)
    - [Creating database EC2 instance](#creating-database-ec2-instance)
    - [Creating app EC2 instance](#creating-app-ec2-instance)


## Adding SSH key on AWS

### Generate an SSH Key

1. Navigate to the `.ssh/` directory. If the folder doesn't exist create one at this path `~/.ssh`
2. Run the bellow command within the path to generate the key pair (public & private). It will prompt for a file name to be added which will be the name of the key.

```bash
ssh-keygen -t rsa -b 4096 -C "your email address"
```

3. Then print the public key to the screen (public key has the `.pub` extension).

```bash
cat key-file-name.pub
```

### Add the key to AWS

1. Navigate to the AWS console https://eu-west-1.console.aws.amazon.com/console/home?region=eu-west-1
2. Search and navigate to **Key Pairs**.
3. Click **Actions** > **Import key pair** at the top right corner.
4. **Name** the SSH key and paste the **public** key string printed to the screen earlier

## Creating a 2-Tier Architecture on AWS (App & Database)

### Creating database EC2 instance
1. Navigate to the AWS console https://eu-west-1.console.aws.amazon.com/console/home?region=eu-west-1
2. Search for **EC2** (equivilant to Virtual Machines)
3. Click **Launch Instance** to create a VM.
4. Create and configure the EC2 instance:
   * Name: `tech264-adonis-db-vm`
   * Select the OS: **Ubuntu Server 22.04 LTS**.
   * Instance type: **t2.micro**.
   * Select the key uploaded to AWS or create a new one.
   * For the **Network** settings, rename the NSG: `tech264-adonis-allow-ssh-mongo-db-nsg ` (*apply this change in the below description*)
   * In the **Network** tab the ssh rule is already configured. Add a new security group rule to allow **MongoDB inbound communication** [Type: Custom TCP, Port range: 27017, Source type: Anywhere].
   * Configure the **Advance settings** by scrolling down to user data and paste the script to configure the **DB EC2 instance** [database-user-data-script](../linux/prov-db-script.sh)
5. Lastly **Launch instance**.

### Creating app EC2 instance

1. Navigate to the AWS console https://eu-west-1.console.aws.amazon.com/console/home?region=eu-west-1
2. Search for **EC2** (equivilant to Virtual Machines)
3. Click **Launch Instance** to create a VM.
4. Create and configure the EC2 instance:
   * Name: `tech264-adonis-app-vm`
   * Select the OS: **Ubuntu Server 22.04 LTS**.
   * Instance type: **t2.micro**.
   * Select the key uploaded to AWS or create a new one.
   * For the **Network** settings, rename the NSG: `tech264-adonis-allow-ssh-http-app-nsg ` (*apply this change in the below description*)
   * In the **Network** tab the ssh rule is already configured. Add a new security group rule to allow **MongoDB inbound communication** [Type: HTTP, Source type: Anywhere].
   * Configure the **Advance settings** by scrolling down to user data and paste the script to configure the **App EC2 instance** [app-user-data-script](../linux/prov-app-script.sh) In this script the **DB_HOST** environment variable for the **mongodb connection** needs to be modified to match the **private IP** of the **database EC2 instance**.
5. Lastly **Launch instance**.