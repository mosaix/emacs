;; Thomas EMACS 2025 CONFIG

;; DISABLE BAKCKUP FILEs

(setq inhibit-startup-screen t)

(setq make-backup-files nil)

;; MAX WINDOW

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; CODING-SYSTEM
(prefer-coding-system 'utf-8)

;; PARADOX PACKAGES MANAGER


(setq package-archives '(("gnu"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
;;(package-initialize) ;; You might already have this line

;; FOR UNINSTALL PACKAGES

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     ;; (package-installed-p 'evil)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; make sure to have downloaded archive description.
;; Or use package-archive-contents as suggested by Nicolas Dudebout
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; beacon lsp-mode timu-spacegrey corfu ivy

(ensure-package-installed 'beacon 'lsp-mode 'timu-spacegrey-theme 'corfu 'ivy )

;;(ensure-package-installed 'powerline 'ace-jump-mode 'switch-window 'undo-tree 'nlinum 'elscreen 'zoom 'multiple-cursors 'pangu-spacing 'goto-line-preview 'dimmer 'color-identifiers-mode 'yasnippet-snippets 'yasnippet 'company 'doom-themes 'doom-modeline 'beacon 'swiper 'ivy 'counsel 'linum-relative 'paradox 'helm) ;  --> (nil nil) if iedit and magit are already installed
; doom-modeline
;; activate installed packages
(package-initialize)

;; PARADOX


;;(setq frame-title-format "THOMAS EMACS")

(set-default 'cursor-type 'hbar)
(column-number-mode)

(show-paren-mode)
(global-hl-line-mode)
(winner-mode t)
(windmove-default-keybindings)
;;(autopair-global-mode)

;; Beacon

(beacon-mode 1)

(dolist (charset '(kana han cjk-misc bopomofo))
    (set-fontset-font "fontset-default" charset
                      (font-spec :family "STKaiti" :size 20)))

;;(set-default-font "JetBrainsMono Nerd Font Mono 18")
(set-frame-font "JetBrains Mono 18" nil t)
;;(set-default-font "FuraCode Nerd Font 18")
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; LINE NUMBER

;;(setq linum-format "%2d \u2502 ")
;;(setq global-nlinum-mode t)
;;(setq column-number-mode t)
;;(setq display-line-numbers-mode t)
;;(setq linum-relative-global-mode t)
;;(setq linum-relative-mode t)
(setq-default display-line-numbers 'relative
      display-line-numbers-current-absolute t)

;; IDO

;;(ido-mode t)

;; Swiper

;(global-set-key (kbd "C-s") #'swiper-isearch)
;(global-set-key (kbd "C-c s") #'swiper-all)



(load-theme 'timu-spacegrey t)

;; IVY

(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; LSP SERVER

;; if you want to change prefix for lsp-mode keybindings.
(setq lsp-keymap-prefix "s-l")

(require 'lsp-mode)
(add-hook 'python-mode-hook #'lsp)

;; AUTOCOMPLETION
(use-package corfu
  ;; Optional customizations
  ;; :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches

  ;; Enable Corfu only for certain modes. See also `global-corfu-modes'.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.  This is recommended since Dabbrev can
  ;; be used globally (M-/).  See also the customization variable
  ;; `global-corfu-modes' to exclude certain modes.
  :init
  (global-corfu-mode))

;; A few more useful configurations...
(use-package emacs
  :custom
  ;; TAB cycle if there are only few candidates
  ;; (completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (tab-always-indent 'complete)

  ;; Emacs 30 and newer: Disable Ispell completion function.
  ;; Try `cape-dict' as an alternative.
  (text-mode-ispell-word-completion nil)

  ;; Hide commands in M-x which do not apply to the current mode.  Corfu
  ;; commands are hidden, since they are not used via M-x. This setting is
  ;; useful beyond Corfu.
  (read-extended-command-predicate #'command-completion-default-include-p))

(setq corfu-auto t
      corfu-quit-no-match 'separator) ;; or t

(setq corfu-auto        t
      corfu-auto-delay  1  ;; TOO SMALL - NOT RECOMMENDED!
      corfu-auto-prefix 1) ;; TOO SMALL - NOT RECOMMENDED!

(add-hook 'corfu-mode-hook
          (lambda ()
            ;; Settings only for Corfu
            (setq-local completion-styles '(basic)
                        completion-category-overrides nil
                        completion-category-defaults nil)))

(setq global-corfu-minibuffer
      (lambda ()
        (not (or (bound-and-true-p mct--active)
                 (bound-and-true-p vertico--input)
                 (eq (current-local-map) read-passwd-map)))))

(add-hook 'eshell-mode-hook (lambda ()
                              (setq-local corfu-auto nil)
                              (corfu-mode)))


