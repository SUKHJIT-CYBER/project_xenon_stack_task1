#!/bin/bash

# internsctl - Custom Linux command for operations
# Version: v0.1.0

# fn for manual page
manual() {
    echo "Error: Use ""man internsctl"" to display the manual page"
}

# fn for help page
help() {
cowsay sukhjit-singh
    cat << EOF
Usage: internsctl [OPTIONS] [COMMAND] [ARGUMENTS]
Created by: sukhjit singh<sukhjitminhas753159@gmail.com>
Owned by: sukhjit singh


Custom Linux command for various operations.

Options:
  --help        Display this help message
  --version     Display the version of internsctl

Commands:
  cpu           Display CPU information
    getinfo     Get detailed CPU information

  memory        Display memory information
    getinfo     Get detailed memory information

  user          User management operations
    create     Create a new user
    list       List all users or sudo users only
               Usage: internsctl user list [--sudo-only]

  file          File operations
    getinfo    Display detailed information about a file
               Usage: internsctl file getinfo [OPTIONS] <file-name>

Examples:
  1. Display detailed CPU information: internsctl cpu getinfo

  2. Display memory information: internsctl memory getinfo

  3. Create a new user: internsctl user create <username>

  4. List all users: internsctl user list

  5. List sudo users only: internsctl user list --sudo-only

  6. Display information about a file: internsctl file getinfo /path/to/file.txt

  7. Display only the size of a file: internsctl file getinfo --size /path/to/file.txt

  8. Display only the permissions of a file: internsctl file getinfo --permissions /path/to/file.txt

  9. Display only the owner of a file: internsctl file getinfo --owner /path/to/file.txt

  10. Display only the last modified time of a file: internsctl file getinfo --last-modified /path/to/file.txt

  11. Display file information with multiple options:internsctl file getinfo --size --permissions --last-modified /path/to/file.txt

  12. List sudo users and create a new user in one command: internsctl user list --sudo-only && internsctl user create <anotherusername>


For more help and info , go to : https://github.com/SUKHJIT-CYBER/
Sukhjit
EOF
}

# fn for version page
version() {
cowsay sukhjit-singh
    echo "internsctl v0.1.0"
}

cpu_info() {
cowsay sukhjit-singh
    lscpu
}

memory_info() {
cowsay sukhjit-singh
    free
}

add_user() {
    if [ -z "$3" ]; then
        echo "Error: Please provide a valid username. Usage: internsctl user create <username>"
        exit 1
    fi

    sudo useradd -m -s /bin/bash "$3"
    echo "User '$3' created successfully."
}

list_all_users() {
    getent passwd | awk -F: '$4 >= 1000 && $4 < 65534 {print $1}'
}

list_sudo_users() {
    getent passwd | while IFS=: read -r username _ _ _ _ _ home _; do
        sudo -lU "$username" 2>/dev/null | grep -q '(ALL : ALL)' && echo "$username ($home)"
    done
}




file_info(){
cowsay sukhjit-singh

 if [ -z "$3" ]; then
        echo "Error: Please provide a file name. Usage: internsctl file getinfo <file-name>"
        exit 1
    fi

    file="$3"
    size=$(stat -c "%s" "$file")
    permissions=$(stat -c "%A" "$file")
    owner=$(stat -c "%U" "$file")
    last_modified=$(stat -c "%y" "$file")

    echo "File: $file"
    echo "Access: $permissions"
    echo "Size(B): $size"
    echo "Owner: $owner"
    echo "Modify: $last_modified"

}

# main
case "$1" in
    --help)
        help
        ;;
    --manual)
        manual
        ;;
    --version)
        version
        ;;
    cpu)
        case "$2" in
            getinfo)
                cpu_info
                ;;
            *)
                echo "Error: Unknown CPU command. Use 'internsctl cpu getinfo' for CPU information."
                exit 1
                ;;
        esac
        ;;
    memory)
        case "$2" in
            getinfo)
                memory_info
                ;;
            *)
                echo "Error: Unknown memory command. Use 'internsctl memory getinfo' for memory information."
                exit 1
                ;;
        esac
        ;;
    user)
        case "$2" in
            create)
                add_user "$@"
                ;;
            list)
                if [ "$3" == "--sudo-only" ]; then
                    list_sudo_users
                else
                    list_all_users
                fi
                ;;
            *)
                echo "Error: Unknown user command. Use 'internsctl user --help' for user management."
                exit 1
                ;;
        esac
        ;;
    file)
        case "$2" in
            getinfo)
                file_info "$@"
                ;;
            *)
                echo "Error: Unknown file command. Use 'internsctl file --help' for file operations."
                exit 1
                ;;
        esac
        ;;
    *)
        # Add your custom logic for the command operations here
        # For example: custom_operation "$@"
        echo "Error: Unknown command. Use 'internsctl --help' for usage information."
        exit 1
        ;;
esac

# End of script
