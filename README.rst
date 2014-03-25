#################################################
Yet Another Vimrc 
#################################################

All the plugins are selected to work with the default vim build on various
ubuntu versions (tested on 12.04 and later) for vim 7.3 and later.
I mostly use vim with python and C/C++ so there is an emphasis on these
languages in this setup.

Clone
=============

To use this configuration:

* ``cd ~ && git clone git://github.com/padeler/vim.git .vim``
* ``cd ~ && ln -s .vimrc .vim/vimrc`` #(not needed if vim looks for .vim/vimrc)
* ``cd ~/.vim && git submodule update --init`` #(to get all plugins from git)
* If you want to use the taglist plugin with C/C++ (see below) install 
  exuberant-ctags. On debian (and clones): ``sudo apt-get install exuberant-ctags``

Plugins
========

The following plugins are used:

* pathogen. For plugin loading.
* `jedi <https://github.com/davidhalter/jedi*vim>`_. Python code completion
* `syntastic <https://github.com/scrooloose/syntastic>`_. Python/C/C++/Java etc syntax checking
* pythoncomplete. Python omni complete, used by jedi
* `pydoc <https://github.com/fs111/pydoc.vim>`_. Display PyDoc.
* `nerdtree <https://github.com/scrooloose/nerdtree>`_. Very nice file browser. 
* `powerline <https://github.com/Lokaltog/vim-powerline>`_. A status bar for VIM.
* `taglist <http://vim*taglist.sourceforge.net/>`_. Shows a taglist (outline) of the open files
  * supports java, c/c++, python, etc
  * requires exuberant-ctags to work with C/C++
