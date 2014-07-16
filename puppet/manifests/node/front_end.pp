import "../common"

class { 'common':
  stage => prepare
}

package { ['openjdk-7-jdk', 'openjdk-7-jre', 'openjdk-7-jre-headless']:
  ensure => latest,
}

package { ['curl', 'vim']: ensure => latest }

class { 'logstash':
   package_url => 'https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash_1.4.1-1-bd507eb_all.deb',
   require => Package['openjdk-7-jre-headless']
}

logstash::configfile { 'input_nginx':
  content => template('logstash/logstash_input_nginx.erb')
}
