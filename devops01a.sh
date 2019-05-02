#!/bin/sh
# Assignment 1

# Print Disk partitions 
# number of volumes, size of each volume, free space on each volume
Print_Disk() {
    echo "----- Disk Information -----"
    cmd1=$( df -HT )
    echo "$cmd1"
#    cmd2=$( echo "$cmd1" | grep G) 
#    echo "$cmd2"
}

# Print CPU information
Print_CPU() {
    echo "----- CPU Information -----"

}

# Print RAM information
Print_Ram() { 
    echo "----- Ram Information -----"
    #echo "$( systeminfo | grep 'Virtual Memory:')"
    cmd1=$(echo "$sysout1" | grep 'Virtual Memory:')
    echo "$cmd1"
}

# Print MAC address and IP address information
Print_Mac_IP() {
    echo "----- MAC and IP Information -----"

}

#----- Main

echo "----- Main -----"
sysout1=$(systeminfo)
Print_Disk
Print_Ram

