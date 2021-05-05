# PHONY prevents issues with files/folders with the same names as makefile commands
.PHONY: build run debug

build:
	docker build . -t python3-project-template --no-cache

run: # Run simple yaml file read in user context (not root)
	docker run -u="$$(id -u):$$(id -g)"\
	--rm \
	-v ${HOME}/data/:/home/worker/data/ \
	-it python3-project-template \
	python3 src/read_yaml.py

debug: # Debug in user context (not root)
	docker run -u="$$(id -u):$$(id -g)" \
	--rm \
	-v ${HOME}/data/:/home/worker/data/ \
	-it python3-project-template \
	/bin/bash