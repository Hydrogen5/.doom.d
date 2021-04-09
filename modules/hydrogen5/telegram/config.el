;;; hydrogen5/telega/config.el -*- lexical-binding: t; -*-


(use-package! telega
  :defer t

  :config
  (setq telega-proxies (list '(:server "127.0.0.1" :port 13659 :enable t
                          :type (:@type "proxyTypeSocks5")))))
