DOCKER_IMAGE_NAME=iamge-name

ifeq ($(OS),Windows_NT)
    OS_NAME := Windows
else
    OS_NAME := $(shell uname -s)
endif


.PHONY: remove-venv build run clean


env:
	@echo "Dependencies installation"
	@poetry config virtualenvs.in-project true
	@poetry env use python3.11
	@poetry install --with dev


app:
	@echo "Running on: $(OS_NAME)"
	@poetry run python app.py
	

build:
	docker build --tag $(DOCKER_IMAGE_NAME):latest .


run: build
	docker run --rm $(DOCKER_IMAGE_NAME):latest


clean:
	docker rmi $(DOCKER_IMAGE_NAME):latest || true