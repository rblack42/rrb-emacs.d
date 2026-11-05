;;; build-site.el --- -*- lexical-binding: t; -*-

;; Load the publishing system
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(package-install 'htmlize)

(require 'ox-publish)
;; Customize the HTML output
(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")

;; Customize your publishing projects
(setq org-publish-project-alist
      '(("my-org-site"
         :base-directory "./org"
         :base-extension "org"
         :publishing-directory "./docs"
         :recursive t
	 :time-stamp-file nil
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-sitemap t
         :sitemap-title "Sitemap"
         :with-author t
         :with-creator t
         :with-toc t
         :section-numbers nil)

        ;; Optional: static assets like CSS, images, etc.
        ("my-site-static"
         :base-directory "./site-assets"
         :base-extension "css\\|js\\|png\\|jpg\\|gif"
         :publishing-directory "./docs"
         :recursive t
         :publishing-function org-publish-attachment)

        ("my-site" :components ("my-org-site" "my-site-static"))))

;; Generate the website
(org-publish-all t)

(message "Build complete!")

