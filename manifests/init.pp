# == Class: syslogd
#
# this class should not be called directly, you should be using the defined type syslogd::remote
#
# 
# === Authors
#
# Daniel Schaaff <daniel@danielschaaff.com>
#
# === Copyright
#
# Copyright 2015 Daniel Schaaff, unless otherwise noted.
#
class syslogd {
  if! ($::osfamily == 'Darwin'){
    fail ('syslogd only suppoorts mac osx')
  }

  @concat {'/etc/syslog.conf':
    owner   => 'root',
    group   => 'wheel',
    mode    => '0644',
    }
}
