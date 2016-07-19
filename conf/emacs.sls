emacs:
  pkg.installed:
    - pkgs:
      - emacs-nox
  file.managed:
    - name: {{ salt['grains.get']('conf:user-home', salt['pillar.get']('conf:user-home')) }}/.emacs.el
    - source: salt://conf/files/emacs.el
    - mode: '0755'
