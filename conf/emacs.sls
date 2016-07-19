emacs:
  pkg-installed:
    - pkgs:
      - emacs-nox
  file.managed:
    - name: /home/{{ salt['.get']('conf.emacs.user', salt['pillar.get']('conf.emacs.user')) }}/.emacs.el
    - source: salt://conf/files/emacs.el
    - mode: '0755'
