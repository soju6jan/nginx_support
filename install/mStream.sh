#!/bin/sh
cd /app/data/nginx/nodejs
git clone https://github.com/IrosTheBeggar/mStream.git
cd mStream
git checkout relative-urls
npm install
npm link
