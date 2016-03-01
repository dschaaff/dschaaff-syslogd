# syslogd

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with syslogd](#setup)
    * [What syslogd affects](#what-syslogd-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with syslogd](#beginning-with-syslogd)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Manages the syslogd config on OSX. The initial motivation behind writing this was to manage remote syslog destinations on OS X.

## Module Description

Currently allows us to add a remote destination to syslogd. This can be used to send the logs to logstash, splunk, or any other syslog server.

## Setup

### What syslogd affects

* /etc/syslog.conf
* syslog service (/System/Library/LaunchDaemons/com.apple.syslogd.plist)


### Setup Requirements 

This module depends on the following modules
* puppetlabs/concat
* puppetlabs/stdlib


### Beginning with syslogd

## Usage

Use the remote defined type to define a remote log destination.

```
syslogd::remote {
  'log_server':
    facility    => '*',
    priority    => '*',
    destination => '192.168.1.16',
    port        => '514',
}
```

## Reference


### Classes
* `syslogd`: This class should not be called directly, you should simply use the remote defined type.

### Defined Types

#### syslogd::remote

##### Parameters
* `facility`: *Required* syslog facility
* `priority`: *Required* syslog priority
* `destination`: *Required* Remote host to send syslog to
* `port`: *Required* Port remote host is listening on


## Limitations

This has only been tested on Yosemite and El Capitan.

## Development

Please submit a pull request for any proposed changes. All contributions are greatly appreciated!


