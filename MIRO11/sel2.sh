#!/bin/bash

wget https://data.airc.aist.go.jp/kanezaki.asako/data/MIRO.zip
unzip MIRO.zip

items=("bus" "car" "cleanser" "clock" "cup" "headphones" "mouse" "scissors" "shoe" "stapler" "sunglasses" "tape_cutter")


image_numbers=("003" "011" "019")

# Main source folder
main_folder=~/Downloads/MIRO


mkdir -p ~/MIRO11/selected2


for object in "${items[@]}"; do
    mkdir -p ~/MIRO11/selected2/"$object"
    
    
    for number in "${image_numbers[@]}"; do
        cp "$main_folder"/"$object"/"$object"_*_"$number.png" ~/MIRO11/selected2/"$object"/
    done
done

