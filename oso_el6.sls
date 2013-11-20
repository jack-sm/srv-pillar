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
    domain         : 
    subnet         :
    gateway        : 
    dns_servers:
      dns1         : 
      dns2         : 
  # MongoDB password
  # db_os_password - provide the password for the openshift database
  db_password      : 
  db_port          : 27017
  db_ssl           : false
  # ActiveMQ passwords
  # activemq_admin_pswd - provide a password for the activemq admin
  # activemq_mclct_pswd - provide a password for activemq mcollective user
  activemq_admin_pswd: tester
  activemq_mclct_pswd: mtester
  # The amount of nodes that will be managed by the broker.
  # This value is ignored within an 'all_in_one' topology.
  node_count       : 1
  # Broker information required
  broker:
    hostname       : 
    eth_device     : eth0
    ip             : 
    # auth_salt - generated with 'openssl rand -base64 64'
    auth_salt      : 
    # session_secret - generated with 'openssl rand -hex 64'
    session_secret : 
    # /etc/openshift/broker.conf
    valid_gear_sizes : small,medium,large
    default_max_gears: 100
    default_gear_caps: small
    default_gear_size: small
    usage_tracking_ds: true
    usage_tracking_al: false
    ssl_endpoint     : allow
    analytics        : true
    enable_maint_mode: false
    allow_ha_apps    : false
    router_hostname  : 
  console:
    security_type    : remote_user
    session_secret   : 
    # Node(s) fqdn and ip address are required. A minimum of 1 node is required within
    # a 'multi' topology. To add more nodes to the broker, duplicate the entry below
    # adding to the numeric value. Remember to increase the node_count to match the 
    # amount of nodes managed by the broker.
  node1:
    hostname       : 
    ip             : 


 
