#!/usr/bin/env zsh

curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update

rm -rf ./aws
rm -rf ./awscliv2.zip

mkdir ~/.aws

touch ~/.aws/config
chmod 600 ~/.aws/config

touch ~/.aws/credentials
chmod 600 ~/.aws/credentials

cat <<EOF >~/.aws/config
[default]
region = ap-northeast-2
output = json
EOF

cat <<EOF >~/.aws/credentials
[dev]
aws_access_key_id = $AWS_ACCESS_KEY
aws_secret_access_key = $AWS_SECRET_KEY
EOF

echo "export AWS_PROFILE=dev" >>~/.zshrc
