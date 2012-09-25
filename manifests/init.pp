class project(
				$domainname,
				$host = 'www.project.dev',

				$dbname = 'socialnetwork',
				$dbuser = 'socialnetwork',
				$dbpass = 'socialnetwork_user',

				$sitepath = "/vagrant/src/www",
				$dbdumppath = "/vagrant/db_snapshot",

				$phpmyadmin = true,
	){

	class{"project::setup":
		domainname => $domainname,
		hostname => $host,
		sitepath => $sitepath,
	}

	class{"project::sql":
		dbname => $dbname,
		dbuser => $dbuser,
		dbpass => $dbpass,
		dbdumppath => $dbdumppath,
	}

	class{"project::web":
		phpmyadmin => $phpmyadmin,
	}

}
