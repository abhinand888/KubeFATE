#!/bin/bash

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <item1> <item2> ..."
    exit 1
fi

# Create a folder for results
results_folder="results"
mkdir -p "$results_folder"

# Function to run a script and record the time taken
run_script() {
    script_name="$1"
    items="$2"
    output_file="$results_folder/${items}_$script_name.txt"

    echo "Starting $script_name with $items items"
    (time ./$script_name "$items") 2> "$output_file"
    echo "Completed $script_name with $items items. Results saved in $output_file"
}

# Loop through the input arguments and run the scripts with each value
for items in "$@"; do
    run_script "host.sh" "$items"
    run_script "guest.sh" "$items"
done

