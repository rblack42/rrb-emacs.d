;;; build-site.el --- Build the Org website -*- lexical-binding: t; -*-

;; Initialize packaging system
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Install dependencies
(use-package htmlize :config :ensure t)
(use-package rainbow-delimiters :config :ensure t)

(require 'ox-html)
(require 'ox-publish)

(defconst site-root
  (file-name-directory (or load-file-name buffer-file-name))
  "Root directory of the emacs sources")

(defconst site-content-directory
  (expand-file-name "org" site-root))

(defconst site-output-directory
  (expand-file-name "docs" site-root))


(add-to-list 'load-path (expand-file-name "vendor" site-root))
(require 'htmlize)

(setq org-export-use-bable nil
    org-html-doctype "html5"
    org-html-html5-fancy t
    org-html-head-include-default-style nil
    org-html-head-include-scripts nil
    org-html-htmlize-output-type 'css
    org-html-validation-link nil
    org-publish-timestamp-directory
    (expand-file-name ".org-timestamps/" site-root)
    org-publish-use-timestamps-flag nil
    org-src-fontify-natively t)

(setq org-publish-project-alist
     `(("site-pages"
         :base-directory ,site-content-directory
         :base-extension "org"
         :publishing-directory ,site-output-directory
         :publishing-function org-html-publish-to-html
         :recursive t
         :with-author t
         :with-creator nil
         :with-toc t
         :section-numbers nil
         :time-stamp-file nil
         :html-head-extra "<link rel=\"stylesheet\" href=\"site.css\">\n<script src=\"site.js\" defer></script>"
         :html-preamble "<a class=\"source-link\" href=\"https://github.com/rlack42/rrb-emacs-config\">Source on GitHub</a>"
         :html-postamble nil)
        ("site-static"
         :base-directory ,site-content-directory
         :base-extension "css\\|js"
         :publishing-directory ,site-output-directory
         :publishing-function org-publish-attachment
         :recursive t)
        ("emacs-site" :components ("site-pages" "site-static"))))

(org-publish "emacs-site" t)

(message "Website built in %s" site-output-directory)

(provide 'build-site)
;;; build-site.el ends here
