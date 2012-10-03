class project::sql(
					$dbuser = "puppet",
					$dbpass = "puppet_user",
					$dbname = "puppet",
					$dbdumppath = "/vagrant/db_snapshot",
					$dbrootpass = 'vagrant',
	) {

	class { "mysql::create":
		dbuser => $dbuser,
		dbpass => $dbpass,
		dbname => $dbname,
		dbrootpass => $dbrootpass,
	}

	class {"mysql::dump":
		dbuser => $dbuser,
		dbpass => $dbpass,
		dbname => $dbname,
		dbdumppath => $dbdumppath,
	}
}
