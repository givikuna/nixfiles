#!/usr/bin/env bash

repomix --output /tmp/repomix.xml && cat /tmp/repomix.xml | wl-copy && rm /tmp/repomix.xml
