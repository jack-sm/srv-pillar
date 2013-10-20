# Pillar values for Openshift Origin EL6 #
#========================================#
oso_el6:

  # Define if the build will consist of 'nightly' or 'stable' packages.
  # If not defined, defaults to 'stable'.
  buildtype: stable
  # DNSSEC and RNDC keyfile names. DO NOT POPULATE!
  # These file names will be automatically populated by the salt-master.
  bind_keys:
    dnssec_private_key:
    dnssec_public_key :
  # DNS servers
  # Enter the external dns servers that the broker and nodes will use
  dns_servers:
    dns1: 8.8.8.8
    dns2: 8.8.4.4
  # Define the infrastructure topology.
  # Accepted values are 'all_in_one' or 'multi'
  # Defaults to 'multi'
  infrastructure:  
    topology      : multi
    # The amount of nodes that will be managed by the broker.
    # This value is ignored within an 'all_in_one' topology.
    node_count    : 1
    # Broker fqdn and ip address are required
    broker:
      fqdn:
      ip  :
    # Node(s) fqdn and ip address are required. A minimum of 1 node is required within
    # a 'multi' topology. To add more nodes to the broker, duplicate the entry below
    # adding to the numeric value. Remember to increase the node_count to match the 
    # amount of nodes managed by the broker.
    node1:
      fqdn:
      ip  :



