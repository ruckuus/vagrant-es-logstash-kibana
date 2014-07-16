import "common"
import "jdk"

class { 'elasticsearch':
  package_url => 'https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.7.deb',
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

