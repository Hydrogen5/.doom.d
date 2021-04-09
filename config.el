;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Hydrogen5"
      user-mail-address "hydrogen5plus@gmail.com")

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

;; config completion
(after! company
  (map! :map company-active-map
        "<tab>" #'company-complete-selection
        "RET" 'nil
   )
  (setq company-idle-delay 0.1))
