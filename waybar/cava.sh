#!/bin/bash

while true; do
    read -r line < /tmp/cava.fifo

    bars=""
    for i in $line; do
        case $i in
            0) bars+=" " ;;
            1) bars+="▁" ;;
            2) bars+="▂" ;;
            3) bars+="▃" ;;
            4) bars+="▄" ;;
            5) bars+="▅" ;;
            6) bars+="▆" ;;
            7) bars+="▇" ;;
        esac
    done

    echo "$bars"
done