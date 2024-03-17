FROM cgr.dev/chainguard/python:latest-dev as builder
WORKDIR /app
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r /app/requirements.txt --user


FROM cgr.dev/chainguard/python:latest
WORKDIR /app
COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages
COPY /app /app/
ENTRYPOINT [ "python","-m", "flask", "run", "--host=0.0.0.0" ]
