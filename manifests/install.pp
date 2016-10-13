# Private class
class komea_security::install (
  $version                = $::komea_security::version,
  $nexus_url              = $::komea_security::nexus_url,
  $nexus_repository       = $::komea_security::nexus_repository,
  $nexus_user             = $::komea_security::nexus_user,
  $nexus_password         = $::komea_security::nexus_password,
  $nexus_group_id         = $::komea_security::nexus_group_id,
  $base_location          = $::komea_security::base_location,
  $max_heap_size          = $::komea_security::max_heap_size,
  $initial_heap_size      = $::komea_security::initial_heap_size
)inherits komea_security {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  file { [ "$base_location" ]:
    ensure  => 'directory',
    mode    => '0755'
  }

  $app_name = "application-security"
  $app_path = "$base_location/$app_name/"

  file { "$app_path":
    ensure  => 'directory',
    mode    => '0755'
  }

  file { "/etc/init.d/$app_name":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template("${module_name}/application.sh.erb")
  }

  file { "${base_location}/nexus_deploy_security.sh":
    ensure  => "present",
    owner   => "root",
    group   => 'root',
    mode    => '0770',
    content => template("${module_name}/nexus_deploy_security.sh.erb")
  }

  exec { "deploy-nexus-security":
    path    => ['/usr/bin', '/usr/sbin', '/bin'],
    command => "${base_location}/nexus_deploy_security.sh ${nexus_user} ${nexus_password}",
    timeout => 0
  }

}
