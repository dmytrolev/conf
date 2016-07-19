git:
  pkg.installed:
    - pkgs:
      - git
  file.managed:
    - name: /home/{{ salt['grains.get']('conf.user', salt['pillar.get']('conf.user')) }}/.gitconfig
    - source: salt://conf/files/gitconfig
    - mode: '0755'
