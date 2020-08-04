;;; packages.el --- mail layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Aidan Scannell <aidanscannell@Aidans-MacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `mail-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a ;;   function `mail/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `mail/pre-init-PACKAGE' and/or
;;   `mail/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst mail-packages '(persp-mode))

(defun mail/post-init-persp-mode ()
  (spacemacs|define-custom-layout mu4e-spacemacs-layout-name
    :binding mu4e-spacemacs-layout-binding
    :body
    (progn
      (call-interactively 'mu4e)
      (call-interactively 'mu4e-update-index)

      (define-advice mu4e~stop (:after nil kill-mu4e-layout-after-mu4e~stop)
        (when mu4e-spacemacs-kill-layout-on-exit
          (persp-kill mu4e-spacemacs-layout-name)))

      (define-advice mu4e-headers-quit-buffer
          (:after nil mu4e-update-mail-after-mu4e-headers-quit-buffer)
        (mu4e-update-mail-and-index :run-in-the-background))))

  ;; TODO: remove when fix available for Spacemacs
  ;; Temporarily disables mu4e layer future because it very often screws up window configuration
  (dolist (h (mapcar #'derived-mode-hook-name
                     '(mu4e-main-mode
                       mu4e-headers-mode
                       mu4e-view-mode
                       mu4e-compose-mode)))
    (remove-hook h #'spacemacs-layouts/add-mu4e-buffer-to-persp)))

(with-eval-after-load 'mu4e-alert
  ;; Enable Desktop notifications
  ;; (mu4e-alert-set-default-style 'notifications))
  ;; TODO
  (mu4e-alert-set-default-style 'notifier))
  ;; (mu4e-alert-set-default-style 'growl))

(with-eval-after-load 'mu4e
  ;; (setq mu4e-maildir "~/.mail"
  (setq mu4e-maildir "~/Maildir"
        ;; mu4e-get-mail-command "mbsync --all --new --delete --flags --renew --pull --push --create --expunge --verbose"
        mu4e-get-mail-command "offlineimap"
        mu4e-view-use-gnus nil
        mu4e-update-interval 600
        mu4e-compose-signature-auto-include nil
        mu4e-view-show-images t
        mu4e-view-show-addresses t
        mu4e-enable-notifications t
        mu4e-enable-mode-line t
        mu4e-headers-skip-duplicates t
        ;; rename files when moving, needed for mbsync
        mu4e-index-update-in-background t
        mu4e-change-filenames-when-moving t
        mu4e-compose-dont-reply-to-self t
        mu4e-compose-format-flowed t
        fill-flowed-encode-column 5000
        ;; mu4e-user-mail-address-list '("as12528@my.bristol.ac.uk")
        ;; mu4e-user-mail-address-list '("scannell.aidan@gmail.com" "as12528@my.bristol.ac.uk")
        mu4e-user-mail-address-list '("scannell.aidan@gmail.com"
                                      "as12528@my.bristol.ac.uk"
                                      "as12528@bristol.ac.uk"
                                      "Aidan2.Scannell@live.uwe.ac.uk"
                                      "aidan.scannell@brl.ac.uk"
                                      "aidanscannell@btinternet.com")
        mu4e-compose-complete-only-personal t
        mu4e-enable-async-operations t
        org-mu4e-link-query-in-headers-mode nil
        org-mu4e-convert-to-html t
        ;; customize the reply-quote-string
        message-citation-line-formt "On %a %d %b %Y at %R, %f wrote:\n"
        ;; choose to use the formatted string
        message-citation-line-function 'message-insert-formatted-citation-line

        ;; every new email composition gets its own frame!
        ;; mu4e-compose-in-new-frame t
        )

  ;; (setq smtpmail-smtp-server "smtp.gmail.com"
  ;;       smtpmail-smtp-service 587
  ;;       ;; smtpmail-smtp-service 465
  ;;       smtpmail-queue-mail nil
  ;;       smtpmail-queue-dir "~/Maildir/queue/cur"
  ;;       send-mail-function 'smtpmail-send-it
  ;;       message-send-mail-function 'smtpmail-send-it
  ;;       mu4e-sent-messages-behavior 'delete
  ;;       mail-envelope-from 'header
  ;;       mail-user-agent 'mu4e-user-agent)

  (setq smtpmail-smtp-service 587
        smtpmail-queue-mail nil
        send-mail-function 'smtpmail-send-it
        message-send-mail-function 'smtpmail-send-it
        mail-user-agent 'mu4e-user-agent)


  (setq message-send-mail-function 'smtpmail-send-it)

  (defun mu4e-message-maildir-matches (msg rx)
    (string-match rx (mu4e-message-field msg :maildir)))

  ;; http://xahlee.blogspot.com/2010/09/elisp-read-file-content-in-one-shot.html
  ;; we'll use this to read your different signatures from files
  (defun get-string-from-file (filePath)
    "Return FILEPATH's file content."
    (with-temp-buffer
      (insert-file-contents filePath)
      (buffer-string)))

  ;; set this to nil so signature is not included by default
  ;; you can include in message with C-c C-w
  (setq mu4e-compose-signature-auto-include 't)
  (setq mu4e-compose-signature (with-temp-buffer
                                 (insert-file-contents "~/Maildir/gmail/.signature")
                                 (buffer-string)))
  ;; message-signature-file NOT used by mu4e
  (setq message-signature-file "~/Maildir/gmail/.signature")

  (setq smtpmail-debug-info t)

  (setq
   ;; mu4e-context-policy 'pick-first
   ;; mu4e-compose-context-policy 'pick-first
   mu4e-contexts
   `(
     ;; ,(make-mu4e-context
     ;;   :name "UoB"
     ;;   :enter-func (lambda () (mu4e-message "Switch to as12528@my.bristol.ac.uk"))
     ;;   ;; leave-func not defined
     ;;   :match-func (lambda (msg) (when msg (mu4e-message-maildir-matches msg "^/home/")))
     ;;   :vars '(
     ;;           ;; (smtpmail-smtp-server . "smtp.gmail.com")
     ;;           (smtpmail-smtp-user "as12528")
     ;;           (smtpmail-local-domain "my.bristol.ac.uk")
     ;;           (smtpmail-default-smtp-server "smtp.office365.com")
     ;;           (smtpmail-smtp-server "smtp.office365.com")
     ;;           (smtpmail-smtp-service 587)
     ;;           (mu4e-sent-folder . "~/Maildir/UoB/Sent")
     ;;           (mu4e-trash-folder . "~/Maildir/UoB/Trash")
     ;;           ;; (mu4e-refile-folder . "/home/[Gmail]/All Mail")
     ;;           (mu4e-refile-folder . "~/Maildir/UoB/INBOX")
     ;;           ;; (mu4e-drafts-folder . "/home/[Gmail]/Drafts")
     ;;           (mu4e-drafts-folder . "~/Maildir/UoB/Drafts")
     ;;           (user-mail-address . "as12528@my.bristol.ac.uk")
     ;;           (user-full-name . "Aidan Scannell")
     ;;           ;; (smtpmail-smtp-user . "to.plotnick@gmail.com")
     ;;           ;; (message-signature-file . "~/.mail/home/.signature")
     ;;           (mu4e-compose-signature . (concat "Thanks,\n" "Aidan\n"))))
     ,(make-mu4e-context
         :name "gmail"
         :enter-func (lambda () (mu4e-message "Switch to scannell.aidan@gmail.com"))
         ;; leave-func not defined
         :match-func (lambda (msg) (when msg (mu4e-message-maildir-matches msg "^/gmail/")))
         :vars '((smtpmail-smtp-server . "smtp.gmail.com")
                  (mu4e-drafts-folder . "/gmail/[Gmail].Drafts")
                  (mu4e-sent-folder . "/gmail/[Gmail].Sent Mail")
                  (mu4e-trash-folder . "/gmail/[Gmail].Trash")
                  (mu4e-refile-folder . "/gmail/[Gmail].All Mail")
                  (user-mail-address . "scannell.aidan@gmail.com")
                  (user-full-name . "Aidan Scannell")
                  (smtpmail-smtp-user . "scannell.aidan")
                  (smtpmail-local-domain . "gmail.com")
                  (smtpmail-smtp-service . 587)
                  ))
     ,(make-mu4e-context
         :name "UoB-gmail"
         :enter-func (lambda () (mu4e-message "Switch to as12528@my.bristol.ac.uk"))
         ;; leave-func not defined
         :match-func (lambda (msg) (when msg (mu4e-message-maildir-matches msg "^/UoB-gmail/")))
         :vars '(
                  ;; (smtpmail-smtp-server . "smtp.my.bristol.ac.uk")
                  (smtpmail-smtp-server . "smtp.gmail.com")
                  (mu4e-drafts-folder . "/UoB-gmail/[Gmail].Drafts")
                  (mu4e-sent-folder . "/UoB-gmail/[Gmail].Sent Mail")
                  (mu4e-trash-folder . "/UoB-gmail/[Gmail].Trash")
                  (mu4e-refile-folder . "/UoB-gmail/[Gmail].All Mail")
                  (user-mail-address . "as12528@my.bristol.ac.uk")
                  (user-full-name . "Aidan Scannell")
                  (smtpmail-smtp-user . "as12528@my.bristol.ac.uk")
                  (smtpmail-smtp-service . 587)
                  ))
     ,(make-mu4e-context
       :name "uob"
       :enter-func (lambda () (mu4e-message "Switch to as12528@bristol.ac.uk"))
       ;; leave-func not defined
       :match-func (lambda (msg) (when msg (mu4e-message-maildir-matches msg "^/UoB/")))
       :vars '(
               (smtpmail-smtp-server . "smtp.office365.com")
               (mu4e-drafts-folder . "/UoB/Drafts")
               (mu4e-sent-folder . "/UoB/Sent Mail")
               (mu4e-trash-folder . "/UoB/Trash")
               (mu4e-refile-folder . "/UoB/All Mail")
               (user-mail-address . "as12528@bristol.ac.uk")
               (user-full-name . "Aidan Scannell")
               (smtpmail-smtp-user . "as12528@bristol.ac.uk")
               (smtpmail-stream-type . starttls)
               (smtpmail-smtp-service . 25)
               ))
     ,(make-mu4e-context
       :name "yahoo"
       :enter-func (lambda () (mu4e-message "Switch to Yahoo"))
       ;; leave-func not defined
       :match-func (lambda (msg) (when msg (mu4e-message-maildir-matches msg "^/yahoo/")))
       :vars '(
               (smtpmail-smtp-server . "smtp.mail.yahoo.com")
               (mu4e-drafts-folder . "/yahoo/Draft")
               (mu4e-sent-folder . "/yahoo/Sent")
               (mu4e-trash-folder . "/yahoo/Trash")
               (mu4e-refile-folder . "/yahoo/All Mail")
               (user-mail-address . "aidanscannell@btinternet.com")
               (user-full-name . "Aidan Scannell")
               (smtpmail-smtp-user . "aidanscannell@btinternet.com")
               (smtpmail-smtp-service . 587)
               ))
     ,(make-mu4e-context
       :name "wuwe"
       :enter-func (lambda () (mu4e-message "Switch to UWE"))
       ;; leave-func not defined
       :match-func (lambda (msg) (when msg (mu4e-message-maildir-matches msg "^/UWE/")))
       :vars '(
               (smtpmail-smtp-server . "smtp.office365.com")
               (mu4e-drafts-folder . "/UWE/Draft")
               (mu4e-sent-folder . "/UWE/Sent")
               (mu4e-trash-folder . "/UWE/Trash")
               (mu4e-refile-folder . "/UWE/All Mail")
               (user-mail-address . "Aidan2.Scannell@live.uwe.ac.uk")
               (user-full-name . "Aidan Scannell")
               (smtpmail-smtp-user . "Aidan2.Scannell@live.uwe.ac.uk")
               (smtpmail-smtp-service . 25)
               ;; (smtpmail-smtp-service . 587)
               ))
     ,(make-mu4e-context
       :name "BRL"
       :enter-func (lambda () (mu4e-message "Switch to BRL"))
       ;; leave-func not defined
       :match-func (lambda (msg) (when msg (mu4e-message-maildir-matches msg "^/BRL/")))
       :vars '(
               (smtpmail-smtp-server . "smtp.office365.com")
               (mu4e-drafts-folder . "/BRL/Drafts")
               (mu4e-sent-folder . "/BRL/Sent Items")
               (mu4e-trash-folder . "/BRL/Deleted Items")
               (mu4e-refile-folder . "/BRL/All Mail")
               (user-mail-address . "aidan.scannell@brl.ac.uk")
               (user-full-name . "Aidan Scannell")
               (smtpmail-smtp-user . "aidan.scannell@brl.ac.uk")
               (smtpmail-stream-type . starttls)
               ;; (smtpmail-smtp-service . 25)
               (smtpmail-smtp-service . 587)
               ))


   ;; ,(make-mu4e-context
   ;;     :name "home"
   ;;     :enter-func (lambda () (mu4e-message "Switch to agzam.ibragimov@gmail.com"))
   ;;     ;; leave-func not defined
   ;;     :match-func (lambda (msg) (when msg (mu4e-message-maildir-matches msg "^/home/")))
   ;;     :vars '((smtpmail-smtp-server . "smtp.gmail.com")
   ;;             (mu4e-sent-folder . "/home/[Gmail]/Sent Mail")
   ;;             (mu4e-trash-folder . "/home/[Gmail]/Trash")
   ;;             (mu4e-refile-folder . "/home/[Gmail]/All Mail")
   ;;             (mu4e-drafts-folder . "/home/[Gmail]/Drafts")
   ;;             (user-mail-address . "agzam.ibragimov@gmail.com")
   ;;             (user-full-name . "Ag Ibragimov")
   ;;             (smtpmail-smtp-user . "to.plotnick@gmail.com")
   ;;             (message-signature-file . "~/.mail/home/.signature")
   ;;             (mu4e-compose-signature . (concat "Thanks,\n" "Ag\n"))))
     ;; ,(make-mu4e-context
     ;;   :name "work"
     ;;   :enter-func (lambda () (mu4e-message "Switch to work"))
     ;;   ;; leave-func not defined
     ;;   :match-func (lambda (msg) (when msg (mu4e-message-maildir-matches msg "^/work/")))
     ;;   :vars '((smtpmail-smtp-server . "smtp.office365.com")
     ;;           (mu4e-sent-folder . "/work/Sent Items")
     ;;           (mu4e-trash-folder . "/work/Deleted Items")
     ;;           (mu4e-refile-folder . "/work/Archive")
     ;;           (mu4e-drafts-folder . "/work/Drafts")
     ;;           (user-mail-address . "ag@dividendfinance.com")
     ;;           (user-full-name . "Ag Ibragimov")
     ;;           (smtpmail-smtp-user . "ag.ibragimov@dividendfinance.com")
     ;;           (message-signature-file . "~/.mail/work/.signature")
     ;;           (mu4e-compose-signature . (concat "-----\nAg Ibragimov\nSoftware Developer | Dividend Finance\ndividendnow.com"))))
     ))

  (add-hook 'mu4e-compose-mode-hook #'turn-off-auto-fill)
  (add-hook 'mu4e-compose-mode-hook #'spacemacs/toggle-visual-line-navigation-on)
  (add-hook 'mu4e-view-mode-hook 'mu4e-prepare-view)
  (add-hook 'mu4e-compose-mode-hook 'mu4e-prepare-view)

  (setq mu4e-view-actions
        '(("capture message" . mu4e-action-capture-message)
          ("xwidget" . mu4e-action-view-with-xwidget)
          ("view in browser" . mu4e-action-view-in-browser)
          ("show this thread" . mu4e-action-show-thread)
          ("View as pdf" . mu4e-action-view-as-pdf)
          ("find in mailing-list" . mu4e-action-find-in-mailing-list)
          ("open in Gmail" . mu4e-action-open-in-gmail)))

  (add-to-list 'mu4e-headers-actions '("find in mailing-list" . mu4e-action-find-in-mailing-list))
  (add-to-list 'mu4e-headers-actions '("open in Gmail" . mu4e-action-open-in-gmail))

  (add-to-list
   'mu4e-header-info-custom
   '(:foldername . (:name "Folder information"
                          :shortname "Folder"
                          :help "Message short storage information"
                          :function (lambda (msg)
                                      (let ((shortaccount)
                                            (maildir (or (mu4e-message-field msg :maildir) ""))
                                            (mailinglist (or (mu4e-message-field msg :mailing-list) "")))
                                        (if (not (string= mailinglist ""))
                                            (setq mailinglist (mu4e-get-mailing-list-shortname mailinglist)))
                                        (when (not (string= maildir ""))
                                          (setq shortaccount
                                                (substring
                                                 (replace-regexp-in-string "^/\\(\\w+\\)/.*$" "\\1" maildir)
                                                 0 1))
                                          (setq maildir (replace-regexp-in-string ".*/\\([^/]+\\)$" "\\1" maildir))
                                          (if (> (length maildir) 15)
                                              (setq maildir (concat (substring maildir 0 14) "…")))
                                          (setq maildir (concat "[" shortaccount "] " maildir)))
                                        (cond
                                         ((and (string= maildir "")
                                               (not (string= mailinglist "")))
                                          mailinglist)
                                         ((and (not (string= maildir ""))
                                               (string= mailinglist ""))
                                          maildir)
                                         ((and (not (string= maildir ""))
                                               (not (string= mailinglist "")))
                                          (concat maildir " (" mailinglist ")"))
                                         (t "")))))))

  (defun ed/get-mail-header (header-name path)
    (replace-regexp-in-string
     "[ \t\n]*$"
     ""
     (shell-command-to-string
      (concat "/usr/bin/sed -n '/^" header-name ":/I{:loop t;h;n;/^ /{H;x;s/\\n//;t loop};x;p}' '" path "' | sed -n 's/^" header-name ": \\(.*\\)$/\\1/Ip'"))))

  (defun ed/get-origin-mail-system-header (msg)
    (let ((path (or (mu4e-message-field msg :path) "")))
      (if (or (string= path "")
              (not (file-readable-p path)))
          "no path found"
        (let ((xmailer (ed/get-mail-header "x-mailer" path))
              (useragent (ed/get-mail-header "user-agent" path)))
          (if (string= xmailer useragent)
              xmailer
            (cond
             ((string= xmailer "") useragent)
             ((string= useragent "") xmailer)
             (t (concat xmailer " (xmailer)\n" useragent " (user-agent)"))))))))

  (add-to-list 'mu4e-header-info-custom
               '(:useragent . (:name "User-Agent"
                                     :shortname "UserAgt."
                                     :help "Mail client used by correspondant"
                                     :function ed/get-origin-mail-system-header)))

  ;; headers view should be at 20 percent of frame height
  (setq mu4e-headers-visible-lines (truncate (* (frame-height) 0.2)))
  (setq mu4e-headers-fields
        '(
          ;; (:flags . 5)
          ;; (:human-date . 22)
          ;; (:size . 6)
          ;; (:foldername . 25)
          ;; (:from-or-to . 25)
          ;; (:subject . nil))
          (:human-date . 22)
          (:flags . 5)
          (:from-or-to . 25)
          (:subject . nil))
        mu4e-headers-show-thread nil
        mu4e-headers-include-related nil
        mu4e-use-fancy-chars t
        mu4e-headers-date-format "%a %d %b %Y %H:%M"
        mu4e-headers-time-format "%H:%M"
        mu4e-view-fields '(:from :to :cc :subject :flags :date :maildir :mailing-list :tags :useragent :attachments :signature :decryption))

  (setq mu4e-split-view 'vertical)
  (setq mu4e-headers-visible-columns 130)

  (add-hook 'mu4e-view-mode-hook #'spacemacs/toggle-visual-line-navigation-on)
  (mu4e-maildirs-extension)

  (add-hook 'mu4e-main-mode-hook #'mail/set-mu4e-keys)
  (add-hook 'mu4e-main-mode-hook (lambda () (mu4e-update-mail-and-index t)))

  (add-hook 'mu4e-headers-mode-hook #'mail/set-mu4e-keys)
  (add-hook 'mu4e-view-mode-hook #'mail/set-mu4e-keys))


;;; packages.el ends here
