#!/usr/bin/env/bash

# because some aspects of the system were configured imperatively it is needed to use a post-install script to replicate those aspects of the system

# this mostly relates to racket
# because I am a lazy bum
# and do not feel like setting up everything declaratively sometimes
# and im not doing all that distrobox bullshit again

raco pkg install --user rhombus-main
