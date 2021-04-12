;;; hydrogen5/telega/config.el -*- lexical-binding: t; -*-


(use-package! telega
  :defer t

  :config
  (setq telega-proxies (list '(:server "127.0.0.1" :port 13659 :enable t
                          :type (:@type "proxyTypeSocks5")))
        telega-chat-input-prompt '((prompt . ">>> ")
                                   (reply . "<<< ")
                                   (edit . "+++ ")))
  (map! :map telega-msg-button-map
        "k" nil
        :leader :desc "telega-prefix" :g "t" telega-prefix-map
        :desc "Telega" :g "C-c t" telega-prefix-map
        )

  :hook
  (telega-chat-mode . (lambda ()
                        (set-company-backend! 'telega-chat-mode
                          (append (list 'telega-company-username
                                        'telega-company-hashtag)
                                  (when (telega-chat-bot-p telega-chatbuf--chat)
                                    '(telega-company-botcmd))))))
  )

(map! :leader :desc "telegram" :g "t" #'telega)
