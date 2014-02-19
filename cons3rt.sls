# CONS3RT System Configuration Manangement Data
# ---------------------------------------------
##########################################################################
#
# All values needed for an installation and configuration management of a
# cons3rt deployment will be entered here. This pillar file can be copied
# and renamed to accomadate multiple deployments.
#
##########################################################################

# CONS3RT Infrastructure
# ----------------------
cons3rt-infrastructure: 
  # domain - Define the domain that the cons3rt infrastructure will reside within
  domain:
  # infrastructure_type - Used to define the infrastructure type that cons3rt will
  #                       be deployed within.
  #                       Valid values = aws, openstack, kvm, vmware
  infrastructure_type: aws
  # deployment_type - Used to determine if cons3rt deployment will be completed using
  #                   otto installer or saltstack
  #                   Valid values = otto, saltstack
  deployment_type: otto
  # enable_selinux - Choose to enable selinux or disable it.
  #                  Valid options - true or false
  enable_selinux: False
  # ntpservers - define a list of ntp servers that the cons3rt infrastructure vm's will
  #              use
  ntpservers :
    - 0.north-america.pool.ntp.org
    - 1.north-america.pool.ntp.org
    - 2.north-america.pool.ntp.org
    - 3.north-america.pool.ntp.org
  
  # CONS3RT Network Information 
  # ---------------------------
  ##########################################################################
  #
  # The following values must be populated when infrastructure_type is set 
  # to kvm or vmware which are considered to be managed infrastructures.
  #
  ##########################################################################
  dnsservers:
    - 8.8.8.8
    - 8.8.4.4
  search_domain:
  gateway: 
  netmask: 
  
  # CONS3RT Infrastructure Hosts
  # ----------------------------
  ##########################################################################
  #
  # Define all the fqdns and ip addresses for the cons3rt infrastructure hosts.
  # You may define the same fdqn and ip for multiple roles except the following
  # rules:
  #   - The assetrepository cannot be on the same host as the webinterface.
  #   - The retina server must be defined on a windows host alone.
  #
  ##########################################################################
  hosts:
    administration:
      fqdn:
      ip:
    cons3rt:
      fqdn: 
      ip: 
    database:
      fqdn: 
      ip: 
    messaging:
      fqdn: 
      ip: 
    assetrepository:
      fqdn: 
      ip: 
    webinterface:
      fqdn: 
      ip:
    remoteaccessgateway:
      fqdn:
      ip:
    sourcebuilder:
      fqdn: 
      ip: 
    testmanager:
      fqdn: 
      ip: 
    retina:
      fqdn: 
      ip: 

# CONS3RT Packages
# ----------------
# This section describes all packages utilized by the cons3rt
# infrastructure. All packages must be hosted on the salt master
# within /srv/salt/cons3rt/packages. TODO: Be able to handle other file
# server backends
cons3rt-packages:
  # application_path - default path that all applications used by cons3rt will
  #                    be installed within.
  application_path: /opt
  # baseline_packages - a list of extra packages that will be installed on 
  #                     all cons3rt infrastructure linux based machines
  baseline_packages:
    - vim-enhanced
    - zip
    - unzip
    - patch
    - bind-utils
    - openssh-clients
    - python-augeas
    - pyOpenSSL
  # The following packages are required to be defined
  cons3rt:
    package: cons3rt-package-4.4.1.zip
    version: '4.4.2'
  tomcat:
    package: apache-tomcat-7.0.50.tar.gz
    version: '7.0.50'
  jackrabbit:
    package: jackrabbit-webapp-2.6.5.war
    version: '2.6.5'
  commons_daemon:
    version: '1.0.15'
  qpid:
    package: qpidd-0.20-rhel6-x64.gz
    version: '0.20'
  java_jre:
    package: jre-7u51-linux-x64.gz
    version: '1.7.0_51'
  java_jdk:
    package: jdk-7u51-linux-x64.gz
    version: '1.7.0_51'
  jcr:
    package: jcr-2.0.jar
    version: '2.0'

# CONS3RT-System-Users
# --------------------
# This section describes the users that will be created for the CONS3RT infrastructure.
# You can change the default uids and gids if they conflict with exisiting
# values.
cons3rt-system-users:
  cons3rt:
    uid            : 500
    gid            : 500
  jpmsg:
    uid            : 501
    gid            : 501
  tomcat:
    uid            : 502
    gid            : 502
  minimum_uid_gid  : 510
  ec2-user_gid     : 505

# CONS3RT-Administrators
# ----------------------
# This section is for the addition of admin users to all cons3rt infrastructure
# machines.
cons3rt-administrators:
  cons3rt_admin_group : cons3rt-administrators
  cons3rt_admin_gid   : 510
  # administrators - The format below uses the administrators user name as a key with
  #                  ssh-key as an attribute. When pasting the ssh public key, use single 
  #                  quotes to encase it. Use the following example:
  #                  joesmith:
  #                    ssh_key : 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEApZmDfjSje4CrbEcin9gUCBm2NMn4G7cAV2pgg008tsFIf90WcVPRZw1GpOwk6+0jrJwF5S9Jp4Tkc7rJ4mPiI7P8OnereOFc/lm3qhTt1Bt52Rqtz8B611Fs6QJ+L1T4DHzOulrncDFufy6QLgRGA3Cnt2Cm0CR3Eg+Xt0DLHptYA0O2Rlkjpu2p6q8CxzS2zzqHBI16CIW4VlEUTwF4mganZwwPZdyZBXyf6x4yLDgts3P/3kkw4FJEPmmB+qcNDVuUyqO9ru8tiY9EEuDayR+4ekjMi/yFOpxQRyF8MKB946dhSUQ9nEEZb9V3ZfvxvuXM4kck/Stez+z/39ygDQ== joesmith@saltmaster.example.com'
  administrators:
    someuser:
      ssh_key: ''

# CONS3RT
# -------
# This section outlines all the underlining details specifically pertaining to cons3rt
cons3rt:
  # cons3rt_path - The path that cons3rt will be installed within.
  #                     Defaults to /cons3rt if not defined.
  cons3rt_path: /cons3rt

  # Database
  # --------
  # database_root_password - The mysql database password that is used my saltstack to
  #                          manage the mysql database. Leave this blank if using the
  #                          otto cons3rt installer. Make sure to enclose the hash within
  #                          quotes as for yaml parsing.
  #                          
  #                          example:
  #                          mysql -e "select password('mypassword')"
  #                          output:
  #                          +-------------------------------------------+
  #                          | password('mypassword')                    |
  #                          +-------------------------------------------+
  #                          | *FABE5482D5AADF36D028AC443D117BE1180B9725 |
  #                          +-------------------------------------------+
  #                        
  database_root_password:
  # cons3rt_database_user - The database user that cons3rt will use to interact with
  #                         the mysql database.
  cons3rt_database_user: cons3rt
  # cons3rt_database_password - Must be the mysql hashed password - reference the example
  #                             above
  cons3rt_database_password: "*0F94843F4DF86103058DA661787FB89CF7E6DC76"
  mysql_communication_port: 3306

  # Samba/NFS
  # ---------
  # suts_network - Enter the CIDR value(s) of the networks that the SUTs are connected
  #                you may add more then one network.
  #                eg: suts_network:
  #                      - 10.0.0.0/24
  #                      - 10.0.1.0/24
  suts_network:
    -

  # Messaging
  # ---------
  # ca_certificate - The name of the ca certificate that will be used by apache and also
  #                  in the creation of java keystores for all of the cons3rt infrastructure.
  #                  In order to simplify the process, all certificates should be combined
  #                  into one x509 encoded pem file. Place this file in the file server directory:
  #                  cons3rt/tls
  ca_certificate_filename:
  # ca_nickname - The nickname that will be used as an alias for the ca certificate designated above
  ca_certificate_alias: 
  # qpid_use_sasl_auth - Use sasl auth with qpid. Highly recommended to use with SSL encryption
  #                      enabled.
  qpid_use_sasl_auth: false
  qpid_sasl_password: changeme
  qpid_sasldb: /var/lib/qpidd/qpidd.sasldb
  qpid_use_ssl_encryption: false
  qpid_ssldb: /var/lib/qpidd/keys/server_db
  qpid_ssldb_password: changeme
  # qpid_ssl_cert_password - The paraphrase that will be used to create the messaging pkcs12 
  qpid_ssl_cert_password:
  # qpid_messaging_port - for SSL encryption, use 4443 - unencrypted, use 5672
  qpid_messaging_port: 5672
  
  # Webinterface
  # ------------
  # Valid options for php_timezone in North America:
  #
  # Eastern ...........          America/New_York
  # Central ...........          America/Chicago
  # Mountain ..........          America/Denver
  # Mountain no DST ...          America/Phoenix
  # Pacific ...........          America/Los_Angeles
  # Alaska ............          America/Anchorage
  # Hawaii ............          America/Adak
  # Hawaii no DST .....          Pacific/Honolulu
  php_timezone: America/New_York
  # enable_maint_mode - false = webinterface functions as normal
  #                   - true  = webinterface displays notification to user that system
  #                             is in maint mode
  enable_maint_mode: false
  # enable_dod_banner - false = the notice and consent banner will not be displayed to users
  #                   - true  = the notice and consent banner will be displayed to users
  enable_dod_banner: true
  apache_ca_cert_path: /etc/pki/tls/certs/dod-root-certs.pem
  apache_cert_path: /etc/pki/tls/certs/localhost.crt
  apache_cert_key_path: /etc/pki/tls/private/localhost.key
  apache_ca_revocation_path: /etc/cons3rt_sso/crls
  webinterface_jks_path: /home/tomcat/webinterface.jks
  webinterface_jks_password: changeme

  # Assetrepository
  # ---------------
  # assetrepository_admin_user - This value pertains to the tomcat user manager. 
  #                              admin = default setting.
  assetrepository_admin_user: admin
  # assetrepositoty_admin_password - This value pertains to the tomcat user manager.
  #                              admin = default setting.
  assetrepository_admin_password: admin
  assetrepository_jks_path: /home/tomcat/assetrepo.jks 
  assetrepository_jks_password: changeme

  # Remoteaccessgateway
  # -------------------
  remoteaccessgateway_jks_path: /home/tomcat/remoteaccessgateway.jks
  remoteaccessgateway_jks_password: changeme
