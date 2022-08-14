(require 'init-local)

(use-package calendar
  :config
  (setq
   diary-file             (local-emacs-directory "diary")
   calendar-latitude      +39.55
   calendar-longitude     +116.25
   calendar-location-name "Beijing, China"))
