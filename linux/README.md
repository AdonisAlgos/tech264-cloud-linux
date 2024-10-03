# Learning Linux

## Introduction to Linux

Linux is a free, stable, and scalable operating system widely used in DevOps and beyond. Originating as a clone of Unix—which ran on large systems—Linux efficiently operates on both large servers and small devices. It offers numerous distributions (distros) like Ubuntu and Fedora, catering to diverse user needs. The Bash shell serves as an interpreter for Linux commands, enabling command-line interaction and scripting for automation.

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

## How to Write a Bash Script.
 
1. use `nano provision.sh` to begin creating your `provision.sh` file, which will host the script.
2. In the nano interface, write the following lines (be sure to write comments using `#` to help with understanding):
   1. `#!/bin/bash`, which i called "**shebang**". This specifies which interpreter should be used to execute the script - so this tells it to use the **Bash** script.
   2. `sudo apt update -y`
   3. `sudo apt upgrade -y`
   4. `sudo apt install -y nginx`
   5. `sudo systemctl restart nginx`
   6. `sudo systemctl enable nginx`
3. Save the script by clicking `CTRL+S`, then exit the script by clicking `CTRL+X` to return back to your regular linux CL.
4. Since the default **permissions** do not allow you to execute the script, use `chmod +x provision_nginx.sh` to add **execution** **permissions** to the file.
5. Run the script using `./provision.sh`.

Environment variables

Environment Variable placeholder for data - value in memory available to any tool that can leverage those values

How to set

```bash
export MYNAME=adonis
```

view variables

```bash
printenv
```

How to make environment variables persistent (for the same user)
Method 1

Edit .bashrc file

```bash
nano .bashrc
```

Insert the following command

```bash
export MYNAME=adonis
```

Method 2

Append the command at the end of the .bashrc file

```bash
echo "export MYNAME=adonis_is_persistent" >> .bashrc
```
Then at each system execution the Environment Variable gets created.

Processes

process is a program ran in memory - processing by memory or sitting idle

multicore cpus 
single core cpus execute instructions in one process at a time

Commands to list

Displays processes

```bash
ps
```

Add explanation

```bash
ps -e

```

Add explanation

```bash
ps aux
```

Add explanation

```bash
top
```

Shift M Filters by memory
Shift + P Filters by proccesses
Shift + N by newsest

Add explanation

```bash
jobs
```

commands to kill
why you need to be careful with brute-force kill, what is best to try first and why

system processtop
shift N newest process
shift M proccess using most memomry
shift P filters by most cpu power

running a process
sleep 3 foreground to sleep for specific seconds
sleep 5000 & runs in the background - returns process id

jobs displays background processes
jobs -l info about background proccesses
different levels of: kill command

kill -1 <process_id>: gentle
kill <process_id>: moderate
kill -9 <process_id>: creates zombie processes as it does not shut down child processes - brute force





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


