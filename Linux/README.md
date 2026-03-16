# Linux

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

> -rwx------

This means the owner (user) can read, write, and execute but no one else has access.

### If you give permissions to the Group entity, what does this mean?

The Group entity refers to users who belong to the file's group. Every file has a group and these permissions are assigned to the users in that group.

> -rwxrwx---

If the file group is developers, then all users in the developers group can read, write, and execute.

### If you give permissions to the Other entity, what does this mean?

Other refers to anyone else on the system who is not the owner or in the file's group.

> -rwxr-xr-x

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

> chmod

which stands for **change mode**.

Example:

> chmod 755 script.sh

### To change permissions on a file what must the end user be? (2 answers)

The user must be either:
- The owner of the file
  - The file owner is allowed to modify permissions on their own files.
- The root
  - The root user has permission to change permissions on any file in the system.

### Give examples of some different ways/syntaxes to set permissions on a new file (named testfile.txt) to: Set User to read, Group to read + write + execute, and Other to read and write only

Symbolically:

> r--rwxrw-

Symbolic Syntax:

> chmod u=r,g=rwx,o=rw testfile.txt

Numeric Syntax:

> chmod 476 testfile.txt

### Add execute permissions (to all entities)

> chmod a+x testfile.txt

- a = all entities (user, group, other)
- +x = add execute

### Take write permissions away from Group

> chmod g-w testfile.txt

- g = group
- -w = remove write

### Use numeric values to give read + write access to User, read access to Group, and no access to Other.

> chmod 640 testfile.txt

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

> ls -l testfile.txt

Output:

> -rw-r--r-- 1 jason staff 120 Mar 16 12:30 testfile.txt

Jason is the owner of the file, the group is staff

### What permissions are set when a user creates a file or directory? Who does file or directory belong to?

Typically the default permissions for a file are:

> rw-r--r--

and for a directory are:

> rwx-r-xr-x

The user who created the file becomes the owner with the group being the user's primary group.

### Why does the owner, by default, not receive X permissions when they create a file?

Files do not receive execute permissions by default because **most files are not programs**.

This prevents accidental execution of malicious or unintended files.

### What command is used to change the owner of a file or directory?

> chown

means change owner.

Change file owner:

> sudo chown amy testfile.txt

Change owner and group:

> sudo chown amy:developers testfile.txt

Change ownership of a directory and its contents:

> sudo chown -R amy projectfolder