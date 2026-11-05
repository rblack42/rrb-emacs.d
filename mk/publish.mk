# Tangle README and all files in org directory

.PHONY: publish
publish: ## Generate all web site from .org pages
	emacs -Q --script build-site.el \
		--funcall org-publish-all 

.PHONY: run-local
run-local: ## Test tangles setup from local emacs.d
	emacs -Q --init-directory emacs.d --debug-init



