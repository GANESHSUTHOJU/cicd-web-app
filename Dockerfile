FROM python:3.11-slim

WORKDIR /app

# Install dependencies safely
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app
COPY . .

# Create non-root user (security best practice)
RUN useradd -m appuser
USER appuser

EXPOSE 5000

CMD ["python", "app.py"]