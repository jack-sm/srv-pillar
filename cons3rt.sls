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
      hostname  : 
      ip        : 
    cons3rt:
      hostname  : 
      ip        : 
    database:
      hostname  : 
      ip        : 
    messaging:
      hostname  : 
      ip        : 
    assetrepository:
      hostname  : 
      ip        : 
    webinterface:
      hostname  : 
      ip        : 
    sourcebuilder:
      hostname  : 
      ip        : 
    testmanager:
      hostname  : 
      ip        : 
    retina:
      hostname  : 
      ip        : 

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
    uid    : 500
    gid    : 500
  jpmsg:
    uid    : 501
    gid    : 501
  tomcat:
    uid    : 502
    gid    : 502
  uid_min  : 510
  gid_min  : 510

# CONS3RT
# -------
#
cons3rt:
  database_root_password   :
  cons3rt_database_user    : cons3rt
  cons3rt_database_password: 
  infrastructure_network   : 
  suts_network             :
    - 10.10.5.0/24
    - 10.10.6.0/24
  qpid_use_sasl_auth       : False
  qpid_use_ssl_encrytion   : False
  qpid_sasl_password       :
  qpid_sasldb_path         :
  qpid_messaging_port      : 4443
  mysql_communication_port : 3306

