DOCKER_IMAGE_NAME=iamge-name

.PHONY: venv app build run clean


venv:
	uv sync
	source .venv/bin/activate


app:
	uv run app.py
	

build:
	docker build --tag $(DOCKER_IMAGE_NAME):latest .


run: build
	docker run --rm $(DOCKER_IMAGE_NAME):latest


clean:
	docker rmi $(DOCKER_IMAGE_NAME):latest || true