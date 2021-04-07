;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Hydrogen5"
      user-mail-address "hydrogen5plus@gmail.com")


;; config ui
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Fira Code" :size 15 :style "Retina"))
(setq doom-theme 'doom-one-light)
(add-to-list 'initial-frame-alist '(fullscreen . fullboth))
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
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
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


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
