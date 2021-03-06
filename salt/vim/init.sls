vim:
  pkg:
    - installed
    - name: {{ pillar['pkgs']['vim'] }}

{% if grains['os'] == 'Debian' %}
vim-scripts:
  pkg:
    - installed
{% endif %}

{% if grains['os'] == 'Suse' %}
vim-data:
  pkg:
    - installed
{% endif %}

/etc/vim:
  file.directory:
    - require:
      - pkg: vim

/etc/vim/vimrc.local:
  file.managed:
    - source: salt://vim/vimrc.local
    - user: root
    - group: root
    - mode: '0644'
    - require:
      - file: /etc/vim
