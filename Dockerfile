FROM python:3.8-alpine3.15
ENV PYTHONUNBUFFERED 1

WORKDIR /src
COPY src/ .

RUN chmod +x ./*
# remove the unwanted dependencies to keep the docker container small
RUN apk add --update --no-cache postgresql-client jpeg-dev
RUN apk add --update --no-cache --virtual .tmp-build-deps \ 
    gcc libc-dev linux-headers postgresql-dev musl-dev zlib zlib-dev

RUN pip install -r requirements.txt
RUN pip install psycopg2-binary
RUN apk del .tmp-build-deps

RUN python manage.py collectstatic --no-input