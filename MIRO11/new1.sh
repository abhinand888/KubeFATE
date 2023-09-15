#!/bin/bash

# List of items in your dataset
items=("bus" "car" "cleanser" "clock" "cup" "headphones" "mouse" "scissors" "shoe" "stapler" "sunglasses" "tape_cutter")

# Define the image numbers you want to copy
image_numbers=("001" "005" "013")

# Main source folder
main_folder=~/Downloads/MIRO

# Create the 'selected1' directory if it doesn't exist
mkdir -p ~/MIRO11/selected1

# Loop through each item
for object in "${items[@]}"; do
    mkdir -p ~/MIRO11/selected1/"$object"
    
    # Copy specific images for the current item
    for number in "${image_numbers[@]}"; do
        cp "$main_folder"/"$object"/"$object"_*_"$number".png ~/MIRO11/selected1/"$object"/
    done
done



#!/bin/bash

# List of items in your dataset
items=("bus" "car" "cleanser" "clock" "cup" "headphones" "mouse" "scissors" "shoe" "stapler" "sunglasses" "tape_cutter")

# Define the image numbers you want to copy
image_numbers=("001" "005" "009")

# Main source folder
main_folder=~/Downloads/MIRO

# Create the 'selected1' directory if it doesn't exist
mkdir -p ~/MIRO11/selected1

# Loop through each item
for object in "${items[@]}"; do
    mkdir -p ~/MIRO11/selected1/"$object"
    
    # Copy specific images for the current item
    for number in "${image_numbers[@]}"; do
        cp "$main_folder"/"$object"/"$object"_*_"$number.png" ~/MIRO11/selected1/"$object"/
    done
done

