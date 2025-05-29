#!/bin/bash

if systemctl --user is-active --quiet hypridle.service; then
    echo '{"text": "󰈈", "class": "active"}'  # Eye icon
else
    echo '{"text": "󰈉", "class": "inactive"}'  # Eye with slash
fi
