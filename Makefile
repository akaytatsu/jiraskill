.PHONY: help cc clean

# Carrega variáveis de ambiente se o arquivo .env existir
ifneq (,$(wildcard ./ .env))
include .env
export
endif

help: ## Show this help message
	@echo "Available targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

cc: ## Start Claude Code with environment variables
	@echo "Starting Claude Code with environment variables..."
	@if [ -f .env ]; then \
		export $$(cat .env | xargs) && claude; \
	else \
		echo "Warning: .env file not found. Using system environment only."; \
		claude; \
	fi

clean: ## Remove .env file (be careful!)
	@echo "Removing .env file..."
	@rm -f .env

setup: ## Create .env from .env.sample
	@if [ -f .env ]; then \
		echo ".env already exists. Backup created as .env.backup"; \
		cp .env .env.backup; \
	fi
	@cp .env.sample .env
	@echo ".env created from .env.sample"
	@echo "Please edit .env with your actual credentials."

check-env: ## Check if .env exists and is valid
	@if [ -f .env ]; then \
		echo ".env file exists."; \
		echo "Variables loaded:"; \
		grep -E '^[A-Z_]+=' .env | sed 's/=.*/=***/' | sed 's/^/  /'; \
	else \
		echo "Warning: .env file not found. Run 'make setup' to create it."; \
	fi
