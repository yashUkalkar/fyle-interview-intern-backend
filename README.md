# Fyle Backend Challenge

## Who is this for?

This challenge is meant for candidates who wish to intern at Fyle and work with our engineering team. You should be able to commit to at least 6 months of dedicated time for internship.

## Why work at Fyle?

Fyle is a fast-growing Expense Management SaaS product. We are ~40 strong engineering team at the moment.

We are an extremely transparent organization. Check out our [careers page](https://careers.fylehq.com) that will give you a glimpse of what it is like to work at Fyle. Also, check out our Glassdoor reviews [here](https://www.glassdoor.co.in/Reviews/Fyle-Reviews-E1723235.htm). You can read stories from our teammates [here](https://stories.fylehq.com).

## Challenge outline

This challenge involves writing a backend service for a classroom. The challenge is described in detail [here](./Application.md)

## What happens next?

You will hear back within 48 hours from us via email.

## Installation

1. Fork this repository to your github account
2. Clone the forked repository and proceed with steps mentioned below

### Install requirements

```
virtualenv env --python=python3.8
source env/bin/activate
pip install -r requirements.txt
```

### Reset DB

```
export FLASK_APP=core/server.py
rm core/store.sqlite3
flask db upgrade -d core/migrations/
```

### Start Server

```
bash run.sh
```

### Run Tests

```
pytest -vvv -s tests/

# for test coverage report
# pytest --cov
# open htmlcov/index.html
```

## My work

Following are my contributions/solution for the given assignment.

### Tasks given and completed

The tasks provided as a part of the assignment and duly completed by me are as follows -

- [x] Added missing APIs and passed the automated tests
- [x] Added test for grading API
- [x] Corrected existing code to pass required tests
- [x] Passed all tests
- [x] The test coverage is 95%
- [x] SQL tests in `tests/SQL` passed after writing required queries
- [x] Dockerized the application with _**docker compose**_

### Running the application with Docker

_[NOTE] Docker and Docker Compose must be installed on the machine before starting._

A [docker-compose.yml](./docker-compose.yml) file is provided which runs two containers -

1. starting the application server
2. running tests and generating the coverage report.

#### Starting the containers

Building the docker images and using them to start the containers is taken care of by _[docker-compose](./docker-compose.yml)_.

In the root folder for the project, run the following -

```
docker compose up
```

If you require the terminal session to be freed and the containers to run in the background, run the following instead -

```
docker compose -d up
```

#### Stopping the containers

In the root folder for the project, run the following -

```
docker compose down
```

### Running the application without Docker

_Activate the virtual environment and install required dependencies before going further as explained in [Installation Section](#install-requirements)_

Use the [run.sh](./run.sh) file to start application server manually.

```
export FLASK_ENV=development
bash run.sh
```

### Running the tests without Docker

_Activate the virtual environment and install required dependencies before going further as explained in [Installation Section](#install-requirements)_

Use the [test.sh](./test.sh) file to manually run tests.

```
bash test.sh
```

The coverage report will be generated in a folder _'htmlcov'_ at the root of the project. You can see the coverage results by opening the **'index.html'** file in your browser.\
Alternatively, run the following to see the test results in the terminal.

```
pytest -vvv -s tests/
```

## Conclusion

I would like to thank the team at Fyle for conducting the hiring process in such an interesting and productive way. I have definitely learned something new, i.e. **Flask** and **testing** in completing this task.

1. Throughout this challenge, I delved into the intricacies of Flask, a web framework that was new to me. The hands-on experience broadened my understanding of building robust APIs.

2. Testing, a crucial aspect of software development, took center stage in this project. Embracing and implementing testing has added a valuable layer to my skill set. I appreciate the emphasis on test-driven development, and the challenge provided an excellent platform to apply these principles.

3. Third would be Docker and Docker Compose. Although I had theoretical knowledge of both, the challenge provided me with the oportunity to use the teachnology and deepen my understanding of it.

I am genuinely excited about the prospect of contributing to Fyle's engineering team. The dynamic challenges presented in this task align seamlessly with my aspirations to work on impactful projects. Your feedback is invaluable to me, and I am eager to engage in any additional discussions that may arise.

Once again, thank you for this rewarding experience. I eagerly anticipate the opportunity to bring my passion, skills, and dedication to the Fyle team.

# **- Yash Ukalkar**
