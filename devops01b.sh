#!/bin/sh
# Assignment 1b

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
# Usage of systeminfo ; will work only on Windows system
Print_CPU() {
    echo "----- CPU Information -----"
    cmd1=$(echo "$sysout1" | grep  "Processor")
    echo "$cmd1"
    cmd2=$(echo "$sysout1" | grep  "Family")
    echo "$cmd2"
}

# Print CPU information
# Usage of /proc/cpuinfo; will work only on Unix system
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

# Print CPU information
# Looks most correct, but copied from google result; will work only on Unix
Print_CPU_2() {
    echo "----- CPU Information -----"
    cmd1=$(cat /proc/cpuinfo | \
        awk -v FS=':' '                                       \
            /^physical id/ { if(num_cpu <$2)  { num_cpu=$2 } }     \
            /^cpu cores/   { if(num_cores<$2){ num_cores=$2 } }   \
            /^processor/   { if(num_units<$2){ num_units=$2 } }   \
            /^model name/  { model=$2 }                         \
                                                        \
            END{                                                \
                num_cpu=(num_cpu+1);                                 \
                num_units=(num_units+1);                             \
                                                      \
                print "CPU model:",model;                          \
                print num_cpu,"CPU,",num_cores,"physical cores per CPU, total",num_units,"logical CPU units" \
            }')

    echo "$cmd1"

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

# Print Usage
Usage() {
    echo "Usage: devops01b.sh -volumes -cpu -ram -network -all"
}


#----- Main

echo "----- Main -----"

numargs=$#
if [[ $numargs == 0 ]]
then
    echo 'Incorrect number of arguments'
    Usage
    exit 1
fi

sysout1=$(systeminfo)

for arg1 in $*;
    do
        case $arg1 in
        "-volumes") Print_Disk
        ;;
        "-cpu") Print_CPU_2
        ;;
        "-ram") Print_ram
        ;;
        "-network") Print_Mac_IP
        ;;
        "-all") Print_Disk
                Print_CPU_2
                Print_Ram
                Print_Mac_IP
        ;;
        esac

    done
    
