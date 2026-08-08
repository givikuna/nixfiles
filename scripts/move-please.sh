#!/usr/bin/env bash

hyprctl dispatch 'hl.dsp.window.move({ workspace = 15 })'

hyprctl dispatch 'hl.dsp.window.move({ monitor = "HDMI-A-1" })'

hyprctl dispatch 'hl.dsp.window.move({ workspace = "r-1" })'
