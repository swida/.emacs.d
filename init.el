;;; init.el --- Entry point of my Emacs configuration.

;;; Commentary:
;;
;; See https://github.com/swida/.emacs.d#readme for details.

;;; Code:

;; Add my local init directory to the load path.
(push (expand-file-name "init.d/" user-emacs-directory) load-path)

;; Ensure local storage is defined and set up.
(require 'init-local)

;; Ensure custom values go in their own file.
(load (setq custom-file (local-emacs-directory "custom.el")) t)

;; Make sure the package system is up and running early on.
;; (package-initialize) happens in here (and it's mentioned here to stop
;; the package system stomping on my init file).
(require 'init-repos)

;; Now that the repos are set up, ensure `use-package' is in play.
(require 'use-package)

;; is-a.el is a bit special, as I use very early on. Load it now.
(use-package is-a)

;; Now that melpa is sorted and use-package is available, ensure that
;; auto-compile kicks in. I like my ~/.emacs.d/ to be compiled so this is
;; very handy when I've made lots of changes and pulled them down to a
;; machine that had pre-existing elc files that will now be out of date.
(use-package auto-compile
  :ensure t
  :config
  (auto-compile-on-save-mode)
  (auto-compile-on-load-mode))

;; Load various startup things.
(require 'init-net)
(require 'init-packages)
(unless noninteractive
  (require 'init-editing)
  (require 'init-tweaks)
  (require 'init-keys)
  (require 'init-style))


;; Finally, load any local config. This is for things I don't want to be
;; tracking via my ~/.init.d repo code (things local to a machine, etc).
(load (local-emacs-directory "local-init.el") t)

;;; init.el ends here
