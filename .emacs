; removes start up message
(setq inhibit-startup-message t)

; sets font size
(set-default-font "-Misc-Fixed-Medium-R-Normal--10-120-75-75-C-80-ISO8859-1")

; sets color
(when window-system
  (add-to-list 'default-frame-alist '(background-color . "black"))
  (add-to-list 'default-frame-alist '(foreground-color . "wheat")))

; remove backup file
(setq make-backup-files nil)

; column fill
(add-hook 'text-mode-hook 'turn-on-auto-fill)