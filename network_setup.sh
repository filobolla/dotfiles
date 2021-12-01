#!/bin/bash
# Create network location for interfacing with RPi without router
sudo networksetup -createlocation "RPi First Connect" populate
sudo networksetup -switchlocation "RPi First Connect"
# Setup manual IPs for wired and WLAN interfaces
sudo networksetup -setmanual "Ethernet Thunderbolt" 192.168.100.201 255.255.255.0 192.168.100.1
sudo networksetup -setmanual "WiFi" 192.168.100.200 255.255.255.0 192.168.100.1
# Return to the automatic location
sudo networksetup -switchtolocation "Automatic"
