FROM python:3.11

RUN useradd -m -u 1000 user

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt

RUN pip install --upgrade pip \
    pip install --no-cache-dir --upgrade -r /app/requirements.txt

USER user

COPY --link --chown=1000 ./ /app

CMD ["python", "app.py"]