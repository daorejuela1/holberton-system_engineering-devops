# This manifesto will append a line if not exist to the ssh config file
file_line { 'Turn off passwd auth':
ensure => 'created',
path   => '~/.ssh/holberton',
line   => 'PasswordAuthentication no',
}

file_line { 'Declare identity file':
ensure => 'created',
path   => '~/.ssh/holberton',
line   => 'IdentityFile ~/.ssh/holberton',
}
