class admintools {
  anchor { 'admintools::begin': } ->
  class { 'admintools::install': } ->
  anchor { 'admintools::end': }

  Anchor['admintools::begin'] ~> Class['admintools::']
}
