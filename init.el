(push "/Users/pb/CODEs/webtest/flask_python2/bin" exec-path)
(setenv "PATH"
        (concat
         "/Users/pb/CODEs/webtest/flask_python2/bin" ":"
         (getenv "PATH")
         ))

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
 '(initial-frame-alist (quote ((fullscreen . maximized)))))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 140 :family "Menlo")))))

(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-1.3.1")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20160229.1706/dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

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
(setq-default py-shell-name "/Users/pb/CODEs/pelican/pelican_ENV/bin/ipython")
(setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
;; (setq py-python-command-args
;;   '("--gui=osx"  "--pylab=osx"))
;(setq py-force-py-shell-name-p t)
; switch to the interpreter after executing code
;;(setq py-shell-switch-buffers-on-execute-p t)
;;(setq py-switch-buffers-on-execute-p t)
; don't split windows
;;(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
;(setq py-smart-indentation t)






(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))

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

(mouse-avoidance-mode 'animate);光标靠近鼠标指针时，让鼠标指针自动让开
