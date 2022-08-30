FROM registry.access.redhat.com/ubi8/python-39

USER root
WORKDIR /code

COPY pyproject.toml /code/
RUN pip install --no-cache-dir --upgrade poetry && \
    poetry config --local virtualenvs.in-project true && \
    poetry install

COPY ./http_stub /code/app

USER 1000
CMD [".venv/bin/uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]

EXPOSE 8080
