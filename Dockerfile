FROM cgr.dev/chainguard/python:latest-dev as builder
ENV LANG=C.UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
WORKDIR /app
RUN python3 -m venv /app/venv
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r /app/requirements.txt

FROM cgr.dev/chainguard/python:latest
WORKDIR /app
ENV PATH="/venv/bin:$PATH"
COPY --from=builder /app/venv /venv
COPY /app /app/
ENTRYPOINT [ "python","-m", "flask", "run", "--host=0.0.0.0" ]

