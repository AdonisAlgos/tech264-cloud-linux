# Scripting

- [Scripting](#scripting)
  - [Scripting vs Programming](#scripting-vs-programming)
    - [Scripting](#scripting-1)
    - [Programming](#programming)
    - [Running Python Scripts from the Command Line and Using Arguments](#running-python-scripts-from-the-command-line-and-using-arguments)
    - [Passing Arguments to Python Scripts](#passing-arguments-to-python-scripts)
    - [Basic Linux Commands](#basic-linux-commands)


## Scripting vs Programming
### Scripting

* Scripting is a type of programm
* usually simpler
* automating simple or routine tasks
* execution is usually done in an interpreter
* usually easier to learn

### Programming
* **Complexity:** often includes increased logic, algorithms and data structures
* **Purpose:** much wider purpose, including large applications and games
* **Execution:** either interpreted or needs to be compiled before being run
* **Development cycle:** usually longer and more involved in SDLC phases
* **Learning curve:** usually more involved to learn, including software design patterns


### Running Python Scripts from the Command Line and Using Arguments

To run a Python script from the command line, navigate to the directory where your script is located, and use the following command:
```bash
python script_name.py
```
### Passing Arguments to Python Scripts
You can pass arguments to a Python script by appending them to the command. For example:
```bash
python script_name.py arg1 arg2 arg3
```

In the script, you can access these arguments using the sys module. The sys.argv list stores the command-line arguments passed to the script:

* `sys.argv[0]`: The script name.
* `sys.argv[1]`: The first argument passed to the script.
* `sys.argv[1]`: The second... and so on.

### Basic Linux Commands
This section introduces essential Linux commands that you can use to interact with the system through the terminal. These commands are foundational for creating and managing files, directories, and navigating the filesystem.

1. The `mkdir` command is used to create a new directory.

```bash
mkdir directory_name
```

2. The `touch` command is used to create an empty file or update the timestamp of an existing file.

```bash
touch file_name
```

3. The `cd` command is used to change the current working directory.

```bash
cd /path/to/directory
```

To go back to the previous directory:

```bash
cd ..
```

4. The `ls` command is used to display the contents of a directory.

```bash
ls
```

To view hidden files:

```bash
ls -a
```

5. The `pwd` command shows the full path of the current working directory.

```bash
pwd
```


start your Linux documentation with commands you already know (and especially the ones we've already been through)