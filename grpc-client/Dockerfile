FROM python:3.8

RUN pip3 install --upgrade pip && pip3 install poetry==1.6.*

WORKDIR /code

COPY ./pyproject.toml ./poetry.lock /code/

RUN poetry export -f requirements.txt --output requirements.txt --without-hashes

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./grpc_client /code/grpc_client

ENTRYPOINT python -m grpc_client
