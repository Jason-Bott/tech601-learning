# Linux

- [Linux](#linux)
  - [Why learn Linux?](#why-learn-linux)
  - [What is Linux?](#what-is-linux)
  - [What is Bash?](#what-is-bash)
  - [What is process?](#what-is-process)
    - [Two types of processes](#two-types-of-processes)
  - [What is a reverse proxy?](#what-is-a-reverse-proxy)
  - [What is user data (VM)?](#what-is-user-data-vm)
- [Mistakes Made](#mistakes-made)
- [Commands](#commands)
  - [Getting Help](#getting-help)
  - [Basic Commands](#basic-commands)
  - [Navigation (Directories)](#navigation-directories)
  - [Listing Files \& Directories](#listing-files--directories)
  - [File Viewing \& Searching](#file-viewing--searching)
  - [File \& Directory Management](#file--directory-management)
  - [File Permissions](#file-permissions)
  - [Text Editing](#text-editing)
  - [System Information](#system-information)
  - [Process Management](#process-management)
  - [User Management](#user-management)
  - [System Management](#system-management)
  - [Environment Variables](#environment-variables)
  - [Command History](#command-history)
  - [Networking \& Downloads](#networking--downloads)
  - [User \& Session Management](#user--session-management)
  - [Package Management (APT)](#package-management-apt)
  - [Services (systemctl)](#services-systemctl)
  - [Running Scripts](#running-scripts)
  - [Terminal Shortcuts](#terminal-shortcuts)
  - [PM2](#pm2)
  - [Checking Ports](#checking-ports)
- [Bash Script](#bash-script)
- [File Management](#file-management)
  - [File Permissions](#file-permissions-1)
    - [Does being the owner of a file mean you have full permissions on that file?](#does-being-the-owner-of-a-file-mean-you-have-full-permissions-on-that-file)
    - [If you give permissions to the User entity, what does this mean?](#if-you-give-permissions-to-the-user-entity-what-does-this-mean)
    - [If you give permissions to the Group entity, what does this mean?](#if-you-give-permissions-to-the-group-entity-what-does-this-mean)
    - [If you give permissions to the Other entity, what does this mean?](#if-you-give-permissions-to-the-other-entity-what-does-this-mean)
  - [File Permissions (Numeric Values)](#file-permissions-numeric-values)
    - [What numeric values are assigned to each permission?](#what-numeric-values-are-assigned-to-each-permission)
    - [What numeric value would you use to assign read and write permissions?](#what-numeric-value-would-you-use-to-assign-read-and-write-permissions)
    - [What numeric value would you use to assign read, write and execute permissions?](#what-numeric-value-would-you-use-to-assign-read-write-and-execute-permissions)
    - [What numeric value would you use to assign read and execute permissions?](#what-numeric-value-would-you-use-to-assign-read-and-execute-permissions)
    - [What do the three numbers in permissions represent?](#what-do-the-three-numbers-in-permissions-represent)
  - [Changing File Permissions](#changing-file-permissions)
    - [What command changes file permissions?](#what-command-changes-file-permissions)
    - [To change permissions on a file what must the end user be? (2 answers)](#to-change-permissions-on-a-file-what-must-the-end-user-be-2-answers)
    - [Give examples of some different ways/syntaxes to set permissions on a new file (named testfile.txt) to: Set User to read, Group to read + write + execute, and Other to read and write only](#give-examples-of-some-different-wayssyntaxes-to-set-permissions-on-a-new-file-named-testfiletxt-to-set-user-to-read-group-to-read--write--execute-and-other-to-read-and-write-only)
    - [Add execute permissions (to all entities)](#add-execute-permissions-to-all-entities)
    - [Take write permissions away from Group](#take-write-permissions-away-from-group)
    - [Use numeric values to give read + write access to User, read access to Group, and no access to Other.](#use-numeric-values-to-give-read--write-access-to-user-read-access-to-group-and-no-access-to-other)
  - [Managing File Ownership](#managing-file-ownership)
    - [Why is managing file ownership important?](#why-is-managing-file-ownership-important)
    - [What is the command to view file ownership?](#what-is-the-command-to-view-file-ownership)
    - [What permissions are set when a user creates a file or directory? Who does file or directory belong to?](#what-permissions-are-set-when-a-user-creates-a-file-or-directory-who-does-file-or-directory-belong-to)
    - [Why does the owner, by default, not receive X permissions when they create a file?](#why-does-the-owner-by-default-not-receive-x-permissions-when-they-create-a-file)
    - [What command is used to change the owner of a file or directory?](#what-command-is-used-to-change-the-owner-of-a-file-or-directory)
- [Streams, Redirection and Appending, Piping](#streams-redirection-and-appending-piping)
  - [Streams](#streams)
    - [What is a stream in Linux?](#what-is-a-stream-in-linux)
    - [What are the 3 data streams?](#what-are-the-3-data-streams)
    - [Create a new file new.txt and run the command ls missing\_directory new.txt - this should give output to two different streams.](#create-a-new-file-newtxtand-run-the-command-ls-missing_directory-newtxt--this-should-give-output-to-two-different-streams)
    - [How can we direct each stream to a file (one at a time)?](#how-can-we-direct-each-stream-to-a-file-one-at-a-time)
    - [How can we direct both 2 output streams to a file?](#how-can-we-direct-both-2-output-streams-to-a-file)
    - [Which stream is directed to a file by default?](#which-stream-is-directed-to-a-file-by-default)
    - [How can we direct both output streams to a file in one command?](#how-can-we-direct-both-output-streams-to-a-file-in-one-command)
  - [Redirection and Appending](#redirection-and-appending)
    - [What does \> do?](#what-does-do)
    - [How is appending different?](#how-is-appending-different)
    - [Give an example of a command where it appends to a file](#give-an-example-of-a-command-where-it-appends-to-a-file)
  - [Piping](#piping)
    - [What is piping?](#what-is-piping)
    - [How is piping different to redirection using \> or \>\>?](#how-is-piping-different-to-redirection-using-or-)
    - [What character is used for piping?](#what-character-is-used-for-piping)
    - [Give an example of a command that using piping once](#give-an-example-of-a-command-that-using-piping-once)
    - [Give an example of a command that using piping twice](#give-an-example-of-a-command-that-using-piping-twice)
    - [Give an example of a command that using piping twice, than sends the output to a file](#give-an-example-of-a-command-that-using-piping-twice-than-sends-the-output-to-a-file)

---

## Why learn Linux? 

- fast-growing 
- inexpensive 
- flexible 
- stable (compared to Windows: less restarts needed?) 
- scales well to perform scientific, engineering, network server tasks 
- becoming more viable for desktop/workstation use 
- often used in DevOps 
- be more employable 

## What is Linux? 

- A spinoff the Unix OS 
- Unix used be used on large mainframes 
- Linux can now be run on small computers (which are now more powerful than the mainframes used to be) 
- made up of a kernel (core OS), plus many libraries and utilities that rely on the kernel 
- there are many different distributions (each using a specific kernel with specific supporting software) 

## What is Bash? 

- Stands for Bourne Again Shell 
- Unix was a text-based OS, very much command-driven, so Bash is just an improved version of the shell used before in Unix 
- To understand how to use Linux, you must know the basics of command-line tools 
- Shells is like software/interface that runs the commands (aka command-line interpreter just like in older versions of Windows you had MS-DOS) 
- There are a range of shells, but the most common default shell is bash

## What is process?

- A program that is been loaded into RAM and currently being processed by the CPU
- Although it looks like many processes are running concurrently (at the same time), a single-core CPU can only run one process at a time
- Because Linux quickly switches between the running processes, it appears like they many processes are being run concurrently
- multi-core CPUs can run/execute more than one process concurrently

### Two types of processes

- User processes
  - Usually run by a user and linked to the shell session in which they were run
- System processes
  - most processes running are system processes
  - they usually don't provide an application or interface for the end user to use
  - they provide services like:
    - a web server
    - FTP server
    - a file service
    - a print service
    - a logging service

## What is a reverse proxy?

- A reverse proxy allows a user to be directed to a specfic port without needing to specify this in the url
  - E.g. 123.12.12.123:3000 can now be accessed from just 123.12.12.123

## What is user data (VM)?

- User data allows a Bash script to be run once immediately after virtual machine creation.
- It runs as root user and takes the same duration as the Bash script would normally
- When making a new VM:
  - Expand Advanced
  - Under "user data" paste the Bash script
  - It will be run on creation

While user data is running, what is to be expected in your web browser at the public IP (assuming app deployment script):
1. Error
2. Welcome to Nginx homepage
3. 502 error: Bad gateway
4. App displays

# Mistakes Made

- using ./file.sh instead of source file.sh or . file.sh
  - using ./file.sh runs the script in a subshell so any jobs won't be shown, like npm start &
- REMEMBER TO CHANGE PRIVATE IP
  - `export DB_HOST=mongodb://172.31.19.162:27017/posts`
  - Remember this line in `prov-app.sh` will need the ip changing if the database has switched to a new VM

# Commands

## Getting Help

Help for a command:

> [command] --help

---

## Basic Commands

Show date:

> date

Show current calendar month:

> cal

Show current uptime:

> uptime

Show who you are logged in as:

> whoami


Display user information:

> finger

Show manual of command:

> man command

Display who is online:

> who / w

---

## Navigation (Directories)

Change directory:

> cd  
> cd .ssh  
> cd ..  
> cd ~

Show current directory:

> pwd

SSH Connect:

> ssh -i "tech601-jason-aws.pem" ubuntu@ec2-34-255-215-7.eu-west-1.compute.amazonaws.com

---

## Listing Files & Directories

List files:

> ls  
> ls -a  
> ls -l  
> ls -la

Visualize directory structure:

> tree

---

## File Viewing & Searching

Print file contents to screen:

> cat

Show top lines of a file:

> head

Show bottom lines of a file:

> tail

Number lines in a file:

> nl

Search for keywords in files:

> grep

Identify file type:

> file

---

## File & Directory Management

Move or rename files:

> mv

Copy files:

> cp

Remove files:

> rm

Make directories:

> mkdir

Remove directories recursively:

> rm -r

Remove directories recursively with force:

> rm -rf

Remove empty directories:

> rm -d

Create empty file:

> touch

Create compressed file:

> gzip

Unzip file:

> gunzip

Extract tar file:

> tar

---

## File Permissions

Change file permissions:

> chmod 400 [filename]

Make a script executable:

> chmod +x install_nginx.sh

---

## Text Editing

Edit files in text editor:

> nano

Edit bash configuration:

> nano .bashrc

---

## System Information

Show OS name:

> uname

Show detailed OS information:

> uname -a

Show current user:

> whoami

Show running processes:

> ps

---

## Process Management

Show processes (different formats):

> ps  
> ps -A  
> ps -e  
> ps aux

Interactive process viewer:

> top

Sort inside `top`:

> Shift + M (sort by memory)  
> Shift + P (sort by CPU)  
> Shift + N (sort by newest)

Enhanced process viewer:

> htop

Kill processes:

> kill  
> kill -1  
> kill -15  
> kill -9

Pause execution:

> sleep 3  
> sleep 30  
> sleep 5000

Manage background jobs:

> jobs  
> jobs -l

Run program in foreground:

> fg

Run service in the back group:

> bg

---

## User Management

Add user: 

> useradd `option` `username`

Useradd options:

* -u = user id
* -g = primary group id
* -G = seconday group id
* -d = home directory
* -c = comment
* -s = shell

---

## System Management

Free memory:

> free

Display memory information:

> /proc/meminfo

Display CPU information:

> /proc/cpuinfo

Show directory space usage:

> du

Show possible locations of app:

> whereis

Show which app will be run by default:

> which

---


## Environment Variables

Show all environment variables:

> printenv

Print a variable:

> echo $MYNAME

Set environment variable:

> export MYNAME=ramon

Make variable persistent (put in .bashrc):

> export MYNAME="Ramon is persistent"

Remove environment variable:

> unset MYNAME

Reload bash configuration:

> source .bashrc

---

## Command History

Show command history:

> history

Clear command history:

> history -c

---

## Networking & Downloads

Lists host name of the server:

> hostname

Availability of destination server over the network:

> Ping `ip`

Lists IP addresses of the server:

> ifconfig

Download with curl:

> curl [URL] --output [filename]

Download with wget:

> wget [URL] --output [filename]

Copy file into VM:

>  scp -i ~/.ssh/key-pair app.zip username@public-ip:/home/username

---

## User & Session Management

Switch user:

> su

Run command as superuser:

> sudo

Exit SSH session:

> exit

---

## Package Management (APT)

Update package sources:

> sudo apt update

Upgrade packages:

> sudo apt upgrade

Upgrade packages automatically confirming prompts:

> sudo apt upgrade -y

Install a package:

> apt install [package]

Example install:

> sudo apt install nginx -y

---

## Services (systemctl)

Check service status:

> systemctl status nginx

Check if service is enabled at startup:

> systemctl is-enabled nginx

Enable service at startup:

> sudo systemctl enable nginx

Disable service:

> systemctl disable nginx

Restart a service:

> sudo systemctl restart nginx

Stop a service:

> systemctl stop nginx

Start a service:

> systemctl start nginx

---

## Running Scripts

List files with permissions:

> ls -l

Run executable script:

> source install_nginx.sh

or:

> . install_nginx.sh

View script contents:

> cat install_nginx.sh

Run in background using &:

> npm start &

Access job while running and stop it:

> fg %1

1 represents first job in jobs list, then you can stop normally:

> Ctrl + C

To disable interactable user input for commands like apt upgrade:

> export DEBIAN_FRONTEND=noninteractive

---

## Terminal Shortcuts

Stop a running command:

> Ctrl + C

Suspend a process:

> Ctrl + Z

Quit interactive programs:

> q

## PM2

Install (use -g to make it global):

> sudo npm install -g pm2

Stop app:

> pm2 delete sparta-app || true

Start app:

> pm2 start app.js --name sparta-app

## Checking Ports

Check process on port 3000:

> lsof 3000

or:

> curl 127.0.0.1:3000

# Bash Script

``` Bash
#!/bin/bash 

echo update...
sudo apt update -y 
echo done
echo

echo upgrade... 
# NO LONGER NEEDS FIXING! Asks for user input. Search for noninteractive
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo done
echo

echo install nginx...
# not needed to run app, but will need it later for reverse proxy
# NO LONGER NEEDS FIXING! Asks for user input. Search for noninteractive
sudo DEBIAN_FRONTEND=noninteractive apt install nginx -y
echo done
echo

echo download installation script for nodejs 20.x...
curl -sL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh
echo done
echo

echo run installation script for nodejs 20.x...
# NO LONGER NEEDS FIXING! Asks for user input. Search for noninteractive
sudo DEBIAN_FRONTEND=noninteractive bash nodesource_setup.sh
echo done
echo

echo install nodejs 20.x...
# NO LONGER NEEDS FIXING! Asks for user input. Search for noninteractive
sudo DEBIAN_FRONTEND=noninteractive apt install nodejs -y
echo done
echo

echo install pm2...
sudo npm install -g pm2
echo done
echo

echo git clone app code...
if [ ! -d "tech601-sparta-app" ]; then
    git clone --recursive https://github.com/Jason-Bott/tech601-sparta-app.git
else
    echo repo already exists
fi
echo done
echo

echo cd into app directory...
cd tech601-sparta-app
cd app
echo done
echo

echo npm install...
npm install
echo done
echo

# echo run app using either npm start or node app.js in the background using "&"...
# npm start &
# echo done
# echo

echo pm2 to stop the app...
# for idempotency - we can run our script multiple times without errors
pm2 delete sparta-app || true
echo done
echo

echo pm2 to start the app...
pm2 start app.js --name sparta-app
echo done
echo

echo cd to home...
cd ~
echo done
echo
```

# File Management

## File Permissions

### Does being the owner of a file mean you have full permissions on that file?

No, being the owner does **NOT** mean you have full permissions.

In Linux there are three permission sets:
- User (owner)
- Group
- Other

Each set can have:
- Read (r)
- Write (w)
- Execute (x)

The owner is in the user category.

### If you give permissions to the User entity, what does this mean?

The user entity refers to the file owner. Permissions assigned to the user only apply to the owner of the file.

``` Bash
-rwx------
```

This means the owner (user) can read, write, and execute but no one else has access.

### If you give permissions to the Group entity, what does this mean?

The Group entity refers to users who belong to the file's group. Every file has a group and these permissions are assigned to the users in that group.

``` Bash
-rwxrwx---
```

If the file group is developers, then all users in the developers group can read, write, and execute.

### If you give permissions to the Other entity, what does this mean?

Other refers to anyone else on the system who is not the owner or in the file's group.

``` Bash
-rwxr-xr-x
```

Here other users can read and execute but cannot write.

## File Permissions (Numeric Values)

### What numeric values are assigned to each permission?

| Permission    | Symbol | Numeric Value |
| ------------- | ------ | ------------- |
| Read          | r      | 4             |
| Write         | w      | 2             |
| Execute       | x      | 1             |

Permissions are added together to get the final value (e.g. rwx = 4 + 2 + 1 = 7)

### What numeric value would you use to assign read and write permissions?

Read = 4 <br>
Write = 2 <br>
Read + Write = 4 + 2 = 6

### What numeric value would you use to assign read, write and execute permissions?

rwx = 4 + 2 + 1 = 7

### What numeric value would you use to assign read and execute permissions?

rx = 4 + 1 = 5

### What do the three numbers in permissions represent?

The three numbers represent the permissions for the different entities. 644 would represent permissions for User, Group, Other.

With the 644 example:

| Entity | Number | Permissions |
| ------ | ------ | ----------- |
| User   | 6      | Read + Write|
| Group  | 4      | Read        |
| Other  | 4      | Read        |

## Changing File Permissions

### What command changes file permissions?

The Linux command to change file permissions is:

``` Bash
chmod
```

which stands for **change mode**.

Example:

``` Bash
chmod 755 script.sh
```

### To change permissions on a file what must the end user be? (2 answers)

The user must be either:
- The owner of the file
  - The file owner is allowed to modify permissions on their own files.
- The root
  - The root user has permission to change permissions on any file in the system.

### Give examples of some different ways/syntaxes to set permissions on a new file (named testfile.txt) to: Set User to read, Group to read + write + execute, and Other to read and write only

Symbolically:

``` Bash
r--rwxrw-
```

Symbolic Syntax:

``` Bash
chmod u=r,g=rwx,o=rw testfile.txt
```

Numeric Syntax:

``` Bash
chmod 476 testfile.txt
```

### Add execute permissions (to all entities)

``` Bash
chmod a+x testfile.txt
```

- a = all entities (user, group, other)
- +x = add execute

### Take write permissions away from Group

``` Bash
chmod g-w testfile.txt
```

- g = group
- -w = remove write

### Use numeric values to give read + write access to User, read access to Group, and no access to Other.

``` Bash
chmod 640 testfile.txt
```

- User = Read + Write = 6
- Group = Read = 4
- Other = None = 0

## Managing File Ownership

### Why is managing file ownership important?

- Improves security by ensuring only authorised users can modify or delete files.
- Add access control allowing administrators to decide who can read, write, or execute files.
- On Linux systems multiple users share the same system, ownership ensures users cannot interfere with other users' files.
- Many system files must be owned by specific users to prevent accidental modification.

### What is the command to view file ownership?

``` Bash
ls -l testfile.txt
```

Output:

``` Bash
-rw-r--r-- 1 jason staff 120 Mar 16 12:30 testfile.txt
```

Jason is the owner of the file, the group is staff

### What permissions are set when a user creates a file or directory? Who does file or directory belong to?

Typically the default permissions for a file are:

``` Bash
rw-r--r--
```

and for a directory are:

``` Bash
rwx-r-xr-x
```

The user who created the file becomes the owner with the group being the user's primary group.

### Why does the owner, by default, not receive X permissions when they create a file?

Files do not receive execute permissions by default because **most files are not programs**.

This prevents accidental execution of malicious or unintended files.

### What command is used to change the owner of a file or directory?

``` Bash
chown
```

means change owner.

Change file owner:

``` Bash
sudo chown amy testfile.txt
```

Change owner and group:

``` Bash
sudo chown amy:developers testfile.txt
```

Change ownership of a directory and its contents:

``` Bash
sudo chown -R amy projectfolder
```

# Streams, Redirection and Appending, Piping

## Streams

### What is a stream in Linux?

A stream is a flow of data between a program and the system. When a command runs in Linux it communicates using the following streams:
- It receives input
- It produces output
- It reports errors

These streams allow Linux to redirect data to files or other commands.

### What are the 3 data streams?

| Stream          | Name   | Number | Purpose                       |
| --------------- | ------ | ------ | ----------------------------- |
| Standard Input  | stdin  | 0      | Data going **into** a program |
| Standard Output | stdout | 1      | Normal output from a program  |
| Standard Error  | stderr | 2      | Error messages                |

### Create a new file new.txt and run the command ls missing_directory new.txt - this should give output to two different streams.

Output:

``` Bash
ls: cannot access 'missing_directory': No such file or directory
new.txt 
```

In this output we can see two streams occuring, stderr on the first line, and stdout on the second.

### How can we direct each stream to a file (one at a time)?

``` Bash
ls missing_directory new.txt > output.txt
```

This will redirect stdout (1) to `output.txt` which will contain new.txt.

``` Bash
ls missing_directory new.txt 2> error.txt
```

This will redirect stderr (2) to `error.txt` which will contain the error message.

### How can we direct both 2 output streams to a file?

``` Bash
ls missing_directory new.txt > output.txt 2> error.txt
```

This will redirect the streams to their respective files all in one line.

### Which stream is directed to a file by default?

When the `>` is used Linux redirects the standard output (stdout). So the default stream is stdout (1).

### How can we direct both output streams to a file in one command?

``` Bash
ls missing_directory new.txt > all_output.txt 2>&1
```

This will send both normal output and error messages into the one file `all_output.txt`.

## Redirection and Appending

### What does > do?

The `>` operator redirects standard output (stdout) to a file. It writes the output of a command to a file and overwrites the file if it already exists.

### How is appending different?

Appending adds new output to the end of an existing file instead of replacing it. This is done with the operator `>>`

### Give an example of a command where it appends to a file

``` Bash
date >> log.txt
```

This command adds the current date to the end of log.txt. If run multiple times the log would contain multiple dates one after the other.

## Piping

### What is piping?

Piping is when the output of one command is sent directly as the input to another command. Instead of saving the output to a file first, the data flows directly between commands.

``` Bash
ls | sort
```

Here `ls` produces a list of files then `sort` receives that list and sorts it.

### How is piping different to redirection using > or >>?

| Feature   | Piping                         | Redirection           |
| --------- | ------------------------------ | --------------------- |
| Purpose   | Send output to another command | Send output to a file |
| Data flow | Command → Command              | Command → File        |

### What character is used for piping?

``` Bash
|
```

### Give an example of a command that using piping once

``` Bash
ls | wc -l
```

Here `ls` lists files then `wc -l` counts the lines.

### Give an example of a command that using piping twice

``` Bash
ls | sort | wc -l
```

Here `ls` lists files then `sort` sorts the list then `wc -l` counts the number of files.

### Give an example of a command that using piping twice, than sends the output to a file

``` Bash
ls | sort | wc -l > filecount.txt
```

Here `ls` lists files then `sort` sorts the list then `wc -l` counts the number of files then the result is saved in `filecount.txt`