#!/bin/bash


items=("bus" "car" "cleanser" "clock" "cup" "headphones" "mouse" "scissors" "shoe" "stapler" "sunglasses" "tape_cutter")


image_numbers=("001" "005" "009")

# Main source folder
main_folder=~/Downloads/MIRO


mkdir -p ~/MIRO11/selected1


for object in "${items[@]}"; do
    mkdir -p ~/MIRO11/selected1/"$object"
    
    
    for number in "${image_numbers[@]}"; do
        cp "$main_folder"/"$object"/"$object"_*_"$number.png" ~/MIRO11/selected1/"$object"/
    done
done

