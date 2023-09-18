#!/bin/bash

# Define usage information
usage() {
  echo "Usage: $0 [-c --create] [-d --delete] [-r --reset] [-l --list] [-m --modify] [-h --help]"
  echo "Options:"
  echo "  -c, --create  : Create a new user account"
  echo "  -d, --delete  : Delete an existing user account"
  echo "  -r, --reset   : Reset the password of an existing user account"
  echo "  -l, --list    : List all user accounts on the system"
  echo "  -m, --modify  : Modify user account properties"
  echo "  -h, --help    : Display usage information (this message)"
  exit 1
}

# Check for the number of arguments
if [ $# -eq 0 ]; then
  usage
fi

# Process command line options
while getopts "c:d:r:lm:h" opt; do
  case "$opt" in
    c)
      username="$OPTARG"
      useradd "$username"
      echo "Created user: $username"
      ;;
    d)
      username="$OPTARG"
      userdel -r "$username"
      echo "Deleted user: $username"
      ;;
    r)
      username="$OPTARG"
      passwd "$username"
      ;;
    l)
      awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd
      ;;
    m)
      username="$OPTARG"
      usermod -aG sudo "$username"
      echo "Modified user: $username (added to sudo group)"
      ;;
    h)
      usage
      ;;
    \?)
      echo "Invalid option: -$OPTARG"
      usage
      ;;
    :)
      echo "Option -$OPTARG requires an argument."
      usage
      ;;
  esac
done
