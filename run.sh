#!/bin/bash

# to stop on first error
set -e

# Delete older .pyc files
# find . -type d \( -name env -o -name venv  \) -prune -false -o -name "*.pyc" -exec rm -rf {} \;

# Run required migrations
export FLASK_APP=core/server.py

# flask db init -d core/migrations/
# flask db migrate -m "Initial migration." -d core/migrations/
# flask db upgrade -d core/migrations/

# Run server
# gunicorn -c gunicorn_config.py core.server:app

# RUN for windows
# export FLASK_ENV=development
# export FLASK_DEBUG=1
# flask run

# Run script for Docker
export FLASK_ENV=${FLASK_ENV:-production}
export FLASK_DEBUG=${FLASK_DEBUG:-0}

# Check FLASK_ENV to determine whether to run in debug or development mode
if [ "$FLASK_ENV" == "development" ]; then
    flask run --host=0.0.0.0 --port=5000
else
    gunicorn -c gunicorn_config.py core.server:app
fi