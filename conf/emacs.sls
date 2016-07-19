emacs:
  pkg.installed:
    - pkgs:
      - emacs-nox
  file.managed:
    - name: /home/{{ salt['grains.get']('conf:user', salt['pillar.get']('conf:user')) }}/.emacs.el
    - source: salt://conf/files/emacs.el
    - mode: '0755'
