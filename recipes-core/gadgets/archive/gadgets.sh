#!/bin/sh

# modprobe libcomposite
# cd /sys/kernel/config/usb_gadget/
# mkdir -p pi4
# cd pi4
# echo 0x1d6b > idVendor
# echo 0x0104 > idProduct 
# echo 0x0100 > bcdDevice 
# echo 0x0200 > bcdUSB 
# echo 0xEF > bDeviceClass
# echo 0x02 > bDeviceSubClass
# echo 0x01 > bDeviceProtocol
# mkdir -p strings/0x409
# echo "fedcba9876543211" > strings/0x409/serialnumber
# echo "Ben Hardill" > strings/0x409/manufacturer
# echo "PI4 USB Device" > strings/0x409/product
# mkdir -p configs/c.1/strings/0x409
# echo "Config 1: ECM network" > configs/c.1/strings/0x409/configuration
# echo 250 > configs/c.1/MaxPower
# mkdir -p functions/ecm.usb0
# HOST="00:dc:c8:f7:75:14" 
# SELF="00:dd:dc:eb:6d:a1"
# echo $HOST > functions/ecm.usb0/host_addr
# echo $SELF > functions/ecm.usb0/dev_addr
# ln -s functions/ecm.usb0 configs/c.1/
# udevadm settle -t 5 || :
# ls /sys/class/udc > UDC
# ip link set usb0 up

do_start() {
    insmod libcomposite.ko 
    insmod u_ether.ko 
    insmod usb_f_rndis.ko 
    
    mount -t configfs none /sys/kernel/config
    
    mkdir /sys/kernel/config/usb_gadget/g1
    cd /sys/kernel/config/usb_gadget/g1
    
    echo "0x1d6b" > idVendor
    echo "0x0104" > idProduct
    
    echo "0x200" > bcdUSB
    echo "0xEF" > bDeviceClass
    echo "0x02" > bDeviceSubClass
    echo "0x01" > bDeviceProtocol
    echo "0x0100" > bcdDevice
    
    mkdir -p strings/0x409
    echo "0" > strings/0x409/serialnumber
    echo `uname -r` > strings/0x409/manufacturer
    echo `hostname -s` > strings/0x409/product
    
    # Config
    mkdir configs/c.1
    mkdir -p configs/c.1/strings/0x409
    echo "Config 1: RNDIS" > configs/c.1/strings/0x409/configuration
    echo 250 > configs/c.1/MaxPower
    echo 0xC0 > configs/c.1/bmAttributes
    
    mkdir functions/rndis.0
    # Windows extension to force RNDIS config
    echo "1" > os_desc/use
    echo "0xbc" > os_desc/b_vendor_code
    echo "MSFT100" > os_desc/qw_sign
    
    mkdir -p /functions/rndis.0/os_desc/interface.rndis
    echo "RNDIS" > functions/rndis.0/os_desc/interface.rndis/compatible_id
    echo "5162001" > functions/rndis.0/os_desc/interface.rndis/sub_compatible_id
    
    # Set up the rndis device only first
    ln -s functions/rndis.0 configs/c.1
    ln -s configs/c.1 os_desc
    
    echo "ci_hdrc.0" > UDC
    
    ip link set usb0 up
}

do_stop() {
    cd /sys/kernel/config/usb_gadget/g1
    echo "" > UDC
    rm os_desc/c.1/
    rm configs/c.1/rndis.0/
    rmdir configs/c.1/strings/0x409/
    rmdir configs/c.1/
    rmdir functions/rndis.0/
    rmdir strings/0x409/
    cd ..
    rmdir g1/
     
    rmmod u_ether.ko 
    rmmod usb_f_rndis.ko
    rmmod libcomposite.ko
}

case $1 in
    start)
        echo "Start usb gadget"
        do_start 
        ;;
    stop)
        echo "Stop usb gadget"
        do_stop
        ;;
    *)
        echo "Usage: $0 (stop | start)"
        ;;
esac