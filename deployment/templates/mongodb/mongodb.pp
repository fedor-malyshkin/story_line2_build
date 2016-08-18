file { '/data':
ensure => "directory",
recurse => "true";
}
file { '/data/db':
ensure => "directory",
recurse => "true";
}
file { '/data/logs':
ensure => "directory",
recurse => "true";
}
