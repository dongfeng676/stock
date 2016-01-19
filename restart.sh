#!/bin/bash
serverpid=$(cat tmp/pids/server.pid)
kill -9 $serverpid
#rm -rf tmp/pids/*
