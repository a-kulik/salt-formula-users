{% from "users/map.jinja" import users with context %}
{% for username, details in pillar.get('user', {}).items() %}
{{ username }}:
   {% if 'gid' in details %}
   group:
    - present
    - name: {{ username }}
    - gid: {{ details.get('gid', '') }}
   {% endif %}
   user:
    - present
    - home: {{ details.get('home', '') }}
    - name: {{ username }}
    - uid: {{ details.get('uid', '') }}
    {% if 'gid' in details %}
    - gid: {{ details.get('gid', '') }}
    {% endif %}
    {% if 'groups' in details %}
    - groups:
      {% for group in details.get('groups', []) %}
      - {{ group }}
      {% endfor %}
    {% endif %}
   {% if 'ssh_pub' in details %}
   ssh_auth:
     - present
     - user: {{ username }}
     - names:
      {% for pubkey_file in details.get('ssh_pub', []) %}
       - {{ pubkey_file }}
      {% endfor %}
   {% endif %}
{% if 'ssh_privat' in details %}
/home/{{ username }}/.ssh:
      file.directory:
       - user: {{ username }}
       - group: {{ username }}
       - dir_mode: 700
{% for privat_file in details.get('ssh_privat', []) %}
{% set key_name = privat_file.split('/') %}
{{ key_name[-1] }}:
      file.managed:
       - name: /home/{{ username }}/.ssh/{{ key_name[-1] }}
       - source: {{ privat_file }}
{% endfor %}
{% endif %}
{% if details.get('sudo', false) %}
sudo_pkg:
 pkg:
   - installed
   - name: {{ users.sudo_package }}
/etc/sudoers.d/{{ username }}:
   file.managed:
      - source: salt://tests/temp/sudoers.d.jinja2
      - template: jinja
      - context:
          user_name: {{ username }}
      - require:
          - pkg: {{ users.sudo_package }}
{% endif %}
{% endfor %}
{% for username_del in pillar.get('user_absent', []) %}
{{ username_del }}:
 user:
  - absent
  - name: {{ username_del }}
  - force: true
{% endfor %}
