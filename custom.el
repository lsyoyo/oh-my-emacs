;;; This file contains some temporary code snippets, it will be loaded after
;;; various oh-my-emacs modules. When you just want to test some code snippets
;;; and don't want to bother with the huge ome.*org files, you can put things
;;; here.

;; For example, oh-my-emacs disables menu-bar-mode by default. If you want it
;; back, just put following code here.
;; (menu-bar-mode t)

;;; You email address
(setq user-mail-address "yuan.lin@na.nykline.com")

;;; Calendar settings
;; you can use M-x sunrise-sunset to get the sun time
(setq calendar-latitude 39.9)
(setq calendar-longitude 116.3)
(setq calendar-location-name "Beijing, China")

;;; Time related settings
;; show time in 24hours format
(setq display-time-24hr-format t)
;; show time and date
(setq display-time-and-date t)
;; time change interval
(setq display-time-interval 10)
;; show time
(display-time-mode t)

;;; Some tiny tool functions
(defun replace-all-chinese-quote ()
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (replace-regexp  "”\\|“" "\"")
    (mark-whole-buffer)
    (replace-regexp "’\\|‘" "'")))

;; Comment function for GAS assembly language
(defun gas-comment-region (start end)
  "Comment region for AT&T syntax assembly language The default
comment-char for gas is ';', we need '#' instead"
  (interactive "r")
  (setq end (copy-marker end t))
  (save-excursion
    (goto-char start)
    (while (< (point) end)
      (beginning-of-line)
      (insert "# ")
      (next-line))
    (goto-char end)))

(defun gas-uncomment-region (start end)
  "Uncomment region for AT&T syntax assembly language the
inversion of gas-comment-region"
  (interactive "r")
  (setq end (copy-marker end t))
  (save-excursion
    (goto-char start)
    (while (< (point) end)
      (beginning-of-line)
      (if (equal (char-after) ?#)
          (delete-char 1))
      (next-line))
    (goto-char end)))

;; (set-default-font "Monospace-12")
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(default ((t (:family "Monospace" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))
;; '(default ((t "fontset-standard"))))

;; (add-to-list 'default-frame-alist '(fontset . "fontset-standard"))
;; (set-face-attribute 'default t :fontset "fontset-standard")
;;

;; (message system-type)
;; (message "hi")

(when (eq system-type 'gnu/linux)
  ;; Default Font Face
  ;; (set-face-attribute 'default nil :family "DejaVu Sans Mono")
  ;; (set-face-attribute 'default nil :family "Monospace")
  ;; (set-face-font 'default "fontset-standard")

  (setq my-fonts
    '(
      ;; "-*-Monaco-*-*-*-*-*-*-*-*-*-*-iso8859-*"
      ;; "-*-DejaVu Sans Mono-*-*-*-*-*-*-*-*-*-*-*-*"
      ;; "-*-Droid Sans Mono-*-*-*-*-*-*-*-*-*-*-*-*"
      ;; "-*-Monospace-*-*-*-*-*-*-*-*-*-*-*-*"
      "Monospace-14"
     ))

    (create-fontset-from-fontset-spec standard-fontset-spec) ;to make --daemon work
    (dolist (font (reverse my-fonts))
      (set-fontset-font "fontset-standard" 'unicode font nil 'prepend))

    (add-to-list 'default-frame-alist '(font . "fontset-standard"))
    (add-to-list 'default-frame-alist '(width . 90))
    )
  ; (set-face-attribute 'default nil :height 120)

  ; ;; (set-fontset-font t 'ascii (font-spec :name "Monaco"))
  ; ;; (set-fontset-font "fontset-default" 'ascii "Monaco")
  ; (set-fontset-font "fontset-standard"
  ;                   'ascii
  ;                   (font-spec :name "Monaco"))
  ; (set-fontset-font "fontset-standard"
  ;                   nil
  ;                   "Monospace" nil 'append)
  ; )

;; last t is for NO-ENABLE
;; (load-theme 'solarized-dark t t)
(load-theme 'solarized-dark t t)

(defun mb/pick-color-theme (frame)
  (select-frame frame)
  (load-theme 'solarized-dark t))

(add-hook 'after-make-frame-functions 'mb/pick-color-theme)

;; For when started with emacs or emacs -nw rather than emacs --daemon
(load-theme 'solarized-dark t)

(defadvice dired (after dedicate activate)
  "Make this Dired window dedicated."
  (set-window-dedicated-p (selected-window) t))

(global-auto-revert-mode 1)

;; (setq fci-rule-color "#2aa198")
;; (setq fci-rule-use-dashes t)
;; (setq fci-dash-pattern 0.75)

;; (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
;;   (global-fci-mode 1)
