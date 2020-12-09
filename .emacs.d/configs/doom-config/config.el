;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Aidan Scannell"
      user-mail-address "scannell.aidan@gmail.com")

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
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-dracula)
(setq doom-theme 'doom-laserwave)
;; (setq doom-theme 'doom-moonlight)
;; (setq doom-theme 'doom-monokai)
;; (setq doom-theme 'doom-wilmersdorf)
;; (setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")

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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(server-start)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org_ref_notes (concat (getenv "HOME") "/Dropbox/org/ref/notes")
      zot_bib (concat (getenv "HOME") "/Dropbox/org/ref/zotero-library.bib")
      org_ref_bib (concat (getenv "HOME") "/Dropbox/org/ref/org-ref-library.bib")
      org_notes (concat (getenv "HOME") "/Dropbox/org")
      personal-web-dir (concat (getenv "HOME") "/Developer/web-projects/academic-kickstart")
      personal-web-dir "~/Developer/web-projects/academic-kickstart"
      blog-post-dir (concat personal-web-dir "/org/all-posts.org")
      org-roam-directory org_ref_notes)
      ;; org-roam-directory org_notes)
(after! deft (setq deft-directory org_notes))

;; Disable formatter from lsp so that (format +onsave)
(setq +format-with-lsp nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(after! exec-path-from-shell
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  (when (daemonp)
    (exec-path-from-shell-initialize)))

;; add poetry to exec-path to avoid error
;; TODO where should this be fixed?
;; (after! )
;; (setq exec-path (append exec-path '("~/.poetry/bin")))

;; (setenv "PATH" (concat (getenv "PATH") exec-path))
;; (setenv "PATH" (concat (getenv "PATH") ":~/.poetry/bin"))

;; (after! pyenv
;;   (setenv "WORKON_HOME" "~/.pyenv/versions"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keybindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (map! :map python-mode-map
;;       :localleader
;;       :g "p" 'poetry
;;       :g "s" 'poetry-shell)
;; (map! :map python-mode-map
;;       :localleader
;;       :g "SPC m p" 'poetry
;;       :g "SPC m s" 'poetry-shell)

(after! workspaces
  (map! :leader
        (:prefix-map ("l" . "workspace"))))

(map! :map dired-mode-map
      :ng "h" #'dired-up-directory
      :ng "l" #'dired-find-file)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm-bibtex
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (after! helm-bibtex
;;   (map! :ng "SPC r" '+open/helm-bibtex))

(after! org
  (use-package! org-roam-bibtex
    :init
    ;; code here will run immediately
    :config
    ;; code here will run after the package is loaded
    :hook (org-roam-mode . org-roam-bibtex-mode))
  (setq
   bibtex-completion-notes-path org_ref_notes
   bibtex-completion-bibliography zot_bib
   bibtex-completion-pdf-field "file"
   bibtex-completion-additional-search-fields '(keywords) ;; add zotero tags to search
   bibtex-completion-notes-template-multiple-files
   (concat
    "#+TITLE: ${title}\n"
    "#+ROAM_KEY: cite:${=key=}\n"
    "* TODO Notes\n"
    ":PROPERTIES:\n"
    ":Custom_ID: ${=key=}\n"
    ":NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n"
    ":AUTHOR: ${author-abbrev}\n"
    ":JOURNAL: ${journaltitle}\n"
    ":DATE: ${date}\n"
    ":YEAR: ${year}\n"
    ":DOI: ${doi}\n"
    ":URL: ${url}\n"
    ":END:\n\n")
   ))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LaTeX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(after! reftex
  (setq reftex-default-bibliography zot_bib))
;; (setq reftex-default-bibliography "~/Dropbox/org/ref/mendeley/library.bib"))

(after! org
  ;; Setup org-ref
  (use-package! org-ref
    :config
    (setq org-ref-default-bibliography '(zot_bib)))

  ;; remove hyperref meta data from exported pdf files (needed for anonymity)
  (setq org-latex-with-hyperref nil)

  ;; Import ignore-headlines to allow a headline (but not its children) to
  ;; be ignored.  Any headline tagged with the 'ignore' tag will be
  ;; ignored (i.e. will not be included in the export), but any child
  ;; headlines will not be ignored (unless explicitly tagged to be
  ;; ignored), and will instead have their levels promoted by one.
  (use-package! ox-extra
    :config
    (ox-extras-activate '(latex-header-blocks ignore-headlines)))

  ;; Import ox-latex to get org-latex-classes and other funcitonality
  ;; for exporting to LaTeX from org
  (use-package! ox-latex
    :init
    ;; code here will run immediately
    :config
    ;; code here will run after the package is loaded
    (setq org-latex-pdf-process
          '("pdflatex -interaction nonstopmode -output-directory %o %f"
            "bibtex %b"
            "pdflatex -interaction nonstopmode -output-directory %o %f"
            "pdflatex -interaction nonstopmode -output-directory %o %f"))
    (setq org-latex-with-hyperref nil) ;; stop org adding hypersetup{author..} to latex export
    ;; (setq org-latex-prefer-user-labels t)

    ;; deleted unwanted file extensions after latexMK
    (setq org-latex-logfiles-extensions
          (quote ("lof" "lot" "tex~" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl" "xmpi" "run.xml" "bcf" "acn" "acr" "alg" "glg" "gls" "ist")))

    (unless (boundp 'org-latex-classes)
      (setq org-latex-classes nil))
    ;; (add-to-list 'org-latex-classes
    ;;              '("memoir"
    ;;                "\\documentclass{memoir}
    ;;       [NO-DEFAULT-PACKAGES]
    ;;       [PACKAGES]
    ;;       [EXTRA]
    ;;       \\newcommand{\\mboxparagraph}[1]{\\paragraph{#1}\\mbox{}\\\\}
    ;;       \\newcommand{\\mboxsubparagraph}[1]{\\subparagraph{#1}\\mbox{}\\\\}"
    ;;                ("\\chapter{%s}" . "\\chapter*{%s}")
    ;;                ("\\section{%s}" . "\\section*{%s}")
    ;;                ("\\subsection{%s}" . "\\subsection*{%s}")
    ;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
    ;;                ("\\mboxparagraph{%s}" . "\\mboxparagraph*{%s}")
    ;;                ("\\mboxsubparagraph{%s}" . "\\mboxsubparagraph*{%s}")))

    (add-to-list 'org-latex-classes
                 '("ieee"

                   "\\documentclass[conference]{IEEEtran}
%\\IEEEoverridecommandlockouts
% The preceding line is only needed to identify funding in the first footnote. If that is unneeded, please comment it out.
\\usepackage{amsmath,amssymb,amsfonts}
\\usepackage{algorithmic}
\\usepackage{graphicx}
\\usepackage{textcomp}
\\usepackage{xcolor}
\\def\\BibTeX{{\\rm B\\kern-.05em{\sc i\\kern-.025em b}\\kern-.08em
T\\kern-.1667em\\lower.7ex\\hbox{E}\\kern-.125emX}}"


                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
    (add-to-list 'org-latex-classes
                 '("beamer"
                   "\\documentclass\[presentation\]\{beamer\}"
                   ("\\section\{%s\}" . "\\section*\{%s\}")
                   ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
                   ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))

    (defun aidanscannell/org-save-and-export-latex ()
      (if (eq major-mode 'org-mode)
          (org-latex-export-to-latex)))
    )
  )

;; function to add newpage tag functionality to org exporter
(after! org
  (defun org/get-headline-string-element  (headline backend info)
    (let ((prop-point (next-property-change 0 headline)))
      (if prop-point (plist-get (text-properties-at prop-point headline) :parent))))

  (defun org/ensure-latex-clearpage (headline backend info)
    (when (org-export-derived-backend-p backend 'latex)
      (let ((elmnt (org/get-headline-string-element headline backend info)))
        (when (member "newpage" (org-element-property :tags elmnt))
          (concat "\\clearpage\n" headline)))))

  (add-to-list 'org-export-filter-headline-functions
               'org/ensure-latex-clearpage)
 )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ox-hugo for blog posts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package! ox-hugo
  :config
(defun org-hugo-new-subtree-post-capture-template ()
  "Returns `org-capture' template string for new Hugo post."
  (let* (;; http://www.holgerschurig.de/en/emacs-blog-from-org-to-hugo/
         (date (format-time-string (org-time-stamp-format :long :inactive) (org-current-time)))
         (title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
         (fname (org-hugo-slug title)))
    (mapconcat #'identity
               `(
                 ,(concat "* TODO " title)
                 ":PROPERTIES:"
                 ,":EXPORT_FILE_NAME: index.md"
                 ,":EXPORT_AUTHOR: Aidan Scannell"
                 ,":EXPORT_HUGO_CUSTOM_FRONT_MATTER: :markup goldmark"
                 ,(concat ":EXPORT_HUGO_BUNDLE: " fname)
                 ,(concat ":EXPORT_DATE: " date) ;Enter current date and time
                 ":END:"
                 "%?\n")                ;Place the cursor here finally
               "\n")))
(after! org-capture
  (add-to-list 'org-capture-templates
               '("h"                ;`org-capture' binding + h
                 "Hugo post"
                 entry
                 (file+olp blog-post-dir "Blog Ideas")
                 (function org-hugo-new-subtree-post-capture-template))))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-ref Mendeley
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (after! org
;;   (use-package! org-ref
;;     :init
;;     ;; code here will run immediately
;;     :config
;;     ;; code here will run after the package is loaded
;;     (setq org-ref-bibliography-notes "~/Dropbox/org/ref/notes.org"
;;           org-ref-default-bibliography '("~/Dropbox/org/ref/mendeley/library.bib") ;; mendeley bibfile
;;           ;; TODO org-ref-default-bibliography is where org-ref looks for citations (mendeley bibfile) AND
;;           ;; where it writes bib information to e.g. using org-ref-pdf
;;           org-ref-pdf-directory "~/Dropbox/org/ref/org-ref-pdfs/") ;; where org-ref saves papers

;;     ;; enable org-ref to open mendeley pdfs using pdf-tools
;;     (setq org-ref-get-pdf-filename-function 'org-ref-get-mendeley-filename)
;;     (defun my/org-ref-open-pdf-at-point ()
;;       "Open the pdf for bibtex key under point if it exists."
;;       (interactive)
;;       (let* ((results (org-ref-get-bibtex-key-and-file))
;;              (key (car results))
;;              (pdf-file (funcall org-ref-get-pdf-filename-function key)))
;;         (if (file-exists-p pdf-file)
;;             (find-file pdf-file)
;;           (message "No PDF found for %s" key))))
;;     (setq org-ref-open-pdf-function 'my/org-ref-open-pdf-at-point)
;;     (after! helm-bibtex
;;       (setq helm-bibtex-pdf-open-function 'my/org-ref-open-pdf-at-point))
;;     )
;;  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Email
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(after! mu4e
  (setq! mu4e-maildir "~/.local/share/mail"
         ;; mu4e-get-mail-command "mbsync --all --new --delete --flags --renew --pull --push --create --expunge --verbose"
         ;; mu4e-get-mail-command "offlineimap"
         mu4e-get-mail-command "mbsync -a"
         mu4e-change-filenames-when-moving t ;; needed for mbsync apparently
         ;; mu4e-view-use-gnus nil
         mu4e-update-interval 600
         mu4e-compose-signature-auto-include t
         mu4e-view-show-images t
         mu4e-view-show-addresses t
         mu4e-enable-notifications t
         mu4e-enable-mode-line t
         mu4e-headers-skip-duplicates t
         mu4e-index-update-in-background t
         mu4e-change-filenames-when-moving t ;; rename files when moving, needed for mbsync
         mu4e-compose-dont-reply-to-self t
         mu4e-compose-format-flowed t
         mu4e-use-fancy-chars t
         fill-flowed-encode-column 5000
         mu4e-user-mail-address-list '("scannell.aidan@gmail.com"
                                       "as12528@my.bristol.ac.uk"
                                       "as12528@bristol.ac.uk"
                                       "Aidan2.Scannell@live.uwe.ac.uk"
                                       "aidan.scannell@brl.ac.uk"
                                       "aidanscannell@btinternet.com")
         mu4e-compose-complete-only-personal t
         mu4e-enable-async-operations t
         org-mu4e-link-query-in-headers-mode nil
         ;; org-mu4e-convert-to-html t
         ;; customize the reply-quote-string
         message-citation-line-formt "On %a %d %b %Y at %R, %f wrote:\n"
         ;; choose to use the formatted string
         message-citation-line-function 'message-insert-formatted-citation-line

         ;; every new email composition gets its own frame!
         ;; mu4e-compose-in-new-frame t

         ;; enable inline images
         mu4e-view-show-images t

         ;; smtp
         smtpmail-smtp-service 587
         smtpmail-queue-mail nil
         send-mail-function 'smtpmail-send-it
         message-send-mail-function 'smtpmail-send-it
         mail-user-agent 'mu4e-user-agent
         message-send-mail-function 'smtpmail-send-it


         ;; mu4e-context-policy 'pick-first
         ;; mu4e-compose-context-policy 'pick-first
         mu4e-contexts
         `(
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
                     (mu4e-sent-folder . "/UoB/Sent Items")
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
           )

         )
  )
