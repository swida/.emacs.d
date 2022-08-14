(use-package eglot
  :ensure t
  :hook
  (eglot-managed-mode . (lambda() (let ((saved-indent-region-function indent-region-function))
                                    (if (eglot-managed-p)
                                        (progn
                                          (advice-add 'xref-backend-identifier-at-point :override #'my-xref-backend-identifier-at-point)
                                          (advice-add 'xref-backend-identifier-completion-table :override #'my-xref-backend-identifier-completion-table)
                                          (advice-add 'xref-backend-definitions :after-until #'my-xref-backend-definitions)
                                          (setq-local indent-region-function 'eglot-format))
                                      (advice-remove 'xref-backend-identifier-at-point #'my-xref-backend-identifier-at-point)
                                      (advice-remove 'xref-backend-identifier-completion-table #'my-xref-backend-identifier-completion-table)
                                      (advice-remove 'xref-backend-definitions #'my-xref-backend-definitions)
                                      (setq-local indent-region-function saved-indent-region-function)))))
  :config
  (add-hook 'c-mode-common-hook 'eglot-ensure)
  (add-to-list 'eglot-stay-out-of 'imenu)
  :custom
  (eglot-events-buffer-size 1))
