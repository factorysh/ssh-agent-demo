# ssh-agent docker demo

One service for the agent, clients use the agent.

## Big picture

One agent, with a volume `/secret`, with a secret key,
using environment variable named `PRIVATE`,
containing private ssh key converted on one long line, with `\n` as line separator.

Some clients, mounting volume `/secret`
and an environment variable `SSH_AUTH_SOCK=/secret/ssh-agent.sock`

## Test it

Build the image

    make image

Build the ssh keys and the .env

    make .env

Launch the demo

    docker-compose up

## Licence

3 terms BSD licence, ©2018 Mathieu Lecarme