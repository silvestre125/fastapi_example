FROM python:3.10-slim-bullseye

# https://stackoverflow.com/questions/53835198/integrating-python-poetry-with-docker
ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_VERSION=1.4
# System deps:
# RUN apt-get update && apt-get install -y curl
RUN python -m pip install --upgrade pip
RUN pip install "poetry==$POETRY_VERSION"

# Copy only requirements to cache them in docker layer
WORKDIR /code
COPY . .

# Project initialization:
RUN poetry install --only main --no-interaction --no-ansi

# set cmd with target script to run
CMD poetry run uvicorn fastapi_example.main:app --host 0.0.0.0 --port 8080