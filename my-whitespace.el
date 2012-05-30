;; replace newline-mark with given
(rplaca (nthcdr 2 (assq 'newline-mark whitespace-display-mappings)) '[?\u21B5 10])

;; remove newline mark at all
;; (assq-delete-all 'newline-mark whitespace-display-mappings)

;; set bigger line limitation
(setq whitespace-line-column 120)

(setq my-dark "#4444aa")
(setq my-bright "yellow")

;; set properties for whitespace space face
(set-face-attribute whitespace-space nil
                    :foreground my-dark
                    :background nil
                    )

;; spaces at the beginning of line
(set-face-attribute whitespace-indentation nil
                    :foreground my-dark
                    :background nil
                    )

;; tab face
(set-face-attribute whitespace-tab nil
                    :foreground my-dark
                    :background nil
                    )

;; new line face
(set-face-attribute whitespace-newline nil
                    :foreground my-dark
                    :background nil
                    )

;; spaces at the end of line
(set-face-attribute whitespace-trailing nil
                    :foreground my-bright
                    :background "red"
                    :box '(:line-width 1 :color "yellow")
                    )
