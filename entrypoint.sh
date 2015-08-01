#!/bin/bash

set -e

if [ "$1" = 'convert' ]; then
    cd /home

    # Copy file so we don't modify the existing with any command.
    cp /data/temp.pdf /home/temp.pdf
    chown root:root /home/temp.pdf
    chmod 664 /home/temp.pdf

    # Split pdf into file per page.
    pdftk /home/temp.pdf burst
    echo "Done bursting"
    # Get rid of original that we copied so we don't convert that too.
    rm /home/temp.pdf

    # Convert each pdf to svg
    for f in *.pdf; do 
        echo "asdfasdf"
        pdftocairo -svg $f
    done
    echo "done"

    mv *.svg /output

    exit
fi 

exec "$@"
