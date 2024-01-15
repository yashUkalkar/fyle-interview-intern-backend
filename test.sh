#!/bin/bash

# to stop on first error
set -e

export FLASK_APP=core/server.py

file="core/store.sqlite3"
if [ -f "$file" ] ; then
    rm "$file"
fi

<<<<<<< HEAD
# Ensure the file is deleted even if the tests fail
trap 'rm -f "$file"' EXIT

=======
>>>>>>> 92cadc75e5be81917a46a4648c6f69b1ca51a01e
flask db upgrade -d core/migrations/

pytest -vvv -s tests/

# for test coverage report
# pytest --cov
# open htmlcov/index.html