;;; hydrogen5/ui/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Fira Code" :size 15 :style "Retina"))

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

(setq splah-image-list
      '("lambda.png"
        "nasa.jpeg"
        "nerv.png"
        "rust.png"
        "scp.png"
        "switch.png"))
(setq doom-private-etc-dir (concat doom-private-dir "etc/"))
(setq fancy-splash-image
      (concat doom-private-etc-dir
       (nth (random (length splah-image-list)) splah-image-list)))

(setq display-line-numbers-type t)
