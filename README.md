# project_xenon_stack_task1
New Linux command - internsctl


![image](https://github.com/SUKHJIT-CYBER/project_xenon_stack_task1/assets/78156807/fc280682-20f2-48d8-b990-0693e46d5035)

# internsctl

`internsctl` is a custom Linux command-line tool for performing various system operations. It provides a set of commands to retrieve information about the CPU, memory, manage users, and perform file operations.

## Version

Current version: v0.1.0



![image](https://github.com/SUKHJIT-CYBER/project_xenon_stack_task1/assets/78156807/0687e2db-62b4-4fae-9ae8-cf50ce913d4a)

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Commands](#commands)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

## Installation


```bash
chmod +x internsctl.sh
sudo mv internsctl.sh /usr/local/bin/
sudo cp internsctl.1 /usr/share/local/man/man1/
```

Usage
```bash

internsctl [OPTIONS] [COMMAND] [ARGUMENTS]
Commands
cpu: Display CPU information
```

![image](https://github.com/SUKHJIT-CYBER/project_xenon_stack_task1/assets/78156807/45205bb8-47af-4574-b17d-6bb82340b032)


getinfo: Get detailed CPU information
memory: Display memory information

![image](https://github.com/SUKHJIT-CYBER/project_xenon_stack_task1/assets/78156807/989d857e-5b13-4432-b287-cbb4de9189df)

getinfo: Get detailed memory information
user: User management operations

create: Create a new user

![image](https://github.com/SUKHJIT-CYBER/project_xenon_stack_task1/assets/78156807/b52e8dfc-f2e6-4ca6-8916-bb204ebdbc73)

list: List all users

![image](https://github.com/SUKHJIT-CYBER/project_xenon_stack_task1/assets/78156807/8f65cbd0-70a3-459a-970e-ae65d0e11cc8)


 or sudo users only (use --sudo-only option)

![image](https://github.com/SUKHJIT-CYBER/project_xenon_stack_task1/assets/78156807/f8a19f52-120e-4ec0-b71a-1d4a02917c0c)

file: File operations

getinfo: Display detailed information about a file
Examples
Display detailed CPU information:

```bash

internsctl cpu getinfo
Display memory information:
```

```bash

internsctl memory getinfo
```
Create a new user:

```bash

internsctl user create <username>```
List all users:

```bash

internsctl user list```
List sudo users only:

```bash

internsctl user list --sudo-only```
Display information about a file:

```bash

internsctl file getinfo /path/to/file.txt```
Display only the size of a file:

```bash

internsctl file getinfo --size /path/to/file.txt```
Display only the permissions of a file:

```bash

internsctl file getinfo --permissions /path/to/file.txt ```
Display only the owner of a file:

```bash

internsctl file getinfo --owner /path/to/file.txt```
Display only the last modified time of a file:

```bash

internsctl file getinfo --last-modified /path/to/file.txt```
Display file information with multiple options:

```bash

internsctl file getinfo --size --permissions --last-modified /path/to/file.txt
List sudo users and create a new user in one command:

```

 Usage Examples :

![Screenshot 2023-12-28 140447](https://github.com/SUKHJIT-CYBER/project_xenon_stack_task1/assets/78156807/a18df2e1-b2d2-48c2-bec8-b0382b43411b)


![Screenshot 2023-12-28 144830](https://github.com/SUKHJIT-CYBER/project_xenon_stack_task1/assets/78156807/e9ee163f-9f1f-4b37-a9e9-b73b592860b4)


![image](https://github.com/SUKHJIT-CYBER/project_xenon_stack_task1/assets/78156807/ead33448-9fd0-4b28-a425-86643266e345)



internsctl user list --sudo-only && internsctl user create <anotherusername>
Contributing
Contributions are welcome! If you find any issues or have suggestions for improvement, feel free to open an issue or submit a pull request.

