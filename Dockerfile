# syntax=docker/dockerfile:1

FROM python:3.11-slim-buster
WORKDIR /image_classifier
COPY . .
RUN pip3 install -r requirements.txt
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "2", "app:app"]