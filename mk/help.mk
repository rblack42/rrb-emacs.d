# Makefile help system

.PHONY: help
help:	## display help messages
	@python3 mk/pyhelp.py$(MAKEFILE_LIST)
