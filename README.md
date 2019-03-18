Vagrant lamp on debian jessie64 (apache 2.4 (mod_php), mysql 5.5, php7.1, composer).
Before running Vagrant up, change sitename on vagrant/setup.sh and vagrant/provision/sitename.local.conf.
If you need it, also change mysql db name on vagrant/setup.sh and vagrant/db_backup.sh.
Database will be backed up on halt or destroy to bachup/database.sql.
