user:

   canonical:
     home: /home/canonical
     sudo: true
     groups:
      - sudo
      - adm
     gid: 3323
     uid: 1311
     ssh_privat:
      - salt://tests/ubuntu.pem
     
user_absent:
  - redhat
