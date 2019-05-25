devconsole:
	docker build -t c0sco/devconsole .

push:
	docker push c0sco/devconsole

run:
	@./run.sh

.PHONY: devconsole push run
