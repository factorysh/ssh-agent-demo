image:
	docker build -t ssh-agent .

demo:
	ssh-keygen -t rsa -f demo -C "Docker demo" -N muhahahahah

run:
	docker run -ti --rm --env-file .env ssh-agent bash

.env:
	./write_env.rb
