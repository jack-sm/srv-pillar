# Pillar values for Openshift Origin EL6 #
#========================================#
oso_el6:
  # Define if the build will consist of 'nightly' or 'stable' packages.
  # If not defined, defaults to 'stable'.
  buildtype        : stable
  # Define the infrastructure topology.
  # Accepted values are 'all_in_one' or 'multi'
  # Defaults to 'multi'
  topology         : multi
  network:
    domain         : example.com
    subnet         : 
    gateway        : 
    dns_servers:
      dns1         : 
      dns2         : 
  # MongoDB information
  # db_os_password - provide the password for the openshift database
  db_password      : 
  # The amount of nodes that will be managed by the broker.
  # This value is ignored within an 'all_in_one' topology.
  node_count       : 1
  # Broker information required
  broker:
    hostname       : broker
    eth_device     : eth0
    ip             : 
    # Node(s) fqdn and ip address are required. A minimum of 1 node is required within
    # a 'multi' topology. To add more nodes to the broker, duplicate the entry below
    # adding to the numeric value. Remember to increase the node_count to match the 
    # amount of nodes managed by the broker.
  node1:
    hostname       : node1
    ip             : 

