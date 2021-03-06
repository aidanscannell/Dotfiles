;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs-old/private/")
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(react
     sml
     rust
     csv
     javascript
     html
     lua
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; general config
     helm
     ;; better-defaults
     emacs-lisp
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-return-key-behavior nil
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-private-snippets-directory nil
                      auto-completion-enable-snippets-in-popup t)
     ;; (spell-checking :variables
     ;;                 enable-flyspell-auto-completion t) ;; enabling this layer causes spacemacs to sometime freeze
     ;; spell-checking
     (syntax-checking :variables
                      syntax-checking-enable-by-default t)
     osx

     ;; version control config
     git
     github
     version-control

     ;; python config
     (python :variables
             python-backend 'lsp
             python-tab-width 4
             python-fill-column 99
             python-formatter 'yapf
             python-format-on-save t
             ;;         python-test-runner '(pytest nose)
             python-sort-imports-on-save nil)
     ;; ipython-notebook  ;; org-capture fails when this layer is activated
     ;; sphinx
     ;; restructuredtext

     ;; latex config
     ;; (setq org-latex-pdf-process (list "LaTeX -shell-escape -bibtex -f -pdf %f"))
     (latex :variables
            ;; latex-build-command "LaTeX"
            ;; latex-build-command "LaTeX -shell-escape -bibtex -f -pdf %f"
            latex-enable-auto-fill t
            latex-enable-folding t)
            ;; latex-enable-magic t)
     bibtex ;; org-ref is inside bibtex layer
     pdf

     ;; ;; org config
     ;; (org :variables
     ;;      org-want-todo-bindings t
     ;;      ;; org-projectile-file "/Users/aidanscannell/Dropbox/org/project-todo.org"
     ;;      org-projectile-file "TODOs.org"
     ;;      org-enable-sticky-header t
     ;;      org-enable-hugo-support t
     ;;      org-enable-reveal-js-support t)

     ;; email config
     mail
;; shell config
     (shell :variables
            shell-default-shell 'multi-term
            shell-default-term-shell "/bin/zsh"
            shell-default-height 30
            shell-default-position 'bottom)

     ;; file navigation
     ;; treemacs :variables treemacs-use-follow-mode t
     ;; (ranger :variables
     ;;         ranger-show-preview t
     ;;         ranger-show-hidden t
     ;;         ranger-cleanup-eagerly t
     ;;         ranger-cleanup-on-disable t
     ;;         ranger-ignored-extensions '("mkv" "flv" "iso" "mp4"))

     ;; media config
     spotify
     ;; spotify-aidan-layer
     ;; ivy

     ;; browser config
     w3m

     ;; exwm

     ;; extras
     csv
     ;; slack
     as-general
     as-org
     ;; media
     ;; spot4e
     ;; ibuffer
     ;; (ibuffer :variables ibuffer-group-buffers-by 'projects)
     (colors :variables
             colors-colorize-identifiers 'variables) ;; colors variables in code
     emoji)
   ;; (markdown :variables
   ;;           markdown-open-command "~/Applications/MacDown.app/Contents/MacOS/MacDown")

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      auto-dim-other-buffers
                                      ;; yasnippet-snippets
                                      ;; spotify
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(ob-ipython)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
  This function is called at the very startup of Spacemacs initialization
  before layers configuration.
  You should not put any user code in there besides modifying the variable
  values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((agenda)
                                (todos)
                                (recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-mode-line-theme '(all-the-icons :separator slant :separator-scale 1.5)
   ;; dotspacemacs-mode-line-theme '(vim-powerline :separator slant :separator-scale 1.5)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers '(:relative t
                                         :disabled-for-modes dired-mode
                                         doc-view-mode
                                         ;; markdown-mode
                                         ;; org-mode
                                         pdf-view-mode
                                         )
   ;; dotspacemacs-line-numbers 'relative
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; (require 'ox-reveal)
  ;; (setq org-reveal-root "file:///Users/aidanscannell/reveal.js")
  (add-to-list 'load-path "~/spacemacs/private/org-reveal")
  (require 'ox-reveal)
  ;; (setq org-reveal-root "~/reveal.js")
  (setq org-reveal-root "https://revealjs.com/")
  ;; (setq org-reveal-root "file:///Users/aidanscannell/reveal.js")



  ;; (TeX-source-correlate-mode)        ; activate forward/reverse search
  ;; (TeX-PDF-mode)
  ;; (add-to-list 'TeX-view-program-list '("zathura" zathura-forward-search))
  ;; (setq TeX-view-program-selection (quote ((output-pdf "zathura") (output-dvi "xdvi"))))

  ;; (add-to-list 'TeX-view-program-selection
  ;;              '(output-pdf "Zathura"))

  ;; (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  ;; (add-to-list 'TeX-view-program-list
  ;;              '("Zathura"
  ;;                ("zathura "
  ;;                 (mode-io-correlate " --synctex-forward %n:0:%b -x \"emacsclient +%{line} %{input}\" ")
  ;;                 " %o")
  ;;                "zathura"))
  ;; (add-to-list 'TeX-view-program-selection
  ;;              '(output-pdf "Zathura"))

  ;; (setq default-major-mode 'C-M-m)
  ;; (add-to-list 'load-path "~/spacemacs/private/spot4e.el")
  ;; (push "~/spacemacs/private" load-path)
  ;; (load-file "~/spacemacs/private/spot4e.el")
  (add-to-list 'load-path "~/spacemacs/private/spot4e")
  (require 'spot4e)
  (setq spot4e-refresh-token "AQAtl9XqIxQ0AC-qZTVwzoE_GckNPioln90GBeYITl0nVvSJKj1DlwWYM0jBpVVHgtYiSwLjwClRMgB7_DPb53_KYtezojqeB3SddvwudskJIqGj6Bbe8LqB6w0aZuzcog2aGueGN1ZDCWjY_v8iMEsLN2fGBI9nR8J-pOi90ZunEu6UcpOghjlro3laA0FQ-1ouE7jWEr74zw2FLgMXkK3NIi-3NGXsnDlpvTeNsr6qC8S-rl_Am3lfQZdvipFAHwaG5qBDbEnFI8t2XtTuUpuDGVuscWzFUkZZqY4Pg0KeRMkuA6g5zLTREviR65XKvCUcm-j8ZX8L0x2lIrOe-mOM02BQHLsaQhsLERsaPf2egaXgRGJcyzt85A0EYSrOCsYjsO4eeHB4Z1WSfxXx10VCV_pMN_4cfProWekmiABuPT6heGiXWnv4UQJctqZvnIwavwruBg2L_3gWZKbuWUGNo6100gyS-GViPzHNwLWqdAs8")
  ;; (setq emms-source-file-default-directory "~/Music/iTunes/iTunes Media/Music")


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; misc
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (server-start) ;; start emacsclient daemon
  (setq vc-follow-symlinks t)  ;; allow magit to follow symlinks

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Hack to fix python venv issue with too many open files
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (defun pyenv-venv-wrapper-act (&optional ARG PRED)
    (setenv "VIRTUAL_ENV" (shell-command-to-string "_pyenv_virtualenv_hook; echo -n $VIRTUAL_ENV")))
  (advice-add 'pyenv-mode-set :after 'pyenv-venv-wrapper-act)
  (defun pyenv-venv-wrapper-deact (&optional ARG PRED)
    (setenv "VIRTUAL_ENV"))
  (advice-add 'pyenv-mode-unset :after 'pyenv-venv-wrapper-deact)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Slack config
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; (slack-register-team
  ;;  :name "emacs-slack"
  ;;  :default t
  ;;  :client-id "aidan.scannell@bristol.ac.uk"
  ;;  :client-secret ""
  ;;  :token ""
  ;;  :subscribed-channels '(general slackbot mml-book random interesting-papers))
  ;; (advice-add 'slack-counts-update :override #'ignore)


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Sphinx doc config
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; (setq rst-sphinx-target-parent "~/PycharmProjects/BMSMGP")
  ;; (setq rst-sphinx-target-projects
  ;;       '(("project1" . (latex "docs" t))
  ;;         ("project2" . (html  "docs" nil))
  ;;         ))
  ;; (add-hook 'python-mode-hook (lambda ()
  ;;                               (require 'sphinx-doc)
  ;;                               (sphinx-doc-mode t)))


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Display Visited File's Path in the Frame Title
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq frame-title-format
        '((:eval (if (buffer-file-name)
                     (abbreviate-file-name (buffer-file-name))
                   "%b"))))


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Keyboard Mappings
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Avy jump
  (define-key evil-normal-state-map (kbd "M-s") #'avy-goto-char-timer)
  (define-key evil-normal-state-map (kbd "M-w") #'avy-goto-word-1)
  (define-key evil-motion-state-map (kbd "M-w") #'avy-goto-word-1)


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Spotify config
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; load spotify.el from ~/spacemacs/private/local/spotify.el
  ;; (add-to-list 'load-path "~/spacemacs/private/local/spotify.el")
  ;; (require 'spotify)
  ;; ;; Settings
  ;; (setq spotify-oauth2-client-secret "33924bea433d4b8cb014df7b8ca234e6")
  ;; (setq spotify-oauth2-client-id "d33b39d27fcd4e54ba12c5bc666c90e1")
  ;; (define-key spotify-mode-map (kbd "C-c .") 'spotify-command-map)
  ;; (setq spotify-transport 'connect)


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; LaTeX bibliography config
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (require 'org-ref)
  ;; (setq reftex-default-bibliography '("~/Dropbox/library.bib"))
  ;; folder where reftex searches for citations
  (setq reftex-default-bibliography '("~/Dropbox/org/ref/master.bib"))
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  (setq org-ref-bibliography-notes "~/Dropbox/org/ref/notes.org"
        org-ref-default-bibliography '("~/Dropbox/org/ref/master.bib")
        org-ref-pdf-directory "~/Dropbox/org/ref/pdfs/")
  (setq org-ref-open-pdf-function
        (lambda (fpath)
          (start-process "zathura" "*helm-bibtex-zathura*" "/usr/local/bin/zathura" fpath)))

  (setq bibtex-completion-bibliography "~/Dropbox/org/ref/master.bib"
        bibtex-completion-library-path "~/Dropbox/org/ref/pdfs"
        bibtex-completion-notes-path "~/Dropbox/org/ref/helm-bibtex-notes")
  ;; open pdf with system pdf viewer (works on mac)
  (setq bibtex-completion-pdf-open-function
        (lambda (fpath)
          (start-process "zathura" "*helm-bibtex-zathura*" "/usr/local/bin/zathura" fpath)))
        ;; (lambda (fpath)
        ;;   (start-process "open" "*open*" "open" fpath)))

  (setq org-latex-pdf-process
        '("latexmk -pdflatex='pdflatex -interaction nonstopmode' -pdf -bibtex -f %f"))

  ;; process bibliography when building LaTeX files
  ;; (setq org-latex-pdf-process (list "LaTeX -shell-escape -bibtex -f -pdf %f"))

  ;; (add-hook 'LaTeX-mode-hook (lambda ()
  ;;                              (push
  ;;                               '("Make" "latexmk -outdir=./tex %t" TeX-run-TeX nil t
  ;;                                 :help "Make pdf output using latexmk.")
  ;;                               TeX-command-list)))

  (defun build-resume ()
  "This functions builds resume.json and outputs it in html format in websites static dir"
  (interactive)
  (shell-command "hackmyresume build resume_html.json TO ../static/resume.html -t node_modules/jsonresume-theme-stackoverflow")
  )

  (spacemacs/set-leader-keys
    "ob" 'build-resume
    "oc" 'org-capture
    "oh" 'org-hugo-export-subtree
    "oa" 'org-agenda
    "op" 'org-contacts
    "os" 'org-save-all-org-buffers
    "oi" 'helm-org-agenda-files-headings)


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Browser config
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (require 'w3m-load)
  ;; browser (w3m) settings
  (setq w3m-home-page "https://www.google.com")
  ;; W3M Home Page
  (setq w3m-default-display-inline-images t)
  (setq w3m-default-toggle-inline-images t)
  ;; W3M default display images
  (setq w3m-command-arguments '("-cookie" "-F"))
  (setq w3m-use-cookies t)
  ;; W3M use cookies
  (setq browse-url-browser-function 'w3m-browse-url)
  ;; Browse url function use w3m
  (setq w3m-view-this-url-new-session-in-background t)
  ;; W3M view url new session in background

)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (helm-w3m w3m pug-mode org-ref pdf-tools key-chord ivy tablist livid-mode helm-spotify-plus helm-bibtex parsebib github-search goto-chg undo-tree csv-mode color-identifiers-mode cargo biblio biblio-core window-numbering web-mode web-beautify toml-mode tagedit spotify powerline smooth-scrolling slim-mode scss-mode sass-mode rainbow-mode rainbow-identifiers racer rust-mode py-yapf hydra spinner lv page-break-lines ob-sml sml-mode magit-gh-pulls lua-mode leuven-theme json-mode json-snatcher json-reformat js2-refactor multiple-cursors js-doc jade-mode indent-guide ido-vertical-mode parent-mode helm-spotify multi projectile helm-css-scss haml-mode github-clone github-browse-file gist gh marshal logito pcache flycheck-rust pkg-info epl flx highlight smartparens iedit anzu emoji-cheat-sheet-plus emmet-mode company-web web-completion-data company-tern tern company-racer company-emoji company coffee-mode buffer-move bracketed-paste yasnippet auto-dim-other-buffers packed auctex-latexmk f dash s helm avy helm-core async auto-complete popup quelpa package-build bind-key bind-map evil yasnippet-snippets org-projectile org-category-capture org-present org-pomodoro org-mime org-download htmlize gnuplot ein skewer-mode polymode deferred websocket js2-mode simple-httpd shx reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help mu4e-maildirs-extension mu4e-alert ht alert log4e gntp ranger company-auctex auctex company-quickhelp mmm-mode markdown-toc markdown-mode git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck diff-hl auto-dictionary yapfify smeargle pyvenv pytest pyenv-mode py-isort pip-requirements orgit magit-gitflow magit-popup live-py-mode hy-mode dash-functional helm-pydoc helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit transient git-commit with-editor cython-mode company-anaconda anaconda-mode pythonic ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint -guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio fuzzy flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word company-statistics column-enforce-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-files
   (quote
    ("/Users/aidanscannell/Dropbox/org/agenda/calendar.org" "/Users/aidanscannell/Dropbox/org/agenda/routine.org" "/Users/aidanscannell/Dropbox/org/agenda/uni.org" "~/Developer/python-projects/BMNSVGP/TODOs.org" "~/Developer/web-projects/academic-aidanscannell/TODOs.org" "~/aidanscannell.github.io/TODOs.org")))
 '(package-selected-packages
   (quote
    (cdlatex rjsx-mode yasnippet-snippets org-projectile org-category-capture org-present org-pomodoro org-mime org-download htmlize gnuplot ein skewer-mode polymode deferred websocket js2-mode simple-httpd shx reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help mu4e-maildirs-extension mu4e-alert ht alert log4e gntp ranger company-auctex auctex company-quickhelp mmm-mode markdown-toc markdown-mode git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck diff-hl auto-dictionary yapfify smeargle pyvenv pytest pyenv-mode py-isort pip-requirements orgit magit-gitflow magit-popup live-py-mode hy-mode dash-functional helm-pydoc helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit transient git-commit with-editor cython-mode company-anaconda anaconda-mode pythonic ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint -guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio fuzzy flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word company-statistics column-enforce-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
