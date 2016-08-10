#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with Komea Security](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with Komea Security](#beginning-with-komea-security)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)
7. [Contributors](#contributors)

## Overview

Puppet module to manage Komea Security installation and configuration.

## Module Description

This module installs and configures [Komea Security](https://echoes.fr/ksf/).

## Setup

### Setup Requirements

* **java** 1.7 or higher
* package **curl**
* package **zip/unzip**

Supports Puppet v3 (optionally with future parser) and v4 with Ruby versions 1.8.7 (Puppet v3 only), 1.9.3, 2.0.0 and 2.1.0.

### Beginning with Komea Security

```puppet
include ::komea_security
```

## Reference

### Classes

#### Public classes

* komea_security: Main class, includes all other classes.

#### Private classes

* komea_security::params: Sets parameter defaults per operating system.
* komea_security::install: Handles the packages.
* komea_security::config: Handles the configuration file.
* komea_security::service: Handles the services.

#### Parameters

The following parameters are available in the `::komea_security` class:

##### `version`

Specifies the Komea Security's version that will be installed. Valid options: string. Default value: '0.1'.

##### `cas_url`

Specifies the url of the CAS authentication service that will be used to handle authentication. Valid options: string. Default value: 'http://localhost:8080/cas'.

##### `port`

Specifies the running port of Komea Security. Valid options: integer. Default value: 8096.

##### `spring_boot_admin_url`

Specifies the url of the Spring Boot Admin Server that will manage Komea Security's instance. Valid options: string. Default value: 'http://localhost:8089'.

##### `max_heap_size`

Specifies the maximum heap size that can be allocated to the Komea Security's instance. Valid options: string. Default value: '64m'.

##### `initial_heap_size`

Specifies the initial heap size that will be allocated to the Komea Security's instance. Valid options: string. Default value: '32m'.

##### `nexus_url`

Specifies the url of the Nexus server that will be used to retrieve Komea Security's artifacts. Valid options: string. Default value: _undef_.

##### `nexus_repository`

Specifies the name of the Nexus repository that contains Komea Security's artifacts. Valid options: string. Default value: 'komea'.

##### `nexus_user`

Specifies the username of a valid Nexus user with the necessary privileges to download all required artifacts. Valid options: string. Default value: _undef_.

##### `nexus_password`

Specifies the password of the Nexus user that will be used to download the required artifacts. Valid options: string. Default value: _undef_.

##### `base_location`

Specifies the path of the directory where Komea Security components will be installed (the directory will be automatically created if it does not exist). Valid options: string. Default value: '/opt/echoes/security'.

##### `logs_location`

Specifies the path of the directory that will contains all output logs of Komea Security. Valid options: string. Default value: '/var/log'.

## Limitations

Debian family OSes are officially supported. Tested and built on Debian.

## Development

[Echoes Technologies](https://echoes.fr) modules on the Puppet Forge are open projects, and community contributions are essential for keeping them great.

## Contributors

The list of contributors can be found at: https://github.com/echoes-tech/puppet-komea-security/graphs/contributors
