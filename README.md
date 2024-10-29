# OpenVPN3

An OpenVPN client. 

## File Structure

- `Dockerfile` - Defines the Docker image for running the OpenVPN client.
- `start_openvpn3.sh` - Script to start the OpenVPN client within the Docker container using a specified `.ovpn` configuration file.

## Getting Started

The `start_openvpn3.sh` script is used to run the OpenVPN client in a Docker container. It requires the path to a `.ovpn` file as an argument.


```bash
./start_openvpn3.sh path/to/your/config.ovpn
```
