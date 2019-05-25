C := "c0sco/devconsole"

devconsole:
	docker build -t ${C} .

push:
	docker push ${C}

run:
	@docker pull ${C}
	@./run.sh

.PHONY: devconsole push run
