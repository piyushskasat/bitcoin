#!/bin/bash

# Check lib directory exists
# otherwise create one
if [ ! -d ./work ]; then 
  vlib work
fi

# Compile files
vlog -work work ../src/sha-256-functions.v
vlog -work work ../src/sha256_transform.v
vlog -work work test_sha256_transform.v
