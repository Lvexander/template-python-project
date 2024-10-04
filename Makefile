DOCKER_IMAGE_NAME=iamge-name

ifeq ($(OS),Windows_NT)
    OS_NAME := Windows_NT
else
    OS_NAME := $(shell uname -s)
endif


.PHONY: remove-venv build run clean


env:
	@echo "Dependencies installation on $(OS_NAME)"
	@poetry config virtualenvs.in-project true
ifeq ($(OS_NAME), Darwin)
	@poetry env use python3.11
	@poetry install --with dev
else ifeq ($(OS_NAME), Linux)
	@poetry env use python3.11
	@poetry install --with dev
else ifeq ($(OS_NAME), Windows_NT)
	@poetry env use python
	@poetry install --with dev
else
	@echo "Unknown system"
endif


app:
	@echo "Running on: $(OS_NAME)"
	@poetry run python app.py
	

build:
	docker build --tag $(DOCKER_IMAGE_NAME):latest .


run: build
	docker run --rm $(DOCKER_IMAGE_NAME):latest


clean:
	docker rmi $(DOCKER_IMAGE_NAME):latest || true