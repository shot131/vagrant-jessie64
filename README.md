Vagrant LAMP on Debian Jessie64 (apache 2.4 (mod_php), mysql 5.5, php7.1, composer).

Before running vagrant up, change env_vars in Vagrant file.

On halt or destroy database will be backed up to /backup dir.

Apache logs will be stored to /log dir.

Don\`t forget to add ip and site url to your local hosts file or it\`s not be visible from the browser.
