#!/bin/bash

export DISPLAY=:0
xset s off 2>&1 | tee -a /var/log/xset/logfile.log
xset -dpms 2>&1 | tee -a /var/log/xset/logfile.log
