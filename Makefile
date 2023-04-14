install-poetry:
	curl -sSL https://install.python-poetry.org | python3 -

install-docker:
	curl -fsSL get.docker.com | sh

init:
	poetry install

run:
	poetry run uvicorn fastapi_example.main:app --host 0.0.0.0 --port 8080
