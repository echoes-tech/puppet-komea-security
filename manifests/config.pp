# Private class
class komea_security::config (
  $port                   = $::komea_security::port,
  $cas_url                = $::komea_security::cas_url,
  $base_location          = $::komea_security::base_location,
  $logs_location          = $::komea_security::logs_location,
  $spring_boot_admin_url  = $::komea_security::spring_boot_admin_url
) inherits komea_security {

  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  $app_name = "application-security"
  $app_path = "$base_location/$app_name/"
  $app_logs_location = "$logs_location/$app_name/"

  file { "${app_path}application.properties":
    ensure  => file,
    content => template("${module_name}/application.properties.erb"),
  }

  file { "$app_logs_location":
    ensure  => 'directory',
    mode    => '0755'
  }

  file { "${app_path}logback.xml":
    ensure  => file,
    content => template("${module_name}/logback.xml.erb"),
    notify => Service['application-security']
  }

}
