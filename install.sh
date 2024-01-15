#!/bin/bash

# Create virtual environment
virtualenv env --python=python3.8

# Activate virtual environment
source env/Scripts/activate

# Install dependencies
pip install -r requirements.txt

# Rest of your installation script...

# Deactivate virtual environment (optional)
# deactivate
