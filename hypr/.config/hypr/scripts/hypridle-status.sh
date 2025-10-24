#!/bin/bash

if systemctl --user is-active --quiet hypridle.service; then
    echo '{"text": "", "class": "active"}'
else
    echo '{"text": "", "class": "inactive"}'
    #better icon that doesnt work: 
fi
