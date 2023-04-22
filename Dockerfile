FROM python AS builder

COPY requirements requirements
RUN python -m venv /.venv
ENV PATH="/.venv/bin:$PATH"
RUN pip install -r requirements/backend.in

FROM python
COPY --from=builder /.venv /.venv
ENV PATH="/.venv/bin:$PATH"
COPY build build
COPY spaceship spaceship

EXPOSE 8080

CMD ["uvicorn", "spaceship.main:app" , "--host=0.0.0.0", "--port=8080"]
