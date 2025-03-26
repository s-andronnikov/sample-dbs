# Variables
DOCKER_COMPOSE = docker compose

# Commands
.PHONY: up down

# Command to bring up the Docker services
up:
	@$(DOCKER_COMPOSE) --env-file .env up --build --remove-orphans -d --wait
	@echo "Docker services are up and running."

# Command to bring down the Docker services
down:
	@$(DOCKER_COMPOSE) --env-file .env down
	@echo "Docker services have been stopped and removed."