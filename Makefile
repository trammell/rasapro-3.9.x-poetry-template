.PHONY: help clean install lint train test run

help:
	@echo "usage:"
	@echo "    make clean"
	@echo "    make install"
	@echo "    make lint"
	@echo "    make train"
	@echo "    make test"
	@echo "    make run"

clean:
	rm -rf results/

install:
	pip install --upgrade pip
	uv pip install -r requirements.txt

lint: domain/ data/
	rasa data validate

train: domain.yml data/
	rasa train --domain domain --debug

test: domain.yml data/
	rasa test

act:
	rasa run actions --auto-reload --debug

run: domain.yml models/
	rasa shell --debug

inspect: domain.yml models/
	rasa inspect --debug
