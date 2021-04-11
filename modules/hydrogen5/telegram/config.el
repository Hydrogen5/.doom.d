;;; hydrogen5/telega/config.el -*- lexical-binding: t; -*-


(use-package! telega
  :defer t
  ;; ("C-c t" . telega-prefix-map)

  :config
  (setq telega-proxies (list '(:server "127.0.0.1" :port 13659 :enable t
                          :type (:@type "proxyTypeSocks5"))))
  )

(map! :leader :desc "telegram" :g "t" telega-prefix-map)
(map! :desc "Telega" :g "C-c t" telega-prefix-map)
