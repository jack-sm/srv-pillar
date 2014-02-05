# CONS3RT System Configuration Manangement Data
# ---------------------------------------------
################################################################################
#
# All values needed for an installation and configuration management of a
# cons3rt deployment will be entered here. This pillar file can be copied
# and renamed to accomadate multiple deployments.
#
##############################################################################

# CONS3RT Infrastructure
# ----------------------
cons3rt-infrastructure:
  domain              : 
  infrastructure_type : aws
  enable_selinux      : False
  manage_dns          : False
  dnsservers :
    - 8.8.8.8
    - 8.8.4.4
  search_domain       : 
  manage_ntp          : False
  ntpservers :
    - 0.north-america.pool.ntp.org
    - 1.north-america.pool.ntp.org
    - 2.north-america.pool.ntp.org
    - 3.north-america.pool.ntp.org
  manage_network      : False
  gateway             : 
  subnet              : 
  hosts:
    infrastructure:
      fqdn  : 
      ip    : 
    cons3rt:
      fqdn  : 
      ip    : 
    database:
      fqdn  : 
      ip    : 
    messaging:
      fqdn  : 
      ip    : 
    assetrepository:
      fqdn  : 
      ip    : 
    webinterface:
      fqdn  : 
      ip    : 
    sourcebuilder:
      fqdn  : 
      ip    : 
    testmanager:
      fqdn  : 
      ip    : 
    retina:
      fqdn  : 
      ip    : 

# CONS3RT Packages
# ----------------
# This sections describes all packages utilized by the cons3rt
# infrastructure. All packages must be hosted on the salt-master
# within /srv/salt/cons3rt/packages. TODO: Be able to handle other file
# server backends
cons3rt-packages:
  application_path : /opt
  cons3rt:
    package        : cons3rt-package-4.4.1.zip
    version        : '4.4.1'
  tomcat:
    package        : apache-tomcat-7.0.50.tar.gz
    version        : '7.0.50'
  jackrabbit:
    package        : jackrabbit-webapp-2.6.5.war
    version        : '2.6.5'
  commons_daemon:
    version        : '1.0.15'
  qpid:
    package        : qpidd-0.20-rhel6-x64.gz
    version        : '0.20'
  java_jre:
    package        : jre-7u51-linux-x64.gz
    version        : '1.7.0_51'
  java_jdk:
    package        : jdk-7u51-linux-x64.gz
    version        : '1.7.0_51'
  jcr:
    package        : jcr-2.0.jar
    version        : '2.0'

# CONS3RT-System-Users
# --------------------
# This section describes the users create for the CONS3RT infrastructure.
# You change the default uids and gids if they conflict with exisiting
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
# CONS3RT
# -------
#
cons3rt:
  database_root_password         :
  cons3rt_database_user          : cons3rt
  cons3rt_database_password      : "*0F94843F4DF86103058DA661787FB89CF7E6DC76"
  enable_selinux                 : false
  # infrastructure_network - enter the CIDR value of the infrastructure network
  infrastructure_network         : 
  # suts_network - enter the CIDR value(s) of the networks that the SUTs are connected
  #                you may add more then one network
  #                eg: suts_network
  #                      - 10.0.0.0/24
  #                      - 10.0.1.0/24
  suts_network:
    - 
  qpid_use_sasl_auth             : false
  qpid_use_ssl_encryption        : false
  qpid_sasl_password             : changeme
  qpid_sasldb_path               : /var/lib/qpidd/qpidd.sasldb
  # qpid_messaging_port - for encryption, please use 4443 - unecrypted, please use 5672
  qpid_messaging_port            : 5672
  mysql_communication_port       : 3306
  guacamole_installed_with_ui    : true
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
  php_timezone                   : America/New_York
  # enable_maint_mode - false = webinterface functions as normal
  #                   - true  = webinterface displays notification to user that system
  #                             is in maint mode
  enable_maint_mode              : false
  # enable_dod_banner - false = the notice and consent banner will not be displayed to users
  #                   - true  = the notice and consent banner will be displayed to users
  enable_dod_banner              : true
  apache_ca_cert_path            : /etc/pki/tls/certs/dod-root-certs.pem
  apache_cert_path               : /etc/pki/tls/certs/localhost.crt
  apache_cert_key_path           : /etc/pki/tls/private/localhost.key
  apache_ca_revocation_path      : /etc/cons3rt_sso/crls
  # assetrepository_admin_user - admin = default setting
  assetrepository_admin_user     : admin
  assetrepositoty_admin_password : admin
  assetrepository_jks_password   : changeme

