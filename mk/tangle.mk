# Tangle README and all files in org directory

ROOT = $(CURDIR)

TANGLE := emacs --batch -l org --eval (org-babel-tangle-file
.PHONY: tangle
tangle: ## Generate all elisp files
	emacs --batch -l org \
		--eval '(org-babel-tangle-file "README.org")' 
	
# create symbolic link to ~/.emacs.d
.PHONY: link
link:
	rm -rf ~/.emacs.d && \
	   	ln -s $(ROOT)/emacs.d ~/.emacs.d

