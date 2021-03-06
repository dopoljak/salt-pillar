openssh-server:
  pkg:
    - installed
    - name: {{ pillar['pkgs']['openssh-server'] }}

ssh:
  service:
    - name: {{ pillar['svcs']['ssh'] }}
    - running
    - enable: True
    - watch:
      - pkg: openssh-server
    - require:
      - pkg: openssh-server

/root/.ssh:
  file.directory:
    - user: root
    - group: root
    - mode: 700
    - makedirs: True
