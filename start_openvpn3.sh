#!/usr/bin/env bash
# Check if a file path is provided as an argument
if [ -z "$1" ]; then
    echo "No .ovpn file path provided."
    exit 1
fi

# Define the path to the .ovpn file
ovpn_file=$(realpath "$1")  # Convert to absolute path

# Check if the provided .ovpn file exists
if [ ! -f "$ovpn_file" ]; then
    echo "The specified .ovpn file does not exist: $ovpn_file"
    exit 1
fi

# Extract the filename from the path to use in the container
filename=$(basename "$ovpn_file")

# Run the Docker container with the specified .ovpn file mounted and configured
docker run --name openvpn3 \
    -v "$ovpn_file:/O3/core/build/clients/$filename" \
    --privileged --rm --network=host \
    --cap-add=NET_ADMIN --device /dev/net/tun \
    phatli/openvpn3:1.0 test/ovpncli/ovpncli "/O3/core/build/clients/$filename" route-nopull
