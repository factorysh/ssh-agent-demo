image:
	docker build -t ssh-agent .

demo:
	ssh-keygen -t rsa -f demo -C "Docker demo" -q -N ""

run: .env
	docker run --rm --env-file .env ssh-agent

.env: demo
	./write_env.py

clean:
	rm -rf demo demo.pub .env
