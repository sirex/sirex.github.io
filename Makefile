export PATH := env/bin:$(PATH)

env/done: env/bin/pip requirements.txt
	env/bin/pip install -r requirements.txt
	touch env/done

env/bin/pip:
	python -m venv env

requirements.txt: env/bin/pip-compile requirements.in
	env/bin/pip-compile requirements.in -o requirements.txt

env/bin/pip-compile: env/bin/pip
	env/bin/pip install pip-tools

run: env/done
	env/bin/nikola auto


deploy: env/done
	env/bin/nikola github_deploy

.PHONY: run deploy
