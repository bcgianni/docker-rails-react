#!/bin/bash

# Clean pids
if [ -f ./tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# Initialize database
if [ ! -f ./tmp/db.sem ]; then
  bin/rake db:setup
  touch ./tmp/db.sem
fi

bin/rake db:migrate

# Follow run
exec "$@"
