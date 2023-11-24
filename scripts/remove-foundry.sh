#!/bin/bash
set -e

current_dir=$(dirname "$(readlink -f "$0")")
base_path="$current_dir/.."

# Delete all foundry related files.
rm "$base_path/foundry.toml"
rm "$base_path/.gitmodules"
rm -rf "$base_path/cache"
rm -rf "$base_path/contracts"
rm -rf "$base_path/lib"
rm -rf "$base_path/out"
rm -rf "$base_path/test"

# Self-destruct script as no longer necessary
rm "$base_path/scripts/remove-foundry.sh"
