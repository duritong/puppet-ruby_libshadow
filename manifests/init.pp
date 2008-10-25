# manifests/init.pp

# Manages the installation of the shadow
# library for ruby

class ruby-libshadow {
   case $operatingsystem {
        centos,redhat,fedora: { include ruby-libshadow::centos }
        debian,ubuntu: { include ruby-libshadow::debian }
        openbsd: { include ruby-libshadow::openbsd }
        default: { fail("there isn't yet any possiblity to manage passwords on ${operatingsystem}, please address this in your needs.") }
    } 
}

class ruby-libshadow::base {
    package{'ruby-libshadow':
        ensure => installed,
    }
}

class ruby-libshadow::centos inherits ruby-libshadow::base {
    Package['ruby-libshadow']{
        name => 'ruby-shadow',
    }
}

class ruby-libshadow::debian inherits ruby-libshadow::base {
    Package['ruby-libshadow']{
        name => 'libshadow-ruby1.8',
    }
}

