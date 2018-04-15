;;; my .emacs file
;;2018/4/14

;; -*- Coding: utf-8 -*-
(setq inhibit-startup-message t) 

;; 日本語の設定
(set-language-environment "Japanese")
;;; 漢字コードの指定
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(utf-translate-cjk-mode t)


;; Ctrl-h を Backspace として使う．
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)

;; Terminal から起動する場合は MenuBar 非表示
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))

;; それぞれの色を設定する
(set-cursor-color "red")   ;; マウスカーソル
(set-background-color "black")     ;; 背景色
(set-foreground-color "blue")      ;; 文字色
(set-face-foreground 'fringe "snow")       ;; 両脇のバーの文字色
(set-face-background 'fringe "dark red")   ;; 両脇のバーの背景色
(set-face-foreground 'mode-line-inactive "white")  ;; アクティブでないバッファの文字色
(set-face-background 'mode-line-inactive "MediumPurple4")  ;; アクティブでないバッファの背景色

;; 選択範囲に色を付ける
(setq transient-mark-mode t)
(set-face-foreground 'region "black")
(set-face-background 'region "white")

;; 全角スペースやタブ文字、行末のスペースを色を付けて表示する
(global-font-lock-mode t)
(defface my-face-b-1 '((t (:background "gray"))) nil)
(defface my-face-b-2 '((t (:background "gray26"))) nil)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
    (font-lock-add-keywords
        major-mode
	   '(("¥t" 0 my-face-b-2 append)
	          ("　" 0 my-face-b-1 append)
		       ("[ ¥t]+$" 0 my-face-u-1 append)
		            )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)