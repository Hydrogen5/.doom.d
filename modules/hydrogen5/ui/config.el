;;; hydrogen5/ui/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Fira Code" :size 16 :style 'Retina)
      doom-unicode-font (font-spec :family "Sarasa Mono SC" :size 16 :weight 'Regular)
      doom-variable-pitch-font (font-spec :family "Sarasa Mono SC" :size 16 :weight 'Regular)
      doom-big-font (font-spec :family "Sarasa Mono SC" :size 24 :weight 'Regular)
)
(defun hydrogen5/set-fonts ()
  (set-fontset-font "fontset-default" 'unicode (font-spec :family "Sarasa Mono SC" :size 16 :weight 'Regular) nil 'prepend)
  (set-fontset-font "fontset-default" 'symbol (font-spec :family "Apple Color Emoji") nil 'prepend))
(add-hook! 'after-setting-font-hook :append 'hydrogen5/set-fonts) ;;言
;; (push "Sarasa Mono SC" doom-unicode-extra-fonts)

(setq +ligatures-extra-symbols
  '(
    ;; org
    :name          "»"
    :src_block     "»"
    :src_block_end  "«"
    :quote         "“"
    :quote_end     "”"
    ))

;; auto change theme
(defun check-now-is-day-or-night ()
  "Return t for day and nil for night"
  (let ((now-hour (string-to-number (format-time-string "%H" (current-time)))))
    (and (> now-hour 8) (< now-hour 19))
  ))

(if (check-now-is-day-or-night)
    (setq doom-theme 'doom-one-light)
    (setq doom-theme 'doom-one))

(run-with-timer 0 1200
                (lambda () (if (check-now-is-day-or-night)
                  (load-theme 'doom-one-light t)
                  (load-theme 'doom-one t))))

;; config mac window
(setq ns-use-thin-smoothing t
      ns-use-native-fullscreen nil
      ns-use-fullscreen-animation nil)
(add-hook 'window-setup-hook #'toggle-frame-maximized t)

(setq org-directory "~/org/")

(setq splah-image-list-light
      '("lambda.png"
        "nasa.png"
        "nerv.png"
        "rust.png"
        "scp.png"
        "vscode.png"
        "sublime.png"
        "switch.png"))

(setq splah-image-list-dark
      '("nasa.png"
        "nerv.png"
        "vscode.png"
        "sublime.png"
        ))

(setq doom-private-etc-dir (concat doom-private-dir "etc/"))
(setq fancy-splash-image
      (concat doom-private-etc-dir
        (if (check-now-is-day-or-night)
            (nth (random (length splah-image-list-light)) splah-image-list-light)
            (nth (random (length splah-image-list-dark )) splah-image-list-dark ))))


(setq display-line-numbers-type 'relative)
