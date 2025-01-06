FROM python:3.12.8-slim


COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

EXPOSE 8080

# Run the application
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]