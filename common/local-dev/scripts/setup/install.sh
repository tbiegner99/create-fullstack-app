#! /bin/bash
touch ~/.bashrc
touch ~/.zshrc
sed -i 's/export {{ upper (snake name) }}_HOME=.*//g' ~/.bashrc
sed -i 's/export {{ upper (snake name) }}_HOME=.*//g' ~/.zshrc
sed -i 's/export GCP_KEY_PATH=.*//g' ~/.bashrc
sed -i 's/export GCP_KEY_PATH=.*//g' ~/.zshrc
echo "export {{ upper (snake name) }}_HOME=$(dirname $PWD)"
echo "export {{ upper (snake name) }}_HOME=$(dirname $PWD)" >> ~/.bashrc
echo "export {{ upper (snake name) }}_HOME=$(dirname $PWD)" >> ~/.zshrc
echo "export GCP_KEY_PATH=$(dirname $PWD)/local-dev/gcp-key/keyfile.json" >> ~/.bashrc
echo "export GCP_KEY_PATH=$(dirname $PWD)/local-dev/gcp-key/keyfile.json" >> ~/.zshrc
source ~/.bashrc
source ~/.zshrc

echo "Creating network"
EXISTING_NETWORK=$(docker network ls | grep {{kebab name}}-local-dev)

if [ -z "$EXISTING_NETWORK" ]; then
    docker network create -d bridge {{kebab name}}-local-dev
fi