(setq vc-follow-symlinks t)  ;; allow magit to follow symlinks
(spacemacs/toggle-transparency)
;; (setq projectile-git-submodule-command nil) ;;hack to fix project layouts

(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
;; (setq deft-directory "~/Dropbox/org")
(setq deft-directory "~/.dotfiles")
(setq deft-recursive nil)

;; (server-start)


;; Text takes up 85% of the buffer
;; (setq olivetti-body-width 0.85)
;; (setq olivetti-body-width 0.95)
;; ;; Starts text files (like .org .txt .md) in olivetti mode
;; (add-hook 'text-mode-hook 'olivetti-mode)


;; (custom-set-faces
;;  '(company-tooltip-common
;;    ((t (:inherit company-tooltip :weight bold :underline nil))))
;;  '(company-tooltip-common-selection
;;    ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))

;; (add-hook 'org-mode-hook (lambda ()
;;                            "Beautify Org Checkbox Symbol"
;;                            (push '("[ ]" .  "☐") prettify-symbols-alist)
;;                            (push '("[X]" . "☑" ) prettify-symbols-alist)
;;                            (push '("[-]" . "❍" ) prettify-symbols-alist)
;;                            (prettify-symbols-mode)))
;; (defface org-checkbox-done-text
;;   '((t (:foreground "#71696A")))
;;   "Face for the text part of a checked org-mode checkbox.")

(setq inhibit-startup-screen nil)

;; (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
;; (add-to-list 'default-frame-alist '(ns-appearance . light))

;; active Babel languages
(org-babel-do-load-languages
'org-babel-load-languages
'((R . t)
  (emacs-lisp . t)
  (python . t)
  (latex . t)
  (shell . t)
  ))

(setq org-confirm-babel-evaluate nil)
;; (setq org-confirm-babel-evaluate t)
(defun toggle-org-confirm-babel ()
  ;; (interactive)
  (if org-confirm-babel-evaluate
        ((setq org-confirm-babel-evaluate nil)
        (message "Disabled org confirm babel evaluate..."))
    (setq org-confirm-babel-evaluate 't)
    (message "Enabled org confirm babel evaluate...")))

(defun build-resume ()
  "This functions builds resume.json and outputs it in html format in websites static dir"
  (interactive)
  (shell-command "hackmyresume build resume_html.json TO ../static/resume.html -t node_modules/jsonresume-theme-stackoverflow")
  )

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; LaTeX bibliography config
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; folder where reftex searches for citations
(setq reftex-default-bibliography '("~/Dropbox/org/ref/mendeley/library.bib"))
(setq bibtex-dialect 'biblatex)

(setq org-ref-bibliography-notes "~/Dropbox/org/ref/notes.org"
      org-ref-default-bibliography '("~/Dropbox/org/ref/mendeley/library.bib") ;; mendeley bibfile
      ;; TODO org-ref-default-bibliography is where org-ref looks for citations (mendeley bibfile) AND
      ;; where it writes bib information to e.g. using org-ref-pdf
      org-ref-pdf-directory "~/Dropbox/org/ref/org-ref-pdfs/") ;; where org-ref saves papers

;; enable org-ref to open mendeley pdfs
(setq org-ref-get-pdf-filename-function 'org-ref-get-mendeley-filename)

;; open pdfs using pdf-tools
(defun my/org-ref-open-pdf-at-point ()
  "Open the pdf for bibtex key under point if it exists."
  (interactive)
  (let* ((results (org-ref-get-bibtex-key-and-file))
        (key (car results))
        (pdf-file (funcall org-ref-get-pdf-filename-function key)))
    (if (file-exists-p pdf-file)
        (find-file pdf-file)
      (message "No PDF found for %s" key))))

(setq org-ref-open-pdf-function 'my/org-ref-open-pdf-at-point)

(setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -output-directory %o %f"
        "bibtex %b"
        "pdflatex -interaction nonstopmode -output-directory %o %f"
        "pdflatex -interaction nonstopmode -output-directory %o %f"))

;; use pdf-tools to open pdf files from tex
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)

;; default page width behavior
(setq-default pdf-view-display-size 'fit-page)
;; combined with emacs-mac this gives good odf quality for retina display
(setq pdf-view-use-scaling t)

;; include latex snippets in org mode
;; (add-hook 'org-mode-hook #'latex-mode)
;; (add-hook 'org-mode-hook #'((yas-activate-extra-mode 'latex-mode)))
;; (yas-reload-all)
;; (add-hook 'org-mode-hook '((yas-activate-extra-mode 'latex-mode)))

;; hack to stop projectile failing with git submodules
(setq projectile-git-submodule-command nil)
;; (setq projectile-project-search-path '("~/Documents/phd-genral" "~/.dotfiles" "~/.dotfiles/spacemacs-base-new"))


(setq ranger-cleanup-on-disable t)
(setq ranger-cleanup-eagerly t)
(setq ranger-show-hidden t)


(spacemacs/set-leader-keys
  "ob" 'build-resume
  "oc" 'org-capture
  "oh" 'org-hugo-export-subtree
  "oa" 'org-agenda
  "op" 'org-contacts
  "os" 'org-save-all-org-buffers
  "oi" 'helm-org-agenda-files-headings)
