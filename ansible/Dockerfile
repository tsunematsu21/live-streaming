FROM python:3.8.0-alpine3.10 AS install

# Install dependencies
RUN apk --update add --no-cache build-base libffi-dev openssl-dev

# Install packages with pip
COPY ./ansible/requirements.txt .
RUN pip install --user -r requirements.txt

FROM python:3.8.0-alpine3.10

COPY --from=install /root/.local /root/.local

ENV PATH=/root/.local/bin:$PATH

COPY ./docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]
