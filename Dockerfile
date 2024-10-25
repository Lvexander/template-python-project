# Use the official Python image with Python 3.13
FROM python:3.13-slim


# Set the working directory inside the container
WORKDIR /app

# Get curl (and certificates) to download uv installer
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates

# Download the latest uv installer
ADD https://astral.sh/uv/install.sh /uv-installer.sh

# Run the uv installer then remove it
RUN sh /uv-installer.sh && rm /uv-installer.sh

# Ensure the installed binary is on the `PATH`
ENV PATH="/root/.cargo/bin/:$PATH"

# Copy the project into the image
ADD . /app

# Sync the project into a new environment, using the frozen lockfile
RUN uv sync --frozen

# Set CMD
CMD ["uv", "run", "lambda_function.handler"]