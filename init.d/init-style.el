;;; init-style.el --- Style Emacs to my taste

;;; Commentary:
;;
;; init-style.el contains code that styles Emacs to my taste. It includes
;; things like the default window size/position, theme choices, etc.

;;; Code:

(require 'is-a)
(require 'init-local)

;; Use a nice dark theme when running under GUI
(if (display-graphic-p)
    (progn
      (use-package color-theme-sanityinc-tomorrow :ensure t)
      (color-theme-sanityinc-tomorrow-night)
      (set-face-attribute 'highlight nil :background "#484a4e"))
  (use-package afternoon-theme :ensure t))

;; Ensure I have the same base font no matter which macOS Emacs I'm using.
(when is-a-macOS-window-p
  (add-to-list 'default-frame-alist '(font . "menlo")))

;; Have comments always be in italic.
(set-face-attribute 'font-lock-comment-face nil :italic t)

;; First off, let's tweak what the final booted version of Emacs looks like
;; when the loading of the init is over.
(setq inhibit-startup-screen t
      initial-scratch-message
      (format ";; Get %s done!\n\n"
              ;; Ensure my standard scratch buffer entry isn't quite so
              ;; "crude" when I'm at work. ;)
              (if (file-exists-p (local-emacs-directory ".nsfw"))
                  "stuff"
                "shit")))

;; No toolbar. Ever. Just.... no!
(tool-bar-mode -1)
;; Do away with the scroll bars too.
(scroll-bar-mode -1)

;; Let's not bother with the menu either, except if we're on a Mac, where it
;; costs nothing to have one.
(unless is-a-macOS-window-p
  (menu-bar-mode -1))

;; When in graphical mode on macOS, don't use application tabs when opening
;; a new frame.
(when is-a-macOS-window-p
  (set (intern "mac-frame-tabbing") nil))

;; Window titles.
(let ((format (list (user-login-name) "@" (downcase (system-name))
                    " - "
                    "[%b" '(:eval (if (buffer-file-name)
                                      (format " (%s)" (abbreviate-file-name (buffer-file-name)))
                                    "")) "]")))
  (setq frame-title-format format
        icon-title-format  format))

;; Mode line.
(column-number-mode t)

;; When we're on a graphical display...
(when (display-graphic-p)
  ;; Always visit images as images.
  (auto-image-file-mode))

;; Style the cursor.
(setq-default blink-cursor-blinks 0)
(blink-cursor-mode 1)

;; Various window-level defaults.
(setq-default
 ;; Wrap a little further over.
 fill-column 76
 ;; Only show a cursor in the focused window
 cursor-in-non-selected-windows nil
 ;; Sensible scrolling.
 scroll-conservatively 101
 ;; Don't error just because we're near the bounds of a buffer.
 scroll-error-top-bottom t)

(provide 'init-style)

;;; init-style.el ends here
