# CONS3RT Pillar Values #
#########################
cons3rt:

  # Specific variables for otto initial configuration #
  #####################################################
  otto:
    instance-name:
    instance-location:
    instance-cloud:
    instance-virtualization-service:
    instance-ui-url:
    admin-pass:
    default-project:
    apps-root-directory:
    email:
    email-host:
    email-tls: false
    email-user:
    jcr-id:
    jcr-cert:
    messaging-type:
    messaging-encrypted:
    messaging-user:
    messaging-password:
    messaging-port:
    ui-auth-type:
    ui-rest-port:
    ui-cert: /etc/pki/tls/certs/www/server_nopass.pem
    ui-cert-key:
    
  # File information used for CONS3RT #
  #####################################
  files:

    #Java#
    ######
    jre-version      : 7-linux-x64
    jre-location     : java/files/jre-7-linux-x64.tar.gz
    jdk-version      : 7u40
    jdk-location     : java/files/jdk-7u40-linux-x64.tar.gz
    jre-suts-version : 

    tomcat-tarball:
    jackrabbit-tarball:
  
  # CONS3RT infrastructure network information #
  ##############################################
  infrastructure:
    salt-master:
      ip:
      hostname:
      fqdn:
    core-host:
      ip:
      hostname:
      fqdn:
    database-host:
      ip:
      hostname:
      fqdn:
    messaging-host:
      ip:
      hostname:
      fqdn:
    asset-db-host:
      ip:
      hostname:
      fqdn:
    testmanager-host:
      ip:
      hostname:
      fqdn:
    ui-host:
      ip:
      hostname:
      fqdn:

  # User and Group details #
  #########################
  uid: 500
  gid: 500

  # QPID #
  ########
  qpid:
    port:
