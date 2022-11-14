# Drop the incoming packets
-P INPUT DROP
# Since default outgoing packets blocked, allow only establed connections into INPUT chain
-A OUTPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Drop the forwarding packets
-P FORWARD DROP

# Drop outside packets
-P OUTPUT DROP
# Since default incoming packets blocked, allow only established connections from OUTPUT chain
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Allow SSH connections
-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 22 -j ACCEPT

# Allow dns UDP
-A OUTPUT -p udp -m udp --dport 53 -j ACCEPT

# Allow incoming/forwarding ICMP ping requests
-A INPUT -p icmp -j ACCEPT
-A FORWARD -p icmp -j ACCEPT
-A OUTPUT -p icmp -j ACCEPT
