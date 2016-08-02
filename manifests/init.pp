class komea_security (
  $version                = $::komea_security::params::version,
  $cas_url                = $::komea_security::params::cas_url,
  $nexus_repository       = $::komea_security::params::nexus_repository,
  $nexus_url              = $::komea_security::params::nexus_url,
  $nexus_user             = $::komea_security::params::nexus_user,
  $nexus_password         = $::komea_security::params::nexus_password,
  $base_location          = $::komea_security::params::base_location,
  $logs_location          = $::komea_security::params::logs_location,
  $port                   = $::komea_security::params::port,
  $max_heap_size          = $::komea_security::params::max_heap_size,
  $initial_heap_size      = $::komea_security::params::initial_heap_size,
  $spring_boot_admin_url  = $::komea_security::params::spring_boot_admin_url
) inherits komea_security::params {

  anchor { "${module_name}::begin": } ->
  class { "${module_name}::install": } ->
  class { "${module_name}::config": } ~>
  class { "${module_name}::service": } ->
  anchor { "${module_name}::end": }

}
