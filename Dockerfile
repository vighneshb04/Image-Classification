# syntax=docker/dockerfile:1

FROM python:3.13-slim
RUN groupadd -r appuser && useradd -g appuser appuser
WORKDIR /image_classifier
COPY . .
RUN chown -R appuser:appuser /image_classifier
RUN pip3 install -r requirements.txt
USER appuser
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "2", "app:app"]