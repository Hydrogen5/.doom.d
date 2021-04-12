;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Hydrogen5"
      user-mail-address "hydrogen5plus@gmail.com")

(defmacro k-time (&rest body)
  "Measure and return the time it takes evaluating BODY."
   `(let ((time (current-time))) ,@body (float-time (time-since time))))

;; Set garbage collection threshold to 512M.
(setq gc-cons-threshold #x20000000)

;; When idle for 15sec run the GC no matter what.
(defvar k-gc-timer
  (run-with-idle-timer
   15 t (lambda ()
          (message
           "Garbage Collector has run for %.06fsec"
           (k-time (garbage-collect))))))

;; config language
(after! rustic
  (setq rustic-lsp-server 'rust-analyzer))

;; bind keys
(map! :leader :desc "Treemacs" :g "0" #'treemacs-select-window)
(map! :leader
  "1" 'winum-select-window-1
  "2" 'winum-select-window-2
  "3" 'winum-select-window-3
  )
(map! :leader :desc "Switch to last workspace" :g "TAB TAB" #'+workspace/other)
(map! :leader :desc "Display tab bar" :g "TAB `" #'+workspace/display)
(map! :leader :desc "Open a new terminal" :g "`" #'vterm)
(map! :leader :desc "Toggle" "T" doom-leader-toggle-map)

;; config completion
(after! company
  (map! :map company-active-map
        "<tab>" #'company-complete-selection
        "RET" 'nil
   )
  (setq company-idle-delay 0.1))


(defun write-clipboard-image ()
  "write an image from clipboard"
  (interactive)
  (let* ((path "~/.photocache/")
         (fname (format-time-string "%Y%m%d%H%M%S" (current-time)))
         (image-file (concat path fname ".jpg")))
    (if (not (file-exists-p path))
        (mkdir path))
    (shell-command (concat "pngpaste " image-file))
    (message image-file)))
