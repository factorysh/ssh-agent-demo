#!/bin/sh

echo "Hello"

echo $PRIVATE | sed -e "s/\\n/\n/g" > /run/private
chmod 400 /run/private
rm -f /secret/ssh-agent.sock
ssh-agent -a /secret/ssh-agent.sock -D &
chmod 700 /secret/ssh-agent.sock

expect << EOF
  spawn ssh-add /run/private
  expect "Enter passphrase"
  send "\r"
  expect eof
EOF

ssh-add -l

if [ "$1" = 'agent' ]; then
  wait $SSH_AGENT_PID
else
  exec "$@"
fi
