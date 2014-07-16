class common {
  exec { 'apt-get-update':
    command => "/usr/bin/apt-get update -f",
    creates => "/tmp/updated"
  }
}
