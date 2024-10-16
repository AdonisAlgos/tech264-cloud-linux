#!/bin/bash

# configure iptables

echo "Configuring iptables..."

# Allow all incoming and outgoing traffic on the loopback interface (localhost).
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT

# Allow incoming traffic that is part of an already established or related connection.
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow outgoing traffic that is part of an already established connection.
sudo iptables -A OUTPUT -m state --state ESTABLISHED -j ACCEPT

# Drop incoming traffic if the packet state is invalid, typically indicating potential malicious traffic.
sudo iptables -A INPUT -m state --state INVALID -j DROP

# Allow new and established incoming SSH connections on port 22 and outgoing SSH traffic for established connections.
sudo iptables -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT

# Allow forwarding of TCP traffic on port 27017 from source subnet 10.0.2.0/24 to destination subnet 10.0.4.0/24.
sudo iptables -A FORWARD -p tcp -s 10.0.2.0/24 -d 10.0.4.0/24 --destination-port 27017 -m tcp -j ACCEPT

# Allow forwarding of ICMP (ping) packets from 10.0.2.0/24 to 10.0.4.0/24 for new and established connections.
sudo iptables -A FORWARD -p icmp -s 10.0.2.0/24 -d 10.0.4.0/24 -m state --state NEW,ESTABLISHED -j ACCEPT

# Set the default policy for the INPUT chain to DROP, rejecting all incoming traffic that isn't explicitly allowed.
sudo iptables -P INPUT DROP

# Set the default policy for the FORWARD chain to DROP, blocking all forwarding traffic unless allowed.
sudo iptables -P FORWARD DROP

echo "Done!"
echo ""

# Make iptables rules persistent across reboots.
# This will install the iptables-persistent package to save current rules.
echo "Make iptables rules persistent..."
sudo DEBIAN_FRONTEND=noninteractive apt install iptables-persistent -y
echo "Done!"
echo ""