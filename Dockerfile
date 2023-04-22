FROM python AS builder

WORKDIR /app

COPY requirements /app/requirements
RUN python -m venv /app/.venv
RUN pip install -r requirements/backend.in

FROM python
COPY --from=builder /app/.venv /app/.venv
COPY build build
COPY spaceship spaceship

EXPOSE 8080

CMD ["uvicorn", "spaceship.main:app" , "--host=0.0.0.0", "--port=8080"]
