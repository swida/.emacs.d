(use-package js2-mode
  :mode "\\.js$"
  :custom
  (js-switch-indent-offset 4))

(use-package python
  :custom
  (python-indent-guess-indent-offset nil)
  (python-shell-interpreter "python3")
  (python-fill-docstring-style 'pep-257-nn))

(add-hook 'prog-mode-hook
          (lambda ()
            ;; Make it clear where the empty lines are
            (setq-local indicate-empty-lines t)
            ;; Set up for auto-filling comments.
            (setq-local comment-auto-fill-only-comments t)
            (auto-fill-mode 1)))

(use-package compile
  :custom
  (compilation-scroll-output t)
  :config
  (require 'ansi-color)
  (add-hook 'compilation-filter-hook
            (lambda ()
              ;; Turn on ansi-color in compilation-mode
              (read-only-mode -1)
              (ansi-color-apply-on-region compilation-filter-start (point))
              (read-only-mode))))
