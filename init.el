;; Thomas EMACS 2019 CONFIG

;; CODING-SYSTEM
(prefer-coding-system 'utf-8)

;; PARADOX PACKAGES MANAGER

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; FOR UNINSTALL PACKAGES

(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

;; PARADOX

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (powerline ace-jump-mode switch-window undo-tree autopair nlinum elscreen zoom multiple-cursors pangu-spacing goto-line-preview dimmer color-identifiers-mode yasnippet-snippets yasnippet company doom-themes doom-modeline beacon swiper ivy counsel linum-relative paradox helm)))
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

(setq frame-title-format "THOMAS EMACS")

(set-default 'cursor-type 'hbar)
(column-number-mode)
(show-paren-mode)
(global-hl-line-mode)
(winner-mode t)
(windmove-default-keybindings)
(autopair-global-mode)

;; Beacon

(beacon-mode 1)

(dolist (charset '(kana han cjk-misc bopomofo))
    (set-fontset-font "fontset-default" charset
                      (font-spec :family "STKaiti")))

(set-default-font "InputMono 18")

;;(set-default-font "FuraCode Nerd Font 18")
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; LINE NUMBER

(setq linum-format "%1d \u2502 ")
(global-linum-mode t)
(linum-relative-global-mode t)
(nlinum-mode)

;; HELM

(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

;; IDO

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
	;;"c:/Users/Thomas Sun/AppData/Roaming/.emacs.d/elpa/yasnippet-snippets-20191108.917/snippets/"
        ))

;; GLOBAL COLOR IDENTIFIERS
(color-identifiers-mode t)
(add-hook 'after-init-hook 'global-color-identifiers-mode)

;; DIMMER

(dimmer-mode)

;; PANGU SPACING

(global-pangu-spacing-mode 1)
(setq pangu-spacing-real-insert-separtor t)

;; MULTI CURSORS

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; ELSCREEN

(elscreen-start)

;; ZOOM

(global-set-key (kbd "C-x +") 'zoom)

;; GLOBAL SET KEY

(global-set-key (kbd "C-c r") #'eval-buffer)

;; UNDO

(global-undo-tree-mode)
(global-set-key (kbd "M-/") 'undo-tree-visualize)

;; SWITCH WINDOW

(global-set-key (kbd "C-M-z") 'switch-window)

;; ACE JUMP

(global-set-key (kbd "C-M->") 'ace-jump-mode)

;; POWERLINE

(powerline-center-theme)
(setq powerline-default-separator 'wave)

;; OPEN INIT FILE

(global-set-key (kbd "<f2>") (lambda() (interactive)(find-file "~/.emacs.d/init.el")))
