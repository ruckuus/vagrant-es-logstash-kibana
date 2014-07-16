exec { 'apt-get-update':
  command => "apt-get update",
  path => ["/usr/bin", "/bin", "/usr/sbin"],
  creates => "/tmp/updated",
  stage => preinstall

}

package { ['curl', 'vim-tiny']:
  ensure => present,
}
