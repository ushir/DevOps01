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
    cmd1=$(echo "$sysout1" | grep  "Processor")
    echo "$cmd1"
    cmd2=$(echo "$sysout1" | grep  "Family")
    echo "$cmd2"
}

Print_CPU_1(){
    echo "----- Number of Cores Information -----"
    cmd1=$("nproc")
    echo "Number of cores: $cmd1"
    cmd2=$(cat /proc/cpuinfo)
    echo "----- CPU Information -----"
    echo "$(cat /proc/cpuinfo | grep -m 1 'model')"
    echo "$(cat /proc/cpuinfo | grep -m 1 'model name')"
    echo "$(cat /proc/cpuinfo | grep -m 1 'cpu MHz')"
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
    echo "----- MAC/NIC Information -----"
    cmd1=$( ipconfig /all | grep -m 4 "Physical Address")
    echo "$cmd1"
    echo "----- IP Information -----"
    cmd2=$( ipconfig /all | grep "IPv4 Address")
    echo "$cmd2"


}

#----- Main

echo "----- Main -----"
sysout1=$(systeminfo)
Print_Disk
Print_CPU
Print_CPU_1
Print_Ram
Print_Mac_IP

