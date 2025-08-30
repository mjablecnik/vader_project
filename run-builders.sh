#!/bin/bash
trap "kill 0" EXIT

task -t project_app/taskfile.yaml build-runner-watch &
task -t project_design/taskfile.yaml build-runner-watch &
task -t project_design/taskfile.yaml build-design &

wait
