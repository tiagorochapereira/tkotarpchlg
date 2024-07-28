# hellopuppet.pp

file { '/var/save/puppet_hello/hellopuppet.txt':
  content => "Hello Puppet\n"
}