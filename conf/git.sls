git:
  pkg.installed:
    - pkgs:
      - git
  file.managed:
    - name: {{ salt['grains.get']('conf:userhome', salt['pillar.get']('conf:userhome')) }}/.gitconfig
    - source: salt://conf/files/gitconfig
    - mode: '0755'
