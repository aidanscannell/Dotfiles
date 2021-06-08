;;; packages.el --- org-config layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Aidan Scannell <aidanscannell@dr-robots-mbp>
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
;; added to `org-config-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `org-config/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `org-config/pre-init-PACKAGE' and/or
;;   `org-config/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst org-config-packages '(
                                org
                                ;; org-ref ;; not needed, loaded somehwere else
                                ;; org-pomodoro
                                ;; clocker
                                ;; org-noter
                                ;; (latex-fragments :location local)
                                (org-present :excluded t)
                                (org-journal :excluded t)
                                (org-brain :excluded t)))

(defun org-config/post-init-org ()
  (with-eval-after-load 'org
    ;; (add-to-list 'load-path "~/spacemacs/develop/elpa/26.3/develop/org-re-reveal-20200206.712")
    ;; (require 'ox-reveal)
    ;; (require 'ox-re-reveal)
    ;; (setq org-reveal-root "~/reveal.js")
    (setq org-re-reveal-root "~/reveal.js/")
    ;; (setq org-re-reveal-root "https://revealjs.com/")
    ;; (setq org-reveal-root "https://revealjs.com/")
    (defun toggle-org-reveal-export-on-save ()
      (interactive)
      (if (memq 'org-reveal-export-to-html after-save-hook)
          (progn
            (remove-hook 'after-save-hook 'org-reveal-export-to-html
                         t)
            (message "Disabled org reveal export to html on save for current buffer..."))
        (add-hook 'after-save-hook 'org-html-export-to-html
                  nil t)
        (message "Enabled org reveal export to html on save for current buffer...")))


    ;; Org mode settings
    (setq org-directory "/Users/aidanscannell/Dropbox/org/"
          org-default-notes-file "~/Dropbox/org/notes.org"
          org-contacts-files '("~/Dropbox/org/contacts.org")
          org-todo-keywords '((sequence "SOMEDAY" "TODO" "PROGRESS" "|"
                      "DONE" "DELEGATED" "CANCELLED"))
          ;; org-bullets-bullet-list '("■" "◆" "▲" "▶")
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
    (setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))

    ;; (require 'ox-latex)
    (add-to-list 'org-latex-classes
                 '("koma-article"
                   "\\documentclass{scrartcl}
                \\usepackage{microtype}
                \\usepackage{tgtermes}
                \\usepackage[scale=.9]{tgheros}
                \\usepackage{tgcursor}
                \\usepackage{paralist}
                \\newcommand{\\rc}{$^{14}C$}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


      ;; Org-contacts template
      (defvar my/org-contacts-template "* %^{Name}
        :PROPERTIES:
        :ADDRESS: %^{Address}
        :BIRTHDAY: %^{dd-mm-yyyy}
        :EMAIL: %^{Email}
        :NOTE: %^{NOTE}
        :END:" "Template for org-contacts.")

      ;; Meeting templates
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


      ;; Org-capture templates
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


    ))

;;; packages.el ends here
