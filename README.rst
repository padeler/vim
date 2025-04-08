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

* ``cd ~ && git clone https://github.com/padeler/vim.git .vim``
* ``cd ~ && ln -s .vim/vimrc .vimrc`` #(not needed if vim looks for .vim/vimrc)
* ``cd ~/.vim && git submodule update --init`` #(to get all plugins from git,
  actually only vundle)
* Open vim and in command mode type: **PluginInstall** to install all plugins using
  vundle

Plugins
========

The following plugins are used:

* vundle. For plugin management.
* `jedi-vim <https://github.com/davidhalter/jedi*vim>`_. Python code
  completion. Requires jedi to be installed. 
* `syntastic <https://github.com/scrooloose/syntastic>`_. Python/C/C++/Java etc syntax checking
* pythoncomplete. Python omni complete, used by jedi
* `nerdtree <https://github.com/scrooloose/nerdtree>`_. Very nice file browser. 
* `nerdcommenter <https://github.com/scrooloose/nerdcommenter>`_. Toggle
  comment on many source types. 
* `airline <https://github.com/bling/vim-airline>`_. A status bar for VIM.
* `tagbar <https://github.com/majutsushi/tagbar>`_. Shows a tagbar (outline) of the open files
* `ctrlp <https://github.com/kien/ctrlp.vim>`_. Fuzzy file, buffer, mru, tag, etc finder.

