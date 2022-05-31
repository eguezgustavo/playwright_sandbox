.PHONY: build
build:
	docker compose -f docker-compose.yml -f docker-compose.mount.yml up

.PHONY: shell
shell:
	docker compose -f docker-compose.yml -f docker-compose.mount.yml exec sandbox zsh
