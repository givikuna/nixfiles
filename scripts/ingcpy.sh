#!/usr/bin/env bash

repomix --output ./repomix.xml && cat ./repomix.xml | wl-copy && rm ./repomix.xml
