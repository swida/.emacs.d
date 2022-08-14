(use-package dockerfile-mode :ensure t)

(use-package ini-mode :ensure t
  :mode (rx (or
             "Pipfile"
             ".pylintrc")
            eol))

(use-package json-mode :ensure t)

(use-package web-mode :ensure t
  :mode (rx ".html" eol)
  :commands web-mode-set-engine
  :config
  (setq-default web-mode-markup-indent-offset 2)
  (setq web-mode-enable-engine-detection t))

(use-package yaml-mode :ensure t)
