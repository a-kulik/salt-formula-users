## Formula to configure users via pillar.

Creates a user, you can specify a home directory, a group of users, gid and uid.
Places public keys in the authorized_keys file. The privileged keys are copied to the user's home directory.
Сonfigures sudo access without a password, and absent users.

## available states:

users


## pillar example

user:

   username:
     home: /home/username
     sudo: true
     groups:
      - adm
     gid: 2323
     uid: 1111
     ssh_pub:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDH2Zm1JYlRq9svXkA4gr+RQtbAm4AZxBAC5tt+DXcpKLOVAUQQhl$
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDH2Zm1JYlRq9svXkA4gr+RQtbAm4AZxBAC5tt+DXcpKLOVAUQQhl$
     ssh_privat:
      - salt://tests/ubuntu.pub

   username2:
     home: /home/username2

user_absent:
  - username-del

## additional information

- If you want to use sudo without a password, you need to use the following value "sudo: true".
  If sudo will take a different value or is not defined, the sudoers file will not be created.

- Private keys are copied to /home/username/.ssh  and have a name, just like the source specified in the pillar file.

