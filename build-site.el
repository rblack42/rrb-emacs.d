name: Publish to GitHub Pages
on:
  push:
    branches:
      - main # Change to master if needed

jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - name: Check out repo
        uses: actions/checkout@v4

      - name: Install Emacs
        run: sudo apt install emacs-nox --yes

      - name: Build the site
        run: |
          chmod +x ./build.sh
          ./build.sh

      - name: Publish to GitHub Pages
        uses: JamesIves/github-pages-deploy-action@v4
        with:
          branch: gh-pages
          folder: docs
