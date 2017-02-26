#!/bin/bash

WALLPAPERS_DIR='/home/qlio/.wallpapers'

mkdir -p $WALLPAPERS_DIR;

feh --recursive --randomize --bg-fill $WALLPAPERS_DIR;

categories[0]="buildings"
categories[1]="food"
categories[2]="nature"
categories[3]="people"
categories[4]="technology"
categories[5]="objects"

rand=$[ $RANDOM % 5 ]

curl -L "https://source.unsplash.com/category/${categories[$rand]}/1366x768" > $WALLPAPERS_DIR/$(date "+%s")".jpeg";

ls -1tr $WALLPAPERS_DIR | head -n 1 | xargs -I {} rm $WALLPAPERS_DIR/{}
