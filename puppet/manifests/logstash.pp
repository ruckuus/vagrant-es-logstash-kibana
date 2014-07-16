
class { 'logstash':
   package_url => 'https://download.elasticsearch.org/logstash/logstash/packages/debian/logstash_1.4.1-1-bd507eb_all.deb',
   require => Class['elasticsearch'],
}
