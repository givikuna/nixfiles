#!/usr/bin/env nu

# because some aspects of the system were configured imperatively it is needed to use a post-install script to replicate those aspects of the system

# this mostly relates to racket
# because I am a lazy bum
# and do not feel like setting up everything declaratively sometimes
# and im not doing all that distrobox bullshit again

raco pkg install --auto racket-langserver
raco pkg install --auto --user rhombus-main

raco pkg install --auto threading

let current_host = (sys host).hostname
if $current_host == "minotaur" {
    sudo waydroid init
}
