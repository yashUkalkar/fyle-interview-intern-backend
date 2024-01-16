# Base image
FROM python:3.8

# Wroking directory in container
WORKDIR /fyle-backend-intern-flask-assignment

# Copying code to the working directory
COPY . .

# Installing dependencies
RUN pip install -r requirements.txt

# Default values for environment variables required by flask
ENV FLASK_ENV=production
ENV FLASK_DEBUG=0
ENV GUNICORN_PORT=5000

# Expose the port for the app to run on
EXPOSE 5000

# Run dos2unix to ensure Unix line endings
RUN apt-get update && apt-get install -y dos2unix \
    && dos2unix run.sh \
    && dos2unix test.sh \
    && chmod +x run.sh \
    && chmod +x test.sh

CMD ["./run.sh"]