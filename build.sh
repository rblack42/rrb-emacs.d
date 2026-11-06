#!/bin/sh
# Runs Emacs cleanly (-Q), loads the build script, and compiles everything
emacs -Q --batch -l publish.el --eval '(org-publish-all t)'

