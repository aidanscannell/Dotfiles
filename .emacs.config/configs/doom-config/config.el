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

;; (setq pdf-view-use-imagemagick t)
;; (setq pdf-view-use-imagemagick nil)
;; (setq pdf-view-use-scaling t)

;; (after! pdf-view
;;  (defvar +pdf--is-scaled-p nil)
;;  (defadvice! add-retina-support-a (orig-fn &rest args)
;;    :around #'pdf-util-frame-scale-factor
;;    (if (and pdf-view-use-scaling
;;             (memq (pdf-view-image-type) '(imagemagick image-io))
;;             (fboundp 'frame-monitor-attributes))
;;        (funcall orig-fn)
;;      ;; Add special support for retina displays on MacOS
;;      (if (and (eq (framep-on-display) 'ns)
;;               (not +pdf--is-scaled-p)
;;               EMACS27+)
;;          (progn
;;            (setq-local +pdf--is-scaled-p t)
;;            2)
;;        1)))
;;  (advice-remove #'pdf-util-frame-scale-factor  #'+pdf--util-frame-scale-factor-;; (= (pdf-util-frame-scale-factor) 2)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org Babel
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq +python-ipython-repl-args '("-i" "--simple-prompt" "--no-color-info"))
;; (setq org-babel-async-ipython t)
;; (require 'ox-ipynb)
;; (require 'ob-ipython)
;; (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (ipython . t)
   (org . t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org Agenda
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq org-agenda-custom-commands (list(quote
;;         ("z" "Super zaen view" (
;;            (agenda "" ((org-agenda-span 'day)
;;                        (org-agenda-property-list '("LOCATION" "TEACHER") )
;;                        (org-agenda-property-position 'where-it-fits)
;;                        (org-agenda-property-separator "|" )
;;                        (org-super-agenda-groups
;;                         '((:name "Today"
;;                                  :time-grid t
;;                                  :date today
;;                                  :todo "TODAY"
;;                                  :scheduled today
;;                                  :order 1)
;;                           (:name "Due Today"
;;                                  :deadline today
;;                                  :order 2)
;;                           (:name "Overdue"
;;                                  :deadline past
;;                                  :order 3)
;;                           (:name "Due Soon"
;;                                  :deadline future
;;                                  :order 4)
;;                           ))))
;;            (alltodo "" ((org-agenda-overriding-header "")
;;                         (org-agenda-property-list '("LOCATION" "TEACHER") )
;;                         (org-agenda-property-position 'where-it-fits)
;;                         (org-agenda-property-separator "|" )
;;                         (org-super-agenda-groups
;;                          '((:name "WORKING ON"
;;                                   :todo "WORKING"
;;                                   :order 0)
;;                            (:name "NEXT TO DO"
;;                                   :todo "NEXT"
;;                                   :order 1)
;;                            (:name "Important"
;;                                   :tag "Important"
;;                                   :priority "A"
;;                                   :order 6)
;;                            (:name "Waiting"
;;                                   :todo "WAITING"
;;                                   :order 9)
;;                            (:name "Assignments"
;;                                   :tag "Assignment"
;;                                   :order 10)
;;                            (:name "Pending"
;;                                   :todo "PENDING"
;;                                   :order 11)
;;                            (:name "Issues"
;;                                   :tag "Issue"
;;                                   :order 12)
;;                            (:name "Emacs"
;;                                   :tag "Emacs"
;;                                   :order 13)
;;                            (:name "Linux"
;;                                   :tag "Linux"
;;                                   :order 14)
;;                            (:name "Projects"
;;                                   :tag "Project"
;;                                   :order 91)
;;                            (:name "Research"
;;                                   :tag "Research"
;;                                   :order 15)

;;                            (:name "Piano"
;;                                   :tag "Piano"
;;                                   :order 25)
;;                            (:name "Guitar"
;;                                   :tag "Guitar"
;;                                   :order 26)

;;                            (:name "Kerbal Space Program"
;;                                   :tag "KSP"
;;                                   :order 29)

;;                            (:name "To Remember"
;;                                   :tag "Remember"
;;                                   :order 30)
;;                            (:name "To read"
;;                                   :and (:tag ("Read" "Book")
;;                                              :not (:todo "SOMEDAY"))
;;                                   :order 35
;;                                   )

;;                            (:name "Mathematics"
;;                                   :tag "Maths"
;;                                   :order 40)
;;                            (:name "Science"
;;                                   :tag ("Science" "Physics")
;;                                   :order 41)

;;                            (:name "trivial"
;;                                   :priority<= "C"
;;                                   :tag ("Trivial" "Unimportant")
;;                                   :todo ("SOMEDAY" )
;;                                   :order 90)
;;                            (:discard (:tag ("Chore" "Routine" "Daily")))
;;                            ))

;;                         )))
;;          ) ; Super zaen view
;;         )))

;; (use-package! org-super-agenda
;;   :commands (org-super-agenda-mode))
;; (after! org
; (use-package! org-super-agenda
  ; :init
  ; (setq org-agenda-start-day "+0d"
  ; org-agenda-span 1)
  ; (setq
  ;  ;; org-agenda-time-grid '((daily today require-timed) "----------------------" nil)
  ;       org-agenda-include-diary t
  ;       org-agenda-start-with-log-mode t
  ;       )
  ; (setq org-agenda-skip-scheduled-if-done t
        ; org-agenda-skip-deadline-if-done t
        ; org-agenda-include-deadlines t
        ; org-agenda-block-separator nil
        ; org-agenda-compact-blocks t
        ; org-agenda-start-day "-1d"
        ; org-agenda-span 3
        ; org-agenda-start-on-weekday t)
  ; (setq org-agenda-custom-commands
        ; '(("c" "Super view"
           ; ((agenda "" ((org-agenda-overriding-header "")
;
                        ; (org-agenda-skip-scheduled-if-done t)
                        ; (org-agenda-skip-timestamp-if-done t)
                        ; (org-agenda-skip-deadline-if-done t)
                        ; (org-agenda-start-day "+0d")
                        ; (org-agenda-span 5)
                        ; (org-agenda-overriding-header "⚡ SCHEDULE:\n")
                        ; (org-agenda-repeating-timestamp-show-all nil)
                        ; (org-super-agenda-groups
                         ; '((:name "Today"
                         ;          :time-grid t
                         ;          :date today
                         ;          :order 1))
                         ; )))
            ; (alltodo "" ((org-agenda-overriding-header "")
                         ; (org-super-agenda-groups
                          ; '((:log t)
                            ; (:name "To refile"
                             ; :file-path "refile\\.org")
                            ; (:name "Next to do"
                             ; :todo "NEXT"
                             ; :order 1)
                            ; (:name "Important"
                             ; :priority "A"
                             ; :order 6)
                            ; (:name "Today's tasks"
                             ; :file-path "journal/")
                            ; (:name "Due Today"
                             ; :deadline today
                             ; :order 2)
                            ; (:name "Scheduled Soon"
                             ; :scheduled future
                             ; :order 8)
                            ; (:name "Overdue"
                             ; :deadline past
                             ; :order 7)
                            ; (:name "Meetings"
                             ; :and (:todo "MEET" :scheduled future)
                             ; :order 10)
                            ; (:discard (:not (:todo "TODO")))))))))))
;
  ; (setq org-super-agenda-groups
  ;       '(
  ;         (:name "Today lo"
  ;          :time-grid t
  ;          :date today
  ;          :todo "TODAY"
  ;          :scheduled today
  ;          :order 1)
  ;         (:name "Next To Do"
  ;          :todo "pc"
  ;          :order 2))
  ;       )
  ; :config
  ; (org-super-agenda-mode)
  ; )
; )



(after! org
  (use-package! org-projectile
    ;; :init
    :config
    ;; (org-projectile-per-project)
    ;; (setq org-projectile-per-project-filepath "project_todos.org")
    ;; (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
    (setq org-projectile-projects-file "~/Dropbox/org/project_todos.org")
    (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
    (push (org-projectile-project-todo-entry) org-capture-templates)
    ;; (global-set-key (kbd "C-c c") 'org-capture)
    ;; (global-set-key (kbd "C-c n p") 'org-projectile-project-todo-completing-read)
    ))

;; (setq org-agenda-skip-deadline-prewarning-if-scheduled t)
;; (setq org-agenda-skip-scheduled-if-deadline-is-shown t)
;; (setq org-agenda-span 5)

;; (setq org-agenda-custom-commands
;;       '(("a" "My Agenda"
;;          ((todo "TODO" (
;;                       (org-agenda-overriding-header "⚡ TODAY:\n")
;;                       (org-agenda-remove-tags t)
;;                       (org-agenda-prefix-format "  %-2i  %b")
;;                       (org-agenda-todo-keyword-format "")))
;;           (agenda "" (
;;                       (org-agenda-skip-scheduled-if-done t)
;;                       (org-agenda-skip-timestamp-if-done t)
;;                       (org-agenda-skip-deadline-if-done t)
;;                       (org-agenda-start-day "+0d")
;;                       (org-agenda-span 5)
;;                       (org-agenda-overriding-header "⚡ SCHEDULE:\n")
;;                       (org-agenda-repeating-timestamp-show-all nil)
;;                       ;; (org-agenda-remove-tags t)
;;                       (org-agenda-prefix-format "  %-2i  %-15b%t %s")
;;                        ;; (concat "  %-3i  %-15b %t%s" org-agenda-hidden-separator))
;;                       (org-agenda-todo-keyword-format " ☐ ")
;;                       (org-agenda-time)
;;                       (org-agenda-current-time-string "⮜┈┈┈┈┈┈┈ now")
;;                       (org-agenda-scheduled-leaders '("" ""))
;;                       (org-agenda-deadline-leaders '("" ""))
;;                       (org-agenda-time-grid (quote ((today require-timed remove-match) (0900 2100) "      " "┈┈┈┈┈┈┈┈┈┈┈┈┈")))))

;;          (todo "NEXT" (
;;                       (org-agenda-overriding-header "⚡ THIS WEEK:\n")
;;                       (org-agenda-remove-tags t)
;;                       (org-agenda-prefix-format "  %-2i  %b")
;;                       (org-agenda-todo-keyword-format "")))
;;           ))))



;; (setq org-agenda-custom-commands
;;       '(("z" "Super zaen view"
;;          ((agenda "" ((org-agenda-span 'day)
;;                       (org-super-agenda-groups
;;                        '((:name "Today"
;;                                 :time-grid t
;;                                 :date today
;;                                 :todo "TODAY"
;;                                 :scheduled today
;;                                 :order 1)))))
;;           (alltodo "" ((org-agenda-overriding-header "")
;;                        (org-super-agenda-groups
;;                         '((:name "Next to do"
;;                                  :todo "NEXT"
;;                                  :order 1)
;;                           (:name "Important"
;;                                  :tag "Important"
;;                                  :priority "A"
;;                                  :order 6)
;;                           (:name "Due Today"
;;                                  :deadline today
;;                                  :order 2)
;;                           (:name "Due Soon"
;;                                  :deadline future
;;                                  :order 8)
;;                           (:name "Overdue"
;;                                  :deadline past
;;                                  :order 7)
;;                           (:name "Assignments"
;;                                  :tag "Assignment"
;;                                  :order 10)
;;                           (:name "Issues"
;;                                  :tag "Issue"
;;                                  :order 12)
;;                           (:name "Projects"
;;                                  :tag "Project"
;;                                  :order 14)
;;                           (:name "Emacs"
;;                                  :tag "Emacs"
;;                                  :order 13)
;;                           (:name "Research"
;;                                  :tag "Research"
;;                                  :order 15)
;;                           (:name "To read"
;;                                  :tag "Read"
;;                                  :order 30)
;;                           (:name "Waiting"
;;                                  :todo "WAITING"
;;                                  :order 20)
;;                           (:name "trivial"
;;                                  :priority<= "C"
;;                                  :tag ("Trivial" "Unimportant")
;;                                  :todo ("SOMEDAY" )
;;                                  :order 90)
;;                           (:discard (:tag ("Chore" "Routine" "Daily")))))))))))


;; (setq org-agenda-skip-scheduled-if-done t
;;       org-agenda-skip-deadline-if-done t
;;       org-agenda-include-deadlines t
;; ;;       org-agenda-block-separator nil
;;       org-agenda-tags-column 100 ;; from testing this seems to be a good value
;;       org-agenda-compact-blocks t)
;; (setq org-agenda-custom-commands
;;       '(("o" "Overview"
;;          ((agenda "" ((org-agenda-span 'day)
;;                       (org-super-agenda-groups
;;                        '((:name "Today"
;;                           :time-grid t
;;                           :date today
;;                           :todo "TODAY"
;;                           :scheduled today
;;                           :order 1)))
;;                       ))
;;           (alltodo "" ((org-agenda-overriding-header "")
;;                        (org-super-agenda-groups
;;                         '((:name "Next to do"
;;                            :todo "NEXT"
;;                            :order 1)
;;                           ;; (:name "Important"
;;                           ;;  :tag "Important"
;;                           ;;  :priority "A"
;;                           ;;  :order 1)
;;                           ;; (:name "Dissertation"
;;                           ;;  :tag "Dissertation"
;;                           ;;  :order 7)
;;                           ;; (:name "Emacs"
;;                           ;;  :tag "Emacs"
;;                           ;;  :order 13)
;;                           ;; (:name "Projects"
;;                           ;;  :tag "Project"
;;                           ;;  :order 14)
;;                           ;; (:name "Work In Progress"
;;                           ;;  :tag "WIP"
;;                           ;;  :order 5)
;;                           ;; (:name "Blog"
;;                           ;;  :tag "Blog"
;;                           ;;  :order 12)
;;                           ;; (:name "Trivial"
;;                           ;;  :priority<= "E"
;;                           ;;  :tag ("Trivial" "Unimportant")
;;                           ;;  :todo ("SOMEDAY" )
;;                           ;;  :order 90)
;;                           ))))))))

;; (after! org-roam
;;   (setq org-roam-directory "~/Dropbox/org/notes.org")
;;   )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Config magit to show worktree for dotfiles bare git repo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun ~/magit-process-environment (env)
  "Add GIT_DIR and GIT_WORK_TREE to ENV when in a special directory.
https://github.com/magit/magit/issues/460 (@cpitclaudel)."
  (let ((default (file-name-as-directory (expand-file-name default-directory)))
        (home (expand-file-name "~/")))
    (when (string= default home)
      ;; (let ((gitdir (expand-file-name "~/dotfiles.git/")))
      (let ((gitdir (expand-file-name "~/dotfiles/")))
        (push (format "GIT_WORK_TREE=%s" home) env)
        (push (format "GIT_DIR=%s" gitdir) env))))
  env)

(advice-add 'magit-process-environment
            :filter-return #'~/magit-process-environment)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Server
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq server-socket-dir "~/.emacs.d/server/")
;; set different server names for GUI and terminal emacs
(if (eq window-system 'mac)
    (setq server-name "~/.emacs.d/server/gui")
  (setq server-name "~/.emacs.d/server/term")
  )
;; if a server isn't running then start one
(after! server
  (if (eq (server-running-p server-name) nil)
      (server-start))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org_ref_notes (concat (getenv "HOME") "/Dropbox/org/ref/notes")
      zot_bib (concat (getenv "HOME") "/Dropbox/org/ref/zotero-library.bib")
      org_ref_bib (concat (getenv "HOME") "/Dropbox/org/ref/org-ref-library.bib")
      org_notes (concat (getenv "HOME") "/Dropbox/org")
      org_contacts (concat (getenv "HOME") "/Dropbox/org/contacts.org")
      personal-web-dir (concat (getenv "HOME") "/Developer/web-projects/academic-kickstart")
      personal-web-dir "~/Developer/web-projects/academic-kickstart"
      blog-post-dir (concat personal-web-dir "/org/all-posts.org"))
;; org-roam-directory org_ref_notes)
;; org-roam-directory org_notes)
(after! deft (setq deft-directory org_notes))
;; Disable formatter from lsp so that (format +onsave)
(setq +format-with-lsp nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(after! org
  (setq org-contacts-files org_contacts
        org-todo-keywords '((sequence "SOMEDAY" "TODO" "PROGRESS" "|" "DONE" "DELEGATED" "CANCELLED"))
        ;;  ;; org-default-notes-file "~/Dropbox/org/notes.org"
        org-startup-indented t ;; Keep the indentation well structured
        org-bullets-bullet-list '("■" "◆" "▲" "▶")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package! elpy
;;   :init
;;   (elpy-enable))

(use-package! sphinx-doc
  :config
  (add-hook 'python-mode-hook (lambda ()
                                (require 'sphinx-doc)
                                (sphinx-doc-mode t))))

(after! exec-path-from-shell
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  (when (daemonp)
    (exec-path-from-shell-initialize)))

;; Poetry functions
(defun my/poetry-execute-file ()
  "Run python file inside poetry environment of current file/path"
  (interactive)
  (poetry-run (concat "python " (buffer-file-name (window-buffer (minibuffer-selected-window))))))

(defun my/poetry-ipython ()
  "Open ipython shell inside poetry environment of current file/path"
  (interactive)
  (poetry-ensure-in-project)
  (shell (poetry-buffer-name "ipython-shell"))
  (process-send-string (get-buffer-process
                        (get-buffer (poetry-buffer-name "ipython-shell")))
                       "poetry run ipython\n"))

(defun my/poetry-execute-in-ipython ()
  "Run file in ipython shell inside poetry environment of current file/path"
  (interactive)
  (process-send-string (get-buffer-process
                        (get-buffer (poetry-buffer-name "ipython-shell")))
                       (concat (concat "run" (buffer-file-name (window-buffer (minibuffer-selected-window)))) "\n"))
  (set-window-buffer nil (get-buffer (poetry-buffer-name "ipython-shell"))))

;; Elpy functions
(defun my/elpy-shell-send-file-current ()
  "Run \"elpy-shell-send-file\" with current file"
  (interactive)
  (elpy-shell-send-file (buffer-file-name (window-buffer (minibuffer-selected-window)))))

;; "d"  'sphinx-doc
;; ;; "c"  'my/poetry-execute-in-ipython
;; "c"  '(:ignore c :which-key "code")
;; "b"  'python-shell-send-buffer
;; "cc" 'my/python-shell-send-current-file
;; "cb"  'python-shell-send-buffer
;; "ci" 'ipython
;; "cp" 'run-python
;; "r"  'run-python
;; "f"  '(blacken-buffer :which-key "format buffer (black)")


(after! python
  (map! :map python-mode-map
        :localleader
        :g "z" 'elpy-shell-switch-to-shell
        :g "c" 'my/elpy-shell-send-file-current
        :g "d" 'sphinx-doc ;; add docstring to function
        ;; :g "i" 'my/poetry-ipython
        :g "p" 'my/poetry-execute-in-ipython
        (:prefix-map ("i" . "imports")
         :g "i" 'pyimport-insert-missing
         :g "r" 'pyimport-remove-unused
         :g "s" 'py-isort-buffer)
        (:prefix-map ("v" . "virtual envs")
         :g "a" 'poetry-add
         :g "c" 'poetry-check
         :g "d" 'poetry-venv-deactivate
         :g "e" 'poetry-edit-pyproject-toml
         :g "i" 'poetry-install
         :g "l" 'poetry-show
         :g "r" 'poetry-run
         :g "s" 'poetry-shell
         :g "u" 'poetry-update
         :g "w" 'poetry-venv-workon)
        ;; :g "p" 'my/poetry-execute-file)
        ))

(after! flycheck
  (flycheck-define-checker
      python-mypy ""
      :command ("mypy"
                "--ignore-missing-imports" "--fast-parser"
                "--python-version" "3.6"
                source-original)
      :error-patterns
      ((error line-start (file-name) ":" line ": error:" (message) line-end))
      :modes python-mode)

  (add-to-list 'flycheck-checkers 'python-mypy t)
  (flycheck-add-next-checker 'python-pylint 'python-mypy t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keybindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(map! :leader
      (:desc "M-x" "SPC"  #'execute-extended-command)
      (:desc "M-x" "C-SPC"  #'execute-extended-command))

;; avy jump
(after! avy
  (map! :leader
        (:prefix-map ("j" . "jump")
         :desc "jump to char" "j"  #'avy-goto-char-2
         :desc "jump to word" "w"  #'avy-goto-word-0
         :desc "jump to line" "l"  #'avy-goto-line
         :desc "jump to url" "u"   #'avy-goto-url
         :desc "imenu" "i"  #'counsel-imenu
         :desc "switch-buffer" "b"  #'+ivy/switch-workspace-buffer
         :desc "goto-last-change" "c"  #'goto-last-change
         :desc "find-function" "f"  #'find-function
         :desc "find-variable" "v"  #'find-variable
         )))

;; comment lines with SPC ;;
(map! :after evil
      :leader
      :desc "comment lines" ";" 'evilnc-comment-or-uncomment-lines)

;; Deleted other window using SPC w D
(map! :map evil-window-map
      :desc "delete other window" "D" #'ace-delete-window)
;; (custom-set-faces!
;;   '(aw-leading-char-face
;;     :foreground "white" :background "red"
;;     :weight bold :height 2.5 :box (:line-width 10 :color "red")))


;; change workspaces to "layouts" using l instead of using TAB
(map! :leader
      (:prefix-map ("l" . "layouts")
       :desc "previos" "k"  #'+workspace/switch-left
       :desc "next" "j"  #'+workspace/switch-right
       :desc "switch" "l"  #'+workspace/switch-to
       :desc "delete" "d"  #'+workspace/delete
       :desc "new" "n"  #'+workspace/new
       ))

(after! evil-snipe (evil-snipe-mode -1))

;; dired quick links
(defun my/open-config () (interactive) (dired "/Users/aidanscannell/.config"))
(defun my/open-dotfiles() (interactive) (dired "/Users/aidanscannell/dotfiles"))
(defun my/open-python-projects () (interactive) (dired "/Users/aidanscannell/Developer/python-projects"))
(defun my/open-home () (interactive) (dired "/Users/aidanscannell"))
(defun my/open-documents () (interactive) (dired "/Users/aidanscannell/Documents"))
(defun my/open-emacs () (interactive) (dired doom-private-dir))
(defun my/open-downloads () (interactive) (dired "/Users/aidanscannell/Downloads"))
(defun my/open-notes () (interactive) (dired "/Users/aidanscannell/Dropbox/org"))

(map! :after dired
      :map dired-mode-map
      :ng "h" #'dired-up-directory
      :ng "l" #'dired-find-file)

(map! :after dired
      :leader
      (:prefix-map ("d" . "dired")
       :desc "~/.config" "c"  #'my/open-config
       :desc "~/dotfiles" "g"  #'my/open-dotfiles
       :desc "here" "d"  #'dired-jump
       :desc "emacs" "e"  #'my/open-emacs
       :desc "~/Documents" "D"  #'my/open-documents
       :desc "~/" "h"  #'my/open-home
       :desc "~/Downloads" "o"  #'my/open-downloads
       :desc "python-projects" "p"  #'my/open-python-projects
       :desc "notes" "n"  #'my/open-notes
       ))

(after! evil
  (after! dired-ranger
    (evil-collection-define-key 'normal 'dired-mode-map
      ;; "h" 'dired-single-up-directory
      "H" 'dired-omit-mode
      ;; "l" 'dired-single-buffer
      "y" 'dired-ranger-copy
      "X" 'dired-ranger-move
      "p" 'dired-ranger-paste)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dired
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; change ls to gls for grouping by directories on osx
(setq insert-directory-program "gls" dired-use-ls-dired t)
(setq dired-listing-switches "-agho --group-directories-first"
      dired-omit-files "^\\.[^.].*"
      dired-omit-verbose nil)

(autoload 'dired-omit-mode "dired-x")

;; (add-hook 'dired-load-hook
;;           (lambda ()
;;             (interactive)
;;             (dired-collapse)))

;; TODO disable all-the-icons-dired-mode in terminal emacs
(add-hook 'dired-mode-hook
          (lambda ()
            (interactive)
            (dired-omit-mode 1)
            (all-the-icons-dired-mode 1)
            ;; (dired-rainbow-mode 1)
            (hl-line-mode 1)))

(after! dired-rainbow
  (progn
    (dired-rainbow-define-chmod directory "#6cb2eb" "d.*")
    (dired-rainbow-define html "#eb5286" ("css" "less" "sass" "scss" "htm" "html" "jhtm" "mht" "eml" "mustache" "xhtml"))
    (dired-rainbow-define xml "#f2d024" ("xml" "xsd" "xsl" "xslt" "wsdl" "bib" "json" "msg" "pgn" "rss" "yaml" "yml" "rdata"))
    (dired-rainbow-define document "#9561e2" ("docm" "doc" "docx" "odb" "odt" "pdb" "pdf" "ps" "rtf" "djvu" "epub" "odp" "ppt" "pptx"))
    (dired-rainbow-define markdown "#ffed4a" ("org" "etx" "info" "markdown" "md" "mkd" "nfo" "pod" "rst" "tex" "textfile" "txt"))
    (dired-rainbow-define database "#6574cd" ("xlsx" "xls" "csv" "accdb" "db" "mdb" "sqlite" "nc"))
    (dired-rainbow-define media "#de751f" ("mp3" "mp4" "mkv" "MP3" "MP4" "avi" "mpeg" "mpg" "flv" "ogg" "mov" "mid" "midi" "wav" "aiff" "flac"))
    (dired-rainbow-define image "#f66d9b" ("tiff" "tif" "cdr" "gif" "ico" "jpeg" "jpg" "png" "psd" "eps" "svg"))
    (dired-rainbow-define log "#c17d11" ("log"))
    (dired-rainbow-define shell "#f6993f" ("awk" "bash" "bat" "sed" "sh" "zsh" "vim"))
    (dired-rainbow-define interpreted "#38c172" ("py" "ipynb" "rb" "pl" "t" "msql" "mysql" "pgsql" "sql" "r" "clj" "cljs" "scala" "js"))
    (dired-rainbow-define compiled "#4dc0b5" ("asm" "cl" "lisp" "el" "c" "h" "c++" "h++" "hpp" "hxx" "m" "cc" "cs" "cp" "cpp" "go" "f" "for" "ftn" "f90" "f95" "f03" "f08" "s" "rs" "hi" "hs" "pyc" ".java"))
    (dired-rainbow-define executable "#8cc4ff" ("exe" "msi"))
    (dired-rainbow-define compressed "#51d88a" ("7z" "zip" "bz2" "tgz" "txz" "gz" "xz" "z" "Z" "jar" "war" "ear" "rar" "sar" "xpi" "apk" "xz" "tar"))
    (dired-rainbow-define packaged "#faad63" ("deb" "rpm" "apk" "jad" "jar" "cab" "pak" "pk3" "vdf" "vpk" "bsp"))
    (dired-rainbow-define encrypted "#ffed4a" ("gpg" "pgp" "asc" "bfe" "enc" "signature" "sig" "p12" "pem"))
    (dired-rainbow-define fonts "#6cb2eb" ("afm" "fon" "fnt" "pfb" "pfm" "ttf" "otf"))
    (dired-rainbow-define partition "#e3342f" ("dmg" "iso" "bin" "nrg" "qcow" "toast" "vcd" "vmdk" "bak"))
    (dired-rainbow-define vc "#0074d9" ("git" "gitignore" "gitattributes" "gitmodules"))
    (dired-rainbow-define-chmod executable-unix "#38c172" "-.*x.*")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm-bibtex
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (after! helm-bibtex
;;   (map! :g "SPC r" 'helm-bibtex))

(after! org
  ;; (use-package! org-roam-bibtex
  ;;   :init
  ;;   ;; code here will run immediately
  ;;   :config
  ;;   ;; code here will run after the package is loaded
  ;;   :hook (org-roam-mode . org-roam-bibtex-mode))
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

  ;; (add-hook pdf-view-mode-hook 'auto-revert-mode)
  (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)

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
          '("latexmk -f -silent -output-directory=./tex %f \n cp ./tex/%b.pdf ./%b.pdf"))

    ;; (setq org-latex-pdf-process
    ;;       '("pdflatex -interaction nonstopmode -output-directory %o %f"
    ;;         "bibtex %b"
    ;;         "pdflatex -interaction nonstopmode -output-directory %o %f"
    ;;         "pdflatex -interaction nonstopmode -output-directory %o %f"))
    (setq org-latex-with-hyperref nil) ;; stop org adding hypersetup{author..} to latex export
    ;; (setq org-latex-prefer-user-labels t)

    ;; deleted unwanted file extensions after latexMK
    ;; not doing this anymore as it slows down sequential builds
    ;; (setq org-latex-logfiles-extensions
    ;;       (quote ("lof" "lot" "tex~" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl" "xmpi" "run.xml" "bcf" "acn" "acr" "alg" "glg" "gls" "ist")))

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
\\IEEEoverridecommandlockouts
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
