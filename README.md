# ssh-add docker demo

One service for the agent, client use the agent.

## Test it

Build the image

    make image

Build the ssh keys and the .env

    make .env

Launch the demo

    docker-compose up