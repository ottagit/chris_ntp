# Manage NTP

# Class:: chris_ntp

class chris_ntp {
  ensure_packages(['ntp'])

  file {
    "/etc/ntp.conf":
      ensure  => 'file',
      source  => 'puppet:///modules/chris-ntp/ntp.conf',
      notify  => Service['ntp'],
      require => Package['ntp'],
  }

  service {
    "ntp":
      ensure   => 'running',
      enable   => 'true',
  }
}
