Dev setup for golang with vim + plugins
========================================

This is my dev environment setup, hugely simplified thanks to Docker. This is what it contains (and I use):

* Golang
* Vim as editor
* [Vundle Plugin manager for vim](https://github.com/gmarik/Vundle.vim)
* [fatih/vim-go](https://github.com/fatih/vim-go) (Golang support for vim)
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) (Code-completion for Vim)
* [nsf/gocode](https://github.com/nsf/gocode) (Autocompletion daemon for Golang)
* Few other vim plugins, all set via an included vimrc.
* A bashrc included in Amazon EC2 containers (which I don't use, I have my own secret bashrc, not part of this public release :-))

Others:

* AppEngine SDK for Golang, which I've been using for some projects.
* Python, iPython, pip (for tools)
* NodeJS, Bower, grunt-cli (for JS tools)
* Other tools deemed necessary to work in a dev environment (like cmake, curl, g++, git etc.)

Personal usage
===============
I've been using this setup since Dec'14. Only recently thought of releasing this to support more active golang development (c'mon, leave Python already!). I always had problem getting YouCompleteMe to work well in my dev environment with Golang, and with this setup, I fixed that problem once and for all.

Notes
======
Modify this Dockerfile to adjust to your usage pattern, preferences etc. If you think your contribution is of interest to general public, do send me a patch, and I'll definitely consider it.

Additions by pmoore
===================
I recommend creating an alias on your host system, something like:

```sh
alias godev='docker run --name=godev --rm=true -v ${GOPATH}/src:/go/src -t -i pmoore/godev:latest'
```

This will mount your go source directory inside the container, so you don't need checkouts of your go projects inside the container. This way you can edit with ease from inside the container, but if you kill the container, your changes still exist locally. It also means you can still push source code changes from your host operating system, without needing keys etc in the container, or needing to use ssh agent etc.
