;;; init-keys.el --- Personal keyboard bindings and keyboard tweaks

;;; Commentary:
;;
;; init-keys.el contains my personal keyboard bindings as well as general
;; keyboard tweaks and OS-specific settings. Any package-specific bindings
;; will be with the relevant `use-package' elsewhere in this config.

;;; Code:

(require 'is-a)
(require 'bind-key)
(require 'package-x)
(require 'use-package)
(require 'dev-mysql)

;; Movement
(bind-keys
 ("M-<left>"  . backward-sexp)
 ("M-<right>" . forward-sexp)
 ("M-<up>"    . scroll-down-line)
 ("M-<down>"  . scroll-up-line)
 ("s-s"       . isearch-forward-symbol-at-point)
 ("C-s-<tab>" . other-window))

(bind-keys
 ("C-S-<right>" . windmove-right)       ; Nicer on full-size keyboard.
 ("C-S-<down>"  . windmove-down)
 ("C-S-<left>"  . windmove-left)
 ("C-S-<up>"    . windmove-up))

;; Editing
(bind-keys
 ("C-c ;"         . comment-or-uncomment-region)
 ("C-<backspace>" . backward-kill-word)
 ("s-<backspace>" . backward-kill-word)
 ("C-c a"         . align)
 ("s-<tab>"       . completion-at-point))

;; Tools and "apps" and things.
(bind-keys
 ("C-<f6>"        . list-processes)
 ("<f6>"          . bury-buffer)
 ("<f9>"          . compile)
 ("<f12> r"       . ielm)
 ("<f12> h"       . eshell)
 ("<f12> w"       . eww)
 ("<f12> <f12>"   . describe-personal-keybindings)
 ("<f12> C-<f12>" . describe-bindings)
 ("<f12> p l"     . package-list-packages)
 ("<f12> p r"     . package-refresh-contents)
 ("<f12> p t"     . package-lint-current-buffer)
 ("<f12> p u"     . package-upload-buffer)
 ("<f12> ? w"     . woman)
 ("<f12> m r"     . rerun-last-input-sql-command))

;; Don't do shift-selecting.
(setq shift-select-mode nil)
;; Don't do transient marking
(transient-mark-mode -1)

;; Things specific to macOS.
(when is-a-macOS-window-p
  ;; Have "option" be "super".
  (set (intern "mac-option-modifier") 'super)
  ;; Have "cmd" be "meta"
  (set (intern "mac-command-modifier") 'meta))

;; Things specific to Windows.
(when is-a-win32-p
  (set (intern "w32-lwindow-modifier") 'meta))

;; Give https://www.masteringemacs.org/article/text-expansion-hippie-expand
;; a try. I've been using dabbrev-expand since forever, and never thought to
;; look at this.
(global-set-key [remap dabbrev-expand] 'hippie-expand)

(provide 'init-keys)

;;; init-keys.el ends here
