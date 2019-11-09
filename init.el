;; Thomas EMACS 2019 CONFIG

;; CODING-SYSTEM
(prefer-coding-system 'utf-8)

;; PARADOX PACKAGES MANAGER

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet-snippets yasnippet company doom-themes doom-modeline beacon swiper ivy counsel linum-relative paradox helm)))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; INTERFACE MISC

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; BEACON

(beacon-mode 1)

(dolist (charset '(kana han cjk-misc bopomofo))
    (set-fontset-font "fontset-default" charset
                      (font-spec :family "STKaiti")))

;(set-default-font "InputMono 18")

(set-default-font "FuraCode Nerd Font 18")
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; LINE NUMBER

(setq linum-format "%1d \u2502 ")
(global-linum-mode t)
(linum-relative-global-mode t)

;; HELM

(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

;; IDO

(require 'ido)
(ido-mode t)

;; SWIPER

(global-set-key (kbd "C-s") #'swiper-isearch)
(global-set-key (kbd "C-c s") #'swiper-all)


;;DOOM-MODELINE

(require 'doom-modeline)
(doom-modeline-mode 1)
(setq doom-modeline-height 18)
(setq doom-modeline-icon (display-graphic-p))
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-buffer-state-icon t)
(setq doom-modeline-buffer-modification-icon t)
(setq doom-modeline-unicode-fallback t)
(setq doom-modeline-buffer-encoding t)
(setq doom-modeline-indent-info nil)
(setq doom-modeline-persp-name t)
(setq doom-modeline-lsp t)
(setq doom-modeline-env-version t)
(setq doom-modeline-env-enable-python t)
(setq doom-modeline-env-enable-ruby t)
(setq doom-modeline-env-enable-perl t)
(setq doom-modeline-env-enable-go t)
;;(setq doom-modeline-before-update-env-hook nil)
;;(setq doom-modeline-after-update-env-hook nil)
;;(setq doom-modeline-env-python-executable "python")

;; THEME

(load-theme 'doom-spacegrey t)
;;(load-theme 'doom-solarized-light t)

;;AUTO-COMPLETE

(add-hook 'after-init-hook 'global-company-mode)

;; YAsnippet

(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets/own/"                 ;; personal snippets
        ;;"~/.emacs.d/snippets/collection/"           ;; foo-mode and bar-mode snippet collection
        ))


