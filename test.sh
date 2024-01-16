#!/bin/bash

# to stop on first error
set -e

export FLASK_APP=core/server.py

file="core/store.sqlite3"
if [ -f "$file" ] ; then
    rm "$file"
fi

# Ensure the file is deleted even if the tests fail
trap 'rm -f "$file"' EXIT

flask db upgrade -d core/migrations/

# Display data in tables before running tests
# echo "Checking data in tables:"
# tables=("users" "assignments" "teachers" "principals" "students")  # Replace with your actual table names

# for table in "${tables[@]}"; do
#     echo "Table: $table"
#     sqlite3 "$file" "SELECT * FROM $table;"
#     echo "----------------------------------------"
# done

# Display data in tables before running tests
# echo "Checking data in 'assignments' table before tests:"
# sqlite3 "$file" "SELECT * FROM assignments;"

# Check the state of the 'assignments' table after tests
# trap 'echo "Checking data in '\''assignments'\'' table after tests:"; sqlite3 "$file" "SELECT * FROM assignments;"' EXIT

# pytest -vvv -s tests/


# for test coverage report
pytest --cov
# open htmlcov/index.html