;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  (setq dr-robot//dotspacemacs-src-dir "~/.dotfiles/spacemacs-org-config/"
        dr-robot//dotspacemacs-src "~/.dotfiles/spacemacs-org-config/spacemacs.org"
        dr-robot//dotspacemacs-si (concat dr-robot//dotspacemacs-src-dir "spacemacs-init.el")
        dr-robot//dotspacemacs-sl (concat dr-robot//dotspacemacs-src-dir "spacemacs-layers.el")
        dr-robot//dotspacemacs-uc (concat dr-robot//dotspacemacs-src-dir "user-config.el")
        dr-robot//dotspacemacs-ui (concat dr-robot//dotspacemacs-src-dir "user-init.el"))
  (when (or (file-newer-than-file-p dr-robot//dotspacemacs-src dr-robot//dotspacemacs-si)
            (file-newer-than-file-p dr-robot//dotspacemacs-src dr-robot//dotspacemacs-sl)
            (file-newer-than-file-p dr-robot//dotspacemacs-src dr-robot//dotspacemacs-ui)
            (file-newer-than-file-p dr-robot//dotspacemacs-src dr-robot//dotspacemacs-uc))
    (princ "Exporting new Emacs configuration from spacemacs.org through org-babel...")
    (call-process
     (concat invocation-directory invocation-name)
     nil nil t
     "-q" "--batch" "--eval" "(require 'ob-tangle)"
     "--eval" (format "(org-babel-tangle-file \"%s\")" dr-robot//dotspacemacs-src))
    (princ "done"))
  (load-file dr-robot//dotspacemacs-si))

(defun dotspacemacs/layers ()
  (load-file dr-robot//dotspacemacs-sl))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (load-file dr-robot//dotspacemacs-ui))

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (load-file dr-robot//dotspacemacs-uc))


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ranger lentic m-buffer yasnippet-snippets yapfify xterm-color winum which-key web-mode web-beautify vterm vi-tilde-fringe use-package treemacs-projectile treemacs-persp treemacs-magit treemacs-evil terminal-here tagedit symon symbol-overlay stickyfunc-enhance srefactor spaceline-all-the-icons smeargle slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder restart-emacs rainbow-mode rainbow-identifiers pytest pyenv-mode py-isort pug-mode prettier-js popwin pippel pipenv pip-requirements pcre2el paradox overseer osx-trash osx-dictionary osx-clipboard org-ref open-junk-file olivetti nameless multi-term mmm-mode markdown-toc magit-svn magit-section magit-gitflow macrostep lsp-ui lsp-python-ms live-py-mode launchctl importmagic impatient-mode hybrid-mode hl-todo helm-xref helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-lsp helm-ls-git helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag golden-ratio gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy font-lock+ flyspell-correct-helm flycheck-pos-tip flycheck-package flycheck-elsa fill-column-indicator fancy-battery eyebrowse evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dotenv-mode doom-themes diminish deft dap-mode cython-mode company-web company-statistics company-reftex company-quickhelp company-lsp company-auctex company-anaconda color-identifiers-mode centered-cursor-mode blacken auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
