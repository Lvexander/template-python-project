ifneq (,$(wildcard .env))
    include .env
    export
endif

IMAGE_NAME ?= image-name
IMAGE_TAG ?= latest


.PHONY: venv run test format remove-cache docker-build docker-run docker-clean


venv:
	uv sync
	source .venv/bin/activate


run:
	uv run app.py


test:
	uv run pytest


format:
	uv run ruff format


remove-cache:
	find . -type d \( -name "__pycache__" -o -name ".pytest_cache" -o -name ".ruff_cache" \) -exec rm -rf {} +


docker-build:
	docker build --tag $(IMAGE_NAME):$(IMAGE_TAG) .


docker-run: docker-build
	docker run --rm -it $(IMAGE_NAME):$(IMAGE_TAG)


docker-clean:
	docker rmi $(IMAGE_NAME):$(IMAGE_TAG) || true
