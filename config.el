;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; clients, file templates and snippets.
;; Some functionality uses this to identify you, e.g. GPG configuration, email
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
 (setq doom-font (font-spec :family "Iosevka SS04" :size 18 :weight 'medium))
;;       doom-variable-pitch-font (font-spec :family "sans" :size

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(setq-default
 cursor-in-non-selected-windows nil     ; Hide the cursor in inactive
 delete-by-moving-to-trash t            ; Delete files to
 fill-column 80                         ; Set width for automatic line
 tab-width 2                            ;
 )

(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-e C-S-e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-S-c k") 'mc/skip-to-previous-like-this)
(global-set-key (kbd "C-S-c j") 'mc/skip-to-next-like-this)
(setq mc/list-file "/home/jlh/.doom.d/.mc-lists.el")



(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(defun my-LaTeX-mode()
  (add-to-list 'TeX-view-program-list '("Evince" "evince --page-index=%(outpage) %o"))
  (setq TeX-view-program-selection '((output-pdf "Evince")))
  ; Other mode specific config
  )
(add-hook 'LaTeX-mode-hook 'my-LaTeX-mode)

(map!
 :map evil-insert-state-map
 :desc "Move cursor vertically down ARG lines"
 "C-;" #'next-line)
(map!
 :map evil-insert-state-map
 :desc "Move cursor vertically up ARG lines"
 "C-'" #'previous-line)
