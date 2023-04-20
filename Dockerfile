FROM python

WORKDIR /app

COPY . /app

RUN python -m venv /app/.venv
RUN pip install -r requirements/backend.in

COPY . .

EXPOSE 8080

CMD ["uvicorn", "spaceship.main:app" , "--host=0.0.0.0", "--port=8080"]
