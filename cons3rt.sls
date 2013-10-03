{%# CONS3RT Pillar Values #%}
cons3rt:

  {%# Specific varaibles for otto initial configutation #%}
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
    
  {%# File information used for CONS3RT #%}
  files:
    java:
      jre-infrastructure:
        version:
        location:
      jdk-infrastructure:
        version:
        location:
      jre-suts:
        version:
    tomcat:
      tarball:
      jackrabbit:
  
  {%# CONS3RT infrastructure network information #%}
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

