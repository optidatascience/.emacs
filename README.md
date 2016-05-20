.emacs
======

emacs config file

This repo contains my personal .emacs configuaration file. It includes the following features,


1. Green font, black background
2. Windows-like C+x cut, C+c copy and C+v paste
3. Region selection by mouse
4. Configured modules includes:
   - ESS
   - Color Theme

     sudo apt-get install emacs-goodies-el

   - AMPL Mode

     git clone https://github.com/dpo/ampl-mode.git

   - TRAMP
   
     [Installed automatically from Melpa]

     git clone git://git.savannah.gnu.org/tramp.git

   - IPython Mode (Make header is included for the above modes)

   - Markdown Mode

     [Installed automatically from Melpa]

     git clone git://jblevins.org/git/markdown-mode.git

   - PolyMode git clone (to work with R markdown .Rmd)

     [Installed automatically from Melpa]

     git clone https://github.com/vitoshka/polymode.git

   - PHP mode

     [Installed automatically from Melpa]

     git clone https://github.com/ejmr/php-mode.git

   - Ido mode

     [Installed automatically from Melpa]

     Including ido and flx-ido to bring a new look of C-x C-f and C-x
     C-b

   - Company mode

     [Installed automatically from Melpa]

     Enable autocompletion for lots programs

   - Ruby Suite

     [Installed automatically from Melpa]

     This includes flymake-ruby, robe, inf-ruby projectile
     projectile-ruby

   - Evernote Mode
     
     This uses geeknote

   - Org Mode

     This is installed automatically


## INSTALLATION

   Follow the instructions below to install:

   1. Git clone the repo

   2. If running Ubuntu, make sure you install emacs-goodies-el
   
      sudo apt-get install emacs-goodies-el

   3. Download ampl-mode

      git clone https://github.com/dpo/ampl-mode.git

   4. Copy header2.el to ~/.emacs.d/

   5. Install geeknote from github

   6. The rest of the packages will be automatically installed and configured

