;;; packages.el --- as-org layer packages file for Spacemacs.
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
;; added to `as-org-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `as-org/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `as-org/pre-init-PACKAGE' and/or
;;   `as-org/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:
(defconst as-org-packages '(org
                            ;; org-pomodoro
                            ;; ox-reveal
                            ;; clocker
                            ;; org-noter
                            ;; (latex-fragments :location local)
                            (org-present :excluded t)
                            (org-journal :excluded t)
                            (org-brain :excluded t)))

(defun as-org/post-init-org ()
  ;; (with-eval-after-load 'evil-org-mode
    ;; Temporary fix for `o` on collapsed sections
    ;; until https://github.com/syl20bnr/spacemacs/pull/8200 is fixed
  ;;  (defun evil-org-eol-call (fun)
  ;;    "Go to end of line and call provided function.
  ;;    FUN function callback"
  ;;    (end-of-visible-line)
  ;;    (funcall fun)
  ;;    (evil-append nil)))

  (with-eval-after-load 'org

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Org mode settings
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (setq
      org-directory "/Users/aidanscannell/Dropbox/org/"
      org-default-notes-file "~/Dropbox/org/notes.org"
      org-contacts-files '("~/Dropbox/org/contacts.org")
      org-todo-keywords '((sequence "SOMEDAY" "TODO" "PROGRESS" "|" "DONE" "DELEGATED" "CANCELLED"))
      org-bullets-bullet-list '("■" "◆" "▲" "▶")
      org-startup-indented t ;; Keep the indentation well structured
      org-agenda-files '("/Users/aidanscannell/Dropbox/org/agenda") ;; set the agenda files.
      org-agenda-files '("/Users/aidanscannell/Dropbox/org/"))

      ;; add the per project todo.org files to the agenda
      (with-eval-after-load 'org-agenda
        (require 'org-projectile)
        (mapcar (lambda (file)
                    (when (file-exists-p file)
                      (push file org-agenda-files)))
                  (org-projectile-todo-files)))

      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; Org-contacts template
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      (defvar my/org-contacts-template "* %^{Name}
        :PROPERTIES:
        :ADDRESS: %^{Address}
        :BIRTHDAY: %^{dd-mm-yyyy}
        :EMAIL: %^{Email}
        :NOTE: %^{NOTE}
        :END:" "Template for org-contacts.")

      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; Meeting templates
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      (defvar my/org-phd-meeting-template "** %^{meeting name}
        %^g %? SCHEDULED: %t
        *Attendees:*
        - [X] Aidan Scannell
        - [ ] Arthur Richards
        - [ ] Carl Henrik
        *Agenda:*
        -
        -
        *Notes:*
        " "PhD Meeting Template")
      (defvar my/org-meeting-template "** %^{meeting name}
        %^g
        %?
        SCHEDULED: %t
        *Attendees:*
        - [X] Aidan Scannell
        - [ ]
        *Agenda:*
        -
        -
        *Notes:*
        " "Meeting Template")


      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; Org-capture templates
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      (setq org-capture-templates
        `(
          ("c" "Contact - Colleagues" entry (file+headline "~/Dropbox/org/contacts.org" "Colleagues"), my/org-contacts-template)
          ("f" "Contact - Friends & Family" entry (file+headline "~/Dropbox/org/contacts.org" "Friends & Family"), my/org-contacts-template)
          ("p" "Contact - People" entry (file+headline "~/Dropbox/org/contacts.org" "People"), my/org-contacts-template)

          ;; ("mp" "PhD Meeting" entry (file+headline "~/Dropbox/org/agenda/calendar.org" "Meetings"), my/org-phd-meeting-template)
          ;; ("m" "Calendar" entry (file+headline "~/Dropbox/org/agenda/calendar.org" "Meetings"),)
          ;; ("s" "Scheduled TODO" entry (file+headline as/gtd "Collect")
          ;; "* TODO %? %^G \nSCHEDULED: %^t\n  %U" :empty-lines 1)

          ("m" "Schedule Meeting" entry (file+headline "~/Dropbox/org/agenda/calendar.org" "Meetings"), my/org-meeting-template)
          ("d" "Deadline" entry (file+headline "~/Dropbox/org/agenda/calendar.org" "Deadlines")
           "** %^{deadline name}\n %^g %? \n SCHEDULED: %t \n DEADLINE: %t")
          ("e" "Schedule Event" entry (file+headline "~/Dropbox/org/agenda/calendar.org" "Event")
           "** %^{event name}\n %^g %? \n SCHEDULED: %t")

          ("M" "Schedule PhD Meeting" entry (file+headline "~/Dropbox/org/agenda/uni.org" "Meetings"), my/org-phd-meeting-template)
          ("D" "Deadline" entry (file+headline "~/Dropbox/org/agenda/uni.org" "Deadlines")
           "** %^{deadline name}\n %^g %? \n SCHEDULED: %t \n DEADLINE: %t")
          ("E" "Schedule PhD Event" entry (file+headline "~/Dropbox/org/agenda/uni.org" "Event")
           "** %^{event name}\n %^g %? \n SCHEDULED: %t")

          ;; ("p" "Pick a file" entry (file+function "~/Dropbox/org/notes/ideas.org" org-ask-location))
          ("n" "Note" entry (file "~/Dropbox/org/notes.org"), "** %^{Note...}")

          ;; ("t" "To-do" entry (file+headline "~/Dropbox/org/inbox.org" "Tasks")
          ;; "** TODO %^{Task Description}\nCreated From: %a\n" :clock-in t :clock-resume t :prepend t)

          ;; ("l" "Link" "* TODO %a %? %^G\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n")
          )
        )

        ;; Populates only the EXPORT_FILE_NAME property in the inserted headline.
        (defun org-hugo-new-subtree-post-capture-template ()
          "Returns `org-capture' template string for new Hugo post.
      See `org-capture-templates' for more information."
          (let* ((title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
                (fname (org-hugo-slug title)))
            (mapconcat #'identity
                      `(
                        ,(concat "* TODO " title)
                        ":PROPERTIES:"
                        ":EXPORT_FILE_NAME: index.md"
                        ,(concat ":EXPORT_HUGO_BUNDLE: " fname)
                        ":EXPORT_AUTHOR: Aidan Scannell"
                        ":END:"

                        ;; ,(concat "#+title: " title)
                        ;; "#+hugo_auto_set_lastmod: t"
                        "#+hugo_tags: machine-learning"
                        "#+hugo_categories: "
                        "%?\n")          ;Place the cursor here finally
                      "\n")))

        (add-to-list 'org-capture-templates
                    '("h"                ;`org-capture' binding + h
                      "Hugo post"
                      entry
                      ;; It is assumed that below file is present in `org-directory'
                      ;; and that it has a "Blog Ideas" heading. It can even be a
                      ;; symlink pointing to the actual location of all-posts.org!
                      (file+olp "all-posts.org" "Blog Ideas")
                      (function org-hugo-new-subtree-post-capture-template)))

      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; Org-projectile config and templates
      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; create org capture template for linking todo to source code
      ;; (push (org-projectile-project-todo-entry :capture-template "* TODO %?\n %i\n %t\n %a" :capture-heading "Create linked org-projectile TODO"  :capture-character "l") org-capture-templates)
      ;; (push (org-projectile-project-todo-entry) org-capture-templates)

      ;; (setq org-capture-templates
      ;;       '(
              ;; ("t" "TODO" entry (file+headline "~/Dropbox/org/inbox.org" "PhD"))
              ;; '(("t" "TODO" entry (file+headline as/gtd "Collect")
              ;; "* TODO %? %^G \n  %U" :empty-lines 1)
              ;; ("s" "Scheduled TODO" entry (file+headline as/gtd "Collect")
              ;; "* TODO %? %^G \nSCHEDULED: %^t\n  %U" :empty-lines 1)
              ;; ("d" "Deadline" entry (file+headline as/gtd "Collect")
              ;; "* TODO %? %^G \n  DEADLINE: %^t" :empty-lines 1)
              ;; ("p" "Priority" entry (file+headline as/gtd "Collect")
              ;; "* TODO [#A] %? %^G \n  SCHEDULED: %^t")
              ;; ("a" "Appointment" entry (file+headline as/gtd "Collect")
              ;;  "* %? %^G \n  %^t")
              ;; ("l" "Link" entry (file+headline "~/Dropbox/org/project-todo.org" "Hello")
              ;;  "* TODO %a %? %^G\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n")
              ;; ("l" "Create linked org-projectile TODO"
              ;;  "* TODO %?\n %i\n %t\n %a")
              ;; ("n" "Note" entry (file+headline as/gtd "Notes")
              ;; "* %? %^G\n%U" :empty-lines 1)

            ;; (c) Contact template
    ;;   ("c" "Contact" entry (file+headline "~/Dropbox/org/contacts.org" "People")
    ;;     "* %^{First} %^{Last}%?
    ;;   :LOGBOOK:
    ;;   - State \"\"           from \"\"           %U
    ;;   :END:
    ;; ** Wish List
    ;;   :LOGBOOK:
    ;;   - State \"TODO\"       from \"\"           %U
    ;;   :END:
    ;; ** Tasks
    ;;   :LOGBOOK:
    ;;   - State \"TODO\"       from \"\"           %U
    ;;   :END:
    ;; *** TODO Wish %\\1 %\\2 a Happy Birthday
    ;;     DEADLINE: %^{Birthday}t
    ;;     :PROPERTIES:
    ;;     :Via:
    ;;     :Note:
    ;;     :END:
    ;;     :LOGBOOK:
    ;;     - State \"TODO\"       from \"\"           %U
    ;;     :END:
    ;; **** TODO Buy %\\1 %\\2 a Birthday Gift
    ;;     SCHEDULED: %^{Buy Gift By}t DEADLINE: %^{Birthday}t
    ;;     :PROPERTIES:
    ;;     :Via:
    ;;     :Note:
    ;;     :END:
    ;;     :LOGBOOK:
    ;;     - State \"TODO\"       from \"\"           %U
    ;;     :END:
    ;; *** TODO Buy %\\1 %\\2 a Christmas Gift
    ;;     SCHEDULED: <2016-12-01 Tue +1y> DEADLINE: <2016-12-25 Fri +1y>
    ;;     :PROPERTIES:
    ;;     :Via:
    ;;     :Note:
    ;;     :END:
    ;;     :LOGBOOK:
    ;;     - State \"TODO\"       from \"\"           %U
    ;;     :END:" :empty-lines 1)

  )


    ;; (setq
    ;;  org-read-date-popup-calendar t
    ;;  org-capture-templates
    ;;       '(("t" "todo" entry (file+olp+datetree "~/Dropbox/org/tasks.org")
    ;;          "* TODO %i %?\nSCHEDULED: %t\n")

    ;;         ("T" "Today" entry (file+olp+datetree "~/Dropbox/org/tasks.org")
    ;;          "* TODO %?\nSCHEDULED: %(org-read-date t nil nil nil (current-time))\n")

    ;;         ("i" "Immediate" entry (file+olp+datetree "~/Dropbox/org/tasks.org")
    ;;          "* ONGOING %i %?" :clock-in t :clock-resume t :clock-keep t)

    ;;         ("s" "Someday" entry (file+headline "~/Dropbox/org/tasks.org" "Tasks")
    ;;          "* TODO %?\nSCHEDULED: %(org-read-date t nil nil nil (current-time) \"+1m\")\n")

    ;;         ("c" "Code Snippet" entry (file+olp+datetree "~/Dropbox/org/tasks.org")
    ;;          ;; Prompt for tag and language
    ;;          "* %u  %?\n\t%F\n\t#+BEGIN_SRC %^{language}\n\t\t%i\n\t#+END_SRC")

    ;;         ("y" "Yakety" entry (file "~/Dropbox/org/yakety.org")
    ;;          "* TODO  %?\n SCHEDULED: %^u\n :LOGBOOK:\n  - State \"TODO\" from %U\n :END:")

    ;;         ("j" "Journal" entry (file+olp+datetree "~/Dropbox/org/journal.org")
    ;;          "* %u %?"
    ;;          :time-prompt t)

    ;;         ("z" "Currently clocked-in" item (clock)
    ;;          "Note taken on %U \\\ \n%?")))

    ;; (setq
    ;;  org-directory "~/Dropbox/org"
    ;;  ort/prefix-arg-directory "~/Dropbox/org"
     ;; org-default-notes-file "~/Dropbox/org/notes.org"
    ;;  org-show-notification-handler 'message
    ;;  org-id-locations-file (concat org-directory "/.org-id-locations"))

    ;;  ;;;; ---- headings ----
    ;; (setq
    ;;  org-bullets-bullet-list '("⏣" "◉" "●" "•" "‣" "⋄" "∙")
    ;;  org-goto-interface 'outline-path-completion  ; org-goto C-c C-j like in org-refile
    ;;  org-startup-folded t
    ;;  org-blank-before-new-entry nil
    ;;  org-ellipsis " ↴"
    ;;  org-M-RET-may-split-line '((headline))
    ;;  org-ctrl-k-protect-subtree t
    ;;  org-catch-invisible-edits 'smart
    ;;  org-use-property-inheritance nil
    ;;  org-hide-emphasis-markers t
    ;;  org-special-ctrl-a/e t
    ;;  org-tags-column -80
    ;;  org-startup-indented nil
    ;;  org-fontify-whole-heading-line t
    ;;  )

    ;; (add-hook 'org-reveal-start-hook 'end-of-visual-line)

    ;;  ;;;; ---- lists ----
    ;; (setq
    ;;  org-list-demote-modify-bullet '(("+" . "-") ("-" . "+") ("*" . "+"))
    ;;  org-list-allow-alphabetical t)

    ;;  ;;;; ---- agenda ----
    ;; (setq
    ;;  org-agenda-clockreport-parameter-plist '(:link t :maxlevel 5 :fileskip0 t :compact t :narrow 60)
    ;;  org-agenda-diary-file "~/Dropbox/org/journal.org"
    ;;  org-agenda-files "~/Dropbox/org/.agenda-files"
    ;;  org-agenda-follow-indirect t
    ;;  org-agenda-persistent-marks t
    ;;  org-agenda-skip-deadline-if-done t
    ;;  org-agenda-skip-scheduled-if-done t
    ;;  org-agenda-span 1
    ;;  org-agenda-start-with-clockreport-mode t
    ;;  org-agenda-start-with-follow-mode nil
    ;;  org-agenda-start-with-log-mode t)

    ;;  ;;;; ---- todo ----
    ;; (setq
    ;;  org-confirm-babel-evaluate nil
    ;;  org-todo-keywords '((sequence "TODO" "ONGOING" "DONE"))
    ;;  org-todo-keyword-faces '(("ONGOING" . "orange"))
    ;;  org-enforce-todo-dependencies t
    ;;  org-enforce-todo-checkbox-dependencies t
    ;;  org-hierarchical-todo-statistics t
    ;;  )

    ;; (defun org-summary-todo (n-done n-not-done)
    ;;   "Switch entry to DONE when all subentries are done, to TODO otherwise."
    ;;   (let (org-log-done org-log-states) ; turn off logging
    ;;     (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

    ;; (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

    ;;  ;;;; ---- tags ----
    ;; (setq org-fast-tag-selection-single-key t)

    ;;  ;;;; ---- src blocks ----
    ;; (setq
    ;;  org-src-window-setup 'other-window
    ;;  org-src-ask-before-returning-to-edit-buffer nil
    ;;  ;; org-src-preserve-indentation t
    ;;  )

    ;;  ;;;; ----- clocking ----
    ;; (setq
    ;;  org-clock-persist t
    ;;  org-clock-in-switch-to-state "ONGOING"
    ;;  org-clock-persist-query-resume nil
    ;;  org-clock-report-include-clocking-task t
    ;;  org-clock-out-remove-zero-time-clocks t
    ;;  org-clock-idle-time 10)

    ;; ;;;; To save the clock history across Emacs sessions, use
    ;; (org-clock-persistence-insinuate)

    ;;  ;;;; ----- export ----
    ;; (setq
    ;;  org-export-with-toc nil
    ;;  org-export-with-section-numbers nil)

    ;; ;;;; ----- abo-abo/org-download -------
    ;; (setq-default org-download-image-dir (concat org-directory "/images")
    ;;               org-download-heading-lvl nil
    ;;               org-download-image-org-width 500)

    ;; ;;;; ----- misc -------
    ;; (setq
    ;;  org-refile-use-outline-path 'file
    ;;  org-outline-path-complete-in-steps nil
    ;;  org-refile-targets '((nil :maxlevel . 3)
    ;;                       (org-agenda-files :maxlevel . 3))
    ;;  org-refile-allow-creating-parent-nodes 'confirm

    ;;  org-log-states-order-reversed nil
    ;;  org-reverse-note-order nil
    ;;  org-log-into-drawer t
    ;;  org-log-note 'time
    ;;  org-enable-github-support t
    ;;  org-enable-bootstrap-support t
    ;;  org-format-latex-options (plist-put org-format-latex-options :scale 2)
    ;;  org-format-latex-options (plist-put org-format-latex-options :background nil))

    ;; (add-to-list 'auto-mode-alist '("\\Dropbox/org/.*\.txt\\'" . org-mode))

    ;; ;;;; evilified state rebinds C-u in agenda
    ;; (defun override-evilified-keys ()
    ;;   (evil-define-key 'evilified org-agenda-mode-map "\C-u" 'universal-argument))
    ;; (add-hook 'org-agenda-mode-hook 'override-evilified-keys)

    ;; ;; (add-hook 'org-mode-hook 'flyspell-mode)
    ;; (add-hook 'org-mode-hook #'ag/org-mode-hook)
    ;; (add-hook 'org-mode-hook #'spacemacs/toggle-visual-line-navigation-on)
    ;; ;; (add-hook 'org-timer-done-hook (lambda () (spacemacs/alert "-- timer done! --")))

    ;; ;; (require 'ob-http)
    ;; ;; (require 'ob-clojure)
    ;; (require 'ob-ditaa)
    ;; (org-babel-do-load-languages
    ;;  'org-babel-load-languages
    ;;  '((emacs-lisp . t)
    ;;    (shell . t)
    ;;    (js . t)
    ;;    (clojure . t)
    ;;    (sql . t)
    ;;    (shell . t)
    ;;    (ditaa . t)
    ;;    (ruby . t)))

    ;; ;; I don't know any better way of determining path to ditaa, other than running `find / -name "ditaa*.jar" 2>/dev/null`
    ;; (setq org-ditaa-jar-path
    ;;       (pcase system-type
    ;;         ('gnu/linux "/usr/share/java/ditaa/ditaa-0_10.jar")
    ;;         ('darwin  "/usr/local/Cellar/ditaa/0.11.0/libexec/ditaa-0.11.0-standalone.jar")))

    ;; (add-hook 'org-babel-post-tangle-hook #'ag/set-tangled-file-permissions)
    ;; (add-hook 'org-mode-hook #'abbrev-mode)

    ;; ;;; Save tasks.org file automatically
    ;; (defun autosave-tasks-org (persp-name window)
    ;;   (when (string= persp-name "@Org")
    ;;     (save-some-buffers
    ;;      'no-confirm
    ;;      (lambda ()
    ;;        (string= (abbreviate-file-name buffer-file-name) "~/Dropbox/org/tasks.org")))))
    ;; (add-hook 'persp-before-switch-functions 'autosave-tasks-org)

    ;; (add-to-list 'org-modules 'org-tempo t)
    ;; )
  )

;; (defun ag-org/post-init-org-pomodoro ()
;;   (with-eval-after-load 'org-pomodoro
;;     (setq org-pomodoro-keep-killed-pomodoro-time t)
;;     (add-hook 'org-pomodoro-finished-hook #'pomodoro/on-finished-hook)
;;     (add-hook 'org-pomodoro-break-finished-hook #'pomodoro/on-break-over-hook)
;;     (add-hook 'org-pomodoro-killed-hook #'pomodoro/on-killed-hook)
;;     (add-hook 'org-pomodoro-started-hook #'pomodoro/on-started-hook)))

;; (defun ag-org/init-org-noter ()
;;   (use-package org-noter
;;     :config
;;     (setq org-noter-always-create-frame nil
;;           org-noter-insert-note-no-questions t
;;           org-noter-separate-notes-from-heading t
;;           org-noter-auto-save-last-location t
;;           org-noter-kill-frame-at-session-end t
;;           org-noter-notes-search-path '("~/Dropbox/org"
;;                                         "~/SyncMobile/Books"
;;                                         "~/SyncMobile/Books/Papers")
;;           org-noter-default-notes-file-names '("notes.org"))

;;     (defun org-noter-init-pdf-view ()
;;       (pdf-view-fit-page-to-window)
;;       (pdf-view-auto-slice-minor-mode)
;;       (run-at-time "0.5 sec" nil #'org-noter))

;;     (add-hook 'pdf-view-mode-hook 'org-noter-init-pdf-view)

;;     (defun org-noter-kill-the-note-buffer (&rest _ignore)
;;       (setq notes-fname (org-noter--session-notes-file-path org-noter--session))
;;       (setq pdf-fname (buffer-file-name (org-noter--session-doc-buffer org-noter--session)))
;;       (run-at-time "0.5 sec" nil (lambda ()
;;                                    (kill-buffer (get-file-buffer pdf-fname))
;;                                    (switch-to-buffer (get-file-buffer notes-fname))
;;                                    (kill-buffer (get-file-buffer notes-fname))
;;                                    (makunbound 'notes-fname)
;;                                    (makunbound 'pdf-fname))))

;;     (advice-add #'org-noter-kill-session :before 'org-noter-kill-the-note-buffer)))
;; (defadvice spacemacs/mode-line-prepare-left (around compile)
;;   (setq ad-return-value (clocker-add-clock-in-to-mode-line ad-do-it)))

;; (defun ag-org/init-clocker ()
;;   (use-package clocker
;;     :config
;;     (progn
;;       (setq clocker-keep-org-file-always-visible nil)
;;       (add-to-list 'clocker-skip-after-save-hook-on-file-name '(recentf))
;;       (ad-activate 'spacemacs/mode-line-prepare-left)
;;       (clocker-mode 1))))

;; (defun ag-org/init-ox-reveal ()
;;   (use-package ox-reveal
;;     :defer t
;;     :config
;;     (progn
;;       (setq
;;        org-enable-reveal-js-support t
;;        org-reveal-title-slide nil))))

;; (defun ag-org/init-latex-fragments ()
;;   (use-package latex-fragments
;;     :demand t
;;     :config
;;     (add-hook 'post-command-hook 'kk/org-latex-fragment-toggle t)))

;; (with-eval-after-load 'artist
;;   ;;; artist mode doesn't work properly in evil-mode
;;   ;;; see: https://github.com/syl20bnr/spacemacs/issues/4926
;;   (defun artist-mode-toggle-emacs-state ()
;;     (if artist-mode
;;         (evil-emacs-state)
;;       (evil-exit-emacs-state)))
;;   (unless (eq dotspacemacs-editing-style 'emacs)
;;     (add-hook 'artist-mode-hook #'artist-mode-toggle-emacs-state))

;;   ;;; right-click bound to middle click in artist mode
;;   (define-key artist-mode-map [(down-mouse-3)] 'artist-mouse-choose-operation))

;;; packages.el ends here
