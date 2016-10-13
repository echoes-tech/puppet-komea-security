# == Class: Komea Foundation::params
#
# This is a container class with default parameters for Komea Foundation classes.
class komea_security::params {

  $version                = "0.1"

  $cas_url                = "http://localhost:8080/cas"

  $nexus_url              = undef
  $nexus_repository       = "komea"
  $nexus_user             = undef
  $nexus_password         = undef
  $nexus_group_id         = "fr/echoes/ksf/security"

  $base_location          = "/opt/echoes/security"
  $logs_location          = "/var/log"

  $port                   = 8096
  $spring_boot_admin_url  = "http://localhost:8089"
  $max_heap_size          = "64m"
  $initial_heap_size      = "32m"

}
