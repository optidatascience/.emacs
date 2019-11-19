.emacs
======

emacs config file

This repo contains my personal .emacs configuaration file. It includes the following features,


1. Green font, black background [colortheme package]
2. Windows-like C+x cut, C+c copy and C+v paste
3. Region selection by mouse
4. Configured modules includes:
   - ESS
   - Color Theme
   - AMPL Mode [Currently DISABLED]
   - TRAMP
   - Python Mode (works with ipython, anaconda, customized key binding C-n
     C-M-x as ESS)
   - Markdown Mode
   - PolyMode git clone (to work with R markdown .Rmd)
   - PHP mode
   - Ido mode (dropdown menus)
   
     Including ido and flx-ido to bring a new look of C-x C-f and C-x
     C-b

	- Company mode

     Enable autocompletion for lots programs

   - Ruby Suite
	 
	 This includes flymake-ruby, robe, inf-ruby projectile
     projectile-ruby

<<<<<<< HEAD
   - Org Mode

=======
   - Evernote Mode
     
     This uses geeknote

   - Org Mode

     This is installed automatically

>>>>>>> f264fd88453b031a6aaa57bddfa73f0d615e639d

## INSTALLATION

   Follow the instructions below to install:

   1. Git clone the repo

<<<<<<< HEAD
   2. Copy header2.el to ~/.emacs.d/header2

   3. The rest of the packages will be automatically installed and configured
=======
   2. If running Ubuntu, make sure you install emacs-goodies-el
   
      sudo apt-get install emacs-goodies-el

   3. Download ampl-mode

      git clone https://github.com/dpo/ampl-mode.git

   4. Copy header2.el to ~/.emacs.d/

   5. Install geeknote from github

   6. The rest of the packages will be automatically installed and configured

>>>>>>> f264fd88453b031a6aaa57bddfa73f0d615e639d
