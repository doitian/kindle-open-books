This project is created to convert open source materials to kindle supported format (`.mobi`)

The conversion is limited to open source licensed books. This project does not include any generated `.mobi` files and only includes the `.recipe` file for Calibre.

# About calibre recipes

[Calibre](http://calibre-ebook.com/) is a free electronic book management tool. It allows the generation of e-book through scraping RSS or HTML contents. It can be done through a Calibre recipe (in Python). For more details of Calibre recipe kindly refer to [Calibre Manual](http://manual.calibre-ebook.com/news.html)

# Usage

## GUI

1. Install Calibre [Download](http://calibre-ebook.com/download)
2. Go to `Fetch news`, `Load recipe from file` to add your recipe.
3. Go to `Fetch news`, `Schedule news download`, `Custom`, select the recipe added in step 1 and click `Download Now`
4. For more details, kindly refer to [Calibre Manual](http://manual.calibre-ebook.com/news.html)

## Terminal

1. Install Calibre

   * Archlinux

   ```bash
   pacman -S calibre
   ```

   * Debian/Ubuntu

   ```bash
   apt-get install calibre
   ```

   * RedHat/Fedora/CentOS

   ```bash
   yum -y install calibre
   ```

   * Mac OSX - Requires [Command Line Tool] (http://manual.calibre-ebook.com/cli/cli-index.html)。

3. Execute the following command in `calibre-recipes` folder
   
   ```bash
   ebook-convert xxx.recipe xxx.mobi
   ```

   For example
   
   ```bash
   ebook-convert AOSABook.recipe AOSABook.mobi
   ```

   It will generate `AOSABook.mobi` in the same folder.
