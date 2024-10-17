## Downloading and logging into Azure CLI
 
1. Insert `curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash` while SSH'd into your VM. This will **download** CLI.
2. Insert `az login`. It will provide you with a link and a code. The link directs you to **sign in** to azure with your existing credentials via a web browser. It will then request the **code** to authenticate.
3. **Insert** the code on the browser input and select your account.
4. Once signed in, close the window and **return** to your VM console.
5. Enter the number for the subscription you wish to use.

### Azure CLI commands

Prints out some data regarding the current resource group you reside in.

```bash
az group list
```
Create a storage account. This will print out all the details in JSON format when successful.

```bash
az storage account create --name tech264adonisstorage --resource-group tech264 --location uksouth --sku Standard_LRS
```

Displays output in table format for readability.

```bash
az storage account list --resource-group tech264 --query "[].{Name:name, Location:location, Kind:kind}" --output table
```

Create a storage container:

```bash
az storage container create \
    --account-name tech264adonisstorage \
    --name testcontainer
```
*The `\` can be used to break up commands to have it be multiple lines for readability.
* 
*You may see a yellow line warning. We could add `--auth-mode login` (or signify the method of connection you established with azure at the start) to the end of the command to prevent this!*
 
We can double check that we've made it by listing the containers in the storage account using:

```bash
az storage container list \
    --account-name tech264adonisstorage \
    --output table \
    --auth-mode login
```