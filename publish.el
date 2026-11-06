(require 'ox-publish)

(setq org-publish-project-alist
      '(("pages"
         :base-directory "./"
         :base-extension "org"
         :publishing-directory "./docs"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-sitemap t)))
