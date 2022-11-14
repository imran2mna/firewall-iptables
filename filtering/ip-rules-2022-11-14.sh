# Drop the incoming packets
-P INPUT DROP

# Drop the forwarding packets
-P FORWARD DROP

# Allow to access outside without conditions
-P OUTPUT ACCEPT
# Since default incoming packets blocked, allow only established connections from OUTPUT chain
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Allow incoming SSH connections
-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT

# Allow incoming/forwarding ICMP ping requests
-A INPUT -p icmp -j ACCEPT
-A FORWARD -p icmp -j ACCEPT
