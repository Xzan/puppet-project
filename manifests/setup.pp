class project::setup(
						$domainname,
						$hostname = "localhost",
						$sitepath = "/var/www",
	){

	#To correct a bug in VBox in OSX Lion, put Google DNS Servers
	import "resolver"
	resolv_conf{"domain" :
		domainname => $domainname,
		searchpath => [$domainname],
		nameservers => ['8.8.8.8', '8.8.4.4'],
	}

	exec { 'apt-get update':
		command => 'sudo apt-get update',
	}

	$sysPackages = [ "build-essential"]
	package { $sysPackages:
		ensure => present
	}

	class{ "apache":
		hostname => $hostname,
		sitepath => $sitepath,
	}

	class{"php":}

	class{"mysql":}

	#Make sure that resolvconf is correctly set before any update
	Resolv_conf["domain"] -> Exec["apt-get update"] -> Package <| |>

}
