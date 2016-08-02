# Private class
class komea_security::service inherits komea_security {

  if $caller_module_name != $module_name {
      fail("Use of private class ${name} by ${caller_module_name}")
  }

  service { 'application-security':
    ensure => running,
    start   => "/etc/init.d/application-security start",
    stop    => "/etc/init.d/application-security stop",
    status  => "/etc/init.d/application-security status",
  }

}
