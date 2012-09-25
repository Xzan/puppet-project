class project::web($db = true, $php = true, $phpmyadmin = true){

	if $db == true and $php == true and $phpmyadmin == true {
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
