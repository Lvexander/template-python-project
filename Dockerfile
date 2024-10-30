# Use the official Python image with Python 3.13
FROM python:3.13-slim

# Run the uv installer
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Copy the project into the image
ADD . /app

# Sync the project into a new environment, using the frozen lockfile
WORKDIR /app
RUN uv sync --frozen --no-cache

# Set CMD
CMD ["uv", "run", "app"]