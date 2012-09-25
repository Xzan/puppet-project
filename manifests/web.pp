class project::web($phpmyadmin = true){

	if $phpmyadmin == true {
		package { "phpmyadmin":
			ensure => installed,
		}

		exec{ "link phpmyadmin config":
			command => "ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf.d/phpmyadmin.conf",
			unless => "/bin/readlink -e /etc/apache2/conf.d/phpmyadmin.conf",
			require => Package["phpmyadmin"],
			notify => Service["apache2"],
		}
	}
}
