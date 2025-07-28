NAME := mailcatcher
IMAGE := schickling/mailcatcher
PORT_SMTP := 1025
PORT_HTTP := 1080

.PHONY: start stop restart logs status

start:
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
