NAME := mailcatcher
IMAGE := schickling/mailcatcher@sha256:55ed289525a565f7587b138a423705267eb34eda1ec8d35acd6dc7966a933e84
PORT_SMTP := 1025
PORT_HTTP := 1080

.DEFAULT_GOAL := help

.PHONY: help start stop restart logs status

help:
	@printf "Available targets:\n"
	@printf "  make start    Start MailCatcher on SMTP %s and HTTP %s\n" "$(PORT_SMTP)" "$(PORT_HTTP)"
	@printf "  make stop     Stop the MailCatcher container\n"
	@printf "  make restart  Recreate the MailCatcher container\n"
	@printf "  make status   Show container status\n"
	@printf "  make logs     Tail container logs\n"

start:
	docker rm -f $(NAME) >/dev/null 2>&1 || true
	docker run -d --rm --name $(NAME) \
		-p $(PORT_SMTP):1025 \
		-p $(PORT_HTTP):1080 \
		$(IMAGE)

stop:
	docker stop $(NAME) || true

restart: stop start

logs:
	docker logs -f $(NAME)

status:
	docker ps -f name=$(NAME)
