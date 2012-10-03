class project(
				$domainname = "$domain",
				$host = 'www.project.dev',

				$php = true,
				$db = true,
				$dbname = 'puppet',
				$dbuser = 'puppet',
				$dbpass = 'puppet_user',
				$dbrootpass = 'vagrant',
				$dbdumppath = "/vagrant/db_snapshot",

				$sitepath = "/var/www",

				$phpmyadmin = true,
				
				$tools = true,
				
	){

	class{"project::setup":
		domainname => $domainname,
		hostname => $host,
		sitepath => $sitepath,
		db => $db,
		php => $php,
		tools => $tools,
		dbrootpass => $dbrootpass,
	}

	if $db == true{
		class{"project::sql":
			dbname => $dbname,
			dbuser => $dbuser,
			dbpass => $dbpass,
			dbdumppath => $dbdumppath,
			dbrootpass => $dbrootpass,
		}
	}

	class{"project::web":
		db => $db,
		php => $php,
		phpmyadmin => $phpmyadmin,
	}

}
