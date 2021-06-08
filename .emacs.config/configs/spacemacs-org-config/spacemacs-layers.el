(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
  ;; Base distribution to use. This is a layer contained in the directory
  ;; `+distribution'. For now available distributions are `spacemacs-base'
  ;; or `spacemacs'. (default 'spacemacs)
  dotspacemacs-distribution 'spacemacs-base

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

  ;; List of additional paths where to look for configuration layers.
  ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
  ;; dotspacemacs-configuration-layer-path '("~/.dotfiles/spacemacs-base-new/layers/")
  ;; dotspacemacs-configuration-layer-path (list (concat dotspacemacs-directory "layers/"))
  dotspacemacs-configuration-layer-path '("~/.dotfiles/spacemacs-org-config/layers/")

  ;; List of configuration layers to load.
  dotspacemacs-configuration-layers
  '(
    ;; ----------------------------------------------------------------
    ;; Example of useful layers you may want to use right away.
    ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
    ;; `M-m f e R' (Emacs style) to install them.
    ;; ----------------------------------------------------------------
    ;; better-defaults
    ;; multiple-cursors
    (ranger :variables
                     ranger-show-preview t)

    treemacs

    ;; Typing related
    (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      ;; auto-completion-private-snippets-directory (concat dotspacemacs-directory "private/snippets")
                      auto-completion-private-snippets-directory "~/.dotfiles/spacemacs-org-config/private/snippets/"
                      auto-completion-enable-snippets-in-popup t)
    (syntax-checking :variables
                      syntax-checking-enable-by-default t)
    spell-checking
    ;; (spell-checking :variables
    ;;                 random               enable-flyspell-auto-completion t) ;; enabling this layer causes spacemacs to sometime freeze

    ;; shell config
    (shell :variables
            ;; shell-default-shell 'multi-term
            multi-term-program "/bin/zsh"
            shell-default-term-shell "/bin/zsh"
            shell-default-height 30
            shell-default-full-span nil
            shell-default-position 'bottom)

    ;; spacemacs layers not in spacemacs-base
    spacemacs-evil
    spacemacs-project
    spacemacs-layouts
    spacemacs-visual
    ;; spacemacs-modeline
    spacemacs-navigation
    ;; spacemacs-editing
    ;; spacemacs-defaults
    ;; spacemacs-editing-visual
    ;; spacemacs-org
    ;; spacemacs-purpose
    ;; spacemacs-visual

    ;; Languages
    (python :variables
            python-backend 'lsp
            python-tab-width 4
            python-fill-column 99
            python-formatter 'yapf
            python-format-on-save t
            ;;         python-test-runner '(pytest nose)
            python-sort-imports-on-save nil)
    emacs-lisp
    html
    markdown
    ;; ipython-notebook  ;; org-capture fails when this layer is activated
    ;; sphinx
    ;; restructuredtext

    (colors :variables
            colors-colorize-identifiers 'variables) ;; colors variables in code

    (latex :variables
            ;; latex-build-command "LaTeX"
            ;; latex-build-command "LatexMK"
            ;; latex-build-command "LaTeX -shell-escape -bibtex -f -pdf %f"
            ;; latex-build-command "latexmk -shell-escape -pdf"
            ;; latex-build-command "latexmk -pdf %s"
            ;; latex-build-command "latexmk -pdflatex='pdflatex -interaction nonstopmode' -pdf -bibtex -f"
            latex-enable-auto-fill t
            latex-enable-folding t)
    ;; latex-enable-magic t)
    bibtex ;; org-ref is inside bibtex layer
    ;; pdf-tools ;; works on master
    pdf

    ;; Search
    helm
    deft ;; layer for note taking

    ;; (templates :variables templates-private-directory "~/.dotfiles/spacemacs-base-new/private/templates")

    ;; my custom layers
    org-config
    ;; org-zotero-config

    ;; other
    semantic ;; needed for formatting emacs-lisp
    osx
    git
    ;; version-control
    )

  ;; List of additional packages that will be installed without being
  ;; wrapped in a layer. If you need some configuration for these
  ;; packages, then consider creating a layer. You can also put the
  ;; configuration in `dotspacemacs/user-config'.
  ;; To use a local version of a package, use the `:location' property:
  ;; '(your-package :location "~/path/to/your-package/")
  ;; Also include the dependencies as they will not be resolved automatically.
  dotspacemacs-additional-packages '(
                                      doom-themes
                                      ;; olivetti
                                      )

  ;; A list of packages that cannot be updated.
  dotspacemacs-frozen-packages '()

  ;; A list of packages that will not be installed and loaded.
  dotspacemacs-excluded-packages '()

  ;; Defines the behaviour of Spacemacs when installing packages.
  ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
  ;; `used-only' installs only explicitly used packages and deletes any unused
  ;; packages as well as their unused dependencies. `used-but-keep-unused'
  ;; installs only the used packages but won't delete unused ones. `all'
  ;; installs *all* packages supported by Spacemacs and never uninstalls them.
  ;; (default is `used-only')
  dotspacemacs-install-packages 'used-only))
