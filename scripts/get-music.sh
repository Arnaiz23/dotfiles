#!/bin/bash

if command -v playerctl &> /dev/null; then
	playerctl metadata --format "{{artist}} - {{title}}" 2>/dev/null || echo ""
else
	echo "playerctl not installed"
fi

