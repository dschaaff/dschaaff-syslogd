# defined type to create a remote syslog destination in /etc/syslogd.conf
#
# =================
# example
# =================
# syslogd::remote {
#   'logger':
#     facility    => '*',
#     priority    => '*',
#     destination => '192.168.96.16',
#     port        => '514',
# }
define syslogd::remote (
  $destination,
  $port,
  $facility    = '*',
  $priority    = '*',
  ){
  include syslogd
  realize Concat['/etc/syslog.conf']

  concat::fragment {"syslogd::remote ${facility}${priority}${destination}${port}":
    ensure  => 'present',
    target  => '/etc/syslog.conf',
    content => "${facility}.${priority}							@${destination}:${port}\n",
    }

  exec {'restart syslog':
    subscribe   => Concat['/etc/syslog.conf'],
    refreshonly => true,
    command     => '/bin/launchctl unload /System/Library/LaunchDaemons/com.apple.syslogd.plist && /bin/launchctl load /System/Library/LaunchDaemons/com.apple.syslogd.plist',
  }
}