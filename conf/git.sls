git:
  pkg.installed:
    - pkgs:
      - git
  file.managed:
    - name: /home/{{ salt['.get']('conf.emacs.user', salt['pillar.get']('conf.emacs.user')) }}/.gitconfig
    - source: salt://conf/files/gitconfig
    - mode: '0755'
