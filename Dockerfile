# Use the official Python image with Python 3.11
FROM python:3.11

# Add a non-root user to run the application
RUN useradd -m -u 1000 user

# Set the working directory inside the container
WORKDIR /app

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Copy the pyproject.toml and poetry.lock files to the container
COPY ./pyproject.toml ./poetry.lock* /app/

# Install production dependencies using Poetry
RUN poetry config virtualenvs.create false \
    && poetry install --no-dev --no-interaction --no-ansi

# Switch to the non-root user
USER user

# Copy the rest of the application code
COPY --link --chown=1000 ./ /app

# Specify the command to run the application
CMD ["python", "app.py"]