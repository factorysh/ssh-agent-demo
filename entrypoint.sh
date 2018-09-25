#!/bin/sh

echo "Hello"

echo $PRIVATE | sed -e "s/\\n/\n/g" > /run/private
chmod 400 /run/private
ssh-agent -a /secret/ssh-agent.sock

export SSH_AUTH_SOCK=/secret/ssh-agent.sock
expect << EOF
  spawn ssh-add /run/private
  expect "Enter passphrase"
  send "\r"
  expect eof
EOF

ssh-add -l

exec "$@"
