#!/bin/bash

cd /sparta-test-app/app

export DB_HOST=mongodb://10.0.3.5:27017/posts

sudo -E npm install

npm start