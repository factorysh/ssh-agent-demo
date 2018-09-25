#!/bin/sh

echo "Hello"

echo $PRIVATE | sed -e "s/\\n/\n/g" > /run/private

exec "$@"
