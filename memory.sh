#!/bin/bash -xe
memory_info=$(free -m | grep Mem)
used_memory=$(echo "$memory_info" | awk '{print $3}')
echo "Used Memory: $used_memory KB"


# Example memory value as a string
memory_value=$used_memory

# Extract the numeric part of the string using awk
memory_numeric=$(echo "$memory_value" | awk '{print $NF}')

# Convert the numeric part to an integer
memory_integer=$((memory_numeric))

# Define a comparison threshold
comparison_threshold=201

# Compare the memory value with the threshold
if [ "$memory_integer" -gt "$comparison_threshold" ]; then
    echo "Used memory is greater than $comparison_threshold KB."
elif [ "$memory_integer" -lt "$comparison_threshold" ]; then
    echo "Used memory is less than $comparison_threshold KB."
else
    echo "Used memory is equal to $comparison_threshold KB."
fi

