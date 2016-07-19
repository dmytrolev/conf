emacs:
  pkg.installed:
    - pkgs:
      - emacs-nox
  file.managed:
    - name: {{ salt['grains.get']('conf:userhome', salt['pillar.get']('conf:userhome')) }}/.emacs.el
    - source: salt://conf/files/emacs.el
    - mode: '0755'
