class project(
				$domainname,
				$host = 'www.project.dev',

				$php = true,
				$db = true,
				$dbname = 'socialnetwork',
				$dbuser = 'socialnetwork',
				$dbpass = 'socialnetwork_user',
				$dbdumppath = "/vagrant/db_snapshot",

				$sitepath = "/var/www",

				$phpmyadmin = true,
	){

	class{"project::setup":
		domainname => $domainname,
		hostname => $host,
		sitepath => $sitepath,
		db => $db,
		php => $php,
	}

	if $db == true{
		class{"project::sql":
			dbname => $dbname,
			dbuser => $dbuser,
			dbpass => $dbpass,
			dbdumppath => $dbdumppath,
		}
	}

	class{"project::web":
		db => $db,
		php => $php,
		phpmyadmin => $phpmyadmin,
	}

}
