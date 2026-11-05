;;; build-site.el --- -*- lexical-binding: t; -*-

;; Load the publishing system
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org")
                         ("elpa" . "https://gnu.org")))
(package-initialize)
(unless (package-installed-p 'htmlize)
  (package-refresh-contents)
  (package-install 'htmlize))

(require 'ox-publish)

;; Customize your publishing projects
(setq org-publish-project-alist
      '(("my-org-site"
         :base-directory "./org"
         :base-extension "org"
         :publishing-directory "./docs"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-sitemap t
         :sitemap-title "Sitemap"
         :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"/simple.css\"/>"
         :with-author nil
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

