git:
  pkg.installed:
    - pkgs:
      - git
  file.managed:
    - name: {{ salt['grains.get']('conf:user-home', salt['pillar.get']('conf:user-home')) }}/.gitconfig
    - source: salt://conf/files/gitconfig
    - mode: '0755'
