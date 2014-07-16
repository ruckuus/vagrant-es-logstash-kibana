import "../common"

class { 'common':
  stage => prepare
}

package { ['openjdk-7-jdk', 'openjdk-7-jre', 'openjdk-7-jre-headless']:
  ensure => latest,
}

package { ['curl', 'vim']: ensure => latest }

class { 'elasticsearch':
  package_url => 'https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.2.2.deb',
  config => {
    'node' => {
      'name' => 'es01'
    },
    'index'=> {
      'number_of_replicas' => '2',
      'number_of_shards'   => '5'
     },
     'network' => {
       'host' => "0.0.0.0"
     }
   },
  require => Package['openjdk-7-jre-headless'],
}

