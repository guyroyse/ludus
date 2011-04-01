#!/bin/sh

echo Starting server
ant run &

echo Waiting 60 seconds for server to start...
sleep 60
echo Done!

echo Running RSepc
jruby -J-classpath war/WEB-INF/classes:war/WEB-INF/lib/appengine-api-1.0-sdk-1.4.0.jar -S rspec --tty --color --format d spec/ruby/*

echo Running Jasmine
node spec.js

echo Running Cucumber
jruby -S cucumber features

echo Killing server
for child in $(ps -o pgrp --ppid $! | tail -n +2) 
do
  kill -9 -$child
done

echo Done!
