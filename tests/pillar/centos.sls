user:

   redhat:
     home: /home/redhat
     sudo: true
     groups:
      - adm
     gid: 2323
     uid: 1111
     ssh_pub:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDH2Zm1JYlRq9svXkA4gr+RQtbAm4AZxBAC5tt+DXcpKLOVAUQQhlhqsV5gocURjIfHV8gmpN2gTt9V+s+xictV8umXM+NqTyQKosPDnxa9VnR/yqFLdEyDBUsN8qrlePEu0s7Ly+aZjeuRhEaNksuoU0YtmlPxMYCKKDnJHzTMd+mWyGaf2HaWmZPEyEVK/LW3S6svbkPriN43ybumQ7l/gN8Zpp0KLPaGl8USGdH8C4Mi6DKoAKAw9ACnGvCuuNqwk+KBlsZgRsBluBeL17aTvorNmNaBz9YMwZTJ6sk3i+8lq2L61UG2KWgYJZAP5xx+aHeVCgbyDNQ+dRa0mmjz root@helsik-kvm
     ssh_privat:
      - salt://tests/centos.pem
     
   
user_absent:
  - canonical
