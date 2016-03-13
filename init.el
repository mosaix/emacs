(define-coding-system-alias 'UTF-8 'utf-8)
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(require 'ido)
(ido-mode t)
;; initial window
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#303030" "#ff4b4b" "#d7ff5f" "#fce94f" "#5fafd7" "#d18aff" "#afd7ff" "#c6c6c6"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (idea-darkula)))
 '(custom-safe-themes
   (quote
	("4ab86c7682db09485a6e046ee0a6c45b5462f514c89844f4ed8b329aa1708067" "23562d67c3657a80dd1afc21e1e80652db0ff819e477649d23a38c1502d1245f" "74278d14b7d5cf691c4d846a4bbf6e62d32104986f104c1e61f718f9669ec04b" "f81933744f47a010213537575f84085af3937b27748b4f5c9249c5e100856fc5" "613a7c50dbea57860eae686d580f83867582ffdadd63f0f3ebe6a85455ab7706" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(fci-rule-color "#073642")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
	(solarized-color-blend it "#002b36" 0.25)
	(quote
	 ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
	(("#073642" . 0)
	 ("#546E00" . 20)
	 ("#00736F" . 30)
	 ("#00629D" . 50)
	 ("#7B6000" . 60)
	 ("#8B2C02" . 70)
	 ("#93115C" . 85)
	 ("#073642" . 100))))
 '(hl-bg-colors
   (quote
	("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
	("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
	("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
	((20 . "#dc322f")
	 (40 . "#c85d17")
	 (60 . "#be730b")
	 (80 . "#b58900")
	 (100 . "#a58e00")
	 (120 . "#9d9100")
	 (140 . "#959300")
	 (160 . "#8d9600")
	 (180 . "#859900")
	 (200 . "#669b32")
	 (220 . "#579d4c")
	 (240 . "#489e65")
	 (260 . "#399f7e")
	 (280 . "#2aa198")
	 (300 . "#2898af")
	 (320 . "#2793ba")
	 (340 . "#268fc6")
	 (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
	(unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(add-to-list 'custom-theme-load-path "~/.emacs.d/moe-theme-20160216.1821/")
    (add-to-list 'load-path "~/.emacs.d/moe-theme-20160216.1821/")
    (require 'moe-theme)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 140 :family "Menlo")))))

(add-to-list 'load-path "~/.emacs.d/elpa/virtualenvwrapper-20151127.621")
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "~/.virtualenvs")

(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-1.3.1")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20160229.1706/dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)
(elpy-enable)

(package-install 'flycheck)
(global-flycheck-mode)

(require 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

(setq py-autopep8-options '("--max-line-length=100"))

(add-to-list 'load-path "~/.emacs.d/elpa/fill-column-indicator-20151030.1233")
(require 'fill-column-indicator)
(define-globalized-minor-mode
 global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)
; python-mode
(setq py-install-directory "~/.emacs.d/elpa/python-mode-20160302.251")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

; use IPython
(setq-default py-shell-name "/usr/local/bin/ipython")
(setq-default py-which-bufname "IPython")


(require 'linum)  
(global-linum-mode t)  
(menu-bar-mode -1) ;; 不显示菜单
(tool-bar-mode -1) ;; 不显示工具栏
(scroll-bar-mode -1) ;; 不显示滚动条
(column-number-mode 1) ;; 显示行数和列数

(appt-activate 1) ;; 启动日历提醒
(setq require-final-newline t) ;; 编辑文件的最后一个字符是回车
(setq bookmark-default-file "~/.emacs.d/.emacs.bmk") ;; 书签文件位置
(global-set-key "\r" 'newline-and-indent) ;; 回车默认缩进
(setq inhibit-startup-message t) ;; 不显示启动时的界面
(show-paren-mode 1) ;; 显示括号的对应反括号
(setq show-paren-style 'mixed) ;; 设置显示括号的样式
(mouse-avoidance-mode 'animate) ;; 光标与鼠标重合时，移开鼠标
(setq default-tab-width 4) ;; Tab 的宽度为 4
(setq default-major-mode 'text-mode);一打开就起用 text 模式。
(global-font-lock-mode t);语法高亮
(auto-image-file-mode t);打开图片显示功能
(fset 'yes-or-no-p 'y-or-n-p)

(mouse-avoidance-mode 'animate);光标靠近鼠标指针时，(setq org-todo-keywords
'((sequence "TODO(t)" "|" "DONE(d)")
(sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
(sequence "|" "CANCELED(c)"))


(setq org-log-done 'time)
(setq org-log-done 'note)
(setq org-todo-keywords
	  '((sequence "TODO(t)" "STARTED" "WAITING(w@/!" "|" "DONE(d!)" "CANCELLED(c@)")))
(setq org-clock-into-drawer t)

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-hook 'python-mode-hook 'jedi:ac-setup)


(add-hook 'python-mode-hook 'my-jedi-server-setup)

